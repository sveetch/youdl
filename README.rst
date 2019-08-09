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

Makefile commands cover basic usage so using them will avoid you to active
virtual environment everytime you need it, just use the command.

Quick download
--------------

Get a video from it's webpage url: ::

    make get url=the_webpage_video_url

Scanning page
-------------

`youtube-dl`_ is able to automatically extract video url from webpage on many
various web sites but sometime it can have some troubles. You may find useful
to scan an url from website you don't know or causing error: ::

    make scan url=the_webpage_video_url

Matching title
--------------

Sometime, a webpage contains many other videos links which `youtube-dl`_ will
assume they are all required and so download them even if you only need the
main one. There is a command to only download video with title matching a
pattern, commonly you may find a simple word for matching using the ``scan``
command then using it: ::

    make match title=YourWord url=the_webpage_video_url

Creating saved files registry
-----------------------------

For ``registry`` command, an absolute path to your storage device is
defined in Makefile in variable ``STORAGE``, you may change it to fit to your
needs if you plan to use this command.

Youtube-dl help
---------------

Reach the youtube-dl help to see every available options: ::

    make man

Makefile help
-------------

Use the Makefile help for more details on available commands: ::

    make help
