---
title: Electronics And You
category: Getting Started
order: 1
---

Welcome to the wonderful world of the HIDIOT. The HIDIOT is a computer that you build yourself from scratch. It allows you to explore the worlds of electronics, programming, microcontrollers, robots, the Internet and even radio, which is a lot for something so small!

By the time you finish these tutorials you'll be a fully fledged hardware hacker and maker, ready to build amazing projects of your own! These tutorials are designed to teach you how to build, program and get to grips with the HIDIOT so you can then create your own projects to do all kinds of fun things. From electric jewellery to monitoring the International Space Station, if you can imagine it, you can probably do it with a HIDIOT.

### What is Electricity?
When you turn on a light switch, it connects two pieces of metal together to form a complete loop, called a circuit. Electricity flows through the circuit to power up the light, just like water in your home's water pipes. When the light is turned off, the electricity can't jump across the gap, so the light stays off.

There are many types of lights that we use. Some are large lights, like light bulbs. These are filled with gas and have a metal inside that glows when the electricity flows through it. Others use other gases to make the gas itself glow. LEDs are used on everything from washing machines to helicopters to tell us that something is happening. LEDs are even used in very efficient light bulbs.

Whenever there's a power source connected to a circuit, electricity will flow. We call this flow the *electric current*. This is the same as when water flows through a river and we call the water flow a *water current*.

As long as one side of the power source (called the anode) is connected to the negative side (called a cathode) the electric current can flow through the circuit from positive to negative. Lets make a circuit and find out how electricity works for ourselves!

### Our First Circuit: Let There Be Light!
Engineers have an idea of what it is the thing they need to build should do. Usually there's a problem to solve. Our problem is pretty simple:

> It's too dark. It should be less dark.

To solve the problem, we're going to make light with electricity. Obviously we don't want it to be light all the time because we might want to sleep, so we need some way of switching the light on and off. Finally, we need a power source.

There are many ways to make light. There are light bulbs which you have in your home. There are LEDs that make bright light using very little power. There's fire, but we're not allowed to do that at Raw Hex anymore after Steve accidentally set his hair on fire.

We can't use a light bulb as it needs mains electricity, and mains electricity is dangerous. So we'll use an LED. If you have a HIDIOT kit, by luck you just happen to have two LEDs!

The next thing we need is a power source. A common CR2032 coin battery should do. These are used in watches and some remote controls and are easily found in supermarkets.

Finally we need a way to switch the circuit on and off. We'll use a small piece of paper (about 2.5cm wide and 2.5cm long, or roughly 1 inch wide and 1 inch long).

Just so we know what we need, here's a list of parts:

* A CR2032 Coin battery
* An LED
* A small piece of paper

If you've bought a HIDIOT learning kit, you'll already have the LED and resistor. If not, you'll need to find the parts yourself. The HIDIOT kit contains two LEDs, either one will do.

> **Only** use a 3 volt CR2032 battery. Anything else may burn out the LED, or may even cause things to get very hot, unsafe, possibly explosive. If in doubt, don't do it.

Lets start by looking at our LED. An LED has a blob on the top (in your case, probably coloured red) and two long metal legs, one longer than the other. The long leg is the positive leg, called the anode. The short leg is the negative leg, called the cathode. When electric current flows through the LED, a small amount of the electricity is converted into light. The rest then goes around the circuit.

> LEDs are greedy, and will eat up as much current as they can, but the more current they absorb, the hotter they get. This is why you must only use the CR2032 battery, as the CR2032 doesn't provide enough current for the LED to overheat.

Our piece of paper can be quite small and goes on the negative side of our battery. We then put the LED's cathode on top of the piece of paper, and the anode on the positive side of the battery.

All set? Let's turn on the light by pulling out the piece of paper and pressing the LED legs and battery together with your thumb and forefingers.

If all goes well the LED should glow red. If it didn't work, try swapping the LED legs around. If that doesn't work, try the other LED in your HIDIOT kit, and try another CR2032 battery.

So what just happened? Believe it or not, what you've just experienced is almost the same as how the light switch works in your house. Our piece of paper stops the electrical current from flowing around the circuit. When you pull away the paper it's the same as turning on a light switch. The circuit is completed, electricity flows and the LED turns some of the electric current into light. The electric current continues out of the shorter leg and into the battery's cathode.

We know the electrical current flows through the LED and makes it light up, but *how* does it work? What's pushing the current along? To understand this we need to understand four ideas about how electricity works.

---

### 4 Things About Electricity You Need To Know

#### Electrons
All of the things that we touch and experience are made of something we call *matter*. Matter is made of tiny particles that are so small we can't even see them. We call these *atoms*. Atoms themselves are made up of even smaller particles, one of which is called an *electron*. Electrons are negatively charged particles that orbit around atoms, like planets orbiting the sun.

When we apply energy to atoms, they start to get quite excited. When some atoms get excited, the electrons start to jump from one atom to the next. These types of atoms are called *conductors*, because they conduct electrical current. These atoms are normally found in metals. 

Atoms that don't let the electrons jump are called *insulators*. Common insulators include rubber and wood.

To make the electrons in a conductor move, all we need to do is give them a push with some energy. In electricity, we call this force Voltage.

Lets take a look at our circuit again. Pop the paper in between one of the LED legs and the battery. Now have a think about our electrons. The paper doesn't conduct electricity, so the electrons can't be passed on. That's why the LED doesn't light up.

Now pull out the paper. The light comes on *because the electrons are moving* through the circuit. When the circuit is fully connected, we call this a *closed* circuit. When the circuit is disconnected or something blocks part of the circuit from being connected, we call this an *open* circuit.

#### Voltage
Voltage is the force the pushes the electrons along. Imagine you're at a birthday party, playing pass the parcel. Everyone stands in a line passing the parcels along to the music. The parcels are the electrons. As the music goes faster, the parcels are passed more quickly. When the music stops, the parcels stop moving. At the party, in electrical terms, the voltage is the music. The people in the line are the conductive atoms.

Voltage is measured in volts. Our CR2032 battery supplies 3 volts, which is enough to make the LED come on. The HIDIOT uses a mixture of 3.6 and 5 volts in different parts of the circuit.

Lets take a look at our circuit again and try to understand the party going on between your fingertips. Pop the paper in between an LED leg and the battery.

The music isn't playing.

This is the song that the atoms are getting excited about:

> Derp! Derp! Derp!
> Come on and pass electrons.
> Derp! Derp! Derp!
> We're positively charged!

Pull out the paper and try to imagine the electrons being passed from one atom to the next in beat to the music. You can sing it if you like.

With low voltages like our coin battery circuit, atoms are a bit slow and sleepy. If you were too excited, put the paper back in, then pull it out and try again but slow and sleepy.

At 5 volts, it's pretty upbeat party music. At 9 volts the atoms are getting a real workout and at 12 volts they start getting pretty sweaty after a while.

> Mains electricity can be 110, 220 or 240 volts depending on where you live. Never play with mains electricity. The atoms get so excited they get bruised and burned, and mains electricity could really hurt or even kill you.

Sometimes being slow and sleepy is perfectly fine. Building things that do exactly what they're meant to do, in exactly the way they're meant to do it is called *engineering*. We built a circuit to make the light come on, and it works! You're now officially a junior engineer!

#### Resistance

If voltage pushes electrons along, *resistance* does the opposite. It restricts the flow of electrons, reducing the current in the process. Imagine a hose pipe being used to water a gardern. If we pinch the hose pipe, there's less space for the water to flow through. Turning the tap up to push more water out is the same as increasing the voltage, and more water flows through even though you're still squeezing the hosepipe the same way.

Electrical resistance works the same way as water resistance. We measure resistance in *Ohms*.

The most commonly used electrical component we use to manage resistance is called a *resistor*. You'll find some in your HIDIOT kit. They're the bits that have the multicoloured stripes and a gold band at one end.

#### Current

We already know a little bit about current. We know it's much like the flow of a river but used when talking about electricity. We know that the electrical current flows from the positive side (the anode) to the negative side (cathode) of a circuit. A strong current means there are a lot of electrons flowing through the circuit. When you increase the voltage, you increase the current.

Weirdly, the electrons themselves flow in the opposite direction from negative to positive. This is because of some fairly complicated physics. All we need to know is that when we talk about electric current, we talk about it flowing from positive to negative.

#### Putting it all together

Now we know about electrons, voltage, resistance and current we can understand what happens when we pull the paper away from the circuit. Set up your circuit again so you can play along.

We know that our circuit is made of *conductors* - materials that conduct electricity and allow the electrons to move around when we apply energy.

We know that metal is a good conductor because our circuit works and is mostly metal.

Paper is a bad conductor of electricity. When we put it between an LED leg and the battery, the light doesn't come on because the paper won't pass the electrons on, blocking the flow of electrons and electrical current.

When we pull the paper away, the LED leg makes contact with the battery and completes the circuit. At this point we can say the circuit is *closed*.

The voltage in the battery pushes the electrons around the circuit. The electrical current flows from the positive side to the negative side.

The LED greedily gobbles up all of the electrical current it can consume to emit red light.

The electrical current flows because our circuit is *closed*. If we push the paper back in or pull an leg away from the circuit, the flow stops because the circuit is now *open*.

---

### But Where Does It All Come From?

We know how the circuit works. We also know why the circuit works. The battery applies voltage to the circuit, to make the electrons jump along. The current then flows through the circuit and the LED comes on as the electrons pass through.

We set out to build a circuit that causes a light to come on when we want it to, and we have that. That's engineering. But there's a question that we still need to answer. What's in the battery that provides the voltage, and can we find it anywhere else?

So far we've built something (our circuit). That's engineering. There's another type of engineering where we pull things apart and see how they work. This is called reverse engineering.

#### Reverse Engineering A Battery
The first thing we can do is look at how batteries work in general. Our coin battery is called a lithium battery. Lithium batteries normally have a lithium anode, a separator and a manganese dioxide cathode. Lets take a look inside a coin battery.

![Disassembled CR2032 battery](/images/CR2032_disassembled.jpg)

> **Never** take a battery apart. It's extremely dangerous and could burn or even be fatal.

From left to right, the different parts are:

1. The negative inner cup
2. Lithium anode
3. Separator
4. Manganese dioxide cathode
5. A metal grid, used as a current collector
6. Positive side metal casing

Below this is a plastic insulation ring used within the battery.

The two main parts of the battery are the two different metals with a separator between them. We're missing something because we've opened it up.

If we look at other batteries, we see that they're often based on two metals. NiCad batteries are made with Nickel and Cadmium. Alkaline batteries are often made with Zinc and Manganese Dioxide. Alkaline batteries are called alkaline batteries because they have an alkaline electrolyte made of Potassium Hydroxide.

But wait. What's an electrolyte?

An electrolyte is a paste or liquid that can conduct an electric current. Electrolytes contain atoms that either have too many or two few electrons, called ions. The ions float around in the electrolyte either being bloated or hungry for electrons.

If you remember earlier, our electrons move around the circuit and the current flows in the opposite direction. It's the current that causes the LED to light up, but the current is produced by the movement of the electrons.

When a conductor is exposed to an electrolyte a chemical reaction occurs. Zinc interacts with the electrolyte and gives up some of it's electrons. This leaves holes in the zinc for electrons to fill if they come from elsewhere. This makes Zinc an anode.

When copper is exposed to an electrolyte, it attracts electrons. This makes the copper have too many electrons. This makes Copper a cathode.

If we can link the Copper cathode to the Zinc anode via our circuit then the extra electrons will travel from the cathode to the anode through our circuit, to fill the holes and light up our LED along the way. To keep the current flowing we need to produce new holes on the anode, and new electrons on the cathode. That means the two metals need to be connected to the electrolyte, but not directly to each other (except through our circuit).

We can actually build our own battery using fruit as the electrolyte. Acids in the fruit juices allow the electrons to move around. Apples, Lemons and Potatoes all work rather well, but you'll need a lot of fruit segments to light up the LED. The electricity is generated by a chemical reaction in the nails. It's not stored in the fruit juice. A really great overview of fruit-based batteries can be found [here](http://how-things-work-science-projects.com/lemon-battery-project/).
