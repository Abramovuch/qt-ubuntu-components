contains(QT_VERSION, ^4.*) {
    error("Use at least Qt 5.x");
}

PREFIX = $$(PREFIX)
isEmpty(PREFIX) {
    PREFIX = $$PWD/BUILD
}

QMAKE_CXX = $$(CC)
isEmpty(QMAKE_CXX) {
    QMAKE_CXX = gcc
}

QMAKE_LINK = $$QMAKE_CXX
QMAKE_CXXFLAGS = -std=c++11 -DINSTALL_PREFIX=\\\"$$PREFIX\\\"
LIBS += -lstdc++

include( coverage.pri )
