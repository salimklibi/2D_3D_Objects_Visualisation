#ifndef VIEW2D_H
#define VIEW2D_H

#include <QMainWindow>
#include <QtWidgets>

class View2D : public QMainWindow
{
    Q_OBJECT

public:
    View2D(QWidget *parent = nullptr);
    void createView2D();
    void createView2DBegin();
    void createView2DEnd();
    void view2DDisplayImage();
    void view2DNavigation();
    void view2DOpen();
    void view2DConvert();
    void view2DProgressBar();
    int getIndex(QString filename);
    int move(int index) ;
    void appendToList(QString name);
    void createConvertTo();
    int convertFilesToFormat(int begin, int end, QString format,  QString directoryDest);



protected:



private slots:
    void prev();
    void next();
    void open();
    void go();
    void updateSliderValue();
    void preVisual();
    void updateComboBox() ;
    void convertFiles();
    void convertDirectory();

private:
    QWidget *mainWidget;
    QVBoxLayout *vboxleft;
    QVBoxLayout *vboxright;
    QHBoxLayout *hbox;
    QHBoxLayout *hboxSlider;
    QHBoxLayout *hboxSlider2;
    QHBoxLayout *hboxPrevisual;
    QHBoxLayout *hboxConvert;
    QHBoxLayout *hboxProgressBar;
    QStringList fileList;
    QLabel *labelName;
    QString filename_short;
    QString filename;
    QString directoryname;
    QImage image;
    QLabel *thumbnailLabel ;
    int thumbnailWidth=800;
    int thumbnailHeight=800;
    QSlider *slider;
    QLabel *labelSliderMin ;
    QLabel *labelSliderMax ;
    QTextEdit * sliderValue;
    QTextEdit * previsualSize;
    QTextEdit * beginFile;
    QTextEdit * endFile;
    QComboBox *comboBox ;
    QString selectedFormat;
    QString directoryDest;
    QTextEdit *sizeFile;
    //QImageReader qImage;
    QSize sizeImage;
    QProgressBar * progressBar;
};


#endif
