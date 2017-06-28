---
title: Finishing up
layout: prototype
category: Building a HIDIOT
order: 4
---

### C2, The Big Capacitor

![One 4.7uF capacitor](/images/0_9_c2_on_board.jpg)

C2 Is a 4.7uF Capacitor that smooths out large current ripples. It works with C1 to ensure that the board doesn't get damaged by spikes caused by devices connecting and disconnecting over USB.

C2 is a different type of capacitor to C1. C2 Is an *electrolytic* capacitor. This means it has to be put the right way round on the board. A long grey strip runs down one side of the capacitor to the cathode leg (negative), and the other leg is the anode (positive).

The negative side is normally indicated on a board by the line next to the circle, as shown below.

![Cathode orientation](/images/0_9a_c2.jpg)

> If the capacitor is soldered the wrong way round, it won't work. It could cause damage to your USB hub or even your computer. Make sure it's the right way round *before* your solder.

Put the part through the holes with the correct orientation, but before you bend the pins back, bend the capacitor over to your left. When viewed from the top right, it should look something like the below:

![Capacitor close up](/images/0_9_cap_orientation.jpg)

Note the PWR LED is on the right, and the 4 68 Ohm resistors on the bottom.

When holding the HIDIOT with the USB connector in the top right, the grey strip should be facing upwards, or possibly away from you.

Once you're comfortable with the orientation, bend the legs and solder the part.

### Buttons (AKA Tactile Switches)

![Tacticle switches](/images/0_9_tact_switches.jpg)

You might think of these as buttons, but in engineering and electronics, we call them tactile switches, or tact switches for short. Our tact switches are used for you to provide input to the HIDIOT. These components are optional, and can be put in now, later or not at all.

> If it's your first HIDIOT, you'll need tact switches for some of the tutorials. If you'd rather not put them in right now, that's fine too.

Like C2 and the diodes (and our ATTiny85) the tact switches care about orientation. Unlike C2, the diodes and the ATTiny, there's only two ways the tact switches will fit, and either way is fine. Make sure they're properly pushed through and you're ready to solder them in.

### Initial Testing

![Board without ATTiny85](/images/0_9_no_chip.jpg)

By now you should be a seasoned pro at soldering. If you're building another HIDIOT, you'll manage to do it a lot more quickly. There's one thing missing, which is the brains of the device, the ATTiny85. We'll come to that in a moment.

When engineers build a new electronics platform, they test it extensively to make sure that it works the way it's meant to. We're going to do some basic testing just to make sure that it's working correctly.

To test your HIDIOT, you'll need:

* A USB 2.0 Hub connected to a computer, or a USB charger

Connect the HIDIOT to the hub or the charger and check to see if the power light comes on. Don't worry if it doesn't. It might just be that your LED was put in the wrong way round.

If the power LED doesn't light up, check the board's components with a multimeter to make sure power is flowing through. If you didn't snip the legs, you should just be able to go through each component, touching each components legs on the board.

If the light comes on, great! We're ready to add the ATTiny85.

### The ATTiny85

![ATTiny85](/images/0_9_attiny_alone.png)

Make sure your HIDIOT is unplugged, and lets get the brains installed. Without the ATTiny85, our HIDIOT is little more than a dumb circuit.

The ATTiny85 is the 8-pin chip and (hopefully) the last piece that hasn't been connected to the board.

Remember that circle in the rectangle on the board, where you put the DIP socket?

![DIP socket location](/images/0_9a_dip.jpg)

There's also a circle on the ATTiny chip. That's why the dip switch has the notch on the one side. The notch is supposed to be on the same side as the circle on the chip. The circle on the chip is supposed be the same way round as the circle on the board.

Pop your chip in and looking across from the bottom of the board it should look like this:

![ATTiny85 on board](/images/0_9_attiny.jpg)

Note the row of resistors on the bottom, the USB connector on the top and that the chip's circle is on the bottom left. If yours matches, it's the right way round. If not, take it out and put it back in.

### Powering it all up

Plug your HIDIOT back into your hub or USB charger and you should see the power light come on. If you're using an official HIDIOT, LED1 should start blinking after a few seconds. If you're using a clone, the manufacturer may or may not have put anything on there, or flashed it at all.

If you don't see a blinking light after 5 seconds, hold your finger over the top of the ATTiny85. If it's hot, then unplug the HIDIOT from the USB connection and let it cool down. Make sure the ATTiny is seated in the socket the right way around and try again.

### What To Do Next

Have a think about what you've done so far. Which bits are more interesting to you, and which bits are less? It's ok if you're not sure yet.

Also if you haven't already, it's definitely high five time. You've just built a computer from the components up, and you know what each component on the board is. Go back through the descriptions and have a look at the components to make sure... Ok, now you know what each component on the board is... High five time!

Why is it high five time? Because most people go their entire lives only using the computers they buy off the shelf. Even people that build PCs for a living rarely, if ever break out a soldering iron. You're in a special club now of people who build their own hardware from scratch, and it's about to get a whole lot better.

Let that sink in for a moment. If you don't believe me, ask your friends how many have soldered their own circuit boards from scratch. Unless you built your HIDIOT in class at school, you can probably count them on one hand.

While you're basking in the glow of a job well done, you might want to look at [how PCBs work](https://www.youtube.com/watch?v=H9pGbLJknDk).
