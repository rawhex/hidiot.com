---
title: Cracking the code 
category: Exploring Morse code
order: 2
---
 
![Picture of Samuel Morse, 1840](/images/sam_morse.jpg)

Samuel Morse was an American obsessed with the new field of electricity. Heartbroken that he didn't know about his wife's sickness and death while he was away painting a portrait, he invented the electric telegraph. The telegraph was the first way to send messages almost instantly from one place to another over a long distance. Previously, messages were sent by horserider or ship. The telegraph changed that, and with it the world.

His telegraph used a code that also allowed ships to send messages to the shore using anything from hand signals to whistles and reflective mirrors. With the right radio equipment you can hear people sending messages in modern international Morse code even today, over 170 years later.

Morse code has been used in all kinds of ways. The RMS Titanic, a famous unsinkable cruise liner used Morse code throughout it's maiden voyage, and Morse code was used by the radio operators to send a distress signal for help.

Prisoners of War have used Morse Code to blink secret messages in the hope that people will pick them up, and Morse Code is still used today across the world by amateur radio users. 

If you followed the mini project series in our last tutorial, you'll have built a program to blink numbers using the LED. We can use Morse code to blink out more useful messages. But to do this, first we have to learn how to understand Morse code.

### Getting to grips with Morse code

Morse code is used by ships to signal to shore with lights and mirrors, as well as via radio and traditionally over cables known as telegraphs. It uses two types of signal, the *dit*, a short on signal and a *dah*, an on signal 3 times longer than a dit.

The length of a signal is defined by something called a *unit*. A unit is just the length of a dit. All other signal lengths in Morse code are multiples of this unit length.

* A dit is a single unit long
* A dah is 3 units long
* The space between dits and dahs when signalling a letter or number is a single unit
* The space between letters is 3 units long
* A 7 unit space exists between whole words
* If someone makes a mistake and wants to delete the last word, they send 8 dits (with 8 spaces between the dits).

We can write morse code using dots (periods) for dits, and dashes (minus symbols) for dahs. For example, the letter 'S' can be represented as 3 dits, while the letter 'O' is 3 dahs.

	S: ...
	O: ---

If we want to spell out a whole word in morse code, we can use the dots and dashes to represent them. Lets spell out "HIDIOT".

	H: ...
	I: ..
	D: -..
	I: ..
	O: ---
	T: -
	
	HIDIOT: . . .   . .   - . .   . .   - - -   -   
	
Because replacing letters with dits and dahs can be quite painful to type, Samuel Morse looked at the popularity of letters in the alphabet when designing his code, and made the most common letters the shortest. He also structured letters and numbers in the form of a tree, making it easier to visualise.

![Morse code tree](/images/morse-tree.svg)

Although it looks a little complicated, the tree is very easy to use. Lets spell out the word "LOVE". To spell out the letter L, we start at the top, and follow the letter L to the bottom. As we go through each letter down the tree, we add a dit or a dah. If we go left, it's a dit (or a dot). If we go right, it's a dah (or a dash).

The nice thing about the tree is that if you want to get into Morse code, you can learn the characters in the order of how high they are in the tree, and you should learn the most common letters first.

To get the letter L, we have to go through the following letters:

	E - A - R - L
	LEFT - RIGHT - LEFT - LEFT
	DIT - DAH - DIT - DIT
	. - . .

This means that the letter L is 4 symbols long, going left, right, left, left we get dit, dah, dah, dit or . - . .

Try the other letters. No peeking until you've tried!

Ok, well in case you need a little more help, lets try O.

	T - M - O
	RIGHT - RIGHT - RIGHT
	DAH - DAH - DAH
	- - -

Did you get it right? Shall we try the letter V?

	E - I - S - V
	LEFT - LEFT - LEFT - RIGHT
	DIT - DIT - DIT - DAH
	. . . -

Great! Phew, looks like not so many words use the letter V! Lets try E, the most commonly used vowel in the English language.

	E
	LEFT
	DIT
	.

That was much easier! Our whole word can be represented by dots and dashes like this:

	. - . .   - - -   . . . -   .

Don't worry if it's going a little slow. When you first learned to read you had to go slow too. Amateur Radio users sometimes talk using Morse code at speeds of over 20 words per minute.

You might think it'd be quicker just to send a message on a mobile phone. Paul Kenny and a friend from Indiana University tried to see which was quicker, Morse code or an SMS. Which do you think will be quicker?

<iframe width="560" height="315" src="https://www.youtube.com/embed/TKrxMhNxv3Q" frameborder="0" allowfullscreen></iframe>

Morse code is most commonly used in Amateur Radio, but you can use Morse code to send messages using a mirror, your hands or anything that you can use as a signal, even blinking. You can even use a HIDIOT!

### The Colombian Government, The Pop Song and Morse Code

Now we know a bit about how to turn words into Morse code, lets try and turn Morse code into words. But this time, we're going to decode a secret message the Colombian government sent to hostages captive in the jungle.

Colombia is a beautiful country in the Americas that faught a war with rebel forces for many years. The FARC rebels would take hostages to be held for ransom, and the hostages would be kept in camps in the Colombian jungle.

Because there were so many hostages throughout the jungle, the rebels would give the hostages access to radio to help with long jungle hikes and keep their minds from escape. Family members would often phone in to radio shows to send messages to loved ones being kept hostage.

During a campaign to free hostages, government officials wanted to reassure prisoners they were working to free them. If the hostages tried to escape they risked death. If the government was going to help free them there was no point trying. Many of the hostages were soldiers who'd received Morse code training in the military, so the government decided to use a morse code message to reassure the hostages that they were being rescued.

They couldn't use something obvious over radio, as the rebels could take the radios away from hostages. So they decided to sneak the code into a pop song's chorus instead. The [incredible story](https://www.theverge.com/2015/1/7/7483235/the-code-colombian-army-morsecode-hostages) is well worth a read, but for now, we're going to try and decode the message.

<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/184253099&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>

Start by listening to the song. Partway through the chorus you should hear some dits and dahs around 1 minute and 30 seconds in. Using a pen and paper, just try to write the dits and dahs down. You might need to listen to it a few times. The message is repeated at 2 minutes 32 seconds and at 3 minutes 33 seconds.

You might struggle a bit with the first couple of characters because of the beat timing but see how many you can find, and whether or not you can write them all out. Don't worry if you can't make out all of the symbols, here they are below.

	. - - - -
	- - - - .
	. - . .
	. .
	- . . .
	.
	. - .
	. -
	- . .
	- - -
	. . .
	. . .
	. .
	- - .
	. . -
	.
	- .
	. . -
	. . .
	-
	.
	- . .
	.
	. . .
	. -
	- .
	. .
	- -
	- - -

Ok, this is a lot to take in, so lets try and split it up into sections. There are 29 characters representing words in Spanish. Lets split it up into 3 parts of 7 characters and one of 8. If you haven't played the song too many times, try working through this to the sounds of some catchy Colombian pop music.

![Morse tree](/images/morse-tree.svg)

Taking the first 7 characters we can use the Morse tree to convert it into text. Using left for dit, right for dah, we get:

	. - - - -   - - - - .   . - . .   . .   - . . .   .   . - .
	L R R R R   R R R R L   L R L L   L L   R L L L   L   L R L
	        1           9         L     I         B   E       R

Cool! We have our first part of the message! Now to try the second set of 7 characters. This time, you can fill in the letters from the tree.

	. -   - . .   - - -   . . .   . . .   . .   - - .
	L R   R L L   R R R   L L L   L L L   L L  R R L
	  _       _       _       _       _     _      _

Did you get all the letters from the tree? If so, lets try the next set. This time, you can work out the left and right, and fill in the letters.
	  
	. . -   .   - .   . . -   . . .   -   .
	_ _ _   _   _ _   _ _ _   _ _ _   _   _
	    _   _     _       _       _       _

Ok, final set of 8 characters!
	
	   - . .   .   . . .   . -   - .   . .   - -   - - -

If you speak Spanish, you should be able to tell what the message is. If you don't, it's still pretty hard to work out where words start and end, let alone what the message is. Thankfully we live in the 21st century, and can use Google translate. Copy and paste the words without spaces into [Google Translate](https://translate.google.com/). Set the source language to Spanish and the destination language to your own. There should be a message on the Google page that has a suggestion for spaces. Click on the link and the text should translate.

If it's still a little clunky, try changing using proper capitalisation and playing with different combinations of full stops after words to see if you can improve the translation. The final message in English (according to Google translate) is:

	19 Released. You follow. Cheer up.

A better translation of the original Colombian is:

	19 PEOPLE RESCUED. YOU’RE NEXT. DON’T LOSE HOPE

### What To Do Next

Now would be a great time to take a break from decoding secret government messages. In the [next part of this project](/exploring_morse_code/a_watery_grave/), we're going to use the HIDIOT to send messages over Morse code, and decode some of the last messages sent on the voyage of the RMS Titanic.

In the meantime, try listening to some of these songs and see if you can spot the Morse code messages. Can you decode any of them?

* Glitter Freeze - Gorrilaz
* Radioactivity - Kraftwerk
* YYZ - Rush
