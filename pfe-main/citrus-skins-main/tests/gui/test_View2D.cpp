#include "test_View2D.h"
#include <cppunit/CompilerOutputter.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>
#include <iostream>
#include <QApplication>
//#include "../../src/gui/MainWindow.h"
#include <QDebug>

CPPUNIT_TEST_SUITE_REGISTRATION(TestView2D );

void TestView2D::setUp(){
        std::cout << "debut setUp()" << std::endl;
        int argc=0;
        char *argv[] = {nullptr} ;
        QApplication app(argc, argv);
        view = new View2D();
        QString file1 = "file1.tiff";
        QString file2 ="file2.tiff";
        QString file3 ="file3.tiff";
        view->appendToList(file1);
        view->appendToList(file2);
        view->appendToList(file3);
        std::cout << "fin setUp()" << std::endl;
}

void TestView2D::tearDown(){

        delete view;
}

void TestView2D::testGetIndex(){
        std::cout << "debut testGetIndex" << std::endl;
        CPPUNIT_ASSERT_EQUAL(-1, view->getIndex("nonexistent.tiff"));
        CPPUNIT_ASSERT_EQUAL(0, view->getIndex("file1.tiff"));
        CPPUNIT_ASSERT_EQUAL(1, view->getIndex("file2.tiff"));
        CPPUNIT_ASSERT_EQUAL(2, view->getIndex("file3.tiff"));
        std::cout << "fin testGetIndex" << std::endl;
}

void TestView2D::testMove(){
        std::cout << "debut testMove" << std::endl;
        CPPUNIT_ASSERT_EQUAL(-1,view->move(-2));
        CPPUNIT_ASSERT_EQUAL(-1,view->move(3));
        std::cout << "fin testMove" << std::endl;
}



int main(int argc, char* argv[]) {
// Get the top level suite from the registry
  CPPUNIT_NS::Test *suite = CPPUNIT_NS::TestFactoryRegistry::getRegistry().makeTest();

  // Adds the test to the list of test to run
  CPPUNIT_NS::TextUi::TestRunner runner;
  runner.addTest( suite );

  // Change the default outputter to a compiler error format outputter
  runner.setOutputter( new CPPUNIT_NS::CompilerOutputter( &runner.result(),
                                                          CPPUNIT_NS::stdCOut() ) );
  // Run the test.
  bool wasSucessful = runner.run();

  // Return error code 1 if the one of test failed.
  return wasSucessful ? 0 : 1;

}
