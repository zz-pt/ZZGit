
set( SRC
	src/MainWindow.hxx
	src/MainWindow.cpp
	src/UDE.cpp
)

set( QRC
	src/UDE.qrc
)

set( MOC
	src/MainWindow.hxx
	src/MainWindow.cpp
)

QT5_ADD_RESOURCES( QRCs ${QRC} )
QT5_WRAP_CPP( MOCs ${MOC} )

add_executable( UDE ${SRC} ${QRCs} )
#add_executable( UDE WIN32 ${SRC} ${QRCs} )
#set_target_properties( UDE PROPERTIES WIN32_EXECUTABLE true) #does not work to get rid of console shadow.
#set_target_properties(UDE PROPERTIES LINK_FLAGS "/SUBSYSTEM:WINDOWS" ) #same problem as WIN32_EXECUTABLE

qt5_use_modules( UDE Core Widgets)


