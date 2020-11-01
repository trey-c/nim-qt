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

import "../private/core/hash"

export QHash

proc init*[K, V](T: type QHash[K, V]): QHash[K, V] =
  var result: QHash[K, V]

export `[]=`

when defined(testing) and is_main_module:
  import unittest
  import qstring
  
  proc main() =
    suite "QHash":
      var hash: QHash[int, QString]
    
      test "init":
        hash = QHash[int, QString].init()

      test "[]=":
        hash[1] = QString.init("Hash 1")
        hash[2] = QString.init("Hash 2")
  main()
