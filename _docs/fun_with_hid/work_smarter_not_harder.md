---
title: Work smarter, not harder
category: Fun with HID
order: 2
---

People have always looked for ways to make difficult things easier to do. Whether it’s a physical problem like lifting a heavy weight or a technical problem like inserting lots of data into a spreadsheet, the answer usually involves getting others to help you or using some kind of tool.

Having a friend or colleague to help you out makes things easier. You can share the workload and often get things done twice as fast. Sometimes though, there’s no-one around to help out.

Using a tool to make your work easier or make you more efficient is a great idea and sometimes there’s an even better tool for the job. Sometimes the tools are so good, that they start to replace the people who did the work before. This video by CGPGrey talks about how automation continues to change the way everything is done.

{% youtube 7Pq-S557XQU %}

We can use the HIDIOT to do the boring stuff for us, or to make us better at computer games. The HIDIOT can automate anything we do with a mouse, game controller or keyboard. Thankfully it's not smart enough to replace us completely. Sadly this means you'll still have to write your own homework, at least for now.

Let's use the HIDIOT to automate things for us.

### HIDIOT in disguise: pretending to be a keyboard
If you've already completed the [Exploring Morse Code](/exploring_morse_code/index) tutorial, you will have encountered the ```#include``` directive which allows you to import libraries.

If you're not working through the tutorials in order don't worry too much about what this does - it will make more sense when you do the Morse Code tutorial. All you need to know is that it lets you re-use code written by yourself or someone else to save time.

You can write your ```#include``` statements in one of two ways:
```c++
#include "DigiKeyboard.h"
// or
#include <DigiKeyboard.h>
```
The difference between the two methods is that quotes (**\"\"**) tell the compiler to look for a file with that name in the same directory as your program file. You would use this when you've written your own library and saved it. The angled brackets (**\<\>**) tell the compiler to look in its own directories where it stores lots of ready made libraries. You would use this to import commonly used libraries that come bundled with the IDE or compiler you are using.

From the compiler's view this is a lot like global and local variables. The Arduino does some smart searching to make sure it uses the right library but if you decide to use C outside of the Arduino IDE, you'll need to make sure you use it correctly. It's good practice to get it right here.

Now that we have imported the DigiKeyboard library, we can use it to write a program in the Arduino IDE that will write a message by emulating a keyboard. Let's take a look at the whole program first and then break it down line by line.

```c++
#include "DigiKeyboard.h"

void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(5000);
  DigiKeyboard.println("Hello, HIDIOT!");
}
```

Wow, that's quite a short program. As you can see, it's really easy to use the HIDIOT to impersonate a keyboard! Let's look at what the program is doing:

2. We don't need anything in ```setup``` for our program, but we do still need a ```setup()``` function.
3. When the HIDIOT first starts, it sometimes misses the first key press. Using ```DigiKeyboard.sendKeystroke(0)``` makes it send a key stroke that the computer won't print.
4. The next line is like the normal ```delay()``` function but it also keeps the USB keyboard connection responsive. If you're using the keyboard in your program you'll need to use this instead of ```delay()```.
5. The ```DigiKeyboard.println("Hello, HIDIOT!");``` line types out the text between the quote marks and presses the return key. If you didn't want to press the return key, you can use ```DigiKeyboard.print()```.

If you upload the code above it'll start, wait 5 seconds then type out "Hello, HIDIOT!" and press return, before repeating. If you don't want the text to appear in your Arduino IDE, open up a notepad window immediately after you upload the program to your HIDIOT. You should see something like the screenshot below.

![Hello, HIDIOT!](/images/digikeyboard_example.png)

That's pretty neat but wouldn't it be better if the HIDIOT could open up notepad for us in the first place? Well, with a little work, it can!

### Making it run notepad

In Windows 10, there are several ways to open a program. We could use the mouse to click on the Windows button, then find notepad in the menu and click on it. The HIDIOT could do this, but it would be limited. The HIDIOT can't see the screen, so if the screen resolution is smaller, or a mouse moves faster on a different computer it'll miss and won't launch notepad.

We can use the Windows key on some versions of Windows to bring up a menu and then try to start notepad that way, but different versions of Windows react in different ways.

A common shortcut to the run command on Windows is to press the Windows key and R at the same time. This causes a run dialog box to pop up. We can type in the command we want to run and press return. This is a job for our ```setup()``` function.

> If you use a Mac, you can use cmd + space at the same time to launch spotlight, and replace ```notepad``` with ```textedit``` in the code listings to get the same effect.

Try using the Windows and R keys to bring up the dialog box. Type in ```notepad``` and press return. If Notepad pops up, you're ready to go ahead. If not, it might be worth asking in our [community reddit](https://www.reddit.com/r/HIDIOT/) for help.

Now we know what we want to type, the next thing to do is to decide where to type it. We only want to do this once so let's use ```setup()``` to start notepad.

We can use the ```DigiKeyboard.println()``` function to type printable characters into our computer, but the Windows key isn't a printable character. How can we press the Windows key?

It turns out that a USB keyboard doesn't really send letters when you press a key. Instead, it sends codes. Most of these can be found the [USB HID Usage Tables standard document](http://www.usb.org/developers/hidpage/Hut1_12v2.pdf).

The HIDIOT knows this, and instead maps keys to codes to send as key strokes. Functions such as ```DigiKeyboard.println()``` take a string, split it into keypresses and send each keystroke individually. The ```DigiKeyboard.sendKeyStroke()``` lets us send individual key strokes.

That's great but we need to press both the Windows key and the r key at the same time. The same function can also be used to send multiple keystrokes at once.

> In computing, the Windows key is called a modifier key. A modifier key changes the action of other keys when pressed together. Other modifier keys on your keyboard include Alt and Ctrl.

In the DigiKeyboard library, the modifier keys are assigned special names, starting with MOD_. Here's a list of the common modifier keys available.

|Digikeyboard name|Key|
|-----------------|---|
|MOD_CONTROL_LEFT|Left Ctrl key|
|MOD_SHIFT_LEFT|Left Shift key|
|MOD_ALT_LEFT|Left Alt key|
|MOD_GUI_LEFT|Left Windows key|
|MOD_CONTROL_RIGHT|Right Ctrl key|
|MOD_SHIFT_RIGHT|Right Shift key|
|MOD_ALT_RIGHT|Right Alt key|
|MOD_GUI_RIGHT|Right Windows key|

To send two keystrokes, we separate them with commas, like this:

```DigiKeyboard.sendKeystroke(KEY_R, MOD_GUI_LEFT);```

If we want to send more than one keystroke, we can use the pipe symbol to separate them, like this:

```DigiKeyboard.sendKeystroke(MOD_CONTROL_LEFT, MOD_ALT_LEFT | KEY_DELETE);```

> Because DigiKeyboard sends a binary number, we can perform logical arithmetic on the second keypress to include other keys. If this sounds complicated, don't worry. We'll look at logical arithmetic in a later tutorial.

We might need to wait a moment for the Windows dialog to appear if it's busy, so we'll add a small ```Digikeyboard.delay()```

Once we have our dialog box up, we just need to type in notepad and return. We can use the same code as before for this. Our final ```setup()``` function should look something like this:

```c++
void setup() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_ALT_LEFT);
  DigiKeyboard.delay(250); // Wait a quarter of a second for the run dialog
  DigiKeyboard.println("notepad");
}
```

The ```loop()``` function should remain unchanged. Upload your program to your HIDIOT and you can watch it open up notepad and type out your message.

So far, you've learned how to:

1. Use your HIDIOT to impersonate a keyboard.
2. Learn how to press individual and combinations of keys.
3. Make your HIDIOT start programs for you.

### What To Do Next

Have a think about other things you could automate. Could you create copy and paste keys using the tact switches? That would be a little boring. How about automating the boring stuff in minecraft?

[AutoIt](https://www.autoitscript.com/site/autoit/) is a powerful program you can use to control any aspect of your computer from a single keystroke. You could use AutoIt with the HIDIOT to automate your browser and control devices in your home. For example, a light sensor connected to your HIDIOT could trigger an AutoIt script to turn your lights on when it gets dark.

You could also create your own key bindings in Minecraft and use the HIDIOT to automate them. Here's a video on using AutoIt to automate Snow harvesting. Could you use the HIDIOT to take things further?

{% youtube sNZqqp4jG9Q %}

You could even use the HIDIOT to lock the computer after a random amount of time as a practical joke on friends (although you should only do this with the owner's permission).

{% youtube vX1tDk_iwOo %}

In the next part of this tutorial we're going to build a [programmer passport](#), so you can show off your credentials with style. Can you make your programmer passport cooler than Frank Zhao's business card?
