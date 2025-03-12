#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);

protected:



private slots:
    void view2D();
    void view3D();
    void convertFormatTo();

private:
    //void createActions();


    //QMenu *visualize2DMenu;

};


#endif
