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

const qstring = "QtCore/QString"
const qbytearray* = "QtCore/QByteArray"

type
  QByteArray *
    {.
    header: qbytearray,
      importcpp: "QByteArray".} = object
  QString * {.importcpp: "QString", header: qstring.} = object

proc construct*(T: type QString, str: cstring = ""): QString {.importcpp: "QString(@)", constructor.}

proc to_utf8*(self: QString): QByteArray {.importcpp: "toUtf8".}
