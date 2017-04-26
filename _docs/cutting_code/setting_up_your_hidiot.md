---
title: Setting up your HIDIOT
category: Cutting Code
order: 2
---

So far you've managed to build your own computer, completely from scratch at the component level. Well done! Now it's time to learn how to program it.

> Remember that electricity can be dangerous. While we've taken every step that we can to make sure your HIDIOT is safe to use, ultimately you've built it yourself. Make sure your Diodes and Capacitors are correctly oriented and soldered, and that your ATTiny85 chip is in the right way round, and that you're using a USB hub at least for the first few times you use it **before** connecting your HIDIOT to another computer.

## What You Will Learn

* How to connect your HIDIOT
* How to install the Arduino IDE and Digispark board
* How to use the Arduino IDE
* How to compile a sketch
* How to upload a sketch to your HIDIOT

## What You Will Need

* A fully assembled HIDIOT
* A USB Hub (preferably USB 2.0)
* A computer running Microsoft Windows 10

> Currently we only support Windows 10 as a development platform. While the HIDIOT will work on other Operating Systems, programming it on anything other than Windows comes with workarounds and limitations. Most frustratingly, the Digispark libraries don't support the Raspberry Pi. We're looking to expand our support over time, so if you have a platform you want us to support, [tell us so the community can vote on it](https://pay.reddit.com/r/hidiot/).

### How to connect your HIDIOT

USB connections are based on a set of standards. The HIDIOT follows enough of those standards to work, but isn't strictly compliant with them all. Certain laptops, older machines and cheap hubs and computers don't like the HIDIOT at all. While we've taken every step to ensure compatibility, we can't guarantee that it will work on every computer.

When connecting your HIDIOT you want to be sure that you're not going to damage your computer. Use a USB hub to connect your HIDIOT. That way if any electrical problems occur, they're more likely to fry the USB hub than your computer. 

> Make sure external power sources are switched off and disconnected before connecting the HIDIOT over USB. Plugging the HIDIOT in when it's already powered can seriously damage your HIDIOT, your USB hub, your computer or possibly even yourself. If you're using external power sources, always check they're disconnected before connecting to USB.

We've created a video to walk you through setting up your Windows 10 system for the HIDIOT. Follow the video. Pause, then try each step as you go, and then carry on to the next step. It should take about 15-30 minutes depending on how comfortable you are with Windows 10.

{% vimeo 214225374 %}

For those who don't want to follow the video, here's some written instructions.

### How to install the Arduino IDE and Digispark board

Installing the software and drivers to make things with the HIDIOT should take around 15-20 minutes. Installing the Arduino IDE takes the longest amount of time, and is the best opportunity for a break.

> In order to install all the software you need Administrator privileges on your Windows 10 computer. If you don't have at least local Administrator privileges and the ability to install unsigned drivers, you'll need to try another computer to get it work.

#### An Eye-Dee What?

The Arduino IDE is the software we use to program the HIDIOT. It's like a word processor, only instead of making nice documents, we use it to tell the HIDIOT what to do, and in what order to do it.

The Arduino is a series of hardware projects like the HIDIOT that you can use to do similar things. Some Arduinos are more powerful than the HIDIOT, and some are very powerful, almost (but not quite) as powerful as a Raspberry Pi.

> An Integrated Development Environment (IDE) is a tool used for programming. Professional programmers (and the unprofessional ones, too) use IDEs to write, test and upload software. You're going to use the Arduino IDE to program your HIDIOT. As well as building your own computer, you get to use professional tools to program it. Isn't that neat?

Installing the Arduino IDE is easy. Just download the Arduino IDE from [Arduino.cc](https://www.arduino.cc/en/Main/Software). Versions 1.6.7, 1.8.1 and 1.8.2 are known to work perfectly fine with the HIDIOT. If you have problems with the version you install, try one of those instead. Just install, clicking through the wizards, and install the drivers at the end.

Once you've installed the Arduino IDE, it's time to install the [Digispark drivers](https://github.com/digistump/DigistumpArduino/releases/download/1.6.7/Digistump.Drivers.zip). Unzip the archive and install the drivers. There's a small problem with them not being signed. For the time being, this is out of our control but we do intend to address this at a later date.

![Make sure you install the right drivers for your version of Windows 10](/images/hidiot_drivers.png)

Make sure you install the right drivers for your version of Windows 10.

> Once you've downloaded the drivers, use the Install Drivers installer if you're on a 32-bit Windows 10 installation, or the DPinst64 installer if you're using 64-bit Windows 10.

Now we need to add board definitions for the Digispark. The Digispark is an awesome series of boards by [Digistump](https://digistump.com/), some of which are fully compatible with the HIDIOT. In order for the Arduino IDE to work with the HIDIOT, we need to add the Digistump AVR board definitions.

![Adding digistump support in the boards manager](/images/arduino_boards_manager.png)

Start the Arduino IDE, and go to File -> Preferences. When the window appears click on the box to the right of the Additional Board Manager URLs line. Another Window will appear. Add the following URL to the box labeled Additional Board Manager URLs:

	http://digistump.com/package_digistump_index.json

Click on Ok, and then Ok on the previous Window to close it.

Now go to Tools -> Board: "Arduino/Genuino Uno" -> Board Manager. A new Window will appear.

In the Filter your search box, type digispark and press return.

![Digistump AVR Boards](/images/digistump_definition.png)

You want to install the Digistump AVR Boards by Digistump. You may need to hover your mouse pointer over the bottom right of the definition for the install button to appear. See the screenshot above for an example.

When the Digistump boards are installed, you'll see the word INSTALLED in green next to the board's name.

Finally, you'll want to install the HIDIOT support library. This library contains all of the tutorial code, and is a useful reference. We'll also add any support functions we might need here at a later date, so it's useful to have.

![The HIDIOT Library](/images/hidiot_library.png)

Download the library from our [Github repo](https://github.com/rawhex/hidiot-tutorials). Use the green Clone or download button to download a zip archive of the library.

![Adding the HIDIOT Library](/images/adding_hidiot_library.png)

In the Arduino IDE, go to Sketch -> Include Library -> Manage Libraries. In the window that appears, go to the place you downloaded the zip archive, and open it. The library should install.

If you go to File -> Examples -> HIDIOT Tutorials -> Blink a new Blink sketch should open. In a moment we'll upload the code, but for now lets take a look at the Arduino IDE.

> The HIDIOT Library is updated fairly frequently. It's worth checking once a month to see if there's been any interesting updates. Of course we'll announce any big changes on our mailing list.

Now's a great opportunity to take a break before we walk through the [Arduino IDE](/cutting_code/arduino_ide/).
