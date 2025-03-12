#ifndef VIEW3D_H
#define VIEW3D_H

#include <QMainWindow>
#include <QtWidgets>

class View3D : public QMainWindow {

    Q_OBJECT

public:
    View3D(QWidget *parent = nullptr);
    void createView3D();

protected:

private:

};

#endif