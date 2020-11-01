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

include "qml"

import ../core/string
import "../core/object"

const qqmlapplicationengine = "QtQml/qqmlapplicationengine.h"

type
  QQmlApplicationEngine *
    {.
    header: qqmlapplicationengine,
      importcpp: "QQmlApplicationEngine".} = object of QObject

proc construct*(T: type QQmlApplicationEngine): QQmlApplicationEngine {.
    importcpp: "QQmlApplicationEngine(@)", constructor.}

proc load*(
  engine: QQmlApplicationEngine, str: QString) {.
    importcpp: "load".}
