//APPEND ~EDWINJ~


///////////////////////
// TALK 1
//////////////////////
CHAIN IF ~Global("g_EdwinFriendTalks","GLOBAL",1)~ THEN EDWINJ EdwinTalk1
	~Perhaps it should be me who broaches this subject. It has been some time since we last saw each other (though it could have been longer). I am clearly an even better mage than I was then. Since we parted ways, I have been researching arcane theories beyond your meager comprehension and enhancing my talents to new heights. A far better usage of time than whatever you were doing (of that, I am certain).~ DO ~IncrementGlobal("g_EdwinFriendTalks","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~
END
	++ ~I was being tortured by an insane mage under Athkatla.~ GOTO EdwinTalk1.1
	++ ~I was having a great time in Baldur’s Gate, enjoying all the luxuries I deserved after defeating Sarevok, before I was kidnapped.~ GOTO EdwinTalk1.1
	++ ~…we defeated the Shining Crusade. You were there, or at least, until I was imprisoned.~ GOTO EdwinTalk1.1
	++ ~I spent my time training. I’m glad I did, but I wish I could’ve done more of that.~ GOTO EdwinTalk1.1
	++ ~I was also researching arcane theories. Likely beyond *your* comprehension.~ GOTO EdwinTalk1.1
	++ ~It’s really none of your business.~ GOTO EdwinTalk1.1

APPEND EDWINJ

IF ~~ THEN BEGIN EdwinTalk1.1
	SAY ~Like I said, I had a far better use of time. You would do well to follow my example. But come, I have learned of your situation through my contacts in the Shadow Thieves, and I know you need a substantial amount of money to rescue Imoen. How and why you let her be taken by the Cowled Wizards is a mystery to me. But luckily for you, I always protect my subordinates.~
	++ ~I’m not your subordinate.~ GOTO EdwinTalk1.2
	++ ~You are MY subordinate.~ GOTO EdwinTalk1.3
	++ ~Gee, thanks.~ GOTO EdwinTalk1.4
END

IF ~~ EdwinTalk1.2
  SAY ~Everyone who travels with a Red Wizard of Thay is subservient to the Wizard. It is only the natural order of things (after all, we are intelligent and powerful–moreso than our lessers, and thus more deserving to be in positions of authority). Now, let us be off.~ IF ~~ THEN EXIT
END

IF ~~ EdwinTalk1.3
  SAY ~I am not! Everyone who travels with a Red Wizard of Thay is subservient to the Wizard. It is only the natural order of things (after all, we are intelligent and powerful–moreso than our lessers, and thus more deserving to be in positions of authority). Now, let us be off.~ IF ~~ THEN EXIT
END

IF ~~ EdwinTalk1.4
  SAY ~You’re very welcome. Now, let us be off.~ IF ~~ THEN EXIT
END
END
///////////////////////
// TALK 2
//////////////////////
CHAIN IF ~Global("g_EdwinFriendTalks","GLOBAL",3)~ THEN EDWINJ EdwinTalk2
	 ~Hmph. I have been in Athkatla for some time now, and it hasn’t gotten any better. I have traveled to many different places, and this is, by far, the worst (even Nashkel was more appealing). In addition, the present company leaves much to be desired. Though I suppose you have made small improvements since we last traveled together.~ DO ~IncrementGlobal("g_EdwinFriendTalks","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~
END
	++ ~I’ve made more than small improvements.~ GOTO NoUhavent
	++ ~I am very close to kicking you out of the group.~ GOTO kickOut
	++ ~Disagree, I’m growing fond of the place.~ GOTO pcbadTaste
	+~!Class(Player1,BARD_ALL) !Class(Player1,MAGE_ALL) !Class(Player1,SORCERER)~+ ~I agree. Athkatla is pretty awful.~ GOTO nonmagicAwful
	+~Class(Player1,BARD_ALL)~+ ~I agree. Athkatla is pretty awful.~ GOTO magicAwful
	+~Class(Player1,MAGE_ALL)~+ ~I agree. Athkatla is pretty awful.~ GOTO magicAwful
APPEND EDWINJ

IF ~~ THEN BEGIN NoUhavent
	SAY ~And yet you still let Imoen and Irenicus get taken by those cowled charlatans. At least you managed to defeat Mae’Var and have not been killed by anything else yet (though who knows how long that will last).~
	++ ~I didn’t just “let” Imoen get taken away!~ GOTO nuUH
	++ ~And I’m going to get Imoen back, no matter the cost.~ GOTO noMatterWhat
	++ ~And I’m going to get Imoen back. You’ll see.~ GOTO getBack
END

IF ~~ THEN BEGIN nuUH
	SAY ~No, you were just too pathetic to stop it. You may have done your best, but you failed anyway. If your best isn’t good enough, then the improvements you have made must be very small indeed (else you would be more successful). Your meager conversational skills have started to bore me, so let us continue onwards.~ IF ~~ THEN EXIT
END



IF ~~ THEN BEGIN noMatterWhat
	SAY ~“No matter the cost” is a bold statement. Whether you have the stomach for such ruthlessness remains to be seen (and hopefully we’ll all still be alive to witness it). This conversation has started to bore me, so let us continue onwards.~IF ~~ THEN DO ~
 IncrementGlobal("g_EdwinLikesPC","GLOBAL",1) ~ EXIT
END

IF ~~ THEN BEGIN getBack
	SAY ~Hmph. That remains to be seen (and hopefully we’ll all still be alive to witness it). Your meager conversational skills have started to bore me, so let us continue onwards.~ IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN kickOut
	SAY ~You need my powerful magics. Your bluffing has no effect on me. Your conversational skills are lacking, and have begun to bore me. Let us continue onwards.~IF ~~ THEN DO ~
 IncrementGlobal("g_EdwinLikesPC","GLOBAL",-1)~ EXIT
END

IF ~~ THEN BEGIN nonmagicAwful
	SAY ~Of all the things to be illegal. Magic. Clearly the simian population is both jealous and afraid of magical talents (which I possess in abundance).~
	++ ~Yes, Edwin, you are very talented.~ GOTO edwinTalented
	++ ~Don't flatter yourself.~ GOTO noFlatter
END

IF ~~ THEN BEGIN magicAwful
	SAY ~Of all the things to be illegal. Magic. Clearly the simian population is both jealous and afraid of magical talents (which we possess in abundance).~
	++ ~…Did you just say that I have abundant magical talent?~ GOTO firstCompliment
	++ ~Yes, Edwin, you are very talented.~ GOTO edwinTalented
	++ ~Don't flatter yourself.~ GOTO noFlatter
END

IF ~~ THEN BEGIN firstCompliment
	SAY ~Do not take it as a compliment. You have merely continued to survive despite anyone’s expectations. Though you may have magical talent (not equal to my own, mind you), talent is not enough. To fully realize your potential, you also need an outstanding intellect and an excellent education, which you are lacking.~
	++ ~You sure know how to ruin a moment, don’t you?~ GOTO ruinedMoment
	++ ~Gorion was a great wizard, and he and Tethtoril gave me an excellent education. I won’t just let you insult them. Keep it up and I’ll give your spellbook to the nearest child with crayons.~ GOTO crayonThreat
END

IF ~~ THEN BEGIN edwinTalented
	SAY ~I am glad that you realize this. Perhaps you are not as unobservant as I had thought. But we have wasted too much time with idle prattle already; let us be off.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendTalks","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN noFlatter
	SAY ~It is not flattery if it is the truth. Then, it is simply an observation. Your meager conversational skills have started to bore me, so let us continue onwards.~ IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ruinedMoment
	SAY ~If speaking the truth ruins a moment, then you are a fool, and I am wasted on you. Your meager conversational skills have started to bore me, so let us continue onwards.~ IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN crayonThreat
	SAY ~No education can compare to the schools of Thay. No matter your education in Candlekeep, it was inadequate compared to the proper Thayvian education that I myself received. Perhaps one day, you will be deserving of the details (though not today). But we have wasted too much time with idle prattle already; let us be off.~IF ~~ THEN DO ~
IncrementGlobal("g_EdwinLikesPC","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN pcbadTaste
	SAY ~Your taste is even worse than I thought then. You are a buffoon, and you are lucky to be traveling with me. Both your taste and conversational skills are lacking, and have begun to bore me. Let us continue onwards.~IF ~~ THEN DO ~
IncrementGlobal("g_EdwinLikesPC","GLOBAL",-1)~ EXIT
END

END

///////////////////////
// TALK 3
//////////////////////
CHAIN IF ~Global("g_EdwinFriendTalks","GLOBAL",5)~ THEN EDWINJ EdwinTalk3
 ~Hmph. You have terrible taste in companions (really, you should be letting me decide who comes with us).~ DO ~IncrementGlobal("g_EdwinFriendTalks","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~
END
	++ ~Terrible taste, yet I let you tag along.~ GOTO edwin3.1
	++ ~My bad taste is the only reason why you’re here.~ GOTO edwinInsult
	++ ~I have great taste, actually. As proven by your presence.~ GOTO edwin3.3
	++ ~(Snap and go on a lengthy rant, with plenty of insults for good measure).~ GOTO edwinSnap 
	++ ~Stick to the spells, Edwin.~ GOTO edwinSpells3
APPEND EDWINJ

IF ~~ THEN BEGIN edwin3.1
	SAY ~Even the most incompetent fool can be successful once or twice. My presence proves that you are not completely a lost cause (and whether that changes remains to be seen). Tell me, are there companions of yours here just to distract our enemies on the battlefield, or do you feel useless sentimentality towards them?~
	++ ~Sentimentality isn’t useless.~ GOTO edwinSent
	++ ~They’re here because they’re convenient. As soon as they stop being so, they are gone.~ GOTO edwinUse
END

IF ~~ THEN BEGIN edwinInsult
	SAY ~Pfah! Do you accept every insult thrown your way? My presence proves that you are not completely a lost cause (and whether that changes remains to be seen–though I have my doubts). Tell me, are there companions of yours here just to distract our enemies on the battlefield, or do you feel useless sentimentality towards them?~
	++ ~Sentimentality isn’t useless.~ GOTO edwinSent
	++ ~They’re here because they’re convenient. As soon as they stop being so, they are gone.~ GOTO edwinUse
END

IF ~~ THEN BEGIN edwin3.3
	SAY ~Hmph. And yet you let the rest of these simians travel with us. Tell me, are there companions of yours here just to distract our enemies on the battlefield, or do you feel useless sentimentality towards them?~
	++ ~Sentimentality isn’t useless.~ GOTO edwinSent
	++ ~They’re here because they’re convenient. As soon as they stop being so, they are gone.~ GOTO edwinUse
END

IF ~~ THEN BEGIN edwinSnap
	SAY ~You insults need work, but the quality is more than I would’ve expected from a simian such as yourself. Perhaps there is hope for you yet. Tell me, are there companions of yours here just to distract our enemies on the battlefield, or do you feel useless sentimentality towards them?~
	++ ~Sentimentality isn’t useless.~ GOTO edwinSent
	++ ~They’re here because they’re convenient. As soon as they stop being so, they are gone.~ GOTO edwinUse
END

IF ~~ THEN BEGIN edwinSent
	SAY ~Sentimentality is for fools waiting to be used and betrayed. Did your foolish Harper of a foster father teach you this nonsense?~
	++ ~It’s not nonsense, and Gorion wasn’t foolish! Friendship and love make life more meaningful.~ GOTO edwinSent2
	++ ~You’re more prickly than usual. Someone not get enough beauty sleep last night?~ GOTO edwinBeautySleep
	++ ~Edwin, shut up. This conversation is over.~ GOTO edwinSpells3
END

IF ~~ THEN BEGIN edwinSent2
	SAY ~Does it? Look at you, running around Athkatla like a common mercenary, pinching coins like a beggar for the mere chance of rescuing Imoen (and dragging me along with you).~
	++ ~I’m after Irenicus, not Imoen.~ GOTO afterIren
	++ ~I’m not dragging you along. You’re free to leave whenever you want. Unless it’s sentimentality keeping you here?~ GOTO edwinDrag
END

IF ~~ THEN BEGIN edwinBeautySleep
	SAY ~Hmph. Look at you, running around Athkatla like a common mercenary, pinching coins like a beggar to rescue Imoen (and dragging me along with you).~
	++ ~I’m after Irenicus, not Imoen.~ GOTO afterIren
	++ ~I’m not dragging you along. You’re free to leave whenever you want. Unless it’s sentimentality keeping you here?~ GOTO edwinDrag
END

IF ~~ THEN BEGIN afterIren
	SAY ~Hmph. You say that friendship makes life more meaningful, yet you leave those who would call you a friend, languishing in captivity (the hypocrisy is sickening). But clearly, my wisdom is wasted on you. This conversation is over.~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN edwinUse
	SAY ~Hmph. I thought as much. There is no sentimentality between us, nor will there ever be (and I am glad you realize this).~ IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN edwinDrag
	SAY ~ Pfah! My reasons are much more practical. There is no sentimentality between us, nor will there ever be (and you would be a fool to think otherwise). Clearly, my wisdom is wasted on you. This conversation is over.~IF ~~ THEN DO ~
IncrementGlobal("g_EdwinLikesPC","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN edwinSpells3
	SAY ~ Clearly, my wisdom is wasted on you.~IF ~~ THEN DO ~
IncrementGlobal("g_EdwinLikesPC","GLOBAL",-1)~ EXIT
END

///////////////////////
// TALK 4
//////////////////////
IF ~Global("g_EdwinFriendEdwina","GLOBAL",2)~ THEN BEGIN EdwinTalk4
	SAY ~Hmph. Out with it already. I know you want to comment on my situation like the rest of these simians.~
	++ ~This is why you don’t mess with magical items beyond your power.~ GOTO edwinLecture
	++ ~I wasn’t going to comment. I know what it’s like to be seen as a gender that you’re not.~ GOTO edwinTrans
	++ ~We’ll resolve this situation somehow.~ GOTO edwinFix
END

IF ~~ THEN BEGIN edwinTrans
	SAY ~This is different. I am Edwin Odesseiron, and it wasn’t supposed to be like this! I was supposed to bring my power to new heights, not.. not have THIS happen!~
	++ ~We’ll resolve this situation somehow.~ GOTO edwinFix
	++ ~Ha! You’re right, maybe you are stuck like this. You’d deserve it for messing with the Nether Scroll.~ GOTO edwinLecture
END

IF ~~ THEN BEGIN edwinFix
	SAY ~This is different. I am Edwin Odesseiron, and it wasn’t supposed to be like this! I was supposed to bring my power to new heights, not.. not have THIS happen!~
	++ ~I don’t know, but we’ll find a way. Somehow.~ GOTO edwinFix2
	++ ~Ha! You’re right, maybe you are stuck like this. You’d deserve it for messing with the Nether Scroll.~ GOTO edwinLecture
END

IF ~~ THEN BEGIN edwinFix2
	SAY ~And if we can’t? If I’m stuck in this wretched form forever?~
	++ ~That would be unfortunate. But you’re still the same Edwin to me, you know, regardless of what form you take.~ GOTO edwinComfort
	++ ~Then you’d deserve it. It'd be a fitting punishment for your arrogance.~ GOTO edwinLecture
END

IF ~~ THEN BEGIN edwinComfort
	SAY ~Hmph. Let us find something to do, some sort of distraction from being in this form!~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendEdwina","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",3) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN edwinLecture
	SAY ~There is no magical item beyond the power of Edwin Odesseiron, Red Wizard of Thay! This was NOT SUPPOSED TO HAPPEN. I do not need a lecture from the likes of you.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendEdwina","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",-3) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END
///////////////////////
// TALK 5
//////////////////////
IF ~Global("g_EdwinFriendDegard","GLOBAL",2)~ THEN BEGIN EdwinTalk5
	SAY ~You could have sold me out to Degardiagananan but you did not. That was a wise decision, and I am almost impressed.~
	++ ~Are you trying to thank me?~ GOTO edwinThank
	++ ~We’re friends, of course I wouldn’t sell you out.~ GOTO edwinFriend
	++ ~I am starting to regret my decision already.~ GOTO edwinRegret
END

IF ~~ THEN BEGIN edwinThank
	SAY ~Of course not! A Red Wizard thanks no one (lest we be mistaken for being indebted)!~
	++ ~It sounds to me like you’re trying to thank me. It’s not going to kill you, Edwin.~ GOTO heWouldDieTho
	++ ~You aren’t indebted; it’s what anyone would have done.~ GOTO anyoneWouldHave
	++ ~If you say so.~ GOTO saySo
END

IF ~~ THEN BEGIN heWouldDieTho
	SAY ~You are a presumptuous buffoon, and this conversation is a waste of time. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN anyoneWouldHave
	SAY ~You’d be surprised <CHARNAME> (and your naivety sickens me). This conversation is a waste of time. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN saySo
	SAY ~And I do. This conversation is a waste of time. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN edwinFriend
	SAY ~Friends? Friendship is for sentimental fools, <CHARNAME> (and for those who are too weak to stand on their own). Have I given you any reason to think we are “friends”?~
	++ ~No, I suppose not, especially with how often you insult me.~ GOTO edwinInsults
	++ ~You’ve stuck around this long, haven’t you?~ GOTO stuckAround
	++ ~We’re friends, and there’s not much you can do about it.~ GOTO nakama
	++ ~Insult Gorion again and I’ll set your spellbook on fire.~ GOTO edwinFireThreat
END

IF ~~ THEN BEGIN edwinInsults
	SAY ~The insults are deserved (of that, I assure you). Let me promise you that I am here for my own reasons and interests. here is no sentimentality between us, no matter how much you may wish it! Just because I let you in my company and just because we rely on each other on the battlefield does not mean we are *friends*. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN stuckAround
	SAY ~Pfah! For my own reasons and interests, of course. There is no sentimentality between us, no matter how much you may wish it! Just because I let you in my company and just because we rely on each other on the battlefield does not mean we are *friends*. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN nakama
	SAY ~Pfah! I have heard that friendship is supposed to be a two-way street and that it is not meant to be forced. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle). ~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",-1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN edwinFireThreat
	SAY ~You act as if I would allow you to do such a thing (and as if my spellbook isn’t magically fireproof). There is no sentimentality between us, no matter how much you may wish it! Just because I let you in my company and just because we rely on each other on the battlefield does not mean we are *friends*. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN edwinRegret
	SAY ~Pfah! As if you could survive without my magics! You need me (even if you are too stubborn to admit it!). This conversation bores me. Now, come. We have many an inane task ahead of us (and little time to waste on such prattle).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendDegard","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",-1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

///////////////////////
// TALK 6
//////////////////////
IF ~Global("g_EdwinFriendBrynn","GLOBAL",2) Class(Player1,MAGE_ALL)~ THEN BEGIN EdwinTalk6.2
	SAY ~So, our chase nears its end. Imoen and Irenicus are now within our grasp. All we have to do is storm the asylum created specifically to hold (and likely perform gruesome experiments upon) spellcasters such as myself.~
	+~Class(Player1,MAGE_ALL)~+ ~It doesn’t sound very appealing, does it? Still, we have no other choice.~ GOTO magicUhOh
	++ ~Getting nervous?~ GOTO edwinNervous
	++ ~You’re lucky you aren’t in there yourself.~ GOTO edwinLucky
	++ ~We’ll be fine, I’m sure. I won’t let anything happen to you.~ GOTO edwinSafe 	
END

IF ~Global("g_EdwinFriendBrynn","GLOBAL",2) Class(Player1,BARD_ALL)~ THEN BEGIN EdwinTalk6.1
	SAY ~So, our chase nears its end. Imoen and Irenicus are now within our grasp. All we have to do is storm the asylum created specifically to hold (and likely perform gruesome experiments upon) spellcasters such as ourselves.~
	+~Class(Player1,BARD_ALL)~+ ~It doesn’t sound very appealing, does it? Still, we have no other choice.~ GOTO magicUhOh
	+~Class(Player1,MAGE_ALL)~+ ~It doesn’t sound very appealing, does it? Still, we have no other choice.~ GOTO magicUhOh
	++ ~Getting nervous?~ GOTO edwinNervous
	++ ~You’re lucky you aren’t in there yourself.~ GOTO edwinLucky
	++ ~We’ll be fine, I’m sure. I won’t let anything happen to you.~ GOTO edwinSafe 	
END

IF ~Global("g_EdwinFriendBrynn","GLOBAL",2)~ THEN BEGIN EdwinTalk6.2
	SAY ~So, our chase nears its end. Imoen and Irenicus are now within our grasp. All we have to do is storm the asylum created specifically to hold (and likely perform gruesome experiments upon) spellcasters such as myself.~
	++ ~Getting nervous?~ GOTO edwinNervous
	++ ~You’re lucky you aren’t in there yourself.~ GOTO edwinLucky
	++ ~We’ll be fine, I’m sure. I won’t let anything happen to you.~ GOTO edwinSafe 	
END

IF ~~ THEN BEGIN magicUhOh
	SAY ~No, I suppose not. Those incompetent cowled charlatans will be no match for us (or at least, no match for me).~
	++ ~Wish I had your confidence.~ GOTO edwinConfident
	++ ~Don’t get too arrogant and careless.~ GOTO edwinArrogant
	++ ~That’s right! The two of us can do it.~ GOTO edwinCanDo
END

IF ~~ THEN BEGIN edwinNervous
	SAY ~Pfah!As if Edwin Odessieron would be nervous.~
	++ ~Wish I had your confidence.~ GOTO edwinConfident
	++ ~Don’t get too arrogant and careless.~ GOTO edwinArrogant
	++ ~That’s right! The two of us can do it.~ GOTO edwinCanDo
END

IF ~~ THEN BEGIN edwinLucky
	SAY ~Pfah!As if Edwin Odessieron would let those cowled charlatans whisk me away.~
	++ ~Wish I had your confidence.~ GOTO edwinConfident
	++ ~Don’t get too arrogant and careless.~ GOTO edwinArrogant
	++ ~That’s right! The two of us can do it.~ GOTO edwinCanDo
END

IF ~~ THEN BEGIN edwinSafe
	SAY ~Pfah! As if there was ever any chance that anything would happen to Edwin Odesseiron.~
	++ ~Wish I had your confidence.~ GOTO edwinConfident
	++ ~Don’t get too arrogant and careless.~ GOTO edwinArrogant
	++ ~That’s right! The two of us can do it.~ GOTO edwinCanDo
END

IF ~~ THEN BEGIN edwinConfident
	SAY ~If you had received the excellent Thayvian education and were a Red Wizard like myself, then you would have confidence also. As it stands, you are right to be nervous, but Edwin Odesseiron is with you. Together, we shall crush the Cowled Wizards beneath our heels and rescue Imoen, who you so carelessly let get captured (you are lucky I am here to help fix your mistakes).~
	++ ~I didn’t make a mistake!~ GOTO edwinPCMistake
	++ ~..Thank you.~ GOTO pcThankEdwin
END

IF ~~ THEN BEGIN edwinArrogant
	SAY ~It is not arrogant and I am never careless (do NOT mention the Nether Scroll). If you had received the excellent Thayvian education and were a Red Wizard like myself, then you would have confidence also. As it stands, you are right to be nervous, but Edwin Odesseiron is with you. Together, we shall crush the Cowled Wizards beneath our heels and rescue Imoen, who you so carelessly let get captured (you are lucky I am here to help fix your mistakes).~
	++ ~I didn’t make a mistake!~ GOTO edwinPCMistake
	++ ~..Thank you.~ GOTO pcThankEdwin
END

IF ~~ THEN BEGIN edwinCanDo
	SAY ~Hmph. I am glad you realize this. Try to stay out of the way of my spells. I do not expect you to be able to keep up, as you are not me and are lacking the excellent Thayvian education which I received. Edwin Odesseiron is with you. Together, we shall crush the Cowled Wizards beneath our heels and rescue Imoen, who you so carelessly let get captured (you are lucky I am here to help fix your mistakes).~
	++ ~I didn’t make a mistake!~ GOTO edwinPCMistake
	++ ~...Thank you.~ GOTO pcThankEdwin
END

IF ~~ THEN BEGIN edwinPCMistake
	SAY ~No? You let Imoen get taken on purpose (no, I thought not). We cannot all be myself, sometimes, lesser beings make mistakes (do NOT mention the Nether Scroll). Now, enough of this idle chatter.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBrynn","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN pcThankEdwin
	SAY ~Hmph. Edwin Odesseiron always takes care of his subordinates. Now, enough of this idle chatter.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBrynn","GLOBAL",1) IncrementGlobal("g_EdwinLikesPC","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

///////////////////////
// TALK 7
//////////////////////
IF ~Global("g_EdwinFriendUnder","GLOBAL",1)~ THEN BEGIN EdwinTalk7
	SAY ~Hmph. Something is bothering you. I can tell. Out with it.~
	++ ~Gee, Edwin, I don’t know what could POSSIBLY be wrong.~ GOTO lostSoul
	++ ~Well, let’s see. I DID just get my soul stolen so that’s a bummer.~ GOTO lostSoul
	++ ~Are you concerned about me?~ GOTO edConcerned
	++ ~I’m fine.~ GOTO imFine
END

IF ~~ THEN BEGIN imFine
	SAY ~No, you are not fine. You have a sullen silence around you. It screams I-am-not-fine, and it is distracting me from my spellbook.~
	++ ~You aren’t going to drop this, are you?~ GOTO ed7.3
	++ ~Gee, Edwin, I don’t know what could POSSIBLY be wrong.~ GOTO lostSoul
	++ ~Well, let’s see. I DID just get my soul stolen so that’s a bummer.~ GOTO lostSoul
	++ ~Are you concerned about me?~ GOTO edConcerned
END

IF ~~ THEN BEGIN ed7.3
	SAY ~No. Now, out with it. I could be doing something more useful with my time.~
	++ ~Gee, Edwin, I don’t know what could POSSIBLY be wrong.~ GOTO lostSoul
	++ ~Well, let’s see. I DID just get my soul stolen so that’s a bummer.~ GOTO lostSoul
	++ ~Are you concerned about me?~ GOTO edConcerned
END

IF ~~ THEN BEGIN lostSoul
	SAY ~So you lost your soul. Yet you are somehow still cognizant and not a drooling catatonic lump. You have overcome plenty, and with my considerable talents, we will get your soul back (of that I am certain).~
	++ ~I wish I had your optimism.~ GOTO soulOptimism
	++ ~You’re right. We’ll get through this.~ GOTO soulGetThrough
END

IF ~~ THEN BEGIN edConcerned
	SAY ~Pfah! I am not concerned! Although you lost your soul, you are somehow still cognizant and not a drooling catatonic lump. You have overcome plenty, and with my considerable talents, we will get your soul back (of that I am certain).~
	++ ~I wish I had your optimism.~ GOTO soulOptimism
	++ ~You’re right. We’ll get through this.~ GOTO soulGetThrough
END

IF ~~ THEN BEGIN soulOptimism
	SAY ~It is not optimism. Optimism is for naive fools who rely on hope. Confidence, on the other hand, is only natural to those who are competent enough to succeed (such as myself). Now, stop your sulking and leave me to my spellbook.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendUnder","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN soulGetThrough
	SAY ~Of course I am right. I do not need you to tell me as such, but I am glad you realize this fact. You have overcome plenty, and with my considerable talents, we will get your soul back (of that I am certain).  Now, stop your sulking and leave me to my spellbook.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendUnder","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

///////////////////////
// TALK 8
//////////////////////
IF ~Global("g_EdwinFriendBodhi","GLOBAL",2)~ THEN BEGIN EdwinTalk8
	SAY ~See, <CHARNAME>? This wretch was no match for our combined power. Soon, we shall confront Irenicus, and he too shall fall before our might (and I’ll make sure of it).~
	++ ~Yes, and this entire situation will finally be over.~ GOTO bodhiOver
	++ ~You’re optimistic.~ GOTO bodhiOpt
	++ ~I’m glad you’re here.~ GOTO bodhiGlad
END

IF ~~ THEN BEGIN bodhiOver
	SAY ~And all your mistakes will be fixed. It will be as if you were never captured by Irenicus in the first place.~
	++ ~I don’t think I’ll ever go back to who I used to be.~ GOTO whoIWas
	++ ~You’re optimistic.~ GOTO bodhiOpt
	++ ~I’m glad you’re here.~ GOTO bodhiGlad
END

IF ~~ THEN BEGIN whoIWas
	SAY ~You are much more competent and capable than you were in Baldur’s Gate. Why regret the power you have gained? (Only a fool would)!~
	++ ~Edwin, are you… complimenting me?~ GOTO edwinBodhiComp
	++ ~I don’t regret the growth; I regret how it happened.~ GOTO bodhiRegret
END

IF ~~ THEN BEGIN bodhiOpt
	SAY ~It is not optimism! It is confidence, <CHARNAME>. Perhaps if you had an excellent Thayvian education like myself, rather than that Harper nonsense, you would be confident also. One thing that my excellent Thayvian education has taught me is that growth is not easy. You must defeat all your rivals and those that oppose you to make it to the top. Bodhi has fallen before our might, and soon, Irenicus will be beneath our heel as well. But come. You may be more competent, but you are still not deserving of more secrets of my excellent Thayvian education (perhaps later).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBodhi","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN bodhiGlad
	SAY ~Hmph. Yes, of course you are. I am a powerful and accomplished Red Wizard, and anyone would be thrilled to have me around (or else their taste would be truly wretched indeed). I will tell you something I learned in Thay. One thing that my excellent Thayvian education has taught me is that growth is not easy. You must defeat all your rivals and those that oppose you to make it to the top. Bodhi has fallen before our might, and soon, Irenicus will be beneath our heel as well. But come. You may be more competent, but you are still not deserving of more secrets of my excellent Thayvian education (perhaps later).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBodhi","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN edwinBodhiComp
	SAY ~No! I am not complimenting you. I am merely stating facts (do not let it get to your head). Bodhi has fallen before our might, and soon, Irenicus will be beneath our heel as well. But come. You may be more competent, but you are still not deserving of more secrets of my excellent Thayvian education (perhaps later).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBodhi","GLOBAL",1) RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN bodhiRegret
	SAY ~One thing that my excellent Thayvian education has taught me is that growth is not easy. You must defeat all your rivals and those that oppose you to make it to the top. Bodhi has fallen before our might, and soon, Irenicus will be beneath our heel as well. But come. You may be more competent, but you are still not deserving of more secrets of my excellent Thayvian education (perhaps later).~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendBodhi","GLOBAL",1)RealSetGlobalTimer("g_EdwinFriendshipTalksTimer","GLOBAL",2400)~ EXIT
END

///////////////////////
// TALK 9
//////////////////////
IF ~Global("g_EdwinFriendSuld","GLOBAL",2)~ THEN BEGIN EdwinTalk9
	SAY ~So, I think… We shall confront Irenicus very soon.~
	++ ~This is my fight, not yours.~ GOTO edTalk9.1
	++ ~You aren’t scared, are you?~ GOTO edTalk9.1
	++ ~Let’s hope we don’t die.~ GOTO edTalk9.1
END

IF ~~ THEN BEGIN edTalk9.1
	SAY ~Pfah! Do you remember what I said in Athkatla, shortly after we joined forces? I said that I always protect my subordinates.~
	++ ~And--~ GOTO edTalk9.2
	++ ~I--~ GOTO edTalk9.2
	++ ~But--~ GOTO edTalk9.2
END

IF ~~ THEN BEGIN edTalk9.2
	SAY ~Let me say my piece (and without interruption). I… I do not consider you a subordinate anymore, nor an inferior in any way, even though you never had an adequate arcane Thayvian education like myself.~
	++ ~Thanks, I--~ GOTO edTalk9.3
	++ ~Edwin--~ GOTO edTalk9.3
	++ ~I--~ GOTO edTalk9.3
END

IF ~~ THEN BEGIN edTalk9.3
	SAY ~Let me finish. One, or both of us, could very well be killed by Irenicus (unfortunate, but true). I do not want there to be things left unsaid between us. Despite all the things that have happened between us, both good and bad, I… I need to tell you, that… That I count you as a true friend (and that is NOT something that I say often!). And as such, I will stand by you against Irenicus, even though it might cost me my life.~
	++ ~Edwin--~ GOTO edTalk9.4
	++ ~I--~ GOTO edTalk9.4
	++ ~But--~ GOTO edTalk9.4
END

IF ~~ THEN BEGIN edTalk9.4
	SAY ~You may not feel the same; I know that. But I wanted you to know.~
	++ ~If you would just shut up for once and let me talk! I… count you as a true friend, too. (NOTE: Edwin's Alignment will change to Lawful Neutral).~ GOTO friendLN
	++ ~If you would just shut up for once and let me talk! I… count you as a true friend, too. (NOTE: Edwin's Alignment will stay Lawful Evil)~ GOTO friendLE
	++ ~Edwin, I’m sorry, but I only consider you a colleague.~ GOTO rejected 
END


IF ~~ THEN BEGIN friendLN
	SAY ~I am glad to hear it. Perhaps… Perhaps if we both get out of this alive, we can figure out our futures from there.~
IF ~~ DO ~IncrementGlobal("g_EdwinFriendSuld","GLOBAL",1) ActionOverride("Edwin",ChangeAlignment(Myself,LAWFUL_NEUTRAL))~ EXIT
END

IF ~~ THEN BEGIN friendLE
	SAY ~I am glad to hear it. Perhaps… Perhaps if we both get out of this alive, we can figure out our futures from there.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendSuld","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN rejected
	SAY ~I… see. Well, best prepare for whatever we face ahead.~IF ~~ THEN DO ~
	IncrementGlobal("g_EdwinFriendSuld","GLOBAL",1)~ EXIT
END
END
