cmake_minimum_required( VERSION 2.8.12 )

project( UDE )

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib )

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

if( WIN32 )
	# To resolve glu libs needed by opengl due to cmake error: Failed to find "glu32" in "" ... 
	set (CMAKE_LIBRARY_PATH "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/lib/x64")
	# To resolve find_package(Qt5...)
	set (CMAKE_PREFIX_PATH "C:/Qt/Qt5.2.0/5.2.0/msvc2012_64_opengl")
elseif( UNIX )
	set (CMAKE_PREFIX_PATH $ENV{QT_PREFIX_LOC})
else( WIN32 )
	message( ERROR "Platform not supported" )
endif( WIN32 )


find_package( Qt5Core )
get_target_property(QtCore_location Qt5::Core LOCATION)
message( STATUS "QtCore_location=" ${QtCore_location} )
string( FIND ${QtCore_location} "/" dirend REVERSE )
string( SUBSTRING ${QtCore_location} 0 ${dirend} QtDLLDir )
if( WIN32 )
	list( APPEND outputDirs "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug" )
	list( APPEND outputDirs "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release" )
	set( QtDLLs_SOs
		${QtDLLDir}/Qt5Cored.dll
		${QtDLLDir}/Qt5Core.dll
		${QtDLLDir}/Qt5Guid.dll
		${QtDLLDir}/Qt5Gui.dll
		${QtDLLDir}/Qt5Widgetsd.dll
		${QtDLLDir}/Qt5Widgets.dll
		${QtDLLDir}/icuin51.dll
		${QtDLLDir}/icuuc51.dll
		${QtDLLDir}/icudt51.dll
	)	
elseif( UNIX )
	set( outputDirs ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} )
	set( QtVer ".5.2.0" )
	set( QtDLLs_SOs
		${QtDLLDir}/libQt5Core.so
		${QtDLLDir}/libQt5Gui.so
		${QtDLLDir}/libQt5Widgets.so
	)
	foreach( qLib ${QtDLLs_SOs} )
		list( APPEND tmpSOs ${qLib}${QtVer} )
	endforeach( qLib )
	set( QtDLLs_SOs ${tmpSOs} )
else( WIN32 )
	message( ERROR "Platform not supported" )
endif( WIN32 )

foreach( outputDir ${outputDirs} )
	file( COPY ${QtDLLs_SOs} DESTINATION "${outputDir}" )
endforeach( outputDir )

add_subdirectory( UDE )
