"1DUNGEON for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc. All Rights Reserved.
	-- GERMAN EDITION"

<GLOBAL SCORE-MAX 350>

<GLOBAL FALSE-FLAG <>>

"SUBTITLE OBJECTS"

<OBJECT BOARD
	(LOC LOCAL-GLOBALS)
	(SYNONYM BOARDS BOARD)
	(DESC "board")
	(FLAGS NDESCBIT)
	(ACTION BOARD-F)>

<OBJECT TEETH
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;OVERBOARD BORD TEETH)
	(DESC "set of teeth")
	(FLAGS NDESCBIT)
	(ACTION TEETH-F)>

<OBJECT WALL
	(LOC GLOBAL-OBJECTS)
	(SYNONYM WALL WALLS)
	(ADJECTIVE SURROUNDING)
	(DESC "surrounding wall")>

;<OBJECT GRANITE-WALL
	(LOC GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE GRANITE)
	(DESC "granite wall")
	(ACTION GRANITE-WALL-F)>

<OBJECT SONGBIRD
	(SYNONYM SINGVOGEL VOGEL)
	;(ADJECTIVE SONG)
	(DESC "Singvogel")
	(FLAGS NDESCBIT)
	(ACTION SONGBIRD-F)>

<OBJECT WHITE-HOUSE	
	(SYNONYM HAUS HERRENHAUS)
	(ADJECTIVE ALTE ALTEN SCHOENE SCHOENEN)
	(ADJDESC "weiss")
	(DESC "Haus")
	(FLAGS NDESCBIT DASBIT)
	(ACTION WHITE-HOUSE-F)>

<OBJECT FOREST
	(LOC LOCAL-GLOBALS)
	(SYNONYM FOREST TREES PINES HEMLOCKS)
	(ADJECTIVE SCHON)
	(ADJDESC "sch%on")
	(DESC "Wald")
	(FLAGS NDESCBIT DERBIT)
	(ACTION FOREST-F)>

<OBJECT TREE
	(LOC LOCAL-GLOBALS)
	(SYNONYM TREE BRANCH)
	(ADJECTIVE LARGE STORM ;"-TOSSED")
	(DESC "tree")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT MOUNTAIN-RANGE
	(LOC MOUNTAINS)
	(DESC "mountain range")
	(SYNONYM MOUNTAIN RANGE)
	(ADJECTIVE IMPASSABLE FLATHEAD)
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION MOUNTAIN-RANGE-F)>

<OBJECT GLOBAL-WATER
	(LOC LOCAL-GLOBALS)
	(SYNONYM WATER QUANTITY)
	(DESC "water")
	(FLAGS DRINKBIT)
	(ACTION WATER-F)>

<OBJECT WATER
	(LOC BOTTLE)
	(SYNONYM WATER QUANTITY LIQUID H2O)
	(DESC "quantity of water")
	(FLAGS TRYTAKEBIT TAKEBIT DRINKBIT)
	(ACTION WATER-F)
	(SIZE 4)>

<OBJECT	KITCHEN-WINDOW
	(LOC LOCAL-GLOBALS)
	(SYNONYM WINDOW)
	(ADJECTIVE KITCHEN SMALL)
	(DESC "kitchen window")
	(FLAGS DOORBIT NDESCBIT)
	(ACTION KITCHEN-WINDOW-F)>

<OBJECT CHIMNEY
	(LOC LOCAL-GLOBALS)
	(SYNONYM CHIMNEY)
	(ADJECTIVE DARK NARROW)
	(DESC "chimney")
	(ACTION CHIMNEY-F)
	(FLAGS CLIMBBIT NDESCBIT)>

<OBJECT GHOSTS
	(LOC ENTRANCE-TO-HADES)
	(SYNONYM GHOSTS SPIRITS FIENDS FORCE)
	(ADJECTIVE INVISIBLE EVIL)
	(DESC "number of ghosts")
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION GHOSTS-F)>

<OBJECT SKULL
	(LOC LAND-OF-LIVING-DEAD)
	(SYNONYM KRISTA HIRNSCHALE KOPF)
	(ADJECTIVE KRISTA CRYSTA)
	(DESC "Hirnschale")
	(ADJDESC "kristall")
	(FDESC
"In einer Ecke dieses Raumes ist ein wundervoll gearbeiteter Kristalsch%adel. Er scheint dich, einigermassen unanagenehm anzugrinsen.")
	(FLAGS TAKEBIT)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT LOWERED-BASKET
	(LOC LOWER-SHAFT)
	(SYNONYM CAGE DUMBWAITER BASKET)
	(ADJECTIVE LOWERED)
	(LDESC "Von der Ketter h%angt ein Korb.")
	(DESC "basket")
	(FLAGS TRYTAKEBIT)
	(ACTION BASKET-F)>

<OBJECT RAISED-BASKET
	(LOC SHAFT-ROOM)
	(SYNONYM CAGE DUMBWAITER BASKET)
	(DESC "basket")
	(FLAGS TRANSBIT TRYTAKEBIT CONTBIT OPENBIT)
	(ACTION BASKET-F)
	(LDESC "Am Ende der Kette ist ein Korb.")
	(CAPACITY 50)>

<OBJECT LUNCH
	(LOC SANDWICH-BAG)
	(SYNONYM FOOD SANDWICH LUNCH DINNER)
	(ADJECTIVE HOT PEPPER)
	(DESC "lunch")
	(FLAGS TAKEBIT FOODBIT)
	(LDESC "Ein Pepperoni-Brot liegt hier.")>

<OBJECT BAT
	(LOC BAT-ROOM)
	(SYNONYM BAT VAMPIRE)
	(ADJECTIVE VAMPIRE DERANGED)
	(DESC "bat")
	(FLAGS ACTORBIT TRYTAKEBIT)
	(DESCFCN BAT-D)
	(ACTION BAT-F)>

<OBJECT BELL
	(LOC NORTH-TEMPLE)
	(SYNONYM BELL)
	(ADJECTIVE SMALL BRASS)
	(DESC "brass bell")
	(FLAGS TAKEBIT)
	(ACTION BELL-F)>

<OBJECT HOT-BELL
	(SYNONYM BELL)
	(ADJECTIVE BRASS HOT RED SMALL)
	(DESC "red hot brass bell")
	(FLAGS TRYTAKEBIT)
	(ACTION HOT-BELL-F)
	(LDESC "Auf der Erde ist eine rotgl%uhende Glocke.")>

<OBJECT AXE
	(LOC TROLL)
	(SYNONYM AXE AX)
	(ADJECTIVE BLOODY)
	(DESC "bloody axe")
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(ACTION AXE-F)
	(SIZE 25)>

<OBJECT BOLT
	(LOC DAM-ROOM)
	(SYNONYM BOLT NUT)
	(ADJECTIVE METAL LARGE)
	(DESC "bolt")
	(FLAGS NDESCBIT TURNBIT TRYTAKEBIT)
	(ACTION BOLT-F)>

<OBJECT BUBBLE
	(LOC DAM-ROOM)
	(SYNONYM BUBBLE)
	(ADJECTIVE SMALL GREEN PLASTIC)
	(DESC "green bubble")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BUBBLE-F)>

<OBJECT ALTAR
	(LOC SOUTH-TEMPLE)
	(SYNONYM ALTAR)
	(DESC "altar")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT)
	(CAPACITY 50)>

<OBJECT BOOK
	(LOC ALTAR)
	(SYNONYM BOOK PRAYER PAGE BOOKS)
	(ADJECTIVE LARGE BLACK)
	(DESC "black book")
	(FLAGS READBIT TAKEBIT CONTBIT BURNBIT TURNBIT)
	(ACTION BLACK-BOOK)
	(FDESC "Auf dem Altar liegt ein grosses schwarzes Buch. Es ist bei Seite 569 aufgeschlagen.")
	(SIZE 10)
	(TEXT "12592.Gebot|
|
Oh Ihr, die Ihr zueinander sagt: \"Tag, Seemam\"|
Seid Ihr Euch der Gr%osse Eurer S%unden vor den G%ottern bewusst?|
Es steht geschrieben, dass Ihr zwischen Steinen zermalmt werden sollt.|
Sollen die zornigen G%otter Eure %Uberreste in das Kneippbecken werfen?|
Wahrhaftig Eure Augen sollten mit einem spitzen Stock geblendet werden!|
Bis ans Ende dieser Erde sollt Ihr wandern,|
Und in den Hades am Ende Eurer Tage sollt Ihr verbannt werden.|
Wahrhaftig Ihr sollt b%ussen f%ur eure Schlauheit." )>

<OBJECT BROKEN-LAMP
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BROKEN)
	(DESC "broken lantern")
	(FLAGS TAKEBIT)>

<OBJECT SCEPTRE
	(LOC COFFIN)
	(SYNONYM SCEPTRE SCEPTER TREASURE)
	(ADJECTIVE SHARP EGYPTIAN ANCIENT ENAMELED)
	(DESC "sceptre")
	(FLAGS TAKEBIT WEAPONBIT)
	(ACTION SCEPTRE-FUNCTION)
	(LDESC
"Ein reichverziertes Zepter, das zu einer scharfen Spitze ausl%auft,
ist hier.")
	;"ren Aegy.. umlaut?"
	(FDESC
"Ein Zepter, das wom%oglich direkt aus Aegypten stammt, ist in dem Sarg. Das Zepter ist mit farbigem Emaille verziert und l%auft zu einer scharfen Spitze
aus.")
	(SIZE 3)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT TIMBERS
	(LOC TIMBER-ROOM)
	(SYNONYM TIMBERS PILE TIMBER)
	(ADJECTIVE WOODEN BROKEN)
	(DESC "broken timber")
	(FLAGS TAKEBIT)
	(SIZE 50)>

<OBJECT	SLIDE
	(LOC LOCAL-GLOBALS)
	(SYNONYM CHUTE RAMP SLIDE)
	(ADJECTIVE STEEP METAL TWISTING)
	(DESC "chute")
	(FLAGS CLIMBBIT)
	(ACTION SLIDE-FUNCTION)>

<OBJECT KITCHEN-TABLE
	(LOC KITCHEN)
	(SYNONYM TABLE)
	(ADJECTIVE KITCHEN)
	(DESC "kitchen table")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 50)>

<OBJECT ATTIC-TABLE
	(LOC ATTIC)
	(SYNONYM TABLE)
	(DESC "table")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 40)>

<OBJECT SANDWICH-BAG
	(LOC KITCHEN-TABLE)
	(SYNONYM BAG SACK)
	(ADJECTIVE BROWN ELONGATED SMELLY)
	(DESC "Sack")
	(ADJDESC "braun")
	(FLAGS TAKEBIT CONTBIT BURNBIT DERBIT)
	(FDESC
"Auf dem Tisch ist ein l%anglicher brauner Sack. Er riecht nach scharfen
Pepperoni.")
	(CAPACITY 9)
	(SIZE 9)
	(ACTION SANDWICH-BAG-FCN)>

<OBJECT TOOL-CHEST
	(LOC MAINTENANCE-ROOM)
	(SYNONYM CHEST CHESTS GROUP TOOLCHESTS)
	(ADJECTIVE TOOL)
	(DESC "group of tool chests")
	(FLAGS CONTBIT OPENBIT TRYTAKEBIT SACREDBIT)
	(ACTION TOOL-CHEST-FCN)>

<OBJECT YELLOW-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE YELLOW)
	(DESC "yellow button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BROWN-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BROWN)
	(DESC "brown button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT RED-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE RED)
	(DESC "red button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BLUE-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BLUE)
	(DESC "blue button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

;"ren: check sp. of Troph- throughout"
<OBJECT TROPHY-CASE	
	(LOC LIVING-ROOM)
	(SYNONYM CASE)
	(ADJECTIVE TROPHY)
	(DESC "trophy case")
	(FLAGS TRANSBIT CONTBIT NDESCBIT TRYTAKEBIT SEARCHBIT)
	(ACTION TROPHY-CASE-FCN)
	(CAPACITY 10000)>

<OBJECT RUG
	(LOC LIVING-ROOM)
	(SYNONYM RUG CARPET)
	(ADJECTIVE LARGE ORIENTAL)
	(DESC "carpet")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION RUG-FCN)>

<OBJECT CHALICE
	(LOC TREASURE-ROOM)
	(SYNONYM CHALICE CUP SILVER TREASURE)
	(ADJECTIVE SILVER ENGRAVINGS)
	(DESC "chalice")
	(FLAGS TAKEBIT TRYTAKEBIT CONTBIT)
	(ACTION CHALICE-FCN)
	(LDESC "Es gibt hier einen Silberkelch, der sehr fein graviert ist.")
	(CAPACITY 5)
	(SIZE 10)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT GARLIC
	(LOC SANDWICH-BAG)
	(SYNONYM GARLIC CLOVE)
	(DESC "clove of garlic")
	(FLAGS TAKEBIT FOODBIT)
	(ACTION GARLIC-F)
	(SIZE 4)>

<OBJECT TRIDENT
	(LOC ATLANTIS-ROOM)
	(SYNONYM TRIDENT FORK TREASURE)
	(ADJECTIVE POSEIDON OWN CRYSTA)
	(DESC "crystal trident")
	(FLAGS TAKEBIT)
	(FDESC "Am Ufer liegt Poseidons ureigener Dreizack aus Kristall.")
	(SIZE 20)
	(VALUE 4)
	(TVALUE 11)>

<OBJECT CYCLOPS
	(LOC CYCLOPS-ROOM)
	(SYNONYM CYCLOPS MONSTER EYE)
	(ADJECTIVE HUNGRY GIANT)
	(DESC "cyclops")
	(FLAGS ACTORBIT NDESCBIT TRYTAKEBIT)
	(ACTION CYCLOPS-FCN)
	(STRENGTH 10000)>

<OBJECT DAM
	(LOC DAM-ROOM)
	(SYNONYM DAM GATE GATES FCD\#3)
	(DESC "dam")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION DAM-FUNCTION)>

<OBJECT TRAP-DOOR
	(LOC LIVING-ROOM)
	(SYNONYM DOOR TRAPDOOR TRAP-DOOR COVER)
	(ADJECTIVE TRAP DUSTY)
	(DESC "trap door")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	(ACTION TRAP-DOOR-FCN)>

<OBJECT BOARDED-WINDOW
	(LOC LOCAL-GLOBALS)
        (SYNONYM WINDOW)
	(ADJECTIVE BOARDED)
	(DESC "boarded window")
	(FLAGS NDESCBIT)
	(ACTION BOARDED-WINDOW-FCN)>

<OBJECT FRONT-DOOR
	(LOC WEST-OF-HOUSE)
	(SYNONYM DOOR)
	(ADJECTIVE FRONT BOARDED)
	(DESC "door")
	(FLAGS DOORBIT NDESCBIT)
	(ACTION FRONT-DOOR-FCN)>

<OBJECT BARROW-DOOR	
	(LOC STONE-BARROW)
	(SYNONYM DOOR)
	(ADJECTIVE HUGE STONE)
	(DESC "stone door")
	(FLAGS DOORBIT NDESCBIT OPENBIT)
	(ACTION BARROW-DOOR-FCN)>

<OBJECT BARROW
	(LOC STONE-BARROW)
	(SYNONYM BARROW TOMB)
	(ADJECTIVE MASSIVE STONE)
	(DESC "stone barrow")
	(FLAGS NDESCBIT)
	(ACTION BARROW-FCN)>

<OBJECT BOTTLE
	(LOC KITCHEN-TABLE)
	(SYNONYM BOTTLE CONTAINER)
	(ADJECTIVE CLEAR GLASS)
	(DESC "Flasche")
	(FLAGS TAKEBIT TRANSBIT CONTBIT)
	(ACTION BOTTLE-FUNCTION)
	(FDESC "Auf dem Tisch steht eine Flasche.")
	(CAPACITY 4)>

<OBJECT CRACK
	(LOC LOCAL-GLOBALS)
	(SYNONYM CRACK)
	(ADJECTIVE NARROW)
	(DESC "crack")
	(FLAGS NDESCBIT)
	(ACTION CRACK-FCN)>

<OBJECT COFFIN
	(LOC EGYPT-ROOM)
	(SYNONYM COFFIN CASKET TREASURE)
	(ADJECTIVE SOLID GOLD)
	(DESC "gold coffin")
	(FLAGS TAKEBIT CONTBIT SACREDBIT SEARCHBIT)
	(LDESC
"Der reingoldene Sarg, den man f%ur das Begr%abnis von Ramses II. benutzt hat ist hier.")
	(CAPACITY 35)
	(SIZE 55)
	(VALUE 10)
	(TVALUE 15)>

<OBJECT GRATE
	(LOC LOCAL-GLOBALS)
	(SYNONYM GRATE GRATING)
	(DESC "grating")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	(ACTION GRATE-FUNCTION)>

<OBJECT PUMP
	(LOC RESERVOIR-NORTH)
	(SYNONYM PUMP AIR-PUMP TOOL TOOLS)
	(ADJECTIVE SMALL HAND-HELD)
	(DESC "hand-held air pump")
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT DIAMOND
	(SYNONYM DIAMOND TREASURE)
	(ADJECTIVE HUGE ENORMOUS)
	(DESC "huge diamond")
	(FLAGS TAKEBIT)
	(LDESC "There is an enormous diamond (perfectly cut) here.")
	(VALUE 10)
	(TVALUE 10)>

<OBJECT JADE
	(LOC BAT-ROOM)
	(SYNONYM FIGURINE TREASURE)
	(ADJECTIVE EXQUISITE JADE)
	(DESC "jade figurine")
	(FLAGS TAKEBIT)
	(LDESC "Es gibt hier eine kostbare Jade-Figur.")
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT KNIFE
	(LOC ATTIC-TABLE)
	(SYNONYM KNIVES KNIFE BLADE)
	(ADJECTIVE NASTY UNRUSTY)
	(DESC "nasty knife")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(FDESC "Auf einem Tisch liegt ein gef%ahrlich aussehendes Messer.")
	(ACTION KNIFE-F)>

<OBJECT BONES
	(LOC MAZE-5)
	(SYNONYM BONES SKELETON BODY)
	(DESC "skeleton")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION SKELETON)>

<OBJECT BURNED-OUT-LANTERN
	(LOC MAZE-5)
	(SYNONYM LANTERN LAMP)
	(ADJECTIVE RUSTY BURNED DEAD USELESS)
	(DESC "Lanterna")
	(ADJDESC "nutzlos")
	(FLAGS TAKEBIT)
	(FDESC "Die nutzlose Lanterne des toten Abenteurers liegt hier.")
	(SIZE 20)>

<OBJECT BAG-OF-COINS
	(LOC MAZE-5)
	(SYNONYM BAG COINS TREASURE)
	(ADJECTIVE OLD LEATHER)
	(DESC "Ledersack voll M%unzen")
	(FLAGS TAKEBIT)
	(LDESC 
"Ein sch%abiger Ledersack vollgepfropft mit Goldm%unzen ist hier.")
	(ACTION BAG-OF-COINS-F)
	(SIZE 15)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT LAMP
	(LOC LIVING-ROOM)
	(SYNONYM LAMP LANTERN LIGHT)
	(ADJECTIVE BRASS)
	(DESC "Messingleuchte")
	(ADJDESC "batteriengespeist")
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION LANTERN)
	(FDESC 
"Eine batteriengespeiste Messingleuchte ist auf dem Troph%aenschrank.")
	(LDESC "There is a brass lantern (battery-powered) here.")
	(SIZE 15)>

<OBJECT EMERALD
	(LOC BUOY)
	(SYNONYM EMERALD TREASURE)
	(ADJECTIVE LARGE)
	(DESC "large emerald")
	(FLAGS TAKEBIT)
	(VALUE 5)
	(TVALUE 10)>

<OBJECT ADVERTISEMENT
	(LOC MAILBOX)
	(SYNONYM ADVERTISEMENT LEAFLET BOOKLET MAIL)
	(ADJECTIVE SMALL)
	(DESC "leaflet")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(LDESC "Ein kleine Zettel liegt auf der Erde.")
	(TEXT
"\"Willkommen in Zork!|
|
Zork ist ein Spiel voller Abente%ur, Gefahren und gemeiner Schlauheit Beim Spielen wirst du einige der wundersamsten Welten entdecken, die irgend ein Sterblicher gesehen hat. Kein Heimcomputer sollte ohne dieses Spiel sein.\"")
	(SIZE 2)>

<OBJECT LEAK
	(LOC MAINTENANCE-ROOM)
	(SYNONYM LEAK DRIP PIPE)
	(DESC "leak")
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION LEAK-FUNCTION)>

<OBJECT MACHINE
	(LOC MACHINE-ROOM)
	(SYNONYM MACHINE PDP10 DRYER LID)
	(DESC "machine")
	(FLAGS CONTBIT NDESCBIT TRYTAKEBIT)
	(ACTION MACHINE-F)
	(CAPACITY 50)>

<OBJECT INFLATED-BOAT
	(SYNONYM BOAT RAFT)
	(ADJECTIVE INFLAT MAGIC PLASTIC SEAWORTHY)
	(DESC "magic boat")
	(FLAGS TAKEBIT BURNBIT VEHBIT OPENBIT SEARCHBIT)
	(ACTION RBOAT-FUNCTION)
	(CAPACITY 100)
	(SIZE 20)
	(VTYPE NONLANDBIT)>

<OBJECT MAILBOX
	(LOC WEST-OF-HOUSE)
	(SYNONYM MAILBOX BOX)
	(ADJECTIVE SMALL)
	(DESC "small mailbox")
	(FLAGS CONTBIT TRYTAKEBIT)
	(CAPACITY 10)
	(ACTION MAILBOX-F)>

<OBJECT MATCH
	(LOC DAM-LOBBY)
	(SYNONYM MATCH MATCHES MATCHBOOK)
	(ADJECTIVE MATCH)
	(DESC "matchbook")
	(FLAGS READBIT TAKEBIT)
	(ACTION MATCH-FUNCTION)
	(LDESC
"Eine Streichholzschachtel mit der Auffschrift: Visit Beautiful FCD#3 liegt hier.")
	(SIZE 2)
	(TEXT
"|
(Schliesse die Schachtel, bevor du das Streichholz anz%undest.)|
|
Herr Superschlau aus Hack sagt: Bevor ich in diese Vorlesung ging war ich ein mickeriger Bit-Mischer. Jetzt, mit dem, was ich an der Hacker T.U gelernt habe, f%uhle ich mich wichtig und kann mit den Besten interfacen und verr%uckt spielen.|
|
Herr Dr. Leer hatte folgendes zu sagen: \"Vor nur zehn kurzen Tagen hatte ich nur die Aussicht auf eine chancenlose Stelle als Doktor. Jetzt habe ich eine vielversprechende Zukunft und mache wirkliche Zorkkohle.\"|
|
Die Technische Uni Hack kann diese fantastischen Resultate nicht jedem versprechen. Aber, einen Doktortitel von der Hack TU malt auch deine Zukunft rosiger aus.")>

<OBJECT MIRROR-2
	(LOC MIRROR-ROOM-2)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT MIRROR-1
	(LOC MIRROR-ROOM-1)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT PAINTING
	(LOC GALLERY)
	(SYNONYM PAINTING ART CANVAS TREASURE)
	(ADJECTIVE BEAUTI)
	(DESC "Gem%alde")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION PAINTING-FCN)
	(FDESC
"Gl%ucklicherweise bleibt dir noch eine Chance auch ein Gangster zu werden, denn an der anderen Wand h%angt ein Gem%alde von einmaliger Sch%onheit.")
	(LDESC "A painting by a neglected genius is here.")
	(SIZE 15)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT CANDLES
	(LOC SOUTH-TEMPLE)
	(SYNONYM CANDLES PAIR)
	(ADJECTIVE BURNING)
	(DESC "Kerzenpaar")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT DASBIT)
	(ACTION CANDLES-FCN)
	(FDESC 
"Auf dem Altars steht ein Kerzenpaar.")
	(SIZE 10)>

<OBJECT GUNK
	(SYNONYM GUNK PIECE SLAG)
	(ADJECTIVE SMALL VITREOUS)
	(DESC "small piece of vitreous slag")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION GUNK-FUNCTION)
	(SIZE 10)>

<OBJECT BODIES
	(LOC LOCAL-GLOBALS)
	(SYNONYM BODIES BODY REMAINS PILE)
	(ADJECTIVE MANGLED)
	(DESC "pile of bodies")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BODY-FUNCTION)>

<OBJECT LEAVES
	(LOC GRATING-CLEARING)
	(SYNONYM LEAVES LEAF PILE)
	(DESC "pile of leaves")
	(FLAGS TAKEBIT BURNBIT TRYTAKEBIT)
	(ACTION LEAF-PILE)
	(LDESC "Auf dem Boden liegt ein Bl%atterhaufen.")
	(SIZE 25)>

<OBJECT PUNCTURED-BOAT
	(SYNONYM BOAT PILE PLASTIC)
	(ADJECTIVE PLASTIC PUNCTURE LARGE)
	(DESC "punctured boat")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION DBOAT-FUNCTION)
	(SIZE 20)>

<OBJECT INFLATABLE-BOAT
	(LOC DAM-BASE)
	(SYNONYM BOAT PILE PLASTIC VALVE)
	(ADJECTIVE PLASTIC INFLAT)
	(DESC "pile of plastic")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION IBOAT-FUNCTION)
	(LDESC
"Hier gibt es einen Haufen Plastik, an dem ein kleines Ventil befestigt ist.")
	(SIZE 20)>

<OBJECT BAR
	(LOC LOUD-ROOM)
	(SYNONYM BAR PLATINUM TREASURE)
	(ADJECTIVE PLATINUM LARGE)
	(DESC "platinum bar")
	(FLAGS TAKEBIT SACREDBIT)
	(LDESC "Auf dem Boden liegt ein Platinbarren.")
	(SIZE 20)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT POT-OF-GOLD
	(LOC END-OF-RAINBOW)
	(SYNONYM POT GOLD TREASURE)
	(ADJECTIVE GOLD)
	(DESC "pot of gold")
	(FLAGS TAKEBIT INVISIBLE)
	(FDESC "Am Ende des Regenbogens steht ein Topf voll Gold.")
	(SIZE 15)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT PRAYER
	(LOC NORTH-TEMPLE)
	(SYNONYM PRAYER INSCRIPTION)
	(ADJECTIVE ANCIENT OLD)
	(DESC "prayer")
	(FLAGS READBIT SACREDBIT NDESCBIT)
	(TEXT
"The prayer is inscribed in an ancient script, rarely used today. It seems
to be a philippic against small insects, absent-mindedness, and the picking
up and dropping of small objects. The final verse consigns trespassers to
the land of the dead. All evidence indicates that the beliefs of the ancient
Zorkers were obscure." )>

<OBJECT RAILING
	(LOC DOME-ROOM)
	(SYNONYM RAILING RAIL)
	(ADJECTIVE WOODEN)
	(DESC "wooden railing")
	(FLAGS NDESCBIT)>

<OBJECT RAINBOW
	(LOC LOCAL-GLOBALS)
	(SYNONYM RAINBOW)
	(DESC "rainbow")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION RAINBOW-FCN)>

<OBJECT RIVER
	(LOC LOCAL-GLOBALS)
	(DESC "river")
	(SYNONYM RIVER)
	(ADJECTIVE FRIGID)
	(ACTION RIVER-FUNCTION)
	(FLAGS NDESCBIT)>

<OBJECT BUOY
	(LOC RIVER-4)
	(SYNONYM BUOY)
	(ADJECTIVE RED)
	(DESC "Markierungsboje")
	(ADJDESC "rot")
	(FLAGS TAKEBIT CONTBIT)
	(FDESC 
"Es gibt hier eine rote Markierungsboje (Wahrscheinlich eine Warnung).")
	(CAPACITY 20)
	(SIZE 10)
	(ACTION TREASURE-INSIDE)>

<ROUTINE TREASURE-INSIDE ()
	 <COND (<VERB? OPEN>
		<SCORE-OBJ ,EMERALD>
		<RFALSE>)>>
<OBJECT ROPE
	(LOC ATTIC)
	(SYNONYM ROPE HEMP COIL)
	(ADJECTIVE LARGE)
	(DESC "Seil")
	(FLAGS TAKEBIT SACREDBIT TRYTAKEBIT)
	(ACTION ROPE-FUNCTION)
	(FDESC "Ein dickes aufgerolltes Seil liegt in der Ecke.")
	(SIZE 10)>

<OBJECT RUSTY-KNIFE
	(LOC MAZE-5)
	(SYNONYM KNIVES KNIFE)
	(ADJECTIVE RUSTY)
	(DESC "Messer")
	(ADJDESC "rostig")
	(FLAGS TAKEBIT TRYTAKEBIT WEAPONBIT TOOLBIT)
	(ACTION RUSTY-KNIFE-FCN)
	(FDESC "Neben dem Knochenger%ust liegt ein rostiges Messer.")
	(SIZE 20)>

<OBJECT SAND
	(LOC SANDY-CAVE)
	(SYNONYM SAND)
	(DESC "sand")
	(FLAGS NDESCBIT)
	(ACTION SAND-FUNCTION)>

<OBJECT BRACELET
	(LOC GAS-ROOM)
	(SYNONYM BRACELET JEWEL SAPPHIRE TREASURE)
	(ADJECTIVE SAPPHIRE)
	(DESC "sapphire-encrusted bracelet")
	(FLAGS TAKEBIT)
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT SCREWDRIVER
	(LOC MAINTENANCE-ROOM)
	(SYNONYM SCREWDRIVER TOOL TOOLS DRIVER)
	(ADJECTIVE SCREW)
	(DESC "screwdriver")
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT KEYS
	(LOC MAZE-5)
	(SYNONYM KEY)
	(ADJECTIVE SKELETON)
	(DESC "skeleton key")
	(FDESC 
"Der Abenteurer war nicht nur gl%ucklos, er war auch verschlossen. Neben dem
Skelett liegt ein Schl%ussel.")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT SHOVEL
	(LOC SANDY-BEACH)
	(SYNONYM SHOVEL TOOL TOOLS)
	(DESC "shovel")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 15)>

<OBJECT COAL
	(LOC DEAD-END-5)
	(SYNONYM COAL PILE HEAP)
	(ADJECTIVE SMALL)
	(DESC "small pile of coal")
	(FLAGS TAKEBIT BURNBIT)
	(SIZE 20)>

<OBJECT LADDER
	(LOC LOCAL-GLOBALS)
	(SYNONYM LADDER)
	(ADJECTIVE WOODEN RICKETY NARROW)
	(DESC "wooden ladder")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT SCARAB
	(LOC SANDY-CAVE)
	(SYNONYM SCARAB BUG BEETLE TREASURE)
	(ADJECTIVE BEAUTI CARVED JEWELED)
	(DESC "beautiful jeweled scarab")
	(FLAGS TAKEBIT INVISIBLE)
	(SIZE 8)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT LARGE-BAG
	(LOC THIEF)
	(SYNONYM BAG)
	(ADJECTIVE LARGE THIEFS)
	(DESC "large bag")
	(ACTION LARGE-BAG-F)
	(FLAGS TRYTAKEBIT NDESCBIT)>  

<OBJECT STILETTO
	(LOC THIEF)
	(SYNONYM STILETTO)
	(ADJECTIVE VICIOUS)
	(DESC "stiletto")
	(ACTION STILETTO-FUNCTION)
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(SIZE 10)>

<OBJECT MACHINE-SWITCH
	(LOC MACHINE-ROOM)
	(SYNONYM SWITCH)
	(DESC "switch")
	(FLAGS NDESCBIT TURNBIT)
	(ACTION MSWITCH-FUNCTION)>

<OBJECT WOODEN-DOOR
	(LOC LIVING-ROOM)
	(SYNONYM DOOR LETTERING WRITING)
	(ADJECTIVE WOODEN GOTHIC STRANGE WEST)
	(DESC "wooden door")
	(FLAGS READBIT DOORBIT NDESCBIT TRANSBIT)
	(ACTION FRONT-DOOR-FCN)
	(TEXT
"The engravings translate to \"This space intentionally left blank.\"")>

<OBJECT SWORD
	(LOC LIVING-ROOM)
	(SYNONYM SWORD ORCRIST GLAMDRING BLADE)
	(ADJECTIVE ELVISH OLD ANTIQUE)
	(DESC "Elfenschwert")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(ACTION SWORD-FCN)
	(FDESC
"%Uber dem Troph%aen Schrank h%angt ein Elfenschwert aus dem Altertum.")
	(SIZE 30)
	(TVALUE 0)>

<OBJECT MAP
	(LOC TROPHY-CASE)
	(SYNONYM PARCHMENT MAP)
	(ADJECTIVE ANTIQUE OLD ANCIENT)
	(DESC "ancient map")
	(FLAGS INVISIBLE READBIT TAKEBIT)
	(FDESC "In dem Troph%aenschrank ist ein uraltes Pergament, das eine Landkarte sein k%onte.")
	(SIZE 2)
	(TEXT
"The map shows a forest with three clearings. The largest clearing contains
a house. Three paths leave the large clearing. One of these paths, leading
southwest, is marked \"To Stone Barrow\".")>

<OBJECT BOAT-LABEL
	(LOC INFLATED-BOAT)
	(SYNONYM LABEL FINEPRINT PRINT)
	(ADJECTIVE TAN FINE)
	(DESC "tan label")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(SIZE 2)
	(TEXT
" !!!!FROBOZ ZAUBERBOOTFABRIK!!!!|
|
Tag, Seeman!|
|
   Um ins Wasser zu gehen, sage: \"Abstossen\".|
   Um ans Land zur%uckzukehen, sage: \"Landen\" oder gibt die Richtung, in der du das Boot ste%urn m%ochtest, an.|
|
Garantie:|
|
   Dieses Boot hat eine Garantie mit einer Laufzeit von einer Tausendstelsekunde, die mit dem Kaufsdatum oder dem Datum der ersten Benutzung beginnt.|
|
Warnung:|
   Dieses Boot ist aus d%unnem Plastik. Hals und Beinbruch!")>

<OBJECT THIEF
	(LOC ROUND-ROOM)
	(SYNONYM THIEF ROBBER MAN PERSON)
	(ADJECTIVE SHADY SUSPICIOUS SEEDY)
	(DESC "thief")
	(FLAGS ACTORBIT INVISIBLE CONTBIT OPENBIT TRYTAKEBIT)
	(ACTION ROBBER-FUNCTION)
	(LDESC
"There is a suspicious-looking individual, holding a large bag, leaning
against one wall. He is armed with a deadly stiletto.")
	(STRENGTH 5)>

<OBJECT PEDESTAL
	(LOC TORCH-ROOM)
	(SYNONYM PEDESTAL)
	(ADJECTIVE WHITE MARBLE)
	(DESC "pedestal")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(ACTION DUMB-CONTAINER)
	(CAPACITY 30)>

<OBJECT TORCH
	(LOC PEDESTAL)
	(SYNONYM TORCH IVORY TREASURE)
	(ADJECTIVE FLAMING IVORY)
	(DESC "Fackel")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT)
	(ACTION TORCH-OBJECT)
	(FDESC "Auf dem Podest ist eine brennende Fackel aus Elfenbein.")
	(SIZE 20)
	(VALUE 14)
	(TVALUE 6)>

<OBJECT GUIDE
	(LOC DAM-LOBBY)
	(SYNONYM GUIDE BOOK BOOKS GUIDEBOOKS)
	(ADJECTIVE TOUR GUIDE)
	(DESC "Prospekte")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(FDESC
"Einige Prospekte mit dem Titel: Hochwasserschutzdamm No.3 liegen bei der Rezepzion.") 
	(TEXT
"\"	Flood Control Dam #3|
|
FCD#3 was constructed in year 783 of the Great Underground Empire to
harness the mighty Frigid River. This work was supported by a grant of
37 million zorkmids from your omnipotent local tyrant Lord Dimwit
Flathead the Excessive. This impressive structure is composed of
370,000 cubic feet of concrete, is 256 feet tall at the center, and 193
feet wide at the top. The lake created behind the dam has a volume
of 1.7 billion cubic feet, an area of 12 million square feet, and a
shore line of 36 thousand feet.|
|
The construction of FCD#3 took 112 days from ground breaking to
the dedication. It required a work force of 384 slaves, 34 slave
drivers, 12 engineers, 2 turtle doves, and a partridge in a pear
tree. The work was managed by a command team composed of 2345
bureaucrats, 2347 secretaries (at least two of whom could type),
12,256 paper shufflers, 52,469 rubber stampers, 245,193 red tape
processors, and nearly one million dead trees.|
|
We will now point out some of the more interesting features
of FCD#3 as we conduct you on a guided tour of the facilities:|
|
        1) You start your tour here in the Dam Lobby. You will notice
on your right that...." )>

<OBJECT TROLL
	(LOC TROLL-ROOM)
	(SYNONYM TROLL)
	(ADJECTIVE NASTY)
	(DESC "troll")
	(FLAGS ACTORBIT OPENBIT TRYTAKEBIT)
	(ACTION TROLL-FCN)
	(LDESC
"Ein widerlicher Troll, der eine blutige Axt schwingt, blockiert alle Ausg%ange aus dem Zimmer.")
	(STRENGTH 2)>

<OBJECT TRUNK
	(LOC RESERVOIR)
	(SYNONYM TRUNK CHEST JEWELS TREASURE)
	(ADJECTIVE OLD)
	(DESC "Juwelenkoffer")
	(FLAGS TAKEBIT INVISIBLE DERBIT)
	(FDESC
"Halbvergraben im Schlamm ist ein alter Koffer, vollgepfropft mit Juwelen.")
	(LDESC "There is an old trunk here, bulging with assorted jewels.")
	;"ren: above sentence"
	(ACTION TRUNK-F)
	(SIZE 35)
	(VALUE 15)
	(TVALUE 5)>

<OBJECT TUBE
	(LOC MAINTENANCE-ROOM)
	(SYNONYM TUBE TOOTH PASTE)
	(DESC "tube")
	(FLAGS TAKEBIT CONTBIT READBIT)
	(ACTION TUBE-FUNCTION)
	(LDESC
	 "There is an object which looks like a tube of toothpaste here.")
	(CAPACITY 7)
	(SIZE 5)
	(TEXT
"---> Frobozz Magic Gunk Company <---|
	  All-Purpose Gunk")>

<OBJECT PUTTY
	(LOC TUBE)
	(SYNONYM MATERIAL GUNK)
	(ADJECTIVE VISCOUS)
	(DESC "viscous material")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 6)
	(ACTION PUTTY-FCN)>

<OBJECT ENGRAVINGS
	(LOC ENGRAVINGS-CAVE)
	(SYNONYM WALL ENGRAVINGS INSCRIPTION)
	(ADJECTIVE OLD ANCIENT)
	(DESC "wall with engravings")
	(FLAGS READBIT SACREDBIT)
	(LDESC "Dort gibt es alte Einmeisselungen an den W%anden.")
	(TEXT
"The engravings were incised in the living rock of the cave wall by
an unknown hand. They depict, in symbolic form, the beliefs of the
ancient Zorkers. Skillfully interwoven with the bas reliefs are excerpts
illustrating the major religious tenets of that time. Unfortunately, a
later age seems to have considered them blasphemous and just as skillfully
excised them.")>

<OBJECT OWNERS-MANUAL
	(LOC STUDIO)
	(SYNONYM MANUAL PIECE PAPER)
	(ADJECTIVE ZORK OWNERS SMALL)
	(DESC "ZORK owner's manual")
	(FLAGS READBIT TAKEBIT)
	(FDESC "Lose an der Wand h%angt ein kleines St%uck Papier.")
	(TEXT
"Herzlichen Gl%uckwunsch!|
|
Du bist der priveligierte Besitzer von ZORK I: Das Grosse Unterirdische Imperium, ein unabh%angiges selbstversorgendes Universum Wenn es gem%ass den Operationsregelnf%ur kleine Universe benutzt und erhalten wird, dann wird ZORK auch viele Monate problemlos operieren.")>

<OBJECT CLIMBABLE-CLIFF
	(LOC LOCAL-GLOBALS)
	(SYNONYM WALL CLIFF WALLS LEDGE)
	(ADJECTIVE ROCKY SHEER)
	(DESC "cliff")
	(ACTION CLIFF-OBJECT)
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT WHITE-CLIFF
	(LOC LOCAL-GLOBALS)
	(SYNONYM CLIFF CLIFFS)
	(ADJECTIVE WHITE)
	(DESC "white cliffs")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION WCLIF-OBJECT)>

<OBJECT WRENCH
	(LOC MAINTENANCE-ROOM)
	(SYNONYM WRENCH TOOL TOOLS)
	(DESC "wrench")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT CONTROL-PANEL
	(LOC DAM-ROOM)
	(SYNONYM PANEL)
	(ADJECTIVE CONTROL)
	(DESC "control panel")
	(FLAGS NDESCBIT)>

<OBJECT NEST
	(LOC UP-A-TREE)
	(SYNONYM NEST)
	(ADJECTIVE BIRDS)
	(DESC "bird's nest")
	(FLAGS TAKEBIT BURNBIT CONTBIT OPENBIT SEARCHBIT)
	(FDESC "Neben dir auf dem Ast ist ein kleines Vogelnest.")
	(CAPACITY 20)>

<OBJECT EGG
	(LOC NEST)
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BIRDS ENCRUSTED JEWELED)
	(DESC "Ei")
	(ADJDESC "juwelenbesetzt")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(ACTION EGG-OBJECT)
	(VALUE 5)
	(TVALUE 5)
	(CAPACITY 6)
	(FDESC
"In dem Vogelnest ist ein grosses mit kostbaren Juwelen besetztes Ei, das scheinbar von einem kinderlosen Singvogel geraubtwaurde. Das Ei ist von einer feinen Goldschicht %uberzogen und mit Lapislazuli und Perlmutter geschm%uckt. Im Gegensatz zu einem gew%ohnlichen Ei, hat dieses ein Scharnier und ist mit einem eleganten Verschluss versehen. Das Ei sieht sehr zerbrechlich aus.")>

<OBJECT BROKEN-EGG
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BROKEN BIRDS ENCRUSTED JEWEL)
	(DESC "broken jewel-encrusted egg")
	(FLAGS TAKEBIT CONTBIT OPENBIT)
	(CAPACITY 6)
	(TVALUE 2)
	(LDESC "There is a somewhat ruined egg here.")>

<OBJECT BAUBLE
	(SYNONYM BAUBLE TREASURE)
	(ADJECTIVE BRASS BEAUTI)
	(DESC "beautiful brass bauble")
	(FLAGS TAKEBIT)
	(VALUE 1)
	(TVALUE 1)>

<OBJECT CANARY
	(LOC EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE CLOCKWORK GOLD GOLDEN)
	(DESC "golden clockwork canary")
	(FLAGS TAKEBIT SEARCHBIT)
	(ACTION CANARY-OBJECT)
	(VALUE 6)
	(TVALUE 4)
	(FDESC
"Ein goldener Kanarienvogel zum Aufziehen ist in dem Ei. Er hat rubinrote Augen und einen silbernen Schnabel. Durch das Kristallfenster unter seinem linken Fl%ugel kannst du den komplizierten Mechanismus in seinem K%orper sehen. Er scheint, abgelaufen zu sein. Hier ist auch ein Silberpokal mit feinen Gravierungen.")>

<OBJECT BROKEN-CANARY
	(LOC BROKEN-EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE BROKEN CLOCKWORK GOLD GOLDEN)
	(DESC "broken clockwork canary")
	(FLAGS TAKEBIT)
	(ACTION CANARY-OBJECT)
	(TVALUE 1)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It seems to
have recently had a bad experience. The mountings for its jewel-like
eyes are empty, and its silver beak is crumpled. Through a cracked
crystal window below its left wing you can see the remains of
intricate machinery. It is not clear what result winding it would
have, as the mainspring seems sprung.")>


"SUBTITLE ROOMS"

"SUBTITLE CONDITIONAL EXIT FLAGS"

<GLOBAL CYCLOPS-FLAG <>>
<GLOBAL DEFLATE <>>
<GLOBAL DOME-FLAG <>>
<GLOBAL EMPTY-HANDED <>>
<GLOBAL LLD-FLAG <>>
<GLOBAL LOW-TIDE <>>
<GLOBAL MAGIC-FLAG <>>
<GLOBAL RAINBOW-FLAG <>>
<GLOBAL TROLL-FLAG <>>
<GLOBAL WON-FLAG <>>
<GLOBAL COFFIN-CURE <>>

"SUBTITLE FOREST AND OUTSIDE OF HOUSE"

<ROOM WEST-OF-HOUSE
      (LOC ROOMS)
      (DESC "Westlich vom Haus")
      (NORD TO NORTH-OF-HOUSE)
      (SUED TO SOUTH-OF-HOUSE)
      (NO TO NORTH-OF-HOUSE)
      (SO TO SOUTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (OST SORRY 
"Die T%ur ist mit Brettern vernagelt, und du kannst die Bretter nicht
entfernen.")
      (SW TO STONE-BARROW IF WON-FLAG)
      (HINEIN TO STONE-BARROW IF WON-FLAG)
      (ACTION WEST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE BOARD FOREST)>

<ROOM STONE-BARROW
      (LOC ROOMS)
      (LDESC
"Du stehst vor einem enormen H%ugelgrab aus Stein. Auf der Ostseite ist eine riesige Steint%ur, die ge%offnet ist. Du kannst nicht in die Dunkelheit von dem Grab hineingucken.")
      (DESC "Stone Barrow")
      (NO TO WEST-OF-HOUSE)
      (ACTION STONE-BARROW-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)>

<ROOM NORTH-OF-HOUSE
      (LOC ROOMS)
      (DESC "N%ordlich vom Haus")
      (LDESC
"Du stehst vor der Nordseite eines weissen Hauses. Es gibt hier keine T%ur, und alle Fenster sind mit Brettern vernagelt. Nach Norden windet sich ein schmaler Pfad durch die B%aume.")
      (SW TO WEST-OF-HOUSE)
      (SO TO EAST-OF-HOUSE)
      (WEST TO WEST-OF-HOUSE)
      (OST TO EAST-OF-HOUSE)
      (NORD TO PATH)
      (SUED SORRY "Die Fenster sind alle vernagelt.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE FOREST)>

<ROOM SOUTH-OF-HOUSE
      (LOC ROOMS)
      (LDESC
"Du stehst auf der S%udseite des weissen Hauses. Es gibt hier keine T%ur, und alle Fenster sind vernagelt.")
      (DESC "S%udlich vom Haus")
      (WEST TO WEST-OF-HOUSE)
      (OST TO EAST-OF-HOUSE)
      (NO TO EAST-OF-HOUSE)
      (NW TO WEST-OF-HOUSE)
      (SUED TO FOREST-3)
      (NORD SORRY "The windows are all boarded.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE FOREST)>

<ROOM EAST-OF-HOUSE
      (LOC ROOMS)
      (DESC "Behind House")
      (NORD TO NORTH-OF-HOUSE)
      (SUED TO SOUTH-OF-HOUSE)
      (SW TO SOUTH-OF-HOUSE)
      (NW TO NORTH-OF-HOUSE)
      (OST TO CLEARING)
      (WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (HINEIN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (ACTION EAST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE KITCHEN-WINDOW FOREST)>

<ROOM FOREST-1
      (LOC ROOMS)
      (LDESC
"Dies ist ein Wald. %Uberall sind B%aume. Die Sonne steht scheinbar im Osten.")
      (DESC "Forest")
      (RAUF SORRY "Es gibt hier keinen Baum, den man erklettern kann.")
      (NORD TO GRATING-CLEARING)
      (OST TO PATH)
      (SUED TO FOREST-3)
      (WEST SORRY
"Du brauchtest ein Buschmesser, um weiter nach Westen zu gehen.")
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM FOREST-2
      (LOC ROOMS)
      (LDESC "Dies ist ein d%usterer Wald mit grossen B%aumen rundherum.")
      (DESC "Forest")
      ;"Neben dir auf dem Ast ist ein kleines Vogelnest."
      (RAUF SORRY "There is no tree here suitable for climbing.")
      (NORD SORRY "The forest becomes impenetrable to the north.")
      (OST TO MOUNTAINS)
      (SUED TO CLEARING)
      (WEST TO PATH)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM MOUNTAINS
      (LOC ROOMS)
      (LDESC "Der Wald lichtet sich und un%uberwindliche Bergekommen zum Vorsacheint.")
      (DESC "Forest")
      (RAUF SORRY "The mountains are impassable.")
      (NORD TO FOREST-2)
      (OST SORRY "The mountains are impassable.")
      (SUED TO FOREST-2)
      (WEST TO FOREST-2)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3
      (LOC ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (RAUF SORRY "There is no tree here suitable for climbing.")
      (NORD TO CLEARING)
      (OST SORRY "Undurchdringliches Unterholz versperrt den Weg nach Osten.")
      (SUED SORRY "Storm-tossed trees block your way.")
      (WEST TO FOREST-1)
      (NW TO SOUTH-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM PATH
      (LOC ROOMS)
      (LDESC
"Dieser Pfad windet sich durch den d%usteren Wald. Er verl%auft von Norden nach S%uden. Ein besonders grosser Baum mit einigen niederen %Asten steht am Rande des Pfades.")
      (DESC "Forest Path")
      (RAUF TO UP-A-TREE)
      (NORD TO GRATING-CLEARING)
      (OST TO FOREST-2)
      (SUED TO NORTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM UP-A-TREE
      (LOC ROOMS)
      (DESC "Up a Tree")
      (RUNTER TO PATH)
      (RAUF SORRY "You cannot climb any higher.")
      (ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE FOREST SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (LOC ROOMS)
      (DESC "Clearing")
      (NORD SORRY "Nach Norden wird der Wald undurchdringlich.")
      (OST TO FOREST-2)
      (WEST TO FOREST-1)
      (SUED TO PATH)
      (RUNTER PER GRATING-EXIT)
      (ACTION CLEARING-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE GRATE)>

<ROUTINE GRATING-EXIT ()
	 <COND (,GRATE-REVEALED
		<COND (<FSET? ,GRATE ,OPENBIT>
		       ,GRATING-ROOM)
		      (T
		       <TELL "The grating is closed!" CR>
		       <THIS-IS-IT ,GRATE>
		       <RFALSE>)>)
	       (T <TELL "You can't go that way." CR> <RFALSE>)>>

<ROOM CLEARING
      (LOC ROOMS)
      (LDESC
"Du stehst aufeiner kleinen Lichtung auf einem wohlmarkierten Waldpfad, der sich nach Osten und Westen erstreckt.")
      (DESC "Clearing")
      (RAUF SORRY "There is no tree here suitable for climbing.")
      (OST TO CANYON-VIEW)
      (NORD TO FOREST-2)
      (SUED TO FOREST-3)
      (WEST TO EAST-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>


"SUBTITLE HOUSE"

<ROOM KITCHEN
      (LOC ROOMS)
      (DESC "K%uche")
      (OST TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (WEST TO LIVING-ROOM)
      (RAUS TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (RAUF TO ATTIC)
      (RUNTER TO STUDIO IF FALSE-FLAG ELSE
	 "Nur der Schornsteinfeger krabbelt in Schornsteine.")
      (ACTION KITCHEN-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (VALUE 10)
      (GLOBAL KITCHEN-WINDOW CHIMNEY STAIRS)>

<ROOM ATTIC
      (LOC ROOMS)
      (LDESC "Dies ist der Speicher. Der einzige Ausgang ist ein Treppenhaus nach unten.")
      (DESC "Speicher")
      (RUNTER TO KITCHEN)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS)>

<ROOM LIVING-ROOM
      (LOC ROOMS)
      (DESC "Wohnzimmer")
      (OST TO KITCHEN)
      (WEST TO STRANGE-PASSAGE IF MAGIC-FLAG ELSE "The door is nailed shut.")
      (RUNTER PER TRAP-DOOR-EXIT)
      (ACTION LIVING-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL STAIRS)
      ;(PSEUDO "NAILS" NAILS-PSEUDO "NAIL" NAILS-PSEUDO)>

<OBJECT NAILS
	(LOC LIVING-ROOM)
	(SYNONYM NAIL NAILS)
	(DESC "nail")
	(FLAGS NDESCBIT)
	(ACTION NAILS-PSEUDO)>

"SUBTITLE CELLAR AND VICINITY"

<ROOM CELLAR
      (LOC ROOMS)
      (DESC "Keller")
      (NORD TO TROLL-ROOM)
      (SUED TO EAST-OF-CHASM)
      (RAUF TO LIVING-ROOM IF TRAP-DOOR IS OPEN)
      (WEST SORRY "Du versuchst die Rampe hinaufzuklettern, aber das ist unm%oglich. Du rutschst wieder runter.")
      (ACTION CELLAR-FCN)
      (FLAGS RLANDBIT)
      (VALUE 25)
      (GLOBAL TRAP-DOOR SLIDE STAIRS)>

<ROOM TROLL-ROOM
      (LOC ROOMS)
      (LDESC
"Dies ist ein kleines Zimmer mit Durchg%angen nach Osten und S%uden und einem furchterregenden Loch nach Westen. Blutspuren und tiefe Kratzer (vielleicht von einer Axt) verschandeln die W%ande.")
      (DESC "Das Trollzimmer")
      (SUED TO CELLAR)
      (OST TO EW-PASSAGE
       IF TROLL-FLAG ELSE "The troll fends you off with a menacing gesture.")
      (WEST TO MAZE-1
       IF TROLL-FLAG ELSE "The troll fends you off with a menacing gesture.")
      (FLAGS RLANDBIT)
      (ACTION TROLL-ROOM-F)>

<ROOM EAST-OF-CHASM
      (LOC ROOMS)
      (LDESC
"Du bist am %ostlichen Rand einer Spalte, deren Grund nicht zu sehen ist. Ein enger Durchgang geht nach Norden, und der Pfad, auf dem du bist, f%uhrt nach Osten weiter.")
      (DESC "East of Chasm")
      (NORD TO CELLAR)
      (OST TO GALLERY)
      (RUNTER SORRY 
"Die Spalte f%uhrt wahrscheinlich direkt zur H%olle.")
      (FLAGS RLANDBIT)
      (GLOBAL CHASM)
      ;(PSEUDO "CHASM" CHASM-PSEUDO)>

<OBJECT CHASM
	(LOC LOCAL-GLOBALS)
	(SYNONYM CHASM)
	(DESC "chasm")
	(FLAGS NDESCBIT)
	(ACTION CHASM-PSEUDO)>

<ROOM GALLERY
      (LOC ROOMS)
      (LDESC
"Dies ist eine Kunstgalerie. Die meisten Gem%alde sind von Gangstern mit aussergew%ohnlich gutem Geschmack gestohlen worden. Die Gangster sind entweder durch den Nord -oder den Westausgang abgeha%un.")
      (DESC "Galerie")
      (WEST TO EAST-OF-CHASM)
      (NORD TO STUDIO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STUDIO
      (LOC ROOMS)
      (LDESC
"Dies scheint, ein K%unstleratelier gewesen zu sein. Die W%ande und Fussb%oden sind mit Spritzern von 69 verschiedenen Farben bekleckst. Seltsamererweise h%angt hier nichts Wertvolles. Am s%udlichen Ende des Zimmers ist eine offene T%ur (auch mit Farbe bekleckst). Ein dunkler und schmaler Schornstein f%uhrt vom Kamin hinauf. Es w%are wahrscheinlich einfach f%ur dich, dort hinaufzuklettern, aber die Chancen, dass du wieder runterkommst, sind gering.")
      (DESC "Atelier")
      (SUED TO GALLERY)
      (RAUF PER UP-CHIMNEY-FUNCTION)
      (FLAGS RLANDBIT)
      (GLOBAL CHIMNEY)
      ;(PSEUDO "DOOR" DOOR-PSEUDO "PAINT" PAINT-PSEUDO)>

<OBJECT DOOR-P
	(LOC STUDIO)
	(SYNONYM DOOR)
	(DESC "door")
	(FLAGS NDESCBIT)
	(ACTION DOOR-PSEUDO)>

<OBJECT PAINT
	(LOC STUDIO)
	(SYNONYM PAINT)
	(DESC "paint")
	(FLAGS NDESCBIT)
	(ACTION PAINT-PSEUDO)>

"SUBTITLE MAZE"

<ROOM MAZE-1
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (OST TO TROLL-ROOM)
      (NORD TO MAZE-1)
      (SUED TO MAZE-2)
      (WEST TO MAZE-4)
      (FLAGS RLANDBIT )>

<ROOM MAZE-2
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (SUED TO MAZE-1)
      (RUNTER PER MAZE-DIODES) 
      (OST TO MAZE-3)
      (FLAGS RLANDBIT )>

<ROOM MAZE-3
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (WEST TO MAZE-2)
      (NORD TO MAZE-4)
      (RAUF TO MAZE-5)
      (FLAGS RLANDBIT )>

<ROOM MAZE-4
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (WEST TO MAZE-3)
      (NORD TO MAZE-1)
      (OST TO DEAD-END-1)
      (FLAGS RLANDBIT )>

<ROOM DEAD-END-1
      (LOC ROOMS)
      (DESC "Dead End")
      (LDESC "Du bist an einer Sackgasse in dem Irrgarten gekommen.")
      (SUED TO MAZE-4)
      (FLAGS RLANDBIT )>

<ROOM MAZE-5
      (LOC ROOMS)
      (LDESC 
"Dies ist ein Teil eines Irrgartens: kleine, verwirrende G%ange, die sich alle %ahnlich sehen. In einer Ecke liegt ein Skelett. Vermutlich die sterblichen %Uberreste eines gl%ucklosen Abenteurers.")
      (DESC "Irrgarten")
      (OST TO DEAD-END-2)
      (NORD TO MAZE-3)
      (SW TO MAZE-6)
      (FLAGS RLANDBIT)>

<ROOM DEAD-END-2
      (LOC ROOMS)
      (DESC "Dead End")
      (LDESC "Du bist an einer Sackgasse in dem Irrgarten gekommen.")
      (WEST TO MAZE-5)
      (FLAGS RLANDBIT )>

<ROOM MAZE-6
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (RUNTER TO MAZE-5)
      (OST TO MAZE-7)
      (WEST TO MAZE-6)
      (RAUF TO MAZE-9)
      (FLAGS RLANDBIT )>

<ROOM MAZE-7
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (RAUF TO MAZE-14)
      (WEST TO MAZE-6)
      (RUNTER PER MAZE-DIODES) ;"to DEAD-END-1"
      (OST TO MAZE-8)
      (SUED TO MAZE-15)
      (FLAGS RLANDBIT )>

<ROOM MAZE-8
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (NO TO MAZE-7)
      (WEST TO MAZE-8)
      (SO TO DEAD-END-3)
      (FLAGS RLANDBIT )>

<ROOM DEAD-END-3
      (LOC ROOMS)
      (DESC "Dead End")
      (LDESC "Du bist an einer Sackgasse in dem Irrgarten gekommen.")
      (NORD TO MAZE-8)
      (FLAGS RLANDBIT )>

<ROOM MAZE-9
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (NORD TO MAZE-6)
      (RUNTER PER MAZE-DIODES) ;"to MAZE-11"
      (OST TO MAZE-10)
      (SUED TO MAZE-13)
      (WEST TO MAZE-12)
      (NW TO MAZE-9)
      (FLAGS RLANDBIT )>

<ROOM MAZE-10
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (OST TO MAZE-9)
      (WEST TO MAZE-13)
      (RAUF TO MAZE-11)
      (FLAGS RLANDBIT )>

<ROOM MAZE-11
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (NO TO GRATING-ROOM)
      (RUNTER TO MAZE-10)
      (NW TO MAZE-13)
      (SW TO MAZE-12)
      (FLAGS RLANDBIT )>

<ROUTINE IN-MAZE? (PLACE)
	 <COND (<EQUAL? .PLACE ,MAZE-1 ,MAZE-2 ,MAZE-3 ,MAZE-4 ,MAZE-5
			      ,MAZE-6 ,MAZE-7 ,MAZE-8 ,MAZE-9 ,MAZE-10
			      ,MAZE-11 ,MAZE-12 ,MAZE-13 ,MAZE-14
			      ,MAZE-15 ,DEAD-END-1
			      ,DEAD-END-2 ,DEAD-END-3 ,DEAD-END-4>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM GRATING-ROOM
      (LOC ROOMS)
      (DESC "Grating Room")
      (SW TO MAZE-11)
      (RAUF TO GRATING-CLEARING
       IF GRATE IS OPEN ELSE "The grating is closed.")
      (ACTION MAZE-11-FCN)
      (GLOBAL GRATE)
      (FLAGS RLANDBIT)>

<ROOM MAZE-12
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (RUNTER PER MAZE-DIODES) ;"to MAZE-5"
      (SW TO MAZE-11)
      (OST TO MAZE-13)
      (RAUF TO MAZE-9)
      (NORD TO DEAD-END-4)
      (FLAGS RLANDBIT )>

<ROOM DEAD-END-4
      (LOC ROOMS)
      (DESC "Dead End")
      (LDESC "Du bist an einer Sackgasse in dem Irrgarten gekommen.")
      (SUED TO MAZE-12)
      (FLAGS RLANDBIT )>

<ROOM MAZE-13
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (OST TO MAZE-9)
      (RUNTER TO MAZE-12)
      (SUED TO MAZE-10)
      (WEST TO MAZE-11)
      (FLAGS RLANDBIT )>

<ROOM MAZE-14
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
       (WEST TO MAZE-15)
      (NW TO MAZE-14)
      (NO TO MAZE-7)
      (SUED TO MAZE-7)
      (FLAGS RLANDBIT )>

<ROOM MAZE-15
      (LOC ROOMS)
      (LDESC "Dies ein Teil eines Irrgartens. Kleine verwirrende Durchgangsm%oglichkeiten, die sich alle %ahnlich sehen.")
      (DESC "Irrgarten")
      (WEST TO MAZE-14)
      (SUED TO MAZE-7)
      (SO TO CYCLOPS-ROOM)
      (FLAGS RLANDBIT )>


"SUBTITLE CYCLOPS AND HIDEAWAY"

<ROOM CYCLOPS-ROOM
      (LOC ROOMS)
      (DESC "Zyklopenzimmer")
      (NW TO MAZE-15)
      (OST TO STRANGE-PASSAGE
       IF MAGIC-FLAG ELSE "The east wall is solid rock.")
      (RAUF TO TREASURE-ROOM IF CYCLOPS-FLAG
        ELSE "The cyclops d%osn't look like he'll let you past.")
      (ACTION CYCLOPS-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM STRANGE-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein langer Durchgang. Nach Westen ist ein Eingang. Nach Osten gibt es eine h%olzerne T%ur mit einer grossen %Offnung darin (ungef%ahr in der Form eines Zyklopses).")
      (DESC "Eigent%umlicher Durchgang")
      (WEST TO CYCLOPS-ROOM)
      (HINEIN TO CYCLOPS-ROOM)
      (OST TO LIVING-ROOM)
      (FLAGS RLANDBIT)>

<ROOM TREASURE-ROOM
      (LOC ROOMS)
      (LDESC
"Dies ist ein grosser Raum, dessen Ostwaand aus Granit ist. Eine Menge weggeworfener T%uten, die bei der kleinsten Ber%uhrung zerfallen, sind auf dem Fussboden verstreut.")
      (DESC "Schatzzimmer")
      (RUNTER TO CYCLOPS-ROOM)
      (ACTION TREASURE-ROOM-FCN)
      (FLAGS RLANDBIT ;"CANT-HAVE-ONBIT")
      (VALUE 25)
      (GLOBAL STAIRS)>


"SUBTITLE RESERVOIR AREA"

<ROOM RESERVOIR-SOUTH
      (LOC ROOMS)
      (DESC "Reservoir S%ud")
      (SO TO DEEP-CANYON)
      (SW TO CHASM-ROOM)
      (OST TO DAM-ROOM)
      (WEST TO STREAM-VIEW)
      (NORD TO RESERVOIR
       IF LOW-TIDE ELSE "You would drown.")
      (ACTION RESERVOIR-SOUTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER CHASM LAKE)
      ;(PSEUDO "LAKE" LAKE-PSEUDO "CHASM" CHASM-PSEUDO)>

<OBJECT LAKE
	(LOC LOCAL-GLOBALS)
	(SYNONYM LAKE)
	(DESC "lake")
	(FLAGS NDESCBIT)
	(ACTION LAKE-PSEUDO)>

<ROOM RESERVOIR
      (LOC ROOMS)
      (DESC "Reservoir North")
      (NORD TO RESERVOIR-NORTH)
      (SUED TO RESERVOIR-SOUTH)
      (RAUF TO IN-STREAM)
      (WEST TO IN-STREAM)
      (RUNTER SORRY "The dam blocks your way.")
      (ACTION RESERVOIR-FCN)
      (FLAGS NONLANDBIT )
      ;(PSEUDO "STREAM" STREAM-PSEUDO)
      (GLOBAL GLOBAL-WATER STREAM)>

<OBJECT STREAM
	(LOC LOCAL-GLOBALS)
	(SYNONYM STREAM)
	(DESC "stream")
	(FLAGS NDESCBIT)
	(ACTION STREAM-PSEUDO)>

<ROOM RESERVOIR-NORTH
      (LOC ROOMS)
      (DESC "Reservoir North")
      (NORD TO ATLANTIS-ROOM)
      (SUED TO RESERVOIR
       IF LOW-TIDE ELSE "You would drown.")
      (ACTION RESERVOIR-NORTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STAIRS LAKE)
      ;(PSEUDO "LAKE" LAKE-PSEUDO)>

<ROOM STREAM-VIEW
      (LOC ROOMS)
      (LDESC
"Du stehst auf einem Pfad bei einem pl%atschernden Bach. Der Pfad folgt dem Bach, der von Westen und nach Osten fliesst.")
      (DESC "Blick auf den Bach")
      (OST TO RESERVOIR-SOUTH)
      (WEST SORRY "The stream emerges from a spot too small for you to enter.")
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STREAM)
      ;(PSEUDO "STREAM" STREAM-PSEUDO)>

<ROOM IN-STREAM
      (LOC ROOMS)
      (LDESC
"Du bist auf einem pl%atschernden Fluss. Der Weg flussaufw%arts ist zu eng, und die Flussabw%artsroute ist nicht %ubersehbar, denn die Felsw%ande stehen im Weg. Es gibt hier einen schmalen Strand zur Landung.")
      (DESC "Stream")
      (RAUF SORRY "Der Flusskanal ist zu eng.")
      (WEST SORRY "Der Flusskanal ist zu eng.")
      (LANDEN TO STREAM-VIEW)
      (RUNTER TO RESERVOIR)
      (OST TO RESERVOIR)
      (FLAGS NONLANDBIT )
      (GLOBAL GLOBAL-WATER STREAM)
      ;(PSEUDO "STREAM" STREAM-PSEUDO)>

"SUBTITLE MIRROR ROOMS AND VICINITY"

<ROOM MIRROR-ROOM-1
      (LOC ROOMS)
      (DESC "Spiegelzimmer")
      (NORD TO COLD-PASSAGE)
      (WEST TO TWISTING-PASSAGE)
      (OST TO SMALL-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT)>

<ROOM MIRROR-ROOM-2
      (LOC ROOMS)
      (DESC "Mirror Room")
      (WEST TO WINDING-PASSAGE)
      (NORD TO NARROW-PASSAGE)
      (OST TO TINY-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SMALL-CAVE
      (LOC ROOMS)
      (LDESC
"Dies ist eine winzige H%ohle mit Eing%angen im Westen und Osten, und eine angsterregende Treppe nach unten.")
      (DESC "Cave")
      (NORD TO MIRROR-ROOM-1)
      (RUNTER TO ATLANTIS-ROOM)
      (SUED TO ATLANTIS-ROOM)
      (WEST TO TWISTING-PASSAGE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM TINY-CAVE
      (LOC ROOMS)
      (LDESC
"This is a tiny cave with entrances west and north, and a dark,
forbidding staircase leading down.")
      (DESC "Cave")
      (NORD TO MIRROR-ROOM-2)
      (WEST TO WINDING-PASSAGE)
      (RUNTER TO ENTRANCE-TO-HADES)
      (ACTION CAVE2-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM COLD-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein kalter und feuchter Flur, wo ein langer Ost-West Durchgang in einen Pfad nach S%udwesten m%undet.")
      (DESC "Kalter Durchgang")
      (SUED TO MIRROR-ROOM-1)
      (WEST TO SLIDE-ROOM)
      (FLAGS RLANDBIT)>

<ROOM NARROW-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein langer und enger Gang, von dem aus sich ein langer Nord-S%uddurchgang mehr und mehr verengt.")
      (DESC "Narrow Passage")
      (NORD TO ROUND-ROOM)
      (SUED TO MIRROR-ROOM-2)
      (FLAGS RLANDBIT)>

<ROOM WINDING-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein sich windender Durchgang. Es scheint, als ob es nur Ausg%ange nach Osten und Norden gibt.")
      (DESC "Winding Passage")
      (NORD TO MIRROR-ROOM-2)
      (OST TO TINY-CAVE)
      (FLAGS RLANDBIT)>

<ROOM TWISTING-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein Quergang, der sich windet. Es scheint, als ob es nur Ausg%ange auf der Ost-und Nordseite gibt.")
      (DESC "Quergang")
      (NORD TO MIRROR-ROOM-1)
      (OST TO SMALL-CAVE)
      (FLAGS RLANDBIT)>

<ROOM ATLANTIS-ROOM
      (LOC ROOMS)
      (LDESC
"Dies ist ein uraltes Zimmer, seit langem unter Wasser. Es gibt einen Ausgang nach S%uden und eine Treppe, die nach oben f%uhrt.")
      (DESC "Atlantiszimmer")
      (RAUF TO SMALL-CAVE)
      (SUED TO RESERVOIR-NORTH)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>


"SUBTITLE ROUND ROOM AND VICINITY"

<ROOM EW-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein enger Ost-Westdurchgang. Es gibt hier eine enge Treppe, die nach am Ende des Zimmers nach unten f%uhrt.")
      (DESC "East-West Passage")
      (OST TO ROUND-ROOM)
      (WEST TO TROLL-ROOM)
      (RUNTER TO CHASM-ROOM)
      (NORD TO CHASM-ROOM)
      (FLAGS RLANDBIT)
      (VALUE 5)
      (GLOBAL STAIRS)>

<ROOM ROUND-ROOM
      (LOC ROOMS)
      (LDESC
"Dies ist ein rundes turmartiges Zimmer mit Durchg%angen inalleRichtungen. Einige sind leider durch Einsturz blockiert.")
      (DESC "Rundes Zimmer")
      (OST TO LOUD-ROOM)
      (WEST TO EW-PASSAGE)
      (NORD TO NS-PASSAGE)
      (SUED TO NARROW-PASSAGE)
      (SO TO ENGRAVINGS-CAVE)
      (FLAGS RLANDBIT)>

<ROOM DEEP-CANYON
      (LOC ROOMS)
      (DESC "Tiefe Schlucht")
      (NW TO RESERVOIR-SOUTH) 
      (OST TO DAM-ROOM)
      (SW TO NS-PASSAGE)
      (RUNTER TO LOUD-ROOM)
      (FLAGS RLANDBIT)
      (ACTION DEEP-CANYON-F)
      (GLOBAL STAIRS)>

<ROOM DAMP-CAVE
      (LOC ROOMS)
      (LDESC
"Diese H%ohle hat Ausg%ange nach Westen und Osten und verengt sich nach S%uden zu einer Ritze. Der Boden ist hier besonders feucht.")
      (DESC "Damp Cave")
      (WEST TO LOUD-ROOM)
      (OST TO WHITE-CLIFFS-NORTH)
      (SUED SORRY "It is too narrow for most insects.")
      (FLAGS RLANDBIT)
      (GLOBAL CRACK)>

<ROOM LOUD-ROOM
      (LOC ROOMS)
      (DESC "Das laute Zimmer")
      (OST TO DAMP-CAVE)
      (WEST TO ROUND-ROOM)
      (RAUF TO DEEP-CANYON)
      (ACTION LOUD-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM NS-PASSAGE
      (LOC ROOMS)
      (LDESC
"Hier ist ein Nord-S%uddurchgang, der sich nach Nordosten gabelt.")
      (DESC "Nord-S%uddurchgang")
      (NORD TO CHASM-ROOM)
      (NO TO DEEP-CANYON)
      (SUED TO ROUND-ROOM)
      (FLAGS RLANDBIT)>

<ROOM CHASM-ROOM
      (LOC ROOMS)
      (LDESC
"Eine Spalte verl%auft von S%udwesten nach Nordosten, und der Pfad folgt ihr. Du bist auf der S%udseite der Spalte, wo eine schmale %Offnung in einen Durchgang f%uhrt.")
      (DESC "Spalte")
      (NO TO RESERVOIR-SOUTH)
      (SW TO EW-PASSAGE)
      (RAUF TO EW-PASSAGE)
      (SUED TO NS-PASSAGE)
      (RUNTER SORRY "Are you out of your mind?")
      (FLAGS RLANDBIT)
      (GLOBAL CRACK STAIRS CHASM)
      ;(PSEUDO "CHASM" CHASM-PSEUDO)>


"SUBTITLE HADES ET AL"

<ROOM ENTRANCE-TO-HADES
      (LOC ROOMS)
      (DESC "Eingang zur Unterwelt")
      (RAUF TO TINY-CAVE)
      (HINEIN TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE 
"Eine unsichtbare Macht h%alt dich davon ab durch das Tor zu schreiten.")
      (SUED TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE
"Eine unsichtbare Macht h%alt dich davon ab durch das Tor zu schreiten.")
      (ACTION LLD-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)
      ;(PSEUDO "GATE" GATE-PSEUDO "GATES" GATE-PSEUDO)>

<OBJECT GATE
	(LOC ENTRANCE-TO-HADES)
	(SYNONYM GATE GATES)
	(DESC "gate")
	(FLAGS NDESCBIT)
	(ACTION GATE-PSEUDO)>

<ROOM LAND-OF-LIVING-DEAD
      (LOC ROOMS)
      (LDESC
"Du bist in das Land der lebendigen Toten geraten. Tausende von verlorenen Seelen kann man Weinen und Schluchzen h%oren. In der Ecke sind die %Uberreste von Dutzenden von vormaligen Abenteuerern, die weniger Gl%uck hatten als du, aufgestapelt. Ein Duchgang f%uhrt nach Norden heraus. In einer Ecke dieses Raumes liegt ein wundervoll gearbeiteter Kristalsch%adel. Er scheint dich mit gemeinem Grinsen anzusehen.")
      (DESC "Das Land der Toten")
      (RAUS TO ENTRANCE-TO-HADES)
      (NORD TO ENTRANCE-TO-HADES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)>


"SUBTITLE DOME, TEMPLE, EGYPT"

<ROOM ENGRAVINGS-CAVE	
      (LOC ROOMS)
      (LDESC
"Du bist in eine H%ohle getreten, die Durchg%ange nach Norwesten und Osten
hat.")
      (DESC "H%ohle mit Einmeisselungen")
      (NW TO ROUND-ROOM)
      (OST TO DOME-ROOM)
      (FLAGS RLANDBIT)>

<ROOM EGYPT-ROOM	
      (LOC ROOMS)
      (LDESC
"Dieser Raum sieht aus wie ein %agyptisches Grab. Im Westen ist eine Treppe nach oben.") 
      (DESC "Egyptian Room")
      (WEST TO NORTH-TEMPLE)
      (RAUF TO NORTH-TEMPLE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM DOME-ROOM	
      (LOC ROOMS)
      (DESC "Kuppelzimmer")
      (WEST TO ENGRAVINGS-CAVE)
      (RUNTER TO TORCH-ROOM
       IF DOME-FLAG ELSE "You cannot go down without fracturing many bones.")
      (ACTION DOME-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL DOME)
      ;(PSEUDO "DOME" DOME-PSEUDO)>

<OBJECT DOME
	(LOC LOCAL-GLOBALS)
	(SYNONYM DOME)
	(DESC "dome")
	(FLAGS NDESCBIT)
	(ACTION DOME-PSEUDO)>

<ROOM TORCH-ROOM
      (LOC ROOMS)
      (DESC "Fackelzimmer")
      (RAUF SORRY "Du kannst das Seil nicht mit der Hand erreichen.")
      (SUED TO NORTH-TEMPLE)
      (RUNTER TO NORTH-TEMPLE)
      (ACTION TORCH-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS DOME)
      ;(PSEUDO "DOME" DOME-PSEUDO)>

<ROOM NORTH-TEMPLE	
      (LOC ROOMS)
      (LDESC
"Dies ist das Nordende eines grossen Tempels. Auf der Ostwand siehst du eine antike Inschrift, die wahrscheinlich ein Gebet in einer l%angst vergessenen Sprache ist. Unter dem Gebet f%uhrt ein Treppenhaus nach unten. Die Westwand ist aus Granit. Der Ausgang im Norden des Raumes f%uhrt durch riesige Marmors%aulen.
Es befindet sich hier eine Messingglocke.")
      (DESC "Temple")
      (RUNTER TO EGYPT-ROOM)
      (OST TO EGYPT-ROOM)
      (NORD TO TORCH-ROOM)
      (RAUS TO TORCH-ROOM)
      (RAUF TO TORCH-ROOM)
      (SUED TO SOUTH-TEMPLE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL STAIRS)>

<ROOM SOUTH-TEMPLE	
      (LOC ROOMS)
      (LDESC
"Dies ist das S%udende eines grossen Tempels. Vor dir ist eine Art Altar. In einer Ecke ist ein kleines Loch im Boden, das in absolute Dunkelheit f%uhrt. 
Es sieht nicht so aus, als ob du da je wieder rausk%amst.
Auf beiden Seiten des Altars stehen brennende Kerzen.
Auf dem Altar liegt ein grosses schwarzes Buch. Es ist bei Seite 569 aufgeschlagen.")
      (DESC "Altar")
      (NORD TO NORTH-TEMPLE)
      ;"ren: it's a hint you have to pray"
      (RUNTER TO TINY-CAVE
       IF COFFIN-CURE
       ELSE "You haven't a prayer of getting the coffin down there.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (ACTION SOUTH-TEMPLE-FCN)>

"SUBTITLE FLOOD CONTROL DAM #3"

<ROOM DAM-ROOM	
      (LOC ROOMS)
      (DESC "Dam")
      (SUED TO DEEP-CANYON)
      (RUNTER TO DAM-BASE)
      (OST TO DAM-BASE)
      (NORD TO DAM-LOBBY)
      (WEST TO RESERVOIR-SOUTH)
      (ACTION DAM-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER)>

<ROOM DAM-LOBBY	
      (LOC ROOMS)
      (LDESC
"Dieser Raum scheint, der Warteraum f%ur Besuchergruppen gewesen zu sein.
Es gibt hier offene T%uren, die nach Norden und Osten f%uhren. Sie haben die Aufschrift \"Privat,\" und ein Pfad f%uhrt nach S%uden %uber den oberen Damm.")
      (DESC "Eingangshalle zum Damm")
      (SUED TO DAM-ROOM)
      (NORD TO MAINTENANCE-ROOM)
      (OST TO MAINTENANCE-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MAINTENANCE-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies muss der Wartungsraum f%ur den Hochwasserschutzdamm No.3 gewesen sein.
Scheinbar ist dieser Raum vor Kurzem gepl%undert worden, denn die meisten wertvollen Ger%ate sind weg. An der Wand vor dir h%angen bla%u, gelbe, braune und rote Kn%opfe. T%uren f%uhren nach Westen und S%uden.")
      (DESC "Wartungsraum")
      (SUED TO DAM-LOBBY)
      (WEST TO DAM-LOBBY)
      (FLAGS RLANDBIT)>


"SUBTITLE RIVER AREA"

<ROOM DAM-BASE	
      (LOC ROOMS)
      (LDESC
"Du bist am Fuss des Hochwasserkontrolldammes No. 3, der %uber dir und nach Norden hin aufragt. Der Fluss Gletsch fliesst hier vorbei. Den Fluss entlang t%urmen sich die Weissen Felsen, die sich flussabw%arts wie eine gigantische Wand von Norden nach S%uden erstrecken.")
      (DESC "Am Fuss des Dammes")
      (NORD TO DAM-ROOM)
      (RAUF TO DAM-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-1	
      (LOC ROOMS)
      (LDESC
"Du bist auf dem Gletsch bei dem Damm. Der Fluss fliesst ruhig hier. Es gibt einen Landungssteg am Westufer.")
      (DESC "Frigid River")
      (RAUF SORRY "Du kannst hier nicht flussaufw%arts, denn die Str%omung ist zu stark.")
      (WEST TO DAM-BASE)
      (LANDEN TO DAM-BASE)
      (RUNTER TO RIVER-2)
      (OST SORRY "The White Cliffs prevent your landing here.")
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-2	
      (LOC ROOMS)
      (LDESC
"Der Fluss fliesst hier um eine Biegung, die es unm%oglich macht, den Damm zu sehen. Die Weissen Felsen ragen %uber dem Ostufer auf und grosse Steine verhindern die Landung am Westufer.")
      (DESC "Frigid River")
      (RAUF SORRY "Du kannst hier nicht flussaufw%arts, denn die Str%omung ist zu stark.")
      (RUNTER TO RIVER-3)
      (LANDEN SORRY "Hier kann man nicht sicher anlegen.")
      (OST SORRY "Die Weissenfelsen verhindern das Anlegen.")
      ;"ren umlaut in next sentence?"
      (WEST SORRY "Gerade noch rechtzeitig steuerst du von den Felsen weg.")
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-3	
      (LOC ROOMS)
      (LDESC
"Der Fluss fliesst hier in ein Tal hinab. Es gibt einen schmalen Strand an der Westk%uste unter den Felsen. In der Ferne kann man ein schwaches Grollen h%oren.")
      (DESC "Frigid River")
      (RAUF SORRY "You cannot go upstream d%u to strong currents.")
      (RUNTER TO RIVER-4)
      (LANDEN TO WHITE-CLIFFS-NORTH)
      (WEST TO WHITE-CLIFFS-NORTH)
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM WHITE-CLIFFS-NORTH	
      (LOC ROOMS)
      (LDESC
"Du bist aneinem schmalen Strand, der am Fusse der Weissen Felsen entlangl%auft. Es gibt hier einen schmalen Pfad, der entlang der Felsen nach S%uden l%auft und einen engen Durchgang, der nach West mitten in die Klippen hineinf%uhrt.")
      (DESC "Weisse Felsen Strand")
     (SUED TO WHITE-CLIFFS-SOUTH IF DEFLATE ELSE "The path is too narrow.")
      (WEST TO DAMP-CAVE IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM WHITE-CLIFFS-SOUTH	
      (LOC ROOMS)
      (LDESC
"You are on a rocky, narrow strip of beach beside the Cliffs. A
narrow path leads north along the shore.")
      (DESC "White Cliffs Beach")
      (NORD TO WHITE-CLIFFS-NORTH
       IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM RIVER-4	
      (LOC ROOMS)
      (LDESC
"Der Fluss str%omt hier st%arker, und das Ger%ausch vor dir scheint, das von brausendem Wasser zu sein. An dem Ostufer ist ein Sandstrand. Ein bisschen Strand luft auch unter den Felsen an dem Westufer hervor.")
      (DESC "Frigid River")
      (RAUF SORRY "You cannot go upstream d%u to strong currents.")
      (RUNTER TO RIVER-5)
      (LANDEN SORRY "Du kannst weder nach Osten oder nach Westen hin landen.")
      (WEST TO WHITE-CLIFFS-SOUTH)
      (OST TO SANDY-BEACH)
      (ACTION RIVR4-ROOM)
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-5	
      (LOC ROOMS)
      (LDESC
"Das Ger%ausch von brausendem Wasser ist hier fast unertr%aglich. Auf der Ostk%uste gibt es einen grossen Anlegeplatz.")
      (DESC "Frigid River")
      (RAUF SORRY "You cannot go upstream d%u to strong currents.")
      (OST TO SHORE)
      (LANDEN TO SHORE)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SHORE	
      (LOC ROOMS)
      (LDESC
"Du bist an dem Ostufer des Flusses. Das Wasser ist hier etwas gef%ahrlich. Ein Pfad f%uhrt von Norden nach S%uden, das S%udende biegt schnell um eine scharfe Kurve.")
      (DESC "Ufer")
      (NORD TO SANDY-BEACH)
      (SUED TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-BEACH	
      (LOC ROOMS)
      (LDESC
"Du bist aneinem grossen Sandstrand am Ostufer des Flusses. Dieser fliesst schnell vorbei. Ein Pfad verl%auft den Fluss entlang nach S%uden hier und ein Durchgang ist halb im Sand nach Nordosten vergraben.")
      (DESC "Sandiger Strand")
      (NO TO SANDY-CAVE)
      (SUED TO SHORE)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-CAVE	
      (LOC ROOMS)
      (LDESC
"Dies ist eine sandgef%ullte H%ohle, deren Ausgang nach S%udwesten geht.")
      (DESC "Sandige H%ohle")
      (SW TO SANDY-BEACH)
      (FLAGS RLANDBIT)>

<ROOM ARAGAIN-FALLS	
      (LOC ROOMS)
      (DESC"Wiedermal F%alle")
      (WEST TO ON-RAINBOW IF RAINBOW-FLAG)
      (RUNTER SORRY "It's a long way...")
      (NORD TO SHORE)
      (RAUF TO ON-RAINBOW IF RAINBOW-FLAG)
      (ACTION FALLS-ROOM)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER RAINBOW)>

<ROOM ON-RAINBOW	
      (LOC ROOMS)
      (LDESC
"Du bist auf dem Regenbogen (sicherlich hast du dir nie tr%aumen lassen, dass du jemals auf einem Regenbogen laufen w%urdest). Du hast einen tollen Blick auf die F%alle. Der Regenbogen verl%auft von Osten nach Westen.")
      (DESC "Auf dem Regenbogen")
      (WEST TO END-OF-RAINBOW)
      (OST TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL RAINBOW)>

<ROOM END-OF-RAINBOW	
      (LOC ROOMS)
      (LDESC
"Du bist am unteren Gletsch hinter den Wasserf%allen an einem schmalen steinigen Ufer. Das Ufer is wegen der Weissen Felsen schmal. Die Flusschlucht %offnet sich hier, und Sonnenstrahlen fallen von oben.herein. Ein Regenbogen weist %uber die F%alle nach Osten, und ein schmaller Pfad f%uhrt weiter nach S%udwesten.")
      (DESC "Am Ende des Regenbogens")
      (RAUF TO ON-RAINBOW IF RAINBOW-FLAG)
      (NO TO ON-RAINBOW IF RAINBOW-FLAG)
      (OST TO ON-RAINBOW IF RAINBOW-FLAG)
      (SW TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RAINBOW RIVER)>

<ROOM CANYON-BOTTOM	
      (LOC ROOMS)
      (LDESC
"Du bist der Flusschlucht, die hier eher zu erklettern sind. Der geringere Teil des Ablaufs der Wiedermal F%alle fliesst unter dir vorbei. Nach Norden f%uhrt ein schmaler Pfad.")
      (DESC "Auf dem Grund der Schlucht")
      (RAUF TO CLIFF-MIDDLE)
      (NORD TO END-OF-RAINBOW)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER CLIMBABLE-CLIFF RIVER)>

<ROOM CLIFF-MIDDLE	
      (LOC ROOMS)
      (LDESC
"Du bist auf einem Vorsprung, der ungef%ahr auf halber H%ohe auf der Wand der Flusschlucht liegt. Du kannst von hier sehen, dass sich der gr%osste Teil der Wiedermal F%alle sich durch einen Durchgang windet, den du nicht passieren kannst. Unter dir ist derAbgrund %Uber dir gibt es weitereFelsen, dieerklimmbar scheinen.")
      (DESC "Felsvorsprung")
      (RAUF TO CANYON-VIEW)
      (RUNTER TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER)>

<ROOM CANYON-VIEW	
      (LOC ROOMS)
      (LDESC
"Du bist am oberen Rand derGross-Schlucht, auf dem Gipfel der Westwand. Von hier hat man einen wunderbaren Blick auf die Schlucht und flussaufw%arts auf den FlussGletsch. Gegen%uber der Schlucht schliessen die Weissen Felsen de Gipfel der Hohlkopfberge nach Osten hin an. Verfolgt man die Schlucht flussaufw%arts nach Norden, dann kann man die Wiedermal F%alle, aus denen ein Regenbogen heraufsteigt, sehen. Der m%achtige Fluss Gletsch fliesst aus einer grossen dunklen H%ohle. Nach Westen und S%uden kann man einen enormen Wald sehen, der sich auf Kilometer hinzieht. Ein Pfad f%uhrt nach Nordwesten. Es ist m%oglich, von hier in die Schlucht hinunterzuklettern.")
      (DESC "Blick auf Schlucht")
      (OST TO CLIFF-MIDDLE)
      (RUNTER TO CLIFF-MIDDLE)
      (NW TO CLEARING)
      (WEST TO FOREST-3)
      (SUED SORRY "Storm-tossed trees block your way.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER RAINBOW)
      (ACTION CANYON-VIEW-F)>

<ROUTINE CANYON-VIEW-F (RARG)
	 <COND (<AND <==? .RARG ,M-BEG>
		     <VERB? LEAP>
		     <NOT ,PRSO>>
		<JIGS-UP "Nice view, lousy place to jump.">
		<RTRUE>)>>
	       

"SUBTITLE COAL MINE AREA"

<ROOM MINE-ENTRANCE	
      (LOC ROOMS)
      (LDESC
"Du stehst an einem Eingang Er sieht aus wei ein ehemaliger Grubeneingang. Der Schacht f%uhrt in die Westwand, und es gibt dort noch einen Ausgang am S%udende des Raumes.")
      (DESC "Grubeneingang")
      (SUED TO SLIDE-ROOM)
      (HINEIN TO SQUEEKY-ROOM)
      (WEST TO SQUEEKY-ROOM)
      (FLAGS RLANDBIT)>

<ROOM SQUEEKY-ROOM	
      (LOC ROOMS)
      (LDESC
"Du bist in einem kleinen Zimmer. Eigent%umliche quietschende Ger%ausche k%onnen von dem Durchgang am Nordende geh%ort werden. Du kannst auch nach Osten entfliehen.")
      (DESC "Quietschzimmer")
      (NORD TO BAT-ROOM)
      (OST TO MINE-ENTRANCE)
      (FLAGS RLANDBIT)>

<ROOM BAT-ROOM	
      (LOC ROOMS)
      (DESC "Fledermauszimmer")
      (SUED TO SQUEEKY-ROOM)
      (OST TO SHAFT-ROOM)
      (ACTION BATS-ROOM)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM SHAFT-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies ist ein grosser Raum, in dessen Mitte sich ein kleiner durch den Fussboden nach unten in die Dunkelheit verlaufender Schaft ist. Nach Westen und Norden gibt es Ausg%ange von diesem Zimmer. %Uber dem Schacht hat man ein Metalgeh%ause gebaut, an dem eine schwere eiserne Kette befestigt ist. An dem anderen Ende der Kette h%angt ein Korb.")
      (DESC "Schachtzimmer")
      (RUNTER SORRY "You wouldn't fit and would die if you could.")
      (WEST TO BAT-ROOM)
      (NORD TO SMELLY-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL CHAIN)
      ;(PSEUDO "CHAIN" CHAIN-PSEUDO)>

<OBJECT CHAIN
	(LOC LOCAL-GLOBALS)
	(SYNONYM CHAIN)
	(DESC "chain")
	(FLAGS NDESCBIT)
	(ACTION CHAIN-PSEUDO)>

<ROOM SMELLY-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies ist ein kleines unscheinbares Zimmer. Aber aus der Richtung einer kleinen, nach unten f%uhrenden Treppe str%omt ein %ubler Gestank. Nach S%uden verl%auft ein schmaler Tunnel.")
      (DESC "Stinkendes Zimmer")
      (RUNTER TO GAS-ROOM)
      (SUED TO SHAFT-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS GAS)
      ;(PSEUDO "ODOR" GAS-PSEUDO "GAS" GAS-PSEUDO)>

<OBJECT GAS
	(LOC LOCAL-GLOBALS)
	(SYNONYM GAS ODOR)
	(DESC "gas")
	(FLAGS NDESCBIT)
	(ACTION GAS-PSEUDO)>

<ROOM GAS-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies ist ein kleiner Raum, der stark nach Kohlendioxyd stinkt. Es gibt dort einen kurzen Treppenaufgang nach oben und einen schmalen Tunnel nach Osten.")
      (DESC "Gaszimmer")
      (RAUF TO SMELLY-ROOM)
      (OST TO MINE-1)
      (ACTION BOOM-ROOM)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS GAS)
      ;(PSEUDO "GAS" GAS-PSEUDO "ODOR" GAS-PSEUDO)>

<ROOM LADDER-TOP	
      (LOC ROOMS)
      (LDESC
"Dies ist ein sehr kleiner Raum. In der Ecke ist eine wackelige Holzleiter, die nach unten f%uhrt. Sie k%onnte sicher genug sein, um nach unten zu steigen. Es gibt auch noch eine Treppe, die nach oben f%uhrt. ")
      (DESC "Oberteil der Leiter")
      (RUNTER TO LADDER-BOTTOM)
      (RAUF TO MINE-4)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER STAIRS)>

<ROOM LADDER-BOTTOM	
      (LOC ROOMS)
      (LDESC
"Dies ist ein ziemlich breiter Raum. Auf einer Seite ist das Unterteil einer schmalen Holzleiter.")
      (DESC "Unten an der Leiter")
      (SUED TO DEAD-END-5)
      (WEST TO TIMBER-ROOM)
      (RAUF TO LADDER-TOP)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER)>

<ROOM DEAD-END-5	
      (LOC ROOMS)
      (DESC "Dead End")
      (LDESC "Du bist an einer Sackgasse in dem Irrgarten gekommen.")
      (NORD TO LADDER-BOTTOM)
      (FLAGS RLANDBIT)>

<ROOM TIMBER-ROOM	
      (LOC ROOMS)
      (LDESC
"Hier ist ein langer und schmaler Durchgang, der mit zerbrochenem Geb%alk angef%ullt ist. Ein breiter Durchgang kommt vom Osten und f%uhrt am Westende des Raumes in einen sehr engen Durchgang. Von Westen kommt ein starker Durchzug.")
      (DESC "Balkenzimmer")
      (OST TO LADDER-BOTTOM)
      (WEST TO LOWER-SHAFT
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM LOWER-SHAFT	
      (LOC ROOMS)
      (LDESC
"Die ist ein kleines zugiges Zimmer, das am unteren Ende eines langen Schachtes liegt. Nach S%uden f%uhrt ein Durchgang und nach Osten ein sehr schmaler Durchgang. In dem Schacht kann man eine schwere Eisenkette sehen. Am Ende der Kette h%angt ein Korb.")
      (DESC "Zugiges Zimmer")
      (SUED TO MACHINE-ROOM)
      (RAUS TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (OST TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL CHAIN)
      ;(PSEUDO "CHAIN" CHAIN-PSEUDO)>

<ROOM MACHINE-ROOM	
      (LOC ROOMS)
      (DESC "Maschinenraum")
      (NORD TO LOWER-SHAFT)
      (ACTION MACHINE-ROOM-FCN)
      (FLAGS RLANDBIT)>


"SUBTITLE COAL MINE"

<ROOM MINE-1	
      (LOC ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORD TO GAS-ROOM)
      (OST TO MINE-1)
      (NO TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-2	
      (LOC ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORD TO MINE-2)
      (SUED TO MINE-1)
      (SO TO MINE-3)
      (FLAGS RLANDBIT)>

<ROOM MINE-3	
      (LOC ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (SUED TO MINE-3)
      (SW TO MINE-4)
      (OST TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-4	
      (LOC ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORD TO MINE-3)
      (WEST TO MINE-4)
      (RUNTER TO LADDER-TOP)
      (FLAGS RLANDBIT)>

<ROOM SLIDE-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies ist eine kleine Kammer, die Teil einer Kohlengrube gewesen sein muss. Auf deren S%udwand sind die Buchstaben: \"Granitwand\" in den Fels eingraviert. Nach Osten gibt es einen langen Durchgang, und dort ist auch eine steile Metalrutsche, die sich nach unten windet. N%ordlich davon gibt es eine kleine %Offnung.") 
      (DESC "Sch%uttenzimmer")
      (OST TO COLD-PASSAGE)
      (NORD TO MINE-ENTRANCE)
      (RUNTER TO CELLAR)
      (FLAGS RLANDBIT)
      (GLOBAL SLIDE)>

;"RANDOM TABLES FOR WALK-AROUND"

<GLOBAL HOUSE-AROUND
  <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  WEST-OF-HOUSE>>

<GLOBAL FOREST-AROUND
  <LTABLE (PURE) FOREST-1 FOREST-2 FOREST-3 PATH CLEARING FOREST-1>>

<GLOBAL IN-HOUSE-AROUND
  <LTABLE (PURE) LIVING-ROOM KITCHEN ATTIC KITCHEN>>

<GLOBAL ABOVE-GROUND
  <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  FOREST-1 FOREST-2 FOREST-3 PATH CLEARING GRATING-CLEARING
	  CANYON-VIEW>>

;"The GO routine must live here."

<ROUTINE GO ()
        <ENABLE <QUEUE I-FIGHT -1>> ;"ints as in original - and -NE QUEUE"
	<QUEUE I-SWORD -1>
	;<ENABLE <QUEUE I-SWORD -1>>
	<ENABLE <QUEUE I-THIEF -1>>
	<QUEUE I-CANDLES 40>
	;<ENABLE <QUEUE I-CANDLES 40>>
	<QUEUE I-LANTERN 200>
	;<ENABLE <QUEUE I-LANTERN 200>>
	<PUTP ,INFLATED-BOAT ,P?VTYPE ,NONLANDBIT>
	<PUT ,DEF1-RES 1 <REST ,DEF1 2>>
	<PUT ,DEF1-RES 2 <REST ,DEF1 4>>
	<PUT ,DEF2-RES 2 <REST ,DEF2B 2>>
	<PUT ,DEF2-RES 3 <REST ,DEF2B 4>>
	<PUT ,DEF3-RES 1 <REST ,DEF3A 2>>
	<PUT ,DEF3-RES 3 <REST ,DEF3B 2>>
	<SETG HERE ,WEST-OF-HOUSE>
	<THIS-IS-IT ,MAILBOX>
	<CLEAR -1>
        <INIT-STATUS-LINE>
	<CRLF>
	<COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
	       <V-VERSION>
	       <CRLF>)>
	<SETG LIT T>
	<SETG WINNER ,ADVENTURER>
	<SETG PLAYER ,WINNER>
	<MOVE ,WINNER ,HERE>
	<V-LOOK>
	<MAIN-LOOP>
	<AGAIN>>