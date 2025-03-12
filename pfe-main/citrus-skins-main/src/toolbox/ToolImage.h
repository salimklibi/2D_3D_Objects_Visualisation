#ifndef TOOLIMAGE_H
#define TOOLIMAGE_H

#include <string>


class ToolImage
{


public:
    int display(const std::string filename);
    int convert(std::string inputfilename, std::string outputfilename, std::string size);
    int contours();


protected:



private:



};


#endif
