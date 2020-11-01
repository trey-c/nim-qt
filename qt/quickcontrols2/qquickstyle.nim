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
import "../private/quickcontrols2/quickstyle"
import ../core/qstring
export QQuickStyle

proc init*(T: type QQuickStyle): QQuickStyle =
  result = QQuickStyle.construct()

export set_style

when defined(testing) and is_main_module:
  import unittest
  
  proc main() =
    suite "QQickStyle":
      var style: QQuickStyle
      
      test "init":
        style = QQuickStyle.init()

      test "set_stye":
        style.set_style(QString.init("Material"))
  main()
