#include <iostream>
#include <QFileDialog>
#include <QString>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QLabel>
#include <QImage>
#include <QImageReader>
#include <QPushButton>
#include <QFileInfo>
#include <QDir>
#include <QStringList>
#include <QSlider>
#include <QDebug>
#include <QTextEdit>
#include <QComboBox>
#include <QSize>
#include <QProgressBar>

#include "View2D.h"
#include "../toolbox/ToolImage.h"

//#include <opencv2/opencv.hpp>
//#include <opencv2/core.hpp>
//#include <opencv2/imgcodecs.hpp>
//#include <opencv2/highgui.hpp>
//using namespace cv;

View2D::View2D(QWidget *parent)
    :QMainWindow(parent)
{

}

void View2D::createView2D() {
    setWindowTitle(tr("View 2D Window"));
    createView2DBegin();
    view2DNavigation();
    view2DOpen();
    createView2DEnd();
}

void View2D::createView2DBegin() {
        mainWidget = new QWidget;
        vboxleft = new QVBoxLayout(this);
        vboxright = new QVBoxLayout(this);
        hbox = new QHBoxLayout(this);
        hboxSlider = new QHBoxLayout(this);
        hboxSlider2 = new QHBoxLayout(this);
        hboxPrevisual = new QHBoxLayout(this);
        hboxProgressBar = new QHBoxLayout(this);

        vboxleft->setSpacing(2);
        vboxright->setSpacing(3);
}

void View2D::createView2DEnd() {
    hbox->addLayout(vboxleft);
    hbox->addLayout(vboxright);
    mainWidget->setLayout(hbox);
    setCentralWidget(mainWidget);
}

void View2D::view2DDisplayImage() {
    filename = QFileDialog::getOpenFileName(this,  tr("Open Image"), "..", tr("Image Files (*.jp2 *.png *.jpg *.bmp *.tiff)"));
    std::cout << "filename = " << filename.toStdString() << std::endl;
    QFileInfo fileInfo(filename);
    directoryname = fileInfo.path();
    filename_short = fileInfo.fileName();
    std::cout << "directory = " << directoryname.toStdString() << std::endl;
    QDir directory(directoryname);
    directory.setFilter(QDir::Files);
    directory.setSorting(QDir::Name);
    fileList = directory.entryList();
    std::cout << "fileList size = " << fileList.size() << std::endl;
    std::cout << "fileList first = " << fileList.at(0).toStdString() << std::endl;

    QImageReader qImage(filename);
    qDebug()  << "format image = " << qImage.format() ;
    sizeImage = qImage.size();
    qDebug()  << "size image = " << sizeImage;
    image = qImage.read();
    qDebug()  << "image is null " << image.isNull( );
    thumbnailLabel = new QLabel(this);
    thumbnailLabel->setPixmap(QPixmap::fromImage(image.scaled(thumbnailWidth, thumbnailHeight, Qt::KeepAspectRatio)));
    labelName = new QLabel(filename_short, this);
}

void View2D::view2DNavigation() {
    view2DDisplayImage();

    QPushButton *buttonPrev = new QPushButton(tr("Prev"));
    buttonPrev->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    slider = new QSlider(Qt::Horizontal , this);
    slider->setRange(0, fileList.size()-1);
    slider->setValue(getIndex(filename_short));
    //qDebug()  << "slider index = " << getIndex(filename_short) ;
    QPushButton *buttonNext = new QPushButton(tr("Next"));
    buttonNext->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    QPushButton *buttonSlider = new QPushButton(tr("Go"));
    buttonSlider->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    labelSliderMin = new QLabel("0", this);
    labelSliderMax = new QLabel(QString::number(fileList.size()-1), this);
    //QPushButton *buttonOpen = new QPushButton(tr("Open"));
    //buttonOpen->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    sliderValue = new QTextEdit(QString::number(getIndex(filename_short)));
    //sliderValue->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    sliderValue ->setMaximumHeight(sliderValue->fontMetrics().height()+10);
    sliderValue ->setMaximumWidth(70);
    previsualSize = new QTextEdit(QString::number(thumbnailWidth));
    previsualSize->setMaximumHeight(previsualSize->fontMetrics().height()+10);
    previsualSize ->setMaximumWidth(70);
    QPushButton *buttonPreview = new QPushButton(tr("Preview"));
    buttonPreview->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);

    connect(buttonPrev, &QPushButton::clicked, this, &View2D::prev);
    connect(buttonNext , &QPushButton::clicked, this, &View2D::next);
    //connect(buttonOpen, &QPushButton::clicked, this, &View2D::open);
    connect(slider, &QSlider::valueChanged, this, &View2D::updateSliderValue);
    connect(buttonSlider, &QPushButton::clicked, this, &View2D::go);
    connect(buttonPreview, &QPushButton::clicked, this, &View2D::preVisual);

    hboxSlider->addWidget(buttonPrev);
    hboxSlider->addWidget(labelSliderMin);
    hboxSlider->addWidget(slider);
    hboxSlider->addWidget(labelSliderMax);
    hboxSlider->addWidget(buttonNext);
    hboxPrevisual->addWidget(previsualSize);
    hboxPrevisual->addWidget(buttonPreview);
    vboxleft->addWidget(thumbnailLabel);
    vboxleft->addLayout(hboxPrevisual);
    vboxleft->addLayout(hboxSlider);
    hboxSlider2->addWidget(sliderValue);
    hboxSlider2->addWidget(buttonSlider);
    vboxleft->addLayout(hboxSlider2);
    vboxleft->addWidget(labelName);
    //vboxleft->addWidget(buttonOpen);
}

void View2D::view2DOpen() {
    QPushButton *buttonOpen = new QPushButton(tr("Open"));
    buttonOpen->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    connect(buttonOpen, &QPushButton::clicked, this, &View2D::open);
    vboxleft->addWidget(buttonOpen);
}

void View2D::view2DConvert() {
    beginFile = new QTextEdit(QString::number(0));
    beginFile->setMaximumHeight(previsualSize->fontMetrics().height()+10);
    beginFile ->setMaximumWidth(70);
    endFile = new QTextEdit(QString::number(fileList.size()-1));
    endFile->setMaximumHeight(previsualSize->fontMetrics().height()+10);
    endFile ->setMaximumWidth(70);
    comboBox = new QComboBox(this);
    comboBox->addItem("tiff");
    comboBox->addItem("jpg");
    comboBox->addItem("png");
    comboBox->addItem("nrrd");
    comboBox->setCurrentIndex(0);
    selectedFormat = comboBox->currentText();
    qDebug()  << "combobox index = " << comboBox->currentIndex() ;
    qDebug()  << "combobox text = " << comboBox->currentText() ;
    sizeFile = new QTextEdit(QString::number(sizeImage.width()));
    sizeFile->setMaximumHeight(previsualSize->fontMetrics().height()+10);
    sizeFile ->setMaximumWidth(70);


    QPushButton *buttonConvert = new QPushButton(tr("Convert"));
    buttonConvert->setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
     QPushButton *buttonDirectory = new QPushButton(tr("Directory"));

    connect(comboBox, QOverload<int>::of(&QComboBox::currentIndexChanged), this, &View2D::updateComboBox);
    connect(buttonConvert, &QPushButton::clicked, this, &View2D::convertFiles);
    connect(buttonDirectory, &QPushButton::clicked, this, &View2D::convertDirectory);

    hboxConvert = new QHBoxLayout(this);
    hboxConvert->addWidget(beginFile);
    hboxConvert->addWidget(endFile);
     hboxConvert->addWidget(comboBox);
     hboxConvert->addWidget(sizeFile);
     hboxConvert->addWidget(buttonDirectory);
    hboxConvert->addWidget(buttonConvert);
    vboxleft->addLayout(hboxConvert);
}

void View2D::view2DProgressBar() {
    qDebug()  << " view2DProgressBar debut " ;
    progressBar = new QProgressBar(this);
   // progressBar->setRange((beginFile->toPlainText()).toInt(), (endFile->toPlainText()).toInt());
    progressBar->setOrientation(Qt::Horizontal);
    hboxProgressBar->addWidget(progressBar);
    vboxleft->addLayout(hboxProgressBar);
    qDebug()  << " view2DProgressBar fin " ;
}

void View2D::prev() {
    int index = getIndex(filename_short);
    int new_index = 0;
    if(index>0) {
        new_index = index-1;
        move(new_index) ;
    }
}

void View2D::convertFiles() {

    int begin = (beginFile->toPlainText()).toInt();
    int end = (endFile->toPlainText()).toInt() ;
    convertFilesToFormat(begin, end, selectedFormat, directoryDest);
}

void View2D::convertDirectory() {
    directoryDest = QFileDialog::getExistingDirectory(this,  tr("Open Directory"), "..", QFileDialog::ShowDirsOnly | QFileDialog::DontResolveSymlinks);
    directoryDest.append("/");
    //qDebug() << "directoryDest = " << directoryDest ;
}

int View2D::convertFilesToFormat(int begin, int end, QString format, QString directoryDest) {
    if(begin < 0 || end > fileList.size()-1) return -1;
    if(begin > end) return -1;
    ToolImage tool;
    int index = begin-1;
     progressBar->setRange(begin, end);
     if(selectedFormat.toStdString() !="nrrd") {
    for(int i=begin; i<end+1; i++) {
        QString fileNameToConvert = directoryname;
        fileNameToConvert.append("/");
        fileNameToConvert.append(fileList.at(i));
        //qDebug()  << "convertFilesToFormat  fileNameToConvert = " << fileNameToConvert ;
        QFileInfo fileInfo(fileNameToConvert);
        //std::cout  << "convertFilesToFormat  fileInfo.completeBaseName() = " << directoryDest.toStdString() + (fileInfo.completeBaseName()).toStdString()+"." + format.toStdString() << std::endl;

        tool.convert(fileNameToConvert.toStdString(), directoryDest.toStdString() + (fileInfo.completeBaseName()).toStdString()+"." + format.toStdString(), (sizeFile->toPlainText()).toStdString());
        index++;
        progressBar->setValue(index);
        }
    } else {

    }

    return 0;
}

int View2D::move(int new_index) {
    //std::cout << "index =  " << new_index << std::endl;
        if(new_index < 0 || new_index >= fileList.size()) return -1;
        filename_short = fileList.at(new_index);
        labelName->setText(filename_short);
        filename = directoryname;
        filename += "/";
        filename += filename_short;
        //qDebug()  << "filename = " << filename;
        QImageReader qImage(filename);
        //qDebug()  << "format image = " << qImage.format() ;
        //qDebug()  << "size image = " << qImage.size() ;
        image = qImage.read();
        //qDebug()  << "image is null " << image.isNull( );
        thumbnailLabel->setPixmap(QPixmap::fromImage(image.scaled(thumbnailWidth, thumbnailHeight, Qt::KeepAspectRatio)));
        slider->setValue(new_index);

        filename_short = fileList.at(new_index);
        labelName->setText(filename_short);
        return new_index;
}

void View2D::next() {
     int index = getIndex(filename_short);
    int new_index = 0;
    //std::cout << "index =  " << index << std::endl;
    if(index<fileList.size()-1) {
        new_index = index+1;
        move(new_index) ;
    }
}

void View2D::open() {
   ToolImage tool;
   tool.display(filename.toStdString());
   // essai convert jp2 to tiff
   //QFileInfo fileInfo(filename);
   //tool.convert(filename.toStdString(), (fileInfo.completeBaseName()).toStdString()+".tiff");

}

void View2D::go() {
    //qDebug() << "button go clicked"   ;
    //int newIndex = slider->value();
    int newIndex = (sliderValue->toPlainText()).toInt();
    move(newIndex) ;
}


int View2D::getIndex(QString filename) {
    for(int i=0; i < fileList.size(); i++) {
        if (QString::compare(filename, fileList.at(i)) == 0) return i;
    }
    return -1;
}

void View2D::updateSliderValue() {
    sliderValue->setPlainText(QString::number(slider->value()));
}

void View2D::preVisual() {
    thumbnailWidth = (previsualSize->toPlainText()).toInt();
    thumbnailHeight = thumbnailWidth;
    int newIndex = (sliderValue->toPlainText()).toInt();
    move(newIndex);
}

void View2D::appendToList(QString name) {
    fileList.append(name);
}

void View2D::createConvertTo() {
    setWindowTitle(tr("Convert to Window"));
    createView2DBegin();
    view2DNavigation();
    view2DConvert();
    view2DProgressBar();
    createView2DEnd();
}

void View2D::updateComboBox() {
        selectedFormat = comboBox->currentText();
        qDebug() << "Format selectionne : " << selectedFormat;
}


