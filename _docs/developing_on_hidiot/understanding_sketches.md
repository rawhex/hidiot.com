---
title: Understanding sketches
category: Developing on HIDIOT
order: 2
---

Programs created in the Arduino IDE are called sketches. We're going to look at an example sketch, and go through some of the concepts behind it. We'll also look at some of the differences between programming an Arduino and programming the HIDIOT.

## What You Will Learn

* The structure of every Arduino sketch
* Constants
* Digital input and output
* How the HIDIOT handles time
* Moving from sketches to C

## What You Will Need

* A fully assembled HIDIOT
* A USB Hub (preferably USB 2.0)
* A computer running Microsoft Windows 10
* The Arduino IDE with the HIDIOT library blink sketch open

### A short history of computer programming

You might not know this, but computers have been around for a very long time. In fact, they've been around for hundreds of years, if not longer. Many centuries ago, computing was a job that humans did. Human computers would produce books containing pre-calculated numbers for everything from trigonometry to tax calcuations. If they made a mistake, it was tough luck. You'd have to wait till the next edition to find out.

Although the first adding machines have been around for 5000 years, modern computers like the HIDIOT haven't been around for very long at all. In fact, here's Rambling Hambling with a 10 minute rundown on the history of computers.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VMuQppYtTCo" frameborder="0" allowfullscreen></iframe>

Now we know a bit about how computers came to be and, compared to cars, moon rockets and even planes, how young modern computers are, we can start looking at how Arduino sketches work.

### Why use an Arduino Sketch?

There are many different programming languages out there, and it's important to pick the right programming language for the thing we want to do. In the case of the HIDIOT, most of the time we're going to do simple things, such as:

* Supply 5 volts to a pin
* Stop supplying 5 volts to a pin
* Supply less than 5 volts to a pin
* Check the voltage on a pin
* Talk to another device
* Listen to another device
* Do something with what the device told us

We could do all this with a Raspberry Pi and something to change the Pi's 3.3 volts to 5 volts, but that's a bit of a waste of a Raspberry Pi. It's great that we can use an entire computer running Linux to control a strip of coloured lights, but we can do the same thing with something much smaller and much cheaper, freeing up our Raspberry Pi for important things like RetroPie or Minecraft.

Arduino sketches are great for smaller things like the list above, but because the HIDIOT is a little bit smaller than an Arduino, sometimes it makes sense to look at what's happening under the hood. This is the difference between developing and hacking.

> Developers understand what they've been told, and do things the way they were told to do it. Hackers gain deep knowledge of something in order to make it do what they want.

The common commands you see in an Arduino sketch are mostly helper commands wrapped around a professional language called C. Some people are scared by C, because they don't understand it. Because the HIDIOT is quite small, we're going to write a mix of Arduino sketches and pure C. It's enough to make the most of what we have, without making things too complicated for no good reason. Think of Arduino sketches as training wheels on a bicycle, and C as a racing motorbike. We'll start out nice and slow with sketches, and work our way towards C as we understand more and more of it.

C is a language that's used in everything from MacOS, Windows and Linux to the International Space Station. Code written in C runs on your computer, in cars, on planes and in hospital equipment. By learning a little C, you're already putting yourself way ahead of most developers.

Lets start by taking a look at our Blink sketch.

![Blink](/images/compiling_blink.png)

Arduino sketches are composed of three main parts: structure, values and functions.

### Structure and Functions

Every Arduino sketch contains two blocks of code, *setup()* and *loop()*. We call a block of code a *function*. We give the block a name and then we can reuse the code  inside whenever we need to. Sometimes we only use a block once and use standardised names for specific purposes (such as setup() and loop()). Sometimes we use functions for things we're going to do again and again so we don't have to keep writing repetitive code.

The setup() and loop() functions are in every Arduino sketch.

In sketches (and in C), functions are defined in a very specific way. Because functions are typically called by other code, a function has to define what it sends back to that code when it completes. Don't worry if that sounds a bit confusing right now, we'll look into it later.

For now, all you need to know is that ```void``` means that when called, the function executes the code contained inside, and then exits, sending nothing back.

The parentheses or "()" symbols are used to specify options, also called arguments. Again, we're not using them for now but will later on, so don't worry if it doesn't make complete sense. When referring to functions, we'll mention their name followed by a pair of parentheses just so we don't confuse them with other things we might find in our code.

Because a function is a block of code, we use curly braces "{}" to mark where a block of code starts and ends. So when we see:

	void setup() {
		// Some code
	}

This means that the function setup has no arguments, does some stuff between the curly braces and exits, sending nothing back to the code that called it. Lets take a look at what our two functions do.

The setup() function runs once the program starts. It's normally used to set up inputs and outputs, and anything we need before the main part of our program runs.

The loop() function runs continuously until the HIDIOT is switched off or reset. Once it reaches the end of the block, it goes back to the start.

> Before we go any further, this would be a good time to take a 5 minute break. We're going to go through some computer science concepts that if new, might need a bit of time to get familiar with.

Inside our functions are *statements*. A statement is an instruction to do something, and ends with a semi-colon ";". As well as statements, we also have comments. There are different ways of writing comments (to remind us what a piece of code does), but in our example, we're using single line comments, which start with "//". The very first line in the program is a comment, telling us that setup runs once on boot.

Lets take a look at the setup() function and see what it does.

	void setup() {                
		// Tell the ATTiny that we want to use pin 1 as an output
		pinMode(1, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}

The first line inside the function is a comment that describes what the function does. The first actual statement is a call to [pinMode()](https://www.arduino.cc/en/Reference/PinMode). The pinMode() function configures a pin to behave as an input (so we can read it), or an output so we can use it to send data or supply voltage.

Unlike setup() and loop(), pinMode() expects two arguments. The first is the pin number (which we'll come to later), and the second is the mode, which can be INPUT or OUTPUT.

In our code, we're setting pin 1 to be an output. That means we want to be able to supply a voltage to pin 1. We'll look at the pin numbering system in a later tutorial, but for now just know that pin 1 is PB1, which is connected to our programmable LED.

There's a full reference guide for all arduino functions [online](https://www.arduino.cc/en/Reference/HomePage).

Lets look at the loop() function in our code next.

	// loop runs forever and ever:
	void loop() {
	  digitalWrite(1, HIGH); // Make the LED turn on
	  delay(1000);               // wait 1 second
	  digitalWrite(1, LOW ); // Make the LED turn off
	  delay(1000);               // wait 1 second
	}

We know from what we've learned so far that the loop() function takes no arguments and returns nothing. There are two functions that are called in the loop, lets take a look at the digitalWrite() function.

The ```digitalWrite()``` function allows us to turn a digital pin on and off. When we turn a pin on, we supply our chip's operating voltage and say that it's set to HIGH. When we turn a pin off, we supply a voltage of 0 volts and say it's set to LOW. Because our ATTiny85 is configured to run at 5 volts, setting it to HIGH means *supply 5 volts on this pin*. If our ATTiny85 ran at 3.3 volts, HIGH would mean *supply 3.3 volts on this pin*. This is important to know, as supplying 5 volts to a 3.3 volt device could damage or even destroy a 3.3 volt device.

The ```delay()``` function does what you probably think it does. It takes one argument, in this case, the amount of time to pause (in milliseconds). If you need to wait for a little less, you can use ```delayMicroseconds()``` to wait for less than a millisecond.

Looking back at the program, we can now understand what it does. Lets break it down:

1. When the program starts, it sets pin 1 to OUTPUT mode so we can supply 5 volts when we want to.
2. Once ```setup()``` completes, we jump to the main ```loop()```.
3. The ```digitalWrite()``` function is called to set pin 1 to HIGH, supply 5 volts and make the programmable LED1 turn on.
4. The program hangs around for 1000 milliseconds (or a second to you and me).
5. After a second, ```digitalWrite()``` is called again to set pin 1 to LOW, switching the supply from 5 volts to 0 volts and turning the LED off.
6. The program waits another second.
7. After a second the program jumps back to the start of the loop and repeats until we stop it from running.

If that breakdown matches what you're thinking, then great! You fully understand what this program is doing. Unlike say, on your main computer, you know that when you tell the HIDIOT to supply 5 volts to pin 1, LED 1 will light up. This is the kind of detailed knowledge only a hardware hacker would have.

There's a fair bit to take in, so you might want to have a break. When you're ready to carry on to the [next section](/developing_on_hidiot/how_the_hidiot_handles_values/) we'll take a look at another important programming building block: values.
