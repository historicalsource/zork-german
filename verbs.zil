  			"Generic VERBS file for
			    The ZORK Trilogy
		       started on 7/25/83 by SEM
		       -- GERMAN EDITION"

;"*** General note: Most of this file consists of dull 'verb defaults',
that is, responses you get if there's nothing interesting to respond
to what was typed. Most sentences are of a very general nature, which
must be maintained since you can plug in any (THING) into the sentence. ***"

;"Verb Functions for Game Commands"

<GLOBAL VERBOSE <>>
<GLOBAL SUPER-BRIEF <>>
<GDECL (VERBOSE SUPER-BRIEF) <OR ATOM FALSE>>

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSE T>
	 <SETG SUPER-BRIEF <>>
	 <TELL "Maximum verbosity." CR>>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSE <>>
	 <SETG SUPER-BRIEF <>>
	 <TELL "Brief descriptions." CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG SUPER-BRIEF T>
	 <TELL "Superbrief descriptions." CR>>

;"V-DIAGNOSE is in ACTIONS.ZIL"

<ROUTINE V-INVENTORY ()
	 <COND (<FIRST? ,WINNER> <PRINT-CONT ,WINNER>)
	       (T <TELL "Dein H%ande sind leer." CR>)>>

<ROUTINE FINISH ("AUX" WRD)
	 <V-SCORE>
	 <REPEAT ()
		 <CRLF>
		 ;<TELL
"Would you like to restart the game from the beginning, restore a saved
game position, receive a hint, or end this session of the game?|
(Type RESTART, RESTORE, HINT, or QUIT):|
>">
		 <TELL 
"M%ochtest du das Spiel neu anfangen, einen gespeicherten Zug wiederherstellen, einen Tip erhalten oder diese Spielrunde beenden?|
(Tippe: NEUBEGINN ,WIEDERHERSTELLEN, TIP oder AUFHOEREN: 
>">
		 <PUTB ,P-INBUF 1 0>
		 <READ ,P-INBUF ,P-LEXV>
		 <SET WRD <GET ,P-LEXV ,P-LEXSTART>>
		 <COND (<EQUAL? .WRD ,W?NEUBEGINN>
			<RESTART>
			<TELL "Verfehlt." CR>)
		       (<EQUAL? .WRD ,W?WIEDERHERSTELLUNG>
			<COND (<RESTORE>
			       <TELL "Ok." CR>)
			      (T
			       <TELL "Verfehlt." CR>)>)
		       (<EQUAL? .WRD ,W?AUFHOEREN>
			<QUIT>)
		       (<EQUAL? .WRD ,W?TIPS ,W?TIP ,W?HILFE>
			<V-HINT>
			<AGAIN>)>>>

<ROUTINE V-QUIT ("AUX" SCOR)
	 <V-SCORE>
	 <TELL 
"M%ochtest du aufh%oren zu spielen. (J wenn: Ja): ">
	 <COND (<YES?>
		<QUIT>)
	       (ELSE 
	        <TELL "Ok." CR>)>>

<ROUTINE V-RESTART ()
	 <V-SCORE T>
	 <TELL "M%ochtest du neu anfangen? (J wenn: Ja): ">
	 <COND (<YES?>
		<TELL "Neuanfang." CR>
		<RESTART>
		<TELL "Verfehlt." CR>)>>

<ROUTINE V-RESTORE ()
	 <COND (<RESTORE>
		<SETG OHERE <>>
		<TELL "Ok." CR>
		<V-FIRST-LOOK>)
	       (T
		<TELL "Verfehlt." CR>)>>

<ROUTINE V-SAVE ("AUX" SV FLG)
	 <COND (<EQUAL? <SET SV <SAVE>> 1>
	        ;<CHECK-REFRESH>
		<TELL "Ok." CR>)
	       (<EQUAL? .SV 2>
		<SETG OHERE <>>
		<TELL "Ok." CR>
		<CLEAR -1>
		<INIT-STATUS-LINE>
		<CRLF>
		<V-LOOK>)
	       (T
		<TELL "Verfehlt." CR>)>
	 <RTRUE>>

;<ROUTINE CHECK-REFRESH ()
	 <COND (<BTST <GET 0 8> 4>
		<PUT 0 8 <BAND <GET 0 8> -5>>
		<INIT-STATUS-LINE>)>>

;"V-SCORE is in ACTIONS.ZIL"

<ROUTINE V-SCRIPT ()
	;<PUT 0 8 <BOR <GET 0 8> 1>>
	<TELL "Hier beginnt eine gedruckte Kopie von: " CR CR>
        <V-VERSION>
	<DIROUT ,D-PRINTER-ON>
	<RTRUE>>

<ROUTINE V-UNSCRIPT ()
	<TELL "Hier endet eine gedruckte Kopie von: " CR CR>
	<V-VERSION>
	;<PUT 0 8 <BAND <GET 0 8> -2>>
	<DIROUT ,D-PRINTER-OFF>
	<RTRUE>>

<ROUTINE V-$ID ()
	 <TELL "Interpreter ">
	 <PRINTN <GETB 0 30>>
	 <TELL " Version ">
	 <PRINTC <GETB 0 31>>
	 <CRLF>
	 <RTRUE>>

<ROUTINE V-VERSION ("AUX" (CNT 17))
	%<COND (<==? ,ZORK-NUMBER 1>
		'<TELL "ZORK I: Das Gro%se Unterweltreich|
Infocom dialogf%ahig Prose - eine Phantasiegeschichte|
Copyright (c) 1981, 1982, 1983, 1984, 1985, 1986">)
	       (<==? ,ZORK-NUMBER 2>
		'<TELL "ZORK II: The Wizard of Frobozz|
Infocom interactive fiction - a fantasy story|
Copyright (c) 1981, 1982, 1983, 1986">)
	       (<==? ,ZORK-NUMBER 3>
		'<TELL "ZORK III: The Dungeon Master|
Infocom interactive fiction - a fantasy story|
Copyright 1982, 1983, 1984, 1986">)>
	<TELL " Infocom, Inc.|
Alle Rechte vorbehalten. ZORK ist ein eingetragenes Markenzeichen|
der Infocom, Inc.|
BETA RELEASE # 1|
Ver%offenlichtung ">
	<PRINTN <BAND <GET 0 1> *3777*>>
	<TELL " / Seriennummer ">
	<REPEAT ()
		<COND (<G? <SET CNT <+ .CNT 1>> 23>
		       <RETURN>)
		      (T
		       <PRINTC <GETB 0 .CNT>>)>>
	<TELL " / ">
	<V-$ID>
	<RTRUE>>

<ROUTINE V-VERIFY ()
	 <TELL "Diskette pr%ufen..." CR>
	 <COND (<VERIFY>
		<TELL "Die Diskette ist in Ordnung." CR>)
	       (T
		<TELL CR "** Diskettenfehler **" CR>)>>

<ROUTINE V-COMMAND-FILE ()
	 <DIRIN 1>
	 <RTRUE>>

<ROUTINE V-RANDOM ()
	 <COND (<NOT <EQUAL? ,PRSO ,INTNUM>>
		<TELL "Illegal call to #RND." CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<ROUTINE V-RECORD ()
	 <DIROUT 4>
	 <RTRUE>>

<ROUTINE V-UNRECORD ()
	 <DIROUT -4>
	 <RTRUE>>

;"Real Verb Functions"

<ROUTINE V-ADVENT ()
	 <TELL "A hollow voice says %>Fool%<." CR>>

;<ROUTINE V-AGAIN ("AUX" (OBJ <>))
	 <COND (<EQUAL? ,L-PRSA ,V?WALK>
		<DO-WALK ,L-PRSO>)
	       (T
		<COND (,L-PRSO
		       <COND (<OR <NOT <LOC ,L-PRSO>>
				  <FSET? ,L-PRSO ,INVISIBLE>>
			      <SET OBJ ,L-PRSO>)>)>
		<COND (,L-PRSI
		       <COND (<OR <NOT <LOC ,L-PRSI>>
				  <FSET? ,L-PRSI ,INVISIBLE>>
			      <SET OBJ ,L-PRSI>)>)>
		<COND (<AND .OBJ 
			    <NOT <EQUAL? .OBJ ;,PSEUDO-OBJECT ,ROOMS>>>
		       <TELL "You can't see " DER-ACC .OBJ " anymore." CR>
		       <RFATAL>)
		      (T
		       <PERFORM ,L-PRSA ,L-PRSO ,L-PRSI>)>)>>

<ROUTINE V-ALARM ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND %<COND (<==? ,ZORK-NUMBER 1>
			      '(<L? <GETP ,PRSO ,P?STRENGTH> 0>
		                <TELL 
DER-NOM-CAP ,PRSO " wird grob geweckt." CR>
		                <AWAKEN ,PRSO>))
			     (T
			      '(<NULL-F> <RTRUE>))>
		      (T
		       <TELL
DER-NOM-CAP ,PRSO " ist schon wach, falls du das noch nicht gemerkt
hast." CR>)>)
	       (<EQUAL? ,PRSO ,ROOMS>
		<PERFORM ,V?ALARM ,ME>
		<RTRUE>)
	       (T
		<TELL DER-NOM-CAP ,PRSO " schl%aft nicht!" CR>)>>

<ROUTINE V-ANSWER ()
	 <TELL "Keiner wartet auf deine Antwort." CR>
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <RTRUE>>

<ROUTINE V-ATTACK ("AUX" X)
	 <COND (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<TELL
"Nur ein Verr%uckter w%urde " EIN-ACC ,PRSO " angreifen." CR>)
	       ;"for 'greif troll an'"
	       (<AND <NOT ,PRSI>
		     <SET X <FIND-IN ,ADVENTURER ,WEAPONBIT>>>
		<TELL "(mit " DER-DAT .X ")" CR CR>
		<PERFORM ,V?ATTACK ,ADVENTURER .X>
		<RTRUE>)
	       (<OR <NOT ,PRSI>
		    <EQUAL? ,PRSI ,HANDS>>
		<TELL
EIN-ACC-CAP ,PRSO " mit den nackten H%anden anzugreifen ist Selbstmord." CR>)
	       (<NOT <IN? ,PRSI ,WINNER>>
		<TELL 
"Du h%alst noch nicht einmal " DER-ACC ,PRSI " in der Hand." CR>)
	       (<NOT <FSET? ,PRSI ,WEAPONBIT>>
		;<TELL
"Trying to attack " DER-ACC ,PRSO " with " EIN-DAT ,PRSI " is suicidal." CR>
		<TELL 
EIN-ACC-CAP ,PRSO " mit " EIN-DAT ,PRSI " anzugreifen ist Selbstmord." CR>)
	       (T
	        %<COND (<==? ,ZORK-NUMBER 1>
			'<HERO-BLOW>)
		       (T
			'<TELL "You can't." CR>)>)>>

<ROUTINE V-BACK ()
	 <TELL "Sorry, my memory is poor. Please give a direction." CR>>

<ROUTINE V-BLAST ()
	 <TELL "You can't blast anything by using words." CR>>

<ROUTINE PRE-BOARD ("AUX" AV)
	 <SET AV <LOC ,WINNER>>
	 <COND %<COND (<==? ,ZORK-NUMBER 3>
		       '(<EQUAL? ,PRSO ,WATER-CHANNEL ,TM-SEAT ,LAKE>
		         <RFALSE>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (<FSET? ,PRSO ,VEHBIT>
		<COND (<NOT <IN? ,PRSO ,HERE>>
		       ;<TELL
DER-NOM-CAP ,PRSO " must be on the ground to be boarded." CR>
		       <TELL
DER-NOM-CAP ,PRSO " mu%s auf der Erde sein, um bestiegen zu werden." CR>)
		      (<FSET? .AV ,VEHBIT>
		       <TELL "Du bist schon in " DER-DAT .AV "!" CR>)
		      (T
		       <RFALSE>)>)
	       (<EQUAL? ,PRSO ,WATER ,GLOBAL-WATER>
		<PERFORM ,V?SWIM ,PRSO>
		<RTRUE>)
	       (T
		<TELL
"Du hast also eine Idee, wie man in " EIN-ACC ,PRSO " einsteigt?" CR>)>
	 <RFATAL>>

<ROUTINE V-BOARD ("AUX" AV)
	 ;"Du bist jetzt in dem Zauberboot"
	 <TELL "Du bist jetzt in " DER-DAT ,PRSO "." CR>
	 <SETG OHERE <>>
	 <MOVE ,WINNER ,PRSO>
	 <APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>
	 <RTRUE>>

;<ROUTINE V-BREATHE ()
	 <PERFORM ,V?INFLATE ,PRSO ,LUNGS>>

<ROUTINE V-BRUSH ()
	 <TELL "Wenn du willst, aber um Himmels Willen, warum?" CR>>

<ROUTINE TELL-NO-PRSI ()
	 <TELL "Du hast nicht gesagt mit was!" CR>>

<ROUTINE PRE-BURN ()
	 <COND (<NOT ,PRSI>
		<TELL-NO-PRSI>)
	       (<FLAMING? ,PRSI>
	        <RFALSE>)
	       (T
	        <TELL "Mit " EIN-DAT ,PRSI " etwa?!?" CR>)>>

<ROUTINE V-BURN ()
	 <COND %<COND (<==? ,ZORK-NUMBER 2>
		       '(<EQUAL? <LOC ,PRSO> ,RECEPTACLE>
		         <BALLOON-BURN>
		         <RTRUE>))
		      (T
		       '(<NULL-F> <RFALSE>))>
	       (<FSET? ,PRSO ,BURNBIT>
		<COND (<OR <IN? ,PRSO ,WINNER>
			   <IN? ,WINNER ,PRSO>>
		       <REMOVE-CAREFULLY ,PRSO>
		       <TELL
DER-NOM-CAP ,PRSO " f%angt Feuer. Dummerweise ">
		       <COND (<IN? ,WINNER ,PRSO>
			      <TELL "warst du gerade darin">)
			     (T <TELL "hast du ihn gerade festgehalten">)>
		       <TELL ".">)
		      (T
		       <REMOVE-CAREFULLY ,PRSO>
		       <TELL
DER-NOM-CAP ,PRSO " f%angt Feuer und verbrennt." CR>)>)
	       (T
		<TELL "Du kannst " EIN-ACC ,PRSO " nicht verbrennen." CR>)>>

<ROUTINE V-CHOMP ()
	 <TELL "Preposterous!" CR>>

<ROUTINE V-CLIMB-DOWN () <V-CLIMB-UP ,P?RUNTER ,PRSO>>

<ROUTINE V-CLIMB-FOO ()
	 %<COND (<==? ,ZORK-NUMBER 3>
		 '<V-CLIMB-UP <COND (<EQUAL? ,PRSO ,ROPE ,GLOBAL-ROPE>
				     ,P?RUNTER)
				    (T ,P?RAUF)>
			      T>)
		(ELSE
		 '<V-CLIMB-UP ,P?RAUF ,PRSO>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		%<COND (<==? ,ZORK-NUMBER 3>
			'<V-CLIMB-UP ,P?RAUF T>)
		       (ELSE
			'<PERFORM ,V?BOARD ,PRSO>)>
		<RTRUE>)
	       (T
		<TELL "Du kannst nicht auf " DER-ACC ,PRSO " steigen." CR>)>>

<ROUTINE V-CLIMB-UP ("OPTIONAL" (DIR ,P?RAUF) (OBJ <>) "AUX" X TX)
	 <COND (<AND .OBJ <NOT <EQUAL? ,PRSO ,ROOMS>>>
		<SET OBJ ,PRSO>)>
	 <COND (<SET TX <GETPT ,HERE .DIR>>
		<COND (.OBJ
		       <SET X <PTSIZE .TX>>
		       <COND (<OR <EQUAL? .X ,NEXIT>
				  <AND <EQUAL? .X ,CEXIT ,DEXIT ,UEXIT>
				       <NOT <GLOBAL-IN? ,PRSO <GET .TX 0>>>>>
			      <TELL DER-NOM-CAP .OBJ " f%uhrt nicht nach ">
			      ;<COND (<NOT <EQUAL? .OBJ ,STAIRS>>
				     <TELL "es">)>
			      ;<TELL "n't lead ">
			      <COND (<==? .DIR ,P?RAUF>
				     <TELL "oben">)
				    (T <TELL "unten">)>
			      <TELL "." CR>
			      <RTRUE>)>)>
		<DO-WALK .DIR>
		<RTRUE>)
	       (<AND .OBJ
		     <ZMEMQ ,W?WAND
			    <SET X <GETPT ,PRSO ,P?SYNONYM>>
			    <- </ <PTSIZE .X> 2> 1>>
		     ;<ZMEMQ ,W?WALL
			    <SET X <GETPT ,PRSO ,P?SYNONYM>> <PTSIZE .X>>>
		<TELL "Die W%ande raufzuklettern ist sinnlos." CR>)
	       (%<COND (<==? ,ZORK-NUMBER 1>
			'<AND <NOT <EQUAL? ,HERE ,PATH>>
			      <EQUAL? .OBJ <> ,TREE>
			      <GLOBAL-IN? ,TREE ,HERE>>)
		       (ELSE '<NULL-F>)>
		<TELL "There are no climbable trees here." CR>
		<RTRUE>)
	       (<EQUAL? .OBJ <> ,ROOMS>
		<TELL "In diese Richtung kannst du nicht gehen." CR>)
	       (T
	        <TELL "You can't do that!" CR>)>>

<ROUTINE V-CLOSE-OR-LOCK ()
	 <COND (<AND <OR <FSET? ,PRSO ,CONTBIT>
			 <FSET? ,PRSO ,DOORBIT>>
		     <NOT <FSET? ,PRSO ,SURFACEBIT>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <PERFORM ,V?CLOSE ,PRSO>
		       <RTRUE>)
		      (T  ;<dont need key to lock it grating HELD? ,KEY>
		       <PERFORM ,V?LOCK ,PRSO ,HANDS>
		       <RTRUE>)>)>
	 <PERFORM ,V?CLOSE ,PRSO>
	 <RTRUE>>

<ROUTINE V-CLOSE-OR-UNLOCK ()
	 <COND (<AND <OR <FSET? ,PRSO ,CONTBIT>
			 <FSET? ,PRSO ,DOORBIT>>
		     <NOT <FSET? ,PRSO ,SURFACEBIT>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <PERFORM ,V?CLOSE ,PRSO>
		       <RTRUE>)
		      (T  ;<dont need key to lock it grating HELD? ,KEY>
		       <PERFORM ,V?UNLOCK ,PRSO ,HANDS>
		       <RTRUE>)>)>
	 <PERFORM ,V?CLOSE ,PRSO>
	 <RTRUE>>
		      
<ROUTINE V-CLOSE ()
	 <COND (<AND <NOT <FSET? ,PRSO ,CONTBIT>>
		     <NOT <FSET? ,PRSO ,DOORBIT>>>
		<TELL 
"Es ist ist einfach unm%oglich " EIN-DAT ,PRSO " zu schlie%sen." CR>)
	       (<AND <NOT <FSET? ,PRSO ,SURFACEBIT>>
		     <NOT <EQUAL? <GETP ,PRSO ,P?CAPACITY> 0>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <TELL "Geschlo%sen." CR>
		       <COND (<AND ,LIT <NOT <SETG LIT <LIT? ,HERE>>>>
			      <TELL "Es ist jetzt stockdunkel." CR>)>
		       <RTRUE>)
		      (T
	 	       <TELL 
PRONOUN-NOM-CAP ,PRSO " ist schon geschlo%sen." CR>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <TELL DER-NOM-CAP ,PRSO " ist jetzt geschlo%sen." CR>)
		      (T
	 	       <TELL PRONOUN-NOM-CAP ,PRSO " ist schon geschlo%sen." CR>)>)
	       (T
		<TELL "Du kannst das da nicht schlie%sen." CR>)>>

<ROUTINE V-COMMAND ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL DER-NOM-CAP ,PRSO " reagiert nicht." CR>)
	       (T
		<TELL "Damit kann man nicht sprechen." CR>)>>

<ROUTINE V-COUNT ()
	 ;<COND (<EQUAL? ,PRSO ,BLESSINGS>
	 	<TELL "Vergi%s nicht, du spielst Zork." CR>)>
	 <TELL "Du bist verr%uckt." CR>>

<ROUTINE V-CROSS ()
	 <TELL "Hier kannst du nicht %uberqueren." CR>>

<ROUTINE V-CURSES ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL
"Auf Unh%oflichkeiten dieser Art pflegen wir nicht zu reagieren." CR>)
		      (T
		       <TELL "Was?!" CR>)>)
	       (T
		<TELL
"Wir benutzen gew%ohnlich eine gepflegtere Sprache." CR>)>>

<ROUTINE V-CUT ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?ATTACK ,PRSO ,PRSI>)
	       (<AND <FSET? ,PRSO ,BURNBIT>
		     <FSET? ,PRSI ,WEAPONBIT>>
		<COND (<IN? ,WINNER ,PRSO>
		       ;<TELL
"Not a bright idea, especially since you're in " PRONOUN-ACC ,PRSO "." CR>
		       <TELL
"Nicht die kl%ugste Idee, denn du bist drin." CR>
		       <RTRUE>)>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL 
"Nicht die kl%ugste Idee, denn du bist drin. Deine raffinierte Navigation zermalmt " DER-ACC ,PRSO " in unz%ahlbare Splitter, die wegfliegen." CR>)
	       (<NOT <FSET? ,PRSI ,WEAPONBIT>>
		;<TELL
"The %>cutting edge%< of " D ,PRSI " is hardly adequate." CR>
		<TELL "Die scharfen Kanten haben keinen Schneid." CR>)
	       (T
		<TELL 
"Eine eigenartige Idee, " DER-ACC ,PRSO " zu zerschneiden." CR>)>>

<ROUTINE V-DEFLATE ()
	 <COND (<AND <PRSO? ,LUNGS> ;"air"
		     <ACCESSIBLE? ,INFLATED-BOAT>>
		<PERFORM ,V?DEFLATE ,INFLATED-BOAT>
		<RTRUE>)
	       (T
	        <TELL "So ein Quatsch!" CR>)>>

<ROUTINE V-DIG ()
	 <COND (<NOT ,PRSI>
		<SETG PRSI ,HANDS>)>
	 %<COND (<==? ,ZORK-NUMBER 1>
		 '<COND (<EQUAL? ,PRSI ,SHOVEL>
			 <TELL "Hier gibt es wahrlich keinen Grund zum Graben." CR>
			 <RTRUE>)>)
		(ELSE T)>
	 <COND (<FSET? ,PRSI ,TOOLBIT>
		<TELL 
 "Mit " DER-DAT ,PRSI " zu graben ist langsam und m%uhsam." CR>)
	       (T
		<TELL "Mit " EIN-DAT ,PRSI " zu graben ist bl%odsinnig." CR>)>>

<ROUTINE V-DIG-WITH ()
	 <PERFORM ,V?DIG ,GROUND ,SHOVEL>
	 <RTRUE>>

<ROUTINE V-DISEMBARK ()
	 <COND (<AND <EQUAL? ,PRSO ,ROOMS>
		     <FSET? <LOC ,WINNER> ,VEHBIT>>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (<NOT <EQUAL? <LOC ,WINNER> ,PRSO>>
		<TELL "Da bist du doch gar nicht drin!" CR>
		<RFATAL>)
	       (<FSET? ,HERE ,RLANDBIT>
		<SETG OHERE <>>
		<TELL "Du stehst wieder auf eigenen F%u%sen." CR>
		<MOVE ,WINNER ,HERE>)
	       (T
		<TELL
"Du begreifst, da%s es deinen Tod bedeuten w%urde, wenn du hier ausstiegest."
CR>
		<RFATAL>)>>

<ROUTINE V-DISENCHANT ()
	 %<COND (<==? ,ZORK-NUMBER 2>
		 '<COND (<NOT <IN? ,PRSO ,HERE>>
		         <RTRUE>)
	                (<OR <EQUAL? ,SPELL-USED ,W?FEEBLE ,W?FUMBLE ,W?FEAR>
		          <EQUAL? ,SPELL-USED ,W?FREEZE ,W?FALL ,W?FERMENT>
		          <EQUAL? ,SPELL-USED ,W?FIERCE ,W?FENCE ,W?FANTASIZE>>
		          <COND (<FSET? ,PRSO ,ACTORBIT>
		                 <COND (<EQUAL? ,SPELL-USED ,W?FEEBLE>
			                <TELL
DER-NOM-CAP ,PRSO " seems stronger now." CR>)
			               (<EQUAL? ,SPELL-USED ,W?FUMBLE>
			                <TELL
DER-NOM-CAP ,PRSO " no longer appears clumsy." CR>)
			               (<EQUAL? ,SPELL-USED ,W?FEAR>
			                <TELL
DER-NOM-CAP ,PRSO " no longer appears afraid." CR>)
			               (<EQUAL? ,SPELL-USED ,W?FREEZE>
			                <TELL
DER-NOM-CAP ,PRSO " moves again." CR>)
			               (<EQUAL? ,SPELL-USED ,W?FERMENT>
			                <TELL
DER-NOM-CAP ,PRSO " stops swaying." CR>)
			               (<EQUAL? ,SPELL-USED ,W?FIERCE>
			                <TELL
DER-NOM-CAP ,PRSO " appears more peaceful." CR>)>)>)
	                        (<EQUAL? ,SPELL-USED ,W?FLOAT>
		                 <TELL
DER-NOM-CAP ,PRSO " sinks to the ground." CR>)
	                        (<EQUAL? ,SPELL-USED ,W?FUDGE>
		                 <TELL "The sweet smell has dispersed." CR>)>)
		(T
		 '<TELL "Hier passiert garnichts." CR>)>>

<ROUTINE V-DRINK ()
	 <V-EAT>>

<ROUTINE V-DRINK-FROM ()
	 <TELL "Wie eigenartig!" CR>>

<ROUTINE PRE-DROP ()
	 <COND (<EQUAL? ,PRSO <LOC ,WINNER>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)>>

<ROUTINE V-DROP ()
	 <COND (<IDROP>
		<TELL "Fallen gelassen." CR>)>>

<ROUTINE V-EAT ("AUX" (EAT? <>) (DRINK? <>) (NOBJ <>))
	 <COND (<SET EAT? <FSET? ,PRSO ,FOODBIT>>
		<COND (<AND <NOT <IN? ,PRSO ,WINNER>>
			    <NOT <IN? <LOC ,PRSO> ,WINNER>>>
		       <TELL "Das hast du doch gar nicht in der Hand." CR>)
		      (<VERB? DRINK>
		       <TELL
"Wie in aller Welt willst du " DER-ACC ,PRSO " denn trinken?">)
		      (T
		       <TELL 
"Es tut gut, l%oscht jeglichen Durst, den du eventuell versp%urt hast.">
		       <REMOVE-CAREFULLY ,PRSO>)>
		<CRLF>)
	       (<FSET? ,PRSO ,DRINKBIT>
		<SET DRINK? T>
		<SET NOBJ <LOC ,PRSO>>
		<COND (<OR <IN? ,PRSO ,GLOBAL-OBJECTS>
			   <GLOBAL-IN? ,GLOBAL-WATER ,HERE>
			   ;<EQUAL? ,PRSO ,PSEUDO-OBJECT>>
		       <HIT-SPOT>)
		      (<OR <NOT .NOBJ>
			   <NOT <ACCESSIBLE? .NOBJ>>>
		       <TELL "Du hast doch garnichts zu trinken." CR>)
		      (<AND <ACCESSIBLE? .NOBJ>
			    <NOT <IN? .NOBJ ,WINNER>>>
		       <TELL
"Erst mu%st du doch " DER-ACC .NOBJ " in der Hand halten." CR>
		       ;"Du mu%st die Gla%sflasche erst in der Hand halten.")
		      (<NOT <FSET? .NOBJ ,OPENBIT>>
		       <TELL
"Erst mu%st du doch " DER-ACC .NOBJ " %offnen." CR>)
		      (T
		       <HIT-SPOT>)>)
	       (<NOT <OR .EAT? .DRINK?>>
		<TELL
"Ich glaube nicht, da%s dir " DER-NOM ,PRSO " bekommt.">)>>

<ROUTINE HIT-SPOT ()
	 <COND (<AND <EQUAL? ,PRSO ,WATER>
		     <NOT <GLOBAL-IN? ,GLOBAL-WATER ,HERE>>>
		<REMOVE-CAREFULLY ,PRSO>)>
	 <TELL
"Es tut gut, l%oscht jeglichen Durst, den du eventuell versp%urt hast." CR>>

<ROUTINE V-ECHO ("AUX" LST MAX (ECH 0) CNT) 
	 #DECL ((LST) <PRIMTYPE VECTOR> (MAX CNT ECH) FIX)
	 %<COND (<==? ,ZORK-NUMBER 1>
		 '<COND (<G? <GET ;B ,P-LEXV ,P-LEXWORDS> 0>
	                 <SET LST <REST 
				   ,P-LEXV
				   <* <GET ,P-LEXV ,P-LEXWORDS> ,P-WORDLEN>>>
	                 <SET MAX <- <+ <GET ;B .LST 0> <GET ;B .LST 1>> 1>>
	                 <REPEAT ()
		            <COND (<G? <SET ECH <+ .ECH 1>> 2>
			           <TELL "..." CR>
				   <RETURN>)
			          (T
			           <SET CNT <- <GET ;B .LST 1> 1>>
			           <REPEAT ()
				      <COND (<G? <SET CNT <+ .CNT 1>> .MAX>
					     <RETURN>)
					    (T
					     <PRINTC <GET ;B ,P-INBUF .CNT>>)>>
			           <TELL " ">)>>)
			(T <TELL "Echo Echo ..." CR>)>)
		(T
		 '<TELL "Echo Echo ..." CR>)>>

<ROUTINE V-ENCHANT ()
%<COND (<==? ,ZORK-NUMBER 2>
	'<COND (,WAND-ON <SETG SPELL-VICTIM ,WAND-ON>)>)
       (T
	'<NULL-F>)>
%<COND (<==? ,ZORK-NUMBER 2>
	'<COND (,SPELL-VICTIM
		<COND (<NOT ,SPELL-USED>
		       <TELL "You must be more specific." CR>
		       <RTRUE>)>
		<COND (<OR <EQUAL? ,SPELL-USED ,W?FEEBLE ,W?FUMBLE ,W?FEAR>
			   <EQUAL? ,SPELL-USED ,W?FREEZE ,W?FALL ,W?FERMENT>
			   <EQUAL? ,SPELL-USED ,W?FIERCE ,W?FENCE ,W?FANTASIZE>>
		       <COND (<FSET? ,PRSO ,ACTORBIT>
			      <TELL
"The wand stops glowing, but there is no other obvious effect." CR>)
			     (T
			      <TELL
"That might have done something, but it's hard to tell with " EIN-DAT ,PRSO "." CR>)>)
		      ;(<EQUAL? ,SPELL-USED ,W?FIREPROOF>
		       <RTRUE>)
		      (<EQUAL? ,SPELL-USED ,W?FUDGE>
		       <TELL
"A strong odor of chocolate permeates the room." CR>)
		      (<EQUAL? ,SPELL-USED ,W?FLUORESCE>
		       <FSET ,PRSO ,LIGHTBIT>
		       <FSET ,PRSO ,ONBIT>
		       <SETG LIT T>
		       <TELL
DER-NOM-CAP ,PRSO " begins to glow." CR>)
		      (<EQUAL? ,SPELL-USED ,W?FILCH>
		       <SETG SPELL-HANDLED? T>
		       <COND (<FSET? ,PRSO ,TAKEBIT>
			      <MOVE ,PRSO ,WINNER>
			      <SCORE-OBJ ,PRSO>
			      <TELL "Filched!" CR>)
			     (ELSE
			      <TELL "You can't filch " DER-ACC ,PRSO "!" CR>)>)
		      (<AND <EQUAL? ,SPELL-USED ,W?FLOAT>
			    <FSET? ,PRSO ,TAKEBIT>>
		       <COND (<AND <EQUAL? ,SPELL-VICTIM ,COLLAR>
				   <IN? ,COLLAR ,CERBERUS>>
			      <SETG SPELL-VICTIM ,CERBERUS>)>
		       <TELL
DER-NOM-CAP ,PRSO " floats serenely in midair." CR>)
		      (<AND <EQUAL? ,SPELL-USED ,W?FRY>
			    <FSET? ,PRSO ,TAKEBIT>>
		       <SETG SPELL-HANDLED? T>
		       <REMOVE-CAREFULLY ,PRSO>
		       <TELL DER-NOM-CAP ,PRSO " goes up in a puff of smoke." CR>)
		      (ELSE
		       <SETG SPELL-VICTIM <>>
		       <TELL
"The wand stops glowing, but there is no other apparent effect." CR>)>)
	       (ELSE
		<SETG SPELL-VICTIM <>>
		<TELL "Hier passiert garnichts." CR>)>)
       (T
	'<V-DISENCHANT>)>>

<ROUTINE REMOVE-CAREFULLY (OBJ "AUX" OLIT)
	 <COND (<EQUAL? .OBJ ,P-IT-OBJECT>
		<SETG P-IT-OBJECT <>>)>
	 <COND (<EQUAL? .OBJ ,P-HER-OBJECT>
		<SETG P-HER-OBJECT <>>)>
	 <COND (<EQUAL? .OBJ ,P-HIM-OBJECT>
		<SETG P-HIM-OBJECT <>>)>
	 <SET OLIT ,LIT>
	 <REMOVE .OBJ>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<AND .OLIT <NOT <EQUAL? .OLIT ,LIT>>>
		<TELL "Du tappst im Dunkeln." CR>)>
	 T>

<ROUTINE V-ENTER ()
	<DO-WALK ,P?HINEIN>>

<ROUTINE V-EXAMINE ()
	 <COND (<GETP ,PRSO ,P?TEXT>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
	       (<OR <FSET? ,PRSO ,CONTBIT>
		    <FSET? ,PRSO ,DOORBIT>>
		<V-LOOK-INSIDE>)
	       (T
		<TELL "Da ist nichts Besonderes an " DER-ACC ,PRSO "." CR>)>>

<ROUTINE V-EXIT ()
	 <COND (<AND <EQUAL? ,PRSO <> ,ROOMS>
		     <FSET? <LOC ,WINNER> ,VEHBIT>>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (<AND ,PRSO <IN? ,WINNER ,PRSO>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (ELSE
		<DO-WALK ,P?RAUS>)>>

<ROUTINE V-EXORCISE ()
	 <TELL "Was f%ur eine Schnappsidee!" CR>>

<ROUTINE PRE-FILL ("AUX" TX)
	 <COND (<NOT ,PRSI>
		<SET TX <GETPT ,HERE ,P?GLOBAL>>
		<COND (<AND .TX <ZMEMQ ,GLOBAL-WATER .TX <- </ <PTSIZE .TX> 2> 1>>>
		       <PERFORM ,V?FILL ,PRSO ,GLOBAL-WATER>
		       <RTRUE>)
		      (<IN? ,WATER <LOC ,WINNER>>
		       <PERFORM ,V?FILL ,PRSO ,WATER>
		       <RTRUE>)
		      (T
		       <TELL 
"Da ist nichts, mit dem man " DER-ACC ,PRSO " f%ullen k%onnte." CR>
		       <RTRUE>)>)>
	 <COND (<EQUAL? ,PRSI ,WATER>
		<RFALSE>)
	       (<NOT <EQUAL? ,PRSI ,GLOBAL-WATER>>
		<PERFORM ,V?PUT ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE V-FILL ()
	 <COND (<NOT ,PRSI>
		<COND (<GLOBAL-IN? ,GLOBAL-WATER ,HERE>
		       <PERFORM ,V?FILL ,PRSO ,GLOBAL-WATER>
		       <RTRUE>)
		      (<IN? ,WATER <LOC ,WINNER>>
		       <PERFORM ,V?FILL ,PRSO ,WATER>
		       <RTRUE>)
		      (T
		       <TELL 
"Da ist nichts, mit dem man " DER-ACC ,PRSO " f%ullen k%onnte." CR>)>)
	       (T
		<TELL "You may know how to do that, but I don't." CR>)>>

<ROUTINE V-FIND ("AUX" L)
	 <SET L <LOC ,PRSO>>
	 <COND (<EQUAL? ,PRSO ,HANDS ,LUNGS>
		<TELL
"Within six feet of your head, assuming you haven't left that
somewhere." CR>)
	       (<EQUAL? ,PRSO ,ME>
		<TELL "Du bist doch hier irgendwo in der N%ahe." CR>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<TELL "Du findest " PRONOUN-ACC ,PRSO "." CR>)
	       (<IN? ,PRSO ,WINNER>
		<TELL "Du hast " PRONOUN-ACC ,PRSO "." CR>)
	       (<OR <IN? ,PRSO ,HERE>
		    <GLOBAL-IN? ,PRSO ,HERE>
		    ;<EQUAL? ,PRSO ,PSEUDO-OBJECT>>
		<TELL PRONOUN-NOM-CAP ,PRSO " ist hier." CR>)
	       (<FSET? .L ,ACTORBIT>
		<TELL DER-NOM-CAP .L " hat " PRONOUN-ACC ,PRSO "." CR>)
	       (<FSET? .L ,SURFACEBIT>
		<TELL PRONOUN-NOM-CAP ,PRSO " ist auf " DER-DAT .L "." CR>)
	       (<FSET? .L ,CONTBIT>
		<TELL PRONOUN-NOM-CAP ,PRSO " in " DER-DAT .L "." CR>)
	       (T
		<TELL "Da bist du bei mir an der falschen Adresse." CR>)>>

<ROUTINE V-FOLLOW ()
	 <TELL "Du bist narrisch!" CR>>

<ROUTINE V-FROBOZZ ()
	 <TELL
"Die FROBOZZ FIRMA gr%undete, besitzt und leitet diesen Kerker." CR>>

<ROUTINE PRE-GIVE ()
	 <COND (<NOT <HELD? ,PRSO>>
		<TELL 
"Das kannst du leicht sagen, denn du besitzt ja nicht einmal " 
DER-ACC ,PRSO "." CR>)>>

<ROUTINE V-GIVE ()
	 <COND (<NOT <FSET? ,PRSI ,ACTORBIT>>
		;<TELL "You can't give " EIN-ACC ,PRSO " to " EIN-DAT ,PRSI "!" CR>
		<TELL 
"Du kannst " EIN-DAT ,PRSI " doch nicht " EIN-ACC ,PRSO " geben!">)
	       (T
		<TELL 
DER-NOM-CAP ,PRSI " lehnt " PRONOUN-ACC ,PRSI " h%oflich ab." CR>)>>

<ROUTINE V-HATCH ()
	 <TELL "Bizarre!" CR>>

<GLOBAL HS 0> ;"counts occurences of HELLO, SAILOR"

<ROUTINE V-HELLO ()
	 <COND (<AND ,PRSO
		     <NOT <PRSO? ,ROOMS>>>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL
DER-NOM-CAP ,PRSO " gr%u%st dich mit einem Kopfnicken." CR>)
		      (T
		       <TELL
"Es ist eine alte Suppe, da%s nur Verr%uckte zu " EIN-DAT ,PRSO ":
%>Guten Tag%< sagen." CR>)>)
	       (T
		<TELL <PICK-ONE ,HELLOS> CR>)>>

<ROUTINE V-HINTS-OFF ()
	 <TELL "Tips sind f%uer diese Runde abgestellt." CR>
	 <SETG HINTS-OFF T>>

<ROUTINE V-INCANT ()
%<COND (<==? ,ZORK-NUMBER 2>
	'<COND (,SPELL-USED
		<TELL "Hier passiert garnichts." CR>)
	       (,WAND-ON
		<SETG SPELL-VICTIM ,WAND-ON>
		<SETG SPELL-USED <GET ,P-LEXV ,P-CONT>>
		<TELL "The wand glows very brightly for a moment." CR>
		<ENABLE <QUEUE I-SPELL <+ 10 <RANDOM 10>>>>
		<SETG WAND-ON <>>
		<PERFORM ,V?ENCHANT ,SPELL-VICTIM>)
	       (T
		<TELL
"The incantation echoes back faintly, but nothing else happens." CR>)>)
       (T
	'<TELL
"The incantation echoes back faintly, but nothing else happens." CR>)>
	 <SETG QUOTE-FLAG <>>
	 <SETG P-CONT <>>
	 <RTRUE>>

<ROUTINE V-INFLATE ()
	 <COND (<AND <ACCESSIBLE? ,PUMP>
		     <OR <PRSO? ,INFLATED-BOAT>
			 <PRSO? ,INFLATABLE-BOAT>
			 <PRSO? ,PUNCTURED-BOAT>>>
		<TELL "(mit " DER-DAT ,PUMP ")" CR CR>
		<PERFORM ,V?INFLATE ,PRSO ,PUMP>
		<RTRUE>)
	       (T
		<TELL "Wie willst du das denn aufblasen?" CR>)>>

<ROUTINE V-KICK () 
	 <TELL 
DER-ACC-CAP ,PRSO " mit dem Fu%s treten, scheint nicht zu funktionieren." CR>>

<ROUTINE V-KISS ()
	 <TELL 
"Da w%urdest du lieber einen Ochs zwischen den H%ornern k%ussen." CR>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "Niemand zu Hause." CR>)
	       (T
		<TELL "Warum an " EIN-ACC ,PRSO " klopfen?" CR>)>>

<ROUTINE V-LAMP-OFF ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<NOT <FSET? ,PRSO ,ONBIT>>
		       <TELL PRONOUN-NOM-CAP ,PRSO " ist schon aus." CR>)
		      (T
		       <FCLEAR ,PRSO ,ONBIT>
		       <COND (,LIT
			      <SETG LIT <LIT? ,HERE>>)>
		       <TELL "O.K. " DER-NOM ,PRSO " ist jetzt aus." CR>
		       <COND (<NOT ,LIT>
			      <TELL "Es ist jetzt stockdunkel." CR>)>)>)
	       (T
		<TELL "Das kannst du nicht ausmachen." CR>)>
	 <RTRUE>>

<ROUTINE V-LAMP-ON ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <TELL PRONOUN-NOM-CAP ,PRSO " ist schon an." CR>)
		      (T
		       <FSET ,PRSO ,ONBIT>
		       <TELL DER-NOM-CAP ,PRSO " ist nun an." CR>
		       <COND (<NOT ,LIT>
			      <SETG LIT <LIT? ,HERE>>
			      <CRLF>
			      <V-LOOK>)>)>)
	       (<FSET? ,PRSO ,BURNBIT>
		<TELL
"Wenn du " DER-ACC ,PRSO " verbrennen willst, mu%st du's sagen." CR>)
	       (T
		<TELL "Das kannst du nicht anmachen." CR>)>
	 <RTRUE>>

<ROUTINE V-LAUNCH ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		;<TELL "You can't launch that by saying %>launch%<!" CR>
		<TELL 
"Du kannst das nicht absto%sen, in dem du %>Absto%sen%<
sagst.">)
	       (T
		<TELL "Das ist ziemlich absurd." CR>)>>

<ROUTINE V-LEAN-ON ()
	 <TELL "Bist du m%ude?" CR>>

<ROUTINE V-LEAP ("AUX" TX S)
	 <COND (,PRSO
		<COND (<IN? ,PRSO ,HERE>
		       <COND (<FSET? ,PRSO ,ACTORBIT>
			      <TELL
DER-NOM-CAP ,PRSO " ist zu gro%s, um %uber ihn zu springen." CR>)
			     (T
			      <V-SKIP>)>)
		      (T
		       <TELL "Das w%are ein toller Trick." CR>)>)
	       (<SET TX <GETPT ,HERE ,P?RUNTER>>
		<SET S <PTSIZE .TX>>
		<COND (<OR <EQUAL? .S 3 ;2> ;NEXIT
       			   <AND <EQUAL? .S 5 ;4> ;CEXIT
				<NOT <VALUE <GETB ;B .TX 1>>>>>
		       <TELL
"Das war nicht der sicherste Platz f%ur den Absprung." CR>
		       <JIGS-UP <PICK-ONE ,JUMPLOSS>>)
		      %<COND (<==? ,ZORK-NUMBER 1>
			      '(<EQUAL? ,HERE ,UP-A-TREE>
		                <TELL
"In einem Anflug von ungew%ohnlicher Waghalsigkeit, hast du es geschafft, auf beiden F%u%sen zu landen, ohne dich umzubringen." CR CR>
		                <DO-WALK ,P?RUNTER>
		                <RTRUE>))
			     (T '(<NULL-F> T))>
		      (T
		       <V-SKIP>)>)
	       (T
		<V-SKIP>)>>

<GLOBAL JUMPLOSS
	<LTABLE 0
	       "Du h%attest erst mal gucken sollen, ehe du gesprungen bist."
	       "Im Film w%urde jetzt dein ganzes Leben schnell noch mal an dir vorbeispielen. Hiiiilfe.">>

<ROUTINE V-LEAVE ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?RAUS>)
	       (T
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LISTEN ()
	 <TELL "Im Moment gibt " DER-NOM ,PRSO " keinen Laut von sich." CR>>

<ROUTINE V-LOCK ()
	 <TELL "Das scheint nicht zu funktionieren." CR>>

<ROUTINE V-LOOK ()
	 <COND (<DESCRIBE-ROOM T>
		<DESCRIBE-OBJECTS T>)>>

<ROUTINE V-LOOK-BEHIND ()
	 <TELL "Da ist nichts hinter " DER-DAT ,PRSO "." CR>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL
DER-NOM-CAP ,PRSO " ist ge%offnet, aber du kannst nicht sehen, was
dahinter ist.">)
		      (T
		       <TELL DER-NOM-CAP ,PRSO " ist geschlo%sen.">)>
		<CRLF>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL "Da gibt's nichts Besonderes zu sehen." CR>)
		      (<SEE-INSIDE? ,PRSO>
		       <COND (<AND <FIRST? ,PRSO>
				   <PRINT-CONT ,PRSO>>
			      <RTRUE>)
			     %<COND (<==? ,ZORK-NUMBER 3>
				     '(<FSET? ,PRSO ,SURFACEBIT>
				       <TELL
"Da ist nichts auf " DER-DAT ,PRSO "." CR>))
				    (ELSE '(<NULL-F> <RTRUE>))>
			     (T
			      <TELL DER-NOM-CAP ,PRSO " ist leer." CR>)>)
		      (T
		       <TELL DER-NOM-CAP ,PRSO " ist geschlo%sen." CR>)>)
	       (T
		<TELL 
"Du kannst nicht in " EIN-DAT ,PRSO " hineingucken." CR>)>>

<ROUTINE V-LOOK-ON ()
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Weird." CR>)>>

<ROUTINE V-LOOK-UNDER ()
	 <TELL "Da gibt es nichts als Staub." CR>>

<ROUTINE V-LOWER () 
	 <TELL "So mit " DER-DAT ,PRSO " zu spielen, ist nicht hilfreich." CR>>

<ROUTINE V-MAKE ()
    	<TELL "Das kannst du nicht." CR>>

<ROUTINE V-MELT ()
	 <TELL 
"Es ist nicht gesagt, da%s man " EIN-NOM ,PRSO " schmelzen kann." CR>>

<ROUTINE PRE-MOVE ()
	 <COND (<HELD? ,PRSO>
		<TELL
"Deine Jonglierk%unste sind nicht gut genug daf%ur." CR>)>>

<ROUTINE V-MOVE ()
	 <COND (<FSET? ,PRSO ,TAKEBIT>
		<TELL "Wenn man " DER-ACC ,PRSO " wegnimmt, kommt nichts zum Vorschein." CR>)
	       (T
		<TELL 
DER-ACC-CAP ,PRSO " kann man nicht aus dem Weg schieben." CR>)>>

<ROUTINE V-MUMBLE ()
	 <TELL "You'll have to speak up if you expect me to hear you!" CR>>

<ROUTINE PRE-MUNG ()
	 <COND %<COND (<==? ,ZORK-NUMBER 3>
		       '(<EQUAL? ,PRSO ,BEAM>
		         <RFALSE>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (<OR <NOT ,PRSI>
		    <NOT <FSET? ,PRSI ,WEAPONBIT>>>
		;<TELL "Trying to destroy " DER-ACC ,PRSO " with ">
		<TELL "Es ist sinnlos, " DER-ACC ,PRSO " mit ">
		<COND (<NOT ,PRSI>
		       <TELL "blo%sen F%austen">)
		      (T
		       <TELL EIN-DAT ,PRSI>)>
		<TELL " zerst%oren zu wollen." CR>)>>

<ROUTINE V-MUNG ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?ATTACK ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Gutgemeinter Versuch..." CR>)>>

<ROUTINE V-NO ()
	 <V-YES>>

<ROUTINE V-ODYSSEUS ()
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<AND <EQUAL? ,HERE ,CYCLOPS-ROOM>
			      <IN? ,CYCLOPS ,HERE>
			      <NOT ,CYCLOPS-FLAG>>
		         <DISABLE <INT I-CYCLOPS>>
		         <SETG CYCLOPS-FLAG T>
		         <TELL 
"Als der Zyklop von der t%odlichen Strafe seines Vaters h%ort, entflieht er aus dem Zimmer, indem er die Ostwand des Zimmers niederrennt." CR>
		        <SETG MAGIC-FLAG T>
		        <FCLEAR ,CYCLOPS ,FIGHTBIT>
		        <REMOVE-CAREFULLY ,CYCLOPS>))
		      (T
		       '(<NULL-F> T))>
	       (T
		<TELL "War er nicht ein Seemann?" CR>)>>

<ROUTINE V-OIL ()
	 <TELL "Du bist wohl auch so einer, der Spinat ins Auto tankt?" CR>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<EQUAL? ,PRSO ,ROPE>
		<PERFORM ,V?UNTIE ,ROPE>
		<RTRUE>)
	       (<AND <FSET? ,PRSO ,CONTBIT>
		     <NOT <EQUAL? <GETP ,PRSO ,P?CAPACITY> 0>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL PRONOUN-NOM-CAP ,PRSO " ist schon offen." CR>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>> <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Ge%offnet." CR>)
			     (<AND <SET F <FIRST? ,PRSO>>
				   <NOT <NEXT? .F>>
				   <NOT <FSET? .F ,TOUCHBIT>>
				   <SET STR <GETP .F ,P?FDESC>>>
			      <TELL 
DER-NOM-CAP ,PRSO " l%a%st sich %offnen." CR>
			      <TELL .STR CR>)
			     (T
			      <TELL 
DER-NOM-CAP ,PRSO ", der ge%offnet ist, enth%alt ">
			      <PRINT-CONTENTS ,PRSO>
			      <TELL "." CR>)>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL PRONOUN-NOM-CAP ,PRSO " ist schon offen." CR>)
		      (T
		       <TELL DER-NOM-CAP ,PRSO " %offnet." CR>
		       <FSET ,PRSO ,OPENBIT>)>)
	       (T
		<TELL
"Du scheinst " EIN-ACC ,PRSO " nicht %offnen zu k%onnen." CR>)>>

<ROUTINE V-OVERBOARD ("AUX" LOCN)
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,PRSI ,TEETH>
			 <COND (<FSET? <SET LOCN <LOC ,WINNER>> ,VEHBIT>
				<MOVE ,PRSO <LOC .LOCN>>
				<TELL "Ahoy -- " D ,PRSO " %uber Bord!" CR>)
			       (T
				<TELL "You're not in anything!" CR>)>))
		      (T '(<NULL-F> T))>
	       (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?THROW ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Huh?" CR>)>>

<ROUTINE V-PICK () <TELL "Das kannst du nicht knacken." CR>>

<ROUTINE V-PLAY ()
    <COND (<FSET? ,PRSO ,ACTORBIT>
	   <TELL
"Du spielst die Rolle so echt, da%s du dich selber umbringst, genau wie er es h%atte tun k%onnen." CR>
	   <JIGS-UP "">)
	  (ELSE <TELL "Das ist bl%od." CR>)>>

<ROUTINE V-PLUG ()
	 <TELL "Erfolglos." CR>>

<ROUTINE V-POUR-ON ()
	 <COND (<EQUAL? ,PRSO ,WATER>
		<REMOVE-CAREFULLY ,PRSO>
	        <COND (<FLAMING? ,PRSI>
		       <TELL DER-NOM-CAP ,PRSI " ist schon aus." CR>
		       %<COND (<==? ,ZORK-NUMBER 2>
			       '<COND (<EQUAL? ,PRSI ,BINF-FLAG>
				       <SETG BINF-FLAG <>>)>)
			      (ELSE '<NULL-F>)>
		       <FCLEAR ,PRSI ,ONBIT>
		       <FCLEAR ,PRSI ,FLAMEBIT>)
	              (T
		       <TELL
 "Das Wasser flie%st %uber " DER-ACC ,PRSI " auf den Fu%sboden und verdampft." CR>)>)
	       %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,PRSO ,PUTTY>
			 <PERFORM ,V?PUT ,PUTTY ,PRSI>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (T
		<TELL "Das l%a%st sich nicht gie%sen." CR>)>>

<ROUTINE V-PRAY ()
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,HERE ,SOUTH-TEMPLE>
		         <GOTO ,FOREST-1>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (T
		<TELL
"Wenn du gen%ugend betest, dann werden deine Gebete vielleicht erh%ort." CR>)>>

<ROUTINE V-PUMP ()
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<AND ,PRSI <NOT <EQUAL? ,PRSI ,PUMP>>>
		         <TELL 
"Pump" PRONOUN-ACC ,PRSO " up with " EIN-DAT ,PRSI "?" CR>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       %<COND (<==? ,ZORK-NUMBER 1>
		       '(<IN? ,PUMP ,WINNER>
		         <PERFORM ,V?INFLATE ,PRSO ,PUMP>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (T
		<TELL "It's really not clear how." CR>)>>

<ROUTINE V-PUSH () 
	 <TELL DER-ACC-CAP ,PRSO " schieben ist erfolglos." CR>>

<ROUTINE V-PUSH-TO ()
	 <TELL "Dahin kann man nichts schieben." CR>>

<ROUTINE PRE-PUT ()
	 <COND %<COND (<==? ,ZORK-NUMBER 3>
		       '(<EQUAL? ,PRSO ,SHORT-POLE>
		         <RFALSE>))
		      (T
		       '(<NULL-F>
			 <RFALSE>))>
	       (T
		<PRE-GIVE>)>> ;"That's easy for you to say"

<ROUTINE V-PUT ()
	 <COND (<OR <FSET? ,PRSI ,OPENBIT>
		    <OPENABLE? ,PRSI>
		    <FSET? ,PRSI ,VEHBIT>>)
	       (T
		<TELL "Das geht nicht." CR>
		<RTRUE>)>
	 <COND (<NOT <FSET? ,PRSI ,OPENBIT>>
		<TELL DER-NOM-CAP ,PRSI " ist nicht offen." CR>
		<THIS-IS-IT ,PRSI>)
	       (<EQUAL? ,PRSI ,PRSO>
		<TELL "Wie willst du das denn anstellen?" CR>)
	       (<IN? ,PRSO ,PRSI>
		;<TELL 
DER-NOM-CAP ,PRSO " is already in " DER-DAT ,PRSI "." CR>
		<TELL DER-NOM-CAP ,PRSO " ist schon " DER-DAT ,PRSI "." CR>)
	       (<G? <- <+ <WEIGHT ,PRSI> <WEIGHT ,PRSO>>
		       <GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<TELL "Da ist wirklich kein Platz mehr." CR>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <FSET? ,PRSO ,TRYTAKEBIT>>
		<TELL "Du hast " DER-ACC ,PRSO " ja gar nicht." CR>
		<RTRUE>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <NOT <ITAKE>>>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<SCORE-OBJ ,PRSO>
		<TELL "Geschafft." CR>)>>

<ROUTINE V-PUT-BEHIND ()
	 <TELL "Das Versteck ist nicht sicher." CR>>

<ROUTINE V-PUT-ON ()
	 <COND (<EQUAL? ,PRSI ,GROUND>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<V-PUT>)
	       (T
		<TELL 
DER-NOM-CAP ,PRSI " hat keine gute Oberfl%ache." CR>)>>

<ROUTINE V-PUT-UNDER ()
	 <TELL "You can't do that." CR>>

<ROUTINE V-RAISE ()
	 <V-LOWER>>

;<ROUTINE V-RAPE ()
	 <TELL "What a (ahem!) strange idea." CR>>

<ROUTINE PRE-READ ()
	 <COND (<NOT ,LIT>
		<TELL "Es ist unm%oglich im Dunkeln zu lesen." CR>)
	       (<AND ,PRSI <NOT <FSET? ,PRSI ,TRANSBIT>>>
		<TELL "Wie kann man durch " EIN-ACC ,PRSI " hindurchsehen?" CR>)>>

<ROUTINE V-READ ()
	 <COND (<NOT <FSET? ,PRSO ,READBIT>>
	        ;<NOT <GETP ,PRSO ,P?TEXT>>
		<TELL "Wie kann man " EIN-ACC ,PRSI " lesen?" CR>)
	       (T
		<TELL <GETP ,PRSO ,P?TEXT> CR>)>>

<ROUTINE V-READ-PAGE ()
	 <PERFORM ,V?READ ,PRSO>
	 <RTRUE>>

<ROUTINE V-REPENT ()
	 <TELL "Es k%onnte m%oglicherweise schon zu sp%at sein." CR>>

<ROUTINE V-REPLY ()
	 <TELL "Es ist unwahrscheinlich, da%s sich " DER-NOM ,PRSO " daf%ur interesiert." CR>
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <RTRUE>>

<ROUTINE V-RING ()
	 <TELL "Wie, um Himmels Willen, soll man damit klingeln?" CR>>

<ROUTINE V-RUB () 
	 <TELL "Den Tisch reiben ist nicht hilfreich.">>

<ROUTINE V-SAY ("AUX" V)
	 %<COND (<==? ,ZORK-NUMBER 2>
		 '<COND (<OR ,SPELL-USED ,WAND-ON>
		         <PERFORM ,V?INCANT>
		         <RTRUE>)>)
		(<==? ,ZORK-NUMBER 3>
		 '<COND (<AND <FSET? ,FRONT-DOOR ,TOUCHBIT>
		              <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?FROTZ>
		              <EQUAL? <GET ,P-LEXV <+ ,P-CONT 2>> ,W?OZMOO>>
		         <SETG P-CONT <>>
		         <COND (<EQUAL? ,HERE ,MSTAIRS>
		                <CRLF>
		                <GOTO ,FRONT-DOOR>)
		               (T
		                <TELL "Hier passiert garnichts." CR>)>
		                <RTRUE>)>)
		(T
		 '<COND (<NOT ,P-CONT>
			 <TELL "Was?" CR>
			 <RTRUE>)>)>
	 <SETG QUOTE-FLAG <>>
	 <COND (<SET V <FIND-IN ,HERE ,ACTORBIT>>
		;<TELL "You must address " DER-ACC .V "Directly." CR>
		<TELL 
"Um zu den Personen zu sprechen, tippe:|
>PERSON, TAG|
oder|
>PERSON, LASS DER AXT FALLEN|
(usw.)|">
		<SETG P-CONT <>>)
	       (<NOT <EQUAL? <GET ,P-LEXV ,P-CONT> ;,W?HELLO ,W?HALLO>>
	        <SETG P-CONT <>>
		<TELL
"Selbstgespr%ache deuten auf einen bevorstehenden Nervenzusammenbruch hin." CR>)>
	 <RTRUE>>

<ROUTINE V-SEARCH ()
	 <TELL "Du findest nichts Ungew%ohnliches." CR>>

<ROUTINE V-SEND ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "Warum w%urdest du " DER-ACC ,PRSO " rufen lassen?" CR>)
	       (T
		<TELL "Das ist Unsinn." CR>)>>

<ROUTINE V-SCHENKE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?GIVE ,PRSI ,PRSO>)
	       (<FSET? ,PRSI ,ACTORBIT>
		<PERFORM ,V?GIVE ,PRSO ,PRSI>)
	       (T
		<PERFORM ,V?DROP ,PRSO ,PRSI>)>
	 <RTRUE>>

<ROUTINE PRE-SGIVE ()
	 <COND (<FSET? ,PRSI ,ACTORBIT> ;"gib es ihm"
		<PERFORM ,V?GIVE ,PRSO ,PRSI>
		<RTRUE>)
	       (T ;"gib ihm es"
	        <PERFORM ,V?GIVE ,PRSI ,PRSO>)>
	 <RTRUE>>

<ROUTINE V-SGIVE ()
	 <TELL "Foo!" CR>>

<ROUTINE V-SHAKE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "Das scheint keinen Zweck zu haben." CR>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<TELL 
"Du kannst " PRONOUN-ACC ,PRSO  " nicht wegnehmen, also kannst du "
PRONOUN-ACC ,PRSO " auch nicht sch%utteln." CR>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <COND (<FIRST? ,PRSO>
			      <SHAKE-LOOP>
			      <TELL "Der Inhalt f%allt "> 
	                      <COND (%<COND (<==? ,ZORK-NUMBER 3>
					     '<FSET? ,HERE ,NONLANDBIT>)
					    (ELSE
					     '<NOT <FSET? ,HERE ,RLANDBIT>>)>
		                     <TELL "heraus und verschwindet">)
	                            (T
		                     <TELL "auf die Erde">)>
	                      <TELL "." CR>)
			     (T
			      <TELL "Geschafft." CR>)>)
		      (T
		       <COND (<FIRST? ,PRSO>
			      <TELL
"Es h%ort sich an, als w%are da etwas in " DER-DAT ,PRSO "." CR>)
			     (T
			      <TELL 
DER-NOM-CAP ,PRSO " h%ort sich leer an." CR>)>)>)
	       (T
		<TELL "Shaken." CR>)>>

<ROUTINE SHAKE-LOOP ("AUX" X)
	 <REPEAT ()
		 <COND (<SET X <FIRST? ,PRSO>>
			<FSET .X ,TOUCHBIT>
			<MOVE .X
			      %<COND (<==? ,ZORK-NUMBER 1>
				      '<COND (<EQUAL? ,HERE ,UP-A-TREE>
				              ,PATH)
				             (<NOT <FSET? ,HERE ,RLANDBIT>>
				              ;,PSEUD-OBJECT ,STREAM)
				             (T
				              ,HERE)>)
				     (<==? ,ZORK-NUMBER 2>
				      '<COND (<EQUAL? .X ,WATER>
				              ,PSEUDO-OBJECT)
				             (<NOT <FSET? ,HERE ,RLANDBIT>>
				              ,PSEUDO-OBJECT)
				             (T
				              ,HERE)>)
				     (T
				      '<COND (<EQUAL? ,HERE ,ON-LAKE>
					      ,IN-LAKE)
					     (T
					      ,HERE)>)>>)
		       (T
			<RETURN>)>>>

<ROUTINE V-SKIP ()
	 <TELL <PICK-ONE ,WHEEEEE> CR>>

<GLOBAL WHEEEEE
	<LTABLE 0 "Ausgezeichnet. Du bist in die 4. Klasse versetzt!"
		  "Macht's dir Spa%s?"
		  "Jaaaaaaaaaa!!!!!"
		  "Soll ich etwa Beifall klatschen?">>

<ROUTINE V-SMELL ()
	 <TELL 
PRONOUN-NOM-CAP ,PRSO " riecht genau wie " EIN-NOM ,PRSO "." CR>>

<ROUTINE V-SPIN ()
	 <TELL "Den kannst du nicht rumwirbeln!" CR>>

<ROUTINE V-SPRAY ()
	 <V-SQUEEZE>>

<ROUTINE V-SQUEEZE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL DER-NOM-CAP ,PRSO " versteht das nicht.">)
	       (T
		<TELL "Wie einmalig sinnlos.">)>
	 <CRLF>>

<ROUTINE V-SSPRAY ()
	 <PERFORM ,V?SPRAY ,PRSI ,PRSO>>

<ROUTINE V-STAB ("AUX" W)
	 <COND (<SET W <FIND-WEAPON ,WINNER>>
		<PERFORM ,V?ATTACK ,PRSO .W>
		<RTRUE>)
	       (T
		<TELL
"Du hast wohl vor, " DER-ACC ,PRSO " mit dem kleinen Finger zu
erdolchen." CR>)>>

<ROUTINE V-STAND ()
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (T
		<TELL "Du stehst schon." CR>)>>

<ROUTINE V-STAY ()
	 <TELL "Du r%uhrst dich nicht." CR>>

;"WAS USED FOR 'SCHLAG OBJECT'"
;<ROUTINE V-STRIKE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		;<TELL
"Since you aren't versed in hand-to-hand combat, you'd better attack "
DER-ACC ,PRSO " with a weapon." CR>
		<TELL "Da du im Faustkampf nicht ge%ubt bist, greifst du " DER-ACC ,PRSO " besser mit einer Waffe an." CR>)
	       (T
		<PERFORM ,V?LAMP-ON ,PRSO>
		<RTRUE>)>>

<ROUTINE V-SWIM ()
	 <COND %<COND (<OR <==? ,ZORK-NUMBER 1>
			   <==? ,ZORK-NUMBER 2>>
		       '(<GLOBAL-IN? ,GLOBAL-WATER ,HERE>
		         <TELL 
"Schwimmen im Kerker ist gew%ohnlich verboten.">
		         ;<COND (<AND ,PRSO
				     <NOT <EQUAL? ,PRSO ,WATER ,GLOBAL-WATER>>>
	                        <TELL DER-DAT ,PRSO ".">)
		               (T
		                <TELL "dungeon.">)>
		         <CRLF>))
		      (T
		       '(<EQUAL? ,HERE ,ON-LAKE ,IN-LAKE>
		         <TELL "You're doing it." CR>))>
	       %<COND (<==? ,ZORK-NUMBER 3>
		       '(<EQUAL? ,HERE ,FLATHEAD-OCEAN>
		         <TELL
"Between the rocks and waves, you wouldn't last a minute!" CR>))
		      (T
		       '(<NULL-F>
			 <RFALSE>))>
	       (T
		<TELL "Geh baden." CR>)>>

<ROUTINE V-SWING ()
	 <COND (<NOT ,PRSI>
		<TELL "Huiiii!" CR>)
	       (T
		<PERFORM ,V?ATTACK ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE V-TRAGE ()
	 <COND (<AND <HELD? ,PRSO>
		     <FSET? ,PRSO ,WEARBIT>>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE PRE-TAKE ()
	 <COND (<IN? ,PRSO ,WINNER>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <TELL 
"Du hast " DER-ACC ,PRSO " doch schon an." CR>)
		      (T
		       <TELL "Das hast du doch schon!" CR>)>)
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL
"Was in einem geschlo%senen Beh%alter ist, kannst man nicht anfassen." CR>
		<RTRUE>)
	       (,PRSI
		<COND (<EQUAL? ,PRSI ,GROUND>
		       <SETG PRSI <>>
		       <RFALSE>)>
		%<COND (<==? ,ZORK-NUMBER 2>
			'<COND (<EQUAL? ,PRSO ,DOOR-KEEPER>
				<SETG PRSI <>>
				<RFALSE>)>)
		       (ELSE
			'<NULL-F>)>
		<COND (<NOT <EQUAL? ,PRSI <LOC ,PRSO>>>
		       <TELL 
DER-NOM-CAP ,PRSO " ist doch garnicht in " DER-DAT ,PRSI "." CR>)
		      (T
		       <SETG PRSI <>>
		       <RFALSE>)>)
	       (<EQUAL? ,PRSO <LOC ,WINNER>>
		<TELL "Du bist drin." CR>)>>

<ROUTINE V-TAKE ()
	 <COND (<EQUAL? <ITAKE> T>
		<COND (<FSET? ,PRSO ,WEARBIT>
		       <TELL "Jetzt hast du " DER-ACC ,PRSO " an." CR>)
		      (T
		       <TELL "Genommen." CR>)>)>>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (,P-CONT
		       <SETG WINNER ,PRSO>
		       <SETG HERE <LOC ,WINNER>>)
		      (T
		       <TELL
DER-NOM-CAP ,PRSO " stutzt einen Moment. Vielleicht denkt er, da%s du die Spielanleitung noch mal durchlesen solltest." CR>)>)
	       (T
		<TELL "Mit " DER-DAT ,PRSO " l%a%st sich nicht reden!" CR>
		<SETG QUOTE-FLAG <>>
		<SETG P-CONT <>>
		<RFATAL>)>>

<ROUTINE V-TEST-IT ("AUX" (NUM 1))
	 <TELL "Da%s ich zu sp%at komme." CR>
	 <TELL "%Offne den %Ubermensch. %Apfel sind sch%on." CR>
	 <TELL "Er sagt, %>Und %uber den Mann.%<" CR CR>
	 <REPEAT ()
		 <COND (<AND <NOT <IN? .NUM ,ROOMS>>
			     <NOT <EQUAL? .NUM ,ROOMS>>
			     <OR <FSET? .NUM ,DERBIT>
				 <FSET? .NUM ,DASBIT>
				 <FSET? .NUM ,DIEBIT>>>
			<TELL DER-NOM-CAP .NUM " ist gut." CR>)
		       (<AND <NOT <IN? .NUM ,ROOMS>>
			     <NOT <EQUAL? .NUM ,ROOMS>>>
			<TELL "No Gender: " D .NUM CR>)>
		 <COND (<G? .NUM ,LAST-OBJECT>
		        <RETURN>)
		       (T
			<SET NUM <+ .NUM 1>>)>>
	 <TELL CR "End of test." CR>
	 <RTRUE>>

;<ROUTINE V-TEST-IT ()
	 <TELL
"Da" NF SS " ich zu sp" NF LCA "t komme." CR>
	 <TELL
NF UCO "ffne den " NF UCU "bermench. " NF UCA "pfel sind sch" NF LCO "n." CR>
	 <TELL
"Und " NF LCU "ber den Mann." CR>>

<ROUTINE V-THROUGH ("OPTIONAL" (OBJ <>) "AUX" M)
	#DECL ((OBJ) <OR OBJECT FALSE> (M) <PRIMTYPE VECTOR>)
	<COND (<AND <FSET? ,PRSO ,DOORBIT>
		    <SET M <OTHER-SIDE ,PRSO>>>
	       <DO-WALK .M>
	       <RTRUE>)
	      (<AND <NOT .OBJ> <FSET? ,PRSO ,VEHBIT>>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<OR .OBJ <NOT <FSET? ,PRSO ,TAKEBIT>>>
	       %<COND (<==? ,ZORK-NUMBER 2>
		       '<COND (<AND ,SCOL-ROOM
				   <OR .OBJ <EQUAL? ,PRSO ,CURTAIN>>>
			      <SCOL-GO .OBJ>
			      <RTRUE>)
			     (<AND <EQUAL? ,HERE ,DEPOSITORY>
				   <EQUAL? ,PRSO ,SNWL>
				   ,SCOL-ROOM>
			      <SCOL-GO .OBJ>
			      <RTRUE>)
			     (<AND <EQUAL? ,HERE ,SCOL-ACTIVE>
				   <EQUAL? ,PRSO 
					   <GET <SET M <GET-WALL ,HERE>> 1>>>
			      <SETG SCOL-ROOM <GET .M 2>>
			      <SETG PRSO <GETP ,PRSO ,P?SIZE>>
			      <COND (.OBJ <SCOL-OBJ .OBJ 0 ,DEPOSITORY>)
				    (T
				     <SCOL-THROUGH 0 ,DEPOSITORY>)>
			      <RTRUE>)
			     (<EQUAL? ,PRSO ,CURTAIN>
			      <TELL
"You can't go more than part way through the curtain." CR>
			      <RTRUE>)>)
		      (ELSE '<NULL-F>)>
	       <TELL
"Du st%o%st dir den Kopf an " DER-DAT ,PRSO ", wenn du dieses Kunstst%uck ausprobierst." CR>)
	      (<IN? ,PRSO ,WINNER>
	       <TELL "Dazu mu%s man sich zu sehr verrenken." CR>)
	      (T
	       <TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE V-THROW ()
	 <COND (<IDROP>
		<COND (<EQUAL? ,PRSI ,ME>
		       <TELL
"Ein toller Wurf! " DER-NOM-CAP ,PRSO>
		       <SETG WINNER ,PLAYER>
		       <JIGS-UP " trifft dich genau in den Kopf. Normalerweise w%urde daraus nicht viel Schaden entstehen, aber du hast das unsagbare Pech, hinten%uberzufallen, als du dich ducken willst und brichst dir das Genick. Die Gerechtigkeit kommt schnell und gnadenreich im Gro%sen Land der Unterwelt.">)
		      (<AND ,PRSI <FSET? ,PRSI ,ACTORBIT>>
		       <TELL DER-NOM-CAP ,PRSI " duckt sich, als "
DER-ACC ,PRSO " vorbeisaust und zu Boden f%allt." CR>
		       ;<TELL
DER-NOM-CAP ,PRSI " ducks as " DER-NOM ,PRSO " flies by and crashes to the ground." CR>)
		      (T <TELL "Geworfen." CR>)>)
	       (ELSE <TELL "Was?" CR>)>>

<ROUTINE V-THROW-OFF ()
	 <TELL "Von dort kann man nichts runterwerfen!" CR>>

<ROUTINE V-TIE ()
	 <COND (<EQUAL? ,PRSI ,WINNER>
		<TELL "Du kannst nichts an dir selber festbinden." CR>)
	       (T
		<TELL "Daran kannst du " DER-ACC ,PRSO " nicht festbinden." CR>)>>

<ROUTINE V-TIE-UP ()
	 <TELL 
DER-ACC-CAP ,PRSO " kannst du damit bestimmt nicht fesseln!" CR>>

<ROUTINE V-TREASURE ()
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,HERE ,NORTH-TEMPLE>
		         <GOTO ,TREASURE-ROOM>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,HERE ,TREASURE-ROOM>
		         <GOTO ,NORTH-TEMPLE>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (T
		<TELL "Hier passiert garnichts." CR>)>>

<ROUTINE PRE-TURN ("AUX" X)
	 %<COND (<==? ,ZORK-NUMBER 3>
		 '<COND (<AND <EQUAL? ,PRSI <> ,ROOMS>
			      <EQUAL? ,PRSO ,DIAL ,TM-DIAL ,T-BAR>>
			 <TELL
"You should turn " DER-ACC ,PRSO " to something." CR>
			 <RTRUE>)>)
		(ELSE T)>
	 <COND (%<COND (<==? ,ZORK-NUMBER 1>
			'<AND <EQUAL? ,PRSI <> ,ROOMS>
			      <NOT <EQUAL? ,PRSO ,BOOK>>>)
		       (ELSE
			'<EQUAL? ,PRSI <> ,ROOMS>)>
		<COND (<AND <EQUAL? ,PRSI ,ROOMS>
			    <OR <AND <EQUAL? ,PRSO ,BOLT>
			             <SET X <HELD? ,WRENCH>>>
				<AND <EQUAL? ,PRSO ,MACHINE-SWITCH>
				     <SET X <HELD? ,SCREWDRIVER>>>>>
		       <PERFORM ,V?TURN ,PRSO .X>
		       <RTRUE>)>
		<TELL "Mit nackten H%anden kommst du hier nicht weiter." CR>)
	       (<NOT <FSET? ,PRSO ;,TURNBIT ,TAKEBIT>>
		<PERFORM ,V?MUNG ,PRSO> ;"sto%s object mit object" 
		;<TELL "You can't turn that!" CR>)>>

<ROUTINE V-TURN ()
	 <TELL "Erfolglos." CR>>

<ROUTINE V-UNLOCK ()
	 <V-LOCK>>

<ROUTINE V-UNTIE ()
	 <TELL 
DER-NOM-CAP ,PRSO " kann nicht festgebunden werden, also kann "
PRONOUN-NOM ,PRSO " auch nicht losgebunden werden!" CR>>

;"ren: translate"
<ROUTINE V-USE ()
	 <TELL "You must be more specific." CR>>

<ROUTINE V-WAIT ("OPTIONAL" (NUM 3))
	 <TELL "Zeit vergeht..." CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0> <RETURN>)
		       (<CLOCKER> <RETURN>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	 <COND (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<COND (<EQUAL? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GET .PT ,REXIT>>)
		      (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<EQUAL? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <GOTO .RM>)
			     %<COND (<==? ,ZORK-NUMBER 3>
				     '(<AND <EQUAL? ,HERE ,CP> ,CP-MOVED>
		                       <RTRUE>))
				    (T
				     '(<NULL-F> <RFALSE>))>
			     (T
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>> ;"globals can getb"
			      <GOTO <GET .PT ,REXIT>>)  ;"dir. props can't"
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL 
"In die Richtung kannst du nicht gehen." CR>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GET .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GET .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL DER-NOM-CAP .OBJ " ist geschlo%sen." CR>
			      <THIS-IS-IT .OBJ>
			      <RFATAL>)>)>)
	       (<AND <NOT ,LIT>
		     <PROB 80>
		     <EQUAL? ,WINNER ,ADVENTURER>
		     <NOT <FSET? ,HERE ,NONLANDBIT>>>
		<COND (,SPRAYED?
		       <TELL
"There are odd noises in the darkness, and there is no exit in that
direction." CR>
		       <RFATAL>)
		      %<COND (<==? ,ZORK-NUMBER 3>
			      '(<EQUAL? ,HERE ,DARK-1 ,DARK-2>
		                <JIGS-UP
"O nein! Du bist in eine H%ohle von hungrigen Greuelen geraten und es ist Essenszeit!">))
			     (T
			      '(<NULL-F>
				<RFALSE>))>
		      (T
		       <JIGS-UP
"O nein! Du bist in die lechzenden F%ange eines lauernden Greuels geraten!">)>)
	       (T
		<TELL "In die Richtung kannst du nicht gehen." CR>
		<RFATAL>)>>

<ROUTINE V-WALK-AROUND ()
	 <TELL "Benutze einen Kompa%s f%ur die Richtung." CR>>

<ROUTINE V-WALK-TO ()
	 <COND (<EQUAL? ,PRSO ,INTDIR>
		<DO-WALK ,P-DIRECTION>
		<RTRUE>)
	       (<AND ,PRSO
		     <OR <IN? ,PRSO ,HERE>
			 <GLOBAL-IN? ,PRSO ,HERE>>>
		<TELL PRONOUN-NOM-CAP ,PRSO " ist hier!" CR>)
	       (T
		<TELL "Du mu%st eine Richtung angeben!" CR>)>>

<ROUTINE V-WAVE ()
	 <TELL 
DER-ACC-CAP ,PRSO " wedeln, scheint nicht zu funktionieren." CR>>

<ROUTINE V-WEAR ()
	 <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
		<TELL "Du kannst " DER-ACC ,PRSO " nicht tragen." CR>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-WIN ()
	 <TELL "Logo! Klar!" CR>>

<ROUTINE V-WIND ()
	 <TELL "Du kannst " DER-ACC ,PRSO " nicht aufziehen." CR>>

<ROUTINE V-WISH ()
	 %<COND (<==? ,ZORK-NUMBER 2>
		 '<PERFORM ,V?MAKE ,WISH>)
		(T
		 '<TELL "Mit viel Gl%uck, wird dein Wunsch sich erf%ullen." CR>)>>

<ROUTINE V-YELL () <TELL "AAAUUUUUU!" CR>>

<ROUTINE V-YES ()
	 <TELL "Ja?" CR>>

<ROUTINE V-ZORK () <TELL "Zu deinen Diensten!" CR>>

"Verb-Associated Routines"

"Descriptions"

<GLOBAL LIT <>>

<GLOBAL SPRAYED? <>>

<ROUTINE V-FIRST-LOOK ()
	 <COND (<DESCRIBE-ROOM>
		<COND (<NOT ,SUPER-BRIEF>
		       <DESCRIBE-OBJECTS>)>)>>

<ROUTINE DESCRIBE-ROOM ("OPTIONAL" (LOOK? <>) "AUX" V? STR AV)
	 <SET V? <OR .LOOK? ,VERBOSE>>
	 <COND (<NOT ,LIT>
		<TELL "Es ist stockdunkel."> 
		<COND (<NOT ,SPRAYED?>
		       <TELL " Es besteht die M%oglichkeit, da%s du von einem Greuel gefressen wirst.">)>
		<CRLF>
		%<COND (<==? ,ZORK-NUMBER 3>
			'<COND (<EQUAL? ,HERE ,DARK-2>
		                <TELL
"The ground continues to slope upwards away from the lake. You can barely
detect a dim light from the east." CR>)>)
		       (T
			'<NULL-F>)>
		<RFALSE>)>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<FSET ,HERE ,TOUCHBIT>
		<SET V? T>)>
	 %<COND (<==? ,ZORK-NUMBER 1>
		 '<COND (<IN-MAZE? ,HERE>
		         <FCLEAR ,HERE ,TOUCHBIT>)>)
		(T
		 '<NULL-F>)>
	 <COND (<IN? ,HERE ,ROOMS>
		;"Was <TELL D ,HERE CR>"
		<TELL D ,HERE>
		<COND (<FSET? <SET AV <LOC ,WINNER>> ,VEHBIT>
		       <TELL ", in " DER-DAT .AV>)>
		<CRLF>)>
	 <COND (%<COND (<==? ,ZORK-NUMBER 2>
			'<OR .LOOK? <NOT ,SUPER-BRIEF> <EQUAL? ,HERE ,ZORK3>>)
		       (ELSE
			'<OR .LOOK? <NOT ,SUPER-BRIEF>>)>
		<SET AV <LOC ,WINNER>>
		;<COND (<FSET? .AV ,VEHBIT>
		       <TELL "(You are in " DER-DAT .AV ".)" CR>)>
		<COND (<AND .V? <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       <RTRUE>)
		      (<AND .V? <SET STR <GETP ,HERE ,P?LDESC>>>
		       <TELL .STR CR>)
		      (T
		       <APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>)>
		<COND (<AND <NOT <EQUAL? ,HERE .AV>> <FSET? .AV ,VEHBIT>>
		       <APPLY <GETP .AV ,P?ACTION> ,M-LOOK>)>)>
	 T>

<ROUTINE DESCRIBE-OBJECTS ("OPTIONAL" (V? <>))
	 <COND (,LIT
		<COND (<FIRST? ,HERE>
		       <PRINT-CONT ,HERE <SET V? <OR .V? ,VERBOSE>> -1>)>)
	       (T
		<TELL "Nur Flederm%ause k%onnen im Dunkeln sehen. Und du bist keine." CR>)>>

"DESCRIBE-OBJECT -- takes object and flag. if flag is true will print a
long description (fdesc or ldesc), otherwise will print short."

<GLOBAL DESC-OBJECT <>>

<ROUTINE DESCRIBE-OBJECT (OBJ V? LEVEL "AUX" (STR <>) AV)
	 <SETG DESC-OBJECT .OBJ>
	 <COND (<AND <0? .LEVEL>
		     <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		<RTRUE>)
	       (<AND <0? .LEVEL>
		     <OR <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
			      <SET STR <GETP .OBJ ,P?FDESC>>>
			 <SET STR <GETP .OBJ ,P?LDESC>>>>
		<TELL .STR>)
	       (<0? .LEVEL>
		<TELL "Hier ist " EIN-NOM .OBJ>
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL " (beleuchtet)">)>
		<TELL ".">)
	       (T
		<TELL <GET ,INDENTS .LEVEL>>
		<TELL EIN-NOM-CAP .OBJ>
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL " (beleuchtet)">)
		      (<AND <FSET? .OBJ ,WEARBIT>
			    <IN? .OBJ ,WINNER>>
		       <TELL " (auf dem Leib)">)>)>
	 %<COND (<==? ,ZORK-NUMBER 2>
		 '<COND (<AND <EQUAL? .OBJ ,SPELL-VICTIM>
		              <EQUAL? ,SPELL-USED ,W?FLOAT>>
		         <TELL " (floating in midair)">)>)
		(T
		 '<NULL-F>)>
	 <COND (<AND <0? .LEVEL>
		     <SET AV <LOC ,WINNER>>
		     <FSET? .AV ,VEHBIT>>
		<TELL " (au%serhalb von " DER-DAT .AV ")">)>
	 <CRLF>
	 <COND (<AND <SEE-INSIDE? .OBJ> <FIRST? .OBJ>>
		<PRINT-CONT .OBJ .V? .LEVEL>)>>

<ROUTINE PRINT-CONTENTS (OBJ "AUX" F N (1ST? T) (IT? <>) (TWO? <>))
	 <COND (<SET F <FIRST? .OBJ>>
		<REPEAT ()
			<SET N <NEXT? .F>>
			<COND (.1ST? <SET 1ST? <>>)
			      (ELSE
			       <TELL ", ">
			       <COND (<NOT .N> <TELL "und ">)>)>
			<TELL EIN-NOM  .F>
			<COND (<AND <NOT .IT?> <NOT .TWO?>>
			       <SET IT? .F>)
			      (ELSE
			       <SET TWO? T>
			       <SET IT? <>>)>
			<SET F .N>
			<COND (<NOT .F>
			       <COND (<AND .IT? <NOT .TWO?>>
				      <THIS-IS-IT .IT?>)>
			       <RTRUE>)>>)>>

<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (V? <>) (LEVEL 0)
		     "AUX" Y 1ST? SHIT AV STR (PV? <>) (INV? <>))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>> <RTRUE>)>
	 <COND (<AND <SET AV <LOC ,WINNER>> <FSET? .AV ,VEHBIT>>
		T)
	       (ELSE <SET AV <>>)>
	 <SET 1ST? T>
	 <SET SHIT T>
	 <COND (<EQUAL? ,WINNER .OBJ <LOC .OBJ>>
		<SET INV? T>)
	       (ELSE
		<REPEAT ()
			<COND %<COND (<==? ,ZORK-NUMBER 2>
				      '(<NOT .Y>
					<COND (<AND <0? .LEVEL>
						    <==? ,SPELL? ,S-FANTASIZE>
						    <PROB 20>>
					       <TELL "There is a "
						     <PICK-ONE ,FANTASIES>
						     " here." CR>
					       <SET 1ST? <>>)>
					<RETURN>))
				     (ELSE
				      '(<NOT .Y>
					<RETURN>))>
			      (<EQUAL? .Y .AV> <SET PV? T>)
			      (<EQUAL? .Y ,WINNER>)
			      (<AND <NOT <FSET? .Y ,INVISIBLE>>
				    <NOT <FSET? .Y ,TOUCHBIT>>
				    <SET STR <GETP .Y ,P?FDESC>>>
			       <COND (<NOT <FSET? .Y ,NDESCBIT>>
				      <TELL .STR CR>
				      <SET SHIT <>>
				      ;<SET 1ST? <>>)>
			       <COND (<AND <SEE-INSIDE? .Y>
					   <NOT <GETP <LOC .Y> ,P?DESCFCN>>
					   <FIRST? .Y>>
				      <COND (<PRINT-CONT .Y .V? 0>
					     <SET 1ST? <>>)>)>)>
			<SET Y <NEXT? .Y>>>)>
	 <SET Y <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .Y>
			<COND (<AND .PV? .AV <FIRST? .AV>>
			       <SET LEVEL <+ .LEVEL 1>> ;"not in Zork III"
			       <PRINT-CONT .AV .V? .LEVEL>)>
			<RETURN>)
		       (<EQUAL? .Y .AV ,ADVENTURER>)
		       (<AND <NOT <FSET? .Y ,INVISIBLE>>
			     <OR .INV?
				 <FSET? .Y ,TOUCHBIT>
				 <NOT <GETP .Y ,P?FDESC>>>>
			<COND (<NOT <FSET? .Y ,NDESCBIT>>
			       <COND (.1ST?
				      <COND (<FIRSTER .OBJ .LEVEL>
					     <COND (<L? .LEVEL 0>
						    <SET LEVEL 0>)>)>
				      <SET LEVEL <+ 1 .LEVEL>>
				      <SET 1ST? <>>)>
			       <COND (<L? .LEVEL 0> <SET LEVEL 0>)>
			       <DESCRIBE-OBJECT .Y .V? .LEVEL>)
			      (<AND <FIRST? .Y> <SEE-INSIDE? .Y>>
			       <SET LEVEL <+ .LEVEL 1>> ;"not in Zork III"
			       <PRINT-CONT .Y .V? .LEVEL>
			       <SET LEVEL <- .LEVEL 1>> ;"not in Zork III")>)>
		 <SET Y <NEXT? .Y>>>
	 <COND (<AND .1ST? .SHIT> <RFALSE>) (T <RTRUE>)>>

<ROUTINE FIRSTER (OBJ LEVEL)
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? .OBJ ,TROPHY-CASE>
		         <TELL
"Deine Schatzsammlung besteht aus:" CR>))
		      (T
		       '(<NULL-F> <RTRUE>))>
	       (<EQUAL? .OBJ ,WINNER>
		<TELL "Du tr%agst:" CR>)
	       (<NOT <IN? .OBJ ,ROOMS>>
		<COND (<G? .LEVEL 0>
		       <TELL <GET ,INDENTS .LEVEL>>)>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL "Auf " DER-DAT .OBJ>
		       <COND (<G? <CCOUNT .OBJ> 1>
			      <TELL " ist: " CR>)
			     (T
			      <TELL " sind: " CR>)>)
		      (<FSET? .OBJ ,ACTORBIT>
		       <TELL DER-NOM-CAP .OBJ 
" scheint das Folgende zu halten:" CR>)
		      (T
		       <TELL DER-NOM-CAP .OBJ " scheint das Folgende zu enthalten:" CR>)>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT> <FSET? .OBJ ,OPENBIT>>>>

"Scoring"

<GLOBAL MOVES 0>

<GLOBAL SCORE 0>

<GLOBAL BASE-SCORE 0>

<GLOBAL WON-FLAG <>>

<ROUTINE SCORE-UPD (NUM)
	 <SETG BASE-SCORE <+ ,BASE-SCORE .NUM>>
	 <SETG SCORE <+ ,SCORE .NUM>>
	 ;<TELL "[Your score g%os up.]" CR>
	 %<COND (<==? ,ZORK-NUMBER 1>
		 '<COND (<AND <EQUAL? ,SCORE 350>
		              <NOT ,WON-FLAG>>
		         <SETG WON-FLAG T>
		         <FCLEAR ,MAP ,INVISIBLE>
		         <FCLEAR ,WEST-OF-HOUSE ,TOUCHBIT>
		         <TELL
"Eine fast unvernehmbare Stimme fl%ustert dir zu: %>Suche unter den Sch%atzen nach dem letzten Geheimnis.%<" CR>)>)
		(T
		 '<NULL-F>)>
	 T>

<ROUTINE SCORE-OBJ (OBJ "AUX" TEMP)
	 <COND (<G? <SET TEMP <GETP .OBJ ,P?VALUE>> 0>
		<SCORE-UPD .TEMP>
		<PUTP .OBJ ,P?VALUE 0>)>>

;<ROUTINE YES? ()
	 <PRINTI ">">
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?YES ,W?Y>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<CONSTANT YES-INBUF <ITABLE 19 (BYTE LENGTH) 0>>
<CONSTANT YES-LEXV  <ITABLE 3 (LEXV) 0 0>>

<ROUTINE YES? ("AUX" WORD VAL)
	<REPEAT ()
		<PRINTI ">">
		<PUTB ,YES-INBUF 1 0>
		<READ ,YES-INBUF ,YES-LEXV>
		<COND (<AND <NOT <0? <GETB ,YES-LEXV ,P-LEXWORDS>>>
			    <SET WORD <GET ,YES-LEXV ,P-LEXSTART>>>
		       <SET VAL <WT? .WORD ,PS?VERB ,P1?VERB>>
		       <COND (<OR <EQUAL? .VAL ,ACT?JA>
				  <EQUAL? .WORD ,W?J>>
			      <SET VAL T>
			      <RETURN>)
			     (<OR <EQUAL? .VAL ,ACT?NEIN>
				  <EQUAL? .WORD ,W?N>>
			      <SET VAL <>>
			      <RETURN>)
			     (<EQUAL? .VAL ,ACT?NEUBEGINN>
			      <V-RESTART>)
			     (<EQUAL? .VAL ,ACT?WIEDERHERSTELLUNG>
			      <V-RESTORE>)
			     (<EQUAL? .VAL ,ACT?AUFHOEREN>
			      <V-QUIT>)>)>
		<TELL "[Please type YES or NO.]">>
	.VAL>

"Death"

<GLOBAL DEAD <>>

<GLOBAL DEATHS 0>

<GLOBAL LUCKY 1>

;"JIGS-UP is in ACTIONS.ZIL"

;"RANDOMIZE-OBJECTS is in ACTIONS.ZIL"

;"KILL-INTERRUPTS is in ACTIONS.ZIL"

"Object Manipulation"

<GLOBAL FUMBLE-NUMBER 7>

<GLOBAL FUMBLE-PROB 8>

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" CNT OBJ)
	 #DECL ((VB) <OR ATOM FALSE> (CNT) FIX (OBJ) OBJECT)
	 <COND %<COND (<==? ,ZORK-NUMBER 1>
		       '(,DEAD
		         <COND (.VB
				<TELL
"Deine Hand greift durch das Objekt hindurch." CR>)>
		         <RFALSE>))
		      (T
		       '(<NULL-F>
			 <RFALSE>))>
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <TELL <PICK-ONE ,YUKS> CR>)>
		<RFALSE>)
	       %<COND (<==? ,ZORK-NUMBER 2>
		       '(<AND <EQUAL? ,PRSO ,SPELL-VICTIM>
		              <EQUAL? ,SPELL-USED ,W?FLOAT ,W?FREEZE>>
		         <COND (<EQUAL? ,SPELL-USED ,W?FLOAT>
		                <TELL
"You can't reach that. It's floating above your head." CR>)
		               (T
		                <TELL 
PRONOUN-NOM-CAP ,PRSO "seems rooted to the spot." CR>)>
		         <RFALSE>))
		      (T
		       '(<NULL-F>
			 <RFALSE>))>
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		;"Kludge for parser calling itake"
		<RFALSE>)
	       (<AND <NOT <IN? <LOC ,PRSO> ,WINNER>>
		     <G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> ,LOAD-ALLOWED>>
		<COND (.VB
		       <TELL "Last ist zu schwer">
		       <COND (<L? ,LOAD-ALLOWED ,LOAD-MAX>
			      ;<TELL ", especially in light of your condition.">
			      <TELL ", aber du nimmst es leicht">)
			     (T
			      <TELL ".">)>
		       <CRLF>)>
		<RFATAL>)
	       (<AND <VERB? TAKE>
		     <G? <SET CNT <CCOUNT ,WINNER>> ,FUMBLE-NUMBER>
		     <PROB <* .CNT ,FUMBLE-PROB>>>
		<TELL
"Du hast deine H%ande schon zu voll!" CR>
		<RFALSE>)
	       (T
		<MOVE ,PRSO ,WINNER>
		<FCLEAR ,PRSO ,NDESCBIT>
		<FSET ,PRSO ,TOUCHBIT>
		%<COND (<==? ,ZORK-NUMBER 2>
			'<COND (<EQUAL? ,SPELL? ,S-FILCH>
		                <COND (<RIPOFF ,PRSO ,WIZARD-CASE>
			               <TELL
"When you touch " DER-ACC ,PRSO "," PRONOUN-NOM ,PRSO " immediately
disappears!" CR>
			               <RFALSE>)>)>)
		       (T
			'<NULL-F>)>
		%<COND (<OR <==? ,ZORK-NUMBER 1>
			    <==? ,ZORK-NUMBER 2>>
			'<SCORE-OBJ ,PRSO>)
		       (T
			'<NULL-F>)>
		<RTRUE>)>>

<ROUTINE IDROP ()
	 <COND (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <IN? <LOC ,PRSO> ,WINNER>>>
		<TELL "Du tr%agst " DER-ACC ,PRSO " nicht." CR>
		<RFALSE>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL DER-NOM-CAP ,PRSO " ist geschlo%sen." CR>
		<RFALSE>)
	       (T
		<MOVE ,PRSO <LOC ,WINNER>>
		<RTRUE>)>>

<ROUTINE CCOUNT (OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,WEARBIT>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? .CONT ,WEARBIT>>
			       <SET WT <+ .WT 1>>)
			      (T
			       <SET WT <+ .WT <WEIGHT .CONT>>>)>
			<COND (<NOT <SET CONT <NEXT? .CONT>>> <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>

"Miscellaneous"
;"when these are referenced, GET (and not GETB) must be used, since it
takes TWO bytes to represent their values" 

<CONSTANT REXIT 0>
<CONSTANT UEXIT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 2) (T 1)>>
	"Uncondl EXIT:	(dir TO rm)		 = rm"
<CONSTANT NEXIT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 3) (T 2)>>
	"Non EXIT:	(dir ;SORRY string)	 = str-ing"
<CONSTANT FEXIT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 4) (T 3)>>
	"Fcnl EXIT:	(dir PER rtn)		 = rou-tine, 0"
<CONSTANT CEXIT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 5) (T 4)>>
	"Condl EXIT:	(dir TO rm IF f)	 = rm, f, str-ing"
<CONSTANT DEXIT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 6) (T 5)>>
	"Door EXIT:	(dir TO rm IF dr IS OPEN)= rm, dr, str-ing, 0"

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 4) (T 1)>>	"GET/B"
<CONSTANT CEXITSTR 1>		"GET"
<CONSTANT DEXITOBJ 1>		"GET/B"
<CONSTANT DEXITSTR %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 2) (T 1)>>	"GET"

<GLOBAL INDENTS
	<TABLE (PURE)
	       ""
	       "  "
	       "    "
	       "      "
	       "        "
	       "          ">>

;<ROUTINE HACK-HACK (STR "OPT" (DATIVE? <>))
	 <COND (<AND <IN? ,PRSO ,GLOBAL-OBJECTS>
		     <VERB? WAVE RAISE LOWER>>
		<TELL DER-NOM-CAP ,PRSO " ist nicht hier!" CR>)
	       (.DATIVE?
		<TELL .STR DER-DAT ,PRSO <PICK-ONE ,HO-HUM> CR>)
	       (T
		<TELL .STR DER-ACC ,PRSO <PICK-ONE ,HO-HUM> CR>)>>

<ROUTINE NO-GO-TELL (AV WLOC)
	 <COND (.AV
		<TELL EIN-DAT .WLOC " kannst du da nicht hin.">)
	       (T
		<TELL 
"Ohne ein Transportmittel kannst du da nicht hingehen." >)>
	 <CRLF>>

<ROUTINE GOTO (RM "OPTIONAL" (V? T)
	       "AUX" (LB <>) WLOC 
	             (AV <>) OLIT OHERE)
	 <SET OLIT ,LIT>
	 <SET OHERE ,HERE> ;"next three lines used to be 'aux' defaults"
	 <SET WLOC <LOC ,WINNER>>
	 <COND (<FSET? .RM ,RLANDBIT>
		<SET LB T>)>
	 <COND (<FSET? .WLOC ,VEHBIT>
		<SET AV <GETP .WLOC ,P?VTYPE>>)>
	 <COND (<AND <NOT .LB>
		     <NOT .AV>>
		<NO-GO-TELL .AV .WLOC>
		<RFALSE>)
	       (<AND <NOT .LB>
		     <NOT <FSET? .RM .AV>>>
		<NO-GO-TELL .AV .WLOC>
		<RFALSE>)
	       (<AND <FSET? ,HERE ,RLANDBIT>
		     .LB
		     .AV
		     <NOT <EQUAL? .AV ,RLANDBIT>>
		     <NOT <FSET? .RM .AV>>>
		<NO-GO-TELL .AV .WLOC>
		<RFALSE>)
	       (<FSET? .RM ,RMUNGBIT>
		<TELL <GETP .RM ,P?LDESC> CR>
		<RFALSE>)
	       (T
		<COND (<AND .LB
			    <NOT <FSET? ,HERE ,RLANDBIT>>
			    <NOT ,DEAD>
			    <FSET? .WLOC ,VEHBIT>>
		       %<COND (<==? ,ZORK-NUMBER 1>
			       '<TELL
DER-NOM-CAP .WLOC " stoppt am Ufer." CR CR>)
			      (<==? ,ZORK-NUMBER 2>
			       '<COND (<EQUAL? .WLOC ,BALLOON>
				       <TELL
"The balloon lands." CR>)
				      (<FSET? .WLOC ,VEHBIT>
				       <TELL
DER-NOM-CAP .WLOC " comes to a stop." CR CR>)>)
			      (<==? ,ZORK-NUMBER 3>
			       '<COND (<FSET? .WLOC ,VEHBIT>
				       <TELL
DER-NOM-CAP .WLOC " comes to a stop." CR CR>)>)>)>
		<COND (.AV
		       <SETG OHERE <>>
		       <MOVE .WLOC .RM>)
		      (T
		       <MOVE ,WINNER .RM>)>
		<SETG HERE .RM>
		<SETG LIT <LIT? ,HERE>>
		<COND (<AND <NOT .OLIT>
			    <NOT ,LIT>
			    <PROB 80>>
		       <COND (,SPRAYED?
			      <TELL
"There are sinister gurgling noises in the darkness all around you!" CR>)
			     %<COND (<==? ,ZORK-NUMBER 3>
				     '(<EQUAL? ,HERE ,DARK-1 ,DARK-2>
		                       <JIGS-UP
"Oh, no! Dozen of lurking grues attack and devour you! You must have
stumbled into an authentic grue lair!">))
				    (T
				     '(<NULL-F>
				       <RFALSE>))>
			     (T
			      ;<TELL
"Oh, no! A lurking grue slithered into ">
			      <TELL
"Meine G%ute! Ein lauerndes Greuel ist in "> 
			      <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
				     <TELL DER-ACC <LOC ,WINNER>>)
				    (T <TELL "das Zimmer">)>
			      <JIGS-UP 
" geschlittert und hat dich verschlungen.">
			      <RTRUE>)>)>
		<COND (<AND <NOT ,LIT>
			    <EQUAL? ,WINNER ,ADVENTURER>>
		       <TELL "Du bist in einem dunklen Ort gelandet." CR>
		       <SETG P-CONT <>>)>
		<APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
		<SCORE-OBJ .RM>
		<COND (<NOT <EQUAL? ,HERE .RM>> <RTRUE>)
		      (<AND <NOT <EQUAL? ,ADVENTURER ,WINNER>>
			    <IN? ,ADVENTURER .OHERE>>
		       <TELL DER-NOM-CAP ,WINNER " verl%a%st das Zimmer." CR>)
		      %<COND (<==? ,ZORK-NUMBER 1>
			      '(<AND <EQUAL? ,HERE .OHERE>
				      ;"no double description"
				     <EQUAL? ,HERE ,ENTRANCE-TO-HADES>>
				<RTRUE>))
			     (ELSE
			      '(<NULL-F> <RTRUE>))>
		      (<AND .V?
			    <EQUAL? ,WINNER ,ADVENTURER>>
		       <V-FIRST-LOOK>)>
		<RTRUE>)>>

<ROUTINE LKP (ITM TBL "AUX" (CNT 0) LEN)
	 <SET LEN <GET .TBL 0>>
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .LEN>
			<RFALSE>)
		       (<EQUAL? <GET .TBL .CNT> .ITM>
			<COND (<EQUAL? .CNT .LEN> <RFALSE>)
			      (T
			       <RETURN <GET .TBL <+ .CNT 1>>>)>)>>>

<ROUTINE DO-WALK (DIR)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

;<ROUTINE WORD-TYPE (OBJ WORD "AUX" SYNS)
	 <ZMEMQ .WORD
		<SET SYNS <GETPT .OBJ ,P?SYNONYM>>
		<- </ <PTSIZE .SYNS> 2> 1>>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TX)
	 <COND (<SET TX <GETPT .OBJ2 ,P?GLOBAL>>
		<ZMEMQ .OBJ1 .TX <- </ <PTSIZE .TX> 2> 1>>)>> 

<ROUTINE FIND-IN (WHERE WHAT "AUX" W)
	 <SET W <FIRST? .WHERE>>
	 <COND (<NOT .W>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<AND <FSET? .W .WHAT>
			     <NOT <EQUAL? .W ,ADVENTURER>>>
			<RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>>
			<RETURN <>>)>>>


;<ROUTINE IN-HERE? (OBJ)
	 <OR <IN? .OBJ ,HERE>
	     <GLOBAL-IN? .OBJ ,HERE>>>

<ROUTINE HELD? (CAN)
	 <REPEAT ()
		 <SET CAN <LOC .CAN>>
		 <COND (<NOT .CAN> <RFALSE>)
		       (<EQUAL? .CAN ,WINNER> <RTRUE>)>>>

<ROUTINE OTHER-SIDE (DOBJ "AUX" (P 0) TX) ;"finds room beyond given door"
	 <REPEAT ()
		 <COND (<L? <SET P <NEXTP ,HERE .P>> ,LOW-DIRECTION>
			<RETURN <>>)
		       (ELSE
			<SET TX <GETPT ,HERE .P>>
			<COND (<AND <EQUAL? <PTSIZE .TX> ,DEXIT>
				    <EQUAL? <GET ;B .TX ,DEXITOBJ> .DOBJ>>
			       <RETURN .P>)>)>>>

<ROUTINE MUNG-ROOM (RM STR)
	 %<COND (<==? ,ZORK-NUMBER 2>
		 '<COND (<EQUAL? .RM ,INSIDE-BARROW>
			 <RFALSE>)>)
		(ELSE T)>
	 <FSET .RM ,RMUNGBIT>
	 <PUTP .RM ,P?LDESC .STR>>

<GLOBAL P-HIM-OBJECT <>>

<GLOBAL P-IT-OBJECT <>>

<GLOBAL P-HER-OBJECT <>>

<ROUTINE THIS-IS-IT (OBJ)
	 <COND (<OR <NOT .OBJ>
		    <AND <VERB? WALK>
			 <PRSO? .OBJ>> ;"PRSO is a direction"
		    <EQUAL? .OBJ ,ADVENTURER> ;"is this necessary?"
		    <EQUAL? .OBJ ,NOT-HERE-OBJECT ,ME ;,GLOBAL-ROOM>>
		<RTRUE>)  
	       (<FSET? .OBJ ,DERBIT>
		<SETG P-HIM-OBJECT .OBJ>)
	       (<FSET? .OBJ ,DASBIT>
		<SETG P-IT-OBJECT .OBJ>)
	       (T
		<SETG P-HER-OBJECT .OBJ>)>>

<COND (<N==? ,ZORK-NUMBER 3>
       <GLOBAL SWIMYUKS
	       <LTABLE 0 "Du kannst in dem Kerker nicht schwimmen.">>)>

<GLOBAL HELLOS
	<LTABLE 0 "Hallo, ist da jemand?"
	          "Hallo, Hallo!"
		  "Guten Tag."
		  "Sch%ones Wetter haben wir, nicht wahr?"
		  "Auf Wiedersehen.">>

<GLOBAL YUKS
	<LTABLE
	 0
"Ein braver Versuch."
"Das kann doch nicht dein Ernst sein."
"Das hie%se das Unm%ogliche m%oglich machen."
"Eine hochinteressante Idee..."
"Was f%ur ein Plan!">>

<GLOBAL DUMMY
	<LTABLE 0 
"Pa%s auf."
"Dazu ist es zu sp%at."
"La%s dir die Augen checken.">>