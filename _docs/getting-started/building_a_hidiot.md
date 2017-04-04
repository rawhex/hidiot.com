---
title: Building A HIDIOT
category: Getting Started
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
* A helping hand (optional)
* A soldering mat or heat resistance surface
* A well-ventilated space
* Safety goggles for anyone near the soldering area

If you're unfamiliar with soldering, you should also get:

* A piece of stripboard or veroboard to practice with
* Some practice components (any will do, spare resistors and LEDs are good)

## What Is Soldering?

Soldering is a way of sticking two things together with a metal (called solder). It's a bit like hot glue, but hotter and with molten metal.

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

Don't worry if this sounds a little too much to start with. [Gwendoline at iFixit](https://www.youtube.com/watch?v=UpVx4wGukRc) has a good video that goes through the basics, as does [oneTesla](https://www.youtube.com/watch?v=Qps9woUGkvI). If you've never soldered before, it's worth looking at some videos on Youtube, and getting a piece of stripboard (which is just a board with a bunch of holes in it), and some components you don't mind losing just to try it out before you start on your HIDIOT.

Once you're happy with your soldering on a stripboard, you're ready to start. If you haven't soldered before and don't have a stripboard, you might want to try one of our workshops.

## Building the HIDIOT

There's a good order to build the HIDIOT. If you're happy using helping hands, the order doesn't matter! If you don't have or use a pair of helping hands you'll want to follow this order.

When we talk about bottom, left, right on the board, we're assuming that you're holding the HIDIOT so that the USB connector is at the top right, like this:

![Picture of HIDIOT board](/images/0_9a.jpg)

When we talk about the front of the board, we mean the side with the writing on it. The back is the side without any writing.

We solder the smallest parts first, then the bigger parts at the end. It should take 30-45 minutes to build in total depending on whether or not you've soldered before.

> Always remember to stay safe when soldering. Use a ventilated space, wear safety goggles if possible and **never** touch the hot end of the iron.

### Soldering R1 - R4

![](/images/r1-r4.jpg)

The resistors are what we call passive components. They're unpolarized and don't care which way round they go. On the bottom of the board there's space for four resistors, called R1 through R4. It's generally tidier to keep them oriented the same way, but you can put the resistors in any direction you like. After all, it's *your* HIDIOT.

Resistors restrict the flow of electric current. They stop your HIDIOT from overheating. Resistors R1 and R2 restrict the amount of current flowing around the USB data lines used for communication with a computer over USB, and make it's resistance match the connecting USB cable.
R3 limits the amount of current the power LED can draw, and R4 limits current flow to LED1. LEDs are generally greedy and will gobble up all the current they can, so it's important to stop them from doing that. This also stops them from burning out.

Start by sliding the legs of the 68 ohm resistors (it's the 4 ones with the same colour band) through the front of the board. Once the resistors are touching the board, bend the legs back on the other side, then flip the board over so the back side is facing up, like this:

![](/images/hidiot_resistor_pins.jpg)

Now you can solder the resistors to the board. Apply the heat first, then the solder. Feed the solder in as it melts until you have a nice full joint, then take the remaining solder away. There are 8 contacts, so you get 8 attempts. If you get it slightly wrong, or it looks ugly, don't worry.

> Try not to leave the soldering iron on the board for too long. The HIDIOT board is extra thick, so you can leave the soldering iron on longer than usual without damaging it, but if you're struggling, take the iron off the board, let it cool down for 10 seconds and try again.

### Diodes

![](/images/0_9_diodes.jpg)

Ok, next up we need to put in our diodes. Diodes do several different things, but mostly make sure only a certain amount of current and voltage flows in a certain direction. We use two types of diodes - two Zener diodes and a 1N456A.

USB uses a 5v power supply, but the data lines are rated for 0-3.6 volts. This is so that devices that need 5v can be powered over USB, but communication needs to happen at no higher than 3.6v or it might damage your computer. We use the Zener diodes to clip the voltage to 3.6v and stop it from frying your hub.

The 1N456A diode is used to protect your computer or USB hub from any major voltage spikes. Imagine you connect a motor to your HIDIOT that needs 12v. You use a regulator to provide the 12 volts but you drop a screw on the board, causing the 12v lines and the USB 5v positive line to touch. Without this diode, this *will* damage your computer. With this diode, it only *might* damage your computer.

> Your HIDIOT is designed to provide some protection from problems with itself, but not from mistakes you make building or using it. If in doubt, don't connect it to something you're not prepared to lose.

Because the diodes are used to manage the flow of electricity, we **must** make sure they are placed in the right direction. If we get them the wrong way round, they'll block the flow of current around the circuit and it won't work.

The Zener diodes are orange, with a little black line on the bottom. Both Zeners go at the top of the board, next to the breakout area. If you look very closely you'll see D1 and D2 in tiny writing. Put the Zeners through the holes in the front, with the black line on the bottom side.

Our 1N456A is more clearly labelled as D3 and is just to the right of where the Zeners go. The 1N456A is a black diode with a grey line at the bottom. Place the 1N456A through the D3 hole, so that the grey line is at the bottom. You should have something that looks like this:

![](/images/0_9_diodes.jpg)

Before you do any soldering, make sure you're happy with the orientation of the diodes. If you're unsure, take a picture of what you have and ask the [community](https://www.reddit.com/r/hidiot/) *before* you start soldering.

If you get it wrong, you'll have to desolder the diodes and start again. For this reason, if you're not sure about the diodes at this point you can check them with a multimeter or leave the legs unsnipped until it's all working.

### R5 and the C1 Transistor

![](/images/r5-c1.jpg)

Now we have our other resistors and the diodes in place, we're almost electrically complete!

R5 is a 1.5k ohm resistor, that is used to tell the USB host that they're dealing with a low speed USB device. It's the only resistor that doesn't look like the other 4 you put in earlier.

Our C1 transistor is the small yellow one, rated at 0.1uF. It's used in combination with the bigger transistor to smooth out power noise caused by USB connections. The small yellow one works for very quick changes in current and voltage (such as those caused by a short circuit), while the bigger transistor regulates slower but larger current ripples.

Neither R5 nor C1 care about which way round they go, so put them through their holes and bend the pins back. You might need a pair of long nosed pliers to pull C1 all the way through. It's fine if it's not all the way through, and you can bend it over if it's annoying.

Once they're through and the legs are bent back you should be ready to solder them in.

### The DIP Socket

![](/images/dip_on_board.jpg)

Our ATTiny85 uses a DIP socket to allow you to swap out ATTiny85 chips. If you build your own projects this is really handy for updating software and prototyping new projects with your HIDIOT.

The dip socket is the socket with 8 pins on one side and 8 holes in the other. There's a small notch on one-side.

![](/images/dip_socket.png)

On the board, we can see 8 holes and a circle inside a rectangle. The circle is on the bottom left.

![](/images/0_9a_dip.jpg)

The notch should be on the left hand side. If you get it wrong it's not going to affect things electrically, but you want it to be lined up correctly as the ATTiny needs to be put in the right way round.

Pop the dip socket into the holes with the notch on the same side as the circle, then flip the board over and solder the part to the board.

The DIP socket pins aren't very long, so it helps to push down on the board a little when soldering the board together.

> Solder a pin at one side of the board first, then the diagonal opposite. Now solder the other corners. Finally solder the middle pins one side at a time.

Soldering the corner pins first will ensure that the pins are fully through the board and make it easier to solder later on.

### LEDs

![](/images/led.png)

There are two LEDs on the board. One is a power LED that is always on when power is connected. The other is a programmable LED called LED1. Both of these are optional, but recommended for beginners.

LEDs are Light Emitting Diodes. Because they're diodes, they care about their orientation. The long leg of an LED is the positive (or **anode**) leg. The short leg is the negative (or **cathode**) leg. On the board we've put - and + symbols to show you the orientation of the LEDs.

![](/images/led_orientation.jpg)

As with any other diode, check your orientation before soldering, and if you're really sure, don't snip the legs.

If you make a mistake, the LEDs won't light up but the board will still work.

### C2, The Big Capacitor

![](/images/c2_on_board.jpg)

C2 Is a 4.7uF Capacitor that smooths out large current ripples. It works with C1 to ensure that the board doesn't get damaged by spikes caused by devices connecting and disconnecting over USB.

C2 Is a different type of capacitor to C1. C2 Is an *electrolytic* capacitor. This means it has to be put the right way round on the board. A long grey strip runs down the one side of the capacitor to the cathode leg (negative), and the other leg is the cathode (positive).

The negative side is normally indicated on a board by the line next to the circle, as shown below.

![](/images/0_9a_c2.jpg)

> If the capacitor is soldered the wrong way round, it won't work. It could cause damage to your USB hub or even your computer. Make sure it's the right way round *before* your solder.

Put the part through the holes with the correct orientation, but before you bend the pins back, bend the capacitor over to your left. When viewed from the top right, it should look something like the below:

![](/images/cap_orientation.jpg)

Note the PWR LED is on the right, and the 4 68 Ohm resistors on the bottom.

When holding the HIDIOT with the USB connector in the top right, the grey strip should be facing upwards, or possibly away from you.

Once you're comfortable with the orientation, bend the legs and solder the part.

### Buttons (AKA Tactile Switches)

![](/images/tact_switches.jpg)

You might think of these as buttons, but in engineering and electronics, we call them tactile switches, or tact switches for short. Our tact switches are used for you to provide input to the HIDIOT. These components are optional, and can be put in now, later or not at all.

> If it's your first HIDIOT, you'll need tact switches for some of the tutorials. If you'd rather not put them in right now, that's fine too.

Like C2 and the diodes (and our ATTiny85) the tact switches care about orientation. Unlike C2, the diodes and the ATTiny, there's only two ways the tact switches will fit, and either way is fine. Make sure they're properly pushed through and you're ready to solder them in.

### Initial Testing

![](/images/no_chip.jpg)

By now you should be a seasoned pro at soldering. If you're building another HIDIOT, you'll manage to do it a lot more quickly. There's one thing missing, which is the brains of the device, the ATTiny85. We'll come to that in a moment.

When engineers build a new electronics platform, they test it extensively to make sure that it works the way it's meant to. We're going to do some basic testing just to make sure that it's working correctly.

To test your HIDIOT, you'll need:

* A USB 2.0 Hub connected to a computer, or a USB charger

Connect the HIDIOT to the hub or the charger and check to see if the power light comes on. Don't worry if it doesn't. It might just be that your LED was put in the wrong way round.

If the power LED doesn't light up, check the board's components with a multimeter to make sure power is flowing through. If you didn't snip the legs, you should just be able to go through each component, touching each components legs on the board.

If the light comes on, great! We're ready to add the ATTiny85.

### The ATTiny85

![](/images/attiny_alone.png)

Make sure your HIDIOT is unplugged, and lets get the brains installed. Without the ATTiny85, our HIDIOT is little more than a dumb circuit.

The ATTiny85 is the 8-pin chip and (hopefully) the last piece that hasn't been connected to the board.

Remember that circle in the rectangle on the board, where you put the DIP socket?

![](/images/0_9a_dip.jpg)

There's also a circle on the ATTiny chip. That's why the dip switch has the notch on the one side. The notch is supposed to be on the same side as the circle on the chip. The circle on the chip is supposed be the same way round as the circle on the board.

Pop your chip in and looking across from the bottom of the board it should look like this:

![](/images/attiny.jpg)

Note the row of resistors on the bottom, the USB connector on the top and that the chip's circle is on the bottom left. If yours matches, it's the right way round. If not, take it out and put it back in.

### Powering it all up

Plug your HIDIOT back into your hub or USB charger and you should see the power light come on. If you're using an official HIDIOT, LED1 should start blinking after a few seconds. If you're using a clone, the manufacturer may or may not have put anything on there, or flashed it at all.

If you don't see a blinking light after 5 seconds, hold your finger over the top of the ATTiny85. If it's hot, then unplug the HIDIOT from the USB connection and let it cool down. Try putting the ATTiny in the other way around and try again.
