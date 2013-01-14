QDOC = $$[QT_INSTALL_BINS]/qdoc
system($$QDOC $$PWD/ubuntu-sdk.qdocconf)

install_docs.files = $$PWD/html
install_docs.path = $$PREFIX/share/qt-components-ubuntu/doc

INSTALLS += install_docs
