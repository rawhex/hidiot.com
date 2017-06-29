---
title: How to solder a component
category: Building a HIDIOT
order: 2
---

Building a HIDIOT is easy. We designed it so that it's almost impossible to get wrong. Take your time, and if you're stuck, ask our community on [Reddit](https://www.reddit.com/r/hidiot/).

> This project involves soldering. Always supervies children when soldering, especially if they've never tried before. Parents should solder first, then let children solder parts under adult supervision. **Never** let children near hot soldering irons unsupervised.

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

{% youtube Qps9woUGkvI %}

Soldering the components on your HIDIOT is easy, even if you've never soldered before. Follow these 10 steps:

1. Put your part through the circuit board's holes.
2. Bend the metal legs back so it doesn't move.
3. Flip it upside down.
4. Make sure you're holding the cold end of the soldering iron!
5. Heat up the area you want the solder to flow through with the soldering iron's hot end.
6. Apply the solder to the area you want to join.
7. The solder will melt, then fill the hole.
8. Pull away the solder.
9. Pull away the soldering iron.
10. Snip the legs away with a pair of tin snips.

If you don't have tin snips you can use scissors. Make sure you hold one end of the metal you're snipping to stop it flying around.

Don't worry if this sounds a little too much to start with. Gwendoline at iFixit has a good video to take you through the basics. 

{% youtube UpVx4wGukRc %}

> If you still feel unsure about soldering, it's worth looking at some videos on YouTube. You can always buy some protoboard and LEDs to practice with.

## Building the HIDIOT

There's a good order to build the HIDIOT. If you're happy using helping hands, the order doesn't matter! If you don't have or use a pair of helping hands you'll want to follow this order.

> If you find soldering difficult, switch off your soldering iron, get some fresh air and come back to it later. Try to complete a section at a time if you can, but if you can't, don't worry. Even if you only solder one component a week, you're getting closer to the finish line.

We'll assume that you're holding the HIDIOT so that the USB connector is at the top right, like this:

![Unassembled board](/images/1_0.jpg)

When referring to top, bottom, left, and right we expect you to hold the HIDIOT as in the photo.

When we talk about the front of the board, we mean the side with HIDIOT 1.0 written on it. The back of the board is the other side.

We solder the smallest parts first, then the bigger parts at the end. It should take 30-45 minutes to build in total depending on whether or not you've soldered before.

> Always remember to stay safe when soldering. Use a ventilated space, wear safety goggles if possible and **never** touch the hot end of the iron.

### Soldering R1 and R2

![68 ohm resistors](/images/r1-r2.jpg)

The resistors are what we call passive components. They're unpolarized, which means they don't care which way round they go. On the bottom of the board there's space for four resistors, called R1 through R4. It's generally tidier to keep them oriented the same way, but you can put the resistors in any direction you like. After all, it's *your* HIDIOT.

Resistors restrict the flow of electric current. They stop your HIDIOT from overheating. Resistors R1 and R2 limit current on the lines used to talk to your computer. The also make the HIDIOT's impedence match the connecting USB cable.

Start by sliding the legs of the 68 ohm resistors through the front of the board. In case you aren't sure, the 68 ohm resistors have a blue band. Once the resistors are touching the board, bend the legs back on the other side, then flip the board over so the back side is facing up, like this:

![Resistor pins through board holes](/images/hidiot_resistor_pins.jpg)

Now you can solder the resistors to the board. Apply the heat first, then the solder. Feed the solder in as it melts until you have a nice full joint, then take the remaining solder away. There are 4 contacts, so you get 4 attempts. If you get it slightly wrong, or it looks ugly, don't worry. We can fix it later.

> Don't leave the soldering iron touching the board for more than 15 seconds. If you're struggling to make a join, take the iron off the board, let the board cool down for 10 seconds and try again.

If you're lucky you'll have a nice smooth dome over the hole, touching the copper and a metal piece poking out of the top. More likely, you'll have a big glob of solid metal with a spiky bit. That's ok. We designed this for beginners! We call the metal spiky bits leads.

![R1 and R2 soldered to the board](/images/r1-r2-soldered.jpg)

> Ideally you want a small dome that touches the top of each hole, but don't worry if you don't have one. Just remember that it's a lot like hot glue. As long as there's contact and parts don't wiggle, it'll probably work fine. If you're stuck, post a photo to our [community reddit](https://reddit.com/r/hidiot/) and ask for a second opinion.

If you have a pair of tin snips, you can trim the leads so that the solder is more or less flush with the board.

> Remember to wear safety glasses and hold the metal you're snipping to stop it from hurting anyone. Nobody likes sharp flying metal bits!

### Soldering R3 and R4

The next two resistors are the 330 ohm R3 and R4 resistors. These go on either side of the R1 and R2 resistors you just soldered.

R3 limits the amount of current the power LED can draw. R4 limits current flow to LED1. LEDs are greedy and will gobble up all the current they can. Resistors stop them from doing that. They also stop them from burning out.

> If this is your first HIDIOT, then you should solder all the components. R3 and R4 are only needed if you're going to solder the LEDs. If you're not using the LEDs, you don't need to solder R3 and R4.

![330 Ohm resistors](/images/r3-r4.jpg)

The R3 and R4 resistors have an orange band and look like the ones in this picture above. Solder the resistors to the R3 and R4 points on the board. Remember, they don't mind which way round they are. It looks nicer if the gold band is on the same side of the board as R1 and R2.

> If you have your own LEDs you'd like to use, you can use Ohm's Law to work out what value resistor you'll need. [Evil Mad Scientist](http://www.evilmadscientist.com/2012/resistors-for-leds/) (No relation to Steve) can help you here.

### R5

![1.5k Ohm resistor](/images/r5.jpg)

R5 is a 1.5k ohm resistor. R5 tells the USB host that the HIDIOT is a a low speed USB device. It’s the only resistor that looks different to the other 4 you soldered earlier.

Like the other resistors, R5 doesn't care about which way round it is. R5 goes above the Tiny85-20-DIP socket, opposite R1. When soldered, your board should look something like this.

![R1-R5 soldered](/images/five-resistors.jpg)

Once you have your first four resistors soldered in and snipped, take a good look at your handiwork. Nice job!

> If this is your first time soldering, now would be a good time to have a break. Switch off your soldering iron if you're not going to use it. Have a nice refreshing drink before carrying on. When you come back you'll find soldering should start to get easier.

When you get back, we'll solder [diodes](/building_a_hidiot/diodes_caps_and_dips/), capacitors and sockets!
