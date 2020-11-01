version = "0.1.0"
author = "Trey Cutter"
description = "Example"
license = "Apache License 2.0"
backend = "cpp"
bin = @["example"]

before build:
  exec ("rcc-qt5 --binary example.qrc -o main.rcc")


