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

import system
import strutils

import ../utils

{.passc: "-fPIC " &
    cfind_qt_pc("Qt5Core").}
{.pass_l: lfind_qt_pc("Qt5Core").}
# Rules don't mean anything if you pretend so
proc include_private(): string =
  var grg = cfind_qt_pc("Qt5Core")
  var priv = grg.split(' ')

  if priv.len > 1:
    result = priv[1] & "/5.15.1"

{.passc: include_private().}
