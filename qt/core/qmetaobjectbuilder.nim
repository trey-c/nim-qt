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

import ../private/core/metaobjectbuilder
import ../private/core/metaobject
import qbytearray, qstring

export QMetaObjectBuilder
export
  construct,
  set_class_name,
  set_super_class,
  to_meta_object

template init*(T: type QMetaObjectBuilder): QMetaObjectBuilder =
  T.construct()

export QMetaMethodBuilder
export
  construct,
  parameter_names,
  set_parameter_names

template init*(T: type QMetaMethodBuilder): QMetaMethodBuilder =
  T.construct()

when defined(testing) and is_main_module:
  import unittest
  
  proc main() =
    suite "QMetaObjectBuilder":
      var builder = QMetaObjectBuilder.init()
    
      test "set_class_name":
        builder.set_class_name(QByteArray.init("Test"))
      
      test "to_meta_object":
        discard builder.to_meta_object()
  main()
