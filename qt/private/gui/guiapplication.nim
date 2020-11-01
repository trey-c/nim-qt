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

include "gui"

import "../core/object"

const qguiapplication = "QtGui/qguiapplication.h"

type
  QProcessEventsFlags* {.header: qguiapplication,
    importcpp: "QFlags<QEventLoop::ProcessEventsFlag>"} = enum
    all_events = 0x00
    exlude_user_input_events = 0x01
    exlude_socket_input_notifiers = 0x02
    wait_for_more_events = 0x04

type
  QGuiApplication *
    {.
    header: qguiapplication,
      importcpp: "QGuiApplication".} = object of QObject

proc construct*(T: type QGuiApplication, argc: var cint, argv: cstringArray, flags: int): ptr QGuiApplication {.
    constructor, importcpp: "new QGuiApplication(@)".}

proc process_events*(
  self: type QGuiApplication, flags: QProcessEventsFlags = all_events) {.
    importcpp: "QGuiApplication::processEvents(@)".}

proc process_events*(
  self: type QGuiApplication, flags: QProcessEventsFlags, ms: cint) {.
    importcpp: "#.processEvents(@)".}
