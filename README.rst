.. _youtube-dl: https://youtube-dl.org/

This is a simple project to install `youtube-dl`_ with some useful Makefile
commands for quick usage.

Warning
*******

`youtube-dl`_ Github repository has been recently taken down due to
`DMCA takedown notice by RIAA <https://github.com/github/dmca/blob/master/2020/10/2020-10-23-RIAA.md>`_.

Its package is stil available and you can continue to install it directly or
with this project.

Some initiatives have been taken to clone repository to another one, like
`not-youtube-dl <https://github.com/scastillo/not-youtube-dl>`_. However it is a
temporary workaround and some other initiatives will obviously raise, stay
tuned.

The last `youtube-dl documentation <documentation-backup.md>`_ has been included
here.


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

Get a video from it's webpage URL: ::

    make get url=the_webpage_video_url

Sometime URL have special characters that won't work within shell, so it is
recommended to quote your URL: ::

    make get url="the_webpage_video_url"

Download multiple videos
------------------------

You may require for multiple videos: ::

    make get url="the_webpage_video_url another_url"

You just need to quote ``url`` argument value and separate URLs with a space.


Playlist download
--------------

Also you can download all video from a playlist: ::

    make getlist url=the_webpage_video_url

Every video will be saved in a directory dedicated to the playlist, all
filename are indexed (from playlist index) and an ``history.txt`` is written.

The history file register every allready saved video so you can stop the
download anytime and restart it further without to re-download everything.

Scanning page
-------------

`youtube-dl`_ is able to automatically extract video URL from webpage on many
various web sites but sometime it can have some troubles. You may find useful
to scan an URL from website you don't know or causing error: ::

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

Encoding
--------

Every command to download video use the ``--recode-video mp4`` argument to
ensure saved video will be a MP4 file, this will require FFMPEG to be
installed. You will have to remove this argument in Makefile if you don't
want to restrict video to MP4 format or if you are not able to install FFMPEG.

Note that recoding video take longer than just downloading it, especially on
system without a graphic card.
