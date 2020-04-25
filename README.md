Simple static Web Server made in Ada 2012
=========================================

HTTPd is a simple static Web Server made in Ada 2012 by using the Ada Web Server framework (AWS). 

Setup
=====

For building you need the latest GPL release of Adacore GNAT Community from [Adacore Community site](https://www.adacore.com/community)

You also need to download [AWS](https://github.com/AdaCore/aws) and build it.

Build
=====

For building and linking the Windows program icon, run the following command:

~~~shell
windres app.rc app_icon.o
~~~

Then open httpd.gpr in GPS and press F4 to build the executable. It will be available under /web with a simple HTML page.

Use
===

Place httpd.server.exe in the same folder where you have your web files. Open your browser and navigate to: [http://localhost:8080/](http://localhost:8080/)
Add the filename you want to open. 

In the console:
:> File exist
:! File does not exist

To stop the Web Server press the 'Q' key.
