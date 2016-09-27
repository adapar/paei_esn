QT += qml quick quickcontrols2 multimedia sql

CONFIG += c++11

DEFINES += QDJANGO_SHARED

unix {
    INCLUDEPATH += /usr/local/include
    LIBS += -L/usr/local/lib -lqdjango-db
}
win32 {
    LIBS += -LC:\\Qt\\v5\\5.7\\msvc2015_64\\lib -lqdjango-db0
}

SOURCES += main.cpp \
    abstract.cpp \
    expectation.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

HEADERS += \
    abstract.h \
    expectation.h
