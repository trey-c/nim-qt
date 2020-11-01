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

{.emit:"""
#include <QtCore/QResource>
#include <QtCore/QString>

void register_resource_wrapper(char* file_name)
{
QResource::registerResource(QString(file_name));
}
""".}

proc cpp_register_resource(file_name: cstring) {.importcpp: "register_resource_wrapper(@)".}
