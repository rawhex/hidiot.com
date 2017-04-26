---
title: Diodes, Caps and Dips
category: Building a HIDIOT
order: 3
---

![](/images/0_9_diodes.jpg)

Ok, next up we need to put in our diodes. Diodes do several different things, but mostly make sure only a certain amount of current and voltage flows in a certain direction. We use two types of diodes - two Zener diodes and a 1N456A.

> We also use LEDs, which are Light Emitting Diodes, but we pretend they're not really diodes for the purposes of our circuit.

USB uses a 5v power supply, but the data lines are rated for 0-3.6 volts. This is so that devices that need 5v can be powered over USB, but communication needs to happen at no higher than 3.6v or it might damage your computer. We use the Zener diodes to clip the voltage to 3.6v and stop it from frying your hub.

The 1N456A diode is used to protect your computer or USB hub from any major voltage spikes. Imagine you connect a motor to your HIDIOT that needs 12v. You use a regulator to provide the 12 volts but you drop a screw on the board, causing the 12v lines and the USB 5v positive line to touch. Without this diode, this *will* damage your computer. With this diode, it only *might* damage your computer.

> Your HIDIOT is designed to provide some protection from problems with itself, but not from mistakes you make building or using it. If in doubt, don't connect it to something you're not prepared to lose.

Because the diodes are used to manage the flow of electricity, we **must** make sure they are placed in the right direction. If we get them the wrong way round, they'll block the flow of current around the circuit and it won't work.

The Zener diodes are orange, with a little black line on the bottom. Both Zeners go at the top of the board, next to the breakout area. If you look very closely you'll see D1 and D2 in tiny writing. Put the Zeners through the holes in the front, with the black line on the bottom side.

Our 1N456A is more clearly labelled as D3 and is just to the right of where the Zeners go. The 1N456A is a black diode with a grey line at the bottom. Place the 1N456A through the D3 hole, so that the grey line is at the bottom. You should have something that looks like this:

![](/images/0_9_diodes.jpg)

Before you do any soldering, make sure you're happy with the orientation of the diodes. If you're unsure, take a picture of what you have and ask the [community](https://www.reddit.com/r/hidiot/) *before* you start soldering.

If you get it wrong, you'll have to desolder the diodes and start again. For this reason, if you're not sure about the diodes at this point you can check them with a multimeter and leave the legs unsnipped until it's all working. It's going to be difficult to resolder the diodes once you've snipped the legs.

### R5 and the C1 Capacitor

![](/images/r5-c1.jpg)

Now we have our other resistors and the diodes in place, we're almost electrically complete!

R5 is a 1.5k ohm resistor, that is used to tell the USB host that they're dealing with a low speed USB device. It's the only resistor that doesn't look like the other 4 you put in earlier.

Our C1 capacitor is the small yellow one, rated at 0.1uF. It's used in combination with the bigger capacitor to smooth out power noise caused by USB connections. The small yellow one works for very quick changes in current and voltage (such as those caused by a short circuit), while the bigger capacitor regulates slower but larger current ripples.

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

Ok, you're doing great! Not long to go now. We have C2 to solder in, and (optionally) the two tact switches (buttons to you and me). If you haven't taken a break already, now would be a good time to do so. If you have, and you fancy another then you've already earned it! Just remember to switch off your soldering iron when it's not being used.

Once you're ready to carry on, [click here](/building_a_hidiot/finishing_up/) to go to the next section.
