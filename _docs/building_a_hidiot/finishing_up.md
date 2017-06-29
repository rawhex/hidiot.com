---
title: Finishing up
category: Building a HIDIOT
order: 4
---
We're almost there. It's time to solder the big C2 capacitor and some tact switches, then you should be ready to start using your HIDIOT.

### C2, The Big Capacitor

![One 4.7uF capacitor](/images/c2.jpg)

C2 Is a 4.7uF Capacitor that smooths out large current ripples. It helps protect the HIDIOT from power spikes over USB. C2 is a different type of capacitor to C1. C2 Is an *electrolytic* capacitor. Like a battery, it uses an electrolyte inside the device. Because it uses an electrolyte, the capacitor is polarised. This means you must solder it the right way round on the board. 

The capacitor has a long grey strip that points to the negative (cathode) lead. On the board, the negative side is indicated on a board by the line next to the circle, as shown below.

![Cathode orientation](/images/c2_polarity.jpg)

> If the capacitor is soldered the wrong way round, it won't work. It could cause damage to your USB hub or even your computer. Make sure it's the right way round *before* you solder.

Put the part through the holes with the correct orientation. Before you bend the pins back, bend the capacitor over towards the DIP socket. This keeps your HIDIOT's profile low enough to fit in a pocket or wallet without bending anything.

![Capacitor close up](/images/cap_orientation.jpg)

The text on the capacitor should face the R2 and R3 resistors at the bottom of the board. When holding the HIDIOT with the USB connector in the top right, the grey strip should be facing upwards.

Once you're comfortable with the orientation, bend the legs and solder the part.

### Buttons (AKA Tactile Switches)

![Tacticle switches](/images/tact_switches.jpg)

You might call them buttons. In engineering and electronics, they're called tactile or *tact* switches. Our tact switches are used for you to provide input to the HIDIOT.

> If it's your first HIDIOT, you'll need tact switches for some of the tutorials. The HIDIOT will work without the tact switches. If you'd rather not put them in right now that's fine too.

Like C2 and the diodes (and our ATTiny85) the tact switches care about orientation. Unlike C2, the diodes and the ATTiny, there's only two ways the tact switches will fit, and either way is fine. Make sure they're properly pushed through and you're ready to solder them in.

### Initial Testing

![Board without ATTiny85](/images/no_chip.jpg)

By now you should be a seasoned pro at soldering. If you're building another HIDIOT, you'll manage to do it a lot more quickly. There's one thing missing, which is the brains of the device, the ATTiny85. We'll come to that in a moment.

When engineers build something, they test it to make sure that it works properly. We're going to do some basic testing to make sure our HIDIOT works correctly.

To test your HIDIOT, you'll need:

* Your HIDIOT
* A USB 2.0 Hub connected to a computer, or a USB charger

![Checking the underside](/images/underside_check.jpg)

Firstly we'll do a visual test. Flip the HIDIOT onto it's underside and take a look at your solder points. You want to make sure that the solder only touches the pins it's meant to touch. Solder on one pin must not touch a different pin.

> Solder that joins two separate points on the board together is called a *bridge*. This is bad and can permanently damage your computer if plugged in.

Here's DestroyerMariko fixing a bridge on some stripboard. (*Warning: DestroyerMariko is rather sweary in her video*).

{% youtube z0PFiGZKzL8 %}

To get rid of a bridge on the HIDIOT, heat up your soldering iron and drag it between the two bridging points. Use the dragging to pull the solder away from itself. You can then snip the excess solder off and the bridge should be gone. There are better approaches, but this one doesn't need extra kit.

> If you have a bridge you can't get rid of, you can use solder wick to absorb solder stuck to the board.

![HIDIOT without ATTiny85](/images/no_chip.jpg)

Flip the board over and do inspect the front of the board. Check your polarised components are the right way round. If you're not sure, then check the orientation matches the picture above. If you're happy with your board, then it's time to move on.

Connect the HIDIOT to the hub or the charger and check to see if the power light comes on. Don't worry if it doesn't. It might just be that your LED was put in the wrong way round.

If the power LED doesn't light up, check the board's components with a multimeter to make sure power is flowing through. If you didn't snip the legs, you should just be able to go through each component, touching each components legs on the board.

If the light comes on, great! We're ready to add the ATTiny85.

### The ATTiny85

![ATTiny85](/images/attiny_alone.png)

Make sure your HIDIOT is unplugged, and lets get the brains installed. Without the ATTiny85, our HIDIOT is little more than a dumb circuit.

The ATTiny85 is the 8-pin chip and (hopefully) the last piece that hasn't been connected to the board.

Remember that circle in the rectangle on the board, where you put the DIP socket?

![DIP socket location](/images/dip.jpg)

There's also a circle on the ATTiny chip. That's why the dip switch has the notch on the one side. The notch is supposed to be on the same side as the circle on the chip. The circle on the chip is supposed be the same way round as the circle on the board.

Pop your chip in and looking across from the bottom of the board it should look like this:

![ATTiny85 on board](/images/hidiot_ready.jpg)

Note the row of resistors on the bottom, the USB connector on the top and that the chip's circle is on the bottom left. If yours matches, it's the right way round. If not, take it out, turn it around and put it back in.

### Powering it all up

Plug your HIDIOT back into your hub or USB charger and you should see the power light come on. Hold your finger over (but don't touch) the ATTiny85 for a few seconds. 

If it's hot, then unplug the HIDIOT from the USB connection and let it cool down. Make sure the ATTiny is seated in the socket the right way around and try again.

If it's not hot, it looks like your HIDIOT is working and is waiting for you to give it something to do! 

### What To Do Next

Have a think about what you've done so far. Which bits are more interesting to you, and which bits are less? It's ok if you're not sure yet.

Also if you haven't already, it's definitely high five time. You've just built a computer from the components up, and you know what each component on the board is. Go back through the descriptions and have a look at the components to make sure... Ok, now you know what each component on the board is... High five time!

Why is it high five time? Because most people go their entire lives only using the computers they buy off the shelf. Even people that build PCs for a living rarely, if ever break out a soldering iron. You're in a special club now of people who build their own hardware from scratch, and it's about to get a whole lot better.

Let that sink in for a moment. If you don't believe me, ask your friends how many have soldered their own circuit boards from scratch. Unless you built your HIDIOT in class at school, you can probably count them on one hand.

{% youtube H9pGbLJknDk %}

While you're basking in the glow of a job well done, you might want to look at how PCBs work.

When you're ready we'll install the software needed to start [cutting code](/cutting_code/index/) with the HIDIOT.