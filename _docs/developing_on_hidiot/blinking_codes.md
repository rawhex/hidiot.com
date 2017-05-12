---
title: Blinking codes
category: Developing on HIDIOT
order: 6
---

As well as blinking randomly, or blinking warnings to scare siblings and other family members we can also use blinking to tell us things. In fact there's little difference between blinking an LED, making a beeping noise or even sending a radio signal.

Modern satellites use the equivalent of blinking on radio to send massive amounts of information down to earth. We can't keep up with the speed they transmit, but here's a collection of some of the noises that the very first satellites sent to tell people on earth what was happening in space. If you listen carefully you might be able to spot patterns in the noises. Those patterns are different pieces of information encoded in the beeps.

{% youtube MjVorX1YVng %}

There are more ways to turn LED blinks into meaningful information than could be written here. In our first full project we'll look at one of the earliest methods of blinking complex information, Morse Code. For now, lets try something more simple.

We're going to ask the HIDIOT to think of a number, then tell us what it is. We'll get the HIDIOT to blink once for each possible value, so the number 1 would be represented by one blink, while the number 10 would be represented by 10 blinks. So we know where numbers start and end, we'll have a long period with the LED turned off between each message.

We already know how to generate random numbers, but we probably want our blinks to be the same length. We can even use a constant to define the delay between messages. There's one number we can't blink - the number zero. So we need to make sure we start at the number 1.

	blinks = random(1,11); // this will generate a number between 1 and 10

Now we have a random number of blinks, we need to work out how we can make it blink that number of times, each time the random number is generated. We could use a set of ```if``` statements for each possible number, but that would involve a lot of typing. Thankfully there's a different control flow structure known as a ```for``` loop for just this kind of situation.

The [for](https://www.arduino.cc/en/Reference/For) control structure is fairly straightforward. Like ```if()```, it evaluates a condition inside parentheses but unlike ```if()``` has a very specific structure.

Lets look at an example:

	int i = 0;
	for (i = 0; i < 100; i = i + 1) {
		boop(i);
	}

In this example, we declare a variable, ```i```. This is a throwaway variable used to hold a value that we use to count with. semi-colons are used to split up the different parts of the condition. The ```i < 100``` is a test. As long as the value of ```i``` is less than 100, the code block in the curly braces will continue to execute. If the value of ```i``` is less than 100, the next statement ```i = i + 1``` adds the number 1 to the value of ```i```.

In our code block above, we call an imaginary ```boop()``` function with the value of ```i``` as an argument. Boop will be called 100 times, the first time as ```boop(0)``` and the last time as ```boop(99)```. Once ```i``` is equal to 100, it's no longer less than 100, and the for loop exits.

Using the standard blink code as a starting point, can you modify the code to blink a random number of times? There's an example program in the HIDIOT Tutorial library under 4. Developing HIDIOT -> Mini Projects -> Blink_Codes.

	// setup runs once on boot:

	const int ledPin = 1;
	const int numberDelay = 2000; // Wait two seconds betwen random numbers
	int waitOn = 500; // 0.5 Seconds
	int waitOff = 500; // 0.5 Seconds
	int blinks = 11; // Our initial number of blinks. If we see 11 blinks, we know something is wrong with our code
	int i = 0; // A throwaway variable for our while loop

	void setup() {
	  // Tell the ATTiny that we want to use pin 1 as an output
	  pinMode(ledPin, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}

	// loop runs forever and ever:
	void loop() {
	  blinks = random(1,11);

	  for (i = 0; i < blinks; i++){
	    digitalWrite(ledPin, HIGH); // Make the LED turn on
	    delay(waitOn);  // wait
	    digitalWrite(ledPin, LOW); // Make the LED turn off
	    delay(waitOff);
	  }

	  delay(numberDelay); // Wait between numbers
	}

In the tutorial library code, there's a ```blinks``` variable that is assigned the number 11 when declared. We're using a random number between 1 and 10 for our blinks. If we see 11 blinks, we know that the random number was never generated.

A random number is generated at the start of the loop and stored in the ```blinks``` variable. A ```for``` loop handles the blinking. It starts at zero and ends at one below the ```blinks``` variable, but because it starts at zero, it blinks the correct amount of times.

Once the loop has completed, there's a delay of 2 seconds before the loop starts again.

If you've completed the other mini projects, then you're doing really well! You know understand a lot more about control flow, and random number generation. You also have an iron grip on controlling that LED.

You've used an IDE to program a computer that you built by hand, yourself, from the components up, using the C programming language that's used in everything from Microsoft Windows to the International Space Station. That's pretty awesome!

### What To Do Next

Now you have a random number blinker, what else can you get it to tell you? How would you get it to include the number zero, and still let you know?

So far we've had a look at a few things we can do with LEDs. But have you ever wondered [how an LED works](https://www.youtube.com/watch?v=uyse_I-zo4Q)?
