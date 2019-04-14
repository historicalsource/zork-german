

	.FUNCT	WEST-HOUSE:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du stehst auf freiem Feld westlich von einem wei%sen Haus, dessen Haust%ur mit Brettern vernagelt ist."
	ZERO?	WON-FLAG /?CND4
	PRINTR	" Ein Geheimpfad f%uhrt nach S%udwesten in den Wald."
?CND4:	CRLF	
	RTRUE	


	.FUNCT	EAST-HOUSE:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du bist hinter dem wei%sen Haus. Nach Osten f%uhrt in Pfad in den Wald. An einem Ende der Hauswand befindet sich ein kleines Fenster, das"
	FSET?	KITCHEN-WINDOW,OPENBIT \?CCL6
	PRINTR	" offen ist."
?CCL6:	PRINTR	" einen Spalt offen steht."


	.FUNCT	OPEN-CLOSE:ANY:3:3,OBJ,STROPN,STRCLS
	EQUAL?	PRSA,V?OPEN \?CCL3
	FSET?	OBJ,OPENBIT \?CCL6
	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	JUMP	?CND4
?CCL6:	PRINT	STROPN
	FSET	OBJ,OPENBIT
?CND4:	CRLF	
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?CLOSE \FALSE
	FSET?	OBJ,OPENBIT \?CCL11
	PRINT	STRCLS
	FCLEAR	OBJ,OPENBIT
	JUMP	?CND9
?CCL11:	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
?CND9:	CRLF	
	RTRUE	


	.FUNCT	BOARD-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE,V?TAKE \FALSE
	PRINTR	"Die Bretter sind fest angenagelt."


	.FUNCT	TEETH-F:ANY:0:0
	EQUAL?	PRSA,V?BRUSH \FALSE
	EQUAL?	PRSO,TEETH \FALSE
	EQUAL?	PRSI,PUTTY \?CCL8
	IN?	PRSI,WINNER \?CCL8
	CALL2	JIGS-UP,STR?227
	RSTACK	
?CCL8:	ZERO?	PRSI \?CCL12
	PRINTR	"Zahnpflege ist h%ochst empfehlenswert, aber es ist nicht klar, mit was du sie putzen willst."
?CCL12:	PRINTI	"Eine charmante Idee, aber mit "
	ICALL2	EIN-DAT-PRINT,PRSI
	PRINTR	"?"


	.FUNCT	SONGBIRD-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE,V?FIND \?CCL3
	PRINTR	"Der Singvogel ist nicht hier, aber er ist wahrscheinlich in der N%ahe."
?CCL3:	EQUAL?	PRSA,V?LISTEN \?CCL5
	PRINTR	"Jetzt kannst du den Singvogel nicht h%oren."
?CCL5:	EQUAL?	PRSA,V?FOLLOW \?CCL7
	PRINTR	"Man kann ihm nicht folgen."
?CCL7:	PRINTR	"Hier kannst du keinen Singvogel sehen."


	.FUNCT	WHITE-HOUSE-F:ANY:0:0
	EQUAL?	HERE,KITCHEN,LIVING-ROOM,ATTIC \?CCL3
	EQUAL?	PRSA,V?FIND \?CCL6
	PRINTR	"Warum gehst du nicht auf die Suche nach deinem Verstand."
?CCL6:	EQUAL?	PRSA,V?WALK-AROUND \FALSE
	ICALL2	GO-NEXT,IN-HOUSE-AROUND
	RTRUE	
?CCL3:	EQUAL?	HERE,EAST-OF-HOUSE,WEST-OF-HOUSE /?CCL10
	EQUAL?	HERE,NORTH-OF-HOUSE,SOUTH-OF-HOUSE /?CCL10
	EQUAL?	PRSA,V?FIND \?CCL15
	EQUAL?	HERE,CLEARING \?CCL18
	PRINTR	"Es scheint im Westen zu sein."
?CCL18:	PRINTR	"Vor einer Minute war es noch hier..."
?CCL15:	PRINTR	"Du bist nicht beim Haus."
?CCL10:	EQUAL?	PRSA,V?FIND \?CCL20
	PRINTR	"Es steht doch gleich hier! Bist du blind, oder was?"
?CCL20:	EQUAL?	PRSA,V?WALK-AROUND \?CCL22
	ICALL2	GO-NEXT,HOUSE-AROUND
	RTRUE	
?CCL22:	EQUAL?	PRSA,V?EXAMINE \?CCL24
	PRINTR	"Das Haus ist ein sch%ones altes Herrenhaus, das wei%s verputzt ist. Man sieht, da%s die Besitzer enorm reich gewesen sein mu%sten."
?CCL24:	EQUAL?	PRSA,V?OPEN,V?THROUGH \?CCL26
	EQUAL?	HERE,EAST-OF-HOUSE \?CCL29
	FSET?	KITCHEN-WINDOW,OPENBIT \?CCL32
	CALL2	GOTO,KITCHEN
	RSTACK	
?CCL32:	PRINTI	"Das Fenster ist geschlossen."
	CRLF	
	CALL2	THIS-IS-IT,KITCHEN-WINDOW
	RSTACK	
?CCL29:	PRINTR	"Es ist nicht offensichtlich, wie du von hier reinkommst."
?CCL26:	EQUAL?	PRSA,V?BURN \FALSE
	PRINTR	"Das kann doch nicht dein Ernst sein."


	.FUNCT	GO-NEXT:ANY:1:1,TBL,VAL
	CALL	LKP,HERE,TBL >VAL
	ZERO?	VAL /FALSE
	CALL2	GOTO,VAL
	ZERO?	STACK \TRUE
	RETURN	2


	.FUNCT	FOREST-F:ANY:0:0
	EQUAL?	PRSA,V?WALK-AROUND \?CCL3
	EQUAL?	HERE,WEST-OF-HOUSE,NORTH-OF-HOUSE,SOUTH-OF-HOUSE /?CCL5
	EQUAL?	HERE,EAST-OF-HOUSE \?CND4
?CCL5:	PRINTI	"Du bist noch nicht einmal im Wald."
	CRLF	
?CND4:	CALL2	GO-NEXT,FOREST-AROUND
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?DISEMBARK \?CCL9
	PRINTR	"Du mu%st eine Richtung angeben."
?CCL9:	EQUAL?	PRSA,V?FIND \?CCL11
	PRINTR	"Du kannst den Wald vor lauter B%aumen nicht sehen."
?CCL11:	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"Die Tannen und Fichten scheinen zu murmeln."


	.FUNCT	MOUNTAIN-RANGE-F:ANY:0:0
	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-DOWN,V?CLIMB-UP \FALSE
	PRINTR	"Willst du mir nicht glauben? Die Berge sind nicht un%uberwindlich."


	.FUNCT	WATER-F:ANY:0:0,AV,W,PI?
	EQUAL?	PRSA,V?SGIVE /FALSE
	EQUAL?	PRSA,V?BOARD,V?THROUGH \?CCL5
	CALL2	PICK-ONE,SWIMYUKS
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?FILL \?CCL7
	SET	'W,PRSI
	SET	'PRSA,V?PUT
	SET	'PRSI,PRSO
	SET	'PRSO,W
	SET	'PI?,FALSE-VALUE
	JUMP	?CND1
?CCL7:	EQUAL?	PRSO,GLOBAL-WATER /?CTR8
	EQUAL?	PRSO,WATER \?CCL9
?CTR8:	SET	'W,PRSO
	SET	'PI?,FALSE-VALUE
	JUMP	?CND1
?CCL9:	SET	'W,PRSI
	ZERO?	W /?CND1
	SET	'PI?,TRUE-VALUE
?CND1:	EQUAL?	W,GLOBAL-WATER \?CND14
	SET	'W,WATER
	EQUAL?	PRSA,V?PUT,V?TAKE \?CND14
	ICALL2	REMOVE-CAREFULLY,W
?CND14:	ZERO?	PI? /?CCL20
	SET	'PRSI,W
	JUMP	?CND18
?CCL20:	SET	'PRSO,W
?CND18:	LOC	WINNER >AV
	FSET?	AV,VEHBIT /?CND21
	SET	'AV,FALSE-VALUE
?CND21:	EQUAL?	PRSA,V?PUT,V?TAKE \?CCL25
	ZERO?	PI? \?CCL25
	ZERO?	AV /?CCL30
	EQUAL?	AV,PRSI /?CTR29
	ZERO?	PRSI \?CCL30
	IN?	W,AV /?CCL30
?CTR29:	PRINTI	"Es gibt jetzt eine Pf%utze am Boden von "
	ICALL2	DER-DAT-PRINT,AV
	PRINTC	46
	CRLF	
	ICALL2	REMOVE-CAREFULLY,PRSO
	MOVE	PRSO,AV
	RTRUE	
?CCL30:	ZERO?	PRSI /?CCL38
	EQUAL?	PRSI,BOTTLE /?CCL38
	PRINTI	"Das Wasser rinnt aus "
	ICALL2	DER-DAT-PRINT,PRSI
	PRINTI	" und verdampft sofort."
	CALL2	REMOVE-CAREFULLY,W
	RSTACK	
?CCL38:	IN?	BOTTLE,WINNER \?CCL42
	FSET?	BOTTLE,OPENBIT /?CCL45
	PRINTI	"Die Flasche ist zu."
	CRLF	
	CALL2	THIS-IS-IT,BOTTLE
	RSTACK	
?CCL45:	FIRST?	BOTTLE /?CCL47
	MOVE	WATER,BOTTLE
	PRINTR	"Die Flasche ist jetzt voll Wasser."
?CCL47:	PRINTR	"Das Wasser rinnt dir durch die Finger."
?CCL42:	IN?	PRSO,BOTTLE \?CCL49
	EQUAL?	PRSA,V?TAKE \?CCL49
	ZERO?	PRSI \?CCL49
	PRINTR	"Es ist in der Flasche. Vielleicht solltest du das statt dessen nehmen."
?CCL49:	PRINTR	"Das Wasser rinnt dir durch die Finger."
?CCL25:	ZERO?	PI? /?CCL54
	EQUAL?	PRSA,V?PUT \?CCL57
	CALL	GLOBAL-IN?,RIVER,HERE
	ZERO?	STACK /?CCL57
	ICALL	PERFORM,V?PUT,PRSO,RIVER
	RTRUE	
?CCL57:	PRINTR	"Nice try."
?CCL54:	EQUAL?	PRSA,V?GIVE,V?DROP \?CCL61
	EQUAL?	PRSA,V?DROP \?CND62
	IN?	WATER,BOTTLE \?CND62
	FSET?	BOTTLE,OPENBIT /?CND62
	PRINTR	"Die Flasche ist zu."
?CND62:	ICALL2	REMOVE-CAREFULLY,WATER
	ZERO?	AV /?CCL69
	PRINTI	"Es gibt jetzt eine Pf%utze am Boden von "
	ICALL2	DER-DAT-PRINT,AV
	PRINTC	46
	CRLF	
	MOVE	WATER,AV
	RTRUE	
?CCL69:	PRINTI	"Das Wasser ist auf dem Boden versch%uttet und verdampft sofort."
	CRLF	
	CALL2	REMOVE-CAREFULLY,WATER
	RSTACK	
?CCL61:	EQUAL?	PRSA,V?THROW \FALSE
	PRINTI	"Das Wasser spritzt auf die W%ande und verdampft sofort."
	CRLF	
	CALL2	REMOVE-CAREFULLY,WATER
	RSTACK	


	.FUNCT	KITCHEN-WINDOW-F:ANY:0:0
	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL3
	SET	'KITCHEN-WINDOW-FLAG,TRUE-VALUE
	CALL	OPEN-CLOSE,KITCHEN-WINDOW,STR?228,STR?229
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL5
	ZERO?	KITCHEN-WINDOW-FLAG \?CCL5
	PRINTR	"Das Fenster ist einen Spalt offen, aber nicht genug, um Eintritt zu gew%ahren. "
?CCL5:	EQUAL?	PRSA,V?THROUGH,V?BOARD,V?WALK \?CCL9
	EQUAL?	HERE,KITCHEN \?CCL12
	ICALL2	DO-WALK,P?OST
	RTRUE	
?CCL12:	ICALL2	DO-WALK,P?WEST
	RTRUE	
?CCL9:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	EQUAL?	HERE,KITCHEN \?CCL17
	PRINTR	"Du kannst einen Kahlschlag sehen, der nach dem Wald f%uhrt."
?CCL17:	PRINTR	"Du kannst einen Raum sehen, der aussieht wie eine K%uche."


	.FUNCT	GHOSTS-F:ANY:0:0
	EQUAL?	PRSA,V?TELL \?CCL3
	PRINTI	"Die Geister johlen laut und beachten dich nicht."
	CRLF	
	SET	'P-CONT,FALSE-VALUE
	RETURN	P-CONT
?CCL3:	EQUAL?	PRSA,V?EXORCISE \?CCL5
	PRINTR	"Nur das Zeremoniell hinterl%a%st einen Eindruck."
?CCL5:	EQUAL?	PRSA,V?MUNG,V?ATTACK \?CCL7
	EQUAL?	PRSO,GHOSTS \?CCL7
	PRINTR	"Wie kannst du einen Geist mit f%ur Menschen bestimmten Waffen angreifen?"
?CCL7:	PRINTR	"Es scheint dir unm%oglich mit diesen Geistern zu kommunizieren."


	.FUNCT	BASKET-F:ANY:0:0
	EQUAL?	PRSA,V?RAISE /?CTR2
	EQUAL?	PRSA,V?MOVE \?CCL3
	ZERO?	CAGE-TOP \?CCL3
?CTR2:	ZERO?	CAGE-TOP /?CCL10
	EQUAL?	PRSA,V?MOVE /?CCL10
	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL10:	MOVE	RAISED-BASKET,SHAFT-ROOM
	MOVE	LOWERED-BASKET,LOWER-SHAFT
	SET	'CAGE-TOP,TRUE-VALUE
	ICALL2	THIS-IS-IT,RAISED-BASKET
	PRINTR	"Der Korb ist zum oberen Ende des Schachts hinaufgezogen."
?CCL3:	EQUAL?	PRSA,V?LOWER /?CTR13
	EQUAL?	PRSA,V?MOVE \?CCL14
	ZERO?	CAGE-TOP /?CCL14
?CTR13:	ZERO?	CAGE-TOP \?CCL21
	EQUAL?	PRSA,V?MOVE /?CCL21
	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL21:	MOVE	RAISED-BASKET,LOWER-SHAFT
	MOVE	LOWERED-BASKET,SHAFT-ROOM
	ICALL2	THIS-IS-IT,LOWERED-BASKET
	PRINTI	"Der Korb ist zum unteren Ende des Schacht hinabgelassen."
	CRLF	
	SET	'CAGE-TOP,FALSE-VALUE
	ZERO?	LIT /TRUE
	CALL2	LIT?,HERE >LIT
	ZERO?	LIT \TRUE
	PRINTR	"Es ist jetzt stockdunkel."
?CCL14:	EQUAL?	PRSO,LOWERED-BASKET /?CTR28
	EQUAL?	PRSI,LOWERED-BASKET \?CCL29
?CTR28:	PRINTR	"Der Korb ist am anderen Ende der Kette."
?CCL29:	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,RAISED-BASKET,LOWERED-BASKET \FALSE
	PRINTR	"Der K%afig ist fest an der Kette angebracht."


	.FUNCT	BAT-F:ANY:0:0
	EQUAL?	PRSA,V?TELL \?CCL3
	ICALL2	FWEEP,6
	SET	'P-CONT,FALSE-VALUE
	RETURN	P-CONT
?CCL3:	EQUAL?	PRSA,V?MUNG,V?ATTACK,V?TAKE \FALSE
	LOC	GARLIC
	EQUAL?	STACK,WINNER,HERE \?CCL8
	PRINTR	"Die kannst du nicht erreichen, die h%angt von der Decke."
?CCL8:	CALL1	FLY-ME
	RSTACK	


	.FUNCT	FLY-ME:ANY:0:0
	ICALL2	FWEEP,4
	PRINTI	"Die Fledermaus ergreift dich am Kragen und hebt dich hoch....."
	CRLF	
	CRLF	
	CALL2	PICK-ONE,BAT-DROPS
	ICALL	GOTO,STACK,FALSE-VALUE
	EQUAL?	HERE,ENTRANCE-TO-HADES /TRUE
	ICALL1	V-FIRST-LOOK
	RTRUE	


	.FUNCT	FWEEP:ANY:1:1,N
?PRG1:	DLESS?	'N,1 /?REP2
	PRINTI	"    Huiiiiii!"
	CRLF	
	JUMP	?PRG1
?REP2:	CRLF	
	RTRUE	


	.FUNCT	BELL-F:ANY:0:0
	EQUAL?	PRSA,V?RING \FALSE
	EQUAL?	HERE,LLD-ROOM \?CCL6
	ZERO?	LLD-FLAG /FALSE
?CCL6:	PRINTR	"Bim, bam."


	.FUNCT	HOT-BELL-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	PRINTR	"Die Glocke ist sehr hei%s und kann nicht angefa%st werden."
?CCL3:	EQUAL?	PRSA,V?RUB /?CTR4
	EQUAL?	PRSA,V?RING \?CCL5
	ZERO?	PRSI /?CCL5
?CTR4:	EQUAL?	PRSA,V?RUB \?CND10
	ZERO?	PRSI \?CND10
	SET	'PRSI,HANDS
?CND10:	FSET?	PRSI,BURNBIT \?CCL16
	ICALL2	DER-NOM-CAP-PRINT,PRSI
	PRINTI	" f%angt Feuer und verbrennt."
	CRLF	
	CALL2	REMOVE-CAREFULLY,PRSI
	RSTACK	
?CCL16:	EQUAL?	PRSI,HANDS \?CCL18
	PRINTR	"Die Glocke ist zu hei%s zum Anfassen."
?CCL18:	PRINTR	"Die Hitze, die die Glocke ausstr%omt ist zu stark."
?CCL5:	EQUAL?	PRSA,V?POUR-ON \?CCL20
	ICALL2	REMOVE-CAREFULLY,PRSO
	PRINTI	"Das Wasser k%uhlt die Glocke und verdampft."
	CRLF	
	CALL	QUEUE,I-XBH,0
	PUT	STACK,0,1
	CALL1	I-XBH
	RSTACK	
?CCL20:	EQUAL?	PRSA,V?RING \FALSE
	PRINTR	"Die Glocke ist zu hei%s, um dranzufassen."


	.FUNCT	BOARDED-WINDOW-FCN:ANY:0:0
	EQUAL?	PRSA,V?OPEN \?CCL3
	PRINTR	"Die Fenster sind vernagelt und lassen sich nicht %offnen."
?CCL3:	EQUAL?	PRSA,V?MUNG \FALSE
	PRINTR	"Du kannst die Fenster nicht zerschlagen, um sie zu %offnen."


	.FUNCT	NAILS-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTR	"Die N%agel, die tief in der T%ur eingebettet sind, k%onnen nicht entfernt werden."


	.FUNCT	CRACK-FCN:ANY:0:0
	EQUAL?	PRSA,V?THROUGH \FALSE
	PRINTR	"Du kannst durch diese Spalte nicht durch."


	.FUNCT	KITCHEN-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Du bist in der K%uche des wei%sen Hauses. Ein Tisch mu%s vor Kurzem zur Bereitung einer Mahlzeit benutzt worden sein. Ein Durchgang f%uhrt nach Westen, und man kann eine dunkle Treppe sehen, die nach oben f%uhrt. Ein dunkler Kamin f%uhrt nach unten. Nach Osten ist ein kleines Fenster, das"
	FSET?	KITCHEN-WINDOW,OPENBIT \?CCL6
	PRINTR	" offen ist."
?CCL6:	PRINTR	" einen Spalt offen steht."
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?CLIMB-UP \?CCL11
	EQUAL?	PRSO,STAIRS \?CCL11
	CALL2	DO-WALK,P?RAUF
	RSTACK	
?CCL11:	EQUAL?	PRSA,V?CLIMB-UP \FALSE
	EQUAL?	PRSO,STAIRS \FALSE
	PRINTR	"Es gibt keine Treppe nach unten."


	.FUNCT	STONE-BARROW-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?ENTER /?CCL3
	EQUAL?	PRSA,V?WALK \?PRD8
	EQUAL?	PRSO,P?WEST,P?HINEIN /?CCL3
?PRD8:	EQUAL?	PRSA,V?THROUGH \FALSE
	EQUAL?	PRSO,BARROW \FALSE
?CCL3:	PRINTI	"In dem H%ugelgrab
Wenn du das H%ugelgrab betrittst, schlie%st sich die T%ur f%ur immer hinter dir. Um dich herum ist es finster, aber vor dir ist eine enorme %Offnung, die hell erleuchtet ist. Durch ihr Mitte flie%st ein breiter Strom. %Uber den Strom spannt sich eine h%olzerne Fu%sg%angerbr%ucke. In der Luft schwebt ein gro%ses Schild. Darauf steht: Ihr alle, die ihr vor dieser Br%ucke steht, habt ein gro%ses und beschwerliches Abenteuer hinter euch, das eure Intelligenz und euren Mut gepr%uft hat. Ihr habt den ersten Teil der drei Zorkspiele geschafft. Diejenigen, die %uber diese Br%ucke schreiten m%ussen bereit sein ein noch gr%o%seres Abenteuer zu erleben, das eure Leistung und Tapferkeit ernstlich pr%ufen wird!"
	CRLF	
	CRLF	
	PRINTI	"Das dreiteilige ZORKspiel geht weiter mit %>ZORK II: Der Hexenmeister von Frobozz%< und endet mit %>ZORK III: Der Kerkermeister%<."
	CALL1	FINISH
	RSTACK	


	.FUNCT	BARROW-DOOR-FCN:ANY:0:0
	EQUAL?	PRSA,V?CLOSE,V?OPEN \FALSE
	PRINTR	"Die T%ur ist zu schwer."


	.FUNCT	BARROW-FCN:ANY:0:0
	EQUAL?	PRSA,V?THROUGH \FALSE
	CALL2	DO-WALK,P?WEST
	RSTACK	


	.FUNCT	TROPHY-CASE-FCN:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,TROPHY-CASE \FALSE
	PRINTR	"Der Troph%aenschrank ist unverr%uckbar an der Wand befestigt."


	.FUNCT	LIVING-ROOM-FCN:ANY:1:1,RARG,RUG?,TC
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Du bist im Wohnzimmer. Da sind eine T%ur nach Osten"
	ZERO?	MAGIC-FLAG /?CCL6
	PRINTI	". Nach Westen gibt es eine zyklopenf%ormige %Offnung in einer alten T%ur dar%uber gibt es einige uralte Runen, "
	JUMP	?CND4
?CCL6:	PRINTI	", eine vernagelte Holzt%ur mit fremden Runen, "
?CND4:	PRINTI	"ein Troph%aenschrank, "
	SET	'RUG?,RUG-MOVED
	ZERO?	RUG? /?CCL9
	FSET?	TRAP-DOOR,OPENBIT \?CCL9
	PRINTR	"und ein Teppich liegt neben einer Fallt%ur."
?CCL9:	ZERO?	RUG? /?CCL13
	PRINTR	"und eine geschlossene Fallt%ur bei deinen F%ussen."
?CCL13:	FSET?	TRAP-DOOR,OPENBIT \?CCL15
	PRINTR	"und eine offene Fallt%ur bei deinen F%ussen."
?CCL15:	PRINTR	"und ein Perserteppich in der Mitte."
?CCL3:	EQUAL?	RARG,M-END \FALSE
	EQUAL?	PRSA,V?TAKE /?CCL20
	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,TROPHY-CASE \FALSE
?CCL20:	IN?	PRSO,TROPHY-CASE \?CND25
	ICALL2	TOUCH-ALL,PRSO
?CND25:	CALL1	OTVAL-FROB
	ADD	BASE-SCORE,STACK >SCORE
	ICALL2	SCORE-UPD,0
	RFALSE	


	.FUNCT	TOUCH-ALL:ANY:1:1,OBJ,F
	FIRST?	OBJ >F /?PRG2
?PRG2:	ZERO?	F /TRUE
	FSET	F,TOUCHBIT
	FIRST?	F \?CND4
	ICALL2	TOUCH-ALL,F
?CND4:	NEXT?	F >F /?PRG2
	JUMP	?PRG2


	.FUNCT	OTVAL-FROB:ANY:0:1,O,F,SCORE
	ASSIGNED?	'O /?CND1
	SET	'O,TROPHY-CASE
?CND1:	FIRST?	O >F /?PRG4
?PRG4:	ZERO?	F \?CND6
	RETURN	SCORE
?CND6:	GETP	F,P?TVALUE
	ADD	SCORE,STACK >SCORE
	FIRST?	F \?CND8
	ICALL2	OTVAL-FROB,F
?CND8:	NEXT?	F >F /?PRG4
	JUMP	?PRG4


	.FUNCT	TRAP-DOOR-FCN:ANY:0:0
	EQUAL?	PRSA,V?RAISE \?CCL3
	ICALL	PERFORM,V?OPEN,TRAP-DOOR
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL5
	EQUAL?	HERE,LIVING-ROOM \?CCL5
	CALL	OPEN-CLOSE,PRSO,STR?230,STR?231
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?LOOK-UNDER \?CCL9
	EQUAL?	HERE,LIVING-ROOM \?CCL9
	FSET?	TRAP-DOOR,OPENBIT \?CCL14
	PRINTR	"Du siehst eine wackelige Treppe, die in die Dunkelheit f%uhrt."
?CCL14:	PRINTR	"Sie ist geschlossen."
?CCL9:	EQUAL?	HERE,CELLAR \FALSE
	EQUAL?	PRSA,V?UNLOCK,V?OPEN \?CCL19
	FSET?	TRAP-DOOR,OPENBIT /?CCL19
	PRINTR	"Die T%ur ist von oben abgeschlossen."
?CCL19:	EQUAL?	PRSA,V?CLOSE \?CCL23
	FSET?	TRAP-DOOR,OPENBIT /?CCL23
	FCLEAR	TRAP-DOOR,TOUCHBIT
	FCLEAR	TRAP-DOOR,OPENBIT
	PRINTR	"Die T%ur geht zu und und verschlie%st sich."
?CCL23:	EQUAL?	PRSA,V?CLOSE,V?OPEN \FALSE
	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	CELLAR-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"Du bist in einem dunklen und muffigen Keller mit einem schmalen Durchgang nach Norden und einem niedrigen Tunnel nach S%uden. Im Westen ist das Ende einer steilen Metallrampe, die nicht erklimmbar ist."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	FSET?	TRAP-DOOR,OPENBIT \FALSE
	FSET?	TRAP-DOOR,TOUCHBIT /FALSE
	FCLEAR	TRAP-DOOR,OPENBIT
	FSET	TRAP-DOOR,TOUCHBIT
	PRINTI	"Die Fallt%ur kracht zu, und du h%orst, da%s jemand sie verriegelt."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	CHIMNEY-F:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"Der Kamin geht nach "
	EQUAL?	HERE,KITCHEN \?CCL6
	PRINTI	"unten"
	JUMP	?CND4
?CCL6:	PRINTI	"oben"
?CND4:	PRINTR	" und sieht erklimmbar aus."


	.FUNCT	UP-CHIMNEY-FUNCTION:ANY:0:0,F
	FIRST?	WINNER >F /?CCL3
	PRINTI	"Mit leeren H%anden nach oben gehen ist keine gute Idee."
	CRLF	
	RFALSE	
?CCL3:	NEXT?	F >F \?PRD7
	NEXT?	F /?CCL5
?PRD7:	IN?	LAMP,WINNER \?CCL5
	FSET?	TRAP-DOOR,OPENBIT /?CND10
	FCLEAR	TRAP-DOOR,TOUCHBIT
?CND10:	RETURN	KITCHEN
?CCL5:	PRINTI	"Mit dem, was du da schleppst, kannst du da nicht hinauf."
	CRLF	
	RFALSE	


	.FUNCT	TRAP-DOOR-EXIT:ANY:0:0
	ZERO?	RUG-MOVED /?CCL3
	FSET?	TRAP-DOOR,OPENBIT \?CCL6
	RETURN	CELLAR
?CCL6:	PRINTI	"Die Fallt%ur ist geschlossen."
	CRLF	
	ICALL2	THIS-IS-IT,TRAP-DOOR
	RFALSE	
?CCL3:	PRINTI	"You can't go that way."
	CRLF	
	RFALSE	


	.FUNCT	RUG-FCN:ANY:0:0
	EQUAL?	PRSA,V?RAISE \?CCL3
	PRINTI	"Der Teppich ist zu schwer, um ihn aufzuheben"
	ZERO?	RUG-MOVED /?CCL6
	PRINTR	"."
?CCL6:	PRINTR	", aber beim Versuchen hast du gemerkt, da%s darunter eine Unebenheit ist."
?CCL3:	EQUAL?	PRSA,V?PUSH,V?MOVE \?CCL8
	ZERO?	RUG-MOVED /?CCL11
	PRINTR	"Nachdem du vorher den Teppich weggezogen hast, findest du es jetzt unm%oglich ihn zur%uckzuziehen."
?CCL11:	PRINTI	"Mit gr%o%ster Anstrengung ist der Teppich aus dem Weg gezerrt. Die staubige Oberfl%ache einer geschlossenen Fallt%ure kommt zum Vorschein."
	CRLF	
	FCLEAR	TRAP-DOOR,INVISIBLE
	ICALL2	THIS-IS-IT,TRAP-DOOR
	SET	'RUG-MOVED,TRUE-VALUE
	RETURN	RUG-MOVED
?CCL8:	EQUAL?	PRSA,V?TAKE \?CCL13
	PRINTR	"Der Teppich ist %au%serst schwer und man kann ihn nicht tragen."
?CCL13:	EQUAL?	PRSA,V?LOOK-UNDER \?CCL15
	ZERO?	RUG-MOVED \?CCL15
	FSET?	TRAP-DOOR,OPENBIT /?CCL15
	PRINTR	"Unter dem Teppich ist eine geschlossene Fallt%ur. Wenn du den Teppich losl%a%st, ist die Fallt%ur wieder versteckt."
?CCL15:	EQUAL?	PRSA,V?CLIMB-ON \FALSE
	ZERO?	RUG-MOVED \?CCL23
	FSET?	TRAP-DOOR,OPENBIT /?CCL23
	PRINTR	"W%ahrend du da sitzt bemerkst du eine Unebenheit darunter. Um nicht unbequem zu sitzen, stehst du wieder auf."
?CCL23:	PRINTR	"Ich nehme an, da%s du denkst, es w%are ein fliegender Teppich?"


	.FUNCT	AXE-F:ANY:0:0
	ZERO?	TROLL-FLAG \FALSE
	CALL	WEAPON-FUNCTION,AXE,TROLL
	RSTACK	


	.FUNCT	STILETTO-FUNCTION:ANY:0:0
	CALL	WEAPON-FUNCTION,STILETTO,THIEF
	RSTACK	


	.FUNCT	WEAPON-FUNCTION:ANY:2:2,W,V
	IN?	V,HERE \FALSE
	EQUAL?	PRSA,V?TAKE \FALSE
	IN?	W,V /TRUE
	ICALL2	DER-NOM-CAP-PRINT,W
	PRINTR	" scheint gl%uhend hei%s. Du kannst es nicht in der Hand halten."


	.FUNCT	TROLL-FCN:ANY:0:1,MODE
	EQUAL?	PRSA,V?TELL \?CCL3
	SET	'P-CONT,FALSE-VALUE
	PRINTR	"Der Troll ist nicht der ideale Gespr%achspartner."
?CCL3:	EQUAL?	MODE,F-BUSY? \?CCL5
	IN?	AXE,TROLL /FALSE
	IN?	AXE,HERE \?CCL10
	CALL2	ZPROB,75
	ZERO?	STACK /?CCL10
	FSET	AXE,NDESCBIT
	FCLEAR	AXE,WEAPONBIT
	MOVE	AXE,TROLL
	PUTP	TROLL,P?LDESC,STR?73
	IN?	TROLL,HERE \TRUE
	PRINTR	"Der Troll holt sich seine Waffe zur%uck. Er ist b%ose und besch%amt. Er scheint sich mit dir an binden zu wollen."
?CCL10:	IN?	TROLL,HERE \FALSE
	PUTP	TROLL,P?LDESC,STR?232
	PRINTR	"Der jetzt entwaffnete Troll kriecht vor Furcht in die Ecke und bittet mit heiserer Trollstimme um sein Leben."
?CCL5:	EQUAL?	MODE,F-DEAD \?CCL19
	IN?	AXE,TROLL \?CND20
	MOVE	AXE,HERE
	FCLEAR	AXE,NDESCBIT
	FSET	AXE,WEAPONBIT
?CND20:	SET	'TROLL-FLAG,TRUE-VALUE
	RETURN	TROLL-FLAG
?CCL19:	EQUAL?	MODE,F-UNCONSCIOUS \?CCL23
	FCLEAR	TROLL,FIGHTBIT
	IN?	AXE,TROLL \?CND24
	MOVE	AXE,HERE
	FCLEAR	AXE,NDESCBIT
	FSET	AXE,WEAPONBIT
?CND24:	PUTP	TROLL,P?LDESC,STR?233
	SET	'TROLL-FLAG,TRUE-VALUE
	RETURN	TROLL-FLAG
?CCL23:	EQUAL?	MODE,F-CONSCIOUS \?CCL27
	IN?	TROLL,HERE \?CND28
	FSET	TROLL,FIGHTBIT
	PRINTI	"Der Troll r%uhrt sich und nimmt schnell eine Kampfstellung ein."
	CRLF	
?CND28:	IN?	AXE,TROLL \?CCL32
	PUTP	TROLL,P?LDESC,STR?73
	JUMP	?CND30
?CCL32:	IN?	AXE,TROLL-ROOM \?CCL34
	FSET	AXE,NDESCBIT
	FCLEAR	AXE,WEAPONBIT
	MOVE	AXE,TROLL
	PUTP	TROLL,P?LDESC,STR?73
	JUMP	?CND30
?CCL34:	PUTP	TROLL,P?LDESC,STR?234
?CND30:	SET	'TROLL-FLAG,FALSE-VALUE
	RETURN	TROLL-FLAG
?CCL27:	EQUAL?	MODE,F-FIRST? \?CCL36
	RANDOM	100
	GRTR?	33,STACK \FALSE
	FSET	TROLL,FIGHTBIT
	SET	'P-CONT,FALSE-VALUE
	RTRUE	
?CCL36:	ZERO?	MODE \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL44
	GETP	TROLL,P?LDESC
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL44:	EQUAL?	PRSA,V?GIVE,V?THROW \?PRD48
	ZERO?	PRSO /?PRD48
	EQUAL?	PRSI,TROLL /?CTR45
?PRD48:	EQUAL?	PRSA,V?MUNG,V?MOVE,V?TAKE \?CCL46
?CTR45:	ICALL2	AWAKEN,TROLL
	EQUAL?	PRSA,V?GIVE,V?THROW \?CCL54
	EQUAL?	PRSO,AXE \?CCL57
	IN?	AXE,WINNER \?CCL57
	PRINTI	"Der Troll kratzt sich verwirrt am Kopf, dann nimmt er die Axt auf."
	CRLF	
	FSET	TROLL,FIGHTBIT
	MOVE	AXE,TROLL
	RTRUE	
?CCL57:	EQUAL?	PRSO,TROLL,AXE \?CND55
	PRINTI	"Du m%u%stest "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" zuerst holen, aber das scheint unm%oglich."
	RTRUE	
?CND55:	EQUAL?	PRSA,V?THROW \?CCL63
	PRINTI	"Der Troll, der ungemein sportlich ist, f%angt "
	ICALL2	DER-ACC-PRINT,PRSO
	JUMP	?CND61
?CCL63:	PRINTI	"Der Troll, der keinen gro%sen Stolz hat, akzeptiert das Geschenk"
?CND61:	RANDOM	100
	GRTR?	20,STACK \?CCL66
	EQUAL?	PRSO,KNIFE,SWORD,AXE \?CCL66
	ICALL2	REMOVE-CAREFULLY,PRSO
	PRINTI	" und fri%st "
	ICALL2	PRONOUN-ACC-PRINT,PRSO
	PRINTI	" mit Appetit. Armer Troll, er stirbt an einer inneren Blutung und sein Gerippe verschwindet in einem b%osen schwarzen Nebel."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,TROLL
	GETP	TROLL,P?ACTION
	ICALL	STACK,F-DEAD
	SET	'TROLL-FLAG,TRUE-VALUE
	RETURN	TROLL-FLAG
?CCL66:	EQUAL?	PRSO,KNIFE,SWORD,AXE \?CCL70
	MOVE	PRSO,HERE
	PRINTI	" und da er momentan ges%attigt ist, wirft er "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" zur%uck. Gott sei Dank hat der Troll kein Wurftalent und "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" f%allt auf die Erde. Er sieht nicht sehr gl%ucklich aus."
	CRLF	
	FSET	TROLL,FIGHTBIT
	RTRUE	
?CCL70:	PRINTI	" und da er kein gro%ser Feinschmecker ist, fri%st er es gierig."
	CRLF	
	CALL2	REMOVE-CAREFULLY,PRSO
	RSTACK	
?CCL54:	EQUAL?	PRSA,V?MOVE,V?TAKE \?CCL72
	PRINTR	"Der Troll spuckt dir ins Gesicht, zischt in einem recht primitiven Dialekt: %>N%achstes Mal mehr Gl%uck.%<"
?CCL72:	EQUAL?	PRSA,V?MUNG \FALSE
	PRINTR	"Der Troll lacht %uber deine hilflose Geste."
?CCL46:	EQUAL?	PRSA,V?LISTEN \?CCL76
	PRINTR	"Hier und da sagt der Troll mit seiner heiseren Trollstimme etwas, das wohl beleidigend ist."
?CCL76:	ZERO?	TROLL-FLAG /FALSE
	EQUAL?	PRSA,V?HELLO \FALSE
	PRINTR	"Leider kann der Troll dich nicht h%oren."


	.FUNCT	LEAVES-APPEAR:ANY:0:0
	FSET?	GRATE,OPENBIT /FALSE
	ZERO?	GRATE-REVEALED \FALSE
	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL7
	PRINTI	"Beim St%obern im Bl%atterhaufen kommt ein Gitter zum Vorschein."
	CRLF	
	JUMP	?CND5
?CCL7:	PRINTI	"Als die Bl%atter aus dem Weg sind, zeigt sich ein Gitter."
	CRLF	
?CND5:	FCLEAR	GRATE,INVISIBLE
	SET	'GRATE-REVEALED,TRUE-VALUE
	RFALSE	


	.FUNCT	LEAF-PILE:ANY:0:0
	EQUAL?	PRSA,V?COUNT \?CCL3
	PRINTR	"Es gibt hier 69.105 Bl%atter."
?CCL3:	EQUAL?	PRSA,V?BURN \?CCL5
	ICALL1	LEAVES-APPEAR
	ICALL2	REMOVE-CAREFULLY,PRSO
	IN?	PRSO,HERE \?CCL8
	PRINTR	"Die Bl%atter brennen."
?CCL8:	CALL2	JIGS-UP,STR?235
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?CUT \?CCL10
	PRINTI	"Du stocherst in den Bl%attern herum und machst eine beachtliche Schweinerei."
	CRLF	
	ICALL1	LEAVES-APPEAR
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?TAKE,V?MOVE \?CCL12
	EQUAL?	PRSA,V?MOVE \?CND13
	PRINTI	"Geschafft."
	CRLF	
?CND13:	ZERO?	GRATE-REVEALED \FALSE
	ICALL1	LEAVES-APPEAR
	EQUAL?	PRSA,V?TAKE /FALSE
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?LOOK-UNDER \FALSE
	ZERO?	GRATE-REVEALED \FALSE
	PRINTR	"Unter dem Bl%atterhaufen ist ein Gitter. Wenn du die Bl%atter fallen l%a%st, ist das Gitter wieder versteckt."


	.FUNCT	CLEARING-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	ZERO?	GRATE-REVEALED \FALSE
	FSET	GRATE,INVISIBLE
	RTRUE	
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du stehst auf einer Lichtung, und ein Wald umgibt dich von allen Seiten. Ein Pfad f%uhrt nach S%uden."
	FSET?	GRATE,OPENBIT \?CCL11
	CRLF	
	PRINTR	"Da befindet sich ein offenes Gitter, das in die Dunkelheit hinabf%uhrt."
?CCL11:	ZERO?	GRATE-REVEALED /?CND9
	CRLF	
	PRINTR	"Da ist ein Gitter, das Fest im Boden befestigt ist."
?CND9:	CRLF	
	RTRUE	


	.FUNCT	MAZE-11-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	FCLEAR	GRATE,INVISIBLE
	RTRUE	
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du bist in einem kleinen Zimmer bei dem Irrgarten. Es gibt hier in der N%ahe kleine verwirrende G%ange."
	CRLF	
	FSET?	GRATE,OPENBIT \?CCL8
	PRINTR	"%Uber dir ist ein offenes Gitter, durch das Sonnenlicht hereinflutet."
?CCL8:	ZERO?	GRUNLOCK /?CCL10
	PRINTR	"%Uber dir ist ein Gitter."
?CCL10:	PRINTR	"%Uber dir ist ein Gitter, das mit einem Schlo%s, das aus einem Totenkopf und Gebeinen gemacht ist, verschlossen ist."


	.FUNCT	GRATE-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?OPEN \?CCL3
	EQUAL?	PRSI,KEYS \?CCL3
	ICALL	PERFORM,V?UNLOCK,GRATE,KEYS
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?LOCK \?CCL7
	EQUAL?	HERE,GRATING-ROOM \?CCL10
	ZERO?	GRUNLOCK /?CCL13
	PRINTR	"Das Gitter wird verschlossen."
?CCL13:	PRINTR	"Das Gitter ist schon verschlossen."
?CCL10:	EQUAL?	HERE,GRATING-CLEARING \FALSE
	PRINTR	"Du kannst es von innen nicht verschlie%sen."
?CCL7:	EQUAL?	PRSA,V?UNLOCK \?CCL17
	EQUAL?	PRSO,GRATE \?CCL17
	EQUAL?	HERE,GRATING-ROOM \?CCL22
	EQUAL?	PRSI,KEYS \?CCL22
	ZERO?	GRUNLOCK /?CCL27
	PRINTI	"Das Gitter ist schon aufgeschlo%sen."
	CRLF	
	JUMP	?CND25
?CCL27:	PRINTI	"Das Gitter wird aufgeschlo%sen."
	CRLF	
?CND25:	SET	'GRUNLOCK,TRUE-VALUE
	RETURN	GRUNLOCK
?CCL22:	EQUAL?	HERE,GRATING-CLEARING \?CCL29
	EQUAL?	PRSI,KEYS \?CCL29
	PRINTR	"Du kannst das Schlo%s von hier aus nicht erreichen."
?CCL29:	EQUAL?	HERE,GRATING-ROOM \?CCL33
	EQUAL?	PRSI,HANDS \?CCL33
	PRINTR	"You can't unlock it with your hands."
?CCL33:	PRINTI	"Du kannst das Gitter nicht mit "
	ICALL2	DER-DAT-PRINT,PRSI
	PRINTR	" aufschlie%sen?"
?CCL17:	EQUAL?	PRSA,V?PICK \?CCL37
	PRINTR	"Du kannst das Schlo%s nicht knacken."
?CCL37:	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL39
	ZERO?	GRUNLOCK /?CCL42
	EQUAL?	HERE,CLEARING \?CCL45
	PUSH	STR?237
	JUMP	?CND43
?CCL45:	PUSH	STR?238
?CND43:	ICALL	OPEN-CLOSE,GRATE,STACK,STR?236
	FSET?	GRATE,OPENBIT \?CCL48
	EQUAL?	HERE,CLEARING /?CND49
	ZERO?	GRATE-REVEALED \?CND49
	PRINTI	"Ein Haufen Bl%atter f%allt auf deinen Kopf und auf die Erde."
	CRLF	
	SET	'GRATE-REVEALED,TRUE-VALUE
	MOVE	LEAVES,HERE
?CND49:	FSET	GRATING-ROOM,ONBIT
	RTRUE	
?CCL48:	FCLEAR	GRATING-ROOM,ONBIT
	RTRUE	
?CCL42:	PRINTR	"Das Gitter ist verschlo%sen."
?CCL39:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,GRATE \FALSE
	GETP	PRSO,P?SIZE
	GRTR?	STACK,20 \?CCL59
	ICALL2	PRONOUN-NOM-CAP-PRINT,PRSO
	PRINTR	" pa%st nicht durch das Gitter."
?CCL59:	MOVE	PRSO,GRATING-ROOM
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTR	" verschwindet durch das Gitter in die Dunkelheit, die darunter herrscht."


	.FUNCT	MAZE-DIODES:ANY:0:0
	PRINTI	"Wenn dieser Tunnel das n%achste Zimmer erreicht, kannst du ihn nicht mehr als R%uckweg benutzen."
	CRLF	
	CRLF	
	EQUAL?	HERE,MAZE-2 \?CCL3
	RETURN	MAZE-4
?CCL3:	EQUAL?	HERE,MAZE-7 \?CCL5
	RETURN	DEAD-END-1
?CCL5:	EQUAL?	HERE,MAZE-9 \?CCL7
	RETURN	MAZE-11
?CCL7:	EQUAL?	HERE,MAZE-12 \FALSE
	RETURN	MAZE-5


	.FUNCT	RUSTY-KNIFE-FCN:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	IN?	SWORD,WINNER \FALSE
	PRINTI	"Als du das rostige Messer anfa%st, blitzt dein Schwert kurz mit einem einem blendenden blauen Licht auf."
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	PRSI,RUSTY-KNIFE \?PRD10
	EQUAL?	PRSA,V?ATTACK /?CCL8
?PRD10:	EQUAL?	PRSA,V?SWING \FALSE
	EQUAL?	PRSO,RUSTY-KNIFE \FALSE
	ZERO?	PRSI /FALSE
?CCL8:	ICALL2	REMOVE-CAREFULLY,RUSTY-KNIFE
	CALL2	JIGS-UP,STR?239
	RSTACK	


	.FUNCT	KNIFE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	FCLEAR	ATTIC-TABLE,NDESCBIT
	RFALSE	


	.FUNCT	SKELETON:ANY:0:0
	EQUAL?	PRSA,V?MOVE,V?RUB,V?TAKE /?CCL3
	EQUAL?	PRSA,V?LOWER,V?RAISE,V?PUSH /?CCL3
	EQUAL?	PRSA,V?KISS,V?KICK,V?ATTACK \FALSE
?CCL3:	PRINTI	"Ein Geist erscheint in dem Zimmer und ist entsetzt %uber deine Sch%andung der Leiche eines Abenteuererkollegen. Er verflucht deine Wertsachen, und verbannt sie in das Land der lebendigen Toten. Der Geist verschwindet unter einem Schwall von ordin%aren Ausdr%ucken. "
	CRLF	
	ICALL	ROB,HERE,LAND-OF-LIVING-DEAD,100
	ICALL	ROB,ADVENTURER,LAND-OF-LIVING-DEAD
	RTRUE	


	.FUNCT	TORCH-OBJECT:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"Die Fackel brennt."
?CCL3:	EQUAL?	PRSA,V?POUR-ON \?CCL5
	EQUAL?	PRSI,TORCH \?CCL5
	PRINTR	"Das Wasser verdampft bevor es mit der Fackel in Ber%uhrung kommt."
?CCL5:	EQUAL?	PRSA,V?LAMP-OFF \FALSE
	FSET?	PRSO,ONBIT \FALSE
	PRINTR	"Du verbrennst dir beinahe die Hand, als du versuchst, die Flamme zu l%oschen."


	.FUNCT	MIRROR-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du bist in einem viereckigen Zimmer mit hohen Decken. An der S%udwand ist ein riesiger Spiegel, der die ganze Wand einnimmt. Es gibt Ausg%ange an den anderen drei Seiten des Zimmers."
	CRLF	
	ZERO?	MIRROR-MUNG /FALSE
	PRINTR	"Leider ging der Spiegel durch deine Bl%odheit kaputt."


	.FUNCT	MIRROR-MIRROR:ANY:0:0,RM2,L1,L2,N
	SET	'RM2,MIRROR-ROOM-2
	ZERO?	MIRROR-MUNG \?CCL3
	EQUAL?	PRSA,V?RUB \?CCL3
	ZERO?	PRSI /?CND6
	EQUAL?	PRSI,HANDS /?CND6
	PRINTI	"Du f%uhlst ein leichtes Kribbeln, das von "
	ICALL2	DER-ACC-PRINT,PRSI
	PRINTR	" ausgeht."
?CND6:	EQUAL?	HERE,RM2 \?CND10
	SET	'RM2,MIRROR-ROOM-1
?CND10:	FIRST?	HERE >L1 /?BOGUS12
?BOGUS12:	FIRST?	RM2 >L2 /?PRG14
?PRG14:	ZERO?	L1 /?PRG19
	NEXT?	L1 >N /?BOGUS18
?BOGUS18:	MOVE	L1,RM2
	SET	'L1,N
	JUMP	?PRG14
?PRG19:	ZERO?	L2 /?REP20
	NEXT?	L2 >N /?BOGUS23
?BOGUS23:	MOVE	L2,HERE
	SET	'L2,N
	JUMP	?PRG19
?REP20:	ICALL	GOTO,RM2,FALSE-VALUE
	PRINTR	"Ein Grollen ert%ont aus der Tiefe, so da%s der Raum bebt."
?CCL3:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL25
	ZERO?	MIRROR-MUNG /?CCL28
	PRINTR	"Der Spiegel ist in viele Scherben zerbrochen."
?CCL28:	PRINTR	"Eine h%a%sliche Person starrt aus dem Spiegel zur%uck."
?CCL25:	EQUAL?	PRSA,V?TAKE \?CCL30
	PRINTR	"Der Spiegel ist mehrmals so gro%s wie du. Gib's auf!"
?CCL30:	EQUAL?	PRSA,V?ATTACK,V?THROW,V?MUNG \FALSE
	ZERO?	MIRROR-MUNG /?CCL35
	PRINTR	"Hast du denn nicht schon genug Schaden angerichtet?"
?CCL35:	SET	'MIRROR-MUNG,TRUE-VALUE
	SET	'LUCKY,FALSE-VALUE
	PRINTR	"Du hast den Spiegel zerbrochen. Ich hoffe, du hast sieben Jahre Gl%uck zur Hand."


	.FUNCT	TORCH-ROOM-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Dies ist ein gro%ser Raum, in dessen Mitte sich ein kleiner Schacht befindet, der durch den Fu%sboden in die Dunkelheit verschwindet. Nach Westen und Norden gibt es Ausg%ange von diesem Zimmer. %Uber dem Schacht hat man ein Metallgeh%ause gebaut, an dem eine schwere, eiserne Kette befestigt ist. An dem anderen Ende der Kette h%angt ein Korb."
	CRLF	
	ZERO?	DOME-FLAG /FALSE
	PRINTR	"Ein Seil h%angt von dem Gel%ander runter und endet 3 Meter %uber deinem Kopf. "


	.FUNCT	DOME-ROOM-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Du bist am Rand einer gro%sen Kuppel, die die Decke der Raumes darunter formt. Ein h%olzernes Gel%ander, das die Kuppel umgibt, besch%utzt dich vor dem Absturz in einen steilen Abgrund."
	CRLF	
	ZERO?	DOME-FLAG /FALSE
	PRINTR	"Von dem Gel%ander h%angt ein Seil, das etwa 3 Meter %uber dem Boden endet."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	ZERO?	DEAD /?CCL11
	PRINTI	"Wenn du die Kuppel betrittst, f%uhlst du einen starken Sog, wie von einem Wind, der dich %uber das Gel%ander und nach unten rei%st."
	CRLF	
	MOVE	WINNER,TORCH-ROOM
	SET	'OHERE,FALSE-VALUE
	SET	'HERE,TORCH-ROOM
	RTRUE	
?CCL11:	EQUAL?	PRSA,V?LEAP \FALSE
	CALL2	JIGS-UP,STR?240
	RSTACK	


	.FUNCT	LLD-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Du bist au%serhalb eines riesigen Tores mit der Aufschrift:

   Gebt auf jegliche Hoffnung Ihr,
       die Ihr hier eintretet!

Das Tor ist ge%offnet. Gro%se Trostlosigkeit und ein Haufen von zerquetschten K%orpern breitet sich vor dir aus. Tausende von Stimmen, die von einem schrecklichen Schicksal klagen, ert%onen."
	CRLF	
	ZERO?	LLD-FLAG \FALSE
	ZERO?	DEAD \FALSE
	PRINTR	"Der Eintritt durch das Tor ist von b%osen Geistern versperrt, die bei deinem Versuch Eintritt zu gewinnen, nur grinsen."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL10
	EQUAL?	PRSA,V?EXORCISE \?CCL13
	ZERO?	LLD-FLAG \FALSE
	IN?	BELL,WINNER \?CCL19
	IN?	BOOK,WINNER \?CCL19
	IN?	CANDLES,WINNER \?CCL19
	PRINTR	"Du mu%st diese Zeremonie durchf%uhren."
?CCL19:	PRINTR	"F%ur eine Austreibung bist du nicht vorbereitet."
?CCL13:	ZERO?	LLD-FLAG \?CCL24
	EQUAL?	PRSA,V?RING \?CCL24
	EQUAL?	PRSO,BELL \?CCL24
	SET	'XB,TRUE-VALUE
	ICALL2	REMOVE-CAREFULLY,BELL
	ICALL2	THIS-IS-IT,HOT-BELL
	MOVE	HOT-BELL,HERE
	PRINTI	"Die Glocke wird pl%otzlich gl%uhend hei%s und f%allt zu Boden. Die Geister, als w%aren sie versteinert, h%oren mit dem Gejammer auf und drehen sich dir zu. Auf ihren fahlen Gesichtern formt sich der Ausdruck einer langvergessenen Furcht."
	CRLF	
	IN?	CANDLES,WINNER \?CND28
	PRINTI	"In deiner Verwirrung fallen die Kerzen auf den Boden (und sie sind aus)."
	CRLF	
	MOVE	CANDLES,HERE
	FCLEAR	CANDLES,ONBIT
	CALL2	INT,I-CANDLES
	PUT	STACK,0,0
?CND28:	CALL	QUEUE,I-XB,6
	PUT	STACK,0,1
	CALL	QUEUE,I-XBH,20
	PUT	STACK,0,1
	RTRUE	
?CCL24:	ZERO?	XC /FALSE
	EQUAL?	PRSA,V?READ \FALSE
	EQUAL?	PRSO,BOOK \FALSE
	ZERO?	LLD-FLAG \FALSE
	PRINTI	"Jedes Wort des Gebetes hallt in einem ohrenbet%aubenden Durcheinander durch den Saal. Als die letzten Worte verhallen, spricht eine laute und befehlende Stimme: %>Weg mit Euch, Ihr Biester!%< Ein herzzerrei%sender Schrei f%ullt die H%ohle, und die Geister, eine h%ohere Macht versp%uren fliehen durch die W%ande."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,GHOSTS
	SET	'LLD-FLAG,TRUE-VALUE
	CALL2	INT,I-XC
	PUT	STACK,0,0
	RTRUE	
?CCL10:	EQUAL?	RARG,M-END \FALSE
	ZERO?	XB /FALSE
	IN?	CANDLES,WINNER \FALSE
	FSET?	CANDLES,ONBIT \FALSE
	ZERO?	XC \FALSE
	SET	'XC,TRUE-VALUE
	PRINTI	"Die Flammen flackern wild und scheinen zu tanzen. Die Erde unter dir zittert, und deine Knie drohen aufzugeben. Die Geister verzweifeln an deiner %uberirdischen Kraft."
	CRLF	
	CALL2	INT,I-XB
	PUT	STACK,0,0
	CALL	QUEUE,I-XC,3
	PUT	STACK,0,1
	RTRUE	


	.FUNCT	I-XB:ANY:0:0
	ZERO?	XC \?PEN1
	EQUAL?	HERE,ENTRANCE-TO-HADES \?PEN1
	PRINTI	"Der Bann dieser Zeremonie ist gebrochen, und die Geister, die zwar am%usiert, aber doch von deinem tolpatschigen Versuch gest%ort sind, nehmen ihr schreckliches Geheule wieder auf."
	CRLF	
?PEN1:	SET	'XB,FALSE-VALUE
	RETURN	XB


	.FUNCT	I-XC:ANY:0:0
	SET	'XC,FALSE-VALUE
	CALL1	I-XB
	RSTACK	


	.FUNCT	I-XBH:ANY:0:0
	ICALL2	REMOVE-CAREFULLY,HOT-BELL
	MOVE	BELL,ENTRANCE-TO-HADES
	EQUAL?	HERE,ENTRANCE-TO-HADES \FALSE
	PRINTR	"Die Glocke scheint sich abgek%uhlt zu haben."


	.FUNCT	DAM-ROOM-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du stehst oben auf dem Hochwasserschutzdamm Nr.3. Er war wohl zu seiner Zeit eine gro%se Sehensw%urdigkeit. Es gibt hier Pfade nach Norden, S%uden und Westen und eine steile Abk%urzung. "
	CRLF	
	ZERO?	LOW-TIDE /?CCL6
	ZERO?	GATES-OPEN /?CCL6
	PRINTI	"Der Wasserstand hinter dem Damm ist niedrig. Die Schleusentore sind ge%offnet worden. Das Wasser braust durch den Damm flu%sabw%arts."
	CRLF	
	JUMP	?CND4
?CCL6:	ZERO?	GATES-OPEN /?CCL10
	PRINTI	"Die Schleusentore sind ge%offnet. Wasser braust durch den Damm. Der Wasserstand hinter dem Damm ist immer noch hoch."
	CRLF	
	JUMP	?CND4
?CCL10:	ZERO?	LOW-TIDE /?CCL12
	PRINTI	"Die Schleusentore sind geschlo%sen. Der Wasserstand in dem Reservoir ist niedrig, aber er steigt schnell."
	CRLF	
	JUMP	?CND4
?CCL12:	PRINTI	"Die Schleusentore des Dammes sind geschlo%sen. Hinter dem Damm kann man ein gro%ses Reservoir sehen. Wasser flie%st wild %uber den seit langem unbenutzten Damm."
	CRLF	
?CND4:	PRINTI	"Es gibt hier eine Schalttafel, auf der eine gro%se Metallschraube angebracht ist. Direkt %uber der Schraube ist eine kleine gr%une Plastikblase"
	ZERO?	GATE-FLAG /?CND13
	PRINTI	", die klar aufleuchtet"
?CND13:	PRINTR	"."


	.FUNCT	BOLT-F:ANY:0:0
	EQUAL?	PRSA,V?TURN \?CCL3
	EQUAL?	PRSI,WRENCH \?CCL6
	ZERO?	GATE-FLAG /?CCL9
	FCLEAR	RESERVOIR-SOUTH,TOUCHBIT
	ZERO?	GATES-OPEN /?CCL12
	SET	'GATES-OPEN,FALSE-VALUE
	FCLEAR	LOUD-ROOM,TOUCHBIT
	PRINTI	"Die Schleusentore schlie%sen sich, und Wasser sammelt sich hinter dem Damm an."
	CRLF	
	CALL	QUEUE,I-RFILL,8
	PUT	STACK,0,1
	CALL	QUEUE,I-REMPTY,0
	PUT	STACK,0,1
	RTRUE	
?CCL12:	SET	'GATES-OPEN,TRUE-VALUE
	PRINTI	"Die Schleusentore %offnen sich, und Wasser str%omt durch den Damm."
	CRLF	
	CALL	QUEUE,I-REMPTY,8
	PUT	STACK,0,1
	CALL	QUEUE,I-RFILL,0
	PUT	STACK,0,1
	RTRUE	
?CCL9:	PRINTR	"The bolt won't turn with your best effort."
?CCL6:	PRINTI	"Die Schraube l%a%st sich mit "
	ICALL2	DER-ACC-PRINT,PRSI
	PRINTR	" nicht drehen."
?CCL3:	EQUAL?	PRSA,V?TAKE \?CCL14
	CALL1	INTEGRAL-PART
	RSTACK	
?CCL14:	EQUAL?	PRSA,V?OIL \FALSE
	PRINTR	"O nein! Es sieht so aus, als ob die Tube nicht %Ol, sondern Klebstoff enthalten hat. Die Schraube wird dadurch nicht einfacher."


	.FUNCT	BUBBLE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	CALL1	INTEGRAL-PART
	RSTACK	


	.FUNCT	INTEGRAL-PART:ANY:0:0
	PRINTR	"Es ist ein wichtiger Bestandteil der Schalttafel."


	.FUNCT	I-RFILL:ANY:0:0
	FSET	RESERVOIR,NONLANDBIT
	FCLEAR	RESERVOIR,RLANDBIT
	FCLEAR	DEEP-CANYON,TOUCHBIT
	FCLEAR	LOUD-ROOM,TOUCHBIT
	IN?	TRUNK,RESERVOIR \?PEN1
	FSET	TRUNK,INVISIBLE
?PEN1:	SET	'LOW-TIDE,FALSE-VALUE
	EQUAL?	HERE,RESERVOIR \?CCL5
	LOC	WINNER
	FSET?	STACK,VEHBIT \?CCL8
	PRINTR	"Das Boot hebt sich leicht aus dem Schlamm und treibt auf dem Wasser des Reservoirs."
?CCL8:	ICALL2	JIGS-UP,STR?241
	RTRUE	
?CCL5:	EQUAL?	HERE,DEEP-CANYON \?CCL10
	PRINTR	"Ein Ger%ausch, wie das von flie%sendem Wasser, kann von unten geh%ort werden."
?CCL10:	EQUAL?	HERE,LOUD-ROOM \?CCL12
	PRINTI	"Pl%otzlich f%ullt ein alarmierend lautes Gebr%ull den Raum. Voller Furcht kriechst du davon."
	CRLF	
	CALL2	PICK-ONE,LOUD-RUNS
	ICALL2	GOTO,STACK
	RTRUE	
?CCL12:	EQUAL?	HERE,RESERVOIR-NORTH,RESERVOIR-SOUTH \TRUE
	PRINTR	"Du merkst, da%s der Wasserstand so hoch ist, da%s man nicht mehr zu Fu%s weiterkommt."


	.FUNCT	I-REMPTY:ANY:0:0
	FSET	RESERVOIR,RLANDBIT
	FCLEAR	RESERVOIR,NONLANDBIT
	FCLEAR	DEEP-CANYON,TOUCHBIT
	FCLEAR	LOUD-ROOM,TOUCHBIT
	FCLEAR	TRUNK,INVISIBLE
	SET	'LOW-TIDE,TRUE-VALUE
	EQUAL?	HERE,RESERVOIR \?CCL3
	LOC	WINNER
	FSET?	STACK,VEHBIT \?CCL3
	PRINTR	"Der Wasserstand hat sich so weit gemindert, da%s das Boot nicht mehr weiter schwimmen kann. Es sinkt in den Schlamm."
?CCL3:	EQUAL?	HERE,DEEP-CANYON \?CCL7
	PRINTR	"Das Get%ose von dem brausenden Wasser ist jetzt ruhiger."
?CCL7:	EQUAL?	HERE,RESERVOIR-NORTH,RESERVOIR-SOUTH \TRUE
	PRINTR	"Der Wasserstand ist hier recht niedrig, und du k%onntest hier leicht auf die andere Seite kommen."


	.FUNCT	BUTTON-F:ANY:0:0
	EQUAL?	PRSA,V?READ \?CCL3
	PRINTR	"Das kommt dir alles Spanisch vor."
?CCL3:	EQUAL?	PRSA,V?PUSH \FALSE
	EQUAL?	PRSO,BLUE-BUTTON \?CCL8
	ZERO?	WATER-LEVEL \?CCL11
	FCLEAR	LEAK,INVISIBLE
	PRINTI	"Da ist ein grollendes Ger%ausch, und ein Strom von Wasser scheint von der Ostwand in das Zimmer hereinzubrechen (scheinbar ein Rohr bruch)."
	CRLF	
	SET	'WATER-LEVEL,1
	CALL	QUEUE,I-MAINT-ROOM,-1
	PUT	STACK,0,1
	RTRUE	
?CCL11:	PRINTR	"Der blaue Knopf scheint, blockiert zu sein."
?CCL8:	EQUAL?	PRSO,RED-BUTTON \?CCL13
	PRINTI	"Die Lichter im Raum gehen "
	FSET?	HERE,ONBIT \?CCL16
	FCLEAR	HERE,ONBIT
	PRINTR	"aus."
?CCL16:	FSET	HERE,ONBIT
	PRINTR	"an."
?CCL13:	EQUAL?	PRSO,BROWN-BUTTON \?CCL18
	FCLEAR	DAM-ROOM,TOUCHBIT
	SET	'GATE-FLAG,FALSE-VALUE
	PRINTR	"Klick."
?CCL18:	EQUAL?	PRSO,YELLOW-BUTTON \FALSE
	FCLEAR	DAM-ROOM,TOUCHBIT
	SET	'GATE-FLAG,TRUE-VALUE
	PRINTR	"Klick."


	.FUNCT	TOOL-CHEST-FCN:ANY:0:0
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"Die Werkzeugk%asten sind alle leer."
?CCL3:	EQUAL?	PRSA,V?PUT,V?OPEN,V?TAKE \?CCL5
	ICALL2	REMOVE-CAREFULLY,TOOL-CHEST
	PRINTR	"Die K%asten sind so rostig und verrottet, das sie zerfallen, wenn du sie anfa%st."
?CCL5:	EQUAL?	PRSA,V?OPEN \FALSE
	PRINTR	"Die Werkzeugk%asten sind schon offen."


	.FUNCT	I-MAINT-ROOM:ANY:0:0,HERE?
	EQUAL?	HERE,MAINTENANCE-ROOM /?PRD1
	PUSH	0
	JUMP	?PRD2
?PRD1:	PUSH	1
?PRD2:	SET	'HERE?,STACK
	ZERO?	HERE? /?CND3
	PRINTI	"The water level here is now "
	DIV	WATER-LEVEL,2
	GET	DROWNINGS,STACK
	PRINT	STACK
	CRLF	
?CND3:	INC	'WATER-LEVEL
	LESS?	WATER-LEVEL,14 /?CCL7
	ICALL	MUNG-ROOM,MAINTENANCE-ROOM,STR?251
	CALL	QUEUE,I-MAINT-ROOM,0
	PUT	STACK,0,1
	ZERO?	HERE? /TRUE
	ICALL2	JIGS-UP,STR?252
	RTRUE	
?CCL7:	IN?	WINNER,INFLATED-BOAT \TRUE
	EQUAL?	HERE,MAINTENANCE-ROOM,DAM-ROOM,DAM-LOBBY \TRUE
	ICALL2	JIGS-UP,STR?253
	RTRUE	


	.FUNCT	LEAK-FUNCTION:ANY:0:0
	GRTR?	WATER-LEVEL,0 \FALSE
	EQUAL?	PRSA,V?PUT-ON,V?PUT \?CCL6
	EQUAL?	PRSO,PUTTY \?CCL6
	CALL1	FIX-MAINT-LEAK
	RSTACK	
?CCL6:	EQUAL?	PRSA,V?PLUG \FALSE
	EQUAL?	PRSI,PUTTY \?CCL13
	CALL1	FIX-MAINT-LEAK
	RSTACK	
?CCL13:	CALL2	WITH-TELL,PRSI
	RSTACK	


	.FUNCT	FIX-MAINT-LEAK:ANY:0:0
	SET	'WATER-LEVEL,-1
	CALL	QUEUE,I-MAINT-ROOM,0
	PUT	STACK,0,1
	PRINTR	"Durch ein Wunder der Zorkschen Technologie ist es dir gelungen, das Leck im Damm zu beheben."


	.FUNCT	PUTTY-FCN:ANY:0:0
	EQUAL?	PRSA,V?OIL \?PRD5
	EQUAL?	PRSI,PUTTY /?CCL3
?PRD5:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSO,PUTTY \FALSE
?CCL3:	PRINTR	"Das Allzweckschmierzeug dient nicht als Schmier%ol."


	.FUNCT	TUBE-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?PUT \?CCL3
	EQUAL?	PRSI,TUBE \?CCL3
	PRINTR	"Die Tube nimmt einfach nichts auf."
?CCL3:	EQUAL?	PRSA,V?SQUEEZE \FALSE
	FSET?	PRSO,OPENBIT \?CCL10
	IN?	PUTTY,PRSO \?CCL10
	MOVE	PUTTY,WINNER
	PRINTR	"Das widerliche Zeug quillt %uber deine ganze Hand."
?CCL10:	FSET?	PRSO,OPENBIT \?CCL14
	PRINTR	"Die Tube ist scheinbar leer."
?CCL14:	PRINTR	"Die Tube ist zu."


	.FUNCT	DAM-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL3
	PRINTR	"Das klingt annehmbar, aber so geht es nicht."
?CCL3:	EQUAL?	PRSA,V?PLUG \FALSE
	EQUAL?	PRSI,HANDS \?CCL8
	PRINTR	"Bist du der kleine Gernegro%s, ja? Zu dumm, das ist ein gro%ser Damm."
?CCL8:	PRINTI	"Mit "
	ICALL2	EIN-DAT-PRINT,PRSI
	PRINTR	"? Wei%st du wie gro%s der Damm ist? Du k%onntest h%ochstens ein winziges Leck damit stopfen."


	.FUNCT	WITH-TELL:ANY:1:1,OBJ
	PRINTI	"With "
	ICALL2	EIN-DAT-PRINT,OBJ
	PRINTR	"?"


	.FUNCT	RESERVOIR-SOUTH-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	ZERO?	LOW-TIDE /?CCL6
	ZERO?	GATES-OPEN /?CCL6
	PRINTI	"Du bist in einem l%anglichen Zimmer. Nach Norden lag fr%uher ein See. Aber, nachdem der Wasserstand gemindert wurde, gibt es hier blo%s einen breiten Bach, der durch die Mitte des Raumes flie%st."
	JUMP	?CND4
?CCL6:	ZERO?	GATES-OPEN /?CCL10
	PRINTI	"Du bist in einem l%anglichen Zimmer. Nach Norden liegt ein gro%ser See. Er ist zu tief, ihn zu %uberqueren. Du merkst aber, da%s der Wassterstand sich rapide senkt. Es wird nicht lange dauern, bis du den See %uberqueren kannst."
	JUMP	?CND4
?CCL10:	ZERO?	LOW-TIDE /?CCL12
	PRINTI	"Du bist in einem l%anglichen Zimmer. Nach Norden gibt es eine weite Fl%ache, die fr%uher ein Reservoir war, aber jetzt nur noch ein Flu%s ist. Du bemerkst aber, da%s der Wasserstand des Flu%ses sich rapide hebt, und da%s es bald unm%oglich sein wird, ihn zu %uberqueren."
	JUMP	?CND4
?CCL12:	PRINTI	"Du bist in einem l%anglichen Raum am S%udufer eines gro%sen Sees, der viel zu tief und zu breit zum %Uberqueren ist."
?CND4:	CRLF	
	PRINTR	"Den Bach entlang f%uhrt ein Pfad nach Osten oder Westen, ein steiler Pfad, nach S%udwesten den Rand einer Spalte entlang und ein Pfad f%uhrt in eine Schlucht nach S%udosten."


	.FUNCT	RESERVOIR-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-END \?CCL3
	LOC	WINNER
	FSET?	STACK,VEHBIT /?CCL3
	ZERO?	GATES-OPEN \?CCL3
	ZERO?	LOW-TIDE /?CCL3
	PRINTR	"Du bemerkst, da%s der Wasserstand sich hier rapide hebt. Die Str%omungen werden auch st%arker. Hier zu bleiben, erscheint recht gef%ahrlich."
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	ZERO?	LOW-TIDE /?CCL12
	PRINTI	"Du stehst da, wo einmal ein gro%ser See war, aber der ist jetzt ein gro%ser Schlammhaufen. Es gibt hier %>Ufer%< nach Norden und S%uden."
	CRLF	
	CRLF	
	RTRUE	
?CCL12:	PRINTR	"Du bist auf dem See. Nach Norden und S%uden kann man Str%ande sehen. Flu%saufw%arts flie%st ein kleiner Flu%s durch eine enge Rinne in den Felsen in den See hinein. Flu%sabw%arts kann man den Damm sehen."


	.FUNCT	RESERVOIR-NORTH-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	ZERO?	LOW-TIDE /?CCL6
	ZERO?	GATES-OPEN /?CCL6
	PRINTI	"Du bist in einem grottenartigen Raum. Sein S%udteil war einmal ein See. Aber, mit dem geminderten Wasserstand, gibt es hier nur noch einen breiten Bach, der hier durchflie%st."
	JUMP	?CND4
?CCL6:	ZERO?	GATES-OPEN /?CCL10
	PRINTI	"Du bist in einer weiten grottenartigen Gegend. Nach S%uden ist ein gro%ser See, dessen Wasserstand rapide zu fallen scheint."
	JUMP	?CND4
?CCL10:	ZERO?	LOW-TIDE /?CCL12
	PRINTI	"Du bist in einer grottenartigen Gegend. Nach S%uden ist ein sehr breiter Strom. Der Wasserstand des Stroms steigt rapide, und es scheint, da%s es bald unm%oglich sein wird auf die andere Seite zu kommen."
	JUMP	?CND4
?CCL12:	PRINTI	"Du bist in einem grottenartigen Raum auf der Nordseite eines gro%sen Sees."
?CND4:	CRLF	
	PRINTR	"Eine schleimige Treppe f%uhrt aus Raum nach Norden."


	.FUNCT	BOTTLE-FUNCTION:ANY:0:0,E?
	EQUAL?	PRSA,V?THROW \?CCL3
	EQUAL?	PRSO,BOTTLE \?CCL3
	ICALL2	REMOVE-CAREFULLY,PRSO
	SET	'E?,TRUE-VALUE
	PRINTI	"Die Flasche trifft die Wand und zerschellt."
	CRLF	
	JUMP	?CND1
?CCL3:	EQUAL?	PRSA,V?MUNG \?CCL7
	SET	'E?,TRUE-VALUE
	ICALL2	REMOVE-CAREFULLY,PRSO
	PRINTI	"Eine brilliante Aktion, die die Flasche zerst%ort."
	CRLF	
	JUMP	?CND1
?CCL7:	EQUAL?	PRSA,V?SHAKE \?CND1
	FSET?	PRSO,OPENBIT \?CND1
	IN?	WATER,PRSO \?CND1
	SET	'E?,TRUE-VALUE
?CND1:	ZERO?	E? /?CCL15
	IN?	WATER,PRSO \?CCL15
	PRINTI	"Das Wasser spritzt auf den Boden und verdampft."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,WATER
	RTRUE	
?CCL15:	ZERO?	E? \TRUE
	RFALSE	


	.FUNCT	CYCLOPS-FCN:ANY:0:0,COUNT
	SET	'COUNT,CYCLOWRATH
	EQUAL?	WINNER,CYCLOPS \?CCL3
	ZERO?	CYCLOPS-FLAG /?CCL6
	PRINTR	"Es hat keinen Sinn mit ihm zu sprechen. Er schl%aft fest."
?CCL6:	EQUAL?	PRSA,V?ODYSSEUS \?CCL8
	SET	'WINNER,ADVENTURER
	ICALL2	PERFORM,V?ODYSSEUS
	RTRUE	
?CCL8:	PRINTR	"Der Zyklop zieht das Essen der Unterhaltung vor."
?CCL3:	ZERO?	CYCLOPS-FLAG /?CCL10
	EQUAL?	PRSA,V?EXAMINE \?CCL13
	PRINTR	"Der Zyklop schl%aft wie ein Engel, wenn auch ein h%a%slicher."
?CCL13:	EQUAL?	PRSA,V?ATTACK,V?KICK,V?ALARM /?CCL15
	EQUAL?	PRSA,V?MUNG,V?BURN \FALSE
?CCL15:	PRINTI	"Der Zyklop g%ahnt und starrt das Ding an, das ihn aufgeweckt hat."
	CRLF	
	SET	'CYCLOPS-FLAG,FALSE-VALUE
	FSET	CYCLOPS,FIGHTBIT
	LESS?	COUNT,0 \?CCL20
	SUB	0,COUNT >CYCLOWRATH
	RETURN	CYCLOWRATH
?CCL20:	SET	'CYCLOWRATH,COUNT
	RETURN	CYCLOWRATH
?CCL10:	EQUAL?	PRSA,V?EXAMINE \?CCL22
	PRINTR	"Der hungrige Zyklop steht am Fu%s der Treppe."
?CCL22:	EQUAL?	PRSA,V?GIVE \?CCL24
	EQUAL?	PRSI,CYCLOPS \?CCL24
	EQUAL?	PRSO,LUNCH \?CCL29
	LESS?	COUNT,0 /?CND30
	ICALL2	REMOVE-CAREFULLY,LUNCH
	PRINTI	"Der Zyklop sagt: %>Ei, ei. Ich liebe scharfe Pepperoni! Aber, oooh, ich k%onnte erst mal was zu Trinken brauchen. Vielleicht k%onnte ich das Blut von 'diesem Ding' trinken%<. Aus dem listigen Aufleuchten seiner Augen kannst du schlie%sen, da%s du gemeint bist."
	CRLF	
	SUB	0,COUNT
	CALL	MIN,-1,STACK >CYCLOWRATH
?CND30:	CALL	QUEUE,I-CYCLOPS,-1
	PUT	STACK,0,1
	RTRUE	
?CCL29:	EQUAL?	PRSO,WATER /?CTR32
	EQUAL?	PRSO,BOTTLE \?CCL33
	IN?	WATER,BOTTLE \?CCL33
?CTR32:	LESS?	COUNT,0 \?CCL40
	ICALL2	REMOVE-CAREFULLY,WATER
	MOVE	BOTTLE,HERE
	FSET	BOTTLE,OPENBIT
	FCLEAR	CYCLOPS,FIGHTBIT
	PRINTI	"Der Zyklop nimmt die Flasche, pr%uft ihren Inhalt und trinkt das Wasser. Einen Augenblick sp%ater %offnet er seinen Mund zu einem G%ahnen, mit dem er dich beinahe verschluckt, dann schl%aft er fest ein. (Was hast du ihm denn blo%s in das Wasser geschmuggelt?)"
	CRLF	
	SET	'CYCLOPS-FLAG,TRUE-VALUE
	RETURN	CYCLOPS-FLAG
?CCL40:	PRINTR	"Scheinbar ist der Zyklop nicht durstig und lehnt dein gro%sz%ugiges Angebot ab."
?CCL33:	EQUAL?	PRSO,GARLIC \?CCL42
	PRINTR	"Vielleicht ist der Zyklop hungrig, aber auch er kennt seine Grenzen."
?CCL42:	PRINTR	"Der Zyklop ist nicht so dumm, da%s er DAS essen w%urde!"
?CCL24:	EQUAL?	PRSA,V?MUNG,V?ATTACK,V?THROW \?CCL44
	CALL	QUEUE,I-CYCLOPS,-1
	PUT	STACK,0,1
	EQUAL?	PRSA,V?MUNG \?CCL47
	PRINTR	"%>Meinst du, da%s ich so dumm bin, wie mein Vater war?%< sagt er, als er dir ausweicht."
?CCL47:	PRINTI	"Der Zyklop zuckt die Achseln und beachtet deinen armseligen Versuch nicht weiter."
	CRLF	
	EQUAL?	PRSA,V?THROW \TRUE
	MOVE	PRSO,HERE
	RTRUE	
?CCL44:	EQUAL?	PRSA,V?TAKE \?CCL51
	PRINTR	"Es gef%allt dem Zyklopen nicht, da%s du ihn angreifst."
?CCL51:	EQUAL?	PRSA,V?TIE \?CCL53
	PRINTR	"Du kannst den Zyklopen nicht fesseln, obwohl er gefesselt zu sein scheint."
?CCL53:	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"Du kannst seinen Magen knurren h%oren."


	.FUNCT	I-CYCLOPS:ANY:0:0
	ZERO?	CYCLOPS-FLAG \TRUE
	ZERO?	DEAD \TRUE
	EQUAL?	HERE,CYCLOPS-ROOM /?CCL7
	CALL2	INT,I-CYCLOPS
	PUT	STACK,0,0
	RTRUE	
?CCL7:	LESS?	CYCLOWRATH,0 \?CCL13
	SUB	0,CYCLOWRATH
	JUMP	?CND11
?CCL13:	PUSH	CYCLOWRATH
?CND11:	GRTR?	STACK,5 \?CCL10
	CALL2	INT,I-CYCLOPS
	PUT	STACK,0,0
	CALL2	JIGS-UP,STR?254
	RSTACK	
?CCL10:	LESS?	CYCLOWRATH,0 \?CCL16
	DEC	'CYCLOWRATH
	JUMP	?CND14
?CCL16:	INC	'CYCLOWRATH
?CND14:	ZERO?	CYCLOPS-FLAG \FALSE
	LESS?	CYCLOWRATH,0 \?CCL22
	SUB	0,CYCLOWRATH
	JUMP	?CND20
?CCL22:	PUSH	CYCLOWRATH
?CND20:	SUB	STACK,1
	GET	CYCLOMAD,STACK
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	CYCLOPS-ROOM-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Dieser Raum hat einen Ausgang nach Nordwesten, und eine Treppe f%uhrt nach oben."
	CRLF	
	ZERO?	CYCLOPS-FLAG /?CCL6
	ZERO?	MAGIC-FLAG \?CCL6
	PRINTR	"Der Zyklop schl%aft selig am Fu%se der Treppe."
?CCL6:	ZERO?	MAGIC-FLAG /?CCL10
	PRINTR	"Die Ostwand, die fr%uher ganz war, zeigt jetzt eine zyklopenf%ormige %Offnung."
?CCL10:	ZERO?	CYCLOWRATH \?CCL12
	PRINTR	"Ein Zyklop, der aussieht, als w%are er bereit, G%aule zu verschlingen (viel eher als nur Abenteurer), blockiert die Treppe. Von seinem Gesundheitszustand und den Blutspuren an den W%anden, kannst du schlie%sen, da%s er nicht sehr freundlich ist, obwohle er Menschen liebt."
?CCL12:	GRTR?	CYCLOWRATH,0 \?CCL14
	PRINTR	"Der Zyklop steht in der Ecke und beobachtet dich scharf. Ich glaube nicht, da%s er dich mag. Er sieht sogar f%ur einen Zyklopen ausgesprochen hungrig aus."
?CCL14:	LESS?	CYCLOWRATH,0 \FALSE
	PRINTR	"Der Zyklop scheint, nachdem er die scharfen Pepperoni gefressen hat, nach Atem zu ringen. Seine flammenrote Zunge h%angt aus seinem menschengro%sen Maul."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	ZERO?	CYCLOWRATH /TRUE
	CALL2	INT,I-CYCLOPS
	PUT	STACK,0,1
	RTRUE	


	.FUNCT	LOUD-ROOM-FCN:ANY:1:1,RARG,WRD
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Dies ist ein riesiges Zimmer, in dem man die Decke nicht von unten erkennen kann. Hier ist ein enger Durchgang von Osten nach Westen und eine Steintreppe f%uhrt nach oben."
	ZERO?	LOUD-FLAG \?CTR5
	ZERO?	GATES-OPEN \?CCL6
	ZERO?	LOW-TIDE /?CCL6
?CTR5:	PRINTR	" Der Raum ist in seiner Stille unheimlich."
?CCL6:	PRINTR	" Der Raum ist mit ohrenbet%aubendem L%arm gef%ullt. Das Get%ose scheint, von allen W%anden widerzuhallen. Es ist unm%oglich, hier auch nur zu denken."
?CCL3:	EQUAL?	RARG,M-END \?CCL12
	ZERO?	GATES-OPEN /?CCL12
	ZERO?	LOW-TIDE \?CCL12
	PRINTI	"Es ist unertr%aglich laut hier. Eine ohrenbet%aubendes Gebr%ull kommt von allen Seiten auf dich zu. Dein Kopf dr%ohnt ununterbrochen. Mit gr%o%ster Anstrengung verl%a%st du den Raum."
	CRLF	
	CRLF	
	CALL2	PICK-ONE,LOUD-RUNS
	ICALL2	GOTO,STACK
	RFALSE	
?CCL12:	EQUAL?	RARG,M-ENTER \FALSE
	ZERO?	LOUD-FLAG \FALSE
	ZERO?	GATES-OPEN \?CCL20
	ZERO?	LOW-TIDE \FALSE
?CCL20:	ZERO?	GATES-OPEN /?CCL26
	ZERO?	LOW-TIDE /FALSE
?CCL26:	ICALL1	V-FIRST-LOOK
	ZERO?	P-CONT /?PRG31
	PRINTI	"Deine anderen Befehle sind in dem Gebr%ull verloren gegangen."
	CRLF	
	SET	'P-CONT,FALSE-VALUE
?PRG31:	ZERO?	SUPER-BRIEF \?CND33
	CRLF	
?CND33:	PRINTC	62
	PUTB	P-INBUF,1,0
	READ	P-INBUF,P-LEXV
	GETB	P-LEXV,P-LEXWORDS
	ZERO?	STACK \?CND35
	PRINTI	"Bitte?"
	CRLF	
	JUMP	?PRG31
?CND35:	GET	P-LEXV,1 >WRD
	EQUAL?	WRD,W?LAUF,W?GEH,W?REN /?CTR38
	EQUAL?	WRD,W?LAUFE,W?GEHE,W?RENE \?CCL39
?CTR38:	GET	P-LEXV,3 >WRD
	JUMP	?CND37
?CCL39:	EQUAL?	WRD,W?SAG \?CND37
	GET	P-LEXV,5 >WRD
?CND37:	EQUAL?	WRD,W?SAVE \?CCL45
	ICALL1	V-SAVE
	JUMP	?PRG31
?CCL45:	EQUAL?	WRD,W?WIEDERHERSTELLUNG \?CCL47
	ICALL1	V-RESTORE
	JUMP	?PRG31
?CCL47:	EQUAL?	WRD,W?AUFHOEREN,W?AUFH%OREN \?CCL49
	ICALL1	V-QUIT
	JUMP	?PRG31
?CCL49:	EQUAL?	WRD,W?W,W?WEST,W?WESTEN \?CCL51
	CALL2	GOTO,ROUND-ROOM
	RSTACK	
?CCL51:	EQUAL?	WRD,W?O,W?OSTEN,W?OST \?CCL53
	CALL2	GOTO,DAMP-CAVE
	RSTACK	
?CCL53:	EQUAL?	WRD,W?RAUF,W?RA \?CCL55
	CALL2	GOTO,DEEP-CANYON
	RSTACK	
?CCL55:	EQUAL?	WRD,W?ECHO \?CCL57
	SET	'LOUD-FLAG,TRUE-VALUE
	FCLEAR	BAR,SACREDBIT
	PRINTI	"Die Akustik in dem Raum %andert sich ein bi%schen."
	CRLF	
	ZERO?	SUPER-BRIEF \TRUE
	CRLF	
	RTRUE	
?CCL57:	ICALL1	V-ECHO
	JUMP	?PRG31


	.FUNCT	DEEP-CANYON-F:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du bist am S%udrand einer tiefen Schlucht. Durchg%ange f%uhren nach Osten, Nordwesten und S%udwesten. Eine Treppe f%uhrt nach unten."
	ZERO?	GATES-OPEN /?CCL6
	ZERO?	LOW-TIDE \?CCL6
	PRINTR	" Du kannst ein lautes Get%ose, wie das Brausen von Wasser von unten h%oren."
?CCL6:	ZERO?	GATES-OPEN \?CCL10
	ZERO?	LOW-TIDE /?CCL10
	CRLF	
	RTRUE	
?CCL10:	PRINTR	"Du kannst von unten herauf das Rauschen von Wasser h%oren."


	.FUNCT	THIEF-VS-ADVENTURER:ANY:1:1,HERE?,ROBBED?,WINNER-ROBBED?
	ZERO?	DEAD \?CCL2
	EQUAL?	HERE,TREASURE-ROOM /FALSE
?CCL2:	ZERO?	THIEF-HERE \?CCL6
	ZERO?	DEAD \?CCL9
	ZERO?	HERE? \?CCL9
	RANDOM	100
	GRTR?	30,STACK \?CCL9
	IN?	STILETTO,THIEF \FALSE
	FCLEAR	THIEF,INVISIBLE
	PRINTI	"Jemand, der einen gro%sen Sack tr%agt, lehnt hier gegen eine Wand. Er spricht kein Wort, aber es besteht kein Zweifel, da%s er sich nur %uber seine eigene Leiche von dem Sack trennen wird."
	CRLF	
	SET	'THIEF-HERE,TRUE-VALUE
	RTRUE	
?CCL9:	ZERO?	HERE? /?CCL16
	FSET?	THIEF,FIGHTBIT \?CCL16
	CALL2	WINNING?,THIEF
	ZERO?	STACK \?CCL16
	PRINTI	"Dein Gegner, der entscheidet, da%s Bescheidenheit auch eine Zier ist, entscheidet diesen kleinen Zwischenfall abzubrechen. Mit einem besch%amten Kopfnicken tritt er zur%uck ins Dunkel und verschwindet."
	CRLF	
	FSET	THIEF,INVISIBLE
	FCLEAR	THIEF,FIGHTBIT
	ICALL1	RECOVER-STILETTO
	RTRUE	
?CCL16:	ZERO?	HERE? /?CCL21
	FSET?	THIEF,FIGHTBIT \?CCL21
	RANDOM	100
	GRTR?	90,STACK /FALSE
?CCL21:	ZERO?	HERE? /?CCL26
	RANDOM	100
	GRTR?	30,STACK \?CCL26
	PRINTI	"Der, der den gro%sen Sack tr%agt, ist gerade abgehauen. Er hatte die Nase voll. Gott sei Dank hat er nichts mitgenommen."
	CRLF	
	FSET	THIEF,INVISIBLE
	ICALL1	RECOVER-STILETTO
	RTRUE	
?CCL26:	RANDOM	100
	GRTR?	70,STACK /FALSE
	ZERO?	DEAD \FALSE
	CALL	ROB,HERE,THIEF,100
	ZERO?	STACK /?CCL34
	SET	'ROBBED?,HERE
	JUMP	?CND32
?CCL34:	CALL	ROB,WINNER,THIEF
	ZERO?	STACK /?CND32
	SET	'ROBBED?,PLAYER
?CND32:	SET	'THIEF-HERE,TRUE-VALUE
	ZERO?	ROBBED? /?CCL38
	ZERO?	HERE? \?CCL38
	PRINTI	"Ein %ubelau%sehender Typ mit einem gro%sen Sack ist gerade durchs Zimmer gelatscht. Auf dem Weg hat er ganz ruhig ein paar Wertgegenst%ande "
	EQUAL?	ROBBED?,HERE \?CCL43
	PRINTI	"aus dem Zimmer"
	JUMP	?CND41
?CCL43:	PRINTI	"aus deinem Besitz"
?CND41:	PRINTI	" mitgehen lassen, dabei hat er etwas gemurmelt wie ....%>Diene deinem N%achsten bevor...%<"
	CRLF	
	ICALL1	STOLE-LIGHT?
	RFALSE	
?CCL38:	ZERO?	HERE? /?CCL45
	ICALL1	RECOVER-STILETTO
	ZERO?	ROBBED? /?CCL48
	PRINTI	"Der Dieb ist gerade abgehauen, nat%urlich trug er immer noch seinen gro%sen Sack. "
	EQUAL?	ROBBED?,PLAYER \?CCL51
	PRINTI	"Du hast es vielleicht nicht bemerkt, aber er hat dich restlos ausgeraubt."
	JUMP	?CND49
?CCL51:	PRINTI	"Du hast vielleicht nicht gemerkt, da%s er die Wertsachen im Zimmer abgestaubt hat."
?CND49:	CRLF	
	ICALL1	STOLE-LIGHT?
	JUMP	?CND46
?CCL48:	PRINTI	"Der Dieb, der nichts Wertvolles finden konnte, ist ver%argert abgehauen."
	CRLF	
?CND46:	FSET	THIEF,INVISIBLE
	SET	'HERE?,FALSE-VALUE
	RTRUE	
?CCL45:	PRINTR	"Ein hagerer, hungrigau%sehender Herr latschte hier gerade durch. Er trug einen gro%sen Sack. Als er nichts Wertvolles finden konnte, zog er ver%argert ab."
?CCL6:	ZERO?	HERE? /FALSE
	RANDOM	100
	GRTR?	30,STACK \FALSE
	CALL	ROB,HERE,THIEF,100
	ZERO?	STACK /?CCL58
	SET	'ROBBED?,HERE
	JUMP	?CND56
?CCL58:	CALL	ROB,WINNER,THIEF
	ZERO?	STACK /?CND56
	SET	'ROBBED?,PLAYER
?CND56:	ZERO?	ROBBED? /?CCL62
	PRINTI	"Der Dieb ist gerade abgehauen, nat%urlich trug er immer noch seinen gro%sen Sack. "
	EQUAL?	ROBBED?,PLAYER \?CCL65
	PRINTI	"Du hast es vielleicht nicht bemerkt, aber er hat dich restlos ausgeraubt."
	JUMP	?CND63
?CCL65:	PRINTI	"Du hast vielleicht nicht gemerkt, da%s er die Wertsachen im Zimmer abgestaubt hat."
?CND63:	CRLF	
	ICALL1	STOLE-LIGHT?
	JUMP	?CND60
?CCL62:	PRINTI	"Der Dieb, der nichts Wertvolles finden konnte, zog w%utend ab."
	CRLF	
?CND60:	FSET	THIEF,INVISIBLE
	SET	'HERE?,FALSE-VALUE
	ICALL1	RECOVER-STILETTO
	RFALSE	


	.FUNCT	STOLE-LIGHT?:ANY:0:0,OLD-LIT
	SET	'OLD-LIT,LIT
	CALL2	LIT?,HERE >LIT
	ZERO?	LIT \TRUE
	ZERO?	OLD-LIT /TRUE
	PRINTR	"Der Dieb hat dich offensichtlich im Dunkeln gelassen."


	.FUNCT	HACK-TREASURES:ANY:0:0,X
	ICALL1	RECOVER-STILETTO
	FSET	THIEF,INVISIBLE
	FIRST?	TREASURE-ROOM >X /?PRG2
?PRG2:	ZERO?	X /TRUE
	FCLEAR	X,INVISIBLE
	NEXT?	X >X /?PRG2
	JUMP	?PRG2


	.FUNCT	DEPOSIT-BOOTY:ANY:1:1,RM,X,N,FLG
	FIRST?	THIEF >X /?PRG2
?PRG2:	ZERO?	X \?CND4
	RETURN	FLG
?CND4:	NEXT?	X >N /?BOGUS6
?BOGUS6:	EQUAL?	X,STILETTO,LARGE-BAG /?CND7
	GETP	X,P?TVALUE
	GRTR?	STACK,0 \?CND7
	MOVE	X,RM
	SET	'FLG,TRUE-VALUE
	EQUAL?	X,EGG \?CND7
	SET	'EGG-SOLVE,TRUE-VALUE
	FSET	EGG,OPENBIT
?CND7:	SET	'X,N
	JUMP	?PRG2


	.FUNCT	ROB-MAZE:ANY:1:1,RM,X,N
	FIRST?	RM >X /?PRG2
?PRG2:	ZERO?	X /FALSE
	NEXT?	X >N /?BOGUS6
?BOGUS6:	FSET?	X,TAKEBIT \?CND7
	FSET?	X,INVISIBLE /?CND7
	RANDOM	100
	GRTR?	40,STACK \?CND7
	PRINTI	"Irgendwo in der Ferne h%orst du jemanden sagen %>Meine G%ute, was "
	ICALL2	DER-NOM-PRINT,X
	PRINTI	" hier wohl tut?%<"
	CRLF	
	CALL2	ZPROB,60
	ZERO?	STACK /TRUE
	MOVE	X,THIEF
	FSET	X,TOUCHBIT
	FSET	X,INVISIBLE
	RTRUE	
?CND7:	SET	'X,N
	JUMP	?PRG2


	.FUNCT	ROBBER-FUNCTION:ANY:0:1,MODE,FLG,X,N
	EQUAL?	PRSA,V?TELL \?CCL3
	PRINTI	"Der Dieb ist einer von den Starken und Schweigsamen."
	CRLF	
	SET	'P-CONT,FALSE-VALUE
	RETURN	P-CONT
?CCL3:	ZERO?	MODE \?CCL5
	EQUAL?	PRSA,V?HELLO \?CCL8
	GETP	THIEF,P?LDESC
	EQUAL?	STACK,ROBBER-U-DESC \?CCL8
	PRINTR	"Der Dieb, der momentan behindert ist, ist nicht in der Lage, deinen Gru%s mit der ihm angeborenen H%oflichkeit zu erwidern."
?CCL8:	EQUAL?	PRSO,KNIFE \?CCL12
	EQUAL?	PRSA,V?THROW \?CCL12
	FSET?	THIEF,FIGHTBIT /?CCL12
	MOVE	PRSO,HERE
	CALL2	ZPROB,10
	ZERO?	STACK /?CCL18
	PRINTI	"Du mu%st dem R%auber Angst eingejagt haben, obwohl du ihn nicht getroffen hast. Er flieht"
	REMOVE	LARGE-BAG
	SET	'X,FALSE-VALUE
	IN?	STILETTO,THIEF \?CND19
	REMOVE	STILETTO
	SET	'X,TRUE-VALUE
?CND19:	FIRST?	THIEF \?CCL23
	ICALL	MOVE-ALL,THIEF,HERE
	PRINTI	", aber der Inhalt seines Sackes f%allt auf den Boden."
	JUMP	?CND21
?CCL23:	PRINTC	46
?CND21:	MOVE	LARGE-BAG,THIEF
	ZERO?	X /?CND24
	MOVE	STILETTO,THIEF
?CND24:	CRLF	
	FSET	THIEF,INVISIBLE
	RTRUE	
?CCL18:	PRINTI	"Du hast nicht getroffen. Der Dieb macht keine Anstalten das Messer zu nehmen, obwohl es eine sch%one Zugabe zu der Sammlung in seinem Sack w%are. Er scheint, %uber deinen Versuch ver%argert zu sein."
	CRLF	
	FSET	THIEF,FIGHTBIT
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?GIVE,V?THROW \?CCL27
	ZERO?	PRSO /?CCL27
	EQUAL?	PRSO,THIEF /?CCL27
	EQUAL?	PRSI,THIEF \?CCL27
	GETP	THIEF,P?STRENGTH
	LESS?	STACK,0 \?CND32
	GETP	THIEF,P?STRENGTH
	SUB	0,STACK
	PUTP	THIEF,P?STRENGTH,STACK
	CALL2	INT,I-THIEF
	PUT	STACK,0,1
	ICALL1	RECOVER-STILETTO
	PUTP	THIEF,P?LDESC,ROBBER-C-DESC
	PRINTI	"Dein Opfer kommt pl%otzlich zu sich."
	CRLF	
?CND32:	MOVE	PRSO,THIEF
	GETP	PRSO,P?TVALUE
	GRTR?	STACK,0 \?CCL36
	SET	'THIEF-ENGROSSED,TRUE-VALUE
	PRINTI	"Der Dieb ist erstaunt %uber deine Gro%sz%ugigkeit, die er nicht erwartetet hat, aber er nimmt "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTR	" an, und nimmt sich Zeit, seine Sch%onheit zu bewundern."
?CCL36:	PRINTI	"Der Dieb steckt "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" in seinen Sack und dankt dir h%oflich."
	RTRUE	
?CCL27:	EQUAL?	PRSA,V?TAKE \?CCL38
	PRINTR	"Was willst du mit ihm machen, wenn du ihn hast?"
?CCL38:	EQUAL?	PRSA,V?LOOK-INSIDE,V?EXAMINE \?CCL40
	PRINTR	"Der Dieb ist ein schleimiger Geselle mit Eidechsenaugen, die hin und her %augeln. Mit unmi%sverst%andlicher Arroganz schleppt er einen gro%sen Sack mit sich herum. Au%serdem hat er ein gef%ahrlich au%sehendes Stilett, dessen Spitze bedrohlich gegen dich gerichtet ist. An deiner Stelle w%are ich auf der Hut."
?CCL40:	EQUAL?	PRSA,V?LISTEN \FALSE
	PRINTR	"Der Dieb schweigt, denn ihr seid einander ja noch nicht offiziell vorgestellt worden."
?CCL5:	EQUAL?	MODE,F-BUSY? \?CCL44
	IN?	STILETTO,THIEF /FALSE
	LOC	THIEF
	IN?	STILETTO,STACK \FALSE
	MOVE	STILETTO,THIEF
	FSET	STILETTO,NDESCBIT
	IN?	THIEF,HERE \TRUE
	PRINTR	"Der R%auber, von dieser Wendung der Dinge etwas %uberrascht, holt sich sein Stillett leichtf%u%sig zur%uck."
?CCL44:	EQUAL?	MODE,F-DEAD \?CCL53
	MOVE	STILETTO,HERE
	FCLEAR	STILETTO,NDESCBIT
	CALL2	DEPOSIT-BOOTY,HERE >X
	EQUAL?	HERE,TREASURE-ROOM \?CCL56
	FIRST?	HERE >X /?PRG58
?PRG58:	ZERO?	X \?CCL62
	PRINTI	"Jetzt kannst du dir den Kelch ohne Gefahr nehmen."
	CRLF	
	JUMP	?CND54
?CCL62:	EQUAL?	X,CHALICE,THIEF,ADVENTURER /?CND60
	FCLEAR	X,INVISIBLE
	ZERO?	FLG \?CND64
	SET	'FLG,TRUE-VALUE
	PRINTI	"Als der Dieb stirbt, schwindet seine Zauberkraft, und seine Sch%atze werden wieder sichtbar:"
	CRLF	
?CND64:	PRINTC	32
	ICALL2	EIN-NOM-CAP-PRINT,X
	FIRST?	X \?CND66
	CALL2	SEE-INSIDE?,X
	ZERO?	STACK /?CND66
	PRINTI	", mit "
	ICALL2	PRINT-CONTENTS,X
?CND66:	CRLF	
?CND60:	NEXT?	X >X /?PRG58
	JUMP	?PRG58
?CCL56:	ZERO?	X /?CND54
	PRINTI	"Seine Beute bleibt zur%uck."
	CRLF	
?CND54:	CALL2	INT,I-THIEF
	PUT	STACK,0,0
	RTRUE	
?CCL53:	EQUAL?	MODE,F-FIRST? \?CCL73
	ZERO?	THIEF-HERE /FALSE
	FSET?	THIEF,INVISIBLE /FALSE
	RANDOM	100
	GRTR?	20,STACK \FALSE
	FSET	THIEF,FIGHTBIT
	SET	'P-CONT,FALSE-VALUE
	RTRUE	
?CCL73:	EQUAL?	MODE,F-UNCONSCIOUS \?CCL81
	CALL2	INT,I-THIEF
	PUT	STACK,0,0
	FCLEAR	THIEF,FIGHTBIT
	MOVE	STILETTO,HERE
	FCLEAR	STILETTO,NDESCBIT
	PUTP	THIEF,P?LDESC,ROBBER-U-DESC
	RTRUE	
?CCL81:	EQUAL?	MODE,F-CONSCIOUS \FALSE
	LOC	THIEF
	EQUAL?	STACK,HERE \?CND84
	FSET	THIEF,FIGHTBIT
	PRINTI	"Der R%auber kommt zu sich. F%ur eine Weile t%auscht er weiterhin Bewu%stlosigkeit vor, dann als er die passende Gelegenheit findet, kriecht er weg von dir."
	CRLF	
?CND84:	CALL2	INT,I-THIEF
	PUT	STACK,0,1
	PUTP	THIEF,P?LDESC,ROBBER-C-DESC
	CALL1	RECOVER-STILETTO
	RSTACK	


	.FUNCT	LARGE-BAG-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	GETP	THIEF,P?LDESC
	EQUAL?	STACK,ROBBER-U-DESC \?CCL6
	PRINTR	"Zu deinem Nachteil ist der R%auber auf dem Sack zusammengebrochen. Wenn du jetztversuchtest, den Sack wegzunehmen, w%urdest du ihn wecken."
?CCL6:	PRINTR	"Der Sack wird auch %uber seine Leiche genommen."
?CCL3:	EQUAL?	PRSA,V?PUT \?CCL8
	EQUAL?	PRSI,LARGE-BAG \?CCL8
	PRINTR	"Das w%are ein toller Trick."
?CCL8:	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL12
	PRINTR	"Nahe genug heranzukommen, w%are ein toller Trick."
?CCL12:	EQUAL?	PRSA,V?LOOK-INSIDE,V?EXAMINE \FALSE
	PRINTR	"Der Sack liegt unter dem Dieb, daher kann man nicht sagen, was darin ist, wenn %uberhaupt was drin ist."


	.FUNCT	MOVE-ALL:ANY:2:2,FROM,TO,X,N
	FIRST?	FROM >X \FALSE
?PRG4:	ZERO?	X /TRUE
	NEXT?	X >N /?BOGUS8
?BOGUS8:	FCLEAR	X,INVISIBLE
	MOVE	X,TO
	SET	'X,N
	JUMP	?PRG4


	.FUNCT	CHALICE-FCN:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	IN?	PRSO,TREASURE-ROOM \FALSE
	IN?	THIEF,TREASURE-ROOM \FALSE
	FSET?	THIEF,FIGHTBIT \FALSE
	FSET?	THIEF,INVISIBLE /FALSE
	GETP	THIEF,P?LDESC
	EQUAL?	STACK,ROBBER-U-DESC /FALSE
	PRINTR	"Du w%urdest von hinten erstochen."
?CCL3:	EQUAL?	PRSA,V?PUT \?CCL13
	EQUAL?	PRSI,CHALICE \?CCL13
	PRINTR	"Das gelingt dir nicht. Es ist kein guter Kelch, nicht wahr?"
?CCL13:	CALL1	DUMB-CONTAINER
	RSTACK	


	.FUNCT	TREASURE-ROOM-FCN:ANY:1:1,RARG,TL
	EQUAL?	RARG,M-ENTER \FALSE
	CALL2	INT,I-THIEF
	GET	STACK,C-ENABLED?
	EQUAL?	STACK,1 \FALSE
	ZERO?	DEAD \FALSE
	IN?	THIEF,HERE /?CND7
	PRINTI	"Du h%orst einen Schreckensschrei, als du in das Versteck des R%aubers einbrichst. Als du einen Durchgang benutzt, der dir unbekannt ist, verteidigt er sich sofort."
	CRLF	
	MOVE	THIEF,HERE
?CND7:	FSET	THIEF,FIGHTBIT
	FCLEAR	THIEF,INVISIBLE
	CALL1	THIEF-IN-TREASURE
	RSTACK	


	.FUNCT	THIEF-IN-TREASURE:ANY:0:0,F,N
	FIRST?	HERE >F /?BOGUS1
?BOGUS1:	ZERO?	F /?PRG6
	NEXT?	F \?PRG6
	PRINTI	"Der Dieb f%uhrt einige mysteri%ose Gesten aus, und die Sch%atze im Zimmer verschwinden."
	CRLF	
	CRLF	
?PRG6:	ZERO?	F /TRUE
	EQUAL?	F,CHALICE,THIEF /?CND8
	FSET	F,INVISIBLE
?CND8:	NEXT?	F >F /?PRG6
	JUMP	?PRG6


	.FUNCT	FRONT-DOOR-FCN:ANY:0:0
	EQUAL?	PRSA,V?OPEN \?CCL3
	PRINTR	"Die T%ur kann nicht ge%offnet werden."
?CCL3:	EQUAL?	PRSA,V?BURN \?CCL5
	PRINTR	"Du kannst die T%ur nicht verbrennen."
?CCL5:	EQUAL?	PRSA,V?MUNG \?CCL7
	PRINTR	"Du kannst die T%ur nicht besch%adigen."
?CCL7:	EQUAL?	PRSA,V?LOOK-BEHIND \FALSE
	PRINTR	"Sie l%a%st sich nicht %offnen."


	.FUNCT	BODY-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	PRINTR	"Eine magische Kraft hindert dich am Mitnehmen der Leichen."
?CCL3:	EQUAL?	PRSA,V?BURN,V?MUNG \FALSE
	CALL2	JIGS-UP,STR?263
	RSTACK	


	.FUNCT	BLACK-BOOK:ANY:0:0
	EQUAL?	PRSA,V?OPEN \?CCL3
	PRINTR	"Das Buch ist schon auf Seite 569 augfgeschlagen."
?CCL3:	EQUAL?	PRSA,V?CLOSE \?CCL5
	PRINTR	"Trotz aller Kraftanwendung kannst du das Buch nicht schlie%sen."
?CCL5:	EQUAL?	PRSA,V?TURN /?CTR6
	EQUAL?	PRSA,V?READ-PAGE \?CCL7
	EQUAL?	PRSI,INTNUM \?CCL7
	EQUAL?	P-NUMBER,569 /?CCL7
?CTR6:	PRINTI	"Au%ser der Seite 569 gibt es nur noch eine Seite mit lesbarem Druck darauf. Fast alles ist unleserlich, aber das Thema scheint die Bannung des B%osen zu sein. Scheinbar sind gewi%se Ger%ausche, Lichter und Gebete in dieser Beziehung von Nutzen."
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?BURN \FALSE
	ICALL2	REMOVE-CAREFULLY,PRSO
	CALL2	JIGS-UP,STR?264
	RSTACK	


	.FUNCT	PAINTING-FCN:ANY:0:0
	EQUAL?	PRSA,V?MUNG \FALSE
	PUTP	PRSO,P?TVALUE,0
	PUTP	PRSO,P?LDESC,STR?265
	PRINTR	"Gratuliere! Im Gegensatz zu den anderen Verbrechern, die lediglich die Meisterwerke des K%unstlers gestohlen haben, hast du eines zerst%ort."


	.FUNCT	LANTERN:ANY:0:0
	EQUAL?	PRSA,V?THROW \?CCL3
	PRINTI	"Die Leuchte liegt am Fu%sboden zerschmettert, und das Licht ist aus."
	CRLF	
	CALL2	INT,I-LANTERN
	PUT	STACK,0,0
	ICALL2	REMOVE-CAREFULLY,LAMP
	MOVE	BROKEN-LAMP,HERE
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?LAMP-ON \?CCL5
	FSET?	LAMP,RMUNGBIT \?CCL8
	PRINTR	"Eine ausgebrannte Leuchte l%a%st sich nicht anz%unden."
?CCL8:	CALL2	INT,I-LANTERN
	PUT	STACK,0,1
	RFALSE	
?CCL5:	EQUAL?	PRSA,V?LAMP-OFF \?CCL10
	FSET?	LAMP,RMUNGBIT \?CCL13
	PRINTR	"Die Leuchte ist schon ausgebrannt."
?CCL13:	CALL2	INT,I-LANTERN
	PUT	STACK,0,0
	RFALSE	
?CCL10:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	LAMP,RMUNGBIT \?CCL18
	PRINTR	"Die Leuchte ist ausgebrannt."
?CCL18:	FSET?	LAMP,ONBIT \?CCL20
	PRINTR	"Die Leuchte ist an."
?CCL20:	PRINTR	"Die Leuchte ist nicht an."


	.FUNCT	MAILBOX-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,MAILBOX \FALSE
	PRINTR	"Er ist fest angebracht."


	.FUNCT	MATCH-FUNCTION:ANY:0:0,CNT
	EQUAL?	PRSA,V?BURN,V?LAMP-ON \?CCL3
	EQUAL?	PRSO,MATCH \?CCL3
	GRTR?	MATCH-COUNT,0 \?CND6
	DEC	'MATCH-COUNT
?CND6:	GRTR?	MATCH-COUNT,0 /?CCL10
	PRINTR	"Leider sind dir die Streichh%olzer ausgegangen."
?CCL10:	EQUAL?	HERE,LOWER-SHAFT,TIMBER-ROOM \?CCL12
	PRINTR	"Dieser Raum ist zugig, und das Streichholz geht sofort aus."
?CCL12:	FSET	MATCH,FLAMEBIT
	FSET	MATCH,ONBIT
	CALL	QUEUE,I-MATCH,2
	PUT	STACK,0,1
	PRINTI	"Eines der Streichh%olzer beginnt zu brennen."
	CRLF	
	ZERO?	LIT \TRUE
	SET	'LIT,TRUE-VALUE
	ICALL1	V-LOOK
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?LAMP-OFF \?CCL16
	FSET?	MATCH,FLAMEBIT \?CCL16
	PRINTI	"Das Streichholz ist aus."
	CRLF	
	FCLEAR	MATCH,FLAMEBIT
	FCLEAR	MATCH,ONBIT
	CALL2	LIT?,HERE >LIT
	ZERO?	LIT \?CND19
	PRINTI	"Es ist stockdunkel hier!"
	CRLF	
?CND19:	CALL	QUEUE,I-MATCH,0
	PUT	STACK,0,1
	RTRUE	
?CCL16:	EQUAL?	PRSA,V?OPEN,V?COUNT \?CCL22
	PRINTI	"Du hast "
	SUB	MATCH-COUNT,1 >CNT
	GRTR?	CNT,0 /?CCL25
	PRINTI	"keine"
	JUMP	?CND23
?CCL25:	PRINTN	CNT
?CND23:	PRINTR	" Streichh%olzer."
?CCL22:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	MATCH,ONBIT \?CCL30
	PRINTR	"Das Streichholz brennt."
?CCL30:	PRINTR	"The matchbook isn't very interesting, except for what's written on it."


	.FUNCT	I-MATCH:ANY:0:0
	PRINTI	"Das Streichholz ist ausgegangen."
	CRLF	
	FCLEAR	MATCH,FLAMEBIT
	FCLEAR	MATCH,ONBIT
	CALL2	LIT?,HERE >LIT
	RTRUE	


	.FUNCT	I-LANTERN:ANY:0:0,TICK,TBL
	VALUE	'LAMP-TABLE >TBL
	GET	TBL,0 >TICK
	CALL	QUEUE,I-LANTERN,TICK
	PUT	STACK,0,1
	ICALL	LIGHT-INT,LAMP,TBL,TICK
	ZERO?	TICK /FALSE
	ADD	TBL,4 >LAMP-TABLE
	RETURN	LAMP-TABLE


	.FUNCT	I-CANDLES:ANY:0:0,TICK,TBL
	VALUE	'CANDLE-TABLE >TBL
	FSET	CANDLES,TOUCHBIT
	GET	TBL,0 >TICK
	CALL	QUEUE,I-CANDLES,TICK
	PUT	STACK,0,1
	ICALL	LIGHT-INT,CANDLES,TBL,TICK
	ZERO?	TICK /FALSE
	ADD	TBL,4 >CANDLE-TABLE
	RETURN	CANDLE-TABLE


	.FUNCT	LIGHT-INT:ANY:3:3,OBJ,TBL,TICK
	ZERO?	TICK \?CND1
	FCLEAR	OBJ,ONBIT
	FSET	OBJ,RMUNGBIT
?CND1:	CALL2	HELD?,OBJ
	ZERO?	STACK \?CCL5
	IN?	OBJ,HERE \FALSE
?CCL5:	ZERO?	TICK \?CCL10
	PRINTI	"Du brauchst mehr Licht, als nur "
	ICALL2	DER-NOM-PRINT,OBJ
	PRINTR	"."
?CCL10:	GET	TBL,1
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	MIN:ANY:2:2,N1,N2
	LESS?	N1,N2 \?CCL3
	RETURN	N1
?CCL3:	RETURN	N2


	.FUNCT	CANDLES-FCN:ANY:0:0
	FSET?	CANDLES,TOUCHBIT /?CND1
	CALL2	INT,I-CANDLES
	PUT	STACK,0,1
?CND1:	EQUAL?	CANDLES,PRSI /FALSE
	EQUAL?	PRSA,V?BURN,V?LAMP-ON \?CCL8
	FSET?	CANDLES,RMUNGBIT \?CCL11
	PRINTR	"O je, von den Kerzen ist nicht mehr viel %ubrig. Bestimmt nicht genug zum Brennen."
?CCL11:	ZERO?	PRSI \?CCL13
	FSET?	MATCH,FLAMEBIT \?CCL16
	PRINTI	"(mit dem Streichholz)"
	CRLF	
	ICALL	PERFORM,V?LAMP-ON,CANDLES,MATCH
	RTRUE	
?CCL16:	PRINTI	"Du solltest sagen, mit was man sie anzuenden soll."
	CRLF	
	RETURN	2
?CCL13:	EQUAL?	PRSI,MATCH \?CCL20
	FSET?	MATCH,ONBIT \?CCL20
	FSET?	CANDLES,ONBIT \?CCL25
	PRINTR	"Die Kerzen sind schon angezuendet."
?CCL25:	FSET	CANDLES,ONBIT
	PRINTI	"Die Kerzen sind angezuendet."
	CRLF	
	CALL2	INT,I-CANDLES
	PUT	STACK,0,1
	RTRUE	
?CCL20:	EQUAL?	PRSI,TORCH \?CCL27
	FSET?	CANDLES,ONBIT \?CCL30
	PRINTR	"Du bemerkst noch rechtzeitig, da%s die Kerzen schon angezuendet sind."
?CCL30:	PRINTI	"Die Hitze die von der Fackel ausgeht, ist so stark, da%s die Kerzen schmelzen."
	CRLF	
	CALL2	REMOVE-CAREFULLY,CANDLES
	RSTACK	
?CCL27:	PRINTR	"Du mu%st sie mit etwas anzuenden, das brennt, verstehst du."
?CCL8:	EQUAL?	PRSA,V?COUNT \?CCL32
	PRINTR	"Mal sehen wieviele Dinge in einem Paar sind? Nicht verraten.Ich schaff das schon alleine."
?CCL32:	EQUAL?	PRSA,V?LAMP-OFF \?CCL34
	CALL2	INT,I-CANDLES
	PUT	STACK,0,0
	FSET?	CANDLES,ONBIT \?CCL37
	PRINTI	"Die Flamme ist aus."
	FCLEAR	CANDLES,ONBIT
	FSET	CANDLES,TOUCHBIT
	CALL2	LIT?,HERE >LIT
	ZERO?	LIT \?CND38
	PRINTR	" Es ist wirklich dunkel hier drin..."
?CND38:	CRLF	
	RTRUE	
?CCL37:	PRINTR	"Die Kerzen sind nicht an."
?CCL34:	EQUAL?	PRSA,V?PUT \?CCL41
	FSET?	PRSI,BURNBIT \?CCL41
	PRINTR	"Das w%are ungklug."
?CCL41:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	CANDLES,ONBIT \?CCL48
	PRINTR	"Die Kerzen brennen."
?CCL48:	PRINTR	"Die Kerzen sind nicht an."


	.FUNCT	CAVE2-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-END \FALSE
	IN?	CANDLES,WINNER \FALSE
	CALL2	ZPROB,50
	ZERO?	STACK /FALSE
	FSET?	CANDLES,ONBIT \FALSE
	CALL2	INT,I-CANDLES
	PUT	STACK,0,0
	FCLEAR	CANDLES,ONBIT
	PRINTI	"Ein Windsto%s bl%ast die Kerzen aus!"
	CRLF	
	CALL2	LIT?,HERE >LIT
	ZERO?	LIT \FALSE
	PRINTR	"Jetzt ist es restlos dunkel."


	.FUNCT	SWORD-FCN:ANY:0:0,G
	EQUAL?	PRSA,V?TAKE \?CCL3
	EQUAL?	WINNER,ADVENTURER \?CCL3
	CALL	QUEUE,I-SWORD,-1
	PUT	STACK,0,1
	RFALSE	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \FALSE
	GETP	SWORD,P?TVALUE >G
	EQUAL?	G,1 \?CCL10
	PRINTR	"Dein Schwert leuchtet mit einem schwachen blauen Schimmer."
?CCL10:	EQUAL?	G,2 \FALSE
	PRINTR	"Dein Schwert leuchtet jetzt ganz hell."


	.FUNCT	BOOM-ROOM:ANY:1:1,RARG,DUMMY?,FLAME
	EQUAL?	RARG,M-END \FALSE
	EQUAL?	RARG,M-END \?CND4
	EQUAL?	PRSA,V?BURN,V?LAMP-ON \?CND4
	EQUAL?	PRSO,CANDLES,TORCH,MATCH \?CND4
	SET	'DUMMY?,TRUE-VALUE
?CND4:	CALL2	HELD?,CANDLES
	ZERO?	STACK /?PRD13
	FSET?	CANDLES,ONBIT /?CCL11
?PRD13:	CALL2	HELD?,TORCH
	ZERO?	STACK /?PRD16
	FSET?	TORCH,ONBIT /?CCL11
?PRD16:	CALL2	HELD?,MATCH
	ZERO?	STACK /FALSE
	FSET?	MATCH,ONBIT \FALSE
?CCL11:	ZERO?	DUMMY? /?CCL23
	PRINTI	"Wie traurig f%ur einen ehrgeizigen Abenteurer, da%s er "
	ICALL2	EIN-ACC-PRINT,PRSO
	PRINTI	" in einem Raum anzuendet, der nach Gas riecht. Gl%ucklicherweise gibt es Gerechtigkeit auf dieser Welt."
	CRLF	
	JUMP	?CND21
?CCL23:	PRINTI	"Ach du lieber Himmel. Es scheint, als ob der Geruch der von diesem Zimmer kommt, Kohlenoxyd ist. Ich h%atte mir zweimal %uberlegt, ob ich hier einen brennenden Gegenstand hineintrage."
	CRLF	
?CND21:	CALL2	JIGS-UP,STR?272
	RSTACK	


	.FUNCT	BAT-D:ANY:0:1,FOO
	LOC	GARLIC
	EQUAL?	STACK,WINNER,HERE \?CCL3
	PRINTR	"In der Ecke des Zimmers h%angt eine gro%se Vampirfledermaus an der Decke, die offensichtlich nicht alle f%unf auf der Latte hat und sich die Nase zuh%alt."
?CCL3:	PRINTR	"Eine gro%se Vampirfledermaus h%angt von der Decke, rauscht auf dich nieder."


	.FUNCT	BATS-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTR	"Du bist in einem kleinen Zimmer, das nur eine T%ur nach Osten und S%uden hat."
?CCL3:	EQUAL?	RARG,M-ENTER \FALSE
	ZERO?	DEAD \FALSE
	LOC	GARLIC
	EQUAL?	STACK,WINNER,HERE /FALSE
	ICALL1	V-LOOK
	CRLF	
	CALL1	FLY-ME
	RSTACK	


	.FUNCT	MACHINE-ROOM-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Dies ist ein gro%ser kalter Raum, dessen einziger Ausgang nach Norden f%uhrt. In einer Ecke steht eine Maschine, die an einen W%aschetrockner erinnert. Vorne ist ein Schalter, der mit EIN beschriftet ist. Der Schalter scheint nicht, f%ur Menschenh%ande gebaut zu sein (au%ser, wenn die Finger 1/2cm mal 1cm w%aren). Vorne an der Maschine ist eine gro%se Klappe, die "
	FSET?	MACHINE,OPENBIT \?CCL6
	PRINTI	"ge%offnet"
	JUMP	?CND4
?CCL6:	PRINTI	"geschlossen"
?CND4:	PRINTR	" ist."


	.FUNCT	MACHINE-F:ANY:0:0
	EQUAL?	PRSA,V?TAKE \?CCL3
	EQUAL?	PRSO,MACHINE \?CCL3
	PRINTR	"Das ist viel zu gro%s zum Tragen."
?CCL3:	EQUAL?	PRSA,V?OPEN \?CCL7
	FSET?	MACHINE,OPENBIT \?CCL10
	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL10:	FIRST?	MACHINE \?CCL12
	PRINTI	"Der Deckel %offnet sich, bringt "
	ICALL2	PRINT-CONTENTS,MACHINE
	PRINTI	" zum Vorschein."
	CRLF	
	FSET	MACHINE,OPENBIT
	RTRUE	
?CCL12:	PRINTI	"Der Deckel %offnet sich."
	CRLF	
	FSET	MACHINE,OPENBIT
	RTRUE	
?CCL7:	EQUAL?	PRSA,V?CLOSE \?CCL14
	FSET?	MACHINE,OPENBIT \?CCL17
	PRINTI	"Der Deckel schlie%st sich."
	CRLF	
	FCLEAR	MACHINE,OPENBIT
	RTRUE	
?CCL17:	CALL2	PICK-ONE,DUMMY
	PRINT	STACK
	CRLF	
	RTRUE	
?CCL14:	EQUAL?	PRSA,V?LAMP-ON \FALSE
	ZERO?	PRSI \?CCL22
	PRINTR	"Es ist nicht klar, wie man sie mit den nackten H%anden aufmacht."
?CCL22:	ICALL	PERFORM,V?TURN,MACHINE-SWITCH,PRSI
	RTRUE	


	.FUNCT	MSWITCH-FUNCTION:ANY:0:0,O
	EQUAL?	PRSA,V?TURN \FALSE
	EQUAL?	PRSI,SCREWDRIVER \?CCL6
	FSET?	MACHINE,OPENBIT \?CCL9
	PRINTR	"Die Maschine scheint sich nicht r%uhren zu wollen."
?CCL9:	PRINTI	"Die Maschine wird lebendig (im %ubertragenen Sinne), indem sich faszinierende Lichter und haarstr%aubende Ger%ausche ergeben. Nach ein paar Sekunden h%ort der Zauber auf."
	CRLF	
	IN?	COAL,MACHINE \?PRG13
	ICALL2	REMOVE-CAREFULLY,COAL
	MOVE	DIAMOND,MACHINE
	RTRUE	
?PRG13:	FIRST?	MACHINE >O \?REP14
	ICALL2	REMOVE-CAREFULLY,O
	JUMP	?PRG13
?REP14:	MOVE	GUNK,MACHINE
	RTRUE	
?CCL6:	PRINTI	"Es scheint, da%s "
	ICALL2	EIN-NOM-PRINT,PRSI
	PRINTI	" nicht ausreicht."
	RTRUE	


	.FUNCT	GUNK-FUNCTION:ANY:0:0
	ICALL2	REMOVE-CAREFULLY,GUNK
	PRINTR	"Die Schlacke war por%os und zerkr%umelt bei der Ber%uhrung zu Staub."


	.FUNCT	NO-OBJS:ANY:1:1,RARG,F
	EQUAL?	RARG,M-BEG \FALSE
	FIRST?	WINNER >F /?BOGUS4
?BOGUS4:	SET	'EMPTY-HANDED,TRUE-VALUE
?PRG5:	ZERO?	F /?REP6
	CALL2	WEIGHT,F
	GRTR?	STACK,4 \?CND7
	SET	'EMPTY-HANDED,FALSE-VALUE
?REP6:	EQUAL?	HERE,LOWER-SHAFT \FALSE
	ZERO?	LIT /FALSE
	ICALL2	SCORE-UPD,LIGHT-SHAFT
	SET	'LIGHT-SHAFT,0
	RFALSE	
?CND7:	NEXT?	F >F /?PRG5
	JUMP	?PRG5


	.FUNCT	SOUTH-TEMPLE-FCN:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	IN?	COFFIN,WINNER /?PRD5
	SET	'COFFIN-CURE,1
	RFALSE	
?PRD5:	SET	'COFFIN-CURE,0
	RFALSE	


	.FUNCT	WHITE-CLIFFS-FUNCTION:ANY:1:1,RARG
	EQUAL?	RARG,M-END \FALSE
	IN?	INFLATED-BOAT,WINNER \?CCL6
	SET	'DEFLATE,FALSE-VALUE
	RETURN	DEFLATE
?CCL6:	SET	'DEFLATE,TRUE-VALUE
	RETURN	DEFLATE


	.FUNCT	SCEPTRE-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?RAISE,V?WAVE \FALSE
	EQUAL?	HERE,ARAGAIN-FALLS /?CTR5
	EQUAL?	HERE,END-OF-RAINBOW \?CCL6
?CTR5:	ZERO?	RAINBOW-FLAG \?CCL11
	FCLEAR	POT-OF-GOLD,INVISIBLE
	PRINTI	"Pl%otzlich wird der Regenbogen zu einer Art Stra%se und erscheint begehbar (Treppen mit Gel%ander erwecken diesen Eindruck)."
	CRLF	
	EQUAL?	HERE,END-OF-RAINBOW \?CND12
	IN?	POT-OF-GOLD,END-OF-RAINBOW \?CND12
	PRINTI	"Ein glitzernder goldener Topf erscheint am Ende des Regenbogens."
	CRLF	
?CND12:	SET	'RAINBOW-FLAG,TRUE-VALUE
	RETURN	RAINBOW-FLAG
?CCL11:	ICALL	ROB,ON-RAINBOW,WALL
	PRINTI	"Der Regenbogen scheint seine Ungew%ohnlichkeit verloren zu haben."
	CRLF	
	SET	'RAINBOW-FLAG,FALSE-VALUE
	RTRUE	
?CCL6:	EQUAL?	HERE,ON-RAINBOW \?CCL17
	SET	'RAINBOW-FLAG,FALSE-VALUE
	CALL2	JIGS-UP,STR?273
	RSTACK	
?CCL17:	PRINTR	"Eine verwirrende Farbenpracht strahlt kurz von dem Zepter aus."


	.FUNCT	FALLS-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Du bist oben auf den Wiedermal F%allen. Ein gigantischer Wasserfall mit einem Abgrund von 15 Metern. Der einzige Pfad hier ist am Nordende."
	CRLF	
	ZERO?	RAINBOW-FLAG /?CCL6
	PRINTR	"Ein voller Regenbogen steht %uber den F%allen."
?CCL6:	PRINTR	"Ein wundervoller Regenbogen kann %uber den F%allen und nach Westen gesehen werden."


	.FUNCT	RAINBOW-FCN:ANY:0:0
	EQUAL?	PRSA,V?THROUGH,V?CROSS \?CCL3
	EQUAL?	HERE,CANYON-VIEW \?CND4
	PRINTR	"Von hier aus?!?"
?CND4:	ZERO?	RAINBOW-FLAG /?CCL8
	EQUAL?	HERE,ARAGAIN-FALLS \?CCL11
	CALL2	GOTO,END-OF-RAINBOW
	RSTACK	
?CCL11:	EQUAL?	HERE,END-OF-RAINBOW \?CCL13
	CALL2	GOTO,ARAGAIN-FALLS
	RSTACK	
?CCL13:	PRINTR	"Du mu%st sagen, in welcher Richtung..."
?CCL8:	PRINTR	"Kannst du auf Wasserd%ampfen wandeln?"
?CCL3:	EQUAL?	PRSA,V?LOOK-UNDER \FALSE
	PRINTR	"Der Gletsch flie%st unter dem Regenbogen."


	.FUNCT	DBOAT-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?PUT-ON,V?PUT \?CCL3
	EQUAL?	PRSO,PUTTY \?CCL3
	CALL1	FIX-BOAT
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?FILL,V?INFLATE \?CCL7
	PRINTR	"Unm%oglich. Irgends%o ein Schwachkopf hat es durchl%ochert."
?CCL7:	EQUAL?	PRSA,V?PLUG \FALSE
	EQUAL?	PRSI,PUTTY \?CCL12
	CALL1	FIX-BOAT
	RSTACK	
?CCL12:	CALL2	WITH-TELL,PRSI
	RSTACK	


	.FUNCT	FIX-BOAT:ANY:0:0
	PRINTI	"Gro%sartig. Das Boot ist repariert."
	CRLF	
	LOC	PUNCTURED-BOAT
	MOVE	INFLATABLE-BOAT,STACK
	CALL2	REMOVE-CAREFULLY,PUNCTURED-BOAT
	RSTACK	


	.FUNCT	RIVER-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?PUT \?CCL3
	EQUAL?	PRSI,RIVER \FALSE
	EQUAL?	PRSO,ME \?CCL9
	CALL2	JIGS-UP,STR?274
	RSTACK	
?CCL9:	EQUAL?	PRSO,INFLATED-BOAT \?CCL11
	PRINTR	"Du solltest in das Boot steigen, dann absto%sen."
?CCL11:	FSET?	PRSO,BURNBIT \?CCL13
	ICALL2	REMOVE-CAREFULLY,PRSO
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTI	" schwimmt f%ur einen Moment, dann sinkt "
	ICALL2	PRONOUN-NOM-PRINT,PRSO
	PRINTR	"."
?CCL13:	ICALL2	REMOVE-CAREFULLY,PRSO
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTI	" platscht ins Wasser, und gluck-gluck weg ist "
	ICALL2	PRONOUN-NOM-PRINT,PRSO
	PRINTR	"."
?CCL3:	EQUAL?	PRSA,V?THROUGH,V?LEAP \FALSE
	PRINTR	"Eine Orientierung vor dem Sprung zeigt, da%s der Flu%s breit und gef%ahrlich ist, rei%sende Schnellen und halbverdeckte Felsten hat. Du entscheidest, vom Schwimmen abzusehen."


	.FUNCT	I-RIVER:ANY:0:0,RM
	EQUAL?	HERE,RIVER-1,RIVER-2,RIVER-3 /?CCL3
	EQUAL?	HERE,RIVER-4,RIVER-5 /?CCL3
	CALL2	INT,I-RIVER
	PUT	STACK,0,0
	RTRUE	
?CCL3:	CALL	LKP,HERE,RIVER-NEXT >RM
	ZERO?	RM /?CCL7
	PRINTI	"Die Str%omung tr%agt dich flu%sabw%arts."
	CRLF	
	CRLF	
	ICALL2	GOTO,RM
	CALL	LKP,HERE,RIVER-SPEEDS
	CALL	QUEUE,I-RIVER,STACK
	PUT	STACK,0,1
	RTRUE	
?CCL7:	CALL2	JIGS-UP,STR?275
	RSTACK	


	.FUNCT	RBOAT-FUNCTION:ANY:0:1,RARG,TMP
	EQUAL?	RARG,M-ENTER,M-END,M-LOOK /FALSE
	EQUAL?	RARG,M-BEG \?CCL5
	EQUAL?	PRSA,V?WALK \?CCL8
	EQUAL?	PRSO,P?LANDEN,P?OST,P?WEST /FALSE
	EQUAL?	HERE,RESERVOIR \?CCL13
	EQUAL?	PRSO,P?NORD,P?SUED /FALSE
?CCL13:	EQUAL?	HERE,IN-STREAM \?CCL17
	EQUAL?	PRSO,P?SUED /FALSE
?CCL17:	PRINTR	"Lies die Anweisungen f%ur das Boot."
?CCL8:	EQUAL?	PRSA,V?LAUNCH \?CCL21
	EQUAL?	HERE,RIVER-1,RIVER-2,RIVER-3 /?CTR23
	EQUAL?	HERE,RIVER-4,RESERVOIR,IN-STREAM \?CCL24
?CTR23:	PRINTI	"Du bist schon im "
	EQUAL?	HERE,RESERVOIR \?CCL29
	PRINTI	"Reservoir"
	JUMP	?CND27
?CCL29:	EQUAL?	HERE,IN-STREAM \?CCL31
	PRINTI	"Strom"
	JUMP	?CND27
?CCL31:	PRINTI	"Flu%s"
?CND27:	PRINTR	", oder hast du das vergessen?"
?CCL24:	CALL2	GO-NEXT,RIVER-LAUNCH >TMP
	EQUAL?	TMP,1 \?CCL33
	CALL	LKP,HERE,RIVER-SPEEDS
	CALL	QUEUE,I-RIVER,STACK
	PUT	STACK,0,1
	RTRUE	
?CCL33:	EQUAL?	TMP,2 /TRUE
	PRINTR	"Hier kannst du das Boot nicht ins Wasser lassen."
?CCL21:	EQUAL?	PRSA,V?DROP \?PRD39
	FSET?	PRSO,WEAPONBIT /?CTR36
?PRD39:	EQUAL?	PRSA,V?PUT \?PRD42
	FSET?	PRSO,WEAPONBIT \?PRD42
	EQUAL?	PRSI,INFLATED-BOAT /?CTR36
?PRD42:	EQUAL?	PRSA,V?MUNG,V?ATTACK \?CCL37
	FSET?	PRSI,WEAPONBIT \?CCL37
?CTR36:	ICALL2	REMOVE-CAREFULLY,INFLATED-BOAT
	MOVE	PUNCTURED-BOAT,HERE
	ICALL	ROB,INFLATED-BOAT,HERE
	MOVE	WINNER,HERE
	SET	'OHERE,FALSE-VALUE
	PRINTI	"Es scheint, als ob "
	EQUAL?	PRSA,V?PUT,V?DROP \?CCL50
	ICALL2	DER-NOM-PRINT,PRSO
	JUMP	?CND48
?CCL50:	ICALL2	DER-NOM-PRINT,PRSI
?CND48:	PRINTI	" dem Boot nicht bekommen ist, wie man von dem lauten hissenden Ger%ausch, das ihm entweicht, schlie%sen kann. Mit einem armseligen letzten Puff, geht die Luft aus dem Boot und du erleidest Schiffbruch."
	CRLF	
	FSET?	HERE,NONLANDBIT \TRUE
	CRLF	
	EQUAL?	HERE,RESERVOIR,IN-STREAM \?CCL55
	ICALL2	JIGS-UP,STR?276
	RTRUE	
?CCL55:	ICALL2	JIGS-UP,STR?277
	RTRUE	
?CCL37:	EQUAL?	PRSA,V?LAUNCH \FALSE
	PRINTR	"Du bist nicht im Boot!"
?CCL5:	EQUAL?	PRSA,V?BOARD \?CCL59
	IN?	SCEPTRE,WINNER /?CCL62
	IN?	KNIFE,WINNER /?CCL62
	IN?	SWORD,WINNER /?CCL62
	IN?	RUSTY-KNIFE,WINNER /?CCL62
	IN?	AXE,WINNER /?CCL62
	IN?	STILETTO,WINNER \FALSE
?CCL62:	PRINTI	"Ei, ei! Etwas Scharfes scheint weggerutscht zu sein, und hat das Boot durchl%ochert. Die Luft entweicht unter Zischen, Murmeln und Fluchen aus dem Boot."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,INFLATED-BOAT
	MOVE	PUNCTURED-BOAT,HERE
	ICALL2	THIS-IS-IT,PUNCTURED-BOAT
	RTRUE	
?CCL59:	EQUAL?	PRSA,V?FILL,V?INFLATE \?CCL70
	PRINTR	"Wenn man es weiter aufpumpt, w%urde es wahrscheinlich platzen."
?CCL70:	EQUAL?	PRSA,V?DEFLATE \FALSE
	LOC	WINNER
	EQUAL?	STACK,INFLATED-BOAT \?CCL75
	PRINTR	"Du kannst die Luft nicht aus dem Boot lassen, w%ahrend du drin sitzt."
?CCL75:	IN?	INFLATED-BOAT,HERE /?CCL77
	PRINTR	"Das Boot mu%s an Land sein, um die Luft rauszulassen."
?CCL77:	PRINTI	"Die Luft kommt aus dem Boot."
	CRLF	
	SET	'DEFLATE,TRUE-VALUE
	ICALL2	REMOVE-CAREFULLY,INFLATED-BOAT
	MOVE	INFLATABLE-BOAT,HERE
	CALL2	THIS-IS-IT,INFLATABLE-BOAT
	RSTACK	


	.FUNCT	IBOAT-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?FILL,V?INFLATE \FALSE
	IN?	INFLATABLE-BOAT,HERE /?CCL6
	PRINTR	"Das Boot mu%s an Land sein, um aufgeblasen zu werden."
?CCL6:	EQUAL?	PRSI,PUMP \?CCL8
	PRINTI	"Das Boot nimmt Luft auf und erscheint seet%uchtig."
	CRLF	
	FSET?	BOAT-LABEL,TOUCHBIT /?CND9
	PRINTI	"Ein beiges Schildchen liegt im Boot."
	CRLF	
?CND9:	SET	'DEFLATE,FALSE-VALUE
	ICALL2	REMOVE-CAREFULLY,INFLATABLE-BOAT
	MOVE	INFLATED-BOAT,HERE
	CALL2	THIS-IS-IT,INFLATED-BOAT
	RSTACK	
?CCL8:	EQUAL?	PRSI,LUNGS \?CCL12
	PRINTR	"Deine Lunge schafft es nicht, das Boot aufzublasen."
?CCL12:	PRINTI	"Mit "
	ICALL2	EIN-DAT-PRINT,PRSI
	PRINTR	"? Du beliebst zu scherzen?!"


	.FUNCT	RIVR4-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-END \FALSE
	IN?	BUOY,WINNER \FALSE
	ZERO?	BUOY-FLAG /FALSE
	PRINTI	"Die Boje f%uhlt sich irgendwie komisch an."
	CRLF	
	SET	'BUOY-FLAG,FALSE-VALUE
	RETURN	BUOY-FLAG


	.FUNCT	SAND-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?DIG \FALSE
	EQUAL?	PRSI,SHOVEL \FALSE
	IGRTR?	'BEACH-DIG,3 \?CCL8
	SET	'BEACH-DIG,-1
	IN?	SCARAB,HERE \?PEN9
	FSET	SCARAB,INVISIBLE
?PEN9:	CALL2	JIGS-UP,STR?278
	RSTACK	
?CCL8:	EQUAL?	BEACH-DIG,3 \?CCL12
	FSET?	SCARAB,INVISIBLE \FALSE
	PRINTI	"Du siehst hier einen Skarab%aus im Sand."
	CRLF	
	ICALL2	THIS-IS-IT,SCARAB
	FCLEAR	SCARAB,INVISIBLE
	RTRUE	
?CCL12:	GET	BDIGS,BEACH-DIG
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	TREE-ROOM:ANY:1:1,RARG,F
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"Du bist ungef%ahr 3 Meter %uber dem Boden umgeben von gro%sen %Asten. Du kannst den n%achsten Zweig %uber dir unm%oglich erreichen."
	CRLF	
	FIRST?	PATH >F \FALSE
	NEXT?	F \FALSE
	PRINTI	"Unter dir auf der Erde siehst du:"
	ICALL2	PRINT-CONTENTS,PATH
	PRINTR	"."
?CCL3:	EQUAL?	RARG,M-BEG \?CCL10
	EQUAL?	PRSA,V?CLIMB-DOWN \?CCL13
	EQUAL?	PRSO,TREE,ROOMS \?CCL13
	CALL2	DO-WALK,P?RUNTER
	RSTACK	
?CCL13:	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-UP \?CCL17
	EQUAL?	PRSO,TREE \?CCL17
	CALL2	DO-WALK,P?RAUF
	RSTACK	
?CCL17:	EQUAL?	PRSA,V?DROP \FALSE
	CALL1	IDROP
	ZERO?	STACK /TRUE
	EQUAL?	PRSO,NEST \?CCL26
	IN?	EGG,NEST \?CCL26
	PRINTI	"Das Nest f%allt auf die Erde, und das Ei f%allt heraus. Es ist ernstlich besch%adigt."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,EGG
	MOVE	BROKEN-EGG,PATH
	RTRUE	
?CCL26:	EQUAL?	PRSO,EGG \?CCL30
	PRINTI	"Das Ei f%allt auf die Erde und springt auf. Es ist ernstlich besch%adigt."
	MOVE	EGG,PATH
	ICALL1	BAD-EGG
	CRLF	
	RTRUE	
?CCL30:	EQUAL?	PRSO,WINNER,TREE /?CCL32
	MOVE	PRSO,PATH
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTR	" f%allt auf die Erde."
?CCL32:	EQUAL?	PRSA,V?LEAP \FALSE
	CALL2	JIGS-UP,STR?282
	RSTACK	
?CCL10:	EQUAL?	RARG,M-ENTER \FALSE
	CALL	QUEUE,I-FOREST-ROOM,-1
	PUT	STACK,0,1
	RTRUE	


	.FUNCT	EGG-OBJECT:ANY:0:0
	EQUAL?	PRSA,V?MUNG,V?OPEN \?CCL3
	EQUAL?	PRSO,EGG \?CCL3
	FSET?	PRSO,OPENBIT \?CCL8
	PRINTR	"Das Ei ist schon offen."
?CCL8:	ZERO?	PRSI \?CCL10
	PRINTR	"Du hast weder das Werkzeug noch das Geschick."
?CCL10:	EQUAL?	PRSI,HANDS \?CCL12
	PRINTR	"Ich bezweifle, da%s du das tun kannst, ohne es ernstlich zu besch%adigen."
?CCL12:	FSET?	PRSI,WEAPONBIT /?CTR13
	FSET?	PRSI,TOOLBIT /?CTR13
	EQUAL?	PRSA,V?MUNG \?CCL14
?CTR13:	PRINTI	"Das Ei ist jetzt offen, aber die Tollpatschigkeit deines Versuches hat seinen %asthetischen Wert stark vermindert."
	ICALL1	BAD-EGG
	CRLF	
	RTRUE	
?CCL14:	FSET?	PRSO,FIGHTBIT \?CCL19
	PRINTI	"Und erst die Idee, "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" zu benutzen... Du %ubertriffst dich geradzu an originellen Einf%allen."
	RTRUE	
?CCL19:	PRINTI	"Die Idee "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" zu benutzen ist wirklich sehr originell."
	CRLF	
	FSET	PRSO,FIGHTBIT
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?HATCH,V?CLIMB-ON \?CCL21
	PRINTI	"Du f%uhlst ein Krachen unter deinen F%u%sen, und beim Nachsehen entdeckst du, da%s das Ei offen daliegt und schweren Schaden gelitten hat."
	ICALL1	BAD-EGG
	CRLF	
	RTRUE	
?CCL21:	EQUAL?	PRSA,V?THROW,V?MUNG,V?OPEN \FALSE
	EQUAL?	PRSA,V?THROW \?CND24
	MOVE	PRSO,HERE
?CND24:	PRINTI	"Es ist dir zwar gelungen, das Ei zu %offnen, aber du hast es mit deinen rauhen Methoden besch%adigt."
	ICALL1	BAD-EGG
	CRLF	
	RTRUE	


	.FUNCT	BAD-EGG:ANY:0:0,L
	IN?	CANARY,EGG \?CCL3
	PRINTC	32
	GETP	BROKEN-CANARY,P?FDESC
	PRINT	STACK
	JUMP	?CND1
?CCL3:	ICALL2	REMOVE-CAREFULLY,BROKEN-CANARY
?CND1:	LOC	EGG
	MOVE	BROKEN-EGG,STACK
	ICALL2	REMOVE-CAREFULLY,EGG
	RTRUE	


	.FUNCT	CANARY-OBJECT:ANY:0:0
	EQUAL?	PRSA,V?WIND \FALSE
	EQUAL?	PRSO,CANARY \?CCL6
	ZERO?	SING-SONG \?CCL9
	CALL1	FOREST-ROOM?
	ZERO?	STACK /?CCL9
	PRINTI	"Der Kanarienvogel schmettert eine Arie, aus einer l%angstvergessenen Oper. Er singt falsch. Aus dem Gr%unen fliegt ein lieblicher Singvogel. Er l%a%st sich auf einem Zweig direkt %uber deinem Kopf nieder und %offnet den Schnabel, um zu singen. Als er das tut, f%allt eine sch%one goldene Flitterkugel aus dem Schnabel, trifft deinen Kopf und landet glitzernd im Gras."
	CRLF	
	SET	'SING-SONG,TRUE-VALUE
	EQUAL?	HERE,UP-A-TREE \?CCL14
	PUSH	PATH
	JUMP	?CND12
?CCL14:	PUSH	HERE
?CND12:	MOVE	BAUBLE,STACK
	RTRUE	
?CCL9:	PRINTR	"Der Kanarienvogel zwitschert f%ur eine kurze Zeit munter, wenn auch etwas blechern."
?CCL6:	PRINTR	"Aus dem Innern des Kanarienvogels l%a%st sich ein unangenehmes mahlendes Ger%ausch vernehmen."


	.FUNCT	FOREST-ROOM?:ANY:0:0
	EQUAL?	HERE,FOREST-1,FOREST-2,FOREST-3 /TRUE
	EQUAL?	HERE,PATH,UP-A-TREE /TRUE
	RFALSE	


	.FUNCT	I-FOREST-ROOM:ANY:0:0
	CALL1	FOREST-ROOM?
	ZERO?	STACK \?CCL3
	CALL2	INT,I-FOREST-ROOM
	PUT	STACK,0,0
	RFALSE	
?CCL3:	RANDOM	100
	GRTR?	15,STACK \FALSE
	PRINTR	"In der Ferne h%orst du das Zwitschern eines Singvogels."


	.FUNCT	FOREST-ROOM:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	CALL	QUEUE,I-FOREST-ROOM,-1
	PUT	STACK,0,1
	RTRUE	
?CCL3:	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?CLIMB-UP,V?CLIMB-FOO \FALSE
	EQUAL?	PRSO,TREE \FALSE
	CALL2	DO-WALK,P?RAUF
	RSTACK	


	.FUNCT	WCLIF-OBJECT:ANY:0:0
	EQUAL?	PRSA,V?CLIMB-FOO,V?CLIMB-DOWN,V?CLIMB-UP \FALSE
	PRINTR	"Der Felsvorsprung ist zu steil zum Erklettern."


	.FUNCT	CLIFF-OBJECT:ANY:0:0
	EQUAL?	PRSA,V?LEAP /?CTR2
	EQUAL?	PRSA,V?PUT \?CCL3
	EQUAL?	PRSO,ME \?CCL3
?CTR2:	PRINTR	"Das w%are sehr gewagt. Vielleicht sogar t%odlich."
?CCL3:	EQUAL?	PRSI,CLIMBABLE-CLIFF \FALSE
	EQUAL?	PRSA,V?THROW-OFF,V?PUT \FALSE
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTI	" rollt in den Flu%s und gluck-gluck weg ist es."
	CRLF	
	CALL2	REMOVE-CAREFULLY,PRSO
	RSTACK	


	.FUNCT	ROPE-FUNCTION:ANY:0:0,RLOC
	EQUAL?	HERE,DOME-ROOM /?CCL3
	SET	'DOME-FLAG,FALSE-VALUE
	EQUAL?	PRSA,V?TIE \FALSE
	PRINTR	"Daran kannst du das Seil nicht binden."
?CCL3:	EQUAL?	PRSA,V?TIE \?CCL8
	EQUAL?	PRSI,RAILING \FALSE
	ZERO?	DOME-FLAG /?CCL14
	PRINTR	"Das Seil ist schon darangebunden."
?CCL14:	PRINTI	"Das Seil f%allt %uber die Seite und reicht bis zu 3 Metern %uber dem Boden."
	CRLF	
	SET	'DOME-FLAG,TRUE-VALUE
	FSET	ROPE,NDESCBIT
	LOC	ROPE >RLOC
	ZERO?	RLOC /?CCL16
	IN?	RLOC,ROOMS /TRUE
?CCL16:	MOVE	ROPE,HERE
	RTRUE	
?CCL8:	EQUAL?	PRSA,V?CLIMB-DOWN \?CCL20
	EQUAL?	PRSO,ROPE,ROOMS \?CCL20
	ZERO?	DOME-FLAG /?CCL20
	CALL2	DO-WALK,P?RUNTER
	RSTACK	
?CCL20:	EQUAL?	PRSA,V?TIE-UP \?CCL25
	EQUAL?	ROPE,PRSI \?CCL25
	FSET?	PRSO,ACTORBIT \?CCL30
	GETP	PRSO,P?STRENGTH
	LESS?	STACK,0 \?CCL33
	PRINTI	"Dein Versuch "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTI	" zu fesseln, weckt ihn auf."
	CALL2	AWAKEN,PRSO
	RSTACK	
?CCL33:	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTR	" wehrt sich, und du kannst ihn nicht fesseln."
?CCL30:	PRINTI	"Warum w%urdest du "
	ICALL2	DER-ACC-PRINT,PRSO
	PRINTR	" fesseln?"
?CCL25:	EQUAL?	PRSA,V?UNTIE \?CCL35
	ZERO?	DOME-FLAG /?CCL38
	SET	'DOME-FLAG,FALSE-VALUE
	FCLEAR	ROPE,NDESCBIT
	PRINTR	"Das Seil ist jetzt aufgebunden."
?CCL38:	PRINTR	"Es ist an nichts gebunden."
?CCL35:	EQUAL?	PRSA,V?DROP \?CCL40
	EQUAL?	HERE,DOME-ROOM \?CCL40
	ZERO?	DOME-FLAG \?CCL40
	MOVE	ROPE,TORCH-ROOM
	PRINTR	"Das Seil f%allt sanft nach unten auf die Erde."
?CCL40:	EQUAL?	PRSA,V?TAKE \FALSE
	ZERO?	DOME-FLAG /FALSE
	PRINTR	"Das Seil ist an das Gel%ander gebunden."


	.FUNCT	UNTIE-FROM:ANY:0:0
	EQUAL?	PRSO,ROPE \?CCL3
	ZERO?	DOME-FLAG /?CCL3
	EQUAL?	PRSI,RAILING \?CCL3
	CALL	PERFORM,V?UNTIE,PRSO
	RSTACK	
?CCL3:	PRINTR	"Es ist nicht daran gebunden."


	.FUNCT	SLIDE-FUNCTION:ANY:0:0
	EQUAL?	PRSA,V?CLIMB-DOWN,V?CLIMB-UP,V?THROUGH /?CTR2
	EQUAL?	PRSA,V?CLIMB-FOO /?CTR2
	EQUAL?	PRSA,V?PUT \?CCL3
	EQUAL?	PRSO,ME \?CCL3
?CTR2:	EQUAL?	HERE,CELLAR \?CCL11
	ICALL2	DO-WALK,P?WEST
	RTRUE	
?CCL11:	PRINTI	"Das Seil ist an das Gel%ander gebunden..."
	CRLF	
	CALL2	GOTO,CELLAR
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?PUT \FALSE
	CALL2	SLIDER,PRSO
	RSTACK	


	.FUNCT	SLIDER:ANY:1:1,OBJ
	FSET?	OBJ,TAKEBIT \?CCL3
	ICALL2	DER-NOM-CAP-PRINT,OBJ
	PRINTI	" f%allt auf die Rutschbahn und ist weg."
	CRLF	
	EQUAL?	OBJ,WATER \?CCL6
	CALL2	REMOVE-CAREFULLY,OBJ
	RSTACK	
?CCL6:	MOVE	OBJ,CELLAR
	RTRUE	
?CCL3:	CALL2	PICK-ONE,YUKS
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	SANDWICH-BAG-FCN:ANY:0:0
	EQUAL?	PRSA,V?SMELL \FALSE
	IN?	LUNCH,PRSO \FALSE
	PRINTR	"Es riecht nach scharfen Pepperoni."


	.FUNCT	DEAD-FUNCTION:ANY:0:1,FOO,M
	EQUAL?	PRSA,V?WALK \?CCL3
	EQUAL?	HERE,TIMBER-ROOM \FALSE
	EQUAL?	PRSO,P?WEST \FALSE
	PRINTR	"In Deinem Zustand kannst du hier nicht rein."
?CCL3:	EQUAL?	PRSA,V?SUPER-BRIEF,V?VERBOSE,V?BRIEF /FALSE
	EQUAL?	PRSA,V?RESTORE,V?SAVE,V?VERSION /FALSE
	EQUAL?	PRSA,V?RESTART,V?QUIT /FALSE
	EQUAL?	PRSA,V?ALARM,V?MUNG,V?ATTACK /?CTR14
	EQUAL?	PRSA,V?SWING \?CCL15
?CTR14:	PRINTR	"In deinem Zustand sind deine Angriffe sinnlos."
?CCL15:	EQUAL?	PRSA,V?EAT,V?CLOSE,V?OPEN /?CTR18
	EQUAL?	PRSA,V?DEFLATE,V?INFLATE,V?DRINK /?CTR18
	EQUAL?	PRSA,V?TIE,V?BURN,V?TURN /?CTR18
	EQUAL?	PRSA,V?RUB,V?UNTIE \?CCL19
?CTR18:	PRINTR	"Sogar das %ubersteigt deine F%ahigkeiten."
?CCL19:	EQUAL?	PRSA,V?WAIT \?CCL25
	PRINTR	"Warum nicht.? Du hast eine ganze Ewigkeit."
?CCL25:	EQUAL?	PRSA,V?LAMP-ON \?CCL27
	PRINTR	"Du brauchst kein Licht, das dir den Weg leuchtet."
?CCL27:	EQUAL?	PRSA,V?SCORE \?CCL29
	PRINTR	"Du bist tot! Wie kannst du da an den Stand des Spieles denken?"
?CCL29:	EQUAL?	PRSA,V?RUB,V?TAKE \?CCL31
	PRINTR	"Deine Hand geht durch das Ding direkt hindurch."
?CCL31:	EQUAL?	PRSA,V?INVENTORY,V?THROW,V?DROP \?CCL33
	PRINTR	"Du besitzt garnichts."
?CCL33:	EQUAL?	PRSA,V?DIAGNOSE \?CCL35
	PRINTR	"Du bist tot."
?CCL35:	EQUAL?	PRSA,V?LOOK \?CCL37
	PRINTI	"Der Raum sieht fremd und unirdisch aus"
	FIRST?	HERE /?CCL40
	PRINTC	46
	JUMP	?CND38
?CCL40:	PRINTI	" und die Dinge erscheinen unwirklich."
?CND38:	CRLF	
	FSET?	HERE,ONBIT /?CND41
	PRINTI	"Obwohl es hier keine Lichtquelle gibt, erscheint der Raum doch einigermassen beleuchtet."
	CRLF	
?CND41:	CRLF	
	RFALSE	
?CCL37:	EQUAL?	PRSA,V?PRAY \?CCL44
	EQUAL?	HERE,SOUTH-TEMPLE \?CCL47
	FCLEAR	LAMP,INVISIBLE
	PUTP	WINNER,P?ACTION,0
	SET	'ALWAYS-LIT,FALSE-VALUE
	SET	'DEAD,FALSE-VALUE
	IN?	TROLL,TROLL-ROOM \?CND48
	SET	'TROLL-FLAG,FALSE-VALUE
?CND48:	PRINTI	"Aus der Ferne ert%ont der Schall einer einsamen Trompete. Der Raum wird sehr hell und du f%uhlst dich k%orperlos. In einem Moment weicht die Helligkeit, und du f%uhlst dich, als ob du dich von einem langen Schlaf im Walde erhebst. Aus der Ferne h%orst du den schwachen Gesang eines Singvogels und das Rauschen des Waldes."
	CRLF	
	CRLF	
	CALL2	GOTO,FOREST-1
	RSTACK	
?CCL47:	PRINTR	"Deine Gebete werden nicht erh%ort."
?CCL44:	PRINTI	"Sogar das kannst du nicht."
	CRLF	
	SET	'P-CONT,FALSE-VALUE
	RETURN	2


	.FUNCT	LAKE-PSEUDO:ANY:0:0
	ZERO?	LOW-TIDE /?CCL3
	PRINTR	"Von dem See ist nicht viel %ubrig..."
?CCL3:	EQUAL?	PRSA,V?CROSS \?CCL5
	PRINTR	"Er ist zu breit zum %Uberqueren."
?CCL5:	EQUAL?	PRSA,V?THROUGH \FALSE
	PRINTR	"Du kannst in diesem See nicht schwimmen."


	.FUNCT	STREAM-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?THROUGH,V?SWIM \?CCL3
	PRINTR	"Du kannst in dem Flu%s nicht schwimmen."
?CCL3:	EQUAL?	PRSA,V?CROSS \FALSE
	PRINTR	"Die andere Seite ist eine abrupte Felswand."


	.FUNCT	CHASM-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?LEAP /?CTR2
	EQUAL?	PRSA,V?PUT \?CCL3
	EQUAL?	PRSO,ME \?CCL3
?CTR2:	PRINTR	"Du siehst dich um, bevor du springst, und erkennst, da%s du nie %uberleben w%urdest."
?CCL3:	EQUAL?	PRSA,V?CROSS \?CCL9
	PRINTR	"Es ist zu weit zum Springen, und es gibt keine Br%ucke."
?CCL9:	EQUAL?	PRSA,V?THROW-OFF,V?PUT \FALSE
	EQUAL?	PRSI,CHASM \FALSE
	ICALL2	DER-NOM-CAP-PRINT,PRSO
	PRINTI	" f%allt au%ser Sichtweite in die Spalte."
	CRLF	
	CALL2	REMOVE-CAREFULLY,PRSO
	RSTACK	


	.FUNCT	DOME-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?KISS \FALSE
	PRINTR	"Nein."


	.FUNCT	GATE-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?THROUGH \?CCL3
	ICALL2	DO-WALK,P?HINEIN
	RTRUE	
?CCL3:	PRINTR	"Das Tor ist von einer unsichtbaren Kraft gesch%utzt. Deine Z%ahne schmerzen, wenn du es ber%uhrst."


	.FUNCT	DOOR-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL3
	PRINTR	"Die T%ur gibt nicht nach."
?CCL3:	EQUAL?	PRSA,V?THROUGH \FALSE
	CALL2	DO-WALK,P?SUED
	RSTACK	


	.FUNCT	PAINT-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?MUNG \FALSE
	PRINTR	"Ein bi%schen Farbe splittert weg, zeigt mehr Farbe."


	.FUNCT	GAS-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?SMELL \FALSE
	PRINTR	"Es riecht hier nach Kohlenoxyd."


	.FUNCT	DO-FIGHT:ANY:1:1,LEN,CNT,RES,O,OO,OUT
?PRG1:	SET	'CNT,0
?PRG3:	INC	'CNT
	EQUAL?	CNT,LEN \?CND5
	SET	'RES,TRUE-VALUE
	RTRUE	
?CND5:	GET	VILLAINS,CNT >OO
	GET	OO,V-VILLAIN >O
	FSET?	O,FIGHTBIT \?PRG3
	GETP	O,P?ACTION
	CALL	STACK,F-BUSY?
	ZERO?	STACK \?PRG3
	CALL	VILLAIN-BLOW,OO,OUT >RES
	ZERO?	RES \?CCL11
	SET	'RES,FALSE-VALUE
	ZERO?	RES /TRUE
	ZERO?	OUT /TRUE
	DEC	'OUT
	ZERO?	OUT \?PRG1
	RTRUE	
?CCL11:	EQUAL?	RES,UNCONSCIOUS \?PRG3
	RANDOM	3
	ADD	1,STACK >OUT
	JUMP	?PRG3


	.FUNCT	REMARK:ANY:3:3,REMARK,D,W,LEN,CNT,STR
	GET	REMARK,0 >LEN
?PRG1:	IGRTR?	'CNT,LEN /?REP2
	GET	REMARK,CNT >STR
	EQUAL?	STR,WEP-NOM,WEP-NOM-CAP,WEP-ACC /?CTR6
	EQUAL?	STR,WEP-ACC-CAP,WEP-DAT,DER-WEP-ACC \?CCL7
?CTR6:	EQUAL?	STR,WEP-NOM \?CCL12
	PRINTI	"dein"
	FSET?	W,DERBIT /?CND10
	PRINTC	101
	JUMP	?CND10
?CCL12:	EQUAL?	STR,WEP-NOM-CAP \?CCL17
	PRINTI	"Dein"
	FSET?	W,DERBIT /?CND10
	FSET?	W,DASBIT /?CND10
	PRINTC	101
	JUMP	?CND10
?CCL17:	EQUAL?	STR,WEP-ACC \?CCL23
	PRINTI	"dein"
	FSET?	W,DERBIT \?CCL26
	PRINTI	"en"
	JUMP	?CND10
?CCL26:	FSET?	W,DASBIT /?CND10
	PRINTC	101
	JUMP	?CND10
?CCL23:	EQUAL?	STR,WEP-ACC-CAP \?CCL29
	PRINTI	"Dein"
	FSET?	W,DERBIT \?CCL32
	PRINTI	"en"
	JUMP	?CND10
?CCL32:	FSET?	W,DASBIT /?CND10
	PRINTC	101
	JUMP	?CND10
?CCL29:	EQUAL?	STR,WEP-DAT \?CCL35
	PRINTI	"dein"
	FSET?	W,DERBIT /?CTR37
	FSET?	W,DASBIT \?CCL38
?CTR37:	PRINTI	"em"
	JUMP	?CND10
?CCL38:	PRINTI	"er"
	JUMP	?CND10
?CCL35:	EQUAL?	STR,DER-WEP-ACC \?CND10
	ICALL2	DER-ACC-PRINT,W
?CND10:	EQUAL?	STR,DER-WEP-ACC /?PRG1
	PRINTC	32
	ICALL	DPRINT,W,FALSE-VALUE
	JUMP	?PRG1
?CCL7:	EQUAL?	STR,DEF-NOM,DEF-NOM-CAP,DEF-ACC /?CTR44
	EQUAL?	STR,DEF-DAT-CAP \?CCL45
?CTR44:	EQUAL?	STR,DEF-NOM \?CCL50
	PRINTI	"der"
	JUMP	?CND48
?CCL50:	EQUAL?	STR,DEF-NOM-CAP \?CCL52
	PRINTI	"Der"
	JUMP	?CND48
?CCL52:	EQUAL?	STR,DEF-ACC \?CCL54
	PRINTI	"den"
	JUMP	?CND48
?CCL54:	EQUAL?	STR,DEF-DAT-CAP \?CND48
	PRINTI	"Dem"
?CND48:	PRINTC	32
	ICALL	DPRINT,D,FALSE-VALUE
	JUMP	?PRG1
?CCL45:	PRINT	STR
	JUMP	?PRG1
?REP2:	CRLF	
	RTRUE	


	.FUNCT	FIGHT-STRENGTH:ANY:0:1,ADJUST?,S
	ASSIGNED?	'ADJUST? /?CND1
	SET	'ADJUST?,TRUE-VALUE
?CND1:	DIV	SCORE-MAX,5
	DIV	SCORE,STACK
	ADD	STRENGTH-MIN,STACK >S
	ZERO?	ADJUST? /?CCL5
	GETP	WINNER,P?STRENGTH
	ADD	S,STACK
	RSTACK	
?CCL5:	RETURN	S


	.FUNCT	VILLAIN-STRENGTH:ANY:1:1,OO,VILLAIN,OD,TMP
	GET	OO,V-VILLAIN >VILLAIN
	GETP	VILLAIN,P?STRENGTH >OD
	LESS?	OD,0 /?CND1
	EQUAL?	VILLAIN,THIEF \?CND3
	ZERO?	THIEF-ENGROSSED /?CND3
	GRTR?	OD,2 \?CND7
	SET	'OD,2
?CND7:	SET	'THIEF-ENGROSSED,FALSE-VALUE
?CND3:	ZERO?	PRSI \?PRD12
	RETURN	OD
?PRD12:	FSET?	PRSI,WEAPONBIT /?PRD13
	RETURN	OD
?PRD13:	GET	OO,V-BEST
	EQUAL?	STACK,PRSI /?CCL10
	RETURN	OD
?CCL10:	GET	OO,V-BEST-ADV
	SUB	OD,STACK >TMP
	LESS?	TMP,1 \?CND14
	SET	'TMP,1
?CND14:	SET	'OD,TMP
?CND1:	RETURN	OD


	.FUNCT	FIND-WEAPON:ANY:1:1,O,W
	FIRST?	O >W /?BOGUS1
?BOGUS1:	ZERO?	W /FALSE
?PRG4:	EQUAL?	W,STILETTO,AXE,SWORD /?CTR7
	EQUAL?	W,KNIFE,RUSTY-KNIFE \?CCL8
?CTR7:	RETURN	W
?CCL8:	NEXT?	W >W /?PRG4
	RFALSE	


	.FUNCT	VILLAIN-BLOW:ANY:2:2,OO,OUT?,VILLAIN,REMARKS,DWEAPON,ATT,DEF,OA,OD,TBL,RES,NWEAPON
	GET	OO,V-VILLAIN >VILLAIN
	GET	OO,V-MSGS >REMARKS
	FCLEAR	WINNER,STAGGERED
	FSET?	VILLAIN,STAGGERED \?CND1
	ICALL2	DER-NOM-CAP-PRINT,VILLAIN
	PRINTI	" gewinnt langsam die Kontrolle %uber seine F%u%se."
	CRLF	
	FCLEAR	VILLAIN,STAGGERED
	RTRUE	
?CND1:	CALL2	VILLAIN-STRENGTH,OO >ATT
	SET	'OA,ATT
	CALL1	FIGHT-STRENGTH >DEF
	GRTR?	DEF,0 \TRUE
	CALL2	FIGHT-STRENGTH,FALSE-VALUE >OD
	CALL2	FIND-WEAPON,WINNER >DWEAPON
	LESS?	DEF,0 \?CCL7
	SET	'RES,KILLED
	JUMP	?CND5
?CCL7:	EQUAL?	DEF,1 \?CCL10
	GRTR?	ATT,2 \?CND11
	SET	'ATT,3
?CND11:	SUB	ATT,1
	GET	DEF1-RES,STACK >TBL
	JUMP	?CND8
?CCL10:	EQUAL?	DEF,2 \?CCL14
	GRTR?	ATT,3 \?CND15
	SET	'ATT,4
?CND15:	SUB	ATT,1
	GET	DEF2-RES,STACK >TBL
	JUMP	?CND8
?CCL14:	GRTR?	DEF,2 \?CND8
	SUB	ATT,DEF >ATT
	LESS?	ATT,-1 \?CCL20
	SET	'ATT,-2
	JUMP	?CND18
?CCL20:	GRTR?	ATT,1 \?CND18
	SET	'ATT,2
?CND18:	ADD	ATT,2
	GET	DEF3-RES,STACK >TBL
?CND8:	RANDOM	9
	SUB	STACK,1
	GET	TBL,STACK >RES
	ZERO?	OUT? /?CND22
	EQUAL?	RES,STAGGER \?CCL26
	SET	'RES,HESITATE
	JUMP	?CND22
?CCL26:	SET	'RES,SITTING-DUCK
?CND22:	EQUAL?	RES,STAGGER \?CND27
	ZERO?	DWEAPON /?CND27
	CALL2	ZPROB,25
	ZERO?	STACK /?CND27
	SET	'RES,LOSE-WEAPON
?CND27:	SUB	RES,1
	GET	REMARKS,STACK
	CALL2	RANDOM-ELEMENT,STACK
	ICALL	REMARK,STACK,WINNER,DWEAPON
?CND5:	EQUAL?	RES,MISSED /?CND32
	EQUAL?	RES,HESITATE /?CND32
	EQUAL?	RES,UNCONSCIOUS /?CND32
	EQUAL?	RES,KILLED /?CTR37
	EQUAL?	RES,SITTING-DUCK \?CCL38
?CTR37:	SET	'DEF,0
	JUMP	?CND32
?CCL38:	EQUAL?	RES,LIGHT-WOUND \?CCL42
	DLESS?	'DEF,0 \?CND43
	SET	'DEF,0
?CND43:	GRTR?	LOAD-ALLOWED,50 \?CND32
	SUB	LOAD-ALLOWED,10 >LOAD-ALLOWED
	JUMP	?CND32
?CCL42:	EQUAL?	RES,SERIOUS-WOUND \?CCL48
	SUB	DEF,2 >DEF
	LESS?	DEF,0 \?CND49
	SET	'DEF,0
?CND49:	GRTR?	LOAD-ALLOWED,50 \?CND32
	SUB	LOAD-ALLOWED,20 >LOAD-ALLOWED
	JUMP	?CND32
?CCL48:	EQUAL?	RES,STAGGER \?CCL54
	FSET	WINNER,STAGGERED
	JUMP	?CND32
?CCL54:	MOVE	DWEAPON,HERE
	CALL2	FIND-WEAPON,WINNER >NWEAPON
	ZERO?	NWEAPON /?CND32
	PRINTI	"Gl%ucklicherweise hast du noch "
	ICALL2	EIN-ACC-PRINT,NWEAPON
	PRINTC	46
	CRLF	
?CND32:	CALL	WINNER-RESULT,DEF,RES,OD
	RSTACK	


	.FUNCT	HERO-BLOW:ANY:0:0,OO,VILLAIN,OUT?,DWEAPON,ATT,DEF,CNT,OA,OD,TBL,RES,NWEAPON,LEN
	GET	VILLAINS,0 >LEN
?PRG1:	INC	'CNT
	EQUAL?	CNT,LEN /?REP2
	GET	VILLAINS,CNT >OO
	GET	OO,V-VILLAIN
	EQUAL?	STACK,PRSO \?PRG1
?REP2:	FSET	PRSO,FIGHTBIT
	FSET?	WINNER,STAGGERED \?CND7
	PRINTI	"Du erholst dich immer noch von dem letzten Hieb, so da%s dein Angriff keine Wirkung hat."
	CRLF	
	FCLEAR	WINNER,STAGGERED
	RTRUE	
?CND7:	CALL1	FIGHT-STRENGTH >ATT
	LESS?	ATT,1 \?CND9
	SET	'ATT,1
?CND9:	SET	'OA,ATT
	GET	OO,V-VILLAIN >VILLAIN
	CALL2	VILLAIN-STRENGTH,OO >DEF
	SET	'OD,DEF
	ZERO?	OD \?CND11
	EQUAL?	PRSO,WINNER \?CND13
	CALL2	JIGS-UP,STR?283
	RSTACK	
?CND13:	ICALL2	DER-ACC-CAP-PRINT,VILLAIN
	PRINTR	" angreifen ist sinnlos."
?CND11:	CALL2	FIND-WEAPON,VILLAIN >DWEAPON
	ZERO?	DWEAPON /?CTR16
	LESS?	DEF,0 \?CCL17
?CTR16:	ICALL2	DER-NOM-CAP-PRINT,VILLAIN
	PRINTI	", wer "
	LESS?	DEF,0 \?CCL22
	PRINTI	"bewu%stlos"
	JUMP	?CND20
?CCL22:	PRINTI	"unbewaffnet"
?CND20:	PRINTI	" ist, kann sich nicht wehren. "
	ICALL2	PRONOUN-NOM-CAP-PRINT,VILLAIN
	PRINTI	" stirbt."
	CRLF	
	SET	'RES,KILLED
	JUMP	?CND15
?CCL17:	EQUAL?	DEF,1 \?CCL25
	GRTR?	ATT,2 \?CND26
	SET	'ATT,3
?CND26:	SUB	ATT,1
	GET	DEF1-RES,STACK >TBL
	JUMP	?CND23
?CCL25:	EQUAL?	DEF,2 \?CCL29
	GRTR?	ATT,3 \?CND30
	SET	'ATT,4
?CND30:	SUB	ATT,1
	GET	DEF2-RES,STACK >TBL
	JUMP	?CND23
?CCL29:	GRTR?	DEF,2 \?CND23
	SUB	ATT,DEF >ATT
	LESS?	ATT,-1 \?CCL35
	SET	'ATT,-2
	JUMP	?CND33
?CCL35:	GRTR?	ATT,1 \?CND33
	SET	'ATT,2
?CND33:	ADD	ATT,2
	GET	DEF3-RES,STACK >TBL
?CND23:	RANDOM	9
	SUB	STACK,1
	GET	TBL,STACK >RES
	ZERO?	OUT? /?CND37
	EQUAL?	RES,STAGGER \?CCL41
	SET	'RES,HESITATE
	JUMP	?CND37
?CCL41:	SET	'RES,SITTING-DUCK
?CND37:	EQUAL?	RES,STAGGER \?CND42
	ZERO?	DWEAPON /?CND42
	RANDOM	100
	GRTR?	25,STACK \?CND42
	SET	'RES,LOSE-WEAPON
?CND42:	SUB	RES,1
	GET	HERO-MELEE,STACK
	CALL2	RANDOM-ELEMENT,STACK
	ICALL	REMARK,STACK,PRSO,PRSI
?CND15:	EQUAL?	RES,MISSED /?CND47
	EQUAL?	RES,HESITATE /?CND47
	EQUAL?	RES,UNCONSCIOUS \?CCL52
	SUB	0,DEF >DEF
	JUMP	?CND47
?CCL52:	EQUAL?	RES,KILLED /?CTR53
	EQUAL?	RES,SITTING-DUCK \?CCL54
?CTR53:	SET	'DEF,0
	JUMP	?CND47
?CCL54:	EQUAL?	RES,LIGHT-WOUND \?CCL58
	DLESS?	'DEF,0 \?CND47
	SET	'DEF,0
	JUMP	?CND47
?CCL58:	EQUAL?	RES,SERIOUS-WOUND \?CCL62
	SUB	DEF,2 >DEF
	LESS?	DEF,0 \?CND47
	SET	'DEF,0
	JUMP	?CND47
?CCL62:	EQUAL?	RES,STAGGER \?CCL66
	FSET	PRSO,STAGGERED
	JUMP	?CND47
?CCL66:	FCLEAR	DWEAPON,NDESCBIT
	FSET	DWEAPON,WEAPONBIT
	MOVE	DWEAPON,HERE
	ICALL2	THIS-IS-IT,DWEAPON
?CND47:	CALL	VILLAIN-RESULT,PRSO,DEF,RES
	RSTACK	


	.FUNCT	WINNER-RESULT:ANY:3:3,DEF,RES,OD
	ZERO?	DEF \?CCL3
	PUSH	-10000
	JUMP	?CND1
?CCL3:	SUB	DEF,OD
?CND1:	PUTP	WINNER,P?STRENGTH,STACK
	SUB	DEF,OD
	LESS?	STACK,0 \?CND4
	CALL	QUEUE,I-CURE,CURE-WAIT
	PUT	STACK,0,1
?CND4:	CALL1	FIGHT-STRENGTH
	GRTR?	STACK,0 /?CCL8
	CALL2	FIGHT-STRENGTH,FALSE-VALUE
	SUB	0,STACK
	ADD	1,STACK
	PUTP	WINNER,P?STRENGTH,STACK
	ICALL2	JIGS-UP,STR?284
	RFALSE	
?CCL8:	RETURN	RES


	.FUNCT	VILLAIN-RESULT:ANY:3:3,VILLAIN,DEF,RES
	PUTP	VILLAIN,P?STRENGTH,DEF
	ZERO?	DEF \?CCL3
	FCLEAR	VILLAIN,FIGHTBIT
	PRINTI	"Fast gleichzeitig mit dem letzten Atemzug des "
	ICALL	DPRINT,VILLAIN,FALSE-VALUE
	EQUAL?	VILLAIN,THIEF \?CCL6
	PRINTI	"es"
	JUMP	?CND4
?CCL6:	PRINTC	115
?CND4:	PRINTI	" verh%ullt ihn eine Wolke aus gespenstigem schwarzem Nebel, und wenn der Nebel sich hebt, ist die Leiche verschwunden."
	CRLF	
	ICALL2	REMOVE-CAREFULLY,VILLAIN
	GETP	VILLAIN,P?ACTION
	ICALL	STACK,F-DEAD
	RETURN	RES
?CCL3:	EQUAL?	RES,UNCONSCIOUS \?CCL8
	GETP	VILLAIN,P?ACTION
	ICALL	STACK,F-UNCONSCIOUS
	RETURN	RES
?CCL8:	RETURN	RES


	.FUNCT	WINNING?:ANY:1:1,V,VS,PS
	GETP	V,P?STRENGTH >VS
	CALL1	FIGHT-STRENGTH
	SUB	VS,STACK >PS
	GRTR?	PS,3 \?CCL3
	RANDOM	100
	GRTR?	90,STACK /TRUE
	RFALSE	
?CCL3:	GRTR?	PS,0 \?CCL7
	RANDOM	100
	GRTR?	75,STACK /TRUE
	RFALSE	
?CCL7:	ZERO?	PS \?CCL11
	RANDOM	100
	GRTR?	50,STACK /TRUE
	RFALSE	
?CCL11:	GRTR?	VS,1 \?CCL15
	RANDOM	100
	GRTR?	25,STACK /TRUE
	RFALSE	
?CCL15:	RANDOM	100
	GRTR?	10,STACK /TRUE
	RFALSE	


	.FUNCT	I-CURE:ANY:0:0,S
	GETP	WINNER,P?STRENGTH >S
	GRTR?	S,0 \?CCL3
	SET	'S,0
	PUTP	WINNER,P?STRENGTH,S
	JUMP	?CND1
?CCL3:	LESS?	S,0 \?CND1
	INC	'S
	PUTP	WINNER,P?STRENGTH,S
?CND1:	LESS?	S,0 \?CCL7
	LESS?	LOAD-ALLOWED,LOAD-MAX \?CND8
	ADD	LOAD-ALLOWED,10 >LOAD-ALLOWED
?CND8:	CALL	QUEUE,I-CURE,CURE-WAIT
	PUT	STACK,0,1
	RTRUE	
?CCL7:	SET	'LOAD-ALLOWED,LOAD-MAX
	CALL2	INT,I-CURE
	PUT	STACK,0,0
	RTRUE	


	.FUNCT	I-FIGHT:ANY:0:0,FIGHT?,LEN,CNT,OO,O,P
	GET	VILLAINS,0 >LEN
	ZERO?	DEAD \FALSE
	SET	'CNT,0
?PRG3:	INC	'CNT
	EQUAL?	CNT,LEN /?REP4
	GET	VILLAINS,CNT >OO
	GET	OO,V-VILLAIN >O
	IN?	O,HERE \?CCL9
	FSET?	O,INVISIBLE /?CCL9
	EQUAL?	O,THIEF \?CCL14
	ZERO?	THIEF-ENGROSSED /?CCL14
	SET	'THIEF-ENGROSSED,FALSE-VALUE
	JUMP	?PRG3
?CCL14:	GETP	O,P?STRENGTH
	LESS?	STACK,0 \?CCL18
	GET	OO,V-PROB >P
	ZERO?	P /?CCL21
	RANDOM	100
	GRTR?	P,STACK \?CCL21
	PUT	OO,V-PROB,0
	ICALL2	AWAKEN,O
	JUMP	?PRG3
?CCL21:	ADD	P,25
	PUT	OO,V-PROB,STACK
	JUMP	?PRG3
?CCL18:	FSET?	O,FIGHTBIT /?CCL24
	GETP	O,P?ACTION
	CALL	STACK,F-FIRST?
	ZERO?	STACK /?PRG3
?CCL24:	SET	'FIGHT?,TRUE-VALUE
	JUMP	?PRG3
?CCL9:	FSET?	O,FIGHTBIT \?CND27
	GETP	O,P?ACTION
	ICALL	STACK,F-BUSY?
?CND27:	EQUAL?	O,THIEF \?CND29
	SET	'THIEF-ENGROSSED,FALSE-VALUE
?CND29:	FCLEAR	WINNER,STAGGERED
	FCLEAR	O,STAGGERED
	FCLEAR	O,FIGHTBIT
	ICALL2	AWAKEN,O
	JUMP	?PRG3
?REP4:	ZERO?	FIGHT? /FALSE
	CALL2	DO-FIGHT,LEN
	RSTACK	


	.FUNCT	AWAKEN:ANY:1:1,O,S
	GETP	O,P?STRENGTH >S
	LESS?	S,0 \TRUE
	SUB	0,S
	PUTP	O,P?STRENGTH,STACK
	GETP	O,P?ACTION
	ICALL	STACK,F-CONSCIOUS
	RTRUE	


	.FUNCT	I-SWORD:ANY:0:0,DEM,G,NG,P,T,L
	CALL2	INT,I-SWORD >DEM
	GETP	SWORD,P?TVALUE >G
	IN?	SWORD,ADVENTURER \?CCL3
	CALL2	INFESTED?,HERE
	ZERO?	STACK /?CCL6
	SET	'NG,2
	JUMP	?CND4
?CCL6:	SET	'P,0
?PRG7:	NEXTP	HERE,P >P
	ZERO?	P /?CND4
	LESS?	P,LOW-DIRECTION /?PRG7
	GETPT	HERE,P >T
	PTSIZE	T >L
	EQUAL?	L,UEXIT,CEXIT,DEXIT \?PRG7
	GET	T,0
	CALL2	INFESTED?,STACK
	ZERO?	STACK /?PRG7
	SET	'NG,1
?CND4:	EQUAL?	NG,G /FALSE
	EQUAL?	NG,2 \?CCL21
	PRINTI	"Dein Schwert hat hell zu leuchten begonen."
	CRLF	
	JUMP	?CND17
?CCL21:	EQUAL?	NG,1 \?CCL23
	PRINTI	"Dein Schwert leuchtet mit einem schwachen blauen Schimmer."
	CRLF	
	JUMP	?CND17
?CCL23:	ZERO?	NG \?CND17
	PRINTI	"Dein Schwert leuchtet nicht mehr."
	CRLF	
?CND17:	PUTP	SWORD,P?TVALUE,NG
	RTRUE	
?CCL3:	PUT	DEM,C-ENABLED?,0
	RFALSE	


	.FUNCT	INFESTED?:ANY:1:1,R,F
	FIRST?	R >F /?PRG2
?PRG2:	ZERO?	F /FALSE
	FSET?	F,ACTORBIT \?CCL8
	FSET?	F,INVISIBLE \TRUE
?CCL8:	NEXT?	F >F /?PRG2
	RFALSE	


	.FUNCT	I-THIEF:ANY:0:0,RM,ROBJ,HERE?,ONCE,FLG
	LOC	THIEF >RM
?PRG1:	FSET?	THIEF,INVISIBLE /?PRD6
	SET	'HERE?,1
	JUMP	?PEN5
?PRD6:	SET	'HERE?,0
?PEN5:	ZERO?	HERE? /?CND3
	LOC	THIEF >RM
?CND3:	EQUAL?	RM,TREASURE-ROOM \?CCL10
	EQUAL?	RM,HERE /?CCL10
	ZERO?	HERE? /?CND13
	ICALL1	HACK-TREASURES
	SET	'HERE?,FALSE-VALUE
?CND13:	ICALL2	DEPOSIT-BOOTY,TREASURE-ROOM
	JUMP	?CND8
?CCL10:	EQUAL?	RM,HERE \?CCL16
	FSET?	RM,ONBIT /?CCL16
	IN?	TROLL,HERE /?CCL16
	CALL2	THIEF-VS-ADVENTURER,HERE?
	ZERO?	STACK \TRUE
	FSET?	THIEF,INVISIBLE \?CND8
	SET	'HERE?,FALSE-VALUE
	JUMP	?CND8
?CCL16:	IN?	THIEF,RM \?CND24
	FSET?	THIEF,INVISIBLE /?CND24
	FSET	THIEF,INVISIBLE
	SET	'HERE?,FALSE-VALUE
?CND24:	FSET?	RM,TOUCHBIT \?CND8
	ICALL	ROB,RM,THIEF,75
	CALL2	IN-MAZE?,RM
	ZERO?	STACK /?CCL32
	CALL2	IN-MAZE?,HERE
	ZERO?	STACK /?CCL32
	CALL2	ROB-MAZE,RM >FLG
	JUMP	?CND8
?CCL32:	CALL2	STEAL-JUNK,RM >FLG
?CND8:	ZERO?	ONCE /?PRT39
	SET	'ONCE,0
	JUMP	?PRE41
?PRT39:	SET	'ONCE,1
?PRE41:	ZERO?	ONCE /?REP2
	ZERO?	HERE? \?REP2
	ICALL1	RECOVER-STILETTO
?PRG42:	ZERO?	RM /?CCL45
	NEXT?	RM >RM /?CND44
?CCL45:	FIRST?	ROOMS >RM /?CND44
?CND44:	FSET?	RM,SACREDBIT /?PRG42
	FSET?	RM,RLANDBIT \?PRG42
	MOVE	THIEF,RM
	FCLEAR	THIEF,FIGHTBIT
	FSET	THIEF,INVISIBLE
	SET	'THIEF-HERE,FALSE-VALUE
	JUMP	?PRG1
?REP2:	EQUAL?	RM,TREASURE-ROOM /?CND53
	ICALL2	DROP-JUNK,RM
?CND53:	RETURN	FLG


	.FUNCT	DROP-JUNK:ANY:1:1,RM,X,N,FLG
	FIRST?	THIEF >X /?PRG2
?PRG2:	ZERO?	X \?CND4
	RETURN	FLG
?CND4:	NEXT?	X >N /?BOGUS6
?BOGUS6:	EQUAL?	X,STILETTO,LARGE-BAG /?CND7
	GETP	X,P?TVALUE
	ZERO?	STACK \?CND7
	CALL2	ZPROB,30
	ZERO?	STACK /?CND7
	FCLEAR	X,INVISIBLE
	MOVE	X,RM
	ZERO?	FLG \?CND7
	EQUAL?	RM,HERE \?CND7
	PRINTI	"Der R%auber, der seinen Sack durchsucht, l%a%st ein paar Dinge, die er f%ur wertlos h%alt, fallen."
	CRLF	
	SET	'FLG,TRUE-VALUE
?CND7:	SET	'X,N
	JUMP	?PRG2


	.FUNCT	RECOVER-STILETTO:ANY:0:0
	LOC	THIEF
	IN?	STILETTO,STACK \FALSE
	FSET	STILETTO,NDESCBIT
	MOVE	STILETTO,THIEF
	RTRUE	


	.FUNCT	STEAL-JUNK:ANY:1:1,RM,X,N
	FIRST?	RM >X /?PRG2
?PRG2:	ZERO?	X /FALSE
	NEXT?	X >N /?BOGUS6
?BOGUS6:	GETP	X,P?TVALUE
	ZERO?	STACK \?CND7
	FSET?	X,TAKEBIT \?CND7
	FSET?	X,SACREDBIT /?CND7
	FSET?	X,INVISIBLE /?CND7
	EQUAL?	X,STILETTO /?CCL8
	CALL2	ZPROB,10
	ZERO?	STACK /?CND7
?CCL8:	MOVE	X,THIEF
	FSET	X,TOUCHBIT
	FSET	X,INVISIBLE
	EQUAL?	X,ROPE \?CND16
	SET	'DOME-FLAG,FALSE-VALUE
?CND16:	EQUAL?	RM,HERE \FALSE
	PRINTI	"Pl%otzlich bemerkst du, da%s "
	ICALL2	DER-NOM-PRINT,X
	PRINTR	" verschwunden ist."
?CND7:	SET	'X,N
	JUMP	?PRG2


	.FUNCT	ROB:ANY:2:3,WHAT,WHERE,PROB,N,X,ROBBED?
	FIRST?	WHAT >X /?PRG2
?PRG2:	ZERO?	X \?CND4
	RETURN	ROBBED?
?CND4:	NEXT?	X >N /?BOGUS6
?BOGUS6:	FSET?	X,INVISIBLE /?CND7
	FSET?	X,SACREDBIT /?CND7
	GETP	X,P?TVALUE
	GRTR?	STACK,0 \?CND7
	ZERO?	PROB /?CCL8
	RANDOM	100
	GRTR?	PROB,STACK \?CND7
?CCL8:	MOVE	X,WHERE
	FSET	X,TOUCHBIT
	EQUAL?	WHERE,THIEF \?CND15
	FSET	X,INVISIBLE
?CND15:	SET	'ROBBED?,TRUE-VALUE
?CND7:	SET	'X,N
	JUMP	?PRG2


	.FUNCT	V-DIAGNOSE:ANY:0:0,MS:FIX,WD:FIX,RS:FIX,?TMP1
	CALL2	FIGHT-STRENGTH,FALSE-VALUE >MS
	GETP	WINNER,P?STRENGTH >WD
	ADD	MS,WD >RS
	CALL2	INT,I-CURE
	GET	STACK,C-ENABLED?
	ZERO?	STACK \?CCL3
	SET	'WD,0
	JUMP	?CND1
?CCL3:	SUB	0,WD >WD
?CND1:	ZERO?	WD \?CCL6
	PRINTI	"Du bist kerngesund."
	JUMP	?CND4
?CCL6:	PRINTI	"Du hast "
	EQUAL?	WD,1 \?CCL9
	PRINTI	"eine leichte Verletzung,"
	JUMP	?CND4
?CCL9:	EQUAL?	WD,2 \?CCL11
	PRINTI	"eine ernste Verletzung,"
	JUMP	?CND4
?CCL11:	EQUAL?	WD,3 \?CCL13
	PRINTI	"mehrere Verletzungen,"
	JUMP	?CND4
?CCL13:	GRTR?	WD,3 \?CND4
	PRINTI	"ernste Verletzungen,"
?CND4:	ZERO?	WD /?CND15
	PRINTI	" die nach "
	SUB	WD,1
	MUL	CURE-WAIT,STACK >?TMP1
	CALL2	INT,I-CURE
	GET	STACK,C-TICK
	ADD	?TMP1,STACK
	PRINTN	STACK
	PRINTI	" Z%ugen geheilt sein werden."
?CND15:	CRLF	
	PRINTI	"Du kannst "
	ZERO?	RS \?CCL19
	PRINTI	"bald den Tod erwarten."
	JUMP	?CND17
?CCL19:	EQUAL?	RS,1 \?CCL21
	PRINTI	"von einer weiteren leichten Verletzung get%otet werden."
	JUMP	?CND17
?CCL21:	EQUAL?	RS,2 \?CCL23
	PRINTI	"von einer schweren Verletzung get%otet werden."
	JUMP	?CND17
?CCL23:	EQUAL?	RS,3 \?CCL25
	PRINTI	"eine schwere Verletzung %uberleben"
	JUMP	?CND17
?CCL25:	GRTR?	RS,3 \?CND17
	PRINTI	"mehrere Verletzungen %uberleben."
?CND17:	CRLF	
	ZERO?	DEATHS /FALSE
	PRINTI	"Du bist "
	EQUAL?	DEATHS,1 \?CCL32
	PRINTI	"einmal"
	JUMP	?CND30
?CCL32:	PRINTI	"zweimal"
?CND30:	PRINTR	" get%otet worden."


	.FUNCT	V-SCORE:ANY:0:1,ASK?:ATOM
	ASSIGNED?	'ASK? /?CND1
	SET	'ASK?,TRUE-VALUE
?CND1:	PRINTI	"Dein Spielstand ist "
	PRINTN	SCORE
	PRINTI	" (aus 350 Gesamtpunkten), in "
	PRINTN	MOVES
	EQUAL?	MOVES,1 \?CCL5
	PRINTI	" Z%uge."
	JUMP	?CND3
?CCL5:	PRINTI	" Z%ugen."
?CND3:	CRLF	
	PRINTI	"Damit bist du ein "
	EQUAL?	SCORE,350 \?CCL8
	PRINTI	"Meisterabenteurer"
	JUMP	?CND6
?CCL8:	GRTR?	SCORE,330 \?CCL10
	PRINTI	"Hexenmeister"
	JUMP	?CND6
?CCL10:	GRTR?	SCORE,300 \?CCL12
	PRINTI	"Meister"
	JUMP	?CND6
?CCL12:	GRTR?	SCORE,200 \?CCL14
	PRINTI	"Abenteurer"
	JUMP	?CND6
?CCL14:	GRTR?	SCORE,100 \?CCL16
	PRINTI	"Jungabenteurer"
	JUMP	?CND6
?CCL16:	GRTR?	SCORE,50 \?CCL18
	PRINTI	"Anf%angerabenteurer"
	JUMP	?CND6
?CCL18:	GRTR?	SCORE,25 \?CCL20
	PRINTI	"Amateurabenteurer"
	JUMP	?CND6
?CCL20:	PRINTI	"Anf%anger"
?CND6:	PRINTC	46
	CRLF	
	RETURN	SCORE


	.FUNCT	JIGS-UP:ANY:1:2,DESC,PLAYER?
	SET	'WINNER,ADVENTURER
	ZERO?	DEAD /?CND1
	PRINTI	"
Nur eine au%sergew%ohnliche Person kann get%otet werden, nachdem sie schon tot ist.Leider k%onnen nur au%sergew%ohnliche talentierte Leute damit fertig werden. Mir fehlt dieses Talent. Schade."
	CRLF	
	ICALL1	FINISH
?CND1:	PRINT	DESC
	CRLF	
	ZERO?	LUCKY \?PRG5
	PRINTI	"Pech gehabt, was?"
	CRLF	
?PRG5:	ICALL2	SCORE-UPD,-10
	PRINTI	" 
    ****  Du bist tot  **** 

"
	LOC	WINNER
	FSET?	STACK,VEHBIT \?CND7
	SET	'OHERE,FALSE-VALUE
	MOVE	WINNER,HERE
?CND7:	LESS?	DEATHS,2 /?CCL11
	PRINTI	"Du bist eindeutig ein lebensm%uder Narr. Wir verbieten Psychopaten den Eintritt zur H%ohle, da sie die anderen Abenteurer gef%ahrden. Deine leiblichen %Uberreste werden dem Land der lebendigen Toten %ubergeben, wo deine Mitabenteurer sich an ihnen erg%otzen k%onnen."
	CRLF	
	CALL1	FINISH
	RSTACK	
?CCL11:	INC	'DEATHS
	MOVE	WINNER,HERE
	SET	'OHERE,FALSE-VALUE
	FSET?	SOUTH-TEMPLE,TOUCHBIT \?CCL14
	PRINTI	"W%ahrend du deinen letzten Atemzug tust, f%uhlst du dich all deiner B%urden entledigt. Dieses Gef%uhl verl%a%st dich, als du dich vor den Toren der H%olle befindest, wo die Geister dich anheulen und dir den Eintritt verwehren. Deine Sinne sind getr%ubt. Die Dinge in dem Kerker scheinen nicht wahrnehmbar, farblos, sogar unrealistisch."
	CRLF	
	CRLF	
	SET	'DEAD,TRUE-VALUE
	SET	'TROLL-FLAG,TRUE-VALUE
	SET	'ALWAYS-LIT,TRUE-VALUE
	PUTP	WINNER,P?ACTION,DEAD-FUNCTION
	ICALL2	GOTO,ENTRANCE-TO-HADES
	JUMP	?CND12
?CCL14:	PRINTI	"Na, la%s uns noch mal sehen...
Na ja, wir sollten Dir vielleicht noch eine Chance geben.  Wir k%onnen es f%ur dich nicht alles in Ordnung bringen, aber man kann ja nicht alles haben."
	CRLF	
	CRLF	
	ICALL2	GOTO,FOREST-1
?CND12:	FCLEAR	TRAP-DOOR,TOUCHBIT
	SET	'P-CONT,FALSE-VALUE
	ICALL1	RANDOMIZE-OBJECTS
	ICALL1	KILL-INTERRUPTS
	RETURN	2


	.FUNCT	RANDOMIZE-OBJECTS:ANY:0:0,R,F,N,L
	IN?	LAMP,WINNER \?CND1
	MOVE	LAMP,LIVING-ROOM
?CND1:	IN?	COFFIN,WINNER \?CND3
	MOVE	COFFIN,EGYPT-ROOM
?CND3:	PUTP	SWORD,P?TVALUE,0
	FIRST?	WINNER >N /?BOGUS5
?BOGUS5:	GET	ABOVE-GROUND,0 >L
?PRG6:	SET	'F,N
	ZERO?	F /TRUE
	NEXT?	F >N /?BOGUS10
?BOGUS10:	GETP	F,P?TVALUE
	GRTR?	STACK,0 \?CCL13
?PRG14:	ZERO?	R \?CND16
	FIRST?	ROOMS >R /?CND16
?CND16:	FSET?	R,RLANDBIT \?CCL21
	FSET?	R,ONBIT /?CCL21
	RANDOM	100
	GRTR?	50,STACK \?CCL21
	MOVE	F,R
	JUMP	?PRG6
?CCL21:	NEXT?	R >R /?PRG14
	JUMP	?PRG14
?CCL13:	RANDOM	L
	GET	ABOVE-GROUND,STACK
	MOVE	F,STACK
	JUMP	?PRG6


	.FUNCT	KILL-INTERRUPTS:ANY:0:0
	CALL2	INT,I-XB
	PUT	STACK,0,0
	CALL2	INT,I-XC
	PUT	STACK,0,0
	CALL2	INT,I-CYCLOPS
	PUT	STACK,0,0
	CALL2	INT,I-LANTERN
	PUT	STACK,0,0
	CALL2	INT,I-CANDLES
	PUT	STACK,0,0
	CALL2	INT,I-SWORD
	PUT	STACK,0,0
	CALL2	INT,I-FOREST-ROOM
	PUT	STACK,0,0
	CALL2	INT,I-MATCH
	PUT	STACK,0,0
	FCLEAR	MATCH,ONBIT
	RTRUE	


	.FUNCT	BAG-OF-COINS-F:ANY:0:0
	CALL	STUPID-CONTAINER,BAG-OF-COINS,STR?405
	RSTACK	


	.FUNCT	TRUNK-F:ANY:0:0
	CALL	STUPID-CONTAINER,TRUNK,STR?406
	RSTACK	


	.FUNCT	STUPID-CONTAINER:ANY:2:2,OBJ,STR
	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL3
	PRINTI	"Die "
	PRINT	STR
	PRINTR	" befinden sich darin in Sicherheit. Es besteht kein Grund dazu, das zu tun."
?CCL3:	EQUAL?	PRSA,V?EXAMINE,V?LOOK-INSIDE \?CCL5
	PRINTI	"Da sind viele "
	PRINT	STR
	PRINTR	" darin."
?CCL5:	EQUAL?	PRSA,V?PUT \FALSE
	EQUAL?	PRSI,OBJ \FALSE
	PRINTI	"Sei nicht albern. Dann w%are es ja nicht mehr "
	ICALL2	EIN-NOM-PRINT,OBJ
	PRINTR	"."


	.FUNCT	DUMB-CONTAINER:ANY:0:0
	EQUAL?	PRSA,V?LOOK-INSIDE,V?CLOSE,V?OPEN \?CCL3
	PRINTR	"Das geht nicht."
?CCL3:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"Es sieht eigentlich wie "
	ICALL2	EIN-ACC-PRINT,PRSO
	PRINTR	" aus."


	.FUNCT	GARLIC-F:ANY:0:0
	EQUAL?	PRSA,V?EAT \FALSE
	ICALL2	REMOVE-CAREFULLY,PRSO
	PRINTR	"Zur H%olle! Auf diese Weise kannst du zwar keine Freunde gewinnen, aber hier ist sowieso niemand besonders freundlich. Also schluck's."


	.FUNCT	CHAIN-PSEUDO:ANY:0:0
	EQUAL?	PRSA,V?MOVE,V?TAKE \?CCL3
	PRINTR	"Die Kette l%ost sich nicht."
?CCL3:	EQUAL?	PRSA,V?LOWER,V?RAISE \?CCL5
	PRINTR	"Vielleicht solltest du das mit dem Korb machen."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Die Kette h%alt einen Korb innerhalb eines Schachtes."


	.FUNCT	TROLL-ROOM-F:ANY:1:1,RARG
	EQUAL?	RARG,M-ENTER \FALSE
	IN?	TROLL,HERE \FALSE
	CALL2	THIS-IS-IT,TROLL
	RSTACK	

	.ENDI
