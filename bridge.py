from PySide6.QtCore import QObject,Slot
from os import system


class Bridge(QObject):
    @Slot(str)
    def run_command (self, command):
        system(command)
