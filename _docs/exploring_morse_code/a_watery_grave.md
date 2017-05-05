---
title: A watery grave 
category: Exploring Morse code
order: 3
---

In 1912 the Titanic, then the largest cruise liner in the world left Southampton. It's owners, crew and the press all said the ship was "unsinkable". 5 days later the ship hit an iceberg, split in two and sank to the bottom of the Atlantic. Over 1500 died when the ship sank.

<iframe width="560" height="315" src="https://www.youtube.com/embed/SVLt9UfO3Q0" frameborder="0" allowfullscreen></iframe>

In this project we'll decode the ship's Morse code transmissions to see if it could've been saved.

### Morse code and The Titanic

Designed to be the world's biggest cruise liner, the Titanic was a floating 5 star hotel. It had a ballroom and even had Turkish baths. The ship had two hulls to protect against collision. It had some of the worlds most advanced technologies on board. The Titanic was promoted in the press as being "practically unsinkable".

On-board was a team of wireless telegraph operators. They used Morse code to send messages from ship to shore as they travelled. This included telegrams for passengers to loved ones back home. The operators used the very latest spark-gap based Morse code technology. By modern standards this was very crude. Spark-gap systems would send noises across the radio spectrum. Interference from other ships was common.

In case you were wondering what a spark gap Morse code key might sound like, here's a video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/cTWdGjKg2_A" frameborder="0" allowfullscreen></iframe>

Can you tell what the Morse code message is at 9 seconds in?

Because of the over 2200 people on-board, the Titanic had a lot of personal messages to send to shore each day. On the 13th of April the Morse code transmitter broke down. Wireless operators John "Jack" Phillips and Harold Bride spent 6 hours repairing it.

The queue of passenger messages grew and grew. When the radio came back up, Phillips spent hours working through the backlog. As the Titanic came close to other ships, their spark gap radios interfered with each other. At one point that evening Phillips (shown below) had to tell another nearby ship to stop transmitting.

![Wireless Operator "Jack" Phillips](/images/jack_phillips.jpg)

At 11:40pm on the 14th of April, 1912, the Titanic struck an iceberg. Water rushed in at an estimated 7 tons per second. With the ship filling up, the crew closed the watertight doors but it was too late. The Captain ordered Phillips to send a distress signal. Phillips communicated with other ships until they were relieved of duty around 2am. Phillips and Bride parted company, leaving the ship in opposite directions. Phillips never made it, but Bride survived.

We know the Titanic had some of the most advanced radio systems of it's day. We also know the ship spoke to other ships as well as stations on the shore. We can use the HIDIOT to replay the Morse code messages and find out if the crew could've saved the ship.

> Because we're hackers, we want to make it easy to spot interesting messages. We could choose to decode every message sent, but that would take a long time. Lets spend a moment to understand how ships communicate using Morse code.

### Callsigns and abbreviations

When you send a message over an app or SMS you often use abbreviations instead of whole words. Morse code also has it's own short text code. Understanding this code will help us find the interesting messages first.

We'll use the same technique used by British Intelligence in WWII to decrypt Nazi codes. The Nazis also used Morse code, but hid the content by using secret codes protected by encryption.

> When British Intelligence received Nazi messages, they looked for patterns in the code. Nazi messages were almost always finished with "HH" for "Heil Hitler". Once they knew what HH was, they could use it to decrypt the message. They called patterns like "HH" *cribs*.

We don't need to decrypt a message, but knowing morse code patterns will help speed things up.

Every ship with a registered radio had a callsign. The callsign for the RMS Titanic was MGY. This means that if in the spring of 1912 you heard MGY in Morse code, it was a message about, from or to the Titanic. Lets use the tree to work backwards and convert MGY into Morse code.

![Morse code tree](/images/Morse-tree.svg)

	M     G       Y
	R R   R R L   R L R R
	- -   - - .   - . - -

Excellent! Now we know that when we see this pattern in the messages, the message is either from, to or about the Titanic.

Other ships communicating at the time had other callsigns:

|Ship|Callsign|Morse|
|----|--------|-----|
|Titanic|MGY|- - / - - . / - . - -|
|Olympic|MKC|- - / - . - / - . - .|
|Carpathia|MPA|- - / . - - . / . -|
|Mesaba|MMU|- - / . - - . / . . -|
|Californian|MWL|-- / . - - / . - . .|

In the table above, we use a forward-slash ("/") to separate the Morse words. This makes things easier to read.

Cape Race station (MCE) was also referenced in the Titanic's messages. Can you tell what Cape Race's morse code would be from the letters in the table above?

Morse code operators start conversations by calling for attention using the text "CQ". This is still in use today across the Ham Radio world. When spoken in French, the two letters resemble the first two syllables of the word *securité*.

When an operator received signals they'd copy them to paper and translate them into text. This is why people still use the word *copy* used to ask or confirm they received a radio message.

Because CQ stood for security, adding a D for danger turned this into a distress code. CQD was the standard international distress signal until the late 1900s. This changed because operators would use CQ with DE to say a message came from a specific callsign. Look at the following message:

	C         Q             D       E       M     G       Y
	R L R L   R R L R       R L L   L       R R   R R L   R L R R
	- . - .   - - . -       - . .   .       - -   - - .   - . - -

This is a general call for attention from the Titanic. Now look at this message:

	C         Q         D           M     G       Y
	R L R L   R R L R   R L L       R R   R R L   R L R R
	- . - .   - - . -   - . .       - -   - - .   - . - -

Wireless operators would type out Morse code at very high speed. If the sender or listener made a mistake, they would copy false distress signals. In some cases they'd even ignore real ones.

Because of this, the international distress call code changed to SOS. People started using the term SOS to mean, "Save Our Souls". It doesn't mean anything. The real reason the code is SOS is because anyone can spot it, even with poor reception:

	S       O       S
	L L L   R R R   L L L
	. . .   - - -   . . .

There's one other word that we need to keep an eye out for. We know that the Titanic hit an iceberg before sinking. If there were other ships in the area, they might've seen the iceberg too. Lets keep an eye out for messages about *ice*.

	I     C        E
	L L   R L R L  L
	. .   - . - .  .

We now know the Morse patterns for call signs, common abbreviations and cribs. We can use this to spot patterns when the HIDIOT plays the Titanic's messages.

It might be a good idea to write the morse dits and dahs for the words we've looked at on a piece of paper. We'll use the HIDIOT to play the messages and copy them down. Having these abbreviations to hand will help speed up decoding them.

> If you haven't already, this would be a good opportunity to take a break. Don't worry, we'll still be ship shape and ready to go when you get back.

### Playing Morse code on the HIDIOT

Fire up your Arduino editor, and create a new sketch. If you're not keen on typing there's a copy of the finished code in the Arduino IDE under File -> Examples -> HIDIOT Tutorials -> 5. Exploring Morse Code -> Hello.

> Typing up the code will help you understand what's happening. If you start to feel frustrated, you can always switch to the examples and come back to your code later on.

Remember the rules for Morse code?

* A dit is a single unit long
* A dah is 3 units long
* The space between dits and dahs when signalling a letter or number is a single unit
* The space between letters is 3 units long
* A 7 unit space exists between whole words

This means that our timing should be based on unit length. we could declare a constant to use as a timing reference.

Instead of a constant, we could also use a *macro*. Macros are fragments of code or data that are given names when *defined*. Whenever the name is used in code, it's replaced by it's value. This happens when we compile the code. Variables and constants are checked while the code is running on the HIDIOT. 

Macros look like constants to us, but the HIDIOT only sees the values. If we try the following:

	#define UNIT 250 // Each unit is 250 milliseconds long

When we use ```UNIT``` in code, we see the word UNIT. The compiler takes the Macro and changes instances of UNIT to 250.

So when should we use a constant, and when should we use a macro? Constants and variables are specific data types like ```int``` and ```char```. Macros are replaced with their value during compilation, so they have no type. It's a subtle but important difference.

As a rule of thumb for configuration, use a macro:

	#define LED 1 // pin 1 is our LED. Change this if you use a different pin

If it's going to form a core part of your code, you're usually better off using a constant:

const float pi = 3.1459623

As well as radio, Morse code is commonly used with lights and mirrors. We'll use the LED on PB1 to blink out our Morse code patterns. Because that's a configuration setting, we'll use a macro.

	#define LED 1 // Our LED is PB1

Next we need a way to turn the LED on and off. Our Blink code from the mini-projects used the ```digitalWrite()``` and ```delay()``` functions. We should be able to reuse that code to turn our LEDs on and off.

We need to use the code slightly differently. Because we're dealing with time, we need to turn the LED on, wait a UNIT, then turn the LED off and wait a UNIT. We need to wait different amounts of UNITs for dahs, spaces and so on.

Trying to do this all within our loop() function is going to be painful. There were a lot of messages on the night the Titanic sank. If you're like me, you're far too lazy (and handsome, smart, witty, I could go on) to write millions of ```digitalWrite()``` calls.

We can use functions for each type of delay. Lets list out what we need to do:

* Turn the LED on
* Turn the LED off
* A dit (turn it on, wait a unit, turn it off)
* A dah (turn it on, wait 3 units, turn it off)
* Wait the space between characters (make sure the LED is off, wait a unit)
* Wait the space between letters (turn off the LED, wait 3 units)
* Wait between words (7 units)

Lets start with a function to turn things on:

	void on(){        // Turn the LED on
	  digitalWrite(LED, HIGH);
	}

That was pretty easy. Our ```off()``` function should be the same, but with LOW instead of HIGH. You can type that in yourself. Our ```on()``` and ```off()``` functions separate the act of turning the LED on and off from the amount of time we wait. This means that if we need to change how we turn LEDs on and off then we only need to update our code in two places instead of 5.

How about ```dit()``` and ```dah()``` functions?

	void dit(){       // A dit (1 pulse of 1 time unit)
	  on();
	  delay(UNIT);
	}

For ```dah()``` we could use 3 ```delay(UNIT)``` calls in a row, but that's a bit long. When we use a macro for UNIT, the UNIT inside the ```delay()``` call is replaced with the value of UNIT when the code is compiled. We know that a dah is 3 times the length of a unit, so we can use this:

	void dah(){      // A dah (1 pulse of 3 time units in length)
	  on();
	  delay(UNIT*3);
	}

How cool is that? Next we need to create delay functions. We need functions for spaces between Morse characters, letters and words.

	void nextSymbol(){ // The space between symbols
	  off();
	  delay(UNIT);
	}

The nextSymbol is the space between dots and dashes, a space of one unit. Create a ```nextLetter()``` function for the space between letters based on the above. Now create a ```nextWord()``` function for the space between words.

We can use the same trick as we did with ```dah()``` and use multiples of UNIT to wait for the space between letters and words. Give it a try.

Our ```setup()``` function should be the same as our earlier blinking code:

	// setup starts once when you power on your HIDIOT:
	void setup() {                
	  // initialize the digital pin as an output.
	  pinMode(LED, OUTPUT); // Tells the HIDIOT we want to use the pin to output a signal
	}

All the main Morse action happens in our loop. Now we've written a bunch of helper functions, lets test them out by typing in a friendly hello message.

	// loop runs forever and ever:
	void loop() {
	  // Lets send the word "HELLO", or ".... . .-.. .-.. ---"
	  // H
	  dit();
	  nextSymbol();
	  dit();
	  nextSymbol();
	  dit();
	  nextSymbol();
	  dit();
	
	  nextLetter();
	
	  // E
	  dit();
	
	  nextLetter();
	
	  // L
	  dit();
	  nextSymbol();
	  dah();
	  nextSymbol();
	  dit();
	  nextSymbol();
	  dit();
	
	  nextLetter();
	
	  // L
	  dit();
	  nextSymbol();
	  dah();
	  nextSymbol();
	  dit();
	  nextSymbol();
	  dit();
	
	  nextLetter();
	
	  // O
	  dah();
	  nextSymbol();
	  dah();
	  nextSymbol();
	  dah();
	
	  nextWord();
	}

Oh dear. That's quite a lot of writing to say hello. We'll need something better for whole messages. For now, compare your sketch to the one in the HIDIOT Tutorials examples.

When you're confident it'll work, hit the upload button and plug in your HIDIOT. If all goes well, you should see the LED blinking away. Write out the dits and dahs on a piece of paper, and use the tree to turn the blinks back into text.

![Morse code tree](/images/Morse-tree.svg)

> If the blinking is too quick, change the value of UNIT, recompile and upload the code again. Don't forget your HIDIOT needs to be restarted when uploading code.

Did you copy the blinks correctly? Did you get H-E-L-L-O? If the timing wasn't too fast or too slow, great! If not, go back and tune the timing until you're comfortable.

So far we've got a basic morse code blinker, and while it needs some work, we've learned a lot about the Titanic.

Now would be a great time to stop for a break. When you come back, we'll look at how we can make this more practical. We'll also look for interesting messages. 

James Cameron took a submarine to explore the underwater remains of the Titanic in 1995. If you want something to watch during a break, try this video of his journey.

<iframe width="560" height="315" src="https://www.youtube.com/embed/7_d4qOvKkUM" frameborder="0" allowfullscreen></iframe>

### Making a better Morse messenger

In Computer Science, it's rare that we get a piece of software right first time. If you look at most software, you'll see there are constant changes. We add new features, take out old code and problems (known as 'bugs') are squished.

The first version of our code works, which already puts you ahead of most of the code I write on my own. We can go back through our code and try to make it better. This process of changing and improving code is called *refactoring*.

If you tried the warning blinker mini project earlier you'll know how ```if``` works. We could use the ```if``` control structure to blink based on whether a particular thing we needed to blink was a dit or a dah. If you tried the blinking codes tutorial, you'll have seen the ```for``` loop control structure.

We can use these structures to make our code better. Using loops and conditionals, we can:

1. Take a message in Morse form
2. Loop through each Morse character with a for loop
3. If a character is a dit or a dah, we call ```dit``` or ```dah```
4. At the end of a text character, wait the space between letters (3 units)
5. At the end of a word, wait the space between words (7 units)
6. If we're at the end of the message, wait a while before restarting

If we want to hold a bunch of text, we can use what's called a *string*. We call a bunch of text a string, but the official name for the data type we'll use is *char* (for character).

We can store our message in a constant char like this:

	const char *message = ".... . .-.. .-.. ---";

The asterisk in front of the word message is a *pointer*. Because text can be long, we declare a pointer to the text rather than declaring the text itself. A pointer is like a shortcut on your desktop. It's easier for the HIDIOT to keep the string in one place and move a shortcut around than move chunks of text around.

> Pointers might seem weird, and some people struggle with them. The easiest way to use them is to be consistent. When declaring a string, put an asterisk in front of the name.

We'll then use the ```strlen()``` function to work out how long that message is, and store that value in a variable called len. We'll also declare a variable, i to use in a loop later on.

	int len = strlen(message);
	int i;

We can keep our ```on()``` and ```off()``` functions as they are, but we can get rid of our ```dit()``` and ```dah()``` functions. We'll use a conditional control structure like ```if``` and do our dits and dahs inside it's code block.

We'll handle timing inside a control structure. This means we can also get rid of ```nextSymbol()```, ```nextLetter()``` and ```nextWord()``` functions.

Our ```setup()``` function remains unchanged, but our ```loop()``` function will be completely different.

	void loop() {
	  // put your main code here, to run repeatedly:
	  for (i = 0; i < len; i++){
	    send(message[i]);
	  }
	  delay(UNIT*21);
	}

Lets take a look at this in more detail. We use a ```for``` loop in exactly the same way as explained in our [blinking codes](/developing_on_hidiot/blinking_codes/) project earlier. Inside the loop we call a ```send()``` function with an odd argument. Finally outside of the loop we wait 21 units, or 3 spaces.

Looking at that loop, we see a reference to *message[i]*. If you've ever programmed in languages like Python or Java you'll probably recognise it. The part that reads ```message[i]``` is a way of accessing the *ith* character in a string, starting from zero.

Suppose we declare a string, *foo*:

	char *foo = "bar";

Humans might say, "The 2nd character in foo is 'a'", but the HIDIOT would disagree as it counts from zero. "The 2nd character in foo is 'r'", it'd say, if it could speak. With the right hardware it can actually speak, but that's a whole different project.

The HIDIOT adds a single byte with the value of zero to the end of every string. This is the HIDIOT's way of telling where a string ends and is called a *null terminator*.

Because we're going to send multiple words, we need a way to distinguish between characters and words in Morse code. For our purposes, we're going to use the forward slash "/" to mean the break between a word. To keep it clean, we'll have a space on either side.

The final piece of the puzzle is the ```send()``` function. We have 4 possible characters that could be passed to ```send()```. We can use ```if```'s for this, but ```if``` has a cleverer multi-choice cousin, ```switch()``` that we can use.

	void send(char c){
	  switch (c){
	    case '-':
	      on();
	      delay(UNIT*3);
	      off();
	      break;
	    case '.':
	      on();
	      delay(UNIT);
	      off();
	      break;
	    case ' ':
	      delay(UNIT*3);
	      break;
	    case '/':
	      delay(UNIT);
	      break;
	  }
	}

Our ```send()``` function expects a single character, *c*. The ```switch()``` function is called with c as an argument, and we choose a selection of options using ```case```. Our first example looks at a dah. If *c* is a dah, turn on the LED. Wait for 3 UNIT lengths then switch off the LED. The ```break``` statement breaks out of the switch/case structure.

For the dit it's a single unit wait, and for the space there's a 3 unit wait. The slash is a little different. When we have a space between words, we'd expect the string "i o" to look something like this:

	.. / .

If we wait for 7 units on a forward slash we'll also have waits for each space character each time round the loop. A delay of 7 units on the slash would mean a total wait of 13 units, which is way too long!

|Character|Wait|
|---------|----|
| |3 Units|
|/|1 Unit|
| |3 Units|

By having a single unit wait for the forward slash character, we ensure that our word space wait is 7 units long.

Put the code together and check against the example code provided in the HIDIOT library. Lets see if our new hello code works by writing down the code for "hello" and decoding it with the tree.

![Morse code tree](/images/Morse-tree.svg)

If all went well, you should have the Morse code for "hello". Lets try with a transmission from the Titanic.

	const char *message = "-.-. --.- -.. / -.-. --.- -.. / -.-. --.- -.. / -.-. --.- -.. / -.-. --.- -.. / -.-. --.- -.. / -.. . / -- --. -.-- / ....- .---- .-.-.- ....- ....- / -. .-.-.- / ..... ----- .-.-.- ..--- ....- / .--"

Replace your code's message declaration at the top with the above. Now compile and upload, then see if you can spot any callsign patterns in the blinks.

> The sequence .-.-.- is the symbol for a full stop, or period.

Great! Now lets try some other messages. In the HIDIOT Tutorials part of the examples, you'll see some other codes. Try uploading them to the HIDIOT and copying the Morse code.

> Of course you can translate the declared strings if you prefer. That won't improve your Morse code copying skills. Morse code is extremely useful for providing information whithout wasting pins on displays.

The Morse code in the examples comes from real messages sent by different ships to and from the Titanic. By working through these you'll find out what really happened on the Titanic.

The most important question of all would be, what could've saved the 1500 lives onboard the Titanic? If you were on the Carpathia, the Mesaba or in the comms room of the Titanic what would you have done differently?

### What to do next

This was a big project and a lot to learn about, but lets look at what we've covered:

* You're getting better at Morse code
* You've translated encoded messages from over 100 years ago
* You've learned how to refactor code and make it better
* You've learned about switch/case, how to handle text strings

Perhaps most importantly, you now know that if someone claims a ship is unsinkable, you should let them sail it a few times before going onboard.

This video shows some of the transcripts played out on a spark gap Morse system. This is about as close as we can get to what the crew of the nearby Carpathia would've heard just before the ship sank.

<iframe width="560" height="315" src="https://www.youtube.com/embed/snkwsU98QlQ" frameborder="0" allowfullscreen></iframe>

If you want to find out more about life as a radio operator on the Titanic, [here's](http://oceanliner.org/titanic_radio.htm) an excellent page with a newspaper cutting showing the kind of equipment they had to work with, and some interesting information about the Titanic's watery end.

Finally, if you haven't soldered in your LED, you can also use a Piezo Buzzer on PB1 to make noise instead of using light. Replace the ```on()``` and ```off()``` functions with the following in your sketch:

	void on(){        // Turn the LED on
	  tone(LED,440);
	}
	
	void off(){       // Turn the LED off
	  noTone(LED);
	}

> Don't wire a speaker or headphone jack directly to the HIDIOT, as it could damage whatever's connected to it. Piezo buzzers will work if you replace the ```digitalWrite()``` with the ```tone()``` function.
