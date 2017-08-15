---
title: Diodes, Caps and Dips
category: Building a HIDIOT
order: 3
---

![Two Zener and one 1N456A diode](/images/diodes.jpg)

Now we need to solder our diodes. Diodes make sure only a certain amount of current and voltage flows in one direction. We use two types of diodes - a 1N456A (shown above in black) diode and two 3.6v Zener diodes.

> We also use LEDs, which are Light Emitting Diodes. We treat LEDs differently to normal diodes.

USB provides a 5v power supply, but communication is over lines running at 0-3.6 volts. This is mostly for compatibility with 5 and 3.3 volt components. The HIDIOT runs on 5 volts, but need to drop some connections to 3.6 volts to talk to the computer. The Zener diodes drop the voltage and stop the HIDIOT from damaging your computer when you plug it in.

The 1N456A diode protects your computer or USB hub from major voltage spikes.

> We designed the HIDIOT to protect your computer from itself in normal operation. It won't protect your computer from mistakes you make building or using it. If in doubt, don't connect it to something you're not prepared to lose.

Because diodes manage the flow of electricity, they **must** be placed in the right direction. If we get them the wrong way round, they'll block the flow of current around the circuit and your HIDIOT won't work.

The Zener diodes are orange, with a little black line on the bottom. Both Zeners go at the top of the board, next to the breakout area. If you look very closely you'll see D1 and D2 in tiny writing. Put the Zeners through the holes in the front, with the black line on the bottom side.

Our 1N456A is more clearly labelled as D3 and is just to the right of where the Zeners go. The 1N456A is a black diode with a grey line at the bottom. Place the 1N456A through the D3 hole, so that the grey line is at the bottom. You should have something that looks like this:

![Two Zener and one 1N456A diode](/images/diodes_on_board.jpg)

Before you do any soldering, make sure you're happy with the orientation of the diodes. If you're unsure, take a picture of what you have and ask the [community](https://www.reddit.com/r/hidiot/) *before* you start soldering.

If you get it wrong, you'll have to desolder the diodes and start again. If you're unsure of the diodes' orientation you can leave the legs unsnipped until it's working. It's going to be difficult to resolder the diodes once you've snipped the legs.

### The C1 Capacitor

![0.1uF capacitor](/images/c1.jpg)

With resistors and the diodes in place, we're almost electrically complete!

The C1 capacitor is the small yellow one, rated at 0.1uF. It's used in with the bigger capacitor to smooth out power noise caused by USB connections. The small capacitor deals with quick current and voltage changes. The bigger capacitor regulates slower but larger current ripples.

C1 doesn't care which way round it is, so put it through the rectangular hole below D3.

![C1 on a board](/images/c1_on_board.jpg)

You might need a pair of long nosed pliers to pull C1 all the way through. It's fine if it's not all the way through, and you can bend it over if it's annoying.

Once the legs are through and bent back you're ready to solder.

### The DIP Socket

![DIP socket on board](/images/dip_on_board.jpg)

Our ATTiny85 uses a DIP socket to hold the chip. This makes it easy to swap ATTiny85s from HIDIOT to final project and back.

The dip socket is the socket with 8 pins on one side and 8 holes in the other. There's a small notch on one-side. This notch tells electrical engineers which way round to insert a chip.

![DIP socket close up](/images/dip_socket.png)

On the board, we can see 8 holes and a circle inside a rectangle. The circle is on the bottom left.

![DIP socket location](/images/circle_on_dip.jpg)

The picture above shows both an empty board and a board with a chip on it. The circle shows the chip's preferred orientation.

The notch should be on the same side as the circle. It won't affect anything electronic if it's the wrong way around. The ATTiny85 gets very hot if it's the wrong way round. If this happens, power down the HIDIOT, let the chip cool down and turn it around before trying again. As long as you're fairly quick it should be fine.

Place the dip socket through the holes with the notch on the same side as the circle. With a finger on the top of the dip socket, flip the board over and push it onto the mat so the holes poke through.

The DIP socket pins aren't very long, so it helps to push down on the board a little when soldering the board together.

> Solder a pin at one side of the socket first, then the diagonal opposite. Now solder the other corners. Finally solder the middle pins one side at a time. Soldering the corner pins first keeps the socket from moving or falling off the board.

### LEDs

![LED close up](/images/led.png)

There are two LEDs on the board. One is a power LED that is always on when power is connected. The other is a programmable LED called LED1. Both of these are optional, but recommended for beginners.

LEDs are Light Emitting Diodes. Because they're diodes, they care about their orientation. The long leg of an LED is the positive (or **anode**) leg. The short leg is the negative (or **cathode**) leg. On the board we've put - and + symbols to show you the orientation of the LEDs.

![Anode and cathode orientation](/images/led_orientation.jpg)

As with any other diode, check your orientation before soldering. If you're really unsure, don't snip the legs. If you make a mistake, the LEDs won't light up but the board will still work.

Once you've done the LED1 LED, do the PWR LED on the other side of the board. Check the polarity matches the picture below to make sure you haven't got it the wrong way round.

![PWR LED Polarity](/images/led_pwr_orientation.jpg)

Ok, you're doing great! Not long to go now. Next we'll solder C2 and the two tact switches. If you haven't taken a break already, now would be a good time to do so. If you have, and you fancy another then you've already earned it! Just remember to switch off your soldering iron when it's not being used.

Once you're ready to carry on, [click here](/building_a_hidiot/finishing_up/) to go to the next section.
