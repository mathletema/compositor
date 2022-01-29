import sys
from PySide6.QtCore import Qt
from PySide6.QtWidgets import QApplication, QLabel
from PySide6.QtQml import QQmlApplicationEngine

from bridge import Bridge

app = QApplication(sys.argv)
engine = QQmlApplicationEngine("main.qml")

br = Bridge()
context = engine.rootContext()
context.setContextProperty("py", br)

sys.exit(app.exec())