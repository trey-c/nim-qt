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

include "core"

import metaobject, bytearray, list

# Private Qt API, and may cause future problems
const qmetaobjectbuilder = "QtCore/5.15.1/QtCore/private/qmetaobjectbuilder_p.h"

discard "forward decl of MetaPropertyBuilder"
discard "forward decl of MetaMethodBuilder"
discard "forward decl of MetaObjectBuilder"


type
  QMetaMethodBuilder * {.header: qmetaobjectbuilder,
                      importcpp: "QMetaMethodBuilder".} = object

proc construct*(T: type QMetaMethodBuilder): QMetaMethodBuilder {.
    importcpp: "QMetaObjectBuilder(@)", constructor.}


proc index*(
  self: QMetaMethodBuilder): cint {.
    no_side_effect,
    importcpp: "index".}

proc signature*(
  self: QMetaMethodBuilder): QByteArray {.
    no_side_effect,
    importcpp: "signature".}

proc return_type*(
  self: QMetaMethodBuilder): QByteArray {.
    no_side_effect,
    importcpp: "returnType".}

proc set_return_type*(
  self: QMetaMethodBuilder;
    value: QByteArray) {.
    importcpp: "setReturnType".}

proc parameter_types*(self: QMetaMethodBuilder): QList[QByteArray] {.no_side_effect,importcpp: "parameterTypes".}

proc parameter_names*(self: QMetaMethodBuilder): QList[QByteArray] {.no_side_effect,importcpp: "parameterNames".}

proc set_parameter_names*(self: QMetaMethodBuilder; value: QList[QByteArray]) {.importcpp: "setParameterNames".}

proc tag*(
  self: QMetaMethodBuilder): QByteArray {.
    no_side_effect,
    importcpp: "tag".}

proc set_tag*(
  self: QMetaMethodBuilder;
    value: QByteArray) {.
    importcpp: "setTag".}

#proc access*(self: QMetaMethodBuilder): Access {.noSideEffect, importcpp: "access".}

#proc setAccess*(self: QMetaMethodBuilder; value: Access) {.importcpp: "setAccess".}

proc attributes*(
  self: QMetaMethodBuilder): cint {.
    no_side_effect,
    importcpp: "attributes".}

proc set_attributes*(
  self: QMetaMethodBuilder;
    value: cint) {.
    importcpp: "setAttributes".}

proc revision*(
  self: QMetaMethodBuilder): cint {.
    no_side_effect,
    importcpp: "revision".}

proc set_revision*(
  self: QMetaMethodBuilder;
    revision: cint) {.
    importcpp: "setRevision".}

type
  MetaPropertyBuilder * {.header: qmetaobjectbuilder,
                      importcpp: "QMetaPropertyBuilder".} = object

proc init_qmeta_property_builder*(): MetaPropertyBuilder {.
    importcpp: "QMetaPropertyBuilder()".}

proc index*(
  self: var MetaPropertyBuilder): cint {.
    no_side_effect,
    importcpp: "index".}

proc name*(
  self: var MetaPropertyBuilder): QByteArray {.
    no_side_effect,
    importcpp: "name".}

proc `type`*(self: var MetaPropertyBuilder): QByteArray {.
    no_side_effect,
        importcpp: "type".}

proc has_notify_signal*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "hasNotifySignal".}

proc notify_signal*(self: var MetaPropertyBuilder): QMetaMethodBuilder {.
    no_side_effect,
        importcpp: "notifySignal".}

proc set_notify_signal*(self: var MetaPropertyBuilder;
    value: QMetaMethodBuilder) {.
        importcpp: "setNotifySignal".}

proc remove_notify_signal*(self: var MetaPropertyBuilder) {.
    importcpp: "removeNotifySignal".}

proc is_readable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isReadable".}

proc is_writable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isWritable".}

proc is_resettable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isResettable".}

proc is_designable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isDesignable".}

proc is_scriptable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isScriptable".}

proc is_stored*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isStored".}

proc is_editable*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isEditable".}

proc is_user*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
    importcpp: "isUser",
        header: "qmetaobjectbuilder_p.h".}

proc has_std_set*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "hasStdCppSet".}

proc is_enum_or_flag*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isEnumOrFlag".}

proc is_constant*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
        importcpp: "isConstant".}

proc is_final*(self: var MetaPropertyBuilder): bool {.
    no_side_effect,
    importcpp: "isFinal",
        header: "qmetaobjectbuilder_p.h".}

proc set_readable*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setReadable".}

proc set_writable*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setWritable".}

proc set_resettable*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setResettable".}

proc set_designable*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setDesignable".}

proc set_scriptable*(self: var MetaPropertyBuilder;
    value: bool) {.
    importcpp: "setScriptable".}

proc set_stored*(self: var MetaPropertyBuilder;
    value: bool) {.
    importcpp: "setStored",
        header: "qmetaobjectbuilder_p.h".}

proc set_editable*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setEditable".}

proc set_user*(
  self: var MetaPropertyBuilder;
    value: bool) {.
    importcpp: "setUser".}

proc set_std_set*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setStdCppSet".}

proc set_enum_or_flag*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setEnumOrFlag".}

proc set_constant*(self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setConstant".}

proc set_final*(
  self: var MetaPropertyBuilder;
    value: bool) {.
        importcpp: "setFinal".}

proc revision*(self: var MetaPropertyBuilder): cint {.
    no_side_effect,
        importcpp: "revision".}

proc set_revision*(self: var MetaPropertyBuilder;
    revision: cint) {.
        importcpp: "setRevision".}

type
  QMetaObjectBuilder * {.header: qmetaobjectbuilder,
                      importcpp: "QMetaObjectBuilder".} = object

proc construct*(T: type QMetaObjectBuilder): QMetaObjectBuilder {.
    importcpp: "QMetaObjectBuilder(@)", constructor.}

proc class_name*(
  self: QMetaObjectBuilder): QByteArray {.
    no_side_effect,
    importcpp: "className".}

proc set_class_name*(
  self: QMetaObjectBuilder;
    name: QByteArray) {.
    importcpp: "setClassName".}

proc super_class*(
  self: QMetaObjectBuilder): MetaObject {.
    no_side_effect,
    importcpp: "superClass".}

proc set_super_class*(
  self: QMetaObjectBuilder;
    meta: ptr MetaObject) {.
    importcpp: "setSuperClass".}

proc method_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "methodCount".}

proc constructor_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "constructorCount".}

proc property_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "propertyCount".}

proc enumerator_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "enumeratorCount".}

proc class_info_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "classInfoCount".}

proc related_meta_object_count*(
  self: QMetaObjectBuilder): cint {.
    no_side_effect,
    importcpp: "relatedMetaObjectCount".}

proc add_method*(
  self: QMetaObjectBuilder;
    signature: QByteArray): QMetaMethodBuilder {.
    importcpp: "addMethod".}

proc add_method*(
  self: QMetaObjectBuilder;
    signature: QByteArray;
    return_type: QByteArray): QMetaMethodBuilder {.
    importcpp: "addMethod".}

proc add_method*(
  self: QMetaObjectBuilder;
    prototype: MetaMethod): QMetaMethodBuilder {.
    importcpp: "addMethod".}

proc add_slot*(
  self: QMetaObjectBuilder;
    signature: QByteArray): QMetaMethodBuilder {.
    importcpp: "addSlot".}

proc add_signal*(
  self: QMetaObjectBuilder;
    signature: QByteArray): QMetaMethodBuilder {.
    importcpp: "addSignal".}

proc add_constructor*(
  self: QMetaObjectBuilder;
    signature: QByteArray): QMetaMethodBuilder {.
    importcpp: "addConstructor".}

#proc add_constructor*(self: QMetaObjectBuilder; prototype: MetaMethod): QMetaMethodBuilder {.importcpp: "addConstructor".}

proc add_property*(
  self: QMetaObjectBuilder;
    name: QByteArray;
    `type`: QByteArray;
    notifier_id: cint = -1): MetaPropertyBuilder {.
    importcpp: "addProperty".}

proc add_property*(self: QMetaObjectBuilder; prototype: MetaProperty): 
  MetaPropertyBuilder {.
  importcpp: "addProperty".}

#proc add_enumerator*(self: QMetaObjectBuilder;name: QByteArray): QMetaEnumBuilder {.importcpp: "addEnumerator".}

#proc add_enumerator*(self: QMetaObjectBuilder;prototype: QMetaEnum): QMetaEnumBuilder {.importcpp: "addEnumerator".}

proc add_class_info*(
  self: QMetaObjectBuilder;
    name: QByteArray;
    value: QByteArray): cint {.
    importcpp: "addClassInfo".}

proc add_related_meta_object*(
  self: QMetaObjectBuilder;
    meta: MetaObject): cint {.
    importcpp: "addRelatedMetaObject".}

proc add_meta_object*(
  self: QMetaObjectBuilder;prototype: MetaObject;
    members: AddMembers = AllMembers) {.
    importcpp: "addMetaObject".}

proc `method`*(
  self: QMetaObjectBuilder;
    index: cint): QMetaMethodBuilder {.
    no_side_effect,
    importcpp: "method".}

proc property*(
  self: QMetaObjectBuilder;
    index: cint): MetaPropertyBuilder {.
    no_side_effect,
    importcpp: "property".}

#proc enumerator*(self: QMetaObjectBuilder; index: cint): QMetaEnumBuilder {.noSideEffect, importcpp: "enumerator".}

proc related_meta_object*(
  self: QMetaObjectBuilder;
    index: cint): MetaObject {.
    no_side_effect,
    importcpp: "relatedMetaObject".}

proc class_info_name*(
  self: QMetaObjectBuilder;
    index: cint): QByteArray {.
    no_side_effect,
    importcpp: "classInfoName".}

proc class_info_value*(
  self: QMetaObjectBuilder;
    index: cint): QByteArray {.
    no_side_effect,
    importcpp: "classInfoValue".}

proc remove_method*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeMethod".}

proc remove_constructor*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeConstructor".}

proc remove_property*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeProperty".}

proc remove_enumerator*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeEnumerator".}

proc remove_class_info*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeClassInfo".}

proc remove_related_meta_object*(
  self: QMetaObjectBuilder;
    index: cint) {.
    importcpp: "removeRelatedMetaObject".}

proc index_of_method*(
  self: QMetaObjectBuilder;
    signature: QByteArray): cint {.
    importcpp: "indexOfMethod".}

proc index_of_signal*(
  self: QMetaObjectBuilder;
    signature: QByteArray): cint {.
    importcpp: "indexOfSignal".}

proc index_of_slot*(
  self: QMetaObjectBuilder;
    signature: QByteArray): cint {.
    importcpp: "indexOfSlot".}

proc index_of_constructor*(
  self: QMetaObjectBuilder;
    signature: QByteArray): cint {.
    importcpp: "indexOfConstructor".}

proc index_of_property*(
  self: QMetaObjectBuilder;
    name: QByteArray): cint {.
    importcpp: "indexOfProperty".}

proc index_of_enumerator*(
  self: QMetaObjectBuilder;
    name: QByteArray): cint {.
    importcpp: "indexOfEnumerator".}

proc index_of_class_info*(
  self: QMetaObjectBuilder;
    name: QByteArray): cint {.
    importcpp: "indexOfClassInfo".}

#proc staticMetacallFunction*(self: QMetaObjectBuilder): StaticMetacallFunction {.noSideEffect, importcpp: "staticMetacallFunction".}

#proc setStaticMetacallFunction*(self: QMetaObjectBuilder; value: StaticMetacallFunction) {.importcpp: "setStaticMetacallFunction".}

proc to_meta_object*(
  self: QMetaObjectBuilder): ptr MetaObject {.
    no_side_effect,
    importcpp: "toMetaObject".}

proc to_relocatable_data*(
  self: QMetaObjectBuilder;
    a2: bool = false): QByteArray {.
    no_side_effect,
    importcpp: "toRelocatableData".}

proc from_relocatable_data*(
  a1: MetaObject;
    a2: MetaObject;
    a3: QByteArray) {.
    importcpp: "QMetaObjectBuilder::fromRelocatableData(@)".}


























