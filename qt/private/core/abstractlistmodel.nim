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

import string
import variant
import hash

const qabstractlistmodel = "QtCore/qabstractitemmodel.h"
type  
  QModelIndex* {.importcpp: "QModelIndex", header: "QtCore/QModelIndex".} = object
  QAbstractListModel * {.header: qabstractlistmodel, importcpp: "QAbstractListModel", inheritable.} = object

type
  Roles * = enum
    user_role = 0x0100

proc construct*(T: type QModelIndex): QModelIndex {.
    importcpp: "QModelIndex()".}

proc row*(self: QModelIndex): cint {.importcpp: "row".}

proc data*(self: QModelIndex, role: cint): QVariant {.importcpp: "data".}

proc construct*(T: type QAbstractListModel): ptr QAbstractListModel {.
    importcpp: "new QAbstractListModel(@)".}

proc row_count*(self: ptr QAbstractListModel, index: QModelIndex): cint {.importcpp: "rowCount".}

proc data*(self: ptr QAbstractListModel, index: QModelIndex, role: cint): QVariant {.importcpp: "data".}

proc set_data*(self: ptr QAbstractListModel, index: QModelIndex, value: QVariant, role: cint): bool {.importcpp: "setData".}

proc role_names*(self: ptr QAbstractListModel, index: QModelIndex, value: QVariant, role: cint): QHash[cint, QByteArray] {.importcpp: "roleNames".}
