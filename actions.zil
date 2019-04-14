"1ACTIONS for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc. All Rights Reserved.
	-- GERMAN EDITION"


<ROUTINE WEST-HOUSE (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du stehst auf freiem Feld westlich von einem wei%sen Haus, dessen Haust%ur mit Brettern vernagelt ist.">
		<COND (,WON-FLAG
		       <TELL
" Ein Geheimpfad f%uhrt nach S%udwesten in den Wald.">)>
		<CRLF>)>>

<ROUTINE EAST-HOUSE (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist hinter dem wei%sen Haus. Nach Osten f%uhrt in Pfad in den Wald. An einem Ende der Hauswand befindet sich ein kleines Fenster, das">  
		<COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
		       <TELL " offen ist.">)
		      (T <TELL " einen Spalt offen steht.">)>
		<CRLF>)>>

<ROUTINE OPEN-CLOSE (OBJ STROPN STRCLS)
	 <COND (<VERB? OPEN>
		<COND (<FSET? .OBJ ,OPENBIT>
		       <TELL <PICK-ONE ,DUMMY>>)
		      (T
		       <TELL .STROPN>
		       <FSET .OBJ ,OPENBIT>)>
		<CRLF>)
	       (<VERB? CLOSE>
		<COND (<FSET? .OBJ ,OPENBIT>
		       <TELL .STRCLS>
		       <FCLEAR .OBJ ,OPENBIT>
		       T)
		      (T <TELL <PICK-ONE ,DUMMY>>)>
		<CRLF>)>>

<ROUTINE BOARD-F ()
	 <COND (<VERB? TAKE EXAMINE>
		<TELL "Die Bretter sind fest angenagelt." CR>)>>

<ROUTINE TEETH-F ()
	 <COND (<AND <VERB? BRUSH>
		     <EQUAL? ,PRSO ,TEETH>>
		<COND (<AND <EQUAL? ,PRSI ,PUTTY>
			    <IN? ,PRSI ,WINNER>>
		       <JIGS-UP
"Na ja, du scheinst deine Z%ahne mit irgendwelchem Klebstoff geputzt zu haben. Die nat%urliche Folge davon ist ein zusammengeklebter Mund (mit der Nase), und du stirbst an Atemversagen.">)
		      (<NOT ,PRSI>
		       <TELL
"Zahnpflege ist h%ochst empfehlenswert, aber es ist nicht klar, mit was du sie putzen willst." CR>)
		      (T
		       <TELL 
"Eine charmante Idee, aber mit " EIN-DAT ,PRSI "?" CR>)>)>>

;"JOKE OF 'TAKE NOTHING FOR GRANITE' WON'T WORK IN GERMAN"
;<ROUTINE GRANITE-WALL-F ()
	 <COND (<EQUAL? ,HERE ,NORTH-TEMPLE>
		<COND (<VERB? FIND>
		       <TELL "Die Westwand ist hier aus hartem Stein." CR>)
		      (<VERB? TAKE RAISE LOWER>
		       <TELL "Es ist harter Stein." CR>)>)
	       (<EQUAL? ,HERE ,TREASURE-ROOM>
		<COND (<VERB? FIND>
		       <TELL "The east wall is solid granite here." CR>)
		      (<VERB? TAKE RAISE LOWER>
		       <TELL "It's solid granite." CR>)>)
	       (<EQUAL? ,HERE ,SLIDE-ROOM>
		<COND (<VERB? FIND READ>
		       <TELL "It only SAYS %>Granite Wall%<." CR>)
		      (T <TELL "The wall isn't granite." CR>)>)
	       (T
		<TELL "There is no granite wall here." CR>)>>

<ROUTINE SONGBIRD-F ()
	 <COND (<VERB? FIND TAKE>
		<TELL "Der Singvogel ist nicht hier, aber er ist wahrscheinlich in der N%ahe." CR>)
	       (<VERB? LISTEN>
		<TELL "Jetzt kannst du den Singvogel nicht h%oren." CR>)
	       (<VERB? FOLLOW>
		<TELL "Man kann ihm nicht folgen." CR>)
	       (T
		<TELL "Hier kannst du keinen Singvogel sehen." CR>)>>

<ROUTINE WHITE-HOUSE-F ()
    <COND (<EQUAL? ,HERE ,KITCHEN ,LIVING-ROOM ,ATTIC>
	   <COND (<VERB? FIND>
		  <TELL "Warum gehst du nicht auf die Suche nach deinem Verstand." CR>)
		 (<VERB? WALK-AROUND>
		  <GO-NEXT ,IN-HOUSE-AROUND>
		  T)>)
	  (<NOT <OR <EQUAL? ,HERE ,EAST-OF-HOUSE ,WEST-OF-HOUSE>
		    <EQUAL? ,HERE ,NORTH-OF-HOUSE ,SOUTH-OF-HOUSE>>>
	   <COND (<VERB? FIND>
		  <COND (<EQUAL? ,HERE ,CLEARING>
			 <TELL "Es scheint im Westen zu sein." CR>)
			(T
			 <TELL "Vor einer Minute war es noch hier..." CR>)>)
		 (T <TELL "Du bist nicht beim Haus." CR>)>)
	  (<VERB? FIND>
	   <TELL
"Es steht doch gleich hier! Bist du blind, oder was?" CR>)
	  (<VERB? WALK-AROUND>
	   <GO-NEXT ,HOUSE-AROUND>
	   T)
	  (<VERB? EXAMINE>
	   <TELL
"Das Haus ist ein sch%ones altes Herrenhaus, das wei%s verputzt ist. Man sieht, da%s die Besitzer enorm reich gewesen sein mu%sten." CR>)
	  (<VERB? THROUGH OPEN>
	   <COND (<EQUAL? ,HERE ,EAST-OF-HOUSE>
		  <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
			 <GOTO ,KITCHEN>)
			(T
			 <TELL "Das Fenster ist geschlossen." CR>
			 <THIS-IS-IT ,KITCHEN-WINDOW>)>)
		 (T
		  <TELL "Es ist nicht offensichtlich, wie du von hier reinkommst." CR>)>)
	  (<VERB? BURN>
	   <TELL "Das kann doch nicht dein Ernst sein." CR>)>>

;"0 -> no next, 1 -> success, 2 -> failed move"

<ROUTINE GO-NEXT (TBL "AUX" VAL)
	 <COND (<SET VAL <LKP ,HERE .TBL>>
		<COND (<NOT <GOTO .VAL>> 2)
		      (T 1)>)>>

<ROUTINE FOREST-F ()
	 <COND (<VERB? WALK-AROUND>
		<COND (<OR <EQUAL? ,HERE
			       ,WEST-OF-HOUSE ,NORTH-OF-HOUSE
			       ,SOUTH-OF-HOUSE>
			   <EQUAL? ,HERE ,EAST-OF-HOUSE>>
		       <TELL "Du bist noch nicht einmal im Wald." CR>)>
		<GO-NEXT ,FOREST-AROUND>)
	       (<VERB? DISEMBARK>
		<TELL "Du mu%st eine Richtung angeben." CR>)
	       (<VERB? FIND>
		<TELL "Du kannst den Wald vor lauter B%aumen nicht sehen." CR>)
	       (<VERB? LISTEN>
		<TELL "Die Tannen und Fichten scheinen zu murmeln."
		      CR>)>>

<ROUTINE MOUNTAIN-RANGE-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-DOWN CLIMB-FOO>
		<TELL 
"Willst du mir nicht glauben? Die Berge sind nicht un%uberwindlich." CR>)>>

<ROUTINE WATER-F ("AUX" AV W PI?)
	 <COND (<VERB? SGIVE> <RFALSE>)
	       (<VERB? THROUGH BOARD>
		<TELL <PICK-ONE ,SWIMYUKS> CR>
		<RTRUE>)
	       (<VERB? FILL>	;"fill bottle with water =>"
		<SET W ,PRSI>	   ;"put water in bottle"
		<SETG PRSA ,V?PUT>
		<SETG PRSI ,PRSO>
		<SETG PRSO .W>
		<SET PI? <>>)
	       (<OR <EQUAL? ,PRSO ,GLOBAL-WATER>
		    <EQUAL? ,PRSO ,WATER>>
		<SET W ,PRSO>
		<SET PI? <>>)
	       (ELSE
		<SET W ,PRSI>
		<COND (.W <SET PI? T>)>)>
	 <COND (<EQUAL? .W ,GLOBAL-WATER>
		<SET W ,WATER>
		<COND (<VERB? TAKE PUT> <REMOVE-CAREFULLY .W>)>)>
	 <COND (.PI? <SETG PRSI .W>)
	       (T <SETG PRSO .W>)>
	 <SET AV <LOC ,WINNER>>
	 <COND (<NOT <FSET? .AV ,VEHBIT>> <SET AV <>>)>
	 <COND (<AND <VERB? TAKE PUT> <NOT .PI?>>
		<COND (<AND .AV
			    <OR <EQUAL? .AV ,PRSI>
				<AND <NOT ,PRSI>
				     <NOT <IN? .W .AV>>>>>
		       <TELL 
"Es gibt jetzt eine Pf%utze am Boden von " DER-DAT .AV "." CR>
		       <REMOVE-CAREFULLY ,PRSO>
		       <MOVE ,PRSO .AV>)
		      (<AND ,PRSI <NOT <EQUAL? ,PRSI ,BOTTLE>>>
		       ;<TELL "The water leaks out of " DER-DAT ,PRSI
			     " and evaporates immediately." CR>
		       <TELL "Das Wasser rinnt aus " DER-DAT ,PRSI " und verdampft sofort.">
		       <REMOVE-CAREFULLY .W>)
		      (<IN? ,BOTTLE ,WINNER>
		       <COND (<NOT <FSET? ,BOTTLE ,OPENBIT>>
			      <TELL "Die Flasche ist zu." CR>
			      <THIS-IS-IT ,BOTTLE>)
			     (<NOT <FIRST? ,BOTTLE>>
			      <MOVE ,WATER ,BOTTLE>
			      <TELL "Die Flasche ist jetzt voll Wasser." CR>)
			     (T
			      <TELL "Das Wasser rinnt dir durch die Finger." CR>
			      <RTRUE>)>)
		      (<AND <IN? ,PRSO ,BOTTLE>
			    <VERB? TAKE>
			    <NOT ,PRSI>>
		       <TELL
"Es ist in der Flasche. Vielleicht solltest du das statt dessen nehmen." CR>)
		      (T
		       <TELL "Das Wasser rinnt dir durch die Finger." CR>)>)
	       (.PI?
		<COND (<AND <VERB? PUT>
			    <GLOBAL-IN? ,RIVER ,HERE>>
		       <PERFORM ,V?PUT ,PRSO ,RIVER>)
		      (ELSE
		       <TELL "Nice try." CR>)>
		<RTRUE>)
	       (<VERB? DROP GIVE>
		<COND (<AND <VERB? DROP>
			    <IN? ,WATER ,BOTTLE>
			    <NOT <FSET? ,BOTTLE ,OPENBIT>>>
		       <TELL  "Die Flasche ist zu." CR>
		       <RTRUE>)>
		<REMOVE-CAREFULLY ,WATER>
		<COND (.AV
		       <TELL 
"Es gibt jetzt eine Pf%utze am Boden von " DER-DAT .AV "." CR>
		       <MOVE ,WATER .AV>)
		      (T
		       <TELL
"Das Wasser ist auf dem Boden versch%uttet und verdampft sofort." CR>
		       <REMOVE-CAREFULLY ,WATER>)>)
	       (<VERB? THROW>
		<TELL
"Das Wasser spritzt auf die W%ande und verdampft sofort." CR>
		<REMOVE-CAREFULLY ,WATER>)>>

<GLOBAL KITCHEN-WINDOW-FLAG <>>

<ROUTINE KITCHEN-WINDOW-F ()
	 <COND (<VERB? OPEN CLOSE>
		<SETG KITCHEN-WINDOW-FLAG T>
		<OPEN-CLOSE ,KITCHEN-WINDOW
"Mit gro%ser Anstrengung %offnest du das Fenster weit genug, um einzusteigen."
"The window closes (more easily than it opened).">)
	       (<AND <VERB? EXAMINE>
		     <NOT ,KITCHEN-WINDOW-FLAG>>
		<TELL
"Das Fenster ist einen Spalt offen, aber nicht genug, um Eintritt zu
gew%ahren. " CR>)
	       (<VERB? WALK BOARD THROUGH>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <DO-WALK ,P?OST>)
		      (T
		       <DO-WALK ,P?WEST>)>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL "Du kannst einen Kahlschlag sehen, der nach dem Wald f%uhrt." CR>)
		      (T
		       <TELL "Du kannst einen Raum sehen, der aussieht wie eine K%uche." CR>)>)>>

<ROUTINE GHOSTS-F ()
	 <COND (<VERB? TELL>
		<TELL "Die Geister johlen laut und beachten dich nicht." CR>
		<SETG P-CONT <>>)
	       (<VERB? EXORCISE>
		<TELL "Nur das Zeremoniell hinterl%a%st einen Eindruck." CR>)
	       (<AND <VERB? ATTACK MUNG> <EQUAL? ,PRSO ,GHOSTS>>
		<TELL "Wie kannst du einen Geist mit f%ur Menschen bestimmten Waffen angreifen?" CR>)
	       (T
		<TELL "Es scheint dir unm%oglich mit diesen Geistern zu kommunizieren." CR>)>>

<GLOBAL CAGE-TOP T>

<ROUTINE BASKET-F ()
	 <COND (<OR <VERB? RAISE>
		    <AND <VERB? MOVE>
			 <NOT ,CAGE-TOP>>>
		<COND (<AND ,CAGE-TOP
			    <NOT <VERB? MOVE>>>
		       <TELL <PICK-ONE ,DUMMY> CR>)
		      (T
		       <MOVE ,RAISED-BASKET ,SHAFT-ROOM>
		       <MOVE ,LOWERED-BASKET ,LOWER-SHAFT>
		       <SETG CAGE-TOP T>
		       <THIS-IS-IT ,RAISED-BASKET>
		       <TELL
"Der Korb ist zum oberen Ende des Schachts hinaufgezogen." CR>)>)
	       (<OR <VERB? LOWER>
		    <AND <VERB? MOVE>
			 ,CAGE-TOP>>
		<COND (<AND <NOT ,CAGE-TOP>
			    <NOT <VERB? MOVE>>>
		       <TELL <PICK-ONE ,DUMMY> CR>)
		      (T
		       <MOVE ,RAISED-BASKET ,LOWER-SHAFT>
		       <MOVE ,LOWERED-BASKET ,SHAFT-ROOM>
		       <THIS-IS-IT ,LOWERED-BASKET>
		       <TELL
"Der Korb ist zum unteren Ende des Schacht hinabgelassen." CR>
		       <SETG CAGE-TOP <>>
		       <COND (<AND ,LIT <NOT <SETG LIT <LIT? ,HERE>>>>
			      <TELL "Es ist jetzt stockdunkel." CR>)>
		       T)>)
	       (<OR <EQUAL? ,PRSO ,LOWERED-BASKET>
		    <EQUAL? ,PRSI ,LOWERED-BASKET>>
		<TELL "Der Korb ist am anderen Ende der Kette." CR>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,PRSO ,RAISED-BASKET ,LOWERED-BASKET>>
		<TELL "Der K%afig ist fest an der Kette angebracht." CR>)>>

<ROUTINE BAT-F ()
	 <COND (<VERB? TELL>
		<FWEEP 6>
		<SETG P-CONT <>>)
	       (<VERB? TAKE ATTACK MUNG>
		<COND (<EQUAL? <LOC ,GARLIC> ,WINNER ,HERE>
		       <TELL "Die kannst du nicht erreichen, die h%angt von der Decke." CR>)
		      (T <FLY-ME>)>)>>

<ROUTINE FLY-ME ()
	 <FWEEP 4>
	 <TELL
"Die Fledermaus ergreift dich am Kragen und hebt dich hoch....." CR CR>
	 <GOTO <PICK-ONE ,BAT-DROPS> <>>
	 <COND (<NOT <EQUAL? ,HERE ,ENTRANCE-TO-HADES>>
		<V-FIRST-LOOK>)>
	 T>

<ROUTINE FWEEP (N)
	 <REPEAT ()
		 <COND (<L? <SET N <- .N 1>> 1> <RETURN>)
		       (T <TELL "    Huiiiiii!" CR>)>>
	 <CRLF>>

<GLOBAL BAT-DROPS
      <LTABLE 0
	      MINE-1
	      MINE-2
	      MINE-3
	      MINE-4
	      LADDER-TOP
	      LADDER-BOTTOM
	      SQUEEKY-ROOM
	      MINE-ENTRANCE>>

<ROUTINE BELL-F ()
	 <COND (<VERB? RING>
		<COND (<AND <EQUAL? ,HERE ,LLD-ROOM>
			    <NOT ,LLD-FLAG>>
		       <RFALSE>)
		      (T
		       <TELL "Bim, bam." CR>)>)>>

<ROUTINE HOT-BELL-F ()
	 <COND (<VERB? TAKE>
		<TELL "Die Glocke ist sehr hei%s und kann nicht angefa%st werden." CR>)
	       (<OR <VERB? RUB> <AND <VERB? RING> ,PRSI>>
		<COND (<AND <VERB? RUB>
			    <NOT ,PRSI>>
		       <SETG PRSI ,HANDS>)>
		<COND (<FSET? ,PRSI ,BURNBIT>
		       <TELL 
DER-NOM-CAP ,PRSI " f%angt Feuer und verbrennt." CR>
		       <REMOVE-CAREFULLY ,PRSI>)
		      (<EQUAL? ,PRSI ,HANDS>
		       <TELL "Die Glocke ist zu hei%s zum Anfassen." CR>)
		      (T
		       <TELL "Die Hitze, die die Glocke ausstr%omt ist zu stark." CR>)>)
	       (<VERB? POUR-ON>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL "Das Wasser k%uhlt die Glocke und verdampft." CR>
		;<QUEUE I-XBH 0>
		<ENABLE <QUEUE I-XBH 0>>
		<I-XBH>)
	       (<VERB? RING>
		<TELL "Die Glocke ist zu hei%s, um dranzufassen." CR>)>>

<ROUTINE BOARDED-WINDOW-FCN ()
	 <COND (<VERB? OPEN>
		<TELL 
"Die Fenster sind vernagelt und lassen sich nicht %offnen." CR>)
	       (<VERB? MUNG>
		<TELL "Du kannst die Fenster nicht zerschlagen, um sie zu %offnen." CR>)>>

<ROUTINE NAILS-PSEUDO ()
	 <COND (<VERB? TAKE>
		<TELL
"Die N%agel, die tief in der T%ur eingebettet sind, k%onnen nicht entfernt werden." CR>)>>

<ROUTINE CRACK-FCN ()
	 <COND (<VERB? THROUGH>
		<TELL "Du kannst durch diese Spalte nicht durch." CR>)>>

<ROUTINE KITCHEN-FCN (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <TELL
"Du bist in der K%uche des wei%sen Hauses. Ein Tisch mu%s vor Kurzem zur Bereitung einer Mahlzeit benutzt worden sein. Ein Durchgang f%uhrt nach Westen, und man kann eine dunkle Treppe sehen, die nach oben f%uhrt. Ein dunkler Kamin f%uhrt nach unten. Nach Osten ist ein kleines Fenster, das"> 
	       <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
		      <TELL  " offen ist." CR>)
		     (T
		      <TELL " einen Spalt offen steht." CR>)>)
	      (<==? .RARG ,M-BEG>
	       <COND (<AND <VERB? CLIMB-UP> <EQUAL? ,PRSO ,STAIRS>>
		      <DO-WALK ,P?RAUF>)
		     (<AND <VERB? CLIMB-UP> <EQUAL? ,PRSO ,STAIRS>>
		      <TELL "Es gibt keine Treppe nach unten." CR>)>)>>

<ROUTINE STONE-BARROW-FCN (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-BEG>
		     <OR <VERB? ENTER>
			 <AND <VERB? WALK>
			      <EQUAL? ,PRSO ,P?WEST ,P?HINEIN>>
			 <AND <VERB? THROUGH>
			      <EQUAL? ,PRSO ,BARROW>>>>
		<TELL
"In dem H%ugelgrab|
Wenn du das H%ugelgrab betrittst, schlie%st sich die T%ur f%ur immer hinter dir. Um dich herum ist es finster, aber vor dir ist eine enorme %Offnung, die hell erleuchtet ist. Durch ihr Mitte flie%st ein breiter Strom. %Uber den Strom spannt sich eine h%olzerne Fu%sg%angerbr%ucke. In der Luft schwebt ein gro%ses Schild. Darauf steht: Ihr alle, die ihr vor dieser Br%ucke steht, habt ein gro%ses und beschwerliches Abenteuer hinter euch, das eure Intelligenz und euren Mut gepr%uft hat. Ihr habt den ersten Teil der drei Zorkspiele geschafft. Diejenigen, die %uber diese Br%ucke schreiten m%ussen bereit sein ein noch gr%o%seres Abenteuer zu erleben, das eure Leistung und Tapferkeit ernstlich pr%ufen wird!">
		;<COND (<EQUAL? <BAND <GETB 0 1> 8> 0>)>
		       ;<TELL "the first part of the ZORK trilogy. Those who pass over this bridge must be prepared to undertake an even greater adventure that will severely test your skill and bravery!|
|
The ZORK trilogy continues with %>ZORK II: The Wizard of Frobozz%< and
is completed in %>ZORK III: The Dungeon Master.%<" CR>
		      ;(T
		       <TELL "ZORK: The Great Underground Empire.|" CR>)
		<CRLF> <CRLF>
		;"The ZORK trilogy continues with %>ZORK II: The Wizard of Frobozz%< and is completed in %>ZORK III: The Dungeon Master.%<"
		<TELL "Das dreiteilige ZORKspiel geht weiter mit
%>ZORK II: Der Hexenmeister von Frobozz%< und endet mit %>ZORK III: Der
Kerkermeister%<.">
		<FINISH>)>>

<ROUTINE BARROW-DOOR-FCN ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL "Die T%ur ist zu schwer." CR>)>>

<ROUTINE BARROW-FCN ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?WEST>)>>


<ROUTINE TROPHY-CASE-FCN ()
    <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,TROPHY-CASE>>
	   <TELL
"Der Troph%aenschrank ist unverr%uckbar an der Wand befestigt." CR>)>>
	
<GLOBAL RUG-MOVED <>>

<ROUTINE LIVING-ROOM-FCN (RARG "AUX" RUG? TC)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <TELL
"Du bist im Wohnzimmer. Da sind eine T%ur nach Osten"> 
	       <COND (,MAGIC-FLAG
		      <TELL
". Nach Westen gibt es eine zyklopenf%ormige %Offnung in einer alten T%ur dar%uber gibt es einige uralte Runen, ">)
		     (T
		      <TELL
", eine vernagelte Holzt%ur mit fremden Runen, ">)>
	       <TELL "ein Troph%aenschrank, ">
	       <SET RUG? ,RUG-MOVED>
	       <COND (<AND .RUG? <FSET? ,TRAP-DOOR ,OPENBIT>>
		      <TELL
		       "und ein Teppich liegt neben einer Fallt%ur.">)
		     (.RUG?
		      <TELL 
"und eine geschlossene Fallt%ur bei deinen F%ussen.">)
		     (<FSET? ,TRAP-DOOR ,OPENBIT>
		      <TELL "und eine offene Fallt%ur bei deinen F%ussen.">)
		     (T
		      <TELL"und ein Perserteppich in der Mitte.">)>
	       <CRLF>
	       T)
	      (<EQUAL? .RARG ,M-END>
	       <COND (<OR <VERB? TAKE>
			  <AND <VERB? PUT>
			       <EQUAL? ,PRSI ,TROPHY-CASE>>>
		      <COND (<IN? ,PRSO ,TROPHY-CASE>
			     <TOUCH-ALL ,PRSO>)>
		      <SETG SCORE <+ ,BASE-SCORE <OTVAL-FROB>>>
		      <SCORE-UPD 0>
		      <RFALSE>)>)>>

<ROUTINE TOUCH-ALL (OBJ "AUX" F)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<FSET .F ,TOUCHBIT>
			<COND (<FIRST? .F> <TOUCH-ALL .F>)>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE OTVAL-FROB ("OPTIONAL" (O ,TROPHY-CASE) "AUX" F (SCORE 0))
	 <SET F <FIRST? .O>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN .SCORE>)>
		 <SET SCORE <+ .SCORE <GETP .F ,P?TVALUE>>>
		 <COND (<FIRST? .F> <OTVAL-FROB .F>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE TRAP-DOOR-FCN ()
    <COND (<VERB? RAISE>
	   <PERFORM ,V?OPEN ,TRAP-DOOR>
	   <RTRUE>)
	  (<AND <VERB? OPEN CLOSE>
		<EQUAL? ,HERE ,LIVING-ROOM>>
	   <OPEN-CLOSE ,PRSO
"Die T%ur %offnet sich m%uhsam, und bringt eine bauf%allige Treppe zum Vorschein, die nach unten in die Dunkelheit f%uhrt."
"The door swings shut and closes.">)
	  (<AND <VERB? LOOK-UNDER> <EQUAL? ,HERE LIVING-ROOM>>
	   <COND (<FSET? ,TRAP-DOOR ,OPENBIT>
		  <TELL
"Du siehst eine wackelige Treppe, die in die Dunkelheit f%uhrt." CR>)
		 (T <TELL "Sie ist geschlossen." CR>)>)
	  (<EQUAL? ,HERE ,CELLAR>
	   <COND (<AND <VERB? OPEN UNLOCK>
		       <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		  <TELL
"Die T%ur ist von oben abgeschlossen." CR>)
		 (<AND <VERB? CLOSE> <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		  <FCLEAR ,TRAP-DOOR ,TOUCHBIT>
		  <FCLEAR ,TRAP-DOOR ,OPENBIT>
		  <TELL "Die T%ur geht zu und und verschlie%st sich." CR>)
		 (<VERB? OPEN CLOSE>
		  <TELL <PICK-ONE ,DUMMY> CR>)>)>>

<ROUTINE CELLAR-FCN (RARG)
  <COND (<EQUAL? .RARG ,M-LOOK>
	 <TELL
"Du bist in einem dunklen und muffigen Keller mit einem schmalen Durchgang nach Norden und einem niedrigen Tunnel nach S%uden. Im Westen ist das Ende einer steilen Metallrampe, die nicht erklimmbar ist." CR>)
	(<EQUAL? .RARG ,M-ENTER>
	 <COND (<AND <FSET? ,TRAP-DOOR ,OPENBIT>
		     <NOT <FSET? ,TRAP-DOOR ,TOUCHBIT>>>
		<FCLEAR ,TRAP-DOOR ,OPENBIT>
		<FSET ,TRAP-DOOR ,TOUCHBIT>
		<TELL
"Die Fallt%ur kracht zu, und du h%orst, da%s jemand sie verriegelt." CR CR>)>)>>

<ROUTINE CHIMNEY-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "Der Kamin geht nach "> 
		<COND (<==? ,HERE ,KITCHEN>
		       <TELL "unten">)
		      (T <TELL "oben">)>
		<TELL " und sieht erklimmbar aus." CR>)>>

<ROUTINE UP-CHIMNEY-FUNCTION ("AUX" F)
  <COND (<NOT <SET F <FIRST? ,WINNER>>>
	 <TELL "Mit leeren H%anden nach oben gehen ist keine gute Idee." CR>
	 <RFALSE>)
	(<AND <OR <NOT <SET F <NEXT? .F>>>
		  <NOT <NEXT? .F>>>
	      <IN? ,LAMP ,WINNER>>
	 <COND (<NOT <FSET? ,TRAP-DOOR ,OPENBIT>>
		<FCLEAR ,TRAP-DOOR ,TOUCHBIT>)>
	 <RETURN ,KITCHEN>)
	(T
	 <TELL "Mit dem, was du da schleppst, kannst du da nicht hinauf." CR>
	 <RFALSE>)>>

<ROUTINE TRAP-DOOR-EXIT ()
	 <COND (,RUG-MOVED
		<COND (<FSET? ,TRAP-DOOR ,OPENBIT>
		       <RETURN ,CELLAR>)
		      (T
		       <TELL "Die Fallt%ur ist geschlossen." CR>
		       <THIS-IS-IT ,TRAP-DOOR>
		       <RFALSE>)>)
	       (T
		<TELL "You can't go that way." CR>
		<RFALSE>)>>

<ROUTINE RUG-FCN ()
   <COND (<VERB? RAISE>
	  <TELL "Der Teppich ist zu schwer, um ihn aufzuheben">
	  <COND (,RUG-MOVED
		 <TELL "." CR>)
		(T
		 <TELL
", aber beim Versuchen hast du gemerkt, da%s darunter eine Unebenheit
ist." CR>)>)
	 (<VERB? MOVE PUSH>
	  <COND (,RUG-MOVED
		 <TELL
"Nachdem du vorher den Teppich weggezogen hast, findest du es jetzt unm%oglich ihn zur%uckzuziehen." CR>)
		(T
		 <TELL
"Mit gr%o%ster Anstrengung ist der Teppich aus dem Weg gezerrt. Die staubige Oberfl%ache einer geschlossenen Fallt%ure kommt zum Vorschein." CR>
		 <FCLEAR ,TRAP-DOOR ,INVISIBLE>
		 <THIS-IS-IT ,TRAP-DOOR>
		 <SETG RUG-MOVED T>)>)
	 (<VERB? TAKE>
	  <TELL
"Der Teppich ist %au%serst schwer und man kann ihn nicht tragen." CR>)
	 (<AND <VERB? LOOK-UNDER>
	       <NOT ,RUG-MOVED>
	       <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
	  <TELL
"Unter dem Teppich ist eine geschlossene Fallt%ur. Wenn du den Teppich losl%a%st, ist die Fallt%ur wieder versteckt." CR>)
	 (<VERB? CLIMB-ON>
	  <COND (<AND <NOT ,RUG-MOVED>
		      <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		 <TELL
"W%ahrend du da sitzt bemerkst du eine Unebenheit darunter. Um nicht unbequem zu sitzen, stehst du wieder auf." CR>)
		(ELSE
		 <TELL "Ich nehme an, da%s du denkst, es w%are ein fliegender Teppich?" CR>)>)>>

"SUBTITLE TROLL"

<ROUTINE AXE-F ()
	 <COND (,TROLL-FLAG <>)
	       (T <WEAPON-FUNCTION ,AXE ,TROLL>)>>

<ROUTINE STILETTO-FUNCTION ()
	 <WEAPON-FUNCTION ,STILETTO ,THIEF>>

<ROUTINE WEAPON-FUNCTION (W V)
	<COND (<NOT <IN? .V ,HERE>> <RFALSE>)
	      (<VERB? TAKE>
	       <COND (<IN? .W .V>
		      ;<TELL
DER-NOM-CAP .V " schwingt " DER-ACC .V " au%ser Reichweite." CR>)
		     (T
		      <TELL
DER-NOM-CAP .W " scheint gl%uhend hei%s. Du kannst es nicht in der Hand halten." CR>)>
	       T)>>

<ROUTINE TROLL-FCN ("OPTIONAL" (MODE <>))
	 <COND (<VERB? TELL>
		<SETG P-CONT <>>
		<TELL "Der Troll ist nicht der ideale Gespr%achspartner." CR>)
	       (<EQUAL? .MODE ,F-BUSY?>
		<COND (<IN? ,AXE ,TROLL> <>)
		      (<AND <IN? ,AXE ,HERE> <PROB 75 90>>
		       <FSET ,AXE ,NDESCBIT>
		       <FCLEAR ,AXE ,WEAPONBIT>
		       <MOVE ,AXE ,TROLL>
		       <PUTP ,TROLL ,P?LDESC
"Ein widerlicher Troll, der eine blutige Axt schwingt, blockiert alle Ausg%ange aus dem Zimmer.">
		       <AND <IN? ,TROLL ,HERE>
			    <TELL
"Der Troll holt sich seine Waffe zur%uck. Er ist b%ose und besch%amt. Er scheint sich mit dir an binden zu wollen." CR>>
		      T)
		     (<IN? ,TROLL ,HERE>
		      <PUTP ,TROLL ,P?LDESC
"Ein unsinnig vor sich hin murmelnder Troll ist hier.">
		      <TELL
"Der jetzt entwaffnete Troll kriecht vor Furcht in die Ecke und bittet mit heiserer Trollstimme um sein Leben." CR>
		      T)>)
	      (<EQUAL? .MODE ,F-DEAD>
	       <COND (<IN? ,AXE ,TROLL>
		      <MOVE ,AXE ,HERE>
		      <FCLEAR ,AXE ,NDESCBIT>
		      <FSET ,AXE ,WEAPONBIT>)>
	       <SETG TROLL-FLAG T>)
	      (<EQUAL? .MODE ,F-UNCONSCIOUS>
	       <FCLEAR ,TROLL ,FIGHTBIT>
	       <COND (<IN? ,AXE ,TROLL>
		      <MOVE ,AXE ,HERE>
		      <FCLEAR ,AXE ,NDESCBIT>
		      <FSET ,AXE ,WEAPONBIT>)>
	       <PUTP ,TROLL ,P?LDESC
"Ein bewu%stloser Troll liegt auf der Erde. All Durchg%ange aus dem Zimmer sind ge%offnet.">
	       <SETG TROLL-FLAG T>)
	      (<EQUAL? .MODE ,F-CONSCIOUS>
	       <COND (<IN? ,TROLL ,HERE>
		      <FSET ,TROLL ,FIGHTBIT>
		      <TELL
"Der Troll r%uhrt sich und nimmt schnell eine Kampfstellung ein." CR>)>
	       <COND (<IN? ,AXE ,TROLL>
		      <PUTP ,TROLL ,P?LDESC
"Ein widerlicher Troll, der eine blutige Axt schwingt, blockiert alle Ausg%ange aus dem Zimmer.">)
		     (<IN? ,AXE ,TROLL-ROOM>
		      <FSET ,AXE ,NDESCBIT>
		      <FCLEAR ,AXE ,WEAPONBIT>
		      <MOVE ,AXE ,TROLL>
		      <PUTP ,TROLL ,P?LDESC
"Ein widerlicher Troll, der eine blutige Axt schwingt, blockiert alle Ausg%ange aus dem Zimmer.">)
		     (T
		      <PUTP ,TROLL ,P?LDESC "Ein Troll ist hier.">)>
	       <SETG TROLL-FLAG <>>)
	      (<EQUAL? .MODE ,F-FIRST?>
	       <COND (<PROB 33>
		      <FSET ,TROLL ,FIGHTBIT>
		      <SETG P-CONT <>>
		      T)>)
	      (<NOT .MODE>
	       <COND (<VERB? EXAMINE>
		      <TELL <GETP ,TROLL ,P?LDESC> CR>)
		     (<OR <AND <VERB? THROW GIVE>
			       ,PRSO
			       <EQUAL? ,PRSI ,TROLL>>
			  <VERB? TAKE MOVE MUNG>>
		      <AWAKEN ,TROLL>
		      <COND (<VERB? THROW GIVE>
			     <COND (<AND <EQUAL? ,PRSO ,AXE>
					 <IN? ,AXE ,WINNER>>
				    <TELL
"Der Troll kratzt sich verwirrt am Kopf, dann nimmt er die Axt auf." CR>
				    <FSET ,TROLL ,FIGHTBIT>
				    <MOVE ,AXE ,TROLL>
				    <RTRUE>)
				   (<EQUAL? ,PRSO ,TROLL ,AXE>
				    ;<TELL
"You would have to get the " DER-ACC ,PRSO " first, and that seems unlikely." CR>
				    <TELL "Du m%u%stest " DER-ACC ,PRSO " zuerst holen, aber das scheint unm%oglich.">
				    <RTRUE>)>
			     <COND (<VERB? THROW>
				    <TELL
"Der Troll, der ungemein sportlich ist, f%angt " DER-ACC ,PRSO>)
				   (T
				    <TELL
"Der Troll, der keinen gro%sen Stolz hat, akzeptiert das Geschenk">)>
			     <COND (<AND <PROB 20>
					 <EQUAL? ,PRSO ,KNIFE ,SWORD ,AXE>>
				    <REMOVE-CAREFULLY ,PRSO>
				    <TELL
" und fri%st " PRONOUN-ACC ,PRSO " mit Appetit. Armer Troll, er stirbt an einer inneren Blutung und sein Gerippe verschwindet in einem b%osen schwarzen Nebel." CR>
				    <REMOVE-CAREFULLY ,TROLL>
				    <APPLY <GETP ,TROLL ,P?ACTION> ,F-DEAD>
				    <SETG TROLL-FLAG T>)
				   (<EQUAL? ,PRSO ,KNIFE ,SWORD ,AXE>
				    <MOVE ,PRSO ,HERE>
				    ;<TELL
" and, being for the moment sated, throws" PRONOUN-ACC ,PRSO " back.
Fortunately, the
troll has poor control, and the " DER-NOM ,PRSO " falls to the floor. He does
not look pleased." CR>
				    <TELL 
" und da er momentan ges%attigt ist, wirft er " DER-ACC ,PRSO " zur%uck. Gott sei Dank hat der Troll kein Wurftalent und " DER-ACC ,PRSO " f%allt auf die Erde. Er sieht nicht sehr gl%ucklich aus." CR>
				    <FSET ,TROLL ,FIGHTBIT>)
				   (T
				    ;<TELL
" and not having the most discriminating tastes, gleefully eats it." CR>
				    <TELL " und da er kein gro%ser Feinschmecker ist, fri%st er es gierig." CR>
				    <REMOVE-CAREFULLY ,PRSO>)>)
			    (<VERB? TAKE MOVE>
			     <TELL
"Der Troll spuckt dir ins Gesicht, zischt in einem recht primitiven Dialekt:
%>N%achstes Mal mehr Gl%uck.%<" CR>)
			    (<VERB? MUNG>
			     <TELL
"Der Troll lacht %uber deine hilflose Geste." CR>)>)
		     (<VERB? LISTEN>
		      <TELL
"Hier und da sagt der Troll mit seiner heiseren Trollstimme etwas, das wohl beleidigend ist." CR>)
		     (<AND ,TROLL-FLAG <VERB? HELLO>>
		      <TELL "Leider kann der Troll dich nicht h%oren." CR>)>)>>


"SUBTITLE GRATING/MAZE"

;<GLOBAL LEAVES-GONE <>> ;"no longer used?"
<GLOBAL GRATE-REVEALED <>>
<GLOBAL GRUNLOCK <>>

<ROUTINE LEAVES-APPEAR ()
	<COND (<AND <NOT <FSET? ,GRATE ,OPENBIT>>
	            <NOT ,GRATE-REVEALED>>
	       <COND (<VERB? MOVE TAKE>
		      <TELL
"Beim St%obern im Bl%atterhaufen kommt ein Gitter zum Vorschein." CR>)
		     (T <TELL
"Als die Bl%atter aus dem Weg sind, zeigt sich ein Gitter." CR>)>
	       <FCLEAR ,GRATE ,INVISIBLE>
	       <SETG GRATE-REVEALED T>)>
	<>>

<ROUTINE LEAF-PILE ()
	<COND (<VERB? COUNT>
	       <TELL "Es gibt hier 69.105 Bl%atter." CR>)
	      (<VERB? BURN>
	       <LEAVES-APPEAR>
	       <REMOVE-CAREFULLY ,PRSO>
	       <COND (<IN? ,PRSO ,HERE>
		      <TELL "Die Bl%atter brennen." CR>)
		     (T
		      <JIGS-UP
"Die Bl%atter stehen in Flammen, und du mit.">)>)
	      (<VERB? CUT>
	       <TELL "Du stocherst in den Bl%attern herum und machst eine beachtliche Schweinerei." CR>
	       <LEAVES-APPEAR>
	       <RTRUE>)
	      (<VERB? MOVE TAKE>
	       <COND (<VERB? MOVE>
		      <TELL "Geschafft." CR>)>
	       <COND (,GRATE-REVEALED <RFALSE>)>
	       <LEAVES-APPEAR>
	       <COND (<VERB? TAKE> <RFALSE>)
		     (T <RTRUE>)>)
	      (<AND <VERB? LOOK-UNDER>
		    <NOT ,GRATE-REVEALED>>
	       <TELL
"Unter dem Bl%atterhaufen ist ein Gitter. Wenn du die Bl%atter fallen l%a%st, ist das Gitter wieder versteckt." CR>)>>
 
<ROUTINE CLEARING-FCN (RARG)
  	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<NOT ,GRATE-REVEALED>
		       <FSET ,GRATE ,INVISIBLE>)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du stehst auf einer Lichtung, und ein Wald umgibt dich von allen Seiten. Ein Pfad f%uhrt nach S%uden.">
		<COND (<FSET? ,GRATE ,OPENBIT>
		       <CRLF>
		       <TELL
"Da befindet sich ein offenes Gitter, das in die Dunkelheit hinabf%uhrt.">)
		      (,GRATE-REVEALED
		       <CRLF>
		       <TELL
"Da ist ein Gitter, das Fest im Boden befestigt ist.">)>
		<CRLF>)>>

<ROUTINE MAZE-11-FCN (RARG)
  	 <COND (<EQUAL? .RARG ,M-ENTER>
		<FCLEAR ,GRATE ,INVISIBLE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist in einem kleinen Zimmer bei dem Irrgarten. Es gibt hier in der N%ahe kleine verwirrende G%ange." CR>
		<COND (<FSET? ,GRATE ,OPENBIT>
		       <TELL
 "%Uber dir ist ein offenes Gitter, durch das Sonnenlicht hereinflutet.">)
		      (,GRUNLOCK
		       <TELL "%Uber dir ist ein Gitter.">)
		      (T
		       <TELL
"%Uber dir ist ein Gitter, das mit einem Schlo%s, das aus einem Totenkopf und Gebeinen gemacht ist, verschlossen ist.">)>
		<CRLF>)>>

<ROUTINE GRATE-FUNCTION ()
    	 <COND (<AND <VERB? OPEN> <EQUAL? ,PRSI ,KEYS>>
		<PERFORM ,V?UNLOCK ,GRATE ,KEYS>
		<RTRUE>)
	       (<VERB? LOCK>
		<COND (<EQUAL? ,HERE ,GRATING-ROOM>
	               <COND (,GRUNLOCK
			      <TELL "Das Gitter wird verschlossen." CR>)
			     (T
			      <TELL "Das Gitter ist schon verschlossen." CR>)>)
	              (<EQUAL? ,HERE ,GRATING-CLEARING>
		       <TELL "Du kannst es von innen nicht verschlie%sen." CR>)>)
	       (<AND <VERB? UNLOCK> <EQUAL? ,PRSO ,GRATE>>
		<COND (<AND <EQUAL? ,HERE ,GRATING-ROOM> <EQUAL? ,PRSI ,KEYS>>
		       <COND (,GRUNLOCK
			      <TELL "Das Gitter ist schon aufgeschlo%sen." CR>)
			     (T
			      <TELL "Das Gitter wird aufgeschlo%sen." CR>)>
		       <SETG GRUNLOCK T>)
		      (<AND <EQUAL? ,HERE ,GRATING-CLEARING>
			    <EQUAL? ,PRSI ,KEYS>>
		       <TELL "Du kannst das Schlo%s von hier aus nicht erreichen." CR>)
		      (<AND <EQUAL? ,HERE ,GRATING-ROOM>
			    <EQUAL? ,PRSI ,HANDS>> ;"performed from v-unlock"
		       <TELL "You can't unlock it with your hands." CR>)
		      (T
		       <TELL
"Du kannst das Gitter nicht mit " DER-DAT ,PRSI " aufschlie%sen?" CR>)>)
               (<VERB? PICK>
		<TELL "Du kannst das Schlo%s nicht knacken." CR>)
               (<VERB? OPEN CLOSE>
		<COND (,GRUNLOCK
		       <OPEN-CLOSE ,GRATE
				   <COND (<EQUAL? ,HERE ,CLEARING>
					  "Das Gitter ist zu %offnen.")
					 (T
"Das Gitter %offnet sich und bringt B%aume %uber dir zum Vorschein.")>
				   "Das Gitter ist geschlo%sen.">
		       <COND (<FSET? ,GRATE ,OPENBIT>
			      <COND (<AND <NOT <EQUAL? ,HERE ,CLEARING>>
					  <NOT ,GRATE-REVEALED>>
				     <TELL
"Ein Haufen Bl%atter f%allt auf deinen Kopf und auf die Erde." CR>
				     <SETG GRATE-REVEALED T>
				     <MOVE ,LEAVES ,HERE>)>
			      <FSET ,GRATING-ROOM ,ONBIT>)
			     (T <FCLEAR ,GRATING-ROOM ,ONBIT>)>)
		      (T <TELL "Das Gitter ist verschlo%sen." CR>)>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI ,GRATE>>
		<COND (<G? <GETP ,PRSO ,P?SIZE> 20>
		       <TELL PRONOUN-NOM-CAP ,PRSO " pa%st nicht durch das Gitter." CR>)
		      (T
		       <MOVE ,PRSO ,GRATING-ROOM>
		       <TELL
DER-NOM-CAP ,PRSO " verschwindet durch das Gitter in die Dunkelheit, die darunter herrscht." CR>)>)>>

<ROUTINE MAZE-DIODES ()
	 <TELL
"Wenn dieser Tunnel das n%achste Zimmer erreicht, kannst du ihn nicht mehr
als R%uckweg benutzen." CR CR>
	 <COND (<EQUAL? ,HERE ,MAZE-2> ,MAZE-4)
	       (<EQUAL? ,HERE ,MAZE-7> ,DEAD-END-1)
	       (<EQUAL? ,HERE ,MAZE-9> ,MAZE-11)
	       (<EQUAL? ,HERE ,MAZE-12> ,MAZE-5)>>

<ROUTINE RUSTY-KNIFE-FCN ()
	<COND (<VERB? TAKE>
	       <AND <IN? ,SWORD ,WINNER>
		    <TELL
"Als du das rostige Messer anfa%st, blitzt dein Schwert kurz mit einem einem blendenden blauen Licht auf." CR>>
	       <>)
	      (<OR <AND <EQUAL? ,PRSI ,RUSTY-KNIFE>
			<VERB? ATTACK>>
		   <AND <VERB? SWING>
			<EQUAL? ,PRSO ,RUSTY-KNIFE>
			,PRSI>>
	       <REMOVE-CAREFULLY ,RUSTY-KNIFE>
	       <JIGS-UP
"Als das Messer sich seinem Opfer n%ahert, wird dein Gehirn von einem Willen %uberw%altigt, den du nicht meisterst. Langsam dreht sich deine Hand bis die rostige Schneide 2 cm von deinem Hals entfernt ist. Das Messer scheint zu singen, als es auf brutalste Weise deinen Hals durchschneidet.">)>>

<ROUTINE KNIFE-F ()
	 <COND (<VERB? TAKE>
		<FCLEAR ,ATTIC-TABLE ,NDESCBIT>
		<RFALSE>)>>

<ROUTINE SKELETON ()
	 <COND (<VERB? TAKE RUB MOVE PUSH RAISE LOWER ATTACK KICK KISS>
		<TELL
"Ein Geist erscheint in dem Zimmer und ist entsetzt %uber deine Sch%andung der Leiche eines Abenteuererkollegen. Er verflucht deine Wertsachen, und verbannt sie in das Land der lebendigen Toten. Der Geist verschwindet unter einem Schwall von ordin%aren Ausdr%ucken. " CR>
	 	<ROB ,HERE ,LAND-OF-LIVING-DEAD 100>
	 	<ROB ,ADVENTURER ,LAND-OF-LIVING-DEAD>
	 	T)>>

<ROUTINE TORCH-OBJECT ()
    <COND (<VERB? EXAMINE>
	   <TELL "Die Fackel brennt." CR>)
	  (<AND <VERB? POUR-ON>
		<EQUAL? ,PRSI ,TORCH>>
	   <TELL "Das Wasser verdampft bevor es mit der Fackel in Ber%uhrung kommt." CR>)
	  (<AND <VERB? LAMP-OFF> <FSET? ,PRSO ,ONBIT>>
	   <TELL
"Du verbrennst dir beinahe die Hand, als du versuchst, die Flamme zu
l%oschen." CR>)>>


"SUBTITLE MIRROR, MIRROR, ON THE WALL"

<ROUTINE MIRROR-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
	        <TELL
"Du bist in einem viereckigen Zimmer mit hohen Decken. An der S%udwand ist ein riesiger Spiegel, der die ganze Wand einnimmt. Es gibt Ausg%ange an den anderen drei Seiten des Zimmers." CR>
		<COND (,MIRROR-MUNG
		       <TELL
"Leider ging der Spiegel durch deine Bl%odheit kaputt." CR>)>)>>

<GLOBAL MIRROR-MUNG <>>
<GLOBAL LUCKY T>

<ROUTINE MIRROR-MIRROR ("AUX" RM2 L1 L2 N)
	 <SET RM2 ,MIRROR-ROOM-2>
	 <COND (<AND <NOT ,MIRROR-MUNG> <VERB? RUB>>
	       <COND (<AND ,PRSI <NOT <EQUAL? ,PRSI ,HANDS>>>
		      <TELL
"Du f%uhlst ein leichtes Kribbeln, das von " DER-ACC ,PRSI " ausgeht." CR>
		      <RTRUE>)>
	       <COND (<EQUAL? ,HERE .RM2>
		      <SET RM2 ,MIRROR-ROOM-1>)>
	       <SET L1 <FIRST? ,HERE>>
	       <SET L2 <FIRST? .RM2>>
	       <REPEAT ()
		       <COND (<NOT .L1> <RETURN>)>
		       <SET N <NEXT? .L1>>
		       <MOVE .L1 .RM2>
		       <SET L1 .N>>
	       <REPEAT ()
		       <COND (<NOT .L2> <RETURN>)>
		       <SET N <NEXT? .L2>>
		       <MOVE .L2 ,HERE>
		       <SET L2 .N>>
	       <GOTO .RM2 <>>
	       <TELL
"Ein Grollen ert%ont aus der Tiefe, so da%s der Raum bebt." CR>)
	      (<VERB? LOOK-INSIDE EXAMINE>
	       <COND (,MIRROR-MUNG
		      <TELL "Der Spiegel ist in viele Scherben zerbrochen.">)
		     (T
		      <TELL
"Eine h%a%sliche Person starrt aus dem Spiegel zur%uck.">)>
	       <CRLF>)
	      (<VERB? TAKE>
	       <TELL
"Der Spiegel ist mehrmals so gro%s wie du. Gib's auf!" CR>)
	      (<VERB? MUNG THROW ATTACK>
	       <COND (,MIRROR-MUNG
		      <TELL
"Hast du denn nicht schon genug Schaden angerichtet?" CR>)
		     (T
		      <SETG MIRROR-MUNG T>
		      <SETG LUCKY <>>
		      <TELL
"Du hast den Spiegel zerbrochen. Ich hoffe, du hast sieben Jahre Gl%uck zur Hand." CR>)>)>>

"SUBTITLE THE DOME"

<ROUTINE TORCH-ROOM-FCN (RARG)
 	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Dies ist ein gro%ser Raum, in dessen Mitte sich ein kleiner Schacht befindet,
der durch den Fu%sboden in die Dunkelheit verschwindet. Nach Westen und Norden gibt es Ausg%ange von diesem Zimmer. %Uber dem Schacht hat man ein Metallgeh%ause gebaut, an dem eine schwere, eiserne Kette befestigt ist. An dem anderen Ende der Kette h%angt ein Korb." CR>
		<COND (,DOME-FLAG
		       <TELL
"Ein Seil h%angt von dem Gel%ander runter und endet 3 Meter %uber deinem Kopf. " CR>)>)>>

<ROUTINE DOME-ROOM-FCN (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist am Rand einer gro%sen Kuppel, die die Decke der Raumes darunter formt. Ein h%olzernes Gel%ander, das die Kuppel umgibt, besch%utzt dich vor dem Absturz in einen steilen Abgrund." CR>
		<COND (,DOME-FLAG
		       <TELL
"Von dem Gel%ander h%angt ein Seil, das etwa 3 Meter %uber dem Boden endet." CR>)>)
	       (<EQUAL? .RARG ,M-ENTER>
		<COND (,DEAD
		       <TELL
"Wenn du die Kuppel betrittst, f%uhlst du einen starken Sog, wie von einem Wind, der dich %uber das Gel%ander und nach unten rei%st." CR>
		       <MOVE ,WINNER ,TORCH-ROOM>
		       <SETG OHERE <>>
		       <SETG HERE ,TORCH-ROOM>
		       <RTRUE>)
		      (<VERB? LEAP>
		       <JIGS-UP
"Wie tragisch! Der Sprung, den du gerade gewagt hast, hat dich umgebracht.">)>)>>

;<GLOBAL EGYPT-FLAG <>>	;"no longer used?"

"SUBTITLE LAND OF THE DEAD"

<ROUTINE LLD-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist au%serhalb eines riesigen Tores mit der Aufschrift:|
|
   Gebt auf jegliche Hoffnung Ihr,|
       die Ihr hier eintretet!|
|
Das Tor ist ge%offnet. Gro%se Trostlosigkeit und ein Haufen von zerquetschten K%orpern breitet sich vor dir aus. Tausende von Stimmen, die von einem schrecklichen Schicksal klagen, ert%onen." CR>
		<COND (<AND <NOT ,LLD-FLAG> <NOT ,DEAD>>
		       <TELL
"Der Eintritt durch das Tor ist von b%osen Geistern versperrt, die bei deinem Versuch Eintritt zu gewinnen, nur grinsen." CR>)>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<VERB? EXORCISE>
		       <COND (<NOT ,LLD-FLAG>
			      <COND (<AND <IN? ,BELL ,WINNER>
					  <IN? ,BOOK ,WINNER>
					  <IN? ,CANDLES ,WINNER>>
				     <TELL
"Du mu%st diese Zeremonie durchf%uhren." CR>)
				    (T
				     <TELL
"F%ur eine Austreibung bist du nicht vorbereitet." CR>)>)>)
		      (<AND <NOT ,LLD-FLAG>
			    <VERB? RING>
			    <EQUAL? ,PRSO ,BELL>>
		       <SETG XB T>
		       <REMOVE-CAREFULLY ,BELL>
		       <THIS-IS-IT ,HOT-BELL>
		       <MOVE ,HOT-BELL ,HERE>
		       <TELL
"Die Glocke wird pl%otzlich gl%uhend hei%s und f%allt zu Boden. Die Geister, als w%aren sie versteinert, h%oren mit dem Gejammer auf und drehen sich dir zu. Auf ihren fahlen Gesichtern formt sich der Ausdruck einer langvergessenen Furcht." CR>
		       <COND (<IN? ,CANDLES ,WINNER>
			      <TELL
"In deiner Verwirrung fallen die Kerzen auf den Boden (und sie sind aus)." CR>
			      <MOVE ,CANDLES ,HERE>
			      <FCLEAR ,CANDLES ,ONBIT>
			      <DISABLE <INT I-CANDLES>>)>
		       <ENABLE <QUEUE I-XB 6>>
		       <ENABLE <QUEUE I-XBH 20>>)
		      (<AND ,XC
			    <VERB? READ>
			    <EQUAL? ,PRSO ,BOOK>
			    <NOT ,LLD-FLAG>>
		       <TELL
"Jedes Wort des Gebetes hallt in einem ohrenbet%aubenden Durcheinander durch den Saal. Als die letzten Worte verhallen, spricht eine laute und befehlende Stimme: %>Weg mit Euch, Ihr Biester!%< Ein herzzerrei%sender Schrei f%ullt die H%ohle, und die Geister, eine h%ohere Macht versp%uren fliehen durch die W%ande." CR>
		       <REMOVE-CAREFULLY ,GHOSTS>
		       <SETG LLD-FLAG T>
		       <DISABLE <INT I-XC>>)>)
	       (<EQUAL? .RARG ,M-END>
		<COND (<AND ,XB
			    <IN? ,CANDLES ,WINNER>
			    <FSET? ,CANDLES ,ONBIT>
			    <NOT ,XC>>
		       <SETG XC T>
		       <TELL
"Die Flammen flackern wild und scheinen zu tanzen. Die Erde unter dir zittert, und deine Knie drohen aufzugeben. Die Geister verzweifeln an deiner %uberirdischen Kraft." CR>
		       <DISABLE <INT I-XB>>
		       <ENABLE <QUEUE I-XC 3>>)>)>>

<GLOBAL XB <>>

<GLOBAL XC <>>

<ROUTINE I-XB ()
	 <OR ,XC
	     <AND <EQUAL? ,HERE ,ENTRANCE-TO-HADES>
		  <TELL
"Der Bann dieser Zeremonie ist gebrochen, und die Geister, die zwar am%usiert, aber doch von deinem tolpatschigen Versuch gest%ort sind, nehmen ihr schreckliches Geheule wieder auf." CR>>>
	 <SETG XB <>>>

<ROUTINE I-XC ()
	 <SETG XC <>>
	 <I-XB>>

<ROUTINE I-XBH ()
	 <REMOVE-CAREFULLY ,HOT-BELL>
	 <MOVE ,BELL ,ENTRANCE-TO-HADES>
	 <COND (<EQUAL? ,HERE ,ENTRANCE-TO-HADES>
		<TELL "Die Glocke scheint sich abgek%uhlt zu haben." CR>)>>


"SUBTITLE FLOOD CONTROL DAM #3"

<GLOBAL GATE-FLAG <>>
<GLOBAL GATES-OPEN <>>

<ROUTINE DAM-ROOM-FCN (RARG)
   	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du stehst oben auf dem Hochwasserschutzdamm Nr.3. Er war wohl zu seiner Zeit eine gro%se Sehensw%urdigkeit. Es gibt hier Pfade nach Norden, S%uden und Westen und eine steile Abk%urzung. " CR>
		<COND (<AND ,LOW-TIDE ,GATES-OPEN>
		       <TELL
"Der Wasserstand hinter dem Damm ist niedrig. Die Schleusentore sind ge%offnet worden. Das Wasser braust durch den Damm flu%sabw%arts." CR>)
		      (,GATES-OPEN
		       <TELL
"Die Schleusentore sind ge%offnet. Wasser braust durch den Damm. Der Wasserstand hinter dem Damm ist immer noch hoch." CR>)
		      (,LOW-TIDE
		       <TELL
"Die Schleusentore sind geschlo%sen. Der Wasserstand in dem Reservoir ist niedrig, aber er steigt schnell." CR>)
		      (T
		       <TELL
"Die Schleusentore des Dammes sind geschlo%sen. Hinter dem Damm kann man ein gro%ses Reservoir sehen. Wasser flie%st wild %uber den seit langem unbenutzten Damm." CR>)>
		<TELL "Es gibt hier eine Schalttafel, auf der eine gro%se Metallschraube angebracht ist. Direkt %uber der Schraube ist eine kleine gr%une Plastikblase">
		<COND (,GATE-FLAG
		       <TELL ", die klar aufleuchtet">)>
		<TELL "." CR>)>>

<ROUTINE BOLT-F ()
	<COND (<VERB? TURN>
	       <COND (<EQUAL? ,PRSI ,WRENCH>
		      <COND (,GATE-FLAG
			     <FCLEAR ,RESERVOIR-SOUTH ,TOUCHBIT>
			     <COND (,GATES-OPEN
				    <SETG GATES-OPEN <>>
				    <FCLEAR ,LOUD-ROOM ,TOUCHBIT>
				    <TELL
"Die Schleusentore schlie%sen sich, und Wasser sammelt sich hinter dem Damm an." CR>
				    <ENABLE <QUEUE I-RFILL 8>>
				    ;<QUEUE I-REMPTY 0>
				    <ENABLE <QUEUE I-REMPTY 0>>
				    T)
				   (T
				    <SETG GATES-OPEN T>
				    <TELL
"Die Schleusentore %offnen sich, und Wasser str%omt durch den Damm." CR>
				    <ENABLE <QUEUE I-REMPTY 8>>
				    ;<QUEUE I-RFILL 0>
				    <ENABLE <QUEUE I-RFILL 0>>
				    T)>)
			    (T <TELL
"The bolt won't turn with your best effort." CR>)>)
		     (ELSE
		      <TELL
"Die Schraube l%a%st sich mit " DER-ACC ,PRSI " nicht drehen." CR>)>)
	      (<VERB? TAKE>
	       <INTEGRAL-PART>)
	      (<VERB? OIL>
	       <TELL
"O nein! Es sieht so aus, als ob die Tube nicht %Ol, sondern Klebstoff enthalten hat. Die Schraube wird dadurch nicht einfacher." CR>)>>

<ROUTINE BUBBLE-F ()
	 <COND (<VERB? TAKE>
		<INTEGRAL-PART>)>>

<ROUTINE INTEGRAL-PART ()
	 <TELL "Es ist ein wichtiger Bestandteil der Schalttafel." CR>>

<ROUTINE I-RFILL ()
	 <FSET ,RESERVOIR ,NONLANDBIT>
	 <FCLEAR ,RESERVOIR ,RLANDBIT>
	 ;"next two from jeff"
	 ;<FSET ,IN-STREAM ,NONLANDBIT>
	 ;<FCLEAR ,IN-STREAM ,RLANDBIT>
	 <FCLEAR ,DEEP-CANYON ,TOUCHBIT>
	 <FCLEAR ,LOUD-ROOM ,TOUCHBIT>
	 <AND <IN? ,TRUNK ,RESERVOIR>
	      <FSET ,TRUNK ,INVISIBLE>>
	 <SETG LOW-TIDE <>>
	 <COND (<EQUAL? ,HERE ,RESERVOIR>
		<COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		       <TELL
"Das Boot hebt sich leicht aus dem Schlamm und treibt auf dem Wasser des Reservoirs." CR>)
		      (T
		       <JIGS-UP
"Du wirst von dem steigenden Flu%s in die H%ohe gehoben! Du versuchst, zu schwimmen, aber die Str%omung ist zu stark. Du ger%atst n%aher und n%aher an die %uberw%altigende Masse des Hochwasserschutzdammes #3. Der Damm winkt dir zu. Das Get%ose des Wassers macht dich fast taub, aber du bleibst bei Bewu%stsein, als du %uber den Damm st%urzt und deinem sicheren Tode zwischen den Steinen auf seinem Grund entgegen siehst.">)>)
	       (<EQUAL? ,HERE ,DEEP-CANYON>
		<TELL
"Ein Ger%ausch, wie das von flie%sendem Wasser, kann von unten geh%ort werden." CR>)
	       (<EQUAL? ,HERE ,LOUD-ROOM>
		<TELL
"Pl%otzlich f%ullt ein alarmierend lautes Gebr%ull den Raum. Voller Furcht kriechst du davon." CR>
		<GOTO <PICK-ONE ,LOUD-RUNS>>)
	       (<EQUAL? ,HERE ,RESERVOIR-NORTH ,RESERVOIR-SOUTH>
		<TELL
"Du merkst, da%s der Wasserstand so hoch ist, da%s man nicht mehr zu Fu%s weiterkommt." CR>)>
	 T>

<GLOBAL LOUD-RUNS <LTABLE 0 DAMP-CAVE ROUND-ROOM DEEP-CANYON>>

<ROUTINE I-REMPTY ()
	 <FSET ,RESERVOIR ,RLANDBIT>
	 <FCLEAR ,RESERVOIR ,NONLANDBIT>
	 ;"next two from jeff"
	 ;<FSET ,IN-STREAM ,RLANDBIT>
	 ;<FCLEAR ,IN-STREAM ,NONLANDBIT>
	 <FCLEAR ,DEEP-CANYON ,TOUCHBIT>
	 <FCLEAR ,LOUD-ROOM ,TOUCHBIT>
	 <FCLEAR ,TRUNK ,INVISIBLE>
	 <SETG LOW-TIDE T>
	 <COND (<AND <EQUAL? ,HERE ,RESERVOIR>
		     <FSET? <LOC ,WINNER> ,VEHBIT>>
		<TELL
"Der Wasserstand hat sich so weit gemindert, da%s das Boot nicht mehr weiter schwimmen kann. Es sinkt in den Schlamm." CR>)
	       (<EQUAL? ,HERE ,DEEP-CANYON>
		<TELL
"Das Get%ose von dem brausenden Wasser ist jetzt ruhiger." CR>)
	       (<EQUAL? ,HERE ,RESERVOIR-NORTH ,RESERVOIR-SOUTH>
		<TELL
"Der Wasserstand ist hier recht niedrig, und du k%onntest hier leicht auf die andere Seite kommen." CR>)>
	 T>

;<GLOBAL DROWNINGS
      <TABLE (PURE) "up to your ankles."
	"up to your shin."
	"up to your knees."
	"up to your hips."
	"up to your waist."
	"up to your chest."
	"up to your neck."
	"over your head."
	"high in your lungs.">>

<GLOBAL DROWNINGS
	<TABLE (PURE) "bis an deine Kn%ochel."
"bis an dein Kinn."
"bis an deine Knie."
"bis an deine H%uften."
"bis an deine Taille."
"bis an deine Brust."
"bis an deinen Hals."
"%uber deinen Kopf."
"hoch in deiner Lunge.">>

<GLOBAL WATER-LEVEL 0>
<GDECL (WATER-LEVEL) FIX>

<ROUTINE BUTTON-F ()
	 <COND (<VERB? READ>
		<TELL "Das kommt dir alles Spanisch vor." CR>)
	       (<VERB? PUSH>
		<COND (<EQUAL? ,PRSO ,BLUE-BUTTON>
		       <COND (<0? ,WATER-LEVEL>
			      <FCLEAR ,LEAK ,INVISIBLE>
			      <TELL
"Da ist ein grollendes Ger%ausch, und ein Strom von Wasser scheint von der Ostwand in das Zimmer hereinzubrechen (scheinbar ein Rohr bruch)." CR>
			      <SETG WATER-LEVEL 1>
			      <ENABLE <QUEUE I-MAINT-ROOM -1>>
			      T)
			     (T
			      <TELL
"Der blaue Knopf scheint, blockiert zu sein." CR>)>)
		      (<EQUAL? ,PRSO ,RED-BUTTON>
		       <TELL "Die Lichter im Raum gehen ">
		       <COND (<FSET? ,HERE ,ONBIT>
			      <FCLEAR ,HERE ,ONBIT>
			      <TELL "aus." CR>)
			     (T
			      <FSET ,HERE ,ONBIT>
			      <TELL "an." CR>)>)
		      (<EQUAL? ,PRSO ,BROWN-BUTTON>
		       <FCLEAR ,DAM-ROOM ,TOUCHBIT>
		       <SETG GATE-FLAG <>>
		       <TELL "Klick." CR>)
		      (<EQUAL? ,PRSO ,YELLOW-BUTTON>
		       <FCLEAR ,DAM-ROOM ,TOUCHBIT>
		       <SETG GATE-FLAG T>
		       <TELL "Klick." CR>)>)>>

<ROUTINE TOOL-CHEST-FCN ()
	 <COND (<VERB? EXAMINE>
		<TELL "Die Werkzeugk%asten sind alle leer." CR>)
	       (<VERB? TAKE OPEN PUT>
		<REMOVE-CAREFULLY ,TOOL-CHEST>
<TELL "Die K%asten sind so rostig und verrottet, das sie zerfallen, wenn du sie anfa%st." CR>)
	       (<VERB? OPEN>
		<TELL "Die Werkzeugk%asten sind schon offen." CR>)>>

<ROUTINE I-MAINT-ROOM ("AUX" HERE?)
	 <SET HERE? <EQUAL? ,HERE ,MAINTENANCE-ROOM>>
	 <COND (.HERE? <TELL "The water level here is now "> <TELL <GET
		,DROWNINGS </ ,WATER-LEVEL 2>>> <CRLF>)>
	 <SETG WATER-LEVEL <+ 1 ,WATER-LEVEL>>
	 <COND (<NOT <L? ,WATER-LEVEL 14>>
		<MUNG-ROOM ,MAINTENANCE-ROOM
"Der Raum ist voll Wasser und kann nicht betreten werden.">
		;<QUEUE I-MAINT-ROOM 0>
		<ENABLE <QUEUE I-MAINT-ROOM 0>>
		<COND (.HERE?
		     <JIGS-UP
"Leider hast du dich ertr%ankt.">)>)
	       (<AND <IN? ,WINNER ,INFLATED-BOAT>
		     <EQUAL? ,HERE ,MAINTENANCE-ROOM ,DAM-ROOM ,DAM-LOBBY>>
		<JIGS-UP
"Das steigende Wasser tr%agt das Boot %uber den Damm, flu%sabw%arts und %uber die F%alle. Sowas Dummes.">)>
	 <RTRUE>>

<ROUTINE LEAK-FUNCTION ()
	<COND (<G? ,WATER-LEVEL 0>
	       <COND (<AND <VERB? PUT PUT-ON>
			   <EQUAL? ,PRSO ,PUTTY>>
		      <FIX-MAINT-LEAK>)
		     (<VERB? PLUG>
		      <COND (<EQUAL? ,PRSI ,PUTTY>
			     <FIX-MAINT-LEAK>)
			    (T <WITH-TELL ,PRSI>)>)>)>>

<ROUTINE FIX-MAINT-LEAK ()
	 <SETG WATER-LEVEL -1>
	 ;<QUEUE I-MAINT-ROOM 0>
	 <ENABLE <QUEUE I-MAINT-ROOM 0>>
	 <TELL
"Durch ein Wunder der Zorkschen Technologie ist es dir gelungen, das Leck im Damm zu beheben." CR>>

<ROUTINE PUTTY-FCN ()
	 <COND (<OR <AND <VERB? OIL>
			 <EQUAL? ,PRSI ,PUTTY>>
		    <AND <VERB? PUT>
			 <EQUAL? ,PRSO ,PUTTY>>>
		<TELL "Das Allzweckschmierzeug dient nicht als Schmier%ol." CR>)>>

<ROUTINE TUBE-FUNCTION ()
	 <COND (<AND <VERB? PUT>
		     <EQUAL? ,PRSI ,TUBE>>
		<TELL "Die Tube nimmt einfach nichts auf." CR>)
	       (<VERB? SQUEEZE>
		<COND (<AND <FSET? ,PRSO ,OPENBIT>
			    <IN? ,PUTTY ,PRSO>>
		       <MOVE ,PUTTY ,WINNER>
		       <TELL "Das widerliche Zeug quillt %uber deine ganze Hand." CR>)
		      (<FSET? ,PRSO ,OPENBIT>
		       <TELL "Die Tube ist scheinbar leer." CR>)
		      (T
		       <TELL "Die Tube ist zu." CR>)>)>>

<ROUTINE DAM-FUNCTION ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL "Das klingt annehmbar, aber so geht es nicht." CR>)
	       (<VERB? PLUG>
		<COND (<EQUAL? ,PRSI ,HANDS>
		       <TELL
"Bist du der kleine Gernegro%s, ja? Zu dumm, das ist ein gro%ser Damm." CR>)
		      (T
		       <TELL
"Mit " EIN-DAT ,PRSI "? Wei%st du wie gro%s der Damm ist? Du k%onntest h%ochstens ein winziges Leck damit stopfen." CR>)>)>>

<ROUTINE WITH-TELL (OBJ)
	 <TELL "With " EIN-DAT  .OBJ "?" CR>>

<ROUTINE RESERVOIR-SOUTH-FCN (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <COND (<AND ,LOW-TIDE ,GATES-OPEN>
		      <TELL
"Du bist in einem l%anglichen Zimmer. Nach Norden lag fr%uher ein See. Aber, nachdem der Wasserstand gemindert wurde, gibt es hier blo%s einen breiten Bach, der durch die Mitte des Raumes flie%st.">)
		     (,GATES-OPEN
		      <TELL
"Du bist in einem l%anglichen Zimmer. Nach Norden liegt ein gro%ser See. Er ist zu tief, ihn zu %uberqueren. Du merkst aber, da%s der Wassterstand sich rapide senkt. Es wird nicht lange dauern, bis du den See %uberqueren kannst.">)
		     (,LOW-TIDE
		      <TELL
"Du bist in einem l%anglichen Zimmer. Nach Norden gibt es eine weite Fl%ache, die fr%uher ein Reservoir war, aber jetzt nur noch ein Flu%s ist. Du bemerkst aber, da%s der Wasserstand des Flu%ses sich rapide hebt, und da%s es bald unm%oglich sein wird, ihn zu %uberqueren.">)
		     (T
		      <TELL
"Du bist in einem l%anglichen Raum am S%udufer eines gro%sen Sees, der viel zu tief und zu breit zum %Uberqueren ist.">)>
	       <CRLF>
	       <TELL
"Den Bach entlang f%uhrt ein Pfad nach Osten oder Westen, ein steiler Pfad, nach S%udwesten den Rand einer Spalte entlang und ein Pfad f%uhrt in eine Schlucht nach S%udosten." CR>)>>

<ROUTINE RESERVOIR-FCN (RARG)
   	<COND (<AND <EQUAL? .RARG ,M-END>
		    <NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		    <NOT ,GATES-OPEN>
		    ,LOW-TIDE>
	       <TELL
"Du bemerkst, da%s der Wasserstand sich hier rapide hebt. Die Str%omungen werden auch st%arker. Hier zu bleiben, erscheint recht gef%ahrlich." CR>)
	      (<EQUAL? .RARG ,M-LOOK>
	       <COND (,LOW-TIDE
		      <TELL
"Du stehst da, wo einmal ein gro%ser See war, aber der ist jetzt ein gro%ser Schlammhaufen. Es gibt hier %>Ufer%< nach Norden und S%uden." CR>)
		     (T
		      <TELL
"Du bist auf dem See. Nach Norden und S%uden kann man Str%ande sehen. Flu%saufw%arts flie%st ein kleiner Flu%s durch eine enge Rinne in den Felsen in den See hinein. Flu%sabw%arts kann man den Damm sehen.">)>
	       <CRLF>)>>

<ROUTINE RESERVOIR-NORTH-FCN (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <COND (<AND ,LOW-TIDE ,GATES-OPEN>
		      <TELL
"Du bist in einem grottenartigen Raum. Sein S%udteil war einmal ein See.
Aber, mit dem geminderten Wasserstand, gibt es hier nur noch einen breiten Bach, der hier durchflie%st.">)
		     (,GATES-OPEN
		      <TELL
"Du bist in einer weiten grottenartigen Gegend. Nach S%uden ist ein gro%ser See, dessen Wasserstand rapide zu fallen scheint.">)
		     (,LOW-TIDE
		      <TELL
"Du bist in einer grottenartigen Gegend. Nach S%uden ist ein sehr breiter Strom. Der Wasserstand des Stroms steigt rapide, und es scheint, da%s es bald unm%oglich sein wird auf die andere Seite zu kommen.">)
		     (T
		      <TELL
"Du bist in einem grottenartigen Raum auf der Nordseite eines gro%sen Sees.">)>
	       <CRLF>
	       <TELL
"Eine schleimige Treppe f%uhrt aus Raum nach Norden." CR>)>>


<ROUTINE BOTTLE-FUNCTION ("AUX" (E? <>))
  <COND (<AND <VERB? THROW> <==? ,PRSO ,BOTTLE>>
	 <REMOVE-CAREFULLY ,PRSO>
	 <SET E? T>
	 ;<TELL "The bottle hits the far wall and shatters." CR>
	 <TELL "Die Flasche trifft die Wand und zerschellt." CR>)
	(<VERB? MUNG>
	 <SET E? T>
	 <REMOVE-CAREFULLY ,PRSO>
	 ;<TELL "A brilliant maneuver destroys the bottle." CR>
	 <TELL "Eine brilliante Aktion, die die Flasche zerst%ort." CR>)
	(<VERB? SHAKE>
	 <COND (<AND <FSET? ,PRSO ,OPENBIT> <IN? ,WATER ,PRSO>>
		<SET E? T>)>)>
  <COND (<AND .E? <IN? ,WATER ,PRSO>>
	 <TELL "Das Wasser spritzt auf den Boden und verdampft." CR>
	 <REMOVE-CAREFULLY ,WATER>
	 T)
	(.E? <RTRUE>)>>


"SUBTITLE CYCLOPS"

<GLOBAL CYCLOWRATH 0>

<ROUTINE CYCLOPS-FCN ("AUX" COUNT)
	<SET COUNT ,CYCLOWRATH>
	<COND (<EQUAL? ,WINNER ,CYCLOPS>
	       <COND (,CYCLOPS-FLAG
		      <TELL "Es hat keinen Sinn mit ihm zu sprechen. Er schl%aft fest." CR>)
		     (<VERB? ODYSSEUS>
		      <SETG WINNER ,ADVENTURER>
		      <PERFORM ,V?ODYSSEUS>
		      <RTRUE>)
		     (ELSE
		      <TELL
"Der Zyklop zieht das Essen der Unterhaltung vor." CR>)>)
	      (,CYCLOPS-FLAG
	       <COND (<VERB? EXAMINE>
		      <TELL
"Der Zyklop schl%aft wie ein Engel, wenn auch ein h%a%slicher." CR>)
		     (<VERB? ALARM KICK ATTACK BURN MUNG>
		      <TELL
"Der Zyklop g%ahnt und starrt das Ding an, das ihn aufgeweckt hat." CR>
		      <SETG CYCLOPS-FLAG <>>
		      <FSET ,CYCLOPS ,FIGHTBIT>
		      <COND (<L? .COUNT 0>
			     <SETG CYCLOWRATH <- .COUNT>>)
			    (T
			     <SETG CYCLOWRATH .COUNT>)>)>)
	      (<VERB? EXAMINE>
	       <TELL
"Der hungrige Zyklop steht am Fu%s der Treppe." CR>)
	      (<AND <VERB? GIVE> <EQUAL? ,PRSI ,CYCLOPS>>
	       <COND (<EQUAL? ,PRSO ,LUNCH>
		      <COND (<NOT <L? .COUNT 0>>
			     <REMOVE-CAREFULLY ,LUNCH>
			     <TELL
"Der Zyklop sagt: %>Ei, ei. Ich liebe scharfe Pepperoni! Aber, oooh, ich k%onnte erst mal was zu Trinken brauchen. Vielleicht k%onnte ich das Blut von 'diesem Ding' trinken%<. Aus dem listigen Aufleuchten seiner Augen kannst du schlie%sen, da%s du gemeint bist." CR>
			     <SETG CYCLOWRATH <MIN -1 <- .COUNT>>>)>
		      <ENABLE <QUEUE I-CYCLOPS -1>>)
		     (<OR <EQUAL? ,PRSO ,WATER>
			  <AND <EQUAL? ,PRSO ,BOTTLE>
			       <IN? ,WATER ,BOTTLE>>>
		      <COND (<L? .COUNT 0>
			     <REMOVE-CAREFULLY ,WATER>
			     <MOVE ,BOTTLE ,HERE>
			     <FSET ,BOTTLE ,OPENBIT>
			     <FCLEAR ,CYCLOPS ,FIGHTBIT>
			     <TELL
"Der Zyklop nimmt die Flasche, pr%uft ihren Inhalt und trinkt das Wasser. Einen Augenblick sp%ater %offnet er seinen Mund zu einem G%ahnen, mit dem er dich beinahe verschluckt, dann schl%aft er fest ein. (Was hast du ihm denn blo%s in das Wasser geschmuggelt?)" CR>
			     <SETG CYCLOPS-FLAG T>)
			    (T
			     <TELL
"Scheinbar ist der Zyklop nicht durstig und lehnt dein gro%sz%ugiges Angebot ab." CR>)>)
		     (<EQUAL? ,PRSO ,GARLIC>
		      <TELL
"Vielleicht ist der Zyklop hungrig, aber auch er kennt seine Grenzen." CR>)
		     (T
		      <TELL
"Der Zyklop ist nicht so dumm, da%s er DAS essen w%urde!" CR>)>)
	      (<VERB? THROW ATTACK MUNG>
	       <ENABLE <QUEUE I-CYCLOPS -1>>
	       <COND (<VERB? MUNG>
		      <TELL
"%>Meinst du, da%s ich so dumm bin, wie mein Vater war?%< sagt er, als er dir ausweicht." CR>)
		     (T
		      <TELL
"Der Zyklop zuckt die Achseln und beachtet deinen armseligen Versuch nicht weiter." CR>
		      <COND (<VERB? THROW>
			     <MOVE ,PRSO ,HERE>)>
		      <RTRUE>)>)
	      (<VERB? TAKE>
	       <TELL
"Es gef%allt dem Zyklopen nicht, da%s du ihn angreifst." CR>)
	      (<VERB? TIE>
	       <TELL
"Du kannst den Zyklopen nicht fesseln, obwohl er gefesselt zu sein scheint." CR>)
	      (<VERB? LISTEN>
	       <TELL
"Du kannst seinen Magen knurren h%oren." CR>)>>

<ROUTINE I-CYCLOPS ()
	 <COND (<OR ,CYCLOPS-FLAG ,DEAD> <RTRUE>)
	       (<NOT <EQUAL? ,HERE ,CYCLOPS-ROOM>>
		<DISABLE <INT I-CYCLOPS>>)
	       (T
		<COND (<G? <ABS ,CYCLOWRATH> 5>
		       <DISABLE <INT I-CYCLOPS>>
		       <JIGS-UP
"Der Zyklop, der deiner listigen Spielchen %uberdr%ussig ist, zerquetscht dich zwischen seinen Fingern. W%ahrend ihm das Wasser im Mund zusammenl%auft, sagt er: %>Das schmeckt wie bei Muttern. Mmmh.%<|
|
Es ist angenehm, gesch%atzt zu werden.">)
		      (T
		       <COND (<L? ,CYCLOWRATH 0>
			      <SETG CYCLOWRATH <- ,CYCLOWRATH 1>>)
			     (T
			      <SETG CYCLOWRATH <+ ,CYCLOWRATH 1>>)>
		       <COND (<NOT ,CYCLOPS-FLAG>
			      <TELL <NTH ,CYCLOMAD <- <ABS ,CYCLOWRATH> 1>>
				    CR>)>)>)>>

<ROUTINE CYCLOPS-ROOM-FCN (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <TELL
"Dieser Raum hat einen Ausgang nach Nordwesten, und eine Treppe f%uhrt
nach oben." CR>
	       <COND (<AND ,CYCLOPS-FLAG <NOT ,MAGIC-FLAG>>
		      <TELL
"Der Zyklop schl%aft selig am Fu%se der Treppe." CR>)
		     (,MAGIC-FLAG
		      <TELL
"Die Ostwand, die fr%uher ganz war, zeigt jetzt eine zyklopenf%ormige %Offnung." CR>)
		     (<0? ,CYCLOWRATH>
		      <TELL
"Ein Zyklop, der aussieht, als w%are er bereit, G%aule zu verschlingen (viel eher als nur Abenteurer), blockiert die Treppe. Von seinem Gesundheitszustand und den Blutspuren an den W%anden, kannst du schlie%sen, da%s er nicht sehr freundlich ist, obwohle er Menschen liebt." CR>)
		     (<G? ,CYCLOWRATH 0>
		      <TELL
"Der Zyklop steht in der Ecke und beobachtet dich scharf. Ich glaube nicht, da%s er dich mag. Er sieht sogar f%ur einen Zyklopen ausgesprochen hungrig aus." CR>)
		     (<L? ,CYCLOWRATH 0>
		      <TELL
"Der Zyklop scheint, nachdem er die scharfen Pepperoni gefressen hat, nach Atem zu ringen. Seine flammenrote Zunge h%angt aus seinem menschengro%sen Maul." CR>)>)
	      (<EQUAL? .RARG ,M-ENTER>
	       <OR <0? ,CYCLOWRATH> <ENABLE <INT I-CYCLOPS>>>)>>

<GLOBAL CYCLOMAD
	<TABLE (PURE)
"Der Zyklop scheint irgendwie ver%argert."
"Der Zyklop scheint immer %argerlicher zu werden."
"Der Zyklop wandert durch das Zimmer, als ob er nach etwas sucht."
"Der Zyklop hat nach Salz und Pfeffer gesucht. Es besteht kein Zweifel, da%s er sich seine bevorstehende Mahlzeit damit w%urzen will."
"Der Zyklop kommt dir auf eine sehr unangenehme Weise n%aher und n%aher."
"F%ur dich bestehen hier zwei M%oglichkeiten: 1. Abhauen. 2. Zur Mahlzeit werden.">>

"SUBTITLE LOUD LOUD LOUD"

<GLOBAL LOUD-FLAG <>>

<ROUTINE LOUD-ROOM-FCN (RARG "AUX" WRD)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Dies ist ein riesiges Zimmer, in dem man die Decke nicht von unten erkennen kann. Hier ist ein enger Durchgang von Osten nach Westen und eine Steintreppe f%uhrt nach oben.">
		<COND (<OR ,LOUD-FLAG
			   <AND <NOT ,GATES-OPEN> ,LOW-TIDE>>
		       <TELL " Der Raum ist in seiner Stille unheimlich.">)
		      (T
		       <TELL " Der Raum ist mit ohrenbet%aubendem L%arm gef%ullt. Das Get%ose scheint, von allen W%anden widerzuhallen. Es ist unm%oglich, hier auch nur zu denken.">)>
		<CRLF>)
	       (<AND <EQUAL? .RARG ,M-END> ,GATES-OPEN <NOT ,LOW-TIDE>>
		<TELL
"Es ist unertr%aglich laut hier. Eine ohrenbet%aubendes Gebr%ull kommt von allen Seiten auf dich zu. Dein Kopf dr%ohnt ununterbrochen. Mit gr%o%ster Anstrengung verl%a%st du den Raum." CR CR>
		<GOTO <PICK-ONE ,LOUD-RUNS>>
		<RFALSE>)		
	       (<EQUAL? .RARG ,M-ENTER>
		<COND (<OR ,LOUD-FLAG
			   <AND <NOT ,GATES-OPEN> ,LOW-TIDE>>
		       <RFALSE>)
		      (<AND ,GATES-OPEN <NOT ,LOW-TIDE>>
		       <RFALSE>)
		      (T
		       <V-FIRST-LOOK>
		       <COND (,P-CONT
			      <TELL
"Deine anderen Befehle sind in dem Gebr%ull verloren gegangen." CR>
			      <SETG P-CONT <>>)>
		       <REPEAT ()
			       <COND (<NOT ,SUPER-BRIEF> <CRLF>)>
			       <TELL ">">
			       <PUTB ,P-INBUF 1 0>
			       <READ ,P-INBUF ,P-LEXV>
			       <COND (<0? <GETB ,P-LEXV ,P-LEXWORDS>>
			              <TELL "Bitte?" CR>
				      <AGAIN>)>
			       <SET WRD <GET ,P-LEXV 1>>
			       <COND (<EQUAL? .WRD ,W?LAUF ,W?GEH ,W?REN
					           ,W?LAUFE ,W?GEHE ,W?RENE>
				      <SET WRD <GET ,P-LEXV 3>>)
				     (<EQUAL? .WRD ,W?SAG>
				      <SET WRD <GET ,P-LEXV 5>>)>
			       <COND (<EQUAL? .WRD ,W?SAVE>
				      <V-SAVE>)
				     (<EQUAL? .WRD ,W?WIEDERHERSTELLUNG>
				      <V-RESTORE>)
				     (<EQUAL? .WRD ,W?AUFHOEREN ,W?AUFH\%OREN>
				      <V-QUIT>)
				     (<EQUAL? .WRD ,W?W ,W?WEST ,W?WESTEN>
				      <RETURN <GOTO ,ROUND-ROOM>>)
				     (<EQUAL? .WRD ,W?O ,W?OSTEN ,W?OST>
				      <RETURN <GOTO ,DAMP-CAVE>>)
				     (<EQUAL? .WRD ,W?RAUF ,W?RA>
				      <RETURN <GOTO ,DEEP-CANYON>>)
				     (<EQUAL? .WRD ,W?ECHO>
				      <SETG LOUD-FLAG T>
				      <FCLEAR ,BAR ,SACREDBIT>
				      <TELL
"Die Akustik in dem Raum %andert sich ein bi%schen." CR>
				      <COND (<NOT ,SUPER-BRIEF> <CRLF>)>
				      <RETURN>)
				     ;(,DEAD <CRLF>)
				     (T
				      <V-ECHO>)>>)>)>>

<ROUTINE DEEP-CANYON-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist am S%udrand einer tiefen Schlucht. Durchg%ange f%uhren nach Osten, Nordwesten und S%udwesten. Eine Treppe f%uhrt nach unten."> 
		<COND (<AND ,GATES-OPEN <NOT ,LOW-TIDE>>
		       <TELL
" Du kannst ein lautes Get%ose, wie das Brausen von Wasser von unten h%oren.">)
		      (<AND <NOT ,GATES-OPEN> ,LOW-TIDE>
		       <CRLF>
		       <RTRUE>)
		      (T
		       <TELL
"Du kannst von unten herauf das Rauschen von Wasser h%oren.">)>
		<CRLF>)>>


<GLOBAL EGG-SOLVE <>>


<GLOBAL THIEF-HERE <>>

;"I-THIEF moved to DEMONS"

"SUBTITLE THINGS THIEF MIGHT DO"

"INTERACTION WITH ADVENTURER -- RETURNS T IF THIEF FINISHED."

<ROUTINE THIEF-VS-ADVENTURER (HERE? "AUX" ROBBED? (WINNER-ROBBED? <>))
  <COND (<AND <NOT ,DEAD> <EQUAL? ,HERE ,TREASURE-ROOM>>)
        (<NOT ,THIEF-HERE>
         <COND (<AND <NOT ,DEAD> <NOT .HERE?> <PROB 30>>
	        <COND (<IN? ,STILETTO ,THIEF>
		       <FCLEAR ,THIEF ,INVISIBLE>
		       <TELL
"Jemand, der einen gro%sen Sack tr%agt, lehnt hier gegen eine Wand.
Er spricht kein Wort, aber es besteht kein Zweifel, da%s er sich nur %uber seine eigene Leiche von dem Sack trennen wird." CR>
		       <SETG THIEF-HERE T>
		       <RTRUE>)
		      ;(<IN? ,STILETTO ,WINNER>
		       <MOVE ,STILETTO ,THIEF>
		       <FSET ,STILETTO ,NDESCBIT>
		       <FCLEAR ,THIEF ,INVISIBLE>
		       <TELL
"You feel a light finger-touch, and turning, notice a grinning figure
holding a large bag in one hand and a stiletto in the other.">
		       <SETG THIEF-HERE T>
		       <RTRUE>)>)
	       (<AND .HERE?
		     <FSET? ,THIEF ,FIGHTBIT>
		     <NOT <WINNING? ,THIEF>>>
		<TELL
"Dein Gegner, der entscheidet, da%s Bescheidenheit auch eine Zier ist, entscheidet diesen kleinen Zwischenfall abzubrechen. Mit einem besch%amten Kopfnicken tritt er zur%uck ins Dunkel und verschwindet." CR>
		<FSET ,THIEF ,INVISIBLE>
		<FCLEAR ,THIEF ,FIGHTBIT>
		<RECOVER-STILETTO>
		<RTRUE>)
	       (<AND .HERE? <FSET? ,THIEF ,FIGHTBIT> <PROB 90>>
		<RFALSE>)
	       (<AND .HERE? <PROB 30>>
	        <TELL
"Der, der den gro%sen Sack tr%agt, ist gerade abgehauen. Er hatte die Nase voll. Gott sei Dank hat er nichts mitgenommen." CR>
		<FSET ,THIEF ,INVISIBLE>
		<RECOVER-STILETTO>
	        <RTRUE>)
	       (<PROB 70> <RFALSE>)
	       (<NOT ,DEAD>
		<COND (<ROB ,HERE ,THIEF 100>
		       <SET ROBBED? ,HERE>)
		      (<ROB ,WINNER ,THIEF>
		       <SET ROBBED? ,PLAYER>)>
		<SETG THIEF-HERE T>
	        <COND (<AND .ROBBED? <NOT .HERE?>>
		       <TELL
"Ein %ubelau%sehender Typ mit einem gro%sen Sack ist gerade durchs Zimmer gelatscht. Auf dem Weg hat er ganz ruhig ein paar Wertgegenst%ande "> 
		       <COND (<EQUAL? .ROBBED? ,HERE>
			      <TELL "aus dem Zimmer">)
			     (ELSE
			      <TELL "aus deinem Besitz">)>
		       <TELL " mitgehen lassen, dabei hat er etwas gemurmelt wie ....%>Diene deinem N%achsten bevor...%<" CR>
		       <STOLE-LIGHT?>)
		      (.HERE?
		       <RECOVER-STILETTO>
		       <COND (.ROBBED?
			      <TELL
"Der Dieb ist gerade abgehauen, nat%urlich trug er immer noch seinen gro%sen Sack. "> 
			      <COND (<EQUAL? .ROBBED? ,PLAYER>
				     <TELL
"Du hast es vielleicht nicht bemerkt, aber er hat dich restlos ausgeraubt.">)
				    (T
				     <TELL
"Du hast vielleicht nicht gemerkt, da%s er die Wertsachen im Zimmer abgestaubt hat.">)>
			      <CRLF>
			      <STOLE-LIGHT?>)
			     (T
			      <TELL
"Der Dieb, der nichts Wertvolles finden konnte, ist ver%argert abgehauen." CR>)>
		       <FSET ,THIEF ,INVISIBLE>
		       <SET HERE? <>>
		       <RTRUE>)
		      (T
		       <TELL "Ein hagerer, hungrigau%sehender Herr latschte hier gerade durch. Er trug einen gro%sen Sack. Als er nichts Wertvolles finden konnte, zog er ver%argert ab." CR>
		       <RTRUE>)>)>)
	(T
	 <COND (.HERE?			;"Here, already announced."
		<COND (<PROB 30>
		       <COND (<ROB ,HERE ,THIEF 100>
			      <SET ROBBED? ,HERE>)
			     (<ROB ,WINNER ,THIEF>
			      <SET ROBBED? ,PLAYER>)>
		       <COND (.ROBBED?
			      <TELL
"Der Dieb ist gerade abgehauen, nat%urlich trug er immer noch seinen gro%sen Sack. ">
			      <COND (<EQUAL? .ROBBED? ,PLAYER>
				     <TELL
"Du hast es vielleicht nicht bemerkt, aber er hat dich restlos ausgeraubt.">)
				    (T
				     <TELL
"Du hast vielleicht nicht gemerkt, da%s er die Wertsachen im Zimmer abgestaubt hat.">)>
			      <CRLF>
			      <STOLE-LIGHT?>)
			     (T
			      <TELL
"Der Dieb, der nichts Wertvolles finden konnte, zog w%utend ab." CR>)>
		       <FSET ,THIEF ,INVISIBLE>
		       <SET HERE? <>>
		       <RECOVER-STILETTO>)>)>)>
       <RFALSE>>

<ROUTINE STOLE-LIGHT? ("AUX" OLD-LIT)
	 <SET OLD-LIT ,LIT>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<AND <NOT ,LIT> .OLD-LIT>
		<TELL "Der Dieb hat dich offensichtlich im Dunkeln gelassen." CR>)>
	 <RTRUE>>

"SNARF STILETTO IF DROPPED IT"

;"RECOVER-STILETTO moved to DEMONS"

"PUT HIS BOOTY IN TREASURE ROOM"

<ROUTINE HACK-TREASURES ("AUX" X)
	 <RECOVER-STILETTO>
	 <FSET ,THIEF ,INVISIBLE>
	 <SET X <FIRST? ,TREASURE-ROOM>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN>)
		       (T <FCLEAR .X ,INVISIBLE>)>
		 <SET X <NEXT? .X>>>>

<ROUTINE DEPOSIT-BOOTY (RM "AUX" X N (FLG <>))
	 <SET X <FIRST? ,THIEF>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN .FLG>)>
		 <SET N <NEXT? .X>>
		 <COND (<EQUAL? .X ,STILETTO ,LARGE-BAG>)
		       (<G? <GETP .X ,P?TVALUE> 0>
			<MOVE .X .RM>
			<SET FLG T>
			<COND (<EQUAL? .X ,EGG>
			       <SETG EGG-SOLVE T>
			       <FSET ,EGG ,OPENBIT>)>)>
		 <SET X .N>>>

"TAKE ALL OF THE VALUABLES SOMEWHERE AND PUT THEM SOMEWHERE ELSE"

"MOVED TO DEMONS"

"ROB MAZE"

<ROUTINE ROB-MAZE (RM "AUX" X N)
	 <SET X <FIRST? .RM>>
	 <REPEAT ()
		 <COND (<NOT .X> <RFALSE>)>
		 <SET N <NEXT? .X>>
		 <COND (<AND <FSET? .X ,TAKEBIT>
			     <NOT <FSET? .X ,INVISIBLE>>
			     <PROB 40>>
			;<TELL
"You hear, off in the distance, someone saying %>My, I wonder what
this fine " DER-NOM .X " is doing here.%<" CR>
			<TELL "Irgendwo in der Ferne h%orst du jemanden sagen %>Meine G%ute, was " DER-NOM .X " hier wohl tut?%<" CR>
			<COND (<PROB 60 80>
			       <MOVE .X ,THIEF>
			       <FSET .X ,TOUCHBIT>
			       <FSET .X ,INVISIBLE>)>
			<RETURN>)>
		 <SET X .N>>>

"STEAL SOME JUNK - moved to DEMONS"

"DROP SOME JUNK - moved to DEMONS"

"ROBBER-FUNCTION -- more prosaic thiefly occupations"

<GLOBAL THIEF-ENGROSSED <>>

<ROUTINE ROBBER-FUNCTION ("OPTIONAL" (MODE <>) "AUX" (FLG <>) X N)
	 <COND (<VERB? TELL>
		<TELL "Der Dieb ist einer von den Starken und Schweigsamen." CR>
		<SETG P-CONT <>>)
	       (<NOT .MODE>
		<COND (<AND <VERB? HELLO>
			    <EQUAL? <GETP ,THIEF ,P?LDESC> ,ROBBER-U-DESC>>
		       <TELL
"Der Dieb, der momentan behindert ist, ist nicht in der Lage, deinen Gru%s mit der ihm angeborenen H%oflichkeit zu erwidern." CR>)
		      (<AND <EQUAL? ,PRSO ,KNIFE>
			    <VERB? THROW>
			    <NOT <FSET? ,THIEF ,FIGHTBIT>>>
		       <MOVE ,PRSO ,HERE>
		       <COND (<PROB 10 0>
			      <TELL
"Du mu%st dem R%auber Angst eingejagt haben, obwohl du ihn nicht getroffen hast. Er flieht">
			      <REMOVE ,LARGE-BAG>
			      <SET X <>>
			      <COND (<IN? ,STILETTO ,THIEF>
				     <REMOVE ,STILETTO>
				     <SET X T>)>
			      <COND (<FIRST? ,THIEF>
				     <MOVE-ALL ,THIEF ,HERE>
				     <TELL
", aber der Inhalt seines Sackes f%allt auf den Boden.">)
				    (T
				     <TELL ".">)>
			      <MOVE ,LARGE-BAG ,THIEF>
			      <COND (.X <MOVE ,STILETTO ,THIEF>)>
			      <CRLF>
			      <FSET ,THIEF ,INVISIBLE>)
			     (T
			      <TELL
"Du hast nicht getroffen. Der Dieb macht keine Anstalten das Messer zu nehmen, obwohl es eine sch%one Zugabe zu der Sammlung in seinem Sack w%are. Er scheint, %uber deinen Versuch ver%argert zu sein." CR>
			      <FSET ,THIEF ,FIGHTBIT>)>)
		      (<AND <VERB? THROW GIVE>
			    ,PRSO
			    <NOT <EQUAL? ,PRSO ,THIEF>>
			    <EQUAL? ,PRSI ,THIEF>>
		       <COND (<L? <GETP ,THIEF ,P?STRENGTH> 0>
			      <PUTP ,THIEF
				    ,P?STRENGTH
				    <- <GETP ,THIEF ,P?STRENGTH>>>
			      <ENABLE <INT I-THIEF>>
			      <RECOVER-STILETTO>
			      <PUTP ,THIEF ,P?LDESC ,ROBBER-C-DESC>
			      <TELL
"Dein Opfer kommt pl%otzlich zu sich." CR>)>
		       <MOVE ,PRSO ,THIEF>
		       <COND ;(<EQUAL? ,PRSO ,STILETTO>
			      <TELL
"The thief takes his stiletto and salutes you with a small nod of
his head." CR>)
			     (<G? <GETP ,PRSO ,P?TVALUE> 0>
			      <SETG THIEF-ENGROSSED T>
			      ;<TELL
"The thief is taken aback by your unexpected generosity, but accepts
the " DER-ACC ,PRSO " and stops to admire its beauty." CR>
			      <TELL 
"Der Dieb ist erstaunt %uber deine Gro%sz%ugigkeit, die er nicht erwartetet
hat, aber er nimmt " DER-ACC ,PRSO " an, und nimmt sich Zeit, seine Sch%onheit zu bewundern." CR>)
			     (T
			      <TELL "Der Dieb steckt " DER-ACC ,PRSO " in seinen Sack und dankt dir h%oflich.">)>)
		      (<VERB? TAKE>
		       <TELL
"Was willst du mit ihm machen, wenn du ihn hast?" CR>)
		      (<VERB? EXAMINE LOOK-INSIDE>
		       <TELL
"Der Dieb ist ein schleimiger Geselle mit Eidechsenaugen, die hin und her %augeln. Mit unmi%sverst%andlicher Arroganz schleppt er einen gro%sen Sack mit sich herum. Au%serdem hat er ein gef%ahrlich au%sehendes Stilett, dessen Spitze bedrohlich gegen dich gerichtet ist. An deiner Stelle w%are ich auf der Hut." CR>)
		      (<VERB? LISTEN>
		       <TELL
"Der Dieb schweigt, denn ihr seid einander ja noch nicht offiziell vorgestellt worden." CR>)>)
	       (<EQUAL? .MODE ,F-BUSY?>
		<COND (<IN? ,STILETTO ,THIEF> <>)
		      (<IN? ,STILETTO <LOC ,THIEF>>
		       <MOVE ,STILETTO ,THIEF>
		       <FSET ,STILETTO ,NDESCBIT>
		       <COND (<IN? ,THIEF ,HERE>
			      <TELL
"Der R%auber, von dieser Wendung der Dinge etwas %uberrascht, holt sich sein Stillett leichtf%u%sig zur%uck." CR>)>
		       T)>)
	       (<EQUAL? .MODE ,F-DEAD>
		<MOVE ,STILETTO ,HERE>
		<FCLEAR ,STILETTO ,NDESCBIT>
		<SET X <DEPOSIT-BOOTY ,HERE>>
		<COND (<EQUAL? ,HERE ,TREASURE-ROOM>
		       <SET X <FIRST? ,HERE>>
		       <REPEAT ()
			       <COND
				(<NOT .X>
				 <TELL "Jetzt kannst du dir den Kelch ohne Gefahr nehmen." CR>
				 <RETURN>)
				(<NOT <EQUAL? .X ,CHALICE ,THIEF ,ADVENTURER>>
				 <FCLEAR .X ,INVISIBLE>
				 <COND (<NOT .FLG>
					<SET FLG T>
					<TELL
"Als der Dieb stirbt, schwindet seine Zauberkraft, und seine Sch%atze werden wieder sichtbar:" CR>)>
				 <TELL " " EIN-NOM-CAP .X>
				 <COND (<AND <FIRST? .X>
					     <SEE-INSIDE? .X>>
					<TELL ", mit ">
					<PRINT-CONTENTS .X>)>
				 <CRLF>)>
			       <SET X <NEXT? .X>>>)
		      (.X
		       <TELL "Seine Beute bleibt zur%uck." CR>)>
		<DISABLE <INT I-THIEF>>)
	       (<EQUAL? .MODE ,F-FIRST?>
		<COND (<AND ,THIEF-HERE
			    <NOT <FSET? ,THIEF ,INVISIBLE>>
			    <PROB 20>>
		       <FSET ,THIEF ,FIGHTBIT>
		       <SETG P-CONT <>>
		       T)>)
	       (<EQUAL? .MODE ,F-UNCONSCIOUS>
		<DISABLE <INT I-THIEF>>
		<FCLEAR ,THIEF ,FIGHTBIT>
		<MOVE ,STILETTO ,HERE>
		<FCLEAR ,STILETTO ,NDESCBIT>
		<PUTP ,THIEF ,P?LDESC ,ROBBER-U-DESC>)
	       (<EQUAL? .MODE ,F-CONSCIOUS>
		<COND (<EQUAL? <LOC ,THIEF> ,HERE>
		       <FSET ,THIEF ,FIGHTBIT>
		       <TELL
"Der R%auber kommt zu sich. F%ur eine Weile t%auscht er weiterhin Bewu%stlosigkeit vor, dann als er die passende Gelegenheit findet, kriecht er weg von dir." CR>)>
		<ENABLE <INT I-THIEF>>
		<PUTP ,THIEF ,P?LDESC ,ROBBER-C-DESC>
		<RECOVER-STILETTO>)>>

<GLOBAL ROBBER-C-DESC
"Da steht ein verd%achtig au%sehender Kerl, der eine T%ute h%alt, gegen die Wand gelehnt. Er ist mit einem Stilett bewaffnet.">

<GLOBAL ROBBER-U-DESC
"Da liegt ein verd%achtig au%sehender Kerl bewu%stlos auf der Erde.">

<ROUTINE LARGE-BAG-F ()
	 <COND (<VERB? TAKE>
		<COND (<EQUAL? <GETP ,THIEF ,P?LDESC> ,ROBBER-U-DESC>
		       <TELL
"Zu deinem Nachteil ist der R%auber auf dem Sack zusammengebrochen. Wenn du jetztversuchtest, den Sack wegzunehmen, w%urdest du ihn wecken." CR>)
		      (T
		       <TELL
"Der Sack wird auch %uber seine Leiche genommen." CR>)>)
	       (<AND <VERB? PUT>
		     <EQUAL? ,PRSI ,LARGE-BAG>>
		<TELL "Das w%are ein toller Trick." CR>)
	       (<VERB? OPEN CLOSE>
		<TELL
"Nahe genug heranzukommen, w%are ein toller Trick." CR>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"Der Sack liegt unter dem Dieb, daher kann man nicht sagen, was darin ist, wenn %uberhaupt was drin ist." CR>)>>

<ROUTINE MOVE-ALL (FROM TO "AUX" X N)
	 <COND (<SET X <FIRST? .FROM>>
		<REPEAT ()
			<COND (<NOT .X> <RETURN>)>
			<SET N <NEXT? .X>>
			<FCLEAR .X ,INVISIBLE>
			<MOVE .X .TO>
			<SET X .N>>)>>

<ROUTINE CHALICE-FCN ()
	 <COND (<VERB? TAKE>
		<COND (<AND <IN? ,PRSO ,TREASURE-ROOM>
			    <IN? ,THIEF ,TREASURE-ROOM>
			    <FSET? ,THIEF ,FIGHTBIT>
			    <NOT <FSET? ,THIEF ,INVISIBLE>>
			    <NOT <EQUAL? <GETP ,THIEF ,P?LDESC>
					 ,ROBBER-U-DESC>>>
		       <TELL
"Du w%urdest von hinten erstochen." CR>)>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI ,CHALICE>>
		<TELL
"Das gelingt dir nicht. Es ist kein guter Kelch, nicht wahr?" CR>)
	       (T <DUMB-CONTAINER>)>>

<ROUTINE TREASURE-ROOM-FCN (RARG "AUX" TL)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <1? <GET <INT I-THIEF> ,C-ENABLED?>>
		     <NOT ,DEAD>>
		<COND (<NOT <IN? ,THIEF ,HERE>>
		       <TELL
"Du h%orst einen Schreckensschrei, als du in das Versteck des R%aubers einbrichst. Als du einen Durchgang benutzt, der dir unbekannt ist,
verteidigt er sich sofort." CR>
		       <MOVE ,THIEF ,HERE>)>
		<FSET ,THIEF ,FIGHTBIT>
		<FCLEAR ,THIEF ,INVISIBLE>
		<THIEF-IN-TREASURE>)>>

<ROUTINE THIEF-IN-TREASURE ("AUX" F N)
	 <SET F <FIRST? ,HERE>>
	 <COND (<AND .F <NEXT? .F>>
		<TELL
"Der Dieb f%uhrt einige mysteri%ose Gesten aus, und die Sch%atze im Zimmer verschwinden." CR CR>)>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (<NOT <EQUAL? .F ,CHALICE ,THIEF>>
			<FSET .F ,INVISIBLE>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE FRONT-DOOR-FCN ()
	 <COND (<VERB? OPEN>
		<TELL "Die T%ur kann nicht ge%offnet werden." CR>)
	       (<VERB? BURN>
		<TELL
		 "Du kannst die T%ur nicht verbrennen." CR>)
	       (<VERB? MUNG>
		<TELL "Du kannst die T%ur nicht besch%adigen." CR>)
	       (<VERB? LOOK-BEHIND>
		<TELL "Sie l%a%st sich nicht %offnen." CR>)>>

"SUBTITLE RANDOM FUNCTIONS"

<ROUTINE BODY-FUNCTION ()
	 <COND (<VERB? TAKE>
		<TELL 
"Eine magische Kraft hindert dich am Mitnehmen der Leichen." CR>)
	       (<VERB? MUNG BURN>
		<JIGS-UP
"Die Stimme des Kerkermeisters dr%ohnt aus dem Dunkel: %>Deine Nichtachtung wird dir dein Leben kosten%<, und er steckt deinen Kopf auf einen spitzen
Stock.">)>>

<ROUTINE BLACK-BOOK ()
	 <COND (<VERB? OPEN>
		<TELL "Das Buch ist schon auf Seite 569 augfgeschlagen." CR>)
	       (<VERB? CLOSE>
		<TELL "Trotz aller Kraftanwendung kannst du das Buch nicht schlie%sen." CR>)
	       (<OR <VERB? TURN>
		    <AND <VERB? READ-PAGE>
			 <EQUAL? ,PRSI ,INTNUM>
			 <NOT <EQUAL? ,P-NUMBER 569>>>>
		;<TELL
"Beside page 569, there is only one other page with any legible printing on
it. Most of it is unreadable, but the subject seems to be the banishment of
evil. Apparently, certain noises, lights, and prayers are efficacious in this
regard." CR>
		<TELL "Au%ser der Seite 569 gibt es nur noch eine Seite mit lesbarem Druck darauf. Fast alles ist unleserlich, aber das Thema scheint die Bannung des B%osen zu sein. Scheinbar sind gewi%se Ger%ausche, Lichter und Gebete in dieser Beziehung von Nutzen.">)
	       (<VERB? BURN>
		<REMOVE-CAREFULLY ,PRSO>
		<JIGS-UP
"Eine donnernde Stimme sagt: %>Falsch gedacht, Schwachkopf!%<, und du bemerkst, da%s du dich in eine Staubma%se verwandelt hast. Wie, kann ich mir einfach nicht vorstellen.">)>>

<ROUTINE PAINTING-FCN ()
	 <COND (<VERB? MUNG>
		<PUTP ,PRSO ,P?TVALUE 0>
		<PUTP ,PRSO ,P?LDESC "Heir ist eine wertlose Leinwand.">
		<TELL
"Gratuliere! Im Gegensatz zu den anderen Verbrechern, die lediglich die Meisterwerke des K%unstlers gestohlen haben, hast du eines zerst%ort." CR>)>>


"SUBTITLE LET THERE BE LIGHT SOURCES"

<GLOBAL LAMP-TABLE
	<TABLE (PURE)
	       100
	       "The lamp appears a bit dimmer."
	       70
	       "The lamp is definitely dimmer now."
	       15   
	       "The lamp is nearly out."
	       0>>
"Die Leuchte scheint ein wenig schw%acher."
"Die Leuchte ist jetzt unbedingt schw%acher."
"Die Leuchte ist fast aus."

<ROUTINE LANTERN ()
	 <COND (<VERB? THROW>
		<TELL
"Die Leuchte liegt am Fu%sboden zerschmettert, und das Licht ist aus." CR>
		<DISABLE <INT I-LANTERN>>
		<REMOVE-CAREFULLY ,LAMP>
		<MOVE ,BROKEN-LAMP ,HERE>)
	       (<VERB? LAMP-ON>
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL 
"Eine ausgebrannte Leuchte l%a%st sich nicht anz%unden." CR>)
		      (T
		       <ENABLE <INT I-LANTERN>>
		       <>)>)
	       (<VERB? LAMP-OFF>
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL "Die Leuchte ist schon ausgebrannt." CR>)
		      (T
		       <DISABLE <INT I-LANTERN>>
		       <>)>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL "Die Leuchte ist ausgebrannt.">)
		      (<FSET? ,LAMP ,ONBIT>
		       <TELL "Die Leuchte ist an.">)
		      (T
		       <TELL "Die Leuchte ist nicht an.">)>
		<CRLF>)>>

<ROUTINE MAILBOX-F ()
	 <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,MAILBOX>>
		<TELL "Er ist fest angebracht." CR>)>>

<GLOBAL MATCH-COUNT 6>

<ROUTINE MATCH-FUNCTION ("AUX" CNT)
	 <COND (<AND <VERB? LAMP-ON BURN> <EQUAL? ,PRSO ,MATCH>>
		<COND (<G? ,MATCH-COUNT 0>
		       <SETG MATCH-COUNT <- ,MATCH-COUNT 1>>)>
		<COND (<NOT <G? ,MATCH-COUNT 0>>
		       <TELL
			"Leider sind dir die Streichh%olzer ausgegangen." CR>)
		      (<EQUAL? ,HERE ,LOWER-SHAFT ,TIMBER-ROOM>
		       <TELL
"Dieser Raum ist zugig, und das Streichholz geht sofort aus." CR>)
		      (T
		       <FSET ,MATCH ,FLAMEBIT>
		       <FSET ,MATCH ,ONBIT>
		       <ENABLE <QUEUE I-MATCH 2>>
		       <TELL "Eines der Streichh%olzer beginnt zu brennen." CR>
		       <COND (<NOT ,LIT>
			      <SETG LIT T>
			      <V-LOOK>)>
		       <RTRUE>)>)
	       (<AND <VERB? LAMP-OFF> <FSET? ,MATCH ,FLAMEBIT>>
		<TELL "Das Streichholz ist aus." CR>
		<FCLEAR ,MATCH ,FLAMEBIT>
		<FCLEAR ,MATCH ,ONBIT>
		<SETG LIT <LIT? ,HERE>>
		<COND (<NOT ,LIT> <TELL "Es ist stockdunkel hier!" CR>)>
		;<QUEUE I-MATCH 0>
		<ENABLE <QUEUE I-MATCH 0>>
		<RTRUE>)
	       (<VERB? COUNT OPEN>
		<TELL "Du hast ">
	        <SET CNT <- ,MATCH-COUNT 1>>
		<COND (<NOT <G? .CNT 0>> <TELL "keine">)
		      (T <TELL N .CNT>)>
		<TELL " Streichh%olzer." CR>
		;<COND (<NOT <1? .CNT>> <TELL "es.">) (T <TELL ".">)>
		;<CRLF>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,MATCH ,ONBIT>
		       <TELL "Das Streichholz brennt.">)
		      (T
		       <TELL
"The matchbook isn't very interesting, except for what's written on it.">)>
		<CRLF>)>>

<ROUTINE I-MATCH ()
	 <TELL "Das Streichholz ist ausgegangen." CR>
	 <FCLEAR ,MATCH ,FLAMEBIT>
	 <FCLEAR ,MATCH ,ONBIT>
	 <SETG LIT <LIT? ,HERE>>
	 <RTRUE>>

<ROUTINE I-LANTERN ("AUX" TICK (TBL <VALUE LAMP-TABLE>))
	 <ENABLE <QUEUE I-LANTERN <SET TICK <GET .TBL 0>>>>
	 <LIGHT-INT ,LAMP .TBL .TICK>
	 <COND (<NOT <0? .TICK>>
		<SETG LAMP-TABLE <REST .TBL 4>>)>>

<ROUTINE I-CANDLES ("AUX" TICK (TBL <VALUE CANDLE-TABLE>))
	 <FSET ,CANDLES ,TOUCHBIT>
	 <ENABLE <QUEUE I-CANDLES <SET TICK <GET .TBL 0>>>>
	 <LIGHT-INT ,CANDLES .TBL .TICK>
	 <COND (<NOT <0? .TICK>>
		<SETG CANDLE-TABLE <REST .TBL 4>>)>>

<ROUTINE LIGHT-INT (OBJ TBL TICK)
	 <COND (<0? .TICK>
		<FCLEAR .OBJ ,ONBIT>
		<FSET .OBJ ,RMUNGBIT>)>
	 <COND (<OR <HELD? .OBJ> <IN? .OBJ ,HERE>>
		<COND (<0? .TICK>
		       <TELL
"Du brauchst mehr Licht, als nur " DER-NOM .OBJ "." CR>)
		      (T
		       <TELL <GET .TBL 1> CR>)>)>>

<ROUTINE MIN (N1 N2)
	 <COND (<L? .N1 .N2> .N1)
	       (T .N2)>>

<ROUTINE CANDLES-FCN ()
	 <COND (<NOT <FSET? ,CANDLES ,TOUCHBIT>>
		<ENABLE <INT I-CANDLES>>)>
	 <COND (<EQUAL? ,CANDLES ,PRSI> <RFALSE>)
	       (T
		<COND (<VERB? LAMP-ON BURN>
		       <COND (<FSET? ,CANDLES ,RMUNGBIT>
			      <TELL
"O je, von den Kerzen ist nicht mehr viel %ubrig. Bestimmt nicht genug zum Brennen." CR>)
			     (<NOT ,PRSI>
			      <COND (<FSET? ,MATCH ,FLAMEBIT>
				     <TELL "(mit dem Streichholz)" CR>
				     <PERFORM ,V?LAMP-ON ,CANDLES ,MATCH>
				     <RTRUE>)
				    (T
				     <TELL
"Du solltest sagen, mit was man sie anzuenden soll." CR>
				     <RFATAL>)>)
			     (<AND <EQUAL? ,PRSI ,MATCH>
				   <FSET? ,MATCH ,ONBIT>>
			      <COND (<FSET? ,CANDLES ,ONBIT>
				     <TELL 
"Die Kerzen sind schon angezuendet." CR>)
				    (T
				     <FSET ,CANDLES ,ONBIT>
				     <TELL "Die Kerzen sind angezuendet." CR>
				     <ENABLE <INT I-CANDLES>>)>)
			     (<EQUAL? ,PRSI ,TORCH>
			      <COND (<FSET? ,CANDLES ,ONBIT>
				     <TELL
"Du bemerkst noch rechtzeitig, da%s die Kerzen schon angezuendet sind." CR>)
				    (T
				     <TELL
"Die Hitze die von der Fackel ausgeht, ist so stark, da%s die Kerzen schmelzen." CR>
				     <REMOVE-CAREFULLY ,CANDLES>)>)
			     (T
			      <TELL
"Du mu%st sie mit etwas anzuenden, das brennt, verstehst du." CR>)>)
		      (<VERB? COUNT>
		       <TELL
"Mal sehen wieviele Dinge in einem Paar sind? Nicht verraten.Ich schaff das schon alleine." CR>)
		      (<VERB? LAMP-OFF>
		       <DISABLE <INT I-CANDLES>>
		       <COND (<FSET? ,CANDLES ,ONBIT>
			      <TELL "Die Flamme ist aus.">
			      <FCLEAR ,CANDLES ,ONBIT>
			      <FSET ,CANDLES ,TOUCHBIT>
			      <SETG LIT <LIT? ,HERE>>
			      <COND (<NOT ,LIT>
				     <TELL 
" Es ist wirklich dunkel hier drin...">)>
			      <CRLF>
			      <RTRUE>)
			     (T <TELL "Die Kerzen sind nicht an." CR>)>)
		      (<AND <VERB? PUT> <FSET? ,PRSI ,BURNBIT>>
		       <TELL "Das w%are ungklug." CR>)
		      (<VERB? EXAMINE>
		       <COND (<FSET? ,CANDLES ,ONBIT>
			      <TELL "Die Kerzen brennen.">)
			     (T <TELL "Die Kerzen sind nicht an.">)>
		       <CRLF>)>)>>

<GLOBAL CANDLE-TABLE
	<TABLE (PURE)
	       20
	       "The candles grow shorter."
	       10
	       "The candles are becoming quite short."
	       5
	       "The candles won't last long now."
	       0>>
"Die Kerzen werden k%urzer."
"Die Kerzen werden sehr kurz."
"Die Kerzen k%onnen nicht mehr lang brennen."

<ROUTINE CAVE2-ROOM (RARG)
  <COND (<EQUAL? .RARG ,M-END>
	 <COND (<AND <IN? ,CANDLES ,WINNER>
		     <PROB 50 80>
		     <FSET? ,CANDLES ,ONBIT>>
		<DISABLE <INT I-CANDLES>>
		<FCLEAR ,CANDLES ,ONBIT>
		<TELL
"Ein Windsto%s bl%ast die Kerzen aus!" CR>
		<COND (<NOT <SETG LIT <LIT? ,HERE>>>
		       <TELL "Jetzt ist es restlos dunkel." CR>)>)>)>>

"SUBTITLE ASSORTED WEAPONS"

<ROUTINE SWORD-FCN ("AUX" G)
	 <COND (<AND <VERB? TAKE> <EQUAL? ,WINNER ,ADVENTURER>>
		<ENABLE <QUEUE I-SWORD -1>>
		<>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? <SET G <GETP ,SWORD ,P?TVALUE>> 1>
		       <TELL
"Dein Schwert leuchtet mit einem schwachen blauen Schimmer." CR>)
		      (<EQUAL? .G 2>
		       <TELL
"Dein Schwert leuchtet jetzt ganz hell." CR>)>)>>

"SUBTITLE COAL MINE"

<ROUTINE BOOM-ROOM (RARG "AUX" (DUMMY? <>) FLAME)
         <COND (<EQUAL? .RARG ,M-END>
		<COND (<AND <EQUAL? .RARG ,M-END>
			    <VERB? LAMP-ON BURN>
			    <EQUAL? ,PRSO ,CANDLES ,TORCH ,MATCH>>
		       <SET DUMMY? T>)>
		<COND (<OR <AND <HELD? ,CANDLES>
				<FSET? ,CANDLES ,ONBIT>>
			   <AND <HELD? ,TORCH>
				<FSET? ,TORCH ,ONBIT>>
			   <AND <HELD? ,MATCH>
				<FSET? ,MATCH ,ONBIT>>>
		       <COND (.DUMMY?
			      <TELL
"Wie traurig f%ur einen ehrgeizigen Abenteurer, da%s er " EIN-ACC ,PRSO " in einem Raum anzuendet, der nach Gas riecht. Gl%ucklicherweise gibt es Gerechtigkeit auf dieser Welt." CR>)
			     (T
			      <TELL
"Ach du lieber Himmel. Es scheint, als ob der Geruch der von diesem Zimmer kommt, Kohlenoxyd ist. Ich h%atte mir zweimal %uberlegt, ob ich hier einen brennenden Gegenstand hineintrage." CR>)>
		       <JIGS-UP "|
      ** Bum, bum, bum **">)>)>> 

<ROUTINE BAT-D ("OPTIONAL" FOO)
	 <COND (<EQUAL? <LOC ,GARLIC> ,WINNER ,HERE>
		<TELL
"In der Ecke des Zimmers h%angt eine gro%se Vampirfledermaus an der Decke, die offensichtlich nicht alle f%unf auf der Latte hat und sich die Nase zuh%alt."
CR>)
	       (T
		<TELL
"Eine gro%se Vampirfledermaus h%angt von der Decke, rauscht auf dich nieder." CR>)>>

<ROUTINE BATS-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist in einem kleinen Zimmer, das nur eine T%ur nach Osten und S%uden
hat." CR>)
	       (<AND <EQUAL? .RARG ,M-ENTER> <NOT ,DEAD>>
		<COND (<NOT <EQUAL? <LOC ,GARLIC> ,WINNER ,HERE>>
		       <V-LOOK>
		       <CRLF>
		       <FLY-ME>)>)>>

<ROUTINE MACHINE-ROOM-FCN (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Dies ist ein gro%ser kalter Raum, dessen einziger Ausgang nach Norden f%uhrt. In einer Ecke steht eine Maschine, die an einen W%aschetrockner erinnert. Vorne ist ein Schalter, der mit EIN beschriftet ist. Der Schalter scheint nicht, f%ur Menschenh%ande gebaut zu sein (au%ser, wenn die Finger 1/2cm mal 1cm w%aren). Vorne an der Maschine ist eine gro%se Klappe, die ">
		<COND (<FSET? ,MACHINE ,OPENBIT>
		       <TELL "ge%offnet">)
		      (T <TELL  "geschlossen">)>
		<TELL " ist." CR>)>>
 
<ROUTINE MACHINE-F ()
	 <COND (<AND <VERB? TAKE> <EQUAL? ,PRSO ,MACHINE>>
		<TELL "Das ist viel zu gro%s zum Tragen." CR>)
	       (<VERB? OPEN>
	        <COND (<FSET? ,MACHINE ,OPENBIT>
		       <TELL <PICK-ONE ,DUMMY> CR>)
		      (<FIRST? ,MACHINE>
		       <TELL "Der Deckel %offnet sich, bringt "> 
		       <PRINT-CONTENTS ,MACHINE>
		       <TELL " zum Vorschein." CR>
		       <FSET ,MACHINE ,OPENBIT>)
		      (T
		       <TELL "Der Deckel %offnet sich." CR>
		       <FSET ,MACHINE ,OPENBIT>)>)
	       (<VERB? CLOSE>
	        <COND (<FSET? ,MACHINE ,OPENBIT>
		       <TELL "Der Deckel schlie%st sich." CR>
		       <FCLEAR ,MACHINE ,OPENBIT>
		       T)
		      (T
		       <TELL <PICK-ONE ,DUMMY> CR>)>)
	       (<VERB? LAMP-ON>
		<COND (<NOT ,PRSI>
		       <TELL
"Es ist nicht klar, wie man sie mit den nackten H%anden aufmacht." CR>)
		      (T
		       <PERFORM ,V?TURN ,MACHINE-SWITCH ,PRSI>
		       <RTRUE>)>)>>

<ROUTINE MSWITCH-FUNCTION ("AUX" O)
	 <COND (<VERB? TURN>
		<COND (<EQUAL? ,PRSI ,SCREWDRIVER>
		       <COND (<FSET? ,MACHINE ,OPENBIT>
			      <TELL
"Die Maschine scheint sich nicht r%uhren zu wollen." CR>)
			     (T <TELL
"Die Maschine wird lebendig (im %ubertragenen Sinne), indem sich faszinierende Lichter und haarstr%aubende Ger%ausche ergeben. Nach ein paar Sekunden h%ort der Zauber auf." CR>
			      <COND (<IN? ,COAL ,MACHINE>
				     <REMOVE-CAREFULLY ,COAL>
				     <MOVE ,DIAMOND ,MACHINE>)
				    (T
				     <REPEAT ()
					     <COND (<SET O <FIRST? ,MACHINE>>
						    <REMOVE-CAREFULLY .O>)
						   (T <RETURN>)>>
				     <MOVE ,GUNK ,MACHINE>)>)>)
		      (T
		       ;<TELL 
"It seems that " EIN-NOM ,PRSI " won't do." CR>
		       <TELL 
"Es scheint, da%s " EIN-NOM ,PRSI " nicht ausreicht.">)>)>>

<ROUTINE GUNK-FUNCTION ()
	 <REMOVE-CAREFULLY ,GUNK>
	 <TELL
"Die Schlacke war por%os und zerkr%umelt bei der Ber%uhrung zu Staub." CR>>

<ROUTINE NO-OBJS (RARG "AUX" F)
	 <COND (<EQUAL? .RARG ,M-BEG>
		<SET F <FIRST? ,WINNER>>
		<SETG EMPTY-HANDED T>
		<REPEAT ()
			<COND (<NOT .F> <RETURN>)
			      (<G? <WEIGHT .F> 4>
			       <SETG EMPTY-HANDED <>>
			       <RETURN>)>
			<SET F <NEXT? .F>>>
		<COND (<AND <EQUAL? ,HERE ,LOWER-SHAFT> ,LIT>
		       <SCORE-UPD ,LIGHT-SHAFT>
		       <SETG LIGHT-SHAFT 0>)>
		<RFALSE>)>>

<ROUTINE SOUTH-TEMPLE-FCN (RARG)
	 <COND (<EQUAL? .RARG ,M-BEG>
		<SETG COFFIN-CURE <NOT <IN? ,COFFIN ,WINNER>>>
		<RFALSE>)>>

<GLOBAL LIGHT-SHAFT 13>
<GDECL (LIGHT-SHAFT) FIX>


<ROUTINE WHITE-CLIFFS-FUNCTION (RARG)
	 <COND (<EQUAL? .RARG ,M-END>
		<COND (<IN? ,INFLATED-BOAT ,WINNER>
		       <SETG DEFLATE <>>)
	       	      (T
		       <SETG DEFLATE T>)>)>>

<ROUTINE SCEPTRE-FUNCTION ()
	 <COND (<VERB? WAVE RAISE>
		<COND (<OR <EQUAL? ,HERE ,ARAGAIN-FALLS>
			   <EQUAL? ,HERE ,END-OF-RAINBOW>>
		       <COND (<NOT ,RAINBOW-FLAG>
			      <FCLEAR ,POT-OF-GOLD ,INVISIBLE>
			      <TELL
"Pl%otzlich wird der Regenbogen zu einer Art Stra%se und erscheint begehbar
(Treppen mit Gel%ander erwecken diesen Eindruck)." CR>
			      <COND (<AND <EQUAL? ,HERE ,END-OF-RAINBOW>
					  <IN? ,POT-OF-GOLD ,END-OF-RAINBOW>>
				     <TELL
"Ein glitzernder goldener Topf erscheint am Ende des Regenbogens." CR>)>
			      <SETG RAINBOW-FLAG T>)
			     (T
			      <ROB ,ON-RAINBOW ,WALL>
			      <TELL
"Der Regenbogen scheint seine Ungew%ohnlichkeit verloren zu haben." CR>
			      <SETG RAINBOW-FLAG <>>
			      <RTRUE>)>)
		      (<EQUAL? ,HERE ,ON-RAINBOW>
		       <SETG RAINBOW-FLAG <>>
		       <JIGS-UP
"Die Tragf%ahigkeit des Regenbogens l%a%st sehr zu w%unschen %ubrig, was dich schwebend in der Luft h%angen l%a%st. Du bist nur von Wasserdampf gest%utzt. Auf Wiedersehen.">)
		      (T
		       <TELL
"Eine verwirrende Farbenpracht strahlt kurz von dem Zepter aus." CR>)>)>>

<ROUTINE FALLS-ROOM (RARG)
    <COND (<EQUAL? .RARG ,M-LOOK>
	   <TELL
"Du bist oben auf den Wiedermal F%allen. Ein gigantischer Wasserfall mit einem Abgrund von 15 Metern. Der einzige Pfad hier ist am Nordende." CR>
	   <COND (,RAINBOW-FLAG
		  <TELL
"Ein voller Regenbogen steht %uber den F%allen.">)
		 (T
		  <TELL
"Ein wundervoller Regenbogen kann %uber den F%allen und nach Westen gesehen werden.">)>
	   <CRLF>)>>

<ROUTINE RAINBOW-FCN ()
	 <COND (<VERB? CROSS THROUGH>
		<COND (<EQUAL? ,HERE ,CANYON-VIEW>
		       <TELL "Von hier aus?!?" CR>
		       <RTRUE>)>
		<COND (,RAINBOW-FLAG
		       <COND (<EQUAL? ,HERE ,ARAGAIN-FALLS>
			      <GOTO ,END-OF-RAINBOW>)
			     (<EQUAL? ,HERE ,END-OF-RAINBOW>
			      <GOTO ,ARAGAIN-FALLS>)
			     (T
			      <TELL "Du mu%st sagen, in welcher Richtung..." CR>)>)
		      (T
		       <TELL "Kannst du auf Wasserd%ampfen wandeln?"
			     CR>)>)
	       (<VERB? LOOK-UNDER>
		<TELL "Der Gletsch flie%st unter dem Regenbogen." CR>)>>

<ROUTINE DBOAT-FUNCTION ("AUX")
	 <COND (<AND <VERB? PUT PUT-ON>
		     <EQUAL? ,PRSO ,PUTTY>>
		<FIX-BOAT>)
	       (<VERB? INFLATE FILL>
		<TELL
"Unm%oglich. Irgends%o ein Schwachkopf hat es durchl%ochert." CR>)
	       (<VERB? PLUG>
		<COND (<EQUAL? ,PRSI ,PUTTY>
		       <FIX-BOAT>)
		      (T <WITH-TELL ,PRSI>)>)>>

<ROUTINE FIX-BOAT ()
	 <TELL "Gro%sartig. Das Boot ist repariert." CR>
	 <MOVE ,INFLATABLE-BOAT <LOC ,PUNCTURED-BOAT>>
	 <REMOVE-CAREFULLY ,PUNCTURED-BOAT>>

<ROUTINE RIVER-FUNCTION ()
	 <COND (<VERB? PUT>
		<COND (<EQUAL? ,PRSI ,RIVER>
		       <COND (<EQUAL? ,PRSO ,ME>
			      <JIGS-UP
"Du planschst f%ur eine Weile wild im Wasser rum, um dich gegen die Str%omung zu halten, dann ertrinkst du.">)
			     (<EQUAL? ,PRSO ,INFLATED-BOAT>
			      <TELL
"Du solltest in das Boot steigen, dann absto%sen." CR>)
			     (<FSET? ,PRSO ,BURNBIT>
			      <REMOVE-CAREFULLY ,PRSO>
			      <TELL
DER-NOM-CAP ,PRSO " schwimmt f%ur einen Moment, dann sinkt " PRONOUN-NOM ,PRSO 
"." CR>)
			     (T
			      <REMOVE-CAREFULLY ,PRSO>
			      <TELL
DER-NOM-CAP ,PRSO " platscht ins Wasser, und gluck-gluck weg ist "
PRONOUN-NOM ,PRSO "." CR>)>)>)
	       (<VERB? LEAP THROUGH>
		<TELL
"Eine Orientierung vor dem Sprung zeigt, da%s der Flu%s breit und gef%ahrlich ist, rei%sende Schnellen und halbverdeckte Felsten hat. Du entscheidest, vom Schwimmen abzusehen." CR>)>>

<GLOBAL RIVER-SPEEDS
	<LTABLE (PURE) RIVER-1 4 RIVER-2 4 RIVER-3 3 RIVER-4 2 RIVER-5 1>>

<GLOBAL RIVER-NEXT
	<LTABLE (PURE) RIVER-1 RIVER-2 RIVER-3 RIVER-4 RIVER-5>>

<GLOBAL RIVER-LAUNCH
	<LTABLE (PURE) DAM-BASE RIVER-1
		WHITE-CLIFFS-NORTH RIVER-3
		WHITE-CLIFFS-SOUTH RIVER-4
		SHORE RIVER-5
		SANDY-BEACH RIVER-4
		RESERVOIR-SOUTH RESERVOIR
		RESERVOIR-NORTH RESERVOIR
		STREAM-VIEW IN-STREAM>>

<ROUTINE I-RIVER ("AUX" RM)
	 <COND (<AND <NOT <EQUAL? ,HERE ,RIVER-1 ,RIVER-2 ,RIVER-3>>
		     <NOT <EQUAL? ,HERE ,RIVER-4 ,RIVER-5>>>
		<DISABLE <INT I-RIVER>>)
	       (<SET RM <LKP ,HERE ,RIVER-NEXT>>
		<TELL "Die Str%omung tr%agt dich flu%sabw%arts." CR CR>
		<GOTO .RM>
		<ENABLE <QUEUE I-RIVER <LKP ,HERE ,RIVER-SPEEDS>>>)
	       (T
		<JIGS-UP
"Leider gew%ahrt das Zauberboot keinen Schutz gegen Steine und Felsbl%ocke,
auf die man unten am Wasserfall trifft. Auch gegen diesen nicht.">)>>

<ROUTINE RBOAT-FUNCTION ("OPTIONAL" (RARG <>) "AUX" TMP)
    <COND (<EQUAL? .RARG ,M-ENTER ,M-END ,M-LOOK> <>)	
	  (<EQUAL? .RARG ,M-BEG>
	   <COND (<VERB? WALK>
		  <COND (<EQUAL? ,PRSO ,P?LANDEN ,P?OST ,P?WEST>
			 <RFALSE>)
			(<AND <EQUAL? ,HERE ,RESERVOIR>
			      <EQUAL? ,PRSO ,P?NORD ,P?SUED>>
			 <RFALSE>)
			(<AND <EQUAL? ,HERE ,IN-STREAM>
			      <EQUAL? ,PRSO ,P?SUED>>
			 <RFALSE>)
			(T
			 <TELL
"Lies die Anweisungen f%ur das Boot." CR>
			 <RTRUE>)>)
		 (<VERB? LAUNCH>
		  <COND (<OR <EQUAL? ,HERE ,RIVER-1 ,RIVER-2 ,RIVER-3>
			     <EQUAL? ,HERE ,RIVER-4 ,RESERVOIR ,IN-STREAM>>
			 <TELL "Du bist schon im "> 
			 <COND (<EQUAL? ,HERE ,RESERVOIR>
				<TELL "Reservoir">)
			       (<EQUAL? ,HERE ,IN-STREAM>
				<TELL "Strom">)
			       (T <TELL "Flu%s">)>
			 <TELL ", oder hast du das vergessen?" CR>)
			(<EQUAL? <SET TMP <GO-NEXT ,RIVER-LAUNCH>> 1>
			 <ENABLE <QUEUE I-RIVER <LKP ,HERE ,RIVER-SPEEDS>>>
			 <RTRUE>)
			(<NOT <EQUAL? .TMP 2>>
			 <TELL 
"Hier kannst du das Boot nicht ins Wasser lassen." CR>
			 <RTRUE>)
			(T <RTRUE>)>)
		 (<OR <AND <VERB? DROP>
			   <FSET? ,PRSO ,WEAPONBIT>>
		      <AND <VERB? PUT>
			   <FSET? ,PRSO ,WEAPONBIT>
			   <EQUAL? ,PRSI ,INFLATED-BOAT>>
		      <AND <VERB? ATTACK MUNG>
			   <FSET? ,PRSI ,WEAPONBIT>>>
		  <REMOVE-CAREFULLY ,INFLATED-BOAT>
		  <MOVE ,PUNCTURED-BOAT ,HERE>
		  <ROB ,INFLATED-BOAT ,HERE>
		  <MOVE ,WINNER ,HERE>
		  <SETG OHERE <>>
		  <TELL
"Es scheint, als ob ">
		  <COND (<VERB? DROP PUT> <TELL DER-NOM ,PRSO>)
			(T <TELL DER-NOM ,PRSI>)>
		  <TELL " dem Boot nicht bekommen ist, wie man von dem lauten hissenden Ger%ausch, das ihm entweicht, schlie%sen kann. Mit einem armseligen letzten Puff, geht die Luft aus dem Boot und du erleidest Schiffbruch." CR>
		  <COND (<FSET? ,HERE ,NONLANDBIT>
			 <CRLF>
			 <COND (<==? ,HERE ,RESERVOIR ,IN-STREAM>
				<JIGS-UP
"Ein weiteres armseliges Ausblasen, diesmal kommt es aus dir
best%atigt dein Ertrinken.">)
			       (T
				<JIGS-UP
"Mit anderen Worten, gegen die t%odlichen Str%omungen des Gletsch k%ampfen. Du h%alst dich eine Weile %uber Wasser, aber dann wirst du %uber einen Wasserfall in gef%ahrliche Felsen gezogen. Auuuuu!">)>)>
		  <RTRUE>)
		 (<VERB? LAUNCH>
	  	   <TELL "Du bist nicht im Boot!" CR>)>)
	  (<VERB? BOARD>
	   <COND (<OR <IN? ,SCEPTRE ,WINNER>
		      <IN? ,KNIFE ,WINNER>
		      <IN? ,SWORD ,WINNER>
		      <IN? ,RUSTY-KNIFE ,WINNER>
		      <IN? ,AXE ,WINNER>
		      <IN? ,STILETTO ,WINNER>>
		  <TELL
"Ei, ei! Etwas Scharfes scheint weggerutscht zu sein, und hat das Boot durchl%ochert. Die Luft entweicht unter Zischen, Murmeln und Fluchen aus dem Boot." CR>
		  <REMOVE-CAREFULLY ,INFLATED-BOAT>
		  <MOVE ,PUNCTURED-BOAT ,HERE>
		  <THIS-IS-IT ,PUNCTURED-BOAT>
		  T)>)
	  (<VERB? INFLATE FILL>
	   <TELL "Wenn man es weiter aufpumpt, w%urde es wahrscheinlich platzen." CR>)
	  (<VERB? DEFLATE>
	   <COND (<EQUAL? <LOC ,WINNER> ,INFLATED-BOAT>
		  <TELL
"Du kannst die Luft nicht aus dem Boot lassen, w%ahrend du drin sitzt." CR>)
		 (<NOT <IN? ,INFLATED-BOAT ,HERE>>
		  <TELL
"Das Boot mu%s an Land sein, um die Luft rauszulassen." CR>)
		 (T <TELL
"Die Luft kommt aus dem Boot." CR>
		  <SETG DEFLATE T>
		  <REMOVE-CAREFULLY ,INFLATED-BOAT>
		  <MOVE ,INFLATABLE-BOAT ,HERE>
		  <THIS-IS-IT ,INFLATABLE-BOAT>)>)>>

;<ROUTINE BREATHE ()
	 <PERFORM ,V?INFLATE ,PRSO ,LUNGS>
	 <RTRUE>>

<ROUTINE IBOAT-FUNCTION ()
	 <COND (<VERB? INFLATE FILL>
		<COND (<NOT <IN? ,INFLATABLE-BOAT ,HERE>>
		       <TELL
"Das Boot mu%s an Land sein, um aufgeblasen zu werden." CR>)
		      (<EQUAL? ,PRSI ,PUMP>
		       <TELL
"Das Boot nimmt Luft auf und erscheint seet%uchtig." CR>
		       <COND (<NOT <FSET? ,BOAT-LABEL ,TOUCHBIT>>
			      <TELL
"Ein beiges Schildchen liegt im Boot." CR>)>
		       <SETG DEFLATE <>>
		       <REMOVE-CAREFULLY ,INFLATABLE-BOAT>
		       <MOVE ,INFLATED-BOAT ,HERE>
		       <THIS-IS-IT ,INFLATED-BOAT>)
		      (<EQUAL? ,PRSI ,LUNGS>
		       <TELL
"Deine Lunge schafft es nicht, das Boot aufzublasen." CR>)
		      (T
		       <TELL
"Mit " EIN-DAT ,PRSI "? Du beliebst zu scherzen?!" CR>)>)>>

<GLOBAL BUOY-FLAG T>

<ROUTINE RIVR4-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-END>
		<COND (<AND <IN? ,BUOY ,WINNER> ,BUOY-FLAG>
	      	       <TELL
"Die Boje f%uhlt sich irgendwie komisch an." CR>
		       <SETG BUOY-FLAG <>>)>)>>

<GLOBAL BEACH-DIG -1>

<GDECL (BEACH-DIG) FIX>

<ROUTINE SAND-FUNCTION ()
	 <COND (<AND <VERB? DIG> <==? ,PRSI ,SHOVEL>>
		<SETG BEACH-DIG <+ 1 ,BEACH-DIG>>
		<COND (<G? ,BEACH-DIG 3>
		       <SETG BEACH-DIG -1>
		       <AND <IN? ,SCARAB ,HERE> <FSET ,SCARAB ,INVISIBLE>>
		       <JIGS-UP "Das Loch bricht zusammen, du erstickst.">)
		      (<EQUAL? ,BEACH-DIG 3>
		       <COND (<FSET? ,SCARAB ,INVISIBLE>
			      <TELL
"Du siehst hier einen Skarab%aus im Sand." CR>
			      <THIS-IS-IT ,SCARAB>
			      <FCLEAR ,SCARAB ,INVISIBLE>)>)
		      (T
		       <TELL <GET ,BDIGS ,BEACH-DIG> CR>)>)>>

<GLOBAL BDIGS
	<TABLE (PURE) "Du scheinst hier ein Loch zu graben."
	       "Das Loch wird immer tiefer, aber sonst nichts."
	       "Du bist auf allen Seiten von Sand umgeben.">>


"SUBTITLE TOITY POIPLE BOIDS A CHOIPIN' AN' A BOIPIN' ... "

<ROUTINE TREE-ROOM (RARG "AUX" F)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Du bist ungef%ahr 3 Meter %uber dem Boden umgeben von gro%sen %Asten. Du kannst den n%achsten Zweig %uber dir unm%oglich erreichen." CR>
		<COND (<AND <SET F <FIRST? ,PATH>>
			    <NEXT? .F>>
		       <TELL "Unter dir auf der Erde siehst du:">
		       <PRINT-CONTENTS ,PATH>
		       <TELL "." CR>)>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? CLIMB-DOWN> <EQUAL? ,PRSO ,TREE ,ROOMS>>
		       <DO-WALK ,P?RUNTER>)
		      (<AND <VERB? CLIMB-UP CLIMB-FOO>
			    <EQUAL? ,PRSO ,TREE>>
		       <DO-WALK ,P?RAUF>)
		      (<VERB? DROP>
		       <COND (<NOT <IDROP>> <RTRUE>)
			     (<AND <EQUAL? ,PRSO ,NEST> <IN? ,EGG ,NEST>>
			      <TELL
"Das Nest f%allt auf die Erde, und das Ei f%allt heraus. Es ist ernstlich besch%adigt." CR>
			      <REMOVE-CAREFULLY ,EGG>
			      <MOVE ,BROKEN-EGG ,PATH>)
			     (<EQUAL? ,PRSO ,EGG>
			      <TELL
"Das Ei f%allt auf die Erde und springt auf. Es ist ernstlich besch%adigt.">
			      <MOVE ,EGG ,PATH>
			      <BAD-EGG>
			      <CRLF>)
			     (<NOT <EQUAL? ,PRSO ,WINNER ,TREE>>
			      <MOVE ,PRSO ,PATH>
			      <TELL
DER-NOM-CAP ,PRSO " f%allt auf die Erde." CR>)
			     (<VERB? LEAP>
			      <JIGS-UP
			        "Das war wohl ein wenig zu weit unten.">)>)>)
	       (<EQUAL? .RARG ,M-ENTER> <ENABLE <QUEUE I-FOREST-ROOM -1>>)>>

<ROUTINE EGG-OBJECT ()
	 <COND (<AND <VERB? OPEN MUNG> <EQUAL? ,PRSO ,EGG>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL "Das Ei ist schon offen." CR>)
		      (<NOT ,PRSI>
		       <TELL
"Du hast weder das Werkzeug noch das Geschick." CR>)
		      (<EQUAL? ,PRSI ,HANDS>
		       <TELL "Ich bezweifle, da%s du das tun kannst, ohne es ernstlich zu besch%adigen." CR>)
		      (<OR <FSET? ,PRSI ,WEAPONBIT>
			   <FSET? ,PRSI ,TOOLBIT>
			   <VERB? MUNG>>
		       <TELL
"Das Ei ist jetzt offen, aber die Tollpatschigkeit deines Versuches hat seinen %asthetischen Wert stark vermindert.">
		       <BAD-EGG>
		       <CRLF>)
		      (<FSET? ,PRSO ,FIGHTBIT>
		       <TELL "Und erst die Idee, " DER-ACC ,PRSO " zu benutzen... Du %ubertriffst dich geradzu an originellen Einf%allen.">)
		      (T
		       <TELL 
"Die Idee " DER-ACC ,PRSO " zu benutzen ist wirklich sehr originell." CR>
		       <FSET ,PRSO ,FIGHTBIT>)>)
	       (<VERB? CLIMB-ON HATCH>
		<TELL
"Du f%uhlst ein Krachen unter deinen F%u%sen, und beim Nachsehen entdeckst du, da%s das Ei offen daliegt und schweren Schaden gelitten hat.">
		<BAD-EGG>
		<CRLF>)
	       (<VERB? OPEN MUNG THROW>
		<COND (<VERB? THROW> <MOVE ,PRSO ,HERE>)>
		<TELL
"Es ist dir zwar gelungen, das Ei zu %offnen, aber du hast es mit deinen rauhen Methoden besch%adigt.">
		<BAD-EGG>
		<CRLF>)>>

<ROUTINE BAD-EGG ("AUX" L)
	 <COND (<IN? ,CANARY ,EGG>
		<TELL " " <GETP ,BROKEN-CANARY ,P?FDESC>>)
	       (T <REMOVE-CAREFULLY ,BROKEN-CANARY>)>
	 <MOVE ,BROKEN-EGG <LOC ,EGG>>
	 <REMOVE-CAREFULLY ,EGG>
	 <RTRUE>>

<GLOBAL SING-SONG <>>

<ROUTINE CANARY-OBJECT ()
	 <COND (<VERB? WIND>
		<COND (<EQUAL? ,PRSO ,CANARY>
		       <COND (<AND <NOT ,SING-SONG> <FOREST-ROOM?>>
			      <TELL
"Der Kanarienvogel schmettert eine Arie, aus einer l%angstvergessenen Oper. Er singt falsch. Aus dem Gr%unen fliegt ein lieblicher Singvogel. Er l%a%st sich auf einem Zweig direkt %uber deinem Kopf nieder und %offnet den Schnabel, um zu singen. Als er das tut, f%allt eine sch%one goldene Flitterkugel aus dem Schnabel, trifft deinen Kopf und landet glitzernd im Gras." CR>
			     <SETG SING-SONG T>
			     <MOVE ,BAUBLE
				   <COND (<EQUAL? ,HERE ,UP-A-TREE> ,PATH)
					 (T ,HERE)>>)
			    (T
			     <TELL
"Der Kanarienvogel zwitschert f%ur eine kurze Zeit munter, wenn auch etwas blechern." CR>)>)
		     (T
		      <TELL
"Aus dem Innern des Kanarienvogels l%a%st sich ein unangenehmes mahlendes Ger%ausch vernehmen." CR>)>)>>

<ROUTINE FOREST-ROOM? ()
	 <OR <EQUAL? ,HERE ,FOREST-1 ,FOREST-2 ,FOREST-3>
	     <EQUAL? ,HERE ,PATH ,UP-A-TREE>>>

<ROUTINE I-FOREST-ROOM ()
	 <COND (<NOT <FOREST-ROOM?>>
		<DISABLE <INT I-FOREST-ROOM>>
		<RFALSE>)
	       (<PROB 15>
		<TELL
"In der Ferne h%orst du das Zwitschern eines Singvogels." CR>)>>

<ROUTINE FOREST-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER> <ENABLE <QUEUE I-FOREST-ROOM -1>>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? CLIMB-FOO CLIMB-UP>
			    <EQUAL? ,PRSO ,TREE>>
		       <DO-WALK ,P?RAUF>)>)>>

<ROUTINE WCLIF-OBJECT ()
	 <COND (<VERB? CLIMB-UP CLIMB-DOWN CLIMB-FOO>
		<TELL "Der Felsvorsprung ist zu steil zum Erklettern." CR>)>>

<ROUTINE CLIFF-OBJECT ()
	 <COND (<OR <VERB? LEAP>
		    <AND <VERB? PUT> <EQUAL? ,PRSO ,ME>>>
		<TELL
		 "Das w%are sehr gewagt. Vielleicht sogar t%odlich." CR>)
	       (<EQUAL? ,PRSI ,CLIMBABLE-CLIFF>
		<COND (<VERB? PUT THROW-OFF>
		       <TELL
DER-NOM-CAP ,PRSO " rollt in den Flu%s und gluck-gluck weg ist es." CR>
		       <REMOVE-CAREFULLY ,PRSO>)>)>>

"SUBTITLE CHUTES AND LADDERS"

<ROUTINE ROPE-FUNCTION ("AUX" RLOC)
	 <COND (<NOT <EQUAL? ,HERE ,DOME-ROOM>>
		<SETG DOME-FLAG <>>
		<COND (<VERB? TIE>
		       <TELL "Daran kannst du das Seil nicht binden." CR>)>)
	       (<VERB? TIE>
		<COND (<EQUAL? ,PRSI ,RAILING>
		       <COND (,DOME-FLAG
			      <TELL
			       "Das Seil ist schon darangebunden." CR>)
			     (T
			      <TELL
"Das Seil f%allt %uber die Seite und reicht bis zu 3 Metern %uber dem Boden."
CR>
			      <SETG DOME-FLAG T>
			      <FSET ,ROPE ,NDESCBIT>
			      <SET RLOC <LOC ,ROPE>>
			      <COND (<OR <NOT .RLOC>
					 <NOT <IN? .RLOC ,ROOMS>>>
				     <MOVE ,ROPE ,HERE>)>
			      T)>)>)
	       (<AND <VERB? CLIMB-DOWN> <EQUAL? ,PRSO ,ROPE ,ROOMS> ,DOME-FLAG>
		<DO-WALK ,P?RUNTER>)
	       (<AND <VERB? TIE-UP>
		     <EQUAL? ,ROPE ,PRSI>>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <COND (<L? <GETP ,PRSO ,P?STRENGTH> 0>
			      <TELL
"Dein Versuch " DER-ACC ,PRSO " zu fesseln, weckt ihn auf.">
			      <AWAKEN ,PRSO>)
			     (T
			      <TELL
DER-NOM-CAP ,PRSO " wehrt sich, und du kannst ihn nicht fesseln." CR>)>)
		      (T
		       <TELL 
"Warum w%urdest du " DER-ACC ,PRSO " fesseln?" CR>)>)
	       (<VERB? UNTIE>
		<COND (,DOME-FLAG
		       <SETG DOME-FLAG <>>
		       <FCLEAR ,ROPE ,NDESCBIT>
		       <TELL "Das Seil ist jetzt aufgebunden." CR>)
		      (T
		       <TELL "Es ist an nichts gebunden." CR>)>)
	       (<AND <VERB? DROP>
		     <EQUAL? ,HERE ,DOME-ROOM>
		     <NOT ,DOME-FLAG>>
		<MOVE ,ROPE ,TORCH-ROOM>
		<TELL "Das Seil f%allt sanft nach unten auf die Erde." CR>)
	       (<VERB? TAKE>
		<COND (,DOME-FLAG
		       <TELL "Das Seil ist an das Gel%ander gebunden." CR>)>)>>

<ROUTINE UNTIE-FROM ()
    <COND (<AND <EQUAL? ,PRSO ,ROPE>
		<AND ,DOME-FLAG <EQUAL? ,PRSI ,RAILING>>>
	   <PERFORM ,V?UNTIE ,PRSO>)
	  (T <TELL "Es ist nicht daran gebunden." CR>)>>

<ROUTINE SLIDE-FUNCTION ()
	 <COND (<OR <VERB? THROUGH CLIMB-UP CLIMB-DOWN CLIMB-FOO>
		    <AND <VERB? PUT> <EQUAL? ,PRSO ,ME>>>
		<COND (<EQUAL? ,HERE ,CELLAR>
		       <DO-WALK ,P?WEST>
		       <RTRUE>)
		      (T
		       <TELL "Das Seil ist an das Gel%ander gebunden..." CR>
		       <GOTO ,CELLAR>)>)
	       (<VERB? PUT>
		<SLIDER ,PRSO>)>>

<ROUTINE SLIDER (OBJ)
	 <COND (<FSET? .OBJ ,TAKEBIT>
		<TELL 
DER-NOM-CAP .OBJ " f%allt auf die Rutschbahn und ist weg." CR>
		<COND (<EQUAL? .OBJ ,WATER> <REMOVE-CAREFULLY .OBJ>)
		      (T
		       <MOVE .OBJ ,CELLAR>)>)
	       (T <TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE SANDWICH-BAG-FCN ()
	 <COND (<AND <VERB? SMELL>
		     <IN? ,LUNCH ,PRSO>>
		<TELL "Es riecht nach scharfen Pepperoni." CR>)>>

"MORE RANDOMNESS"

<ROUTINE DEAD-FUNCTION ("OPTIONAL" (FOO <>) "AUX" M)
	 <COND (<VERB? WALK>
		<COND (<AND <EQUAL? ,HERE ,TIMBER-ROOM>
			    <EQUAL? ,PRSO ,P?WEST>>
		       <TELL "In Deinem Zustand kannst du hier nicht rein." CR>)>)
	       (<VERB? BRIEF VERBOSE SUPER-BRIEF
		       VERSION ;AGAIN SAVE RESTORE QUIT RESTART>
		<>)
	       (<VERB? ATTACK MUNG ALARM SWING>
		<TELL "In deinem Zustand sind deine Angriffe sinnlos." CR>)
	       (<VERB? OPEN CLOSE EAT DRINK
		       INFLATE DEFLATE TURN BURN
		       TIE UNTIE RUB>
		<TELL
"Sogar das %ubersteigt deine F%ahigkeiten." CR>)
	       (<VERB? WAIT>
		<TELL "Warum nicht.? Du hast eine ganze Ewigkeit." CR>)
	       (<VERB? LAMP-ON>
		<TELL "Du brauchst kein Licht, das dir den Weg leuchtet." CR>)
	       (<VERB? SCORE>
		<TELL "Du bist tot! Wie kannst du da an den Stand des Spieles denken?" CR>)
	       (<VERB? TAKE RUB>
		<TELL "Deine Hand geht durch das Ding direkt hindurch." CR>)
	       (<VERB? DROP THROW INVENTORY>
		<TELL "Du besitzt garnichts." CR>)
	       (<VERB? DIAGNOSE>
		<TELL "Du bist tot." CR>)
	       (<VERB? LOOK>
		<TELL "Der Raum sieht fremd und unirdisch aus">
		<COND (<NOT <FIRST? ,HERE>>
		       <TELL ".">)
		      (T
		       <TELL " und die Dinge erscheinen unwirklich.">)>
		<CRLF>
		<COND (<NOT <FSET? ,HERE ,ONBIT>>
		       <TELL
"Obwohl es hier keine Lichtquelle gibt, erscheint der Raum doch einigermassen beleuchtet." CR>)>
		<CRLF>
		<>)
	       (<VERB? PRAY>
		<COND (<EQUAL? ,HERE ,SOUTH-TEMPLE>
		       <FCLEAR ,LAMP ,INVISIBLE>
		       <PUTP ,WINNER ,P?ACTION 0>
		       ;<SETG GWIM-DISABLE <>>
		       <SETG ALWAYS-LIT <>>
		       <SETG DEAD <>>
		       <COND (<IN? ,TROLL ,TROLL-ROOM>
			      <SETG TROLL-FLAG <>>)>
		       <TELL
"Aus der Ferne ert%ont der Schall einer einsamen Trompete. Der Raum wird sehr hell und du f%uhlst dich k%orperlos. In einem Moment weicht die Helligkeit, und du f%uhlst dich, als ob du dich von einem langen Schlaf im Walde erhebst. Aus der Ferne h%orst du den schwachen Gesang eines Singvogels und das Rauschen des Waldes." CR CR>
		       <GOTO ,FOREST-1>)
		      (T
		       <TELL "Deine Gebete werden nicht erh%ort." CR>)>)
	       (T
		<TELL "Sogar das kannst du nicht." CR>
		<SETG P-CONT <>>
		<RFATAL>)>>

;"Pseudo-object routines"

<ROUTINE LAKE-PSEUDO ()
	 <COND (,LOW-TIDE
		<TELL "Von dem See ist nicht viel %ubrig..." CR>)
	       (<VERB? CROSS>
		<TELL "Er ist zu breit zum %Uberqueren." CR>)
	       (<VERB? THROUGH>
		<TELL "Du kannst in diesem See nicht schwimmen." CR>)>>

<ROUTINE STREAM-PSEUDO ()
	 <COND (<VERB? SWIM THROUGH>
		<TELL "Du kannst in dem Flu%s nicht schwimmen." CR>)
	       (<VERB? CROSS>
		<TELL "Die andere Seite ist eine abrupte Felswand." CR>)>>

<ROUTINE CHASM-PSEUDO ()
	 <COND (<OR <VERB? LEAP>
		    <AND <VERB? PUT> <EQUAL? ,PRSO ,ME>>>
		<TELL
"Du siehst dich um, bevor du springst, und erkennst, da%s du nie %uberleben w%urdest." CR>)
	       (<VERB? CROSS>
		<TELL "Es ist zu weit zum Springen, und es gibt keine Br%ucke." CR>)
	       (<AND <VERB? PUT THROW-OFF> <EQUAL? ,PRSI ,CHASM>>
		<TELL
 DER-NOM-CAP ,PRSO " f%allt au%ser Sichtweite in die Spalte." CR>
		<REMOVE-CAREFULLY ,PRSO>)>>

<ROUTINE DOME-PSEUDO ()
	 <COND (<VERB? KISS>
		<TELL "Nein." CR>)>>

<ROUTINE GATE-PSEUDO ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?HINEIN>
		<RTRUE>)
	       (T
		<TELL
"Das Tor ist von einer unsichtbaren Kraft gesch%utzt. Deine Z%ahne schmerzen, wenn du es ber%uhrst." CR>)>>

<ROUTINE DOOR-PSEUDO () ;"in Studio"
	 <COND (<VERB? OPEN CLOSE>
		<TELL "Die T%ur gibt nicht nach." CR>)
	       (<VERB? THROUGH>
		<DO-WALK ,P?SUED>)>>

<ROUTINE PAINT-PSEUDO ()
	 <COND (<VERB? MUNG>
		<TELL "Ein bi%schen Farbe splittert weg, zeigt mehr Farbe." CR>)>>

<ROUTINE GAS-PSEUDO ()
	 <COND ;(<VERB? BREATHE>	;"REALLY BLOW"
		<TELL "Hier gibt es mehr Gas, als man wegblasen kann." CR>)
	       (<VERB? SMELL>
		<TELL "Es riecht hier nach Kohlenoxyd." CR>)>>

"SUBTITLE MELEE"

;"melee actions (object functions for villains called with these)"

<CONSTANT F-BUSY? 1>		;"busy recovering weapon?"
<CONSTANT F-DEAD 2>		;"mistah kurtz, he dead."
<CONSTANT F-UNCONSCIOUS 3>	;"into dreamland"
<CONSTANT F-CONSCIOUS 4>	;"rise and shine"
<CONSTANT F-FIRST? 5>		;"strike first?"


"blow results"

<CONSTANT MISSED 1>		;"attacker misses"
<CONSTANT UNCONSCIOUS 2>	;"defender unconscious"
<CONSTANT KILLED 3>		;"defender dead"
<CONSTANT LIGHT-WOUND 4>	;"defender lightly wounded"
<CONSTANT SERIOUS-WOUND 5>	;"defender seriously wounded"
<CONSTANT STAGGER 6>		;"defender staggered (miss turn)"
<CONSTANT LOSE-WEAPON 7>	;"defender loses weapon"
<CONSTANT HESITATE 8>		;"hesitates (miss on free swing)"
<CONSTANT SITTING-DUCK 9>	;"sitting duck (crunch!)"

"tables of melee results"

<GLOBAL DEF1
	<TABLE (PURE)
	 MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 UNCONSCIOUS UNCONSCIOUS
	 KILLED KILLED KILLED KILLED KILLED>>

<GLOBAL DEF2A
	<TABLE (PURE)
	 MISSED MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND
	 UNCONSCIOUS>>

<GLOBAL DEF2B
	<TABLE (PURE)
	 MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 UNCONSCIOUS
	 KILLED KILLED KILLED>>

<GLOBAL DEF3A
	<TABLE (PURE)
	 MISSED MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF3B
	<TABLE (PURE)
	 MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF3C
	<TABLE (PURE)
	 MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF1-RES
	<TABLE DEF1
	       0 ;<REST ,DEF1 2>
	       0 ;<REST ,DEF1 4>>>

<GLOBAL DEF2-RES
	<TABLE DEF2A
	       DEF2B
	       0; <REST ,DEF2B 2>
	       0; <REST ,DEF2B 4>>>

<GLOBAL DEF3-RES
	<TABLE DEF3A
	       0 ;<REST ,DEF3A 2>
	       DEF3B
	       0 ;<REST ,DEF3B 2>
	       DEF3C>>

"useful constants"

<CONSTANT STRENGTH-MAX 7>
<CONSTANT STRENGTH-MIN 2>
<CONSTANT CURE-WAIT 30>


"I-FIGHT moved to DEMONS"

<ROUTINE DO-FIGHT (LEN "AUX" CNT RES O OO (OUT <>))
	<REPEAT ()
	      <SET CNT 0>
	      <REPEAT ()
		      <SET CNT <+ .CNT 1>>
		      <COND (<EQUAL? .CNT .LEN>
			     <SET RES T>
			     <RETURN T>)>
		      <SET OO <GET ,VILLAINS .CNT>>
		      <SET O <GET .OO ,V-VILLAIN>>
		      <COND (<NOT <FSET? .O ,FIGHTBIT>>)
			    (<APPLY <GETP .O ,P?ACTION>
				    ,F-BUSY?>)
			    (<NOT <SET RES
				       <VILLAIN-BLOW
					.OO
					.OUT>>>
			     <SET RES <>>
			     <RETURN>)
			    (<EQUAL? .RES ,UNCONSCIOUS>
			     <SET OUT <+ 1 <RANDOM 3>>>)>>
	      <COND (.RES
		     <COND (<NOT .OUT> <RETURN>)
			   (T
			    <SET OUT <- .OUT 1>>
			    <COND (<0? .OUT> <RETURN>)>)>)
		    (T <RETURN>)>>>

;"takes a remark, defender, and good-guy's weapon"
<ROUTINE REMARK (REMARK D W "AUX" LEN (CNT 0) STR)
	 <SET LEN <GET .REMARK 0>>
	 <REPEAT ()
	         <COND (<G? <SET CNT <+ .CNT 1>> .LEN> <RETURN>)>
		 <SET STR <GET .REMARK .CNT>>
		 <COND (<EQUAL? .STR ,WEP-NOM ,WEP-NOM-CAP ,WEP-ACC 
				,WEP-ACC-CAP ,WEP-DAT ,DER-WEP-ACC>
		       <COND (<EQUAL? .STR ,WEP-NOM>
			      <TELL "dein">
			      <COND (<AND <NOT <FSET? .W ,DERBIT>
					       <FSET? .W ,DASBIT>>
					  <TELL "e">>)>)
			     (<EQUAL? .STR ,WEP-NOM-CAP>
			      <TELL "Dein">
			      <COND (<AND <NOT <FSET? .W ,DERBIT>>
					  <NOT <FSET? .W ,DASBIT>>>
				     <TELL "e">)>)
			     (<EQUAL? .STR ,WEP-ACC>
			      <TELL "dein">
			      <COND (<FSET? .W ,DERBIT>
				     <TELL "en">)
				    (<NOT <FSET? .W ,DASBIT>>
				     <TELL "e">)>)
			     (<EQUAL? .STR ,WEP-ACC-CAP>
			      <TELL "Dein">
			      <COND (<FSET? .W ,DERBIT>
				     <TELL "en">)
				    (<NOT <FSET? .W ,DASBIT>>
				     <TELL "e">)>)
			     (<EQUAL? .STR ,WEP-DAT>
			      <TELL "dein">
			      <COND (<OR <FSET? .W ,DERBIT>
					 <FSET? .W ,DASBIT>>
				     <TELL "em">)
				    (T ;"ie, fem"
				     <TELL "er">)>)
			     (<EQUAL? .STR ,DER-WEP-ACC>
			      <DER-ACC-PRINT .W>)>
		       <COND (<NOT <EQUAL? .STR ,DER-WEP-ACC>>
			      <TELL " " D .W>)>)
		 (<EQUAL? .STR ,DEF-NOM ,DEF-NOM-CAP ,DEF-ACC ,DEF-DAT-CAP>
		  ;"ALL DEF ARE MASCULINE"
		  <COND (<EQUAL? .STR ,DEF-NOM>
			 <TELL "der">)
			(<EQUAL? .STR ,DEF-NOM-CAP>
			 <TELL "Der">)
			(<EQUAL? .STR ,DEF-ACC>
			 <TELL "den">)
			(<EQUAL? .STR ,DEF-DAT-CAP>
			 <TELL "Dem">)>
		  <TELL " " D .D>)
		 (T 
		  <PRINT .STR>)>>
	 <CRLF>>

;"Strength of the player is a basic value (S) adjusted by his P?STRENGTH
property, which is normally 0"

<ROUTINE FIGHT-STRENGTH ("OPTIONAL" (ADJUST? T) "AUX" S)
	 <SET S
	      <+ ,STRENGTH-MIN
		 </ ,SCORE
		    </ ,SCORE-MAX
		       <- ,STRENGTH-MAX ,STRENGTH-MIN>>>>>
	 <COND (.ADJUST? <+ .S <GETP ,WINNER ,P?STRENGTH>>)(T .S)>>

<ROUTINE VILLAIN-STRENGTH (OO
			   "AUX" VILLAIN
			   OD TMP)
	 <SET VILLAIN <GET .OO ,V-VILLAIN>>
	 <SET OD <GETP .VILLAIN ,P?STRENGTH>>
	 <COND (<NOT <L? .OD 0>>
		<COND (<AND <EQUAL? .VILLAIN ,THIEF> ,THIEF-ENGROSSED>
		       <COND (<G? .OD 2> <SET OD 2>)>
		       <SETG THIEF-ENGROSSED <>>)>
		<COND (<AND ,PRSI
			    <FSET? ,PRSI ,WEAPONBIT>
			    <EQUAL? <GET .OO ,V-BEST> ,PRSI>>
		       <SET TMP <- .OD <GET .OO ,V-BEST-ADV>>>
		       <COND (<L? .TMP 1> <SET TMP 1>)>
		       <SET OD .TMP>)>)>
	 .OD>

"find a weapon (if any) in possession of argument"

<ROUTINE FIND-WEAPON (O "AUX" W)
	 <SET W <FIRST? .O>>
	 <COND (<NOT .W>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<OR <EQUAL? .W ,STILETTO ,AXE ,SWORD>
			    <EQUAL? .W ,KNIFE ,RUSTY-KNIFE>>
			<RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>> <RFALSE>)>>>

<ROUTINE VILLAIN-BLOW (OO OUT?
		       "AUX" VILLAIN
		       REMARKS
		       DWEAPON ATT DEF OA OD TBL RES NWEAPON)
	 <SET VILLAIN <GET .OO ,V-VILLAIN>>
	 <SET REMARKS <GET .OO ,V-MSGS>>
	 <FCLEAR ,WINNER ,STAGGERED>
	 <COND (<FSET? .VILLAIN ,STAGGERED>
		<TELL 
DER-NOM-CAP .VILLAIN " gewinnt langsam die Kontrolle %uber seine F%u%se." CR>
		<FCLEAR .VILLAIN ,STAGGERED>
		<RTRUE>)>
	 <SET OA <SET ATT <VILLAIN-STRENGTH .OO>>>
	 <COND (<NOT <G? <SET DEF <FIGHT-STRENGTH>> 0>> <RTRUE>)>
	 <SET OD <FIGHT-STRENGTH <>>>
	 <SET DWEAPON <FIND-WEAPON ,WINNER>>
	 <COND (<L? .DEF 0> <SET RES ,KILLED>)
	       (T
		<COND (<1? .DEF>
		       <COND (<G? .ATT 2> <SET ATT 3>)>
		       <SET TBL <GET ,DEF1-RES <- .ATT 1>>>)
		      (<EQUAL? .DEF 2>
		       <COND (<G? .ATT 3> <SET ATT 4>)>
		       <SET TBL <GET ,DEF2-RES <- .ATT 1>>>)
		      (<G? .DEF 2>
		       <SET ATT <- .ATT .DEF>>
		       <COND (<L? .ATT -1> <SET ATT -2>)
			     (<G? .ATT 1> <SET ATT 2>)>
		       <SET TBL <GET ,DEF3-RES <+ .ATT 2>>>)>
		<SET RES <GET .TBL <- <RANDOM 9> 1>>>
		<COND (.OUT?
		       <COND (<EQUAL? .RES ,STAGGER> <SET RES ,HESITATE>)
			     (T <SET RES ,SITTING-DUCK>)>)>
		<COND (<AND <EQUAL? .RES ,STAGGER>
			    .DWEAPON
			    <PROB 25 <COND (.HERO? 10)(T 50)>>>
		       <SET RES ,LOSE-WEAPON>)>
		<REMARK
		  <RANDOM-ELEMENT <GET .REMARKS <- .RES 1>>>
		  ,WINNER
		  .DWEAPON>)>
	 <COND (<OR <EQUAL? .RES ,MISSED> <EQUAL? .RES ,HESITATE>>)
	       (<EQUAL? .RES ,UNCONSCIOUS>)
	       (<OR <EQUAL? .RES ,KILLED>
		    <EQUAL? .RES ,SITTING-DUCK>>
		<SET DEF 0>)
	       (<EQUAL? .RES ,LIGHT-WOUND>
		<SET DEF <- .DEF 1>>
		<COND (<L? .DEF 0> <SET DEF 0>)>
		<COND (<G? ,LOAD-ALLOWED 50>
		       <SETG LOAD-ALLOWED <- ,LOAD-ALLOWED 10>>)>)
	       (<EQUAL? .RES ,SERIOUS-WOUND>
		<SET DEF <- .DEF 2>>
		<COND (<L? .DEF 0> <SET DEF 0>)>
		<COND (<G? ,LOAD-ALLOWED 50>
		       <SETG LOAD-ALLOWED <- ,LOAD-ALLOWED 20>>)>)
	       (<EQUAL? .RES ,STAGGER> <FSET ,WINNER ,STAGGERED>)
	       (T
		;<AND <EQUAL? .RES ,LOSE-WEAPON> .DWEAPON>
		<MOVE .DWEAPON ,HERE>
		<COND (<SET NWEAPON <FIND-WEAPON ,WINNER>>
		       <TELL
"Gl%ucklicherweise hast du noch " EIN-ACC .NWEAPON "." CR>)>)>
	 <WINNER-RESULT .DEF .RES .OD>>

<ROUTINE HERO-BLOW ("AUX" OO VILLAIN (OUT? <>) DWEAPON ATT DEF (CNT 0)
		    OA OD TBL RES NWEAPON (LEN <GET ,VILLAINS 0>))
	 <REPEAT ()
		 <SET CNT <+ .CNT 1>>
		 <COND (<EQUAL? .CNT .LEN> <RETURN>)>
		 <SET OO <GET ,VILLAINS .CNT>>
		 <COND (<EQUAL? <GET .OO ,V-VILLAIN> ,PRSO>
			<RETURN>)>>
	 <FSET ,PRSO ,FIGHTBIT>
	 <COND (<FSET? ,WINNER ,STAGGERED>
		<TELL
"Du erholst dich immer noch von dem letzten Hieb, so da%s dein Angriff keine Wirkung hat." CR>
		<FCLEAR ,WINNER ,STAGGERED>
		<RTRUE>)>
	 <SET ATT <FIGHT-STRENGTH>>
	 <COND (<L? .ATT 1> <SET ATT 1>)>
	 <SET OA .ATT>
	 <SET VILLAIN <GET .OO ,V-VILLAIN>>
	 <COND (<0? <SET OD <SET DEF <VILLAIN-STRENGTH .OO>>>>
		<COND (<EQUAL? ,PRSO ,WINNER>
		       <RETURN <JIGS-UP
"Na ja, diesmal hast du es endlich geschafft. Ist Selbstmord schmerzlos?">>)>
		<TELL DER-ACC-CAP .VILLAIN " angreifen ist sinnlos." CR>
		<RTRUE>)>
	 <SET DWEAPON <FIND-WEAPON .VILLAIN>>
	 <COND (<OR <NOT .DWEAPON> <L? .DEF 0>>
		<TELL DER-NOM-CAP .VILLAIN ", wer ">
		<COND (<L? .DEF 0> <TELL "bewu%stlos">)
		      (T <TELL "unbewaffnet">)>
		<TELL 
" ist, kann sich nicht wehren. " PRONOUN-NOM-CAP .VILLAIN " stirbt." CR>
		<SET RES ,KILLED>)
	       (T
		<COND (<1? .DEF>
		       <COND (<G? .ATT 2> <SET ATT 3>)>
		       <SET TBL <GET ,DEF1-RES <- .ATT 1>>>)
		      (<EQUAL? .DEF 2>
		       <COND (<G? .ATT 3> <SET ATT 4>)>
		       <SET TBL <GET ,DEF2-RES <- .ATT 1>>>)
		      (<G? .DEF 2>
		       <SET ATT <- .ATT .DEF>>
		       <COND (<L? .ATT -1> <SET ATT -2>)
			     (<G? .ATT 1> <SET ATT 2>)>
		       <SET TBL <GET ,DEF3-RES <+ .ATT 2>>>)>
		<SET RES <GET .TBL <- <RANDOM 9> 1>>>
		<COND (.OUT?
		       <COND (<EQUAL? .RES ,STAGGER> <SET RES ,HESITATE>)
			     (T <SET RES ,SITTING-DUCK>)>)>
		<COND (<AND <EQUAL? .RES ,STAGGER> .DWEAPON <PROB 25>>
		       <SET RES ,LOSE-WEAPON>)>
		<REMARK
		  <RANDOM-ELEMENT <GET ,HERO-MELEE <- .RES 1>>>
		  ,PRSO
		  ,PRSI>)>
	 <COND (<OR <EQUAL? .RES ,MISSED> <EQUAL? .RES ,HESITATE>>)
	       (<EQUAL? .RES ,UNCONSCIOUS> <SET DEF <- .DEF>>)
	       (<OR <EQUAL? .RES ,KILLED> <EQUAL? .RES ,SITTING-DUCK>>
		<SET DEF 0>)
	       (<EQUAL? .RES ,LIGHT-WOUND>
		<SET DEF <- .DEF 1>>
		<COND (<L? .DEF 0> <SET DEF 0>)>)
	       (<EQUAL? .RES ,SERIOUS-WOUND>
		<SET DEF <- .DEF 2>>
		<COND (<L? .DEF 0> <SET DEF 0>)>)
	       (<EQUAL? .RES ,STAGGER> <FSET ,PRSO ,STAGGERED>)
	       (T
		;<AND <EQUAL? .RES ,LOSE-WEAPON> .DWEAPON>
		<FCLEAR .DWEAPON ,NDESCBIT>
		<FSET .DWEAPON ,WEAPONBIT>
		<MOVE .DWEAPON ,HERE>
		<THIS-IS-IT .DWEAPON>)>
	 <VILLAIN-RESULT ,PRSO .DEF .RES>>

<ROUTINE WINNER-RESULT (DEF RES OD)
	 <PUTP ,WINNER
	       ,P?STRENGTH
	       <COND (<0? .DEF> -10000)(T <- .DEF .OD>)>>
	 <COND (<L? <- .DEF .OD> 0>
		<ENABLE <QUEUE I-CURE ,CURE-WAIT>>)>
	 <COND (<NOT <G? <FIGHT-STRENGTH> 0>>
		<PUTP ,WINNER ,P?STRENGTH <+ 1 <- <FIGHT-STRENGTH <>>>>>
		<JIGS-UP
"Es scheint, als ob der letzte Hieb dir den Rest gegeben hat. Es tut mir leid, aber du bist tot.">
		<>)
	       (T .RES)>>

<ROUTINE VILLAIN-RESULT (VILLAIN DEF RES)
	 <PUTP .VILLAIN ,P?STRENGTH .DEF>
	 <COND (<0? .DEF>
		<FCLEAR .VILLAIN ,FIGHTBIT>
		;<TELL
"Almost as soon as " DER-NOM .VILLAIN " breathes his last breath, a cloud
of sinister black fog envelops him, and when the fog lifts, the
carcass has disappeared." CR>
		<TELL 
"Fast gleichzeitig mit dem letzten Atemzug des " D .VILLAIN>
		<COND (<EQUAL? .VILLAIN ,THIEF>
		       <TELL "es">)
		      (T
		       <TELL "s">)>
<TELL " verh%ullt ihn eine Wolke aus gespenstigem schwarzem Nebel, und wenn der Nebel sich hebt, ist die Leiche verschwunden." CR>
		<REMOVE-CAREFULLY .VILLAIN>
		<APPLY <GETP .VILLAIN ,P?ACTION> ,F-DEAD>
		.RES)
	       (<EQUAL? .RES ,UNCONSCIOUS>
		<APPLY <GETP .VILLAIN ,P?ACTION> ,F-UNCONSCIOUS>
		.RES)
	       (T .RES)>>


<ROUTINE WINNING? (V "AUX" VS PS)
	 <SET VS <GETP .V ,P?STRENGTH>>
	 <SET PS <- .VS <FIGHT-STRENGTH>>>
	 <COND (<G? .PS 3> <PROB 90>)
	       (<G? .PS 0> <PROB 75>)
	       (<0? .PS> <PROB 50>)
	       (<G? .VS 1> <PROB 25>)
	       (T <PROB 10>)>>

<ROUTINE I-CURE ("AUX" S)
	  <SET S <GETP ,WINNER ,P?STRENGTH>>
	  <COND (<G? .S 0> <SET S 0> <PUTP ,WINNER ,P?STRENGTH .S>)
	       (<L? .S 0> <SET S <+ .S 1>> <PUTP ,WINNER ,P?STRENGTH .S>)>
	 <COND (<L? .S 0>
		<COND (<L? ,LOAD-ALLOWED ,LOAD-MAX>
		       <SETG LOAD-ALLOWED <+ ,LOAD-ALLOWED 10>>)>
		<ENABLE <QUEUE I-CURE ,CURE-WAIT>>)
	       (T
		<SETG LOAD-ALLOWED ,LOAD-MAX>
		<DISABLE <INT I-CURE>>)>>

"FIGHTS"

"messages for winner"
;"NOTE: ALL THREE DEFENDERS (DEF) ARE MASCULINE CASE GENDER"

;<CONSTANT F-WEP 0>	;"means print weapon name"
;<CONSTANT F-DEF 1>	;"means print defender name (villain, e.g.)"

;"ALL WEAPONS NEED A 'your' PRONOUN BEFORE THEM, EXCEPT FOR DER-WEP-ACC" 
<CONSTANT WEP-ACC 2>
<CONSTANT WEP-ACC-CAP 3>
<CONSTANT WEP-NOM 4>
<CONSTANT WEP-NOM-CAP 5>
<CONSTANT DER-WEP-ACC 6> ;"smacks the sword"
<CONSTANT WEP-DAT 7> ;"auf deinem weapon"

<CONSTANT DEF-NOM 8>
<CONSTANT DEF-NOM-CAP 9>
<CONSTANT DEF-ACC 10>
<CONSTANT DEF-DAT-CAP 11>

;<GLOBAL HERO-MELEE
 <TABLE (PURE)
  <LTABLE (PURE)
   <LTABLE (PURE) "Your " F-WEP " misses the " F-DEF " by an inch.">
   <LTABLE (PURE) "A good slash, but it misses the " F-DEF " by a mile.">
   <LTABLE (PURE) "You charge, but the " F-DEF " jumps nimbly aside.">
   <LTABLE (PURE) "Clang! Crash! The " F-DEF " parries.">
   <LTABLE (PURE) "A quick stroke, but the " F-DEF " is on guard.">
   <LTABLE (PURE) "A good stroke, but it's too slow; the " F-DEF " dodges.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "Your " F-WEP " crashes down, knocking the " F-DEF " into dreamland.">
   <LTABLE (PURE) "The " F-DEF " is battered into unconsciousness.">
   <LTABLE (PURE) "A furious exchange, and the " F-DEF " is knocked out!">
   <LTABLE (PURE) "The haft of your " F-WEP " knocks out the " F-DEF ".">
   <LTABLE (PURE) "The " F-DEF " is knocked out!">>
  <LTABLE (PURE)
   ;"Der Troll bei%st ins Gra%s, als ihm dein Schwert den Kopf abschl%agt."
  <LTABLE (PURE) "It's curtains for the " F-DEF " as your " F-WEP " removes his head.">
   <LTABLE (PURE) "The fatal blow strikes the " F-DEF " square in the heart: He dies.">
   <LTABLE (PURE) "The " F-DEF " takes a fatal blow and slumps to the floor dead.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The " F-DEF " is struck on the arm; blood begins to trickle down.">
   <LTABLE (PURE) "Your " F-WEP " pinks the " F-DEF " on the wrist, but it's not serious.">
   <LTABLE (PURE) "Your stroke lands, but it was only the flat of the blade.">
   <LTABLE (PURE) "The blow lands, making a shallow gash in the " F-DEF "'s arm!">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The " F-DEF " receives a deep gash in his side.">
   <LTABLE (PURE) "A savage blow on the thigh! The " F-DEF " is stunned but can still fight!">
   <LTABLE (PURE) "Slash! Your blow lands! That one hit an artery, it could be serious!">
   <LTABLE (PURE) "Slash! Your stroke connects! This could be serious!">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The " F-DEF " is staggered, and drops to his knees.">
   ;"Der Dieb ist hilflos und f%allt auf die Kniee."
   <LTABLE (PURE) "The " F-DEF " is momentarily disoriented and can't fight back.">
   <LTABLE (PURE) "The force of your blow knocks the " F-DEF " back, stunned.">
   <LTABLE (PURE) "The " F-DEF " is confused and can't fight back.">
   <LTABLE (PURE) "The quickness of your thrust knocks the " F-DEF " back, stunned.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The " F-DEF "'s weapon is knocked to the floor, leaving him unarmed.">
   <LTABLE (PURE) "The " F-DEF " is disarmed by a subtle feint past his guard.">>>>

<GLOBAL HERO-MELEE
<TABLE (PURE)
<LTABLE (PURE) 
<LTABLE (PURE) WEP-NOM-CAP " verpa%st " DEF-ACC " um 2cm."> 
<LTABLE (PURE) "Ein guter Hieb, aber er verpa%st " DEF-ACC " um einen Kilometer.">
<LTABLE (PURE) "Du greifst an, aber " DEF-NOM " springt leichtf%u%sig zur Seite.">
<LTABLE (PURE) "Kling! Klang! Bumm! " DEF-NOM-CAP " pariert den Schlag.">
<LTABLE (PURE) "Ein schneller Schlag, aber " DEF-NOM " ist auf der Hut.">
<LTABLE (PURE) "Ein guter Schlag, aber er ist zu langsam, " DEF-NOM " weicht aus.">>

<LTABLE (PURE)
<LTABLE (PURE) WEP-NOM-CAP " braust nieder, sendet " DEF-ACC " ins Land der Tr%aume.">
<LTABLE (PURE) DEF-NOM-CAP " ist bewu%stlos geschlagen.">
<LTABLE (PURE) "Ein f%urchterlicher Waffenaustausch und " DEF-NOM " ist k.o.">
<LTABLE (PURE) "Das Heft von " WEP-DAT " haut " DEF-ACC " um.">
<LTABLE (PURE) DEF-NOM-CAP " ist k.o. geschlagen.">>

<LTABLE (PURE)
<LTABLE (PURE) DEF-NOM-CAP " bei%st ins Gras, als " WEP-NOM " seinen Kopf abschl%agt.">
<LTABLE (PURE) "Der t%odliche Schlag trifft " DEF-ACC " direkt ins Herz. Er stirbt.">
<LTABLE (PURE) DEF-NOM-CAP " erleidet einen t%odlichen Schlag und f%allt tot zur Erde.">>

<LTABLE (PURE) 
<LTABLE (PURE) DEF-NOM-CAP " ist am Arm verletzt. Blut beginnt herabzurinseln.">
<LTABLE (PURE) WEP-NOM-CAP " ritzt " DEF-ACC " am Handgelenk, aber es ist nicht ernst.">
<LTABLE (PURE) "Dein Hieb sitzt, aber er war nur mit der flachen Seite von
dem Schwert.">
<LTABLE (PURE) "Der Schlag trifft " DEF-ACC " und hinterl%a%st eine leichte Wunde in seinem Arm.">>

<LTABLE (PURE)
<LTABLE (PURE) DEF-NOM-CAP " bekommt eine tiefe Wunde in der Seite.">
<LTABLE (PURE) "Ein grausiger Schlag in den Schenkel! " DEF-NOM-CAP " ist momentan wie festgenagelt, aber er kann weiterk%ampfen!">
<LTABLE (PURE) "Schwupp! Dein Schlag f%allt! Dieser hat eine Arterie getroffen, das k%onnte gef%ahrlich sein!">
<LTABLE (PURE) "Schwupp! Dein Schlag hat getroffen! Dies k%onnte gef%ahrlich sein.">>

<LTABLE (PURE)
<LTABLE (PURE) DEF-DAT-CAP " hat es den Atem verschlagen, und er f%allt auf die Knie.">
<LTABLE (PURE) DEF-NOM-CAP " ist f%ur einen Moment verwirrt und kann nicht zur%uckschlagen.">
<LTABLE (PURE) "Die Macht deines Hiebes wirft " DEF-ACC " zur%uck, er ist benommen.">
<LTABLE (PURE) DEF-NOM-CAP " ist verwirrt und kann nicht zur%uckschlagen.">
<LTABLE (PURE) "Die Geschwindigkeit deines Sto%ses schl%agt " DEF-ACC " zur%uck.">>

<LTABLE (PURE)
<LTABLE (PURE) DEF-DAT-CAP " wird " WEP-NOM " aus der Hand geschlagen, damit ist er unbewaffnet.">
<LTABLE (PURE) DEF-NOM-CAP " ist durch ein kluges T%auschungsman%over entwaffnet.">>>>

;"messages for cyclops (note that he has no weapon)"

;<GLOBAL CYCLOPS-MELEE
 <TABLE (PURE)
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops misses, but the backwash almost knocks you over.">
   <LTABLE (PURE) "The Cyclops rushes you, but runs into the wall.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops sends you crashing to the floor, unconscious.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops breaks your neck with a massive smash.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "A quick punch, but it was only a glancing blow.">
   <LTABLE (PURE) "A glancing blow from the Cyclops' fist.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The monster smashes his huge fist into your chest, breaking several
ribs.">
   <LTABLE (PURE) "The Cyclops almost knocks the wind out of you with a quick punch.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops lands a punch that knocks the wind out of you.">
   <LTABLE (PURE) "Heedless of your weapons, the Cyclops tosses you against the rock
wall of the room.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops grabs your " F-WEP ", tastes it, and throws it to the
ground in disgust.">
   <LTABLE (PURE) "The monster grabs you on the wrist, squeezes, and you drop your
" F-WEP " in pain.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops seems unable to decide whether to broil or stew his
dinner.">>
  <LTABLE (PURE)
   <LTABLE (PURE) "The Cyclops, no sportsman, dispatches his unconscious victim.">>>>

<GLOBAL CYCLOPS-MELEE
<TABLE (PURE)
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop schafft es nicht, aber die Nachwelle schmei%st dich beinahe um.">
<LTABLE (PURE) "Der Zyklop greift dich an, aber er rennt gegen die Wand.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop sendet dich bewu%stlos zu Boden.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop bricht dir mit einem ungeheuren Hieb das Genick.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Ein schneller Schlag, aber er hat dich nur gestreift.">
<LTABLE (PURE) "Ein dich streifender Faustschlag von dem Zyklopen.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Das Ungeheuer trifft dich mit seiner enormen Faust in der Brust und bricht dir einige Rippen.">
<LTABLE (PURE) "Der Zyklop nimmt dir mit einem schnellen Schlag beinahe den Atem.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop landet einen Schlag, der dir den Atem momentan nimmt.">
<LTABLE (PURE) "Deiner Waffen nicht achtend wird der Zyklop dich gegen die Wand des Raumes.">>
<LTABLE (PURE) 

<LTABLE (PURE) "Der Zyklop nimmt pl%otzlich deine Waffe, bei%st hinein und schmei%st sie v%ar%achtlich auf die Erde.">

<LTABLE (PURE) "Das Ungeheuer ergreift dein Handgelenk, quetscht seine Finger darum, und du l%a%st vor Schmerz " WEP-ACC " fallen.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop scheint nicht entscheiden zu k%onnen, ob er sein Abendessen kochen oder backen soll.">>
<LTABLE (PURE) 
<LTABLE (PURE) "Der Zyklop, der h%ochst unsportlich ist, wird sein bewu%stloses Opfer los.">>>>

;"messages for troll"

;<GLOBAL TROLL-MELEE
<TABLE (PURE)
 <LTABLE (PURE)
  <LTABLE (PURE) "The troll swings his axe, but it misses.">
  <LTABLE (PURE) "The troll's axe barely misses your ear.">
  <LTABLE (PURE) "The axe sweeps past as you jump aside.">
  <LTABLE (PURE) "The axe crashes against the rock, throwing sparks!">>
 
<LTABLE (PURE)
  ;"Die flache Seite der Axt trifft dich leicht am Kopf, und du wirst bewu%stlos."
  <LTABLE (PURE) "The flat of the troll's axe hits you delicately on the head, knocking you out.">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "The troll neatly removes your head.">
  <LTABLE (PURE) "The troll's axe stroke cleaves you from the nave to the chops.">
  <LTABLE (PURE) "The troll's axe removes your head.">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "The axe gets you right in the side. Ouch!">
  <LTABLE (PURE) "The flat of the troll's axe skins across your forearm.">
  ;"Die geschwungene Axt haut dich bald um, denn du kannst sie kaum parieren."
<LTABLE (PURE) "The troll's swing almost knocks you over as you barely parry
in time.">
  <LTABLE (PURE) "The troll swings his axe, and it nicks your arm as you dodge.">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "The troll charges, and his axe slashes you on your " F-WEP " arm.">
  <LTABLE (PURE) "An axe stroke makes a deep wound in your leg.">
  <LTABLE (PURE) "The troll's axe swings down, gashing your shoulder.">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "The troll hits you with a glancing blow, and you are momentarily
stunned.">
  <LTABLE (PURE) "The troll swings; the blade turns on your armor but crashes
broadside into your head.">
  <LTABLE (PURE) "You stagger back under a hail of axe strokes.">
  <LTABLE (PURE) "The troll's mighty blow drops you to your knees.">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "The axe hits your " F-WEP " and knocks it spinning.">
  <LTABLE (PURE) "The troll swings, you parry, but the force of his blow knocks your " F-WEP " away.">
  <LTABLE (PURE) "The axe knocks your " F-WEP " out of your hand. It falls to the floor.">>

 <LTABLE (PURE)
  <LTABLE (PURE) "The troll hesitates, fingering his axe.">
  <LTABLE (PURE) "The troll scratches his head ruminatively:  Might you be magically
protected, he wonders?">>
 
<LTABLE (PURE)
  <LTABLE (PURE) "Conquering his fears, the troll puts you to death.">>>>

<GLOBAL TROLL-MELEE
<TABLE (PURE)
<LTABLE (PURE) 
<LTABLE (PURE) "Der Troll schwingt die Axt, aber er trifft nicht.">
<LTABLE (PURE) "Die Axt des Trolls geht haarscharf an deinem Ohr vorbei.">
<LTABLE (PURE) "Die Axt fegt vorbei, als du zur Seite springst.">
<LTABLE (PURE) "Die Axt schmettert so hart gegen den Stein, da%s Funken spr%uhen.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Die flache Seite der Axt des Trolls trifft dich leicht am Kopf, und du wirst bewu%stlos.">>

<LTABLE (PURE)
<LTABLE (PURE) "Der Troll schneidet elegant deinen Kopf ab.">
<LTABLE (PURE) "Die Axt des Trolls teilt dich in zwei gleiche Teile, von oben bis unten.">
<LTABLE (PURE) "Die Axt des Trolls haut dir den Kopf ab.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Die Axt trifft dich direkt in die Seite. Au!">
<LTABLE (PURE) "Die Fl%ache der Axt des Trolls entfernt die Haut an deinem Unterarm.">
<LTABLE (PURE) "Die Schw%unge des Trolls hauen dich beinahe um, w%ahrend du sie kaum rechtzeitig parieren kannst.">
<LTABLE (PURE) "Der Troll schwingt seine Axt, trifft deinen Arm als du ausweichst.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Troll greift an, und seine Axt verletzt dich an deinem Schwertarm.">
<LTABLE (PURE) "Ein Axthiebt hinterl%a%st eine tiefe Wunde in deinem Bein.">
<LTABLE (PURE) "Die Axt des Trolls schwingt herunter, schl%agt dir die Schulter blutig.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Troll trifft dich mit einem schnellen Schlag, und du bist momentan au%ser Gefecht gesetzt.">
<LTABLE (PURE) "Der Troll trifft, aber die Schneide wird von deiner R%ustung abgelenkt, trifft dich aber direkt in den Kopf.">
<LTABLE (PURE) "Du stolperst unter einem Hagel von Axtstreichen zur%uck.">
<LTABLE (PURE) "Der m%achtige Schlag des Trolls bringt dich auf die Kniee.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Die Axt trifft dein Schwert, und haut dich um.">
<LTABLE (PURE) "Der Troll schwingt, du parierst, aber die Gewalt seines Streiches schl%agt dir " DER-WEP-ACC " aus der Hand.">
<LTABLE (PURE) "Die Axt schl%agt dir die Waffe aus der Hand. Sie f%allt zu Boden.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Troll z%ogert, betastet seine Axt.">
<LTABLE (PURE) "Der Troll kratzt sich nachdenklich am Kopf. Ob du wohl magische Kr%afte hast, wundert er sich?">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Troll meistert seine Furcht und t%otet dich.">>>>

;"messages for thief"

;<GLOBAL THIEF-MELEE
<TABLE (PURE)
 <LTABLE (PURE)
  <LTABLE (PURE) "The thief stabs nonchalantly with his stiletto and misses.">
  <LTABLE (PURE) "You dodge as the thief comes in low.">
  <LTABLE (PURE) "You parry a lightning thrust, and the thief salutes you with
a grim nod.">
  <LTABLE (PURE) "The thief tries to sneak past your guard, but you twist away.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "Shifting in the midst of a thrust, the thief knocks you unconscious
with the haft of his stiletto.">
  <LTABLE (PURE) "The thief knocks you out.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "Finishing you off, the thief inserts his blade into your heart.">
  <LTABLE (PURE) "The thief comes in from the side, feints, and inserts the blade
into your ribs.">
  <LTABLE (PURE) "The thief bows formally, raises his stiletto, and with a wry grin,
ends the battle and your life.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "A quick thrust pinks your left arm, and blood starts to
trickle down.">
  ;"Ein schneller Sto%s trifft deinen linken Arm, und Blut beginnt, herabzutr%opfeln."
  <LTABLE (PURE) "The thief draws blood, raking his stiletto across your arm.">
  ;"Ein schneller Sto%s trifft deinen linken Arm, und Blut beginnt, herabzutr%opfeln."
  <LTABLE (PURE) "The stiletto flashes faster than you can follow, and blood wells from your leg.">
  ;"Das Stilett sticht schneller, als du erwartet hast, und Blut str%omt aus deinem Bein."
  <LTABLE (PURE) "The thief slowly approaches, strikes like a snake, and leaves
you wounded.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "The thief strikes like a snake! The resulting wound is serious.">
  <LTABLE (PURE) "The thief stabs a deep cut in your upper arm.">
  <LTABLE (PURE) "The stiletto touches your forehead, and the blood obscures your
vision.">
  <LTABLE (PURE) "The thief strikes at your wrist, and suddenly your grip is slippery
with blood.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "The butt of his stiletto cracks you on the skull, and you stagger
back.">
  <LTABLE (PURE) "The thief rams the haft of his blade into your stomach, leaving
you out of breath.">
  <LTABLE (PURE) "The thief attacks, and you fall back desperately.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "A long, theatrical slash. You catch it on your " F-WEP ", but the
thief twists his knife, and the " F-WEP " g%os flying.">
  <LTABLE (PURE) "The thief neatly flips your " F-WEP " out of your hands, and it drops
to the floor.">
  <LTABLE (PURE) "You parry a low thrust, and your " F-WEP " slips out of your hand.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "The thief, a man of superior breeding, pauses for a moment to consider the propriety of finishing you off.">
  <LTABLE (PURE) "The thief amuses himself by searching your pockets.">
  <LTABLE (PURE) "The thief entertains himself by rifling your pack.">>
 <LTABLE (PURE)
  <LTABLE (PURE) "The thief, forgetting his essentially genteel upbringing, cuts your
throat.">
  <LTABLE (PURE) "The thief, a pragmatist, dispatches you as a threat to his
livelihood.">>>>

<GLOBAL THIEF-MELEE
<TABLE (PURE)
<LTABLE (PURE) 
<LTABLE (PURE) "Der Dieb sticht elegant mit dem Stilett und trifft nicht.">
<LTABLE (PURE) "Du vermeidest das Stilett, als der Dieb tief sticht.">
<LTABLE (PURE) "Du parierst einen blitzartigen Sto%s, und der Dieb bedient dich mit einem grimmigen Kopfnicken.">
<LTABLE (PURE) "Der Dieb versucht, deine Abwehrstellung heimt%uckisch zu durchbrechen, aber du windest dich aus seiner Richtung.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Indem er die Richtung seines Sto%ses %andert, trifft dich der Dieb mit dem Heft des Stiletts, du wirst bewu%stlos.">
<LTABLE (PURE) "Der Dieb haut dich k.o.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Dein Leben endet, als der Dieb die Schneide in dein Herz senkt.">
<LTABLE (PURE) "Der Dieb kommt von der Seite, macht ein T%auschungsman%over und setzt die Schneide zwischen deine Rippen.">
<LTABLE (PURE) "Der Dieb verbeugt sich formell, hebt das Stilett und mit einem h%a%slichen Grinsen beendet er den Kampf und dein Leben.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Ein schneller Hieb streift deinen linken Arm, und Blut rinnt deinen Arm herunter.">
<LTABLE (PURE) "Blut beginnt zu flie%sen, als der Dieb sein Stilett %uber deinen Arm recht.">
<LTABLE (PURE) "Das Stilett zuckt schneller, als Du denken kannst, und Blut flie%st von deinem Bein.">
<LTABLE (PURE) "Der Dieb kommt langsam n%aher, schl%agt zu wie eine Schlange und l%a%st dich verwundet liegen.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Dieb schl%agt zu wie eine Schlange! Die empfangene Wunde ist ernst!">
<LTABLE (PURE) "Der Dieb versetzt dir einen tiefen Stich in den Oberarm.">
<LTABLE (PURE) "Das Stilett ber%uhrt deine Stirn, und das herabrinnende Blut macht dich blind.">
<LTABLE (PURE) "Der Dieb trifft dich am Handgelenk und pl%otzlich wird dein Schwertgriff schl%upfrig von dem Blut.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Griff von seinem Stilett kracht auf deinen Sch%adel, und du wankst zur%uck.">
<LTABLE (PURE) "Der Dieb rammt das Heft seines Messers in deinen Bauch und du verlierst den Atem.">
<LTABLE (PURE) "Der Dieb greift dich an, und du f%allst verzweifelt zur%uck.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Ein langer theatralischer Stich. Du parierst ihn auf " WEP-DAT ", aber der Dieb dreht sein Messer, und " WEP-NOM " fliegt dir aus der Hand.">
<LTABLE (PURE) "Der Dieb dreht dir " DER-WEP-ACC " elegant aus der Hand, und es f%allt auf die Erde.">
<LTABLE (PURE) "Du parierst einen Tiefschlag und " WEP-NOM " schl%upft dir aus der Hand.">>

<LTABLE (PURE) 
<LTABLE (PURE) "Der Dieb, ein Mann aus guter Gesellschaft, stoppt f%ur eine Minute, um zu %uberlegen, ob es in Ordnung ist, dein Leben zu beenden.">
<LTABLE (PURE) "Es am%usiert den Dieb, deine Taschen zu durchsuchen.">
<LTABLE (PURE) "Der Dieb besch%aftigt sich damit, deinen Rucksack zu durchw%uhlen.">>

<LTABLE (PURE) 
<LTABLE (PURE) "F%ur einen Moment vergi%st der Dieb seine gute Kinderstube, er schneidet dir den Hals ab."> 
<LTABLE (PURE) "Der Dieb, ein Pragmatiker, sieht in dir eine Bedrohung seines Lebens.">>>>

;"each table entry is:"

<CONSTANT V-VILLAIN 0>	;"villain"
<CONSTANT V-BEST 1>	;"best weapon"
<CONSTANT V-BEST-ADV 2>	;"advantage it confers"
<CONSTANT V-PROB 3>	;"prob of waking if unconscious"
<CONSTANT V-MSGS 4>	;"messages for that villain"

"This table must be after TROLL-MELEE, THIEF-MELEE, CYCLOPS-MELEE defined!"
<GLOBAL VILLAINS
	<LTABLE <TABLE TROLL SWORD 1 0 TROLL-MELEE>
		<TABLE THIEF KNIFE 1 0 THIEF-MELEE>
		<TABLE CYCLOPS <> 0 0 CYCLOPS-MELEE>>>

"DEMONS"

"Fighting demon"

<ROUTINE I-FIGHT ("AUX" (FIGHT? <>) LEN CNT OO O P)
      <SET LEN <GET ,VILLAINS 0>>
      <COND (,DEAD <RFALSE>)>
      <SET CNT 0>
      <REPEAT ()
	      <SET CNT <+ .CNT 1>>
	      <COND (<EQUAL? .CNT .LEN> <RETURN>)>
	      <SET OO <GET ,VILLAINS .CNT>>
	      <COND (<AND <IN? <SET O <GET .OO ,V-VILLAIN>> ,HERE>
			  <NOT <FSET? .O ,INVISIBLE>>>
		     <COND (<AND <EQUAL? .O ,THIEF> ,THIEF-ENGROSSED>
			    <SETG THIEF-ENGROSSED <>>)
			   (<L? <GETP .O ,P?STRENGTH> 0>
			    <SET P <GET .OO ,V-PROB>>
			    <COND (<AND <NOT <0? .P>> <PROB .P>>
				   <PUT .OO ,V-PROB 0>
				   <AWAKEN .O>)
				  (T
				   <PUT .OO ,V-PROB <+ .P 25>>)>)
			   (<OR <FSET? .O ,FIGHTBIT>
				<APPLY <GETP .O ,P?ACTION> ,F-FIRST?>>
			    <SET FIGHT? T>)>)
		    (T
		     <COND (<FSET? .O ,FIGHTBIT>
			    <APPLY <GETP .O ,P?ACTION> ,F-BUSY?>)>
		     <COND (<EQUAL? .O ,THIEF> <SETG THIEF-ENGROSSED <>>)>
		     <FCLEAR ,WINNER ,STAGGERED>
		     <FCLEAR .O ,STAGGERED>
		     <FCLEAR .O ,FIGHTBIT>
		     <AWAKEN .O>)>>
      <COND (<NOT .FIGHT?> <RFALSE>)>
      <DO-FIGHT .LEN>>

<ROUTINE AWAKEN (O "AUX" S)
	  <SET S <GETP .O ,P?STRENGTH>>
	  <COND (<L? .S 0>
		<PUTP .O ,P?STRENGTH <- 0 .S>>
		<APPLY <GETP .O ,P?ACTION> ,F-CONSCIOUS>)>
	 T>

"SWORD demon"

<ROUTINE I-SWORD ("AUX" DEM G
		        (NG 0) P T L)
	  <SET DEM <INT I-SWORD>>
	  <SET G <GETP ,SWORD ,P?TVALUE>>
	  <COND (<IN? ,SWORD ,ADVENTURER>
		<COND (<INFESTED? ,HERE> 
		       <SET NG 2>)
		      (T
		       <SET P 0>
		       <REPEAT ()
			       <COND (<0? <SET P <NEXTP ,HERE .P>>>
				      <RETURN>)
				     (<NOT <L? .P ,LOW-DIRECTION>>
				      <SET T <GETPT ,HERE .P>>
				      <SET L <PTSIZE .T>>
				      <COND (<EQUAL? .L ,UEXIT ,CEXIT ,DEXIT>
					     <COND (<INFESTED? <GET ;B .T 0>>
						    <SET NG 1>
						    <RETURN>)>)>)>>)>
		<COND (<EQUAL? .NG .G> <RFALSE>)
		      (<EQUAL? .NG 2>
		       <TELL 
"Dein Schwert hat hell zu leuchten begonen." CR>)
		      (<1? .NG>
		       <TELL "Dein Schwert leuchtet mit einem schwachen blauen Schimmer." CR>)
		      (<0? .NG>
		       <TELL "Dein Schwert leuchtet nicht mehr." CR>)>
		<PUTP ,SWORD ,P?TVALUE .NG>
		<RTRUE>)
	       (T
		<PUT .DEM ,C-ENABLED? 0>
		<RFALSE>)>>

<ROUTINE INFESTED? (R "AUX" F)
	 <SET F <FIRST? .R>>
	 <REPEAT ()
		 <COND (<NOT .F> <RFALSE>)
		       (<AND <FSET? .F ,ACTORBIT> <NOT <FSET? .F ,INVISIBLE>>>
			<RTRUE>)
		       (<NOT <SET F <NEXT? .F>>> <RFALSE>)>>>

"THIEF demon"

<ROUTINE I-THIEF ("AUX" RM ROBJ HERE? (ONCE <>) (FLG <>))
   <SET RM <LOC ,THIEF>>
   <PROG ()
     <COND (<SET HERE? <NOT <FSET? ,THIEF ,INVISIBLE>>>
	    <SET RM <LOC ,THIEF>>)>
     <COND
      (<AND <EQUAL? .RM ,TREASURE-ROOM> <NOT <EQUAL? .RM ,HERE>>>
       <COND (.HERE? <HACK-TREASURES> <SET HERE? <>>)>
       <DEPOSIT-BOOTY ,TREASURE-ROOM> ;"silent")
      (<AND <EQUAL? .RM ,HERE>
	    <NOT <FSET? .RM ,ONBIT>>
	    <NOT <IN? ,TROLL ,HERE>>>
       <COND (<THIEF-VS-ADVENTURER .HERE?> <RTRUE>)>
       <COND (<FSET? ,THIEF ,INVISIBLE> <SET HERE? <>>)>)
      (T
       <COND (<AND <IN? ,THIEF .RM>
		   <NOT <FSET? ,THIEF ,INVISIBLE>>> ;"Leave if victim left"
	      <FSET ,THIEF ,INVISIBLE>
	      <SET HERE? <>>)>
       <COND (<FSET? .RM ,TOUCHBIT>     ;"Hack the adventurer's belongings"
	      <ROB .RM ,THIEF 75>
	      <SET FLG
		   <COND (<AND ;<FSET? .RM ,MAZEBIT>
			       ;<FSET? ,HERE ,MAZEBIT>
			       <IN-MAZE? .RM>
			       <IN-MAZE? ,HERE>>
			  <ROB-MAZE .RM>)
			 (T <STEAL-JUNK .RM>)>>)>)>
     <COND (<AND <SET ONCE <NOT .ONCE>> <NOT .HERE?>>
					   ;"Move to next room, and hack."
	    <RECOVER-STILETTO>
	    <REPEAT ()
		    <COND (<AND .RM <SET RM <NEXT? .RM>>>)
			  (T <SET RM <FIRST? ,ROOMS>>)>
		    <COND (<AND <NOT <FSET? .RM ,SACREDBIT>>
				<FSET? .RM ,RLANDBIT>>
			   <MOVE ,THIEF .RM>
			   <FCLEAR ,THIEF ,FIGHTBIT>
			   <FSET ,THIEF ,INVISIBLE>
			   <SETG THIEF-HERE <>>
			   <RETURN>)>>
	    <AGAIN>)>>
   <COND (<NOT <EQUAL? .RM ,TREASURE-ROOM>>
	  <DROP-JUNK .RM>)>
   .FLG>

<ROUTINE DROP-JUNK (RM "AUX" X N (FLG <>))
	 <SET X <FIRST? ,THIEF>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN .FLG>)>
		 <SET N <NEXT? .X>>
		 <COND (<EQUAL? .X ,STILETTO ,LARGE-BAG>)
		       (<AND <0? <GETP .X ,P?TVALUE>> <PROB 30 T>>
			<FCLEAR .X ,INVISIBLE>
			<MOVE .X .RM>
			<COND (<AND <NOT .FLG> <EQUAL? .RM ,HERE>>
			       <TELL
"Der R%auber, der seinen Sack durchsucht, l%a%st ein paar Dinge, die er f%ur wertlos h%alt, fallen." CR>
			       <SET FLG T>)>)>
		 <SET X .N>>>

<ROUTINE RECOVER-STILETTO ()
	 <COND (<IN? ,STILETTO <LOC ,THIEF>>
		<FSET ,STILETTO ,NDESCBIT>
		<MOVE ,STILETTO ,THIEF>)>>

<ROUTINE STEAL-JUNK (RM "AUX" X N)
	 <SET X <FIRST? .RM>>
	 <REPEAT ()
		 <COND (<NOT .X> <RFALSE>)>
		 <SET N <NEXT? .X>>
		 <COND (<AND <0? <GETP .X ,P?TVALUE>>
			     <FSET? .X ,TAKEBIT>
			     <NOT <FSET? .X ,SACREDBIT>>
			     <NOT <FSET? .X ,INVISIBLE>>
			     <OR <EQUAL? .X ,STILETTO>
				 <PROB 10 T>>>
			<MOVE .X ,THIEF>
			<FSET .X ,TOUCHBIT>
			<FSET .X ,INVISIBLE>
			<COND (<EQUAL? .X ,ROPE> <SETG DOME-FLAG <>>)>
			<COND (<EQUAL? .RM ,HERE>
			       <TELL 
"Pl%otzlich bemerkst du, da%s " DER-NOM .X " verschwunden ist." CR>
			       <RTRUE>)
			      (ELSE <RFALSE>)>)>
		 <SET X .N>>>

<ROUTINE ROB (WHAT WHERE "OPTIONAL" (PROB <>) "AUX" N X (ROBBED? <>))
	 <SET X <FIRST? .WHAT>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN .ROBBED?>)>
		 <SET N <NEXT? .X>>
		 <COND (<AND <NOT <FSET? .X ,INVISIBLE>>
			     <NOT <FSET? .X ,SACREDBIT>>
			     <G? <GETP .X ,P?TVALUE> 0>
			     <OR <NOT .PROB> <PROB .PROB>>>
			<MOVE .X .WHERE>
			<FSET .X ,TOUCHBIT>
			<COND (<EQUAL? .WHERE ,THIEF> <FSET .X ,INVISIBLE>)>
			<SET ROBBED? T>)>
		 <SET X .N>>>

;"special-cased routines"

<ROUTINE V-DIAGNOSE ("AUX" MS
		     WD RS)
	 #DECL ((MS WD RS) FIX)
	 <SET MS <FIGHT-STRENGTH <>>>
	 <SET WD <GETP ,WINNER ,P?STRENGTH>>
	 <SET RS <+ .MS .WD>>
	 <COND (<0? <GET <INT I-CURE> ,C-ENABLED?>> <SET WD 0>)
	       (ELSE <SET WD <- .WD>>)>
	 <COND (<0? .WD> <TELL "Du bist kerngesund.">)
	       (T
		<TELL "Du hast ">
		;"Du hast verschiedene Wunden, die nach 88 Spielrunden geheilt sein werden."
		<COND (<1? .WD> <TELL "eine leichte Verletzung,">)
		      (<EQUAL? .WD 2> <TELL "eine ernste Verletzung,">)
		      (<EQUAL? .WD 3> <TELL "mehrere Verletzungen,">)
		      (<G? .WD 3> <TELL "ernste Verletzungen,">)>)>
	 <COND (<NOT <0? .WD>>
		;<TELL " which will be cured after ">
		<TELL " die nach "> 
		<PRINTN
		 <+ <* ,CURE-WAIT <- .WD 1>>
		    <GET <INT I-CURE> ,C-TICK>>>
		<TELL " Z%ugen geheilt sein werden.">)>
	 <CRLF>
	 <TELL "Du kannst ">
	 <COND (<0? .RS> <TELL "bald den Tod erwarten.">)
	       (<1? .RS> <TELL "von einer weiteren leichten Verletzung get%otet werden." >)
	       (<EQUAL? .RS 2> <TELL "von einer schweren Verletzung get%otet werden.">)
	       (<EQUAL? .RS 3> <TELL "eine schwere Verletzung %uberleben">)
	       (<G? .RS 3>
		<TELL "mehrere Verletzungen %uberleben.">)>
	 <CRLF>
	 <COND (<NOT <0? ,DEATHS>>
		<TELL "Du bist ">
		<COND (<1? ,DEATHS> <TELL "einmal">)
		      (T <TELL "zweimal">)>
		<TELL  " get%otet worden." CR>)>>

;"Dein Spielstand ist 87 (aus 350 Gesamtpunkten), in 120 Z%ugen."
<ROUTINE V-SCORE ("OPTIONAL" (ASK? T))
	 #DECL ((ASK?) <OR ATOM FALSE>)
	 <TELL "Dein Spielstand ist ">
	 <TELL N ,SCORE>
	 <TELL " (aus 350 Gesamtpunkten), in ">
	 <TELL N ,MOVES>
	 <COND (<1? ,MOVES> <TELL " Z%uge.">) (ELSE <TELL " Z%ugen.">)>
	 <CRLF>
	 <TELL "Damit bist du ein ">
	 <COND (<EQUAL? ,SCORE 350> <TELL "Meisterabenteurer">)
	       (<G? ,SCORE 330> <TELL "Hexenmeister">)
	       (<G? ,SCORE 300> <TELL "Meister">)
	       (<G? ,SCORE 200> <TELL "Abenteurer" >)
	       (<G? ,SCORE 100> <TELL "Jungabenteurer">)
	       (<G? ,SCORE 50> <TELL "Anf%angerabenteurer">)
	       (<G? ,SCORE 25> <TELL "Amateurabenteurer">)
	       (T <TELL "Anf%anger">)>
	 <TELL "." CR>
	 ,SCORE>

<ROUTINE JIGS-UP (DESC "OPTIONAL" (PLAYER? <>))
 	 <SETG WINNER ,ADVENTURER>
	 <COND (,DEAD
		<TELL "|
Nur eine au%sergew%ohnliche Person kann get%otet werden, nachdem sie schon tot ist.Leider k%onnen nur au%sergew%ohnliche talentierte Leute damit fertig werden. Mir fehlt dieses Talent. Schade." CR>
		<FINISH>)>
	 <TELL .DESC CR>
	 <COND (<NOT ,LUCKY>
		<TELL "Pech gehabt, was?" CR>)>
	 <PROG ()
	       <SCORE-UPD -10>
	       <TELL "
|    ****  Du bist tot  ****
|
|">
	       <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		      <SETG OHERE <>>
		      <MOVE ,WINNER ,HERE>)>
	       <COND
		(<NOT <L? ,DEATHS 2>>
		 <TELL
"Du bist eindeutig ein lebensm%uder Narr. Wir verbieten Psychopaten den Eintritt zur H%ohle, da sie die anderen Abenteurer gef%ahrden. Deine leiblichen %Uberreste werden dem Land der lebendigen Toten %ubergeben, wo deine Mitabenteurer sich an ihnen erg%otzen k%onnen." CR>
		 <FINISH>)
		(T
		 <SETG DEATHS <+ ,DEATHS 1>>
		 <MOVE ,WINNER ,HERE>
		 <SETG OHERE <>>
		 <COND (<FSET? ,SOUTH-TEMPLE ,TOUCHBIT>
			<TELL
"W%ahrend du deinen letzten Atemzug tust, f%uhlst du dich all deiner B%urden entledigt. Dieses Gef%uhl verl%a%st dich, als du dich vor den Toren der H%olle befindest, wo die Geister dich anheulen und dir den Eintritt verwehren. Deine Sinne sind getr%ubt. Die Dinge in dem Kerker scheinen nicht wahrnehmbar, farblos, sogar unrealistisch." CR CR>
			<SETG DEAD T>
			<SETG TROLL-FLAG T>
			;<SETG GWIM-DISABLE T>
			<SETG ALWAYS-LIT T>
			<PUTP ,WINNER ,P?ACTION ,DEAD-FUNCTION>
			<GOTO ,ENTRANCE-TO-HADES>)
		       (T
			<TELL
"Na, la%s uns noch mal sehen...|
Na ja, wir sollten Dir vielleicht noch eine Chance geben. 
Wir k%onnen es f%ur dich nicht alles in Ordnung bringen, aber man kann ja nicht alles haben." CR CR>
			<GOTO ,FOREST-1>)>
		 <FCLEAR ,TRAP-DOOR ,TOUCHBIT>
		 <SETG P-CONT <>>
		 <RANDOMIZE-OBJECTS>
		 <KILL-INTERRUPTS>
		 <RFATAL>)>>>

<ROUTINE RANDOMIZE-OBJECTS ("AUX" (R <>) F N L)
	 <COND (<IN? ,LAMP ,WINNER>
		<MOVE ,LAMP ,LIVING-ROOM>)>
	 <COND (<IN? ,COFFIN ,WINNER>
		<MOVE ,COFFIN ,EGYPT-ROOM>)>
	 <PUTP ,SWORD ,P?TVALUE 0>
	 <SET N <FIRST? ,WINNER>>
	 <SET L <GET ,ABOVE-GROUND 0>>
	 <REPEAT ()
		 <SET F .N>
		 <COND (<NOT .F> <RETURN>)>
		 <SET N <NEXT? .F>>
		 <COND (<G? <GETP .F ,P?TVALUE> 0>
			<REPEAT ()
				<COND (<NOT .R> <SET R <FIRST? ,ROOMS>>)>
				<COND (<AND <FSET? .R ,RLANDBIT>
					    <NOT <FSET? .R ,ONBIT>>
					    <PROB 50>>
				       <MOVE .F .R>
				       <RETURN>)
				      (ELSE <SET R <NEXT? .R>>)>>)
		       (ELSE
			<MOVE .F <GET ,ABOVE-GROUND <RANDOM .L>>>)>>>

<ROUTINE KILL-INTERRUPTS ()
	 <DISABLE <INT I-XB>>
	 <DISABLE <INT I-XC>>
	 <DISABLE <INT I-CYCLOPS>>
	 <DISABLE <INT I-LANTERN>>
	 <DISABLE <INT I-CANDLES>>
	 <DISABLE <INT I-SWORD>>
	 <DISABLE <INT I-FOREST-ROOM>>
	 <DISABLE <INT I-MATCH>>
	 <FCLEAR ,MATCH ,ONBIT>
	 <RTRUE>>

<ROUTINE BAG-OF-COINS-F ()
	 <STUPID-CONTAINER ,BAG-OF-COINS "M%unzen">>

<ROUTINE TRUNK-F ()
	 <STUPID-CONTAINER ,TRUNK "Juwelen">>
 
<ROUTINE STUPID-CONTAINER (OBJ STR)
	 <COND (<VERB? OPEN CLOSE>
		;<TELL
"The " .STR " are safely inside; there's no need to do that." CR>
		<TELL "Die " .STR " befinden sich darin in Sicherheit. Es besteht kein Grund dazu, das zu tun." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		;<TELL
"There are lots of " .STR " in there." CR>
		<TELL 
"Da sind viele " .STR " darin." CR>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI .OBJ>>
		;<TELL
"Don't be silly. It wouldn't be a " DER-NOM .OBJ " anymore." CR>
		<TELL
"Sei nicht albern. Dann w%are es ja nicht mehr " EIN-NOM .OBJ "." CR>)>>

<ROUTINE DUMB-CONTAINER ()
	 <COND (<VERB? OPEN CLOSE LOOK-INSIDE>
		<TELL "Das geht nicht." CR>)
	       (<VERB? EXAMINE>
		;<TELL "It looks pretty much like a " DER-ACC ,PRSO "." CR>
		<TELL 
"Es sieht eigentlich wie " EIN-ACC ,PRSO " aus." CR>)>>

<ROUTINE GARLIC-F ()
	 <COND (<VERB? EAT>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL
"Zur H%olle! Auf diese Weise kannst du zwar keine Freunde gewinnen, aber hier ist sowieso niemand besonders freundlich. Also schluck's." CR>)>>

<ROUTINE CHAIN-PSEUDO ()
	 <COND (<VERB? TAKE MOVE>
		<TELL "Die Kette l%ost sich nicht." CR>)
	       (<VERB? RAISE LOWER>
		<TELL "Vielleicht solltest du das mit dem Korb machen." CR>)
	       (<VERB? EXAMINE>
		<TELL 
"Die Kette h%alt einen Korb innerhalb eines Schachtes." CR>)>> 

<ROUTINE TROLL-ROOM-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <IN? ,TROLL ,HERE>>
		<THIS-IS-IT ,TROLL>)>>