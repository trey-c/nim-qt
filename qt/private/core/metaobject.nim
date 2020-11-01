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

# Private Qt API, and may cause future problems
const qmetaobject = "QtCore/QMetaObject"

type
  Access * {.header: qmetaobject,
                importcpp: "Access".} = enum  
           Private, Protected, Public

type
  Attributes * {.header: qmetaobject,
                importcpp: "Attributes".} = enum  
          Compatibility, Cloned, Scriptable

type
  MethodType * {.header: qmetaobject,
                importcpp: "MethodType".} = enum  
          Method, Signal, Slot, Constructor

type
  MetaMethod * {.importcpp: "MetaMethod", 
                 header: qmetaobject.} = object

type
  MetaProperty * {.importcpp: "MetaProperty", 
                 header: qmetaobject.} = object

type                   
  QMetaObjectCall* {.importcpp: "QMetaObject::Call", 
                 header: "QtCore/qobjectdefs.h".} = enum
      InvokeMetaMethod, ReadProperty, WriteProperty, ResetProperty,
      QueryPropertyDesignable, QueryPropertyScriptable, QueryPropertyStored,
      QueryPropertyEditable, QueryPropertyUser, CreateInstance, IndexOfMethod,
      RegisterPropertyMetaType, RegisterMethodArgumentMetaType

type
  AddMembers * {.importcpp: "AddMember", header: qmetaobject.} = enum
     ClassName, SuperClass, Methods, Signals, Slots,
     Constructors, Properties, Enumerators, ClassInfos, 
     RelatedMetaObjects, StaticMetacall, PublicMethods,
     ProtectedMethods, PrivateMethods, AllMembers, AllPrimaryMembers

type
  MetaObject * {.importcpp: "QMetaObject", header: qmetaobject, byRef, inheritable.} = object

type
  MetaObjectC * {.importcpp: "const QMetaObject *", header: qmetaobject, byRef, inheritable.} = object
