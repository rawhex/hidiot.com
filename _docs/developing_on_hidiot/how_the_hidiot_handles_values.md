---
title: How the HIDIOT handles values
category: Developing on HIDIOT
order: 3
---

So far we've looked a structure and function, and it looks like you have a pretty good handle on them. Now lets look at how the HIDIOT handles values.

Underneath, an Arduino is really just a C program with a bunch of wrapper functions. When we call a function, sometimes we need to provide arguments. For example, if we had a function, ```makeTea()``` that wanted us to supply the number of teaspoons of sugar we'd like, then we might call:

	makeTea(2); // Two sugars, please!

Computers are *very* precise. If you don't want any sugar, you might think you could just call:

	makeTea(No sugar please); // I'm sweet enough

But that won't work. The reason it won't work is because the computer doesn't understand what sugar really is, let alone the concept of you not wanting sugar at all. In fact, the computer only understands the amount of sugar you want. In this case, if we want no teaspoons of sugar, what we should really tell the computer is that we want *zero teaspoons of sugar*.

	makeTea(0); // No sugar

To the untrained eye, this may seem a little confusing. We can assign these values labels. In the case of wanting no teaspoons of sugar, we can assign a label to represent 0. Because the value we assign won't change, we call this a *constant*. When we create a label for a constant, we *declare* it. Because computers are very precise, they need to know what type of constant is being declared. In the case of our constant, it's going to be a whole number. In computer science, we call whole numbers *integers*. In C code, integers are referred to as type *int*.

	const int none = 0;
	makeTea(none); // No sugar, thanks!

On the first line, we declare our constant ```none```, and use the equals symbol "=" to set the value to 0.

Imagine our tea making program was being used to make tea for different people who want different amounts of sugar. We could declare different constants for each person:

	const int none = 0;
	const int aidan = 2;
	const int marizel = 1;
	const int steve = none;

	makeTea(aidan);
	makeTea(marizel);
	makeTea(steve);

Here you can see that Aidan has a sweet tooth, and that Steve doesn't want any sugar in his tea. Instead of using 0, we can assign ```steve``` the same value as ```none```.

What if Steve (being difficult as ever) decides he wants two sugars for a change? The value for ```steve``` isn't really constant. If something can change, instead of declaring a constant, we should declare a *variable*.

Our variable is still an integer, so that doesn't change. Instead, our code should now read:

	const int none = 0;
	int aidan = 2;
	int marizel = 1;
	int steve = none;

	makeTea(aidan);
	makeTea(marizel);
	makeTea(steve); // Always the one causing trouble!

We can still assign a constant to a variable as long as *it's of the same type*. There are [many different types of data](https://www.arduino.cc/en/Reference/HomePage), but the most common ones you'll encounter are:

* boolean (something representing two options, normall true/false or high/low)
* char (a text character or bunch of characters, called *an array of type char*)
* byte (a number between 0 and 255, representing a single byte of data)
* int (an integer)
* float (a floating point number)

Now we know what a constant and a variable are, and hopefully you've had a nice cup of tea or a refreshing cold drink, lets get back to our Blink program and see if we can use this knowledge to make a better Blink.

### Building A Better Blink

If you open up the Blink code, you should see the following in the Arduino IDE:

	// setup runs once on boot:
	void setup() {                
	  // Tell the ATTiny that we want to use pin 1 as an output
	  pinMode(1, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}

	// loop runs forever and ever:
	void loop() {
	  digitalWrite(1, HIGH); // Make the LED turn on
	  delay(1000);               // wait 1 second
	  digitalWrite(1, LOW ); // Make the LED turn off
	  delay(1000);               // wait 1 second
	}

There are several ways we can improve the code.

1. Firstly we can specify which pin our LED lives on using a constant. We'll still need to change the code if we decide to change the pin, but we'll only have to change it in one place.
2. If we use a variable for the delay, we can change the blink rate *while the code is running*. This is better than making it only possible to wait a second. We could even use the blink to give us information.

Go to the end of the first line and press return. Before we go any further, there's something you need to understand. Once we change the code, compile it and upload it to the HIDIOT you'll have crossed a boundary. If you've never programmed before, from this day on you will be a programmer.

First we'll declare a constant for our LED pin. Hit return twice and add the following line:

	const int ledPin = 1;

Now change the value of 1 in pinMode and both digitalWrite entries to ```ledPin```.

Your code should now look like this:

	// setup runs once on boot:

	const int ledPin = 1;
	void setup() {                
	  // Tell the ATTiny that we want to use pin 1 as an output
	  pinMode(ledPin, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}

	// loop runs forever and ever:
	void loop() {
	  digitalWrite(ledPin, HIGH); // Make the LED turn on
	  delay(1000);               // wait 1 second
	  digitalWrite(ledPin, LOW ); // Make the LED turn off
	  delay(1000);               // wait 1 second
	}

If your code matches the above, you're way ahead. Well done!

Next we need to bring that delay under control. Lets declare a variable to sstore the amount of time we want to wait. Go to the end of the line you just added and press return, then add the following line:

	int wait = 1000; // 1 Second

Press return once again just to split your declarations from your code so it look tidy and your final code should look something like this:

	// setup runs once on boot:

	const int ledPin = 1;
	int wait = 1000; // 1 Second

	void setup() {                
	  // Tell the ATTiny that we want to use pin 1 as an output
	  pinMode(ledPin, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}

	// loop runs forever and ever:
	void loop() {
	  digitalWrite(ledPin, HIGH); // Make the LED turn on
	  delay(wait);               // wait 1 second
	  digitalWrite(ledPin, LOW ); // Make the LED turn off
	  delay(wait);               // wait 1 second
	}

If everything looks like the above, you should be good to compile and upload. But before we do, we'll have no way of knowing if the code running on the chip is actually our modified code or any other blink code that may already be there. Change the value of ```wait``` from 1000 to 500, and update the comment to make a note that it's 0.5 seconds instead of one.

Ok, hit that upload button, and when you're told to plug in your HIDIOT, connect it to your hub. Once it uploads you should have a HIDIOT blinking away, with the LED on for half a second, then off for half a second.

It might not seem like an awful lot compared to playing a game, but lets take a look at what's happening here.

A computer that you built yourself, from the components up, that you soldered yourself to a professional PCB, is now running code that you've written. You understand what the code does. You understand what the hardware does. You understand how the code and the hardware interact. You even know what voltage is being supplied to the LED.

> Any sufficiently advanced technology is indistinguishable from magic - *Arthur C. Clarke*

You've just changed the whole of electronic hardware and software from being magic to being something you now understand. Never again will you look at remote control, a TV or even a games console and wonder how it works, knowing you'll never truly understand. If you genuinely wnat to understand how something electronic works down at the software and component level, you now have the tools to be able to do that.

From now on, everything we're going to do is just building on that base level.

### What we've learned

So far we've looked into the structure of an Arduino sketch, some basic C programming principles, digital inputs and outputs, constants, variables and functions. We also made the HIDIOT blink when we wanted to (but don't let all that power go to your head).

We're at the end of the getting started tutorials, but before we go onto the main HIDIOT projects, we have a few mini-projects to try out. Each project explains a new programming concept. You don't have to do these projects before you start the main ones, but you really should give them a go if you're new to programming before trying the main ones out.

The 3 projects are all fairly simple and should take no more than 30 minutes each.

The 3 projects show how to:

1. Make the HIDIOT [blink pretty patterns](/developing_on_hidiot/blinking_pretty_patterns/)
2. Use the HIDIOT's blink to tell us things (such as a [warning blink](/developing_on_hidiot/warning_blinks/))
3. Use the HIDIOT's blink to communicate with us using a [blinking code](/developing_on_hidiot/blinking_codes/)

They're meant to be done in order, so even if one of them isn't that interesting to you, try it and you'll find it'll help you down the line.

If you haven't had a break, you really should consider having one now. Just remember that by now you've:

* Learned how electricity works
* Soldered together your own computer from components
* On a professional Printed Circuit Board
* Set up and used a professional development environment to program your computer
* Programmed it to blink away precisely the way you told it to

You've learned a huge amount so far, and we've only scratched the surface. At the start of the building a HIDIOT tutorial you were asked, "Are you ready?"

Now, as a fully fledged hardware hacker, **you know you're ready**.
