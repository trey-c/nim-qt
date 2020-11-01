# Copyright © 2020 Trey Cutter <treycutter@protonmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import "../private/core/object"
import "../private/core/metaobject"
import qbytearray, qstring, strutils, qlist

import qmetaobjectbuilder
import macros

export QObject

export
  delete_later,
  qt_metacall,
  meta_object,
  qobjectmetaobject

template static_meta_object*(T: type QObject): MetaObject =
  qobjectmetaobject

type
  Members = seq[tuple[name: string, typename: string]]

proc build_meta_method(name, retrn: string, params: seq[tuple[name, typename: string]]): NimNode =
  var 
    param_list = new_stmt_list()
    list = new_ident_node(name & "_list")
    builder = new_ident_node(name & "_builder") 
  for param in params:
    var
      name = param.name
      stmt = quote do:
          `list`.append(QByteArray.init(`name`))
    param_list.add(stmt)

  result = quote do:
    var `builder` = QMetaObjectBuilder.init()
    var `list`: QList[QByteArray]
    `param_list`

proc extract_method(prc: NimNode, name, retrn: var string, params: var seq[tuple[name, typename: string]]
): NimNode =
  if prc[0].kind == nnkPostfix:
    name = prc[0][1].str_val
  elif prc[0].kind == nnkIdent:
    name = prc[0].str_val

  retrn = "void"
  for node in prc[3]:
    if node.kind == nnkEmpty:
      continue
    
    if node.kind == nnkIdent:
      retrn = node.str_val
    elif node[0].kind == nnkIdent and node[2].kind == nnkEmpty:
      params.add((name: node[0].str_val, typename: node[0].str_val))
    elif node[0].kind == nnkIdent and node[2].kind == nnkIdent: 
      var i = 0
      var typename = node[node.len - 2].str_val
      for ident in node:
        i.inc
        if i == node.len - 1:
          break
        elif ident.kind == nnkEmpty:
          continue
        params.add((name: ident.str_val, typename: typename))

proc build_metaobj_def(name, base_name: string, params: NimNode): NimNode =
  var 
    metaobj = new_ident_node(name & "_meta_object")
    build_metaobj = new_ident_node("build_" & name & "_meta_object")
    name_ident = new_ident_node(name)
    base_ident = new_ident_node(base_name)
    
  result = quote do:
    proc `build_metaobj`(T: type `name_ident`): MetaObject =
      var builder = QMetaObjectBuilder.init()
      builder.set_class_name(QByteArray.init(`name`))
      builder.set_super_class(cast[ptr MetaObject](`base_ident`.static_meta_object()))
      `params`
      var res = builder.to_meta_object()
      result = res[]
    
    let `metaobj` = `name_ident`.`build_metaobj`()
    proc static_meta_object*(self: type `name_ident`): MetaObject =
      result = `metaobj`
    
    proc meta_object*(self: `name_ident`): ptr MetaObject =
      return cast[ptr MetaObject](`metaobj`)

proc register_qobject_by_call(call, methods, metamethods: NimNode, members: var Members) =
  case call[0].str_val:
    of "q_props":
      for node in call[1]:
        members.add((name: node[0].str_val, typename: node[1][0].str_val))
    of "q_signals":
      echo "sdf"
    of "q_slots":
      assert call[1].kind == nnkStmtList
      for prc in call[1]:
        var 
          slot_name = ""
          retrn = ""
          ps: seq[tuple[name, typename: string]]
        discard extract_method(prc, slot_name, retrn, ps)
        metamethods.add(build_meta_method(slot_name, retrn, ps))
        methods.add(prc)
    of "q_ignore":
      for node in call[1]:
        if node.kind == nnkProcDef:
          methods.add(node)
          continue
        elif node.kind != nnkCall:
          continue
        members.add((name: node[0].str_val, typename: node[1][0].str_val))
    else:
      echo "Unknown q_meta" 

proc declare_type(name, base_name: string, members: var Members): NimNode =
  var 
    bn = new_ident_node(base_name)
    n = new_ident_node(name)
    s = new_ident_node("self")
    recs = nnkRecList.new_tree()
  for member in members:
    recs.add(nnkIdentDefs.new_tree(
      nnkPostfix.new_tree(
        new_ident_node("*"),
        new_ident_node(member.name),
      ),
      new_ident_node(member.typename),
      new_empty_node()
    ))
  result = nnkTypeSection.new_tree(
    nnkTypeDef.new_tree(
      nnkPostfix.new_tree(
        new_ident_node("*"),
        n
      ),
      new_empty_node(),
      nnkRefTy.new_tree(
        nnkObjectTy.new_tree(
          new_empty_node(),
          nnkOfInherit.new_tree(
            bn,
          ),
          recs
        )
      )
    )
  )

macro declare_qobject*(name, base_name: string, body: untyped): untyped = 
  assert body.kind == nnkStmtList
  var 
    members: Members = @[]
    methods = new_stmt_list()
    metamethods = new_stmt_list()
  for b in body:
    assert b.kind == nnkCall
    assert b[0].kind == nnkIdent
    assert b[1].kind == nnkStmtList
    register_qobject_by_call(b, methods, metamethods, members)
  
  var 
    qtype = declare_type(name.str_val, base_name.str_val, members)
    build_metaobj = build_metaobj_def(name.str_val, base_name.str_val, metamethods)
    typename = new_ident_node(name.str_val)
  result = quote do:
    import qmetaobjectbuilder, qlist, qbytearray, qstring
    `qtype` 
    `methods`
    
    template init*(T: type `typename`): `typename` = 
      `typename`()
    
    `build_metaobj`
  
  echo result.repr

when defined(testing) and is_main_module:
  import unittest

  declare_qobject "TestObject", "QObject":
    q_props:
      name: string
    q_signals:
      proc name_changed(self: TestObject)
    q_slots:
      proc set_name*(self: TestObject, name, last: string, age: int) =
        self.name = name
      proc get_name*(self: TestObject, age2: int): string =
        result = self.name
    q_ignore:
      age: int
      proc apples*(self: TestObject) =
        self.age = 1

  proc main() =
    suite "QObject":
      var testobj = TestObject.init()

      test "meta_object":
        discard testobj.meta_object()
  main()

