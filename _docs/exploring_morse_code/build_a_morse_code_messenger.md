---
title: Build a Morse Code Messenger
category: Exploring Morse code
order: 4
---
 
We've learned a lot about Morse code in this project so far. So far, you've:

* Decoded secret government messages in pop music
* Found out about the Titanic from it's long dead radio operator
* Learned about advanced control structures and string manipulation
* Made the HIDIOT blink any Morse code message

Now we'll see how we can use our Titanic code to let us send any message we want without encoding it in Morse code first.

### Modifying our code

Lets start by taking a look at our last piece of code from the Titanic project, Example E in the HIDIOT library:

    #include <avr/pgmspace.h>
    
    #define UNIT 250 // Lets make time units 250 milliseconds long
    #define LED 1    // Our LED is PB1
    
    /* This message was sent on 14th April at 02:15 from MGY 
     * This was the final full message sent from the Titanic.
     * One "CQ" was sent after this, but stopped abruptly.
     */
    
    const char *message = "... --- ... / ... --- ... / -.-. --.- -.. / -.-. --.- -.. / -- --. -.-- .-.-.- / .-- . / .- .-. . / ... .. -. -.- .. -. --. / ..-. .- ... - .-.-.- / .--. .- ... ... . -. --. . .-. ... / .- .-. . / -... . .. -. --. / .--. ..- - / .. -. - --- / -... --- .- - ... .-.-.- / -- --. -.-- .-.-.-";
    
    int len = strlen(message);
    int i;
    
    
    void on(){        // Turn the LED on
      digitalWrite(LED, HIGH);
    }
    
    void off(){       // Turn the LED off
      digitalWrite(LED, LOW);
    }
    
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
        default:
          // If nothing else matches, do this (nothing)
        break;
      }
    }
    
    void setup() {                
      // initialize the digital pin as an output.
      pinMode(LED, OUTPUT); // Tells the HIDIOT we want to use the pin to output a signal
    }
    
    void loop() {
      // put your main code here, to run repeatedly:
      for (i = 0; i < len; i++){
        send(message[i]);
      }
      delay(UNIT*21);
    }

### Using requirements to get the job done

Because we want to do this professionally, we're going to *design* our program. Professional programmers formally design software then develop the software to meet the design. This makes sure the program does what it's supposed to do. We'll introduce two concepts used in professional software design. These concepts are *requirements* and *pseudocode*.

If we want to make a professional Morse code tool, it helps to make a list of what we need the code to do. This way, we can tick off the list as we go. We call the items on the list *requirements*.

We can already send any message we like, but we have to encode it into Morse code first. There are also a few other things we could do to make life a little easier.

If we want to be able to send any message in Morse code in any project, our code needs to:

1. Convert text into Morse code.
2. Send out the Morse code (our code already does this)
3. Use a delay based in Words Per Minute (WPM) like professionals instead of a Unit delay.
4. Be completely separate from ```setup()``` and ```loop()``` so we can reuse it elsewhere.

That's a lot to do, but the good news is that you have most of the skills and knowledge to be able to do it! Lets start with converting text into Morse code.

### Converting text into Morse code

Start a new project in the Arduino IDE. When you save it, call it *morse-player*. Copy and paste the code from example E into your morse player project's code.

At the start of our code, there's a message declared as a constant:

    const char *message = "... --- ... / ... --- ... / -.-. --.- -.. / -.-. --.- -.. / -- --. -.-- .-.-.- / .-- . / .- .-. . / ... .. -. -.- .. -. --. / ..-. .- ... - .-.-.- / .--. .- ... ... . -. --. . .-. ... / .- .-. . / -... . .. -. --. / .--. ..- - / .. -. - --- / -... --- .- - ... .-.-.- / -- --. -.-- .-.-.-";

The ```loop()``` function walks through the characters in the message and passes each character to ```send()```. The ```send()``` function uses a *switch/case* control structure to blink based on the value provided.

We could put a function between ```loop()``` and ```send()``` to convert each character in our message into Morse code. We can then loop through the Morse code and pass that to ```send()```. It's an easy way to reuse the code we've already written. It's much easier than rewriting our Morse code player from scratch!

Lets use *pseudo code* to think about how it should work. Pseudo code is a description of what our code does, rather than writing code directly. It's not a programming language, but a way of describing what our code should do, in the order it does it.

	void loop(){
	  for each character in message{
	    sendCharacter(character)
	  }
	}

This is the pseudo code for our loop. As you can see, I've chosen to write it down in a way that's like our Arduino sketch, but it's not real code. You can write things down any way you like. You'll find that the closer you write to a real language, the closer you'll get to the real code. Lets try our ```sendCharacter()``` function. We want this to be as simple as possible. For each character we want to use, we'll convert it to Morse code and loop through the letters. We'll just start with "A" and "B".

	void sendCharacter(int c){
	  char *code = "....." // Morse holder
	  switch(toupper(c)){ // Convert our character to upper case
	    case 'A':
	      code = ".-"
	      for each symbol in code {
	        send(symbol)
	      }
	      break
	    case 'B':
	      code = "-..."
	      for each symbol in code {
	        send(symbol)
	      }
	      break
	}

This looks like we're going to repeat a lot of code for each character. For each character we want to send, we're going to have to have a loop through the Morse code. There must be a better way of doing this. Could we use a function to do the sending? That would mean our code would look like this:

	  case 'C':
		sendSymbol("-.-.")
		break

That's a lot shorter. In our final sketch code, we could even do something like this:

	  case 'D': sendSymbol("--.."); break;

> If you repeat the same code in a program, creating a function for repetitive tasks can speed up coding.

That brings everything per character onto one line but still keeps our code clean. Lets have a look at what the final ```sendCharacter()``` function might look like:

	void sendCharacter(int c){
      switch(toupper(c)){
        case ' ': sendSymbol(" /"); break;
        case 'A': sendSymbol(".-"); break;
        case 'B': sendSymbol("-..."); break;
        case 'C': sendSymbol("-.-."); break;
        case 'D': sendSymbol("-.."); break;
        case 'E': sendSymbol("."); break;
        case 'F': sendSymbol("..-."); break;
        case 'G': sendSymbol("--."); break;
        case 'H': sendSymbol("...."); break;
        case 'I': sendSymbol(".."); break;
        case 'J': sendSymbol(".---"); break;
        case 'K': sendSymbol("-.-"); break;
        case 'L': sendSymbol(".-.."); break;
        case 'M': sendSymbol("--"); break;
        case 'N': sendSymbol("-."); break;
        case 'O': sendSymbol("---"); break;
        case 'P': sendSymbol(".--."); break;
        case 'Q': sendSymbol("--.-"); break;
        case 'R': sendSymbol(".-."); break;
        case 'S': sendSymbol("..."); break;
        case 'T': sendSymbol("-"); break;
        case 'U': sendSymbol("..-"); break;
        case 'V': sendSymbol("...-"); break;
        case 'W': sendSymbol(".--"); break;
        case 'X': sendSymbol("-..-"); break;
        case 'Y': sendSymbol("-.--"); break;
        case 'Z': sendSymbol("--.."); break;
        case '1': sendSymbol(".----"); break;
        case '2': sendSymbol("..---"); break;
        case '3': sendSymbol("...--"); break;
        case '4': sendSymbol("....-"); break;
        case '5': sendSymbol("....."); break;
        case '6': sendSymbol("-...."); break;
        case '7': sendSymbol("--..."); break;
        case '8': sendSymbol("---.."); break;
        case '9': sendSymbol("----."); break;
        case '0': sendSymbol("-----"); break;
	    case '.': sendSymbol(".-.-"); break;
        default: break;
      }
      send(' ');
    } 

This is short, nice and clean. We can add [punctuation](https://morsecode.scphillips.com/morse2.html) and any international letter symbols we want with ease.

### A simple SendSymbol()

We don't even need to write new code for our ```sendSymbol()``` function. We can reuse the code from ```loop()``` with minor changes:

	void sendSymbol(char *symbols){
	  int l = strlen(symbols);
	  for (i = 0; i < l; i++){
	    send(symbols[i]);
	  }
	}

The final thing we need to do is to change ```loop()``` to use our new functions. The finished function should look like this:

	void loop() {
	  // put your main code here, to run repeatedly:
	  for (i = 0; i < len; i++){
	    sendCharacter(message[i]);
	  }
	  delay(UNIT*20);
	}

### Putting it all together

Finally, lets use the first message that Samuel Morse ever sent using his Morse Code. Replace the message declaration with the following:

	const char *message = "What hath god wrought";

Upload your sketch and see if it works. If all goes well, your Morse copy should look something like this:

	.-- .... .- - / .... .- - .... / --. --- -.. / .-- .-. --- ..- --. .... -

> If you're struggling with your code, there's a working listing under File -> Examples -> HIDIOT Tutorials -> 5. Morse Code -> Messenger -> MorsePlayer. 

We can send any text message we like over Morse code. We can blink it out over an LED, or a buzzer. In fact, with the right module we could even send Morse code over radio!

Lets have a look at our 4 requirements:

1. Convert text into Morse code. (Done this, you rock!)
2. Send out the Morse code (our code already does this)

3. Use a delay based in Words Per Minute (WPM) like professionals instead of a Unit delay.
4. Be completely separate from ```setup()``` and ```loop()``` so we can use it elsewhere.

The next thing for us to do is to move away from the unit speed to words per minute. We'll make a new Arduino sketch for this.

<iframe width="560" height="315" src="https://www.youtube.com/embed/-uPV6eKAHNo" frameborder="0" allowfullscreen></iframe>

John Wilson used a Digispark to make a similar Morse code player of his own. Here's a video of his automatic Morse code keyer running off a battery. If you want to run yours off a battery, plug your HIDIOT into a USB Mobile phone charger.

> Woah! We're halfway there! Now's great for a break if you care. When you're back, we'll make it I swear (with apologies to Bon Jovi).

### Calculating Words Per Minute

Welcome back! So far we've created a program that can take any text and turn it into Morse code. Now we want to make sure that we can fine tune the speed.

Amateur Radio enthusiasts measure Morse code in two ways, both based on Words Per Minute (WPM). There's the PARIS method, and the Farnsworth method. We'll use the PARIS method.

We define Morse code speed in Words Per Minute. Morse code words are different lengths due to the different dits and dahs involved. How are we supposed to calculate words per minute when each word is a different length?

The answer is simpler than you think. To calculate Words Per Minute, we use a standard word, PARIS. Aside from being a beautiful city, PARIS is also exactly 50 Morse code units in length. Remember the spacing rules:

* A dit is 1 unit
* A dah is 3 units
* 1 unit between each symbol
* 3 units between letters
* 7 units between words

Let's try to decode PARIS:

	P         A     R       I     S
	L R R L   L R   L R L   L L   L L L
	. - - .   . -   . - .   . .   . . .       

	P (8 units + 3 intersymbol units)
	  (3 unit space between words)
	A (4 units + 1 intersymbol unit)
	  (3 unit space between words)
	R (5 units + 2 intersymbol units)
	  (3 unit space between words)
	I (2 units + 1 intersymbol unit)
	  (3 unit space between words)
	S (3 units + 2 intersymbol units)
	  (7 unit space at end of word)

	8 + 3 + 3 + 4 + 1 + 3 + 5 + 2 + 3 + 2 + 1 + 3 + 3 + 2 + 7 = 50

If the word PARIS is sent 5 times in a minute with correct spacing, 250 units will have passed. 250 units in 60 seconds is equivalent to 240 milliseconds per unit. We can represent this with the following sum:

	60 seconds / (WPM * 50) * 1000 = unit size in milliseconds

Where WPM is the desired number of Words Per Minute, and 50 is the number of elements in the standard word PARIS. The [CW Operators' Club](http://www.cwops.org/) is a world-wide organization of Morse code radio users. Nominees must be able to send and receive International Morse code at no less than 25 WPM in English. So far we've used a UNIT size of 250, just below 5 WPM. Lets use the calculation above to work out how small a CWops nominee's unit length is:

	60 seconds / (WPM * 50) * 1000 = unit size in milliseconds
	60 / (25 * 50) * 1000 = 48 milliseconds per UNIT!

Wow, that's fast! Why don't you try changing your UNIT length from 250 to 48, upload the sketch to your HIDIOT and see how quick that is? How much of that do you think you could copy?

### Adding Words Per Minute to our code

First of all we need to remove the UNIT declaration from the top of our code. Now, we'll define a macro for our WPM:

	#define WPM 5 // Words Per Minute using PARIS method

Because our unit length won't change, we can declare a constant based on simple maths:

	const int unit = 60 / (WPM * 50) * 1000; // Unit length

We have a UNIT definition. All we have to do is go through our entire codebase and change every instance of UNIT to unit. Of course, being hackers we're far too lazy to do this by hand.

Hold down the CTRL key on your keyboard, then tap F. Let go of the keyboard and you should see a Find window on your screen. In the Find textbox, type ```UNIT```. In the Replace with textbox, type ```unit```. Click on Replace All, and you can close the pop-up window.

If you scroll through the code you should see the Arduino IDE replaced all instances of ```UNIT``` with ```unit```.

> A programmer knows how to use their tools well enough to get the job done. A hacker learns their tools inside-out to get the most from them.

Upload your sketch to the HIDIOT and see if the timing is correct. If you want to be sure, change the value of ```message``` to "PARIS " (don't forget the space), then remove the ```delay()``` from ```loop()```.

What happens when you change the WPM? How many Words Per Minute can you reach and still copy PARIS?

We've done quite a bit in this project, lets take a look at what we've done:

* You've developed a program to send any message over Morse code
* You've learned about the PARIS method for measuring speed
* You added an adjustable WPM to your code so you can tune it to your level.

By now you should be pretty good at spotting Morse code when you hear or see it. You might even find Morse code in places you never noticed before. Here's Rob Scallon sending Morse code through the medium of heavy metal music:

<iframe width="560" height="315" src="https://www.youtube.com/embed/qaHgdFH3jgs" frameborder="0" allowfullscreen></iframe>

How much of the conversation could you copy?

> Now would be a good time for a break. When you're back we'll look at making the code you've written more portable.

### Reusing our Morse code player anywhere

We now have a completely professional Morse code player that can send *any* message. If we want to use that code in a project that does something else there are three ways to do it:

1. We can copy and paste the bits of individual code from project A to project B
2. We can separate our Morse code functions out into a separate file (called an *include*)
3. We can create a collection of folders and files containing functions to use called a *library*.

The first option is the easiest but most painful when it comes to maintaining code. The third option is hard work to set up but the best option if we're going to update our function often. We'll choose option 2, because it works well for small projects without needing too much setup.

Creating an include file is easy. Hold down CTRL, then press shift and N together, then let go. Alternatively click on the icon that looks like a downward pointing triangle on the top right of your Arduino window and click on New Tab.

![Adding an include](/images/morse_include.png)

You'll see a yellow band appear at the bottom of the Editor area. In the textbox, type ```morse.h``` and press return. You should now have two tabs in the editor.

### Setting options

We want to reuse our code in any project. We need to set some sane configuration options in case the project forgets to set them. If we use macros then we can use the ```#ifndef``` directive to see whether or not a macro was defined elsewhere. In your new ```morse.h``` file, try the following:

	#ifndef PIN
	  #define PIN PB1
	#endif
	
	#ifndef WPM
	  #define WPM 5
	#endif

In our main program we can define a macro for ```PIN``` and our ```WPM```. If we forget, ```PIN``` will default to PB1 and we'll default to 5 WPM.

We switched from macros to variables earlier. There's a cheeky bit of macro functionality we can use to get our unit length. If you remember, macros in code are replaced with their values at compile time. If we use maths inside a macro the calculated value is substituted wherever the macro used. For example, this works:

	#define UNIT 60 / (WPM * 50) * 1000 // unit length

If we were writing a normal C program to run on a computer, we might ask the user to provide the WPM when the program runs. Because we only change this value at compile time, we can use a Macro.

Next we want to move our ```on()``` and ```off()``` functions across from the main tab to our morse.h tab. Cut and paste them across.

> Code should only be defined in one place. When compiling, make sure that you haven't defined something twice to avoid errors.

Because we want to reuse this code, lets add support for piezo buzzers. 

As well as ```#ifndef``` we can also use ```#ifdef``` to see if something *has* been defined. If we check to see if BEEP has been defined somewhere, then we can use a piezo.

	void on(){        // Turn the LED on
  
    #ifdef BEEP
      tone(PIN,550); // If our pin is connected to a piezo we can use tone()
    #endif
    #ifndef BEEP
      digitalWrite(PIN, HIGH);
    #endif
  }
  
  void off(){       // Turn the LED off
    #ifdef BEEP
     noTone(PIN); // turn off piezo
    #endif
    #ifndef BEEP
      digitalWrite(PIN, LOW);
    #endif
  }

If BEEP has been defined in the main code, then we'll use the ```tone()``` and ```noTone()``` functions. If it hasn't, then we'll use ```digitalWrite()``` to control an LED.

We need to make sure our functions are defined before they're called, so the order they appear in is important. The next function to copy across is ```send()```. The only changes to make are changing the constant ```unit``` to the macro ```UNIT```.

Next we have to move the ```sendSymbol()``` function across. Because we don't have a globally declared ```i``` variable, we declare it locally instead here. Your ```sendSymbol()``` function should look like this:

	void sendSymbol(char *symbols){
      int i;
      int l = strlen(symbols);
      for (i = 0; i < l; i++){
        send(symbols[i]);
      }
	}

The next function to move across is the ```sendCharacter()``` function with no changes. Finally, we add a ```morse()``` function to replace the code we used in the ```loop()``` function earlier. Again, we can't rely on global ```i``` and ```len``` variables, so we declare them here.

	void morse(char *message){
      int i = 0;
      int len = strlen(message);
      //unit = 60 / (WPM * 50) * 1000; // unit length
      for (i = 0; i < len; i++){
        sendCharacter(message[i]);
      }
      delay(UNIT*20);
    }

Now our morse.h file is complete, we can go to our main code.

At the top of our code. the #include directive tells the compiler that we have another file in our project. Although the Arduino IDE knows we have two files in our project, the compiler (which is not part of the IDE) doesn't.

#include "morse.h"

We should also declare our message as a variable rather than as a constant. So far, we've used static strings for messages. It's likely we'll generate strings when we call our morse function in the future.

	char *message = "What hath god wrought";

In our ```setup()``` function we just need to set the ```pinMode()``` as per usual, but we'll use the ```PIN``` macro:

	void setup() {                
	  // initialize the digital pin as an output.
	  pinMode(PIN, OUTPUT); // Tells the HIDIOT we want to use the pin to output a signal
	}

And our loop function is incredibly simple:

	void loop() {
	  // put your main code here, to run repeatedly:
	  morse(message);
	}

We've put all of our Morse program code into a self-contained include file. We can copy that file into any project, use the ```#include``` directive and call the ```morse()``` function to beep or blink out our message on any pin. You'll probably never need to write functions to play Morse code again.

Lets have a recap of what we've done in this project:

* We learned about pseudo code, and how it can help us develop better programs
* We wrote a program to blink out morse code
* We made it use recognised timing standards 
* We saved time using Arduino IDE to change code
* We split the code out so we can reuse it anywhere
* We even added support for piezo buzzers

By now You should know enough Morse code to start recognising it. You've written programs in C, the same professional programming language used everywhere else. You've decoded hidden messages in pop songs. You've even found out from the radio chatter at the time what really happened on the Titanic.

Even better still, you've even scratched the surface of what you can do with the HIDIOT.

### What to do next

Now you can blink any Morse message, try revisiting the [blinking code project](/developing_on_hidiot/blinking_codes/). Can you add your Morse include to the project and have it blink the random numbers in Morse code instead?

<iframe width="560" height="315" src="https://www.youtube.com/embed/KKhgrCDkm0s" frameborder="0" allowfullscreen></iframe>

If you found the story of the Titanic interesting, you'll love the story of the Zimmerman Telegram. The Zimmerman Telegram was a secret telegram sent by the Germans during the First World War. The British intercepted and decrypted the message. The contents of it brought the United States into the war and changed it's course.

Morse code is still used today by amateur radio enthusiasts around the world. The [International Amateur Radio Union](http://www.iaru.org/) has links to national amateur radio groups. Once you've found your group you'll be able to find local amateur radio groups and events. If you're interested in finding out more about amateur radio, you should go along to a local event.