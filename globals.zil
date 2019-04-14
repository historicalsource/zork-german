			"Generic GLOBALS file for
			    The ZORK Trilogy
		       started on 7/28/83 by MARC
		       
		       -- GERMAN EDITION "

"SUBTITLE GLOBAL OBJECTS"

<OBJECT GLOBAL-OBJECTS
	(SYNONYM ZZMGCK)
	(DESC "es")
	(FLAGS
ACTORBIT    DOORBIT	LIGHTBIT    RMUNGBIT	TOOLBIT	    WEAPONBIT
BURNBIT	    DRINKBIT	NDESCBIT    SACREDBIT	TOUCHBIT    WEARBIT
CLIMBBIT    FIGHTBIT	NONLANDBIT  SEARCHBIT	TRANSBIT    READBIT
CONTBIT	    FLAMEBIT	ONBIT	    STAGGERED	TRYTAKEBIT
DASBIT	    FOODBIT	OPENBIT	    SURFACEBIT	TURNBIT     DIEBIT
DERBIT	    INVISIBLE	RLANDBIT    TAKEBIT	VEHBIT      KLUDGEBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK)
	(DESCFCN PATH-OBJECT)
        (GLOBAL GLOBAL-OBJECTS)
	(ADVFCN 0)
	(DESC "F")
	(FDESC "F")
	(LDESC "F")
	;(PSEUDO "FOOBAR" V-WALK)
	(CONTFCN 0)
	(VTYPE 1)
	(SIZE 0)
	(CAPACITY 0)>

;"Yes, this synonym for LOCAL-GLOBALS needs to exist... sigh"

<OBJECT ROOMS
	(HINEIN TO ROOMS)>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM INTNUM)
	(FLAGS TOOLBIT DIEBIT)
	(DESC "Nummer")>

;"adjs. make ps?direction work for 'walk to east'"
<OBJECT INTDIR
	(LOC GLOBAL-OBJECTS)
	(SYNONYM WEG ;DIRECTION)
	(ADJECTIVE NORD NORDEN OST OSTEN WEST WESTEN SUED SUEDEN
 		    NORDOSTEN NO NORDWESTEN NW SUEDOSTEN SO SUEDWESTEN SW)
	(FLAGS TOOLBIT DERBIT)
	(DESC "Weg")>

;<OBJECT PSEUDO-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "pseudo")
	(ACTION CRETIN-FCN)>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ES IHM)
	(DESC "es")
	(FLAGS NDESCBIT TOUCHBIT DASBIT)>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ER IHN IHM)
	(DESC "er")
	(FLAGS NDESCBIT TOUCHBIT DERBIT)>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM SIE IHR)
	(DESC "sie")
	(FLAGS NDESCBIT TOUCHBIT DIEBIT)>

<OBJECT NOT-HERE-OBJECT
	(DESC "Ding" ;"[not here]")
	(FLAGS DASBIT)
	(ACTION NOT-HERE-OBJECT-F)>

<ROUTINE NOT-HERE-OBJECT-F ("AUX" TBL (PRSO? T) OBJ)
	 ;"This COND is game independent (except the TELL)"
	 <COND (<AND <EQUAL? ,PRSO ,NOT-HERE-OBJECT>
		     <EQUAL? ,PRSI ,NOT-HERE-OBJECT>>
		<TELL "Diese Dinge sind nicht hier!" CR>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,NOT-HERE-OBJECT>
		<SET TBL ,P-PRSO>)
	       (T
		<SET TBL ,P-PRSI>
		<SET PRSO? <>>)>
	 ;"Here is the default 'cant see any' printer"
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <COND (<EQUAL? ,WINNER ,PLAYER>
		<TELL
"Du kannst das hier nicht sehen!" CR>
		;<TELL "You can't see ">
		;<NOT-HERE-PRINT .PRSO?>
		;<TELL "that here!" CR>)
	       (T
		;<TELL 
DER-NOM-CAP ,WINNER " seems confused. \"I don't see any ">
		<TELL DER-NOM-CAP ,WINNER " scheint verwirrt. %>Ich sehe das hier nicht!%<" CR>
		;<NOT-HERE-PRINT .PRSO?>
		;<TELL " here!\"" CR>)>
	 <RTRUE>>

;<ROUTINE NOT-HERE-PRINT (PRSO?)
 <COND (,P-OFLAG
	<COND (,P-XADJ <PRINTB ,P-XADJ ;N>)>
	<COND (,P-XNAM <PRINTB ,P-XNAM>)>)
       (.PRSO?
	<BUFFER-PRINT <GET ,P-ITBL ,P-NC1> <GET ,P-ITBL ,P-NC1L> <>>)
       (T
	<BUFFER-PRINT <GET ,P-ITBL ,P-NC2> <GET ,P-ITBL ,P-NC2L> <>>)>>

<ROUTINE NULL-F ("OPTIONAL" A1 A2)
	 <RFALSE>>

"Objects shared by all three Zorks go here"

<GLOBAL LOAD-MAX 100>

<GLOBAL LOAD-ALLOWED 100>

;<OBJECT BLESSINGS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM BLESSINGS GRACES)
	(DESC "blessings")
	(FLAGS NDESCBIT)>

<OBJECT STAIRS
	(LOC LOCAL-GLOBALS)
	(SYNONYM TREPPENHAUS TREPPENSTUFE TREPPE TREPP)
	(ADJECTIVE STEINE STEINEN DUNKELE DUNKELEN FORBIDDING STEEP)
	(DESC "Treppe")
	(FLAGS NDESCBIT CLIMBBIT DIEBIT)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<VERB? THROUGH>
		<TELL
"Du mu%st sagen, ob du nach oben oder unten gehen willst." CR>)>>

<OBJECT SAILOR
	(LOC GLOBAL-OBJECTS)
	(SYNONYM SEEMANN)
	(DESC "Seemann")
	(FLAGS NDESCBIT DERBIT)
	(ACTION SAILOR-FCN)>

<ROUTINE SAILOR-FCN ()
	  <COND (<VERB? TELL>
		 <SETG P-CONT <>>
		 <SETG QUOTE-FLAG <>>
		 <TELL "So kannst du mit dem Seemann nicht sprechen." CR>)
		(<VERB? EXAMINE>
		 %<COND (<==? ,ZORK-NUMBER 3>
			 '<COND (<NOT <FSET? ,VIKING-SHIP ,INVISIBLE>>
				 <TELL
"He looks like a sailor." CR>
				 <RTRUE>)>)
			(ELSE T)>
		 <TELL
"Hier ist kein Seemann zu sehen." CR>)
		(<VERB? HELLO>
		 <SETG HS <+ ,HS 1>>
		 %<COND (<==? ,ZORK-NUMBER 3>
			 '<COND (<NOT <FSET? ,VIKING-SHIP ,INVISIBLE>>
		                 <TELL
"The seaman looks up and maneuvers the boat toward shore. He cries out %>I
have waited three ages for someone to say those words and save me from
sailing this endless ocean. Please accept this gift. You may find it
useful!\" He throws something which falls near you in the sand, then sails
off toward the west, singing a lively, but somewhat uncouth, sailor song." CR>
		                 <FSET ,VIKING-SHIP ,INVISIBLE>
		                 <MOVE ,VIAL ,HERE>)
		                (<==? ,HERE ,FLATHEAD-OCEAN>
		                 <COND (,SHIP-GONE
			                <TELL "Nothing happens anymore." CR>)
			               (T
				        <TELL "Nothing happens yet." CR>)>)
				(T <TELL "Hier passiert garnichts." CR>)>)
			(T
			 '<COND (<0? <MOD ,HS 20>>
				 <TELL
"Du wiederholst dich." CR>)
				(<0? <MOD ,HS 10>>
				 <TELL
"Dieser Satz wird langsam langweilig." CR>)
				(T
				 <TELL "Hier passiert garnichts." CR>)>)>)>>

<OBJECT GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM GRUND BODEN MEERESBODEN SAND FUSSBODEN FU\%SBODEN)
	(DESC "Grund")
	(FLAGS DERBIT)
	(ACTION GROUND-FUNCTION)>

<ROUTINE GROUND-FUNCTION ()
	 <COND (<AND <VERB? PUT PUT-ON>
		     <EQUAL? ,PRSI ,GROUND>>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       %<COND (<==? ,ZORK-NUMBER 1>
		       '(<EQUAL? ,HERE ,SANDY-CAVE>
			 <SAND-FUNCTION>))
		      (T
		       '(<NULL-F>
			 <RFALSE>))>
	       (<VERB? DIG>
		<TELL "Hier ist der Boden zu hart zum Graben." CR>)>>

<OBJECT GRUE
	(LOC GLOBAL-OBJECTS)
	(SYNONYM GREUEL)
	(ADJECTIVE BOESARTIGE B\%OSARTIGE)
	(DESC "Greuel")
	(ADJDESC "lauernd")
	(FLAGS DASBIT)
	(ACTION GRUE-FUNCTION)>

<ROUTINE GRUE-FUNCTION ()
    <COND (<VERB? EXAMINE>
	   <TELL
"Das Greuel ist ein b%osartiges lauerndes Wesen in den dunklen Orten dieser Welt. Sein Lieblingsfressen besteht aus Abenteurern, aber sein uners%attlicher Appetit ist von seiner Furcht vor Licht gem%a%sigt Kein Greuel ist je bei Tageslicht gesehen worden, und nur wenige haben seine f%urchterlichen Krallen %uberlebt, um von dem grauenhaften Wesen zu erz%ahlen." CR>)
	  (<VERB? FIND>
	   <TELL
"Hier ist kein Greuel, aber ich bin sicher, das mindestens eines hier in der N%ahe im Dunkeln auf der Lauer liegt. Es w%are schon klug, auf die Lichtquelle zu achten." CR>)
	  (<VERB? LISTEN>
	   <TELL
"Es gibt keinen Ton von sich, aber es liegt immer in der N%ahe im Dunkeln."
CR>)>>

<OBJECT LUNGS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM LUNGEN LUFT MUND)
	(DESC "Luft")
	(FLAGS NDESCBIT DIEBIT)>

<OBJECT ME
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;MYSELF MICH ICH SELBE ABENTEURER)
	(DESC "Abenteurer")
	(FLAGS ACTORBIT DERBIT)
	(ACTION CRETIN-FCN)>

<ROUTINE CRETIN-FCN ()
	 <COND (<VERB? TELL>
		<SETG P-CONT <>>
		<SETG QUOTE-FLAG <>>
		<TELL
"Selbstgespr%ache deuten auf einen bevorstehenden Nervenzusammenbruch hin."
CR>)
	       (<AND <VERB? GIVE>
		     <EQUAL? ,PRSI ,ME>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<VERB? ALARM>
		<TELL "Du bist schon hellwach!" CR>)
	       (<VERB? EAT>
		<TELL "Selbst-Kanibalismus ist nicht die L%osung." CR>)
	       (<VERB? ATTACK MUNG>
		<COND (<AND ,PRSI <FSET? ,PRSI ,WEAPONBIT>>
		       <JIGS-UP 
"Wenn du darauf bestehst.........Bum! Du bist tot.">)
		      (T
		       <TELL "Selbstmord ist nicht die L%osung." CR>)>)
	       (<VERB? THROW>
		<COND (<==? ,PRSO ,ME>
		       <TELL
"Warum l%aufst du nicht wie normale Menschen?" CR>)>)
	       (<VERB? TAKE>
		<TELL "Ach, wie romantisch!" CR>)
	       (<VERB? EXAMINE>
		<COND %<COND (<==? ,ZORK-NUMBER 1>
			      '(<EQUAL? ,HERE <LOC ,MIRROR-1> <LOC ,MIRROR-2>>
		                <TELL
"Dein Spiegelbild sieht m%ude aus." CR>))
			     (<==? ,ZORK-NUMBER 3>
			      '(,INVIS
				<TELL
"A good trick, as you are currently invisible." CR>))
			     (T
			      '(<NULL-F> <RTRUE>))>
		      (T
		       %<COND (<==? ,ZORK-NUMBER 3>
			       '<TELL
"What you can see looks pretty much as usual, sorry to say." CR>)
			      (ELSE
			       '<TELL
"Das ist schwierig, au%ser wenn deine Augen rausnehmbar sind." CR>)>)>)>>

<OBJECT ADVENTURER
	(SYNONYM ABENTEUER)
	(DESC "Abenteurer")
	(FLAGS NDESCBIT INVISIBLE SACREDBIT ACTORBIT DERBIT)
	(STRENGTH 0)
	(ACTION 0)>

<OBJECT PATHOBJ
	(LOC GLOBAL-OBJECTS)
	(SYNONYM PFAD WALDPFAD)
        (ADJECTIVE ENGE ENGEN WINDENDER DURCHGANG)
	(DESC "Durchgang")
	(FLAGS NDESCBIT DERBIT)
	(ACTION PATH-OBJECT)>

<ROUTINE PATH-OBJECT ()
	 <COND (<VERB? FIND TAKE FOLLOW>
		<TELL "Du mu%st eine Richtung angeben." CR>)
	       (<VERB? DIG>
		<PERFORM ,V?DIG ,GROUND>
		<RTRUE>)>>

<OBJECT ZORKMID
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ZORKKNETE ZORKKNET)
	(DESC "Zorkknete")
	(FLAGS DIEBIT)
	(ACTION ZORKMID-FUNCTION)>

<ROUTINE ZORKMID-FUNCTION ()
    <COND (<VERB? EXAMINE>
	   <TELL
"Zorkknete ist die W%ahrung des Gro%sen Unterweltreiches." CR>)
	  (<VERB? FIND>
	   <TELL
"Man findet Zorkknete am besten, indem man rausgeht, und sie sucht." CR>)>>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HAND HAENDE H\%ANDE)
	(ADJECTIVE PAAR)
	(DESC "Paar H%ande")
	(FLAGS NDESCBIT TOOLBIT DASBIT)>

;"status line stuff"

<CONSTANT S-TEXT 0>
<CONSTANT S-WINDOW 1>

<CONSTANT H-NORMAL 0>
<CONSTANT H-INVERSE 1>
<CONSTANT H-BOLD 2>
<CONSTANT H-ITALIC 4>

<CONSTANT D-SCREEN-ON 1>
<CONSTANT D-SCREEN-OFF -1>
<CONSTANT D-PRINTER-ON 2>
<CONSTANT D-PRINTER-OFF -2>
<CONSTANT D-TABLE-ON 3>
<CONSTANT D-TABLE-OFF -3>
<CONSTANT D-RECORD-ON 4>
<CONSTANT D-RECORD-OFF -4>

<GLOBAL HOST:NUMBER 0> "Host machine."
<GLOBAL WIDTH:NUMBER 0> "Width of screen in chars."
;<GLOBAL MIDSCREEN:NUMBER 0> "Center of screen."
<GLOBAL CWIDTH:NUMBER 0> "Pixel width of characters."
<GLOBAL CHEIGHT:NUMBER 0> "Pixel height of characters."

<ROUTINE INIT-STATUS-LINE ()
	 <SETG HOST <LOWCORE INTID>>
	 <SETG CWIDTH <LOWCORE (FWRD 0)>>
	 <SETG WIDTH </ <LOWCORE HWRD> ,CWIDTH>>
	 <COND (<L? ,WIDTH 38>
		<TELL "[Screen too narrow.]" CR>
		<QUIT>)>
	 ;<SETG MIDSCREEN <+ </ ,WIDTH 2> 1>>
	 <SETG CHEIGHT <LOWCORE (FWRD 1)>>
	 
	 <SETG OHERE <>>
	 <SETG OLD-LEN 0>
	 ;<SETG DO-WINDOW <>>
	 <SPLIT 1>
	 <SCREEN ,S-WINDOW>
	 ;<BUFOUT <>>
	 <HLIGHT ,H-INVERSE>
	 <DO-CURSET 1 1>	 
	 ;<ERASE 1> ;"This semi by Jeff"
	 ;<PRINT-SPACES <LOWCORE SCRH>>
	 <PRINT-SPACES ,WIDTH>
	 <COND (<G? ,WIDTH 75>
		<DO-CURSET 1 48 ;53>
		<TELL "Spielstand:">
		<DO-CURSET 1 66>
		<TELL "Z%ugen:">)> ;"ren: JEFF - if Zuegen printed then needs"
	 ;<BUFOUT T>               ;"to start one char to left, 65"
	 <HLIGHT ,H-NORMAL>
	 <SCREEN ,S-TEXT>
	 <RTRUE>>

<CONSTANT SL-TABLE:TABLE <ITABLE NONE 80>>	"status line constructed here"
<GLOBAL OHERE:OBJECT <>>
<GLOBAL OLD-LEN:NUMBER 0>

;<GLOBAL MIDSCREEN:NUMBER 0>

<ROUTINE UPDATE-STATUS-LINE ()
	 <SCREEN ,S-WINDOW>
	 ;<BUFOUT <>>
	 <HLIGHT ,H-NORMAL>
	 <HLIGHT ,H-INVERSE>
	 <COND (<NOT <EQUAL? ,HERE ,OHERE>>
		<SETG OHERE ,HERE>
		; <DIROUT ,D-SCREEN-OFF>	        ; "Screen off."
		  <DIROUT ,D-TABLE-ON ,SL-TABLE>  ; "Table on."
		  <SAY-HERE>
		  <DIROUT ,D-TABLE-OFF> 	        ; "Table off."
		  ; <DIROUT ,D-SCREEN-ON>		; "Screen on."
		    <DO-CURSET 1 2>
		    <PRINT-SPACES ,OLD-LEN>  ; "Erase old HERE desc"
		    <SETG OLD-LEN <GET ,SL-TABLE 0>> ; "Print new HERE desc."
		    <DO-CURSET 1 2>
		    <SAY-HERE>)>
	 <COND (<G? ,WIDTH 78>
		;"in case score g%os down, move 1 col. to left and print space"
		<DO-CURSET 1 ;59 60>
		<TELL N ,SCORE " ">
		<DO-CURSET 1 73>
		<TELL N ,MOVES>)
	       (T
		<DIROUT ,D-TABLE-ON ,SL-TABLE>
		<TELL N ,SCORE "/" N ,MOVES>
		<DIROUT ,D-TABLE-OFF>
		;"in case score g%os down, one col. to left and print space"
		<DO-CURSET 1 <- ,WIDTH <+ <GET ,SL-TABLE 0> 2 ;1>>>
		<TELL " " N ,SCORE "/" N ,MOVES>)>
	 <HLIGHT ,H-NORMAL>
	 <SCREEN ,S-TEXT>  ;"Back to main screen."
	 <RTRUE>>

<ROUTINE PRINT-SPACES (N) 
	 <REPEAT ()
		 <COND (<L? <SET N <- .N 1>> 0>
			<RTRUE>)
		       (T
			<TELL !\ >)>>
	 <RTRUE>>

<ROUTINE SAY-HERE ()
	 <COND (<ZERO? ,LIT?>
		<TELL "Dunkelheit">)
	       (T
		<TELL D ,HERE>
	        <COND (<AND <G? ,WIDTH 75>
			    <NOT <IN? ,ADVENTURER ,HERE>>>
		       <TELL ", in " DER-DAT <LOC ,ADVENTURER>>)>)>
	 <RTRUE>>