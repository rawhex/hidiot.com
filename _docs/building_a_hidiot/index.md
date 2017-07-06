---
title: Are you ready?
category: Building a HIDIOT
order: 1
---

Normally you'd start a project by building it on breadboard. In our case, we're going to jump straight in and build a finished product on a Printed Circuit Board (PCB). When finished, your HIDIOT  will be as professional as the PCB in your TV remote, mobile phone or PC! When you’re done, you should  have something that looks like this: 

![Finished HIDIOT](/images/hidiot_ready.jpg)

> If you're building a HIDIOT prototype, go [here](/prototypes/). Otherwise stick with us.

If you've never soldered before, don't worry. We designed the HIDIOT especially for people who've never soldered before. We'll guide you through the safety precautions, some soldering basics and get you up and running in no time. The HIDIOT uses an extra-thick PCB with spaced out components out to make it harder to damage if things go wrong. Make sure you follow the  tutorial, and if you get stuck, ask our [community](https://www.reddit.com/r/hidiot/) for help.

This tutorial contains 3 parts:

* [How to solder a component](/building_a_hidiot/how_to_solder_a_component/) *(10-20 minutes)*
* [Diodes, Caps and Dips](/building_a_hidiot/diodes_caps_and_dips/) *(10-15 minutes)*
* [Finishing up](/building_a_hidiot/finishing_up/) *(10-15 minutes plus optional follow-on activities)*

Before you build your HIDIOT, lets check a few things first.

### Before You Start

First we need to make sure you have all the kit you'll need to build your HIDIOT. To build a HIDIOT, you need the following:

* A <a target="_blank" href="https://www.amazon.co.uk/gp/product/B01186R3AE/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B01186R3AE&linkCode=as2&tag=rawhex-21&linkId=23048d62d8d6584196ed08fed27e88fc">Soldering Iron</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B01186R3AE" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
* A <a target="_blank" href="https://www.amazon.co.uk/gp/product/B0001K9S3O/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B0001K9S3O&linkCode=as2&tag=rawhex-21&linkId=efba3e4ebc6220f086b7b1400b0f208c">Soldering mat</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B0001K9S3O" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> (Make sure it's Asbestos free)
* Some <a target="_blank" href="https://www.amazon.co.uk/gp/product/B000LFTN1G/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B000LFTN1G&linkCode=as2&tag=rawhex-21&linkId=5e848fb8701305e2d5e55dfd8200cb25">solder</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B000LFTN1G" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> 
* A HIDIOT kit (very important!)
* Some <a target="_blank" href="https://www.amazon.co.uk/gp/product/B000TGJSWG/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B000TGJSWG&linkCode=as2&tag=rawhex-21&linkId=ed2b0d1db3ee658673ddf58e910637fb">PCB snips</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B000TGJSWG" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> (Aidan uses these, but there are others available for less)
* <a target="_blank" href="https://www.amazon.co.uk/gp/product/B000LFXPXI/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B000LFXPXI&linkCode=as2&tag=rawhex-21&linkId=cf962b77398269d0cc6e08edf36fdb46">Safety goggles</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B000LFXPXI" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

If your Soldering iron doesn't come with a stand, you'll need somewhere safe to put it while it's hot. You'll also need a way to wipe off excess solder. Most soldering irons come with a sponge, but Steve swears by using damp toilet paper folded over itself on top of the sponge.

Optionally, you might want to get a <a target="_blank" href="https://www.amazon.co.uk/gp/product/B00CFY4V9A/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B00CFY4V9A&linkCode=as2&tag=rawhex-21&linkId=8f768a392dc6c64a53742a6c41366ad8">vice clamp</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B00CFY4V9A" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> or a pair of <a target="_blank" href="https://www.amazon.co.uk/gp/product/B001BMSBD4/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B001BMSBD4&linkCode=as2&tag=rawhex-21&linkId=9774a53c666afdbd829d2c8a8f6fdf09">helping hands</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B001BMSBD4" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> to help hold the PCB in place. You don't need these to build the HIDIOT, but they are quite useful to have around.

If you make mistakes and need to desolder any parts, a <a target="_blank" href="https://www.amazon.co.uk/gp/product/B000LFTN4S/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B000LFTN4S&linkCode=as2&tag=rawhex-21&linkId=7d45b8cb650ed98a2a2f1a4e336b3ab0">solder sucker</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B000LFTN4S" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> and some <a target="_blank" href="https://www.amazon.co.uk/gp/product/B00424MWHO/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B00424MWHO&linkCode=as2&tag=rawhex-21&linkId=d294755f6b648abbdf8b8ac25693d471">solder wick</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=rawhex-21&l=am2&o=2&a=B00424MWHO" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> will help clean things up. Just remember to only snip the legs from a part when you know it's correctly soldered.

Finally and most importantly when building your HIDIOT, make sure you have a well ventilated space. The solder often gives off fumes that are bad for you. Just remember to keep a window open and try to avoid solder fumes where you can.

> Soldering iron burns are painful and can cause permanent scarring. Always make sure you keep your soldering iron away from anything that could hurt someone or cause a fire.

Now we know what we need lets take a look at what's in the HIDIOT. Take your HIDIOT pack out of the Anti-static bag and lay out the parts on a table. You want to make sure that what you have matches the picture below.

![HIDIOT parts](/images/hidiot_parts_small.jpg)

If the picture looks a bit small there's a full size version [here](/images/hidiot_parts.jpg). The full size version also labels each part so you can see what each thing is. If it helps, print the full picture out and put the pieces on top.

You can also print this page out and tick off the parts as we go through the list below.

You should have (on the left half of the picture above, going left to right and top to bottom):

* 2x red LEDs
* 2x tact switches (you might call them buttons)
* 1x 1.5 KiloOhm resistor
* 1x 1N456A Diode
* 2x 3.6 volt Zener Diodes

And on the right side of the picture, you should have:

* 2x 330 Ohm resistors
* 2x 68 Ohm resistors
* 1x 8 pin IC DIP socket
* 1x ATTiny85
* 1x 0.1uF Capacitor
* 1x 4.7uF Capacitor

If your official HIDIOT is missing parts, send us an [email](mailto:support@rawhex.com) with as much information about your order as you can and we'll take care of it. If you bought a clone and are missing parts, please contact your vendor.

Do you have all your parts? Do you have your soldering iron ready? Ok, [lets go!](/building_a_hidiot/how_to_solder_a_component/)
