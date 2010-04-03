TEMPLATE = lib
TARGET = QtOpenCLGL
QT += opengl
CONFIG += dll \
    warn_on
win32 { 
    DESTDIR = ../../bin
    !static:DEFINES += QT_MAKEDLL
}
else:DESTDIR = ../../lib

macx {
    LIBS += -framework OpenCL
} else {
    !isEmpty(QMAKE_INCDIR_OPENCL) {
        QMAKE_CXXFLAGS += -I$$QMAKE_INCDIR_OPENCL
    }
    !isEmpty(QMAKE_LIBDIR_OPENCL) {
        LIBS += -L$$QMAKE_LIBDIR_OPENCL
    }
    !isEmpty(QMAKE_LIBS_OPENCL) {
        LIBS += $$QMAKE_LIBS_OPENCL
    } else {
        LIBS += -lOpenCL
    }
}

no_cl_gl {
    DEFINES += QT_NO_CL_OPENGL
}

INCLUDEPATH += $$PWD/../opencl

HEADERS += \
    qclcontextgl.h \
    qcltexture2d.h

SOURCES += \
    qclcontextgl.cpp \
    qcltexture2d.cpp

PRIVATE_HEADERS += \
    qcl_gl_p.h \
    qcl_glproxy_p.h

HEADERS += $$PRIVATE_HEADERS
DEFINES += QT_BUILD_CLGL_LIB