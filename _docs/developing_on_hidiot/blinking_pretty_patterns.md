---
title: Blinking pretty patterns
category: Developing on HIDIOT
order: 4
---

This is our first mini-project to help teach basic programming concepts. There are 3 in total, and each introduces a new programming concept. They're all fairly short and should take you between 15 and 30 minutes to complete.

> All of the code for these projects are in the HIDIOT Tutorials Examples and can be found under File -> Examples -> HIDIOT Tutorials -> 4. Developing HIDIOT -> Mini Projects.

Blinking pretty patterns is something that's fairly easy to do but is surprisingly useful. After all, if you have any holiday lights, they probably have a microcontroller like the ATTiny to blink pretty patterns themselves.

In our last tutorial we added a ```wait``` variable to store the amount of time the light is on and off. We can replace the ```wait``` variable in our previous sketch with ```waitOn``` and ```waitOff``` to control LED on and off time separately.

Start by opening the Arduino IDE and open the basic blink sketch under File -> Examples -> HIDIOT Tutorials -> 4. Developing HIDIOT -> Mini Projects -> Pretty Patterns -> Blink_waitOn. The code should resemble the below.

![Blink_waitOn Sketch](/images/blink_waiton.png)

When you're ready, compile and upload your code to the HIDIOT. If all goes well, the LED should light up for 1 second, then stay off for half a second. Your code should look something like this:

So far, so good. We can change these values to whatever we want and it'll blink accordingly. Spend a few minutes playing with the waitOn and waitOff values and see what happens.

Perhaps you want something a little less predictable though. Lets try to make it blink randomly.

The ```random()``` function can be used to generate a pseudo-random number within a programmer-controlled range. Computers lack the imagination to come up with truly random numbers, so we can use various tricks to make things that feel more random. We're not really going to use those tricks here, so you may notice that the blink pattern remains the same each time you power up your HIDIOT. Don't worry, we'll use randomness more properly on one of the later projects.

The [random()](https://www.arduino.cc/en/Reference/Random) function takes either one or two arguments. If two arguments are supplied, then the first is the minimum number that could be returned, and the second argument is the maximum minus 1. For example:
```
waitOn = random(1,7);
```
Will return a random number between 1 and 6 (max - 1). If only one argument is supplied, then it's considered to be the maximum minus 1, and the minimum is automatically set to 0.
```
waitOn = random(6);
```
Will set the value of ```waitOn``` to a random number between 0 and 5.

> Humans tend to count from 1, but computers count from 0.

If we were to set the value of waitOn to a random number when it's declared at the start of our program, the value will only be set once. If we set the value of waitOn to a random number in ```loop()```, then it'll be set each time the loop runs around.

We want a reasonable minimum time for an on or off period. 1/8th of a second is reasonable (125 milliseconds). In our ```loop()``` function, we can simply add the following to the start of the function:
```
waitOn = random(125,1000);
waitOff = random(125,1000);
```
And the LED will spend a different amount of time randomly on and off. Note that you didn't have to specify ```int``` at when you changed it's value. We only specify the data type when a variable is declared.

Try to add your own code first, then look at the code in File -> Examples -> HIDIOT Tutorials -> 4. Developing HIDIOT -> Mini Projects -> Pretty_Patterns -> Random and see if it's different to yours. As long as both programs work, it doesn't matter if yours is different.

To test it, upload your code first. If it doesn't work, try to fix it. Then once you have it working, upload the tutorial Random code.

### What To Do Next

Well, you're really taking charge of the HIDIOT now! But here's a few ideas to go further.

Try setting the random value in the declaration instead and see what happens When you upload it. Does it match what you expected? Rather than delete the lines you added earlier, you can simply comment them out by putting two forward slashes "//" at the start of the waitOn and waitOff assignment lines in the ```loop()``` function.

What happens if you use both a random declaration and random assignment?

What happens when you use a random assignment for waitOn, and a random declaration at the start for waitOff?

Try tweaking the random range for ```waitOn``` and ```waitOff```. What combination do you think gives the best results?

What else do you think we could use random numbers for?

Keep an eye out for electronic devices that pretend to be random, can you spot their patterns?

Now you've finished this mini project, you can move on to the [next one](/developing_on_hidiot/warning_blinks/) or come back to it later.
