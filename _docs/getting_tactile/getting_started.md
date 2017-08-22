---
title: Getting started with tact switches
category: Getting tactile with HIDIOT
order: 2
---

![A HIDIOT with buttons](/images/hidiot-0_9a.jpg)

If you look towards the left of your HIDIOT you'll see two buttons (or two spaces for buttons if you didn't solder them in). Professionals call them *momentary tactiles switches* or *tact switches* for short. There are many different types of button and switch out there, and you can use them all with your HIDIOT.

### Understanding switches

In the electronics world, switches perform a very simple function. They open or close a circuit. If you remember from [Electricity and you](/about_electricity/) we created a circuit using a coin battery, an LED and a piece of paper. We can draw this circuit using standard electronic symbols.

![Our first circuit](/images/simple_circuit.png)

If you look at the picture above, you can see the circle with the plus and minus symbols represent our coin battery. The triangle and line with two arrows is the symbol for an LED. The arrows pointing away mean that this is an LED. The Triangle points in the direction of current flow (from positive to negative. At the top there is a strange symbol for a switch.

Even though our piece of paper doesn't have a button it's still considered a switch in electrical terms. Specifically, it's a *single pole, single throw switch*. The term pole means the number of circuits that our switch can manage. Throw means the number of circuits a switch can manage. Here's Collin Cunningham to walk you through some of the many different types of switch you might see.

{% youtube S2AHimvbovI %}

Now you know about what switches are and how they work, look around your house to see what types of switches you can see. Can you see any rotary switches? What about momentary switches? Have a look around . The sheer number and types of switches you find may surprise you.

If you have an old remote control that doesn't have a use, why not take it apart and see if you can see how it works? As well as the buttons, what other components can you see that you recognise from the HIDIOT?

> Make sure you have permission from the owner before taking anything apart. Only take things apart that you don't mind not being able to put back together again. Most importantly of all, only take things apart that don't use a mains power supply.

When taking things apart, make sure you lay out the screws on a flat surface the same way they go back in. It's easier to put things back together this way.

If you've spent a bit of time looking around for switches and pulling apart remote controls now would be a good time to have a break. When you return we'll look at how we can use switches with the HIDIOT.

### The HIDIOT's tact switches

The two tact switches that come with your HIDIOT should be connected to PB0 and PB2 on the ATTiny85. If you haven't soldered them to the board, you're going to need to connect them to follow the tutorials.

> If you don't want to solder them, you can use a breadboard and some jumper leads to connect them up. Just remember to connect one pin of each button to ground, and then the opposite pin to either PB0 or PB1.

If you need to solder them take another look at our [assembly guide](/building_a_hidiot/index/) before you start.

From this point on we'll assume you have your tact switches properly connected to PB0 and PB2.

### Using tact switches

Now we have our switches connected, lets get started using them! As always, there's pre-built code in the HIDIOT tutorials example library. Try to play along first if you can. We assume you have the standard LED connected to PB1. You can of course use a buzzer on PB1 instead by declaring BEEP.

The first thing we need to do is add some simple declarations to tell our HIDIOT about our tact switch and LED pins. We'll also declare a couple of variables to track their state.
```
#define BUT1 PB0
#define BUT2 PB2
#define LED PB1

int but1State = 0;
int but2State = 0;
```
We'll add basic ```on()``` and ```off()``` functions so we can control either an LED or a buzzer.
```
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
```
Our ```setup()``` function tells the HIDIOT whether we're looking at an input or an output. We want to control the LED, so that's an output. We want to sense what the buttons are doing, which means they're inputs.
```
void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  pinMode(BUT1, INPUT);
  pinMode(BUT2, INPUT);
}
```
> As a general rule, if you're going to tell something to do something, it's an output. If you're expecting it to tell you something, it's an input.

Finally, our ```loop()``` function checks the state of either button. If either value is HIGH then we turn on the LED. If the value is LOW then the current isn't flowing and we'll turn the LED off.
```
void loop() {
  // put your main code here, to run repeatedly:
  but1State = digitalRead(BUT1);
  but2State = digitalRead(BUT2);

  if (but1State == HIGH || but2State == HIGH) {
    on();
  } else {
    off();
  }
}
```
The ```||``` is a way of chaining together two conditions so they apply if either one is true. We'll look at it in depth later.

By the way, this code is fundamentally flawed and won't work. It makes the same the mistake everybody makes the first time they use tact switches. Don't worry, upload the code and give it a go but don't be surprised if it doesn't work properly.

So what's going on? Why isn't it working the way we expected? Remember switches are *opened* or *closed*. When they're *closed*, the current flows. When they're open, the current doesn't flow through the circuit. The pin however isn't tied to ground, it's dangling in the air. This is the cause of the problem.

When a pin isn't connected, we call it a *floating pin*. That doesn't mean that there's no energy around. In fact, there's a lot of energy in the air already because we're surrounded by electrical devices. That energy bombards the floating pin and causes it to change state between HIGH and LOW.

James over at AddOhms has a really great explanation of what's happening. He also shows us what we can do to fix it.

{% youtube wxjerCHCEMg %}

### Fixing our code
Now we know that using a resistor to pull the pin up to 5 volts will cause the problem, how do we add that to a finished PCB? Don't pack your HIDIOT up to send it back just yet. We have an internal pull-up resistor on each of the ATTiny's pins. All we need to do is change our ```setup()``` and ```loop()``` code and it'll work fine. In ```setup()```, replace the ```INPUT``` in the ```pinMode()``` calls with ```INPUT_PULLUP```, like this:
```
void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  pinMode(BUT1, INPUT_PULLUP);
  pinMode(BUT2, INPUT_PULLUP);
}
```
Using INPUT_PULLUP pulls the pin up to 5 volts when the circuit is open. When the circuit is closed by the switch, it's pulled low to ground. The value we read will then drop from HIGH to LOW. This means we need to change our ```loop()``` function to check for ```LOW``` states instead of ```HIGH```, like this:
```
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
```
Upload your modified code to the HIDIOT. You should find it a little more responsive.

### What's with the pipes?
Look at the ```if``` control block inside ```loop()```.
So far, when we've used ```if```, we've used it like this:
```
if (a > b) {
  doStuff();
}
```
As well as ```a > b```, we can use different symbols to mean different things. These symbols are called *operators*. A few of these operators are explained below:

|Character|Operator|Meaning|
|---------|--------|-------|
|>|Greater than|something is greater than something else|
|>=|Greater than or equal to|something is greater than or equal to something else|
|<|Less than|something is less than something else|
|<=|Less than or equal to|something is less than or equal to something else|
|==|Equals|Something equals something else|
|!=|Not Equal to|Something is not equal to something else|

These types of operators are called conditional operators, because they're used to compare values.

The ```||``` symbol is a *logical operator*. Logical operators connect two or more statements together and are used to evaluate conditions based on what's called *boolean logic*. We'll look at boolean logic in more detail in a later tutorial.

The ```||``` symbol is the logical operator for *OR*. In our if statement this means:
```
if (but1State equals HIGH OR but2State equals HIGH) {
  on();
} else {
  off();
}
```
The ```else``` clause simply means "If the above isn't true, do this instead".

As with comparison operators, there are whole bunch of logical operators, like AND, OR, NOT and XOR. Rather than fill your head with them right now we'll look at operators as we use them. For now, these are the only two logical operators you need to be aware of:

|Character|Operator|Meaning|Example|
|---------|--------|-------|-------|
|\|\||OR|condition a OR condition b is true|a \|\| b|
|&&|AND|condition a AND condition b is true|a && b|

So far we've looked at how to use buttons to turn on an LED. We've learned what a floating pin is and why it's bad. We've also looked at some logical operators.

In the [next section](/getting_tactile/improving_our_switch/) we'll learn about other ways of managing buttons, or in our case tact switches.

### What To Do Next

Have you ever wondered why computers use true and false, and 1 and 0? The answer is because of Information Theory, invented by Claude Shannon.

{% youtube Q8rVJZ-VDKQ %}

Adam Westbrook made a brilliant short film about Shannon's role in the leap from the analogue to the digital age. Shannon was initially concerned with communication, but in the process he laid the foundation for the logic used in computers today.

