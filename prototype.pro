QT += qml quick svg
QTPLUGIN += qsvg qsvgicon

CONFIG += c++11 qmltypes
QML_IMPORT_NAME = prototype
QML_IMPORT_MAJOR_VERSION = 1

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        src/glrenderer.cpp \
        src/guimodel.cpp \
        src/main.cpp

RESOURCES += qml/qml.qrc

INCLUDEPATH += src

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH = qml

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/glrenderer.h \
    src/guimodel.h \
