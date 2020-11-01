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

import macros
import core/qabstractlistmodel

macro simple_model*(name: string, t: typed): untyped =
  var
    model_name = ident(name.str_val & "Model")

  result = quote do:
    import 
      core/qabstractlistmodel,
      core/qbytearray,
      core/qstring,
      core/qvariant,
      core/qhash,
      strutils
   
    type
      `model_name`* = ref object of QAbstractListModel
        list*: seq[`t`]

    proc init*(T: type `model_name`): `model_name` =
      new(result)
      result.list = @[]

    proc row_count*(self: `model_name`, index: QModelIndex): int =
      return self.list.len

    proc data*(self: `model_name`, index: QModelIndex, role: int): QVariant =
      if index.row < 0 or index.row >= self.list.len:
        return
      var
        item = self.list[index.row]
        count = Roles.user_role.int + 1

      for name, value in fieldPairs(item):
        if count == role:
          echo "dsf"
          #return QVariant.init(value)
        count.inc

    proc add*[T](self: `model_name`, t: T) =
      #self.beginInsertRows(newQModelIndex(), self.list.len, self.list.len)
      self.list.add(t)
      #self.endInsertRows()

    proc clear*(self: `model_name`) =
      #self.beginRemoveRows(newQModelIndex(), 0, self.list.len)
      self.list.set_len(0)
      #self.endRemoveRows()

    proc roleNames(self: `model_name`): QHash[cint, QByteArray] =
      var role = Roles.user_role.int + 1
      var tmp: `t`
      result = QHash[cint, QByteArray].init()
      for name, value in fieldPairs(tmp):
        result[role.cint] = QByteArray.init($name)
        role.inc

when defined(testing) and is_main_module:
  import unittest
  
  type 
    TestObject = object
      name: string
      age: int
    
  simple_model("TestObject", TestObject)
  proc main() =
    suite "SimpleModel":
      var tobj: TestObjectModel
    
      test "init":
        tobj = TestObjectModel.init()
  main()
