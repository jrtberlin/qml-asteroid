TEMPLATE = lib
TARGET = asteroidstylesplugin
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QtQuick.Controls.Styles.Asteroid

SOURCES += \
    src/styles_plugin.cpp

HEADERS += \
    src/styles_plugin.h

OTHER_FILES = \
    qmldir

qmldir.files = qmldir

qmlfiles.path = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
qmlfiles.files += $$files(qml/*)

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir qmlfiles
}
