#include <QtWidgets>
#include <QToolBar>
#include <QIcon>
#include <QAction>
#include <QMenu>
#include <QMenuBar>
#include <QStatusBar>
#include <QTextEdit>
#include <QTextStream>
#include <iostream>
#include "MainWindow.h"
#include "View2D.h"
#include "View3D.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    QPixmap quitpix("images/quit.png");
    //QPixmap quitpix("quit.png");
    auto *quit = new QAction(tr("&Quit"), this);
    quit->setShortcut(tr("CTRL+Q"));
    auto *view2D = new QAction(tr("&View2D"), this);
    auto *view3D = new QAction(tr("&View3D"), this);
    auto *convertFormat = new QAction(tr("&Convert Format"), this);

    QMenu *file = menuBar()->addMenu("&File");
    file->addAction(quit);

    QMenu *tools = menuBar()->addMenu("&Tools");
    tools->addAction(view2D);
    tools->addAction(view3D);
    tools->addAction(convertFormat);

    qApp->setAttribute(Qt::AA_DontShowIconsInMenus, false);

    connect(quit, &QAction::triggered, qApp, &QApplication::quit);
    connect(view2D, &QAction::triggered, this, &MainWindow::view2D);
    connect(view3D, &QAction::triggered, this, &MainWindow::view3D);
    connect(convertFormat, &QAction::triggered, this, &MainWindow::convertFormatTo);

    QToolBar *toolbar = addToolBar("main toolbar");
    QAction *quit2 = toolbar->addAction(QIcon(quitpix), "Quit Application");
    connect(quit2, &QAction::triggered, qApp, &QApplication::quit);

    statusBar()->showMessage("Ready");
}

void MainWindow::view2D() {

  QTextStream out(stdout);
  std::cout << "MainWindow::View2D clicked 1" << std::endl;

  View2D *view2DWindow = new View2D(this);
  view2DWindow->createView2D() ;
  view2DWindow->show();
}

void MainWindow::view3D() {

  QTextStream out(stdout);
  std::cout << "MainWindow::View3D clicked 1" << std::endl;

  View3D *view3DWindow = new View3D(this);
  view3DWindow->createView3D();
  view3DWindow->show();
}

void MainWindow::convertFormatTo() {

  QTextStream out(stdout);
  std::cout << "MainWindow::convertFormatTo clicked 1" << std::endl;

    View2D *convertFormatWindow = new View2D(this);
    convertFormatWindow ->createConvertTo() ;
    convertFormatWindow->show();
}
