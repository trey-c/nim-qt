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

import ../core/qobject
import "../private/gui/guiapplication"

export QGuiApplication

export 
  construct,
  process_events

template init*(T: type QGuiApplication): ptr QGuiApplication = 
  var i = 0.cint
  T.construct(i, cast[cstringArray]('0'), 0.cint)

proc process_events*(self: ptr QGuiApplication) =
  QGuiApplication.process_events()

include "../private/core/resource"

type
  QResource * = object

proc register_resource*(self: type QResource, file_name: string) =
  var name = file_name.cstring
  cpp_register_resource(name)

when defined(testing) and is_main_module:
  import unittest
  
  proc main() =
    suite "QGuiApplication":
      var app: ptr QGuiApplication
      
      test "init":
        app = QGuiApplication.init()

      test "process_events":
        app.process_events()
  main()
