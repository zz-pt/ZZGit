#ifdef WIN32
#include<windows.h> // For FreeConsole() in Windows
#endif

#include "MainWindow.hxx"

#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
#ifdef WIN32
	FreeConsole(); // Hide the shadowing cosole window
#endif

	//Q_INIT_RESOURCE(application);

	QApplication app(argc, argv);
	app.setOrganizationName("ZZWork");
	app.setApplicationName("UDE");
	MainWindow mainWin;
	mainWin.show();

	return app.exec();
}


