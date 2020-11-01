import system

proc cfind_qt_pc*(lib: string): string =
  case system.host_os:
  of "androids":
    var ext = "env PKG_CONFIG_PATH=/home/qt/work/install/lib/pkgconfig/"
    gorge(ext & " pkg-config --cflags " & lib & "_x86_64")
  else:
    gorge("pkg-config --cflags " & lib)

proc lfind_qt_pc*(lib: string): string =
  case system.host_os:
  of "androids":
    var ext = "env PKG_CONFIG_PATH=/home/qt/work/install/lib/pkgconfig/"
    gorge(ext & " pkg-config --libs" & lib & "_x86_64")
  else:
    gorge("pkg-config --libs " & lib)

