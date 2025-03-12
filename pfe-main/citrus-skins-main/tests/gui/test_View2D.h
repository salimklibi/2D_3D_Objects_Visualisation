#ifndef TESTVIEW2D_H
#define TESTVIEW2D_H
#include <cppunit/extensions/HelperMacros.h>
#include  "../../src/gui/View2D.h"


class TestView2D : public CppUnit::TestFixture {
    CPPUNIT_TEST_SUITE(TestView2D);
    CPPUNIT_TEST(testGetIndex);
    CPPUNIT_TEST(testMove);
    CPPUNIT_TEST_SUITE_END();

public:
    //TestView2D();
    void testGetIndex ();
    void testMove();

    void setUp();
    void tearDown();

    View2D *view;
};
#endif
