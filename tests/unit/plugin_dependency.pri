COMPONENTS_PATH = ../../../modules/Ubuntu/Components
INCLUDEPATH += $$COMPONENTS_PATH/plugin

linux {
    PRE_TARGETDEPS = $$COMPONENTS_PATH/libUbuntuComponents.so
    LIBS += $$COMPONENTS_PATH/libUbuntuComponents.so
}
macx {
    PRE_TARGETDEPS = $$COMPONENTS_PATH/libUbuntuComponents.dylib
    LIBS += $$COMPONENTS_PATH/libUbuntuComponents.dylib
}

DEFINES += QUICK_TEST_SOURCE_DIR=\"\\\"$$_PRO_FILE_PWD_\\\"\"

