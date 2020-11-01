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

import metaobjectbuilder
import metaobject

const qobject = "QtCore/QObject"

type
  QObject * {.header: qobject,
                      importcpp: "QObject", inheritable.} = object

proc delete_later*(self: QObject) {.
    importcpp: "deleteLater".}

proc qt_metacall*(self: QObject, call: QMetaObjectCall, index: cint, args: ptr pointer): cint {.importcpp: "qt_metacall".}

proc meta_object*(self: QObject): ptr MetaObject {.importcpp: "metaObject".}

let qobjectmetaobject* {.importcpp: "QObject::staticMetaObject", nodecl.}: MetaObject

  
