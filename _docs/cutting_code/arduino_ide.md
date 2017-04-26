---
title: Using the Arduino IDE
category: Cutting Code
order: 3
---
The Arduino IDE is split into 3 areas:

![The Arduino IDE](/images/ide_layout.png)

* The **Toolbar area** - Used for uploading, compiling, creating a new project, loading and saving.
* The **Editor area** - Used for editing text and adding files to a project.
* The **Console area** - This provides output when compiling or uploading, and tells us what we're *targeting*.

> Imagine you have a program to turn something on and off. You might want to run the code on a HIDIOT but also an Arduino. With the Arduino IDE you can program many different systems, but you're only going to program one at a time. We call the one you're currently programming the *target*.

Lets take a look at each area in a bit more detail.

### The Toolbar Area

The Toolbar Area is where you manage your project. The menu contains everything from preferences to handling projects, libraries and even boards. Beneath the menu are a row of pictures, called *icons*. Each of these icons does something different.

The tick inside a circle *compiles* your code into a hex file. The hex file makes no sense to most human beings, but makes a lot of sense to a program called a *bootloader*. When the HIDIOT is turned on, the bootloader is the first program that starts. It listens to the USB connection for new code for 5 seconds before running whatever program is installed on the ATTiny. If new code comes down over USB, it takes the hex file and turns it into machine code that the ATTiny can understand.

![A hex file](/images/compiled_hex.png)

As you can see, hex files look like gibberish to us, but to a HIDIOT this makes as much sense as a nicely written set of instructions to make a lovely cup of tea.

![Toolbar area](/images/ide_toolbar.png)

Next to the tick is an arrow pointing right, inside a circle. This is the upload button and it uploads the code to your HIDIOT. Whenever you click on this icon, the current code is recompiled, so you don't need to click on compile then upload, just clicking on upload is enough.

After the arrow, the next three icons in squares create a new project, open and save a project. Over on the right of the window is the serial monitor. Because of the way USB works, we can't access serial over USB. If you have a USB-TTL converter then you can use software serial to talk to the HIDIOT.

If you don't have a USB-TTL converter, don't worry. You're not missing out and there are plenty of other ways for you and your HIDIOT to talk to each other.

### The Editor Area

![Editor Area](/images/ide_editor.png)

The editor area is pretty straightforward. Just like a browser, there are tabs. Sometimes we have more than one file in a project. This is useful for splitting out different bits of data and keeping things nice and tidy. Our blink code only has one file, so there's only one tab.

The white part of the editor area is where you type your code. Text is coloured based on the purpose of the text in the editor area. Don't worry if this looks a little random right now. Over time you'll get used to it.

### The Console Area

The console area is a black part of the screen. Output from the compiler is printed in white, while output from the upload process is printed in orange.

![Console area](/images/ide_console.png)

At the bottom right of the console area is some white text on a green bar. This tells us the board we are targeting. Yours should say "Digispark (Default -16.5mhz) on COM1". It's ok if the number after COM is different. If it has something like "Arduino Uno/Genuino", then you're targeting the wrong board. Make sure you installed the Digistump libraries correctly earlier, and from the menu go to Tools -> Board -> Digispark (Default - 16.5mhz).

### Compiling your first sketch

If you haven't already, load the Blink sketch from the HIDIOT library. You should be able to find it under File -> Examples -> HIDIOT Tutorials -> 3_Programming_Your_HIDIOT -> Blink

![Loading the Blink sketch](/images/loading_blink.png)

Take a look at the code. If it makes as much sense as the hex file, don't worry, we'll fix that in the next tutorial.

Click on the circled tick box icon and you should see some white text in the console area, not unlike the screenshot below.

![Compling Blink](/images/compiling_blink.png)

You might wonder why the maximum is 6012 bytes when there's 8k of flash memory on the ATTiny85. That's because the Micronucleus bootloader takes up 2k of memory. Don't worry about it, we still have plenty of space to play with.

> The first time you run the compile button you might get a piece of orange text talking about caching. You can safely ignore it.

When you make your own projects, the first time you compile, upload or save your project you'll be asked to save it. Because the Blink sketch is already saved, you won't have to.

### Uploading a sketch to your HIDIOT

Ok, it's time to see if your HIDIOT works. Connect a USB hub to your computer, and keep the HIDIOT ready to connect to the hub. Click on the upload button (the arrow in the circle in the toolbar area) and you should see a message telling you to plug in the device now. You have 60 seconds to plug your HIDIOT in to upload the code.

After saying "Device is found!" a bunch of orange text should scroll up the screen. If all works well at the bottom you should see the following text:

	> Starting the user app ...
	running: 100% complete
	>> Micronucleus done. Thank you!

![Uploading Blink](/images/uploading_blink.png)

If you can see something like the above, well done! You've just uploaded your first program to a computer that you built, by hand, from scratch.

### If you're having trouble...

If you don't see anything like the above, or you see a message saying things timed out, make sure you've installed the Digistump drivers earlier and try again.

If:

* The power light on the HIDIOT is on
* There's no sign of a connection in Windows
* There's no Windows error message
* And you see a "Device search timed out" error message in the console area.
	
It's most likely that your USB hub isn't playing well with the HIDIOT and windows. Try the same hub in a different USB port (preferably a USB 2.0 port).

If it still doesn't work, try a different USB hub. If that doesn't work, try a different computer.

If you're still stuck it's possible the problem may have been with the hardware build. Either way, it may make sense to ask [the community](https://www.reddit.com/r/hidiot/) for help.

### What To Do Next

So far you've learned:

* How Electricity and Electrons work
* How batteries work
* How to solder
* How to build a computer from the components up
* How to install and use an Integrated Development Environment like a professional
* How to compile and upload your own code to the computer you built yourself, by hand

On a scale of 1 to 10, I'd say you're doing pretty well!

Next up, we're going to make the jump from Scientist, Engineer, Hardware builder and software administrator to *(drum roll please)* ... *Hardware Hacker!*

You've definitely earned a break from the learning. Now it's time to think about what you want to build with your HIDIOT.

Whatever you're going to build, it's going to be *incredible*, it's going to be *yours* and it's going to be *unique*.

If you want some inspiration, check out our [Hackster channel](https://www.hackster.io/hidiot). It'll be updated at least once a month, so don't forget to check back regularly!
