---
title: Improving our switch
category: Getting tactile with HIDIOT
order: 3
---

So far we've made our LED come on when we push the button. When we let go of it, the light goes off. How can we make it so that when we push the button and let go, the light stays on?

One option would be to use both S1 and S2. When we push S1 the LED comes on. When we push S2 the LED turns off.

We don't need to change anything in ```setup()```, but we do need to change our ```loop()```. Currently, our ```loop()``` should look something like this:

	void loop() {
	  // put your main code here, to run repeatedly:
	  but1State = digitalRead(BUT1);
	  but2State = digitalRead(BUT2);
	
	  if (but1State == LOW || but2State == LOW) {
	    on();
	  } else {
	    off();
	  }
	}

If we want BUT1 to turn the light on, we can replace our ```if``` statement with something more simple.

	void loop() {
	  // put your main code here, to run repeatedly:
	  but1State = digitalRead(BUT1);
	  but2State = digitalRead(BUT2);
	
	  if (but1State == LOW) {
	    on();
	  } 
	}

We now add another ```if``` statement to catch S2 presses and turn the LED off.

	void loop() {
	  // put your main code here, to run repeatedly:
	  but1State = digitalRead(BUT1);
	  but2State = digitalRead(BUT2);
	
	  if (but1State == LOW) {
	    on();
	  } 
	  if (but2State == LOW) {
        off();
	  }
	}

Upload this code to your HIDIOT and give it a try. What happens when you press both tact switches at the same time?

If you noticed the LED getting dimmer when you press both buttons, try to think why that might be the case. If you thought it was because the LED turns on and off quicker than we can see, then you were right!

If we fix this, we could tell the HIDIOT to turn off the LED if both switches are pressed at the same time. This is an easy way to make the two switches act as a third.

It might not seem like much but you've created a device that can turn anything on or off. You can reuse this code to perform any on/off type action. To do this, replace the contents of ```on()``` and ```off()``` with code to do whatever you want to control. If you replace the LED with the right relay switch you could control power to a desktop lamp, pool pump or a PC. 

If you're interested in finding more about how you could use a relay to control main electricty, MKMe Lab has a video about the relay basics for Arduino. While he uses D13 on the Arduino, you should be able to use PB0 or PB1 on your HIDIOT without any major software changes. 

{% youtube Vs86QPCGfs4 %}

> We haven't tried relays with mains voltage here on the HIDIOT. If you'd like to try it out, you'll have to protect yourself from the back-emf problem. Mains electricity can kill, so make sure you stay safe at all times and only try this if you absolutely know what you're doing.

In the meantime we need to take care of the problem with pressing both buttons at the same time. It's probably fine for use with an LED. If we reused this code in something that takes time to switch on and switch off (like a relay) it could damage it, or even cause a fire.

### Fixing our code

We know that a tact switch is pressed or closed when ```digitalRead()``` tells us it's LOW. We know that it's not pressed (or open) when ```digitalRead()``` tells us it's HIGH. We can just change our ```if``` statements to the following and we should be fine.

	  if (but1State == LOW && but2State == HIGH) {
	    on();
	  } 
	  if (but2State == LOW && but1State == HIGH) {
	    off();
	  }

Once you've uploaded the code, we can test it to make sure it works. Try the following steps to test your code. 

1. Disconnect and reconnect your HIDIOT. Wait a few seconds for the program to start.
2. Push S1 and let go. The LED should come on.
3. Push S2 and let go. The LED should turn off.
4. Now hold down S1 and the LED should come on. What happens when you press S2 at the same time?
5. Let go of S1 and push down S2. The LED should turn off. What happens when you press S1 at the same time?

> Well done, you've just safety tested your device. Safety testing is a type of product testing conducted by product test engineers. To find out more about product test engineers, watch Leila talk about her day in the video below.

{% youtube ed7qMCt6GEU %}

There are many different types of test engineers and testers. Testers work on software, hardware and processes. They all work to help make sure a device does what it's meant to do without doing things it shouldn't. 

Now that we've built and tested a device that uses two buttons to control something, lets see if we can use a single button.

### Using a tact switch as an on/off button

So far we've learned how to use the tact switches to do some basic control. What if we just want to push a single button to turn the LED on or off? We can do this by keeping track of what's happening using a variable. We can use the logical operators from the last section to act based on certain conditions, like pushing or releasing S1 an odd or even number of times. The result will be something called an **alternating action switch**.

Firstly, we'll need to add some global variables where we defined ```but1State```:

	int but1State = 0;
	int but2State = 0;
	int but1Temp = 0;
	int ledState = LOW;

We use the ```but1Temp``` to store the current state of S1. This is slightly different to previous examples, but all will be clear when we come to it.

The ```ledState``` variable is used to store the LEDs state, which is either off or on.

Our ```setup()``` function needs a line adding to get that initial button state.

	but1State = digitalRead(BUT1);

Finally, our ```loop()``` function needs a lot of changes.

	void loop() {
	  // put your main code here, to run repeatedly:
	  but1Temp = digitalRead(BUT1);
	
	  if (but1Temp != but1State) {
	    if (but1Temp == HIGH){
	      // Button released
	    } else {
	      // Button pressed
	      if (ledState == LOW){
	        on();
	        ledState = HIGH;
	      } else {
	        off();
	        ledState = LOW;
	      }
	    }
	    but1State = but1Temp;
	  }

There's a lot going on, so lets break it down.

First we read S1's state and store it in but1Temp. Then we check to see if this is different to the value of but1State. If it is, it means the button state has changed.

If but1Temp is HIGH, then it means the button has been released.

If but1Temp is LOW then the button is being pressed.

The ledState tells us whether the LED is currently on or off. If it's currently on and S1 is being pressed, we want to change the state and turn it off. If it's off and S1 is being pressed, we want to swap state and turn LED1 on.

Update your code, upload it and push then release S1. If the LED comes on and stays on, it's working! Push and release S1 again. The LED should turn off.

Try it a few times with rapid press combinations and slower longer presses. You should find that it *mostly* works. Sometimes it almost bounces between switching on and off. This is exactly what's happening, a phenomenon called *bouncing*.

{% youtube IGuCv-m0e-I %}

The video above from Galco TV shows how switch bouncing works. At a much smaller level, this is exactly what's happening with our tact switches. Inside the tact switch is a small spring. When you push the button you squeeze the spring. When the button is released, the spring does what springs like to do, and *springs* back. Sometimes when pushing the button the spring bounces inside the switch. When it does this is makes and breaks contact before settling. 

The bounces only happen when the switch is pressed or released. This type of bounce is calles a **contact bounce**.

There are lots of ways to fix contact bouncing. The easiest way is in software. It's usually a good idea to implement some form of software bouncing, even if you use hardware methods as well.

The simplest method is to wait a few milliseconds after registering a press. We can use the ```delay()``` function to stop our code picking up any contact bounces. There's just one small problem with this approach.

When we use ```delay()``` the HIDIOT stops working for however long is necessary. This is fine for our example but has it's own problems. If we were using USB our delay might cause things to stop working if the HIDIOT can't talk to the USB host.

We can create our own delay using two variables and the ```millis()``` function. We can check the button twice. If more than a certain amount of time has passed we can act and avoid the contact bounce effect. We don't need to wait for long, a few milliseconds should be enough.

Let's start by introducing some new variables.

	int t1;
	int t2;
	const int dl = 10; // wait 10 ms between readings

The ```t1``` and ```t2``` variables will hold our timings. The ```dl``` constant will hold our debounce delay between readings. We can tweak this depending on how our application uses the tact switch, and on the tact switch itself. Different types and sizes of switches bounce for different lengths of time. If in doubt, you can always test until you get it right. 

The next change is in the ```setup()``` function. We need to take an initial reading to populate the ```t1``` variable.

	  t1 = millis();

Our main ```loop()``` will require a bit of a rewrite. Lets take a look at the new function and then walk through it.

	void loop() {
	  // put your main code here, to run repeatedly:
	  t2 = millis();
	  but1Temp = digitalRead(BUT1);
	
	  if (but1Temp != but1State) {
	    if (but1Temp == HIGH && t2 - t1 > dl){
	      // Button released
	      if (ledState == LOW){
	        on();
	        ledState = HIGH;
	      } else {
	        off();
	        ledState = LOW;
	      }
	    } else {
	      // Button pressed
	      t1 = millis();
	    }
	  } 
	  but1State = but1Temp;
	}

At the start of the loop we measure the time and store this in ```t2```. We can then work out how long it's been since the last t1 measurement.

The major change is in the approach to toggling the LED on and off. Previously we toggled on switch press. This time we're toggling on release. There is a good reason for the change.

We want to change state 10 milliseconds after S1 has been released. If S1 is pressed we want to reset the clock. We also only want to change the LED state when S1 is not pressed. 

If we change LED state when we reset the clock, the LED will continously flash while S1 is pressed. This is because ```t1``` is reset whenever S1 is pressed.

There's one other major change to our ```if``` statement. This ensures we only change the LED state when S1 is released *and* a suitable amount of time has passed. This stops the LED from changing while S1 bounces.

Here's the complete code. You should be able to compile, upload and tap away.

    #define BUT1 PB0
    #define BUT2 PB2
    #define LED PB1
    
	int but1State = 0;
	int but2State = 0;
	int but1Temp = 0;
	int ledState = LOW;
	int t1;
	int t2;
	const int dl = 10; // wait 10 ms between readings
	  
	void on(){        // Turn the LED on
	 
	  #ifdef BEEP
	    tone(LED,550); // If our pin is connected to a piezo we can use tone()
	  #endif
	  #ifndef BEEP
	    digitalWrite(LED, HIGH);
	  #endif
	}
 	 
	void off(){       // Turn the LED off
	  #ifdef BEEP
	   noTone(LED); // turn off piezo
	  #endif
	  #ifndef BEEP
	    digitalWrite(LED, LOW);
	  #endif
	}
	  
	void setup() {
	  // put your setup code here, to run once:
	  pinMode(LED, OUTPUT);
	  pinMode(BUT1, INPUT_PULLUP);
	  pinMode(BUT2, INPUT_PULLUP);
	  but1State = digitalRead(BUT1);
	  t1 = millis();
	}
	  
	void loop() {
	  // put your main code here, to run repeatedly:
	  t2 = millis();
	  but1Temp = digitalRead(BUT1);
	
	  if (but1Temp != but1State) {
	    if (but1Temp == HIGH && t2 - t1 > dl){
	      // Button released
	      if (ledState == LOW){
	        on();
	        ledState = HIGH;
	      } else {
	        off();
	        ledState = LOW;
	      }
	    } else {
	      // Button pressed
	      t1 = millis();
	    }
	  } 
	  but1State = but1Temp;
	}

In our next section we'll build a PC volume control key so we can pump up the volume or turn it down.

### What To Do Next

Now you have a working switch for one button, can you move the code from the ```loop()``` to a separate function? Once you have it in a separate function, how can you change it so you can make it check either tact switch without having to add lots of new code?

{% youtube xYe58W6-FJM %}

As well as testing hardware and software, testers also work in other areas from security to video games. In the video above, Anthony Castoro talks about what it's like to test video games for a living.

