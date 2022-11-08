import sys
from PySide2.QtWidgets import *
from PySide2.QtQuick import *
from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtQml import *
from WindowFramelessHelper.h import *

app = QApplication(sys.argv)

QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
QCoreApplication.setAttribute(Qt.AA_UseHighDpiPixmaps)
qmlRegisterType<WindowFramelessHelper>("QtShark.Window", 1, 0, "FramelessHelper");

app.setWindowIcon(QIcon("Icons/kudoscode.svg"))
app.setApplicationName("ORÇAMENTO")

engine = QQmlApplicationEngine("qml/main.qml")

sys.exit(app.exec_())

