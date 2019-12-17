In this example the OpenGL visualization format is used.  This will print a sequence of .eps files.  The .eps files can then be converted to any common image format using ImageMagick and the eps2xxx.sh script.  ImageMagick can be downloaded and installed from http://www.imagemagick.org/.

The eps2xxx script can be called using the command:

>> sh eps2xxx.sh STARTNUM RESOLUTION FORMAT 

where STARTNUM is the suffix number of the first .eps file (generally 0), RESOLUTION is the desired horizontal and vertical resolution of the generate bitmap images, and FORMAT is the desired image format.  For example, this would start at the .eps file with a 0 suffix, and produce 800x800 .jpg files.

>> sh eps2xxx.sh 0 800 jpg

The resulting .jpg files can then be converted into a .avi file using the provided MATLAB .m file.  