---
title: How to solder a component
category: Building a HIDIOT
order: 2
---

Building a HIDIOT is easy. We designed it so that it's really hard to get wrong. Just take your time, and if you're stuck, ask our community on [Reddit](https://www.reddit.com/r/hidiot/).

> This project involves soldering. Children should always be supervised when soldering, especially when they've never tried before. Parents should try this first, then give children the opportunity to try out soldering different parts under adult supervision. **Never** let children near hot soldering irons unsupervised.

## What You Will Learn

* How to build a HIDIOT
* What each part does
* Why each part is there
* Soldering skills
* How to test a PCB

## What You Will Need

* Your HIDIOT parts kit
* A HIDIOT Printed Circuit Board (PCB)
* A Soldering iron with cleaning sponge and stand
* A helping hand (optional, but recommended for beginners)
* A soldering mat or heat resistance surface
* A well-ventilated space
* Safety goggles for anyone near the soldering area

If you're unfamiliar with soldering, you should also get:

* A piece of stripboard, protoboard or veroboard to practice with
* Some practice components (any will do, spare resistors and LEDs are good)

## What Is Soldering?

Soldering is a way of sticking two things together with a metal (called solder). It's a bit like hot glue, but hotter and with molten metal. Here's oneTesla with a walkthrough to show you how it works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qps9woUGkvI" frameborder="0" allowfullscreen></iframe>

Soldering the components on your HIDIOT is easy, even if you've never soldered before. Just follow these 10 steps:

1. Put your part through the circuit board's holes.
2. Bend the metal legs back so it doesn't move.
3. Flip it upside down.
4. Make sure you're holding the cold end of the soldering iron!
5. Heat up the area you want the solder to flow through with the soldering iron's hot end.
6. Apply the solder to the area you want to join.
7. The solder will melt, then fill the hole.
8. Pull away the solder.
9. Pull away the soldering iron.
10. Snip the legs away with a pair of solder snippers. You can use scissors, just make sure you're wearing protective goggles and that the legs don't fly towards anyone, including yourself.

Don't worry if this sounds a little too much to start with. [Gwendoline at iFixit](https://www.youtube.com/watch?v=UpVx4wGukRc) has a good video that goes through the basics. If you've never soldered before, it's worth looking at some videos on Youtube, and getting a piece of stripboard (which is just a board with a bunch of holes in it), and some components you don't mind losing just to try it out before you start on your HIDIOT.

Once you're happy with your soldering on a stripboard, you're ready to start. If you haven't soldered before and don't have a stripboard, you might want to try one of our workshops.

## Building the HIDIOT

There's a good order to build the HIDIOT. If you're happy using helping hands, the order doesn't matter! If you don't have or use a pair of helping hands you'll want to follow this order.

> You can put the HIDIOT down after soldering an individual component and come back some other time. If you're struggling, switch off your soldering iron, get some fresh air and a nice drink and come back to it later. Try to complete a section at a time if you can, but if you can't, don't worry.

When we talk about bottom, left, right on the board, we're assuming that you're holding the HIDIOT so that the USB connector is at the top right, like this:

![Picture of HIDIOT board](/images/0_9a.jpg)

When we talk about the front of the board, we mean the side with the writing on it. The back is the side without any writing.

We solder the smallest parts first, then the bigger parts at the end. It should take 30-45 minutes to build in total depending on whether or not you've soldered before.

> Always remember to stay safe when soldering. Use a ventilated space, wear safety goggles if possible and **never** touch the hot end of the iron.

### Soldering R1 - R4

![](/images/r1-r4.jpg)

The resistors are what we call passive components. They're unpolarized, which means they don't care which way round they go. On the bottom of the board there's space for four resistors, called R1 through R4. It's generally tidier to keep them oriented the same way, but you can put the resistors in any direction you like. After all, it's *your* HIDIOT.

Resistors restrict the flow of electric current. They stop your HIDIOT from overheating. Resistors R1 and R2 restrict the amount of current flowing around the USB data lines used for communication with a computer over USB, and make it's resistance match the connecting USB cable.
R3 limits the amount of current the power LED can draw, and R4 limits current flow to LED1. LEDs are generally greedy and will gobble up all the current they can, so it's important to stop them from doing that. This also stops them from burning out.

Start by sliding the legs of the 68 ohm resistors (it's the 4 ones with the same colour band) through the front of the board. Once the resistors are touching the board, bend the legs back on the other side, then flip the board over so the back side is facing up, like this:

![](/images/hidiot_resistor_pins.jpg)

Now you can solder the resistors to the board. Apply the heat first, then the solder. Feed the solder in as it melts until you have a nice full joint, then take the remaining solder away. There are 8 contacts, so you get 8 attempts. If you get it slightly wrong, or it looks ugly, don't worry.

> Try not to leave the soldering iron on the board for too long. The HIDIOT board is extra thick, so you can leave the soldering iron on longer than usual without damaging it, but if you're struggling, take the iron off the board, let it cool down for 10 seconds and try again.

If you're lucky you'll have a nice smooth semicircle over the hole, touching the copper and a metal piece poking out of the top. More likely, you'll have a big glob of solid metal with a spiky bit. That's ok. We designed this for beginners! We call the metal spiky bits leads.

If you have a pair of tin snips, you can trim the leads so that the solder is more or less flush with the board. Just remember to wear safety glasses and cover the board with something while snipping. Nobody likes sharp flying metal bits!

Once you have the resistors soldered in and snipped, take a good look at your handiwork. Nice job! Lets try some [diodes](/building_a_hidiot/diodes_caps_and_dips/) next!
