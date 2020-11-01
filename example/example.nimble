version = "0.1.0"
author = "Trey Cutter"
description = "Example"
license = "LGPL-2.1"
backend = "cpp"
bin = @["example"]

before build:
  exec ("rcc-qt5 --binary example.qrc -o main.rcc")


