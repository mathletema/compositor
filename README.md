# a launcher for an iPod nano clone.

![screenshot](recording.gif)

## What this project is?

After about 10 years of beloved use, I accidently washed my iPod in my washing machine. This project was an attempt to build the software side, and then use a small SOC like the Raspberry PI to build a linux-based clone of my iPod.

## How to build and run

First install dependencies. Since I'm on Debian 11:

```
sudo apt install qt5-qmake qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qml-module-qtquick-controls qml-module-qtwayland-compositor
```

Then build:

```
cd build
qmake ../
make
```

And finally run!

```
./compositor
```
