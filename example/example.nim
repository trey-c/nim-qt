import ../qt/core/qobject
import ../qt/gui/qguiapplication
import ../qt/qml/qqmlapplicationengine
import ../qt/quickcontrols2/qquickstyle
import ../qt/core/qstring
import ../qt/simplemodel

type
  Something * = object
    name*: string
    age*: int

simple_model "SomethingModel", Something

proc main() =
  echo "Hello, World!"

  var app = QGuiApplication.init()
  QResource.register_resource("example.rcc")
  echo "Before load"
  var engine = QQmlApplicationEngine.init()
  engine.load(QString.init("example.qml"))
  echo "After load"
  var style = QQuickStyle.init()
  style.set_style(QString.init("Material"))

  while true:
    app.process_events()

when isMainModule:
  main()
  GC_fullcollect()
