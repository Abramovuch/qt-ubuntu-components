include(common.pri)
include(documentation/documentation.pri)

CONDIG += ordered
TEMPLATE = subdirs
SUBDIRS += demos themes modules/qt-components-ubuntu.pro tests/unit examples

tests/unit.depends = modules/qt-components-ubuntu.pro

# additional 'make test' target required by continuous integration system
test.target = test
test.commands = make check
QMAKE_EXTRA_TARGETS += test

message("Makefile generated.")
message("Ubuntu component plugin will be installed to $$[QT_INSTALL_IMPORTS]")
message("You can set the following environnement variables while running make:")
message("    CC (defaults to: gcc) : to set the compiler used to build (must support C++11)")
message("    PREFIX (defaults to: BUILD) : to set the root where shared files will be installed");

