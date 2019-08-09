.. _youtube-dl: https://github.com/ytdl-org/youtube-dl/

This is a simple project to install `youtube-dl`_ with some useful Makefile
commands for quick usage.

Requires
********

* Makefile;
* Python >= 3.4;
* virtualenv;
* Pip;

Install
*******

Clone this repository where you want: ::

    git clone https://github.com/sveetch/youdl.git
    cd youdl
    make install

This will install everything in a virtual environment, so later you can easily
update `youtube-dl`_ without to care about messing your Python system packages.

Usage
*****

Get a video from it's webpage url: ::

    make get url=the_webpage_video_url

`youtube-dl`_ is able to automatically extract video url from webpage on many
various web sites but sometime it can have some troubles. You may find useful
to scan an url from website you don't know or causing error: ::

    make scan url=the_webpage_video_url

Use the Makefile help for more details on available commands: ::

    make help

Finally for ``registry`` command, an absolute path to your storage device is
defined in Makefile in variable ``STORAGE``, you may change it to fit to your
needs if you plan to use this command.
