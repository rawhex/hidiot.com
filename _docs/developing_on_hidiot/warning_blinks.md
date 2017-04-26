---
title: Blinking a Warning
category: Developing HIDIOT
order: 5
---

As well as using a blinking light to make pretty patterns we can also use a light to make a warning. One way to make a warning light is to make it blink faster until it becomes solid. We can use the concept of *flow control* to make our HIDIOT look like something in a James Bond movie.

> If you decide to wear your HIDIOT as a badge, always make sure it's switched off if you're going through an airport or on a plane. Warning lights are cool, but might get you into trouble if people don't understand what they're warning about.

Flow control is exactly what it sounds. Our program has a particular order that it executes instructions in, and we can make it change based on certain conditions. To make our warning countdown, we need to use the ```if``` control structure. The use of *if* is exactly the same on a computer as it is with a person:

* *If* you give your parents a hug *then* it will make them feel better.
* *If* it's raining outside *then* you should wear a jacket or coat.

In the same way, for a computer when we use the ```if``` structure, *if* a condition applies, then we execute different code. The difference is that instead of *then*, the computer uses a code block with curly braces to say what should happen next.

Lets look at how our countdown warning should work.

We want our waitOn and waitOff values to drop each blink until they reach zero, then stay on. To use our earlier analogy about how humans use *if*:

* *If* the waitOn value is greater than zero *then* we want the LED to turn off after a blink delay.

You might think, "Surely you mean *If* waitOn drops to zero, keep the LED on?", and you'd be right. That's how many humans would think about it. Just remember our eariler look at not wanting sugar in our tea. The computer can happily compute an amount of sugar (including zero sugar), but it has no idea how good a nice cup of tea really is.

In the same way, we can say that if waitOn drops to zero, turn the LED on, but then we'd have to add a whole new condition to say that if it's not zero, turn it off after a delay.

This is because computers are very, very specific and precise about their expectations.

We already have an "if" in our logic, so we can easily translate this to a sketch. Lets look at an example.

	if (waitOn > 0){
		digitalWrite(ledPin, LOW);
		delay(waitOff);
	}

This tells the HIDIOT that if the value of waitOn is greater than 0 then to turn off the LED and wait for the length of the off period. If the value of waitOn is not greater than 0 then the code within the curly braces isn't executed.

We can tell the HIDIOT to drop the value of waitOn each time round the loop by subtracting a value to from the variable such as this:

	waitOn = waitOn - 10;

Try adding this functionality to your own blink code. If you get it right, your code should roughly look something like this:

	// setup runs once on boot:
	
	const int ledPin = 1;
	int waitOn = 500; // 0.5 Seconds
	int waitOff = 500; // 0.5 Seconds because the James Bond films always count down per second
	
	void setup() {                
	  // Tell the ATTiny that we want to use pin 1 as an output
	  pinMode(ledPin, OUTPUT); // Our LED is pin 1 and we're supplying electricity to it.
	}
	
	// loop runs forever and ever:
	void loop() {
	  digitalWrite(ledPin, HIGH); // Make the LED turn on
	  delay(waitOn);               // wait
	  if (waitOn > 0){
	    waitOn = waitOn - 10;
		waitOff = waitOff - 5;
	  }
	
	  if (waitOn > 0){
	    digitalWrite(ledPin, LOW ); // Make the LED turn off
	    delay(waitOff);               // wait
	  }
	}

The code can is also be found in the HIDIOT Tutorial library under 4. Developing HIDIOT -> Mini Projects -> Blink_Warning.

Don't worry if you didn't get it right first time. It's a new concept and takes a bit of getting used to. Try playing around with the code above.

If all works well, you should have something that starts with a slow blink. The blinks get shorter and eventually the LED stays on.

### What To Do Next

If you look at the code, you might see that we check to see if waitOn is greater than zero twice in a row. If you were to merge the two ```if``` statements into a single one, does it make a difference to the program's output? If so, what?

Instead of subtracting milliseconds to make it take less time, can you modify the program to start at 5 milliseconds, add 5 per blink, and then stop when waitOn reaches a certain number?

Can you use ```random()``` to make it either add or subtract an amount of milliseconds?

Now you've finished this mini project, you can move on to the [next one](/developing_on_hidiot/blinking_codes/) when you're ready, where we'll introduce another control flow structure, loops.
