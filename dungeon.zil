"1DUNGEON for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc. All Rights Reserved.
	-- GERMAN EDITION"

<GLOBAL SCORE-MAX 350>

<GLOBAL FALSE-FLAG <>>

"SUBTITLE OBJECTS"

<OBJECT BOARD
	(LOC LOCAL-GLOBALS)
	(SYNONYM BRETT BRETTER BRETTERN)
	(DESC "Brett")
	(FLAGS NDESCBIT DASBIT)
	(ACTION BOARD-F)>

<OBJECT TEETH
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;OVERBOARD BORD ZAEHNE Z\%AHNE ZAEHNEN Z\%AHNEN GEBISS
	 GEBI\%S)
	(DESC "Gebi%s")
	(FLAGS NDESCBIT DASBIT)
	(ACTION TEETH-F)>

<OBJECT WALL
	(LOC GLOBAL-OBJECTS)
	(SYNONYM WAND WEANDEN W\%ANDEN)
	;(ADJECTIVE SURROUNDING)
	(FLAGS DIEBIT)
	(DESC "Wand")>

<OBJECT SONGBIRD
	(LOC LOCAL-GLOBALS)
	(SYNONYM SINGVOGEL VOGEL)
	;(ADJECTIVE SONG)
	(DESC "Singvogel")
	(FLAGS NDESCBIT DERBIT)
	(ACTION SONGBIRD-F)>

<OBJECT WHITE-HOUSE	
	(LOC LOCAL-GLOBALS)
	(SYNONYM HAUS HERRENHAUS)
	(ADJECTIVE ALTE ALTEN SCHOENE SCH\%ONE SCHOENEN SCH\%ONEN WEISSE
	 WEI\%SE WEI\%SEN WEISSEN)
	(ADJDESC "wei%s")
	(DESC "Haus")
	(FLAGS NDESCBIT DASBIT)
	(ACTION WHITE-HOUSE-F)>

<OBJECT FOREST
	(LOC LOCAL-GLOBALS)
	(SYNONYM WALD BAUEME TANNEN TANNE FICHTEN FICHTE)
	(ADJECTIVE SCHOENE SCHOENEN SCH\%ONE SCH\%ONEN)
	(DESC "Wald")
	(FLAGS NDESCBIT DERBIT)
	(ACTION FOREST-F)>

<OBJECT TREE
	(LOC LOCAL-GLOBALS)
	(SYNONYM BAUM AESTEN \%ASTEN AST)
	(ADJECTIVE GROSSE GROSSEN GRO\%SE GRO\%SEN STORM UMGEBLASENE)
	(DESC "Baum")
	(FLAGS NDESCBIT CLIMBBIT DERBIT)>

<OBJECT MOUNTAIN-RANGE
	(LOC MOUNTAINS)
	(DESC "Berg")
	(SYNONYM BERG BERGE HOHLKOPFBERGE)
	(ADJECTIVE UN\%UBERWINDLICHE HOHLKOPF ;FLATHEAD)
	(FLAGS NDESCBIT CLIMBBIT DERBIT)
	(ACTION MOUNTAIN-RANGE-F)>

<OBJECT GLOBAL-WATER
	(LOC LOCAL-GLOBALS)
	(SYNONYM WASSER WASSERMENGE ;QUANTITY)
	(DESC "Wasser")
	(FLAGS DRINKBIT DASBIT)
	(ACTION WATER-F)>

<OBJECT WATER
	(LOC BOTTLE)
	(SYNONYM WASSER WASSERMENGE H2O)
	(DESC "Wassermenge")
	(FLAGS TRYTAKEBIT TAKEBIT DRINKBIT DIEBIT)
	(ACTION WATER-F)
	(SIZE 4)>

<OBJECT	KITCHEN-WINDOW
	(LOC LOCAL-GLOBALS)
	(SYNONYM FENSTER)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Fenster")
	(FLAGS DOORBIT NDESCBIT DASBIT)
	(ACTION KITCHEN-WINDOW-F)>

<OBJECT CHIMNEY
	(LOC LOCAL-GLOBALS)
	(SYNONYM SCHORNSTEIN)
	(ADJECTIVE DUNKLEN DUNKLE SCHMALEN SCHMALE)
	(DESC "Schornstein")
	(ACTION CHIMNEY-F)
	(FLAGS CLIMBBIT NDESCBIT DERBIT)>

<OBJECT GHOSTS
	(LOC ENTRANCE-TO-HADES)
	(SYNONYM ;GHOSTS ;SPIRITS GEISTERN GEISTER ;FIENDS BIESTER 
	         ;FORCE KRAFT GEISTERZAHL)
	(ADJECTIVE ;INVISIBLE MAGISCHE MAGISCHEN ;EVIL B\%OSEN B\%OSE)
	(DESC "Geisterzahl")
	(FLAGS ACTORBIT NDESCBIT DIEBIT)
	(ACTION GHOSTS-F)>

<OBJECT SKULL
	(LOC LAND-OF-LIVING-DEAD)
	(SYNONYM HIRNSCHALE KOPF KRISTALSCH\%ADEL SCH\%ADEL)
	(ADJECTIVE KRISTALE KRISTALEN WUNDERVOLL GEARBEITETER)
	(DESC "Kristalsch%adel")
	(FDESC
"In einer Ecke dieses Raumes ist ein wundervoll gearbeiteter Kristalsch%adel. Er scheint dich, einigermassen unanagenehm anzugrinsen.")
	(FLAGS TAKEBIT DERBIT)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT LOWERED-BASKET
	(LOC LOWER-SHAFT)
	(SYNONYM ;CAGE KAEFIG K\%AFIG ;DUMBWAITER ;BASKET KORB)
	;(ADJECTIVE LOWERED)
	(LDESC "Von der Kette h%angt ein Korb.")
	(DESC "Korb")
	(FLAGS TRYTAKEBIT DERBIT)
	(ACTION BASKET-F)>

<OBJECT RAISED-BASKET
	(LOC SHAFT-ROOM)
	(SYNONYM ;CAGE KAEFIG K\%AFIG ;DUMBWAITER ;BASKET KORB)
	(DESC "Korb")
	(FLAGS TRANSBIT TRYTAKEBIT CONTBIT OPENBIT DERBIT)
	(ACTION BASKET-F)
	(LDESC "Am Ende der Kette ist ein Korb.")
	(CAPACITY 50)>

<OBJECT LUNCH
	(LOC SANDWICH-BAG)
	(SYNONYM ;FOOD ESSEN ;SANDWICH PEPPERONI BROT MITTAGESSEN
	          ;LUNCH ;DINNER ABENDESSEN)
	(ADJECTIVE PEPPERONI)
	(DESC "Pepperoni-Brot")
	(FLAGS TAKEBIT FOODBIT DASBIT)
	(LDESC "Ein Pepperoni-Brot liegt hier.")>

<OBJECT BAT
	(LOC BAT-ROOM)
	(SYNONYM VAMPIRFLEDERMAUS FLEDERMAUS)
	(ADJECTIVE GROSSE GROSSEN GRO\%SE GRO\%SEN VAMPIRE VAMPIREN)
	(DESC "Fledermaus")
	(FLAGS ACTORBIT TRYTAKEBIT DIEBIT)
	(DESCFCN BAT-D)
	(ACTION BAT-F)>

<OBJECT BELL
	(LOC NORTH-TEMPLE)
	(SYNONYM GLOCKE MESSINGGLOCKE)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Messingglocke")
	(FLAGS TAKEBIT DIEBIT)
	(ACTION BELL-F)>

<OBJECT HOT-BELL
	(SYNONYM MESSINGGLOCKE GLOCKE)
	(ADJECTIVE ROTE ROTEN ROTGL\%UHENDE ROTGLUEHENDE KLEINE KLEINEN)
	(DESC "Glocke")
	(ADJDESC "rotgl%uhend")
	(FLAGS TRYTAKEBIT DIEBIT)
	(ACTION HOT-BELL-F)
	(LDESC "Auf der Erde ist eine rotgl%uhende Glocke.")>

<OBJECT AXE
	(LOC TROLL)
	(SYNONYM AXT)
	(ADJECTIVE BLUTIGE BLUTIGEN)
	(DESC "Axt")
	(ADJDESC "blutig")
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT DIEBIT)
	(ACTION AXE-F)
	(SIZE 25)>

<OBJECT BOLT
	(LOC DAM-ROOM)
	(SYNONYM METALLSCHRAUBE SCHRAUBE)
	(ADJECTIVE METALL GROSSE GROSSEN GRO\%SE GRO\%SEN)
	(DESC "Metallschraube")
	(FLAGS NDESCBIT TURNBIT TRYTAKEBIT DIEBIT)
	(ACTION BOLT-F)>

<OBJECT BUBBLE
	(LOC DAM-ROOM)
	(SYNONYM PLASTIKBLASE BLASE)
	(ADJECTIVE KLEINE KLEINEN GRUENE GR\%UNE GRUENEN GR\%UNEN PLASTIK)
	(DESC "Plastikblase")
	(ADJDESC "gr%un")
	(FLAGS NDESCBIT TRYTAKEBIT DIEBIT)
	(ACTION BUBBLE-F)>

<OBJECT ALTAR
	(LOC SOUTH-TEMPLE)
	(SYNONYM ALTAR)
	(DESC "Altar")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT DERBIT)
	(CAPACITY 50)>

<OBJECT BOOK
	(LOC ALTAR)
	(SYNONYM BUCH ;PRAYER GEBET GEBOT ;PAGE SIETE ;BOOKS BUECHER B\%UCHER)
	(ADJECTIVE SCHWARTE SCHWARTEN GROSSE GROSSEN GRO\%SE GRO\%SEN)
	(DESC "Buch")
	(ADJDESC "schwarz")
	(FLAGS READBIT TAKEBIT CONTBIT BURNBIT TURNBIT DASBIT)
	(ACTION BLACK-BOOK)
	(FDESC "Auf dem Altar liegt ein gro%ses schwarzes Buch. Es ist bei Seite 569 aufgeschlagen.")
	(SIZE 10)
	(TEXT "12592.Gebot|
|
Oh Ihr, die Ihr zueinander sagt: %>Tag, Seeman%<|
Seid Ihr Euch der Gr%o%se Eurer S%unden vor den G%ottern bewu%st?|
Es steht geschrieben, da%s Ihr zwischen Steinen zermalmt werden sollt.|
Sollen die zornigen G%otter Eure %Uberreste in das Kneippbecken werfen?|
Wahrhaftig Eure Augen sollten mit einem spitzen Stock geblendet werden!|
Bis ans Ende dieser Erde sollt Ihr wandern,|
Und in den Hades am Ende Eurer Tage sollt Ihr verbannt werden.|
Wahrhaftig Ihr sollt b%ussen f%ur eure Schlauheit." )>

<OBJECT BROKEN-LAMP
	(SYNONYM LAMPE LEUCHTE)
	(ADJECTIVE KAPUTTE KAPUTTEN)
	(ADJDESC "kaputt")
	(DESC "Leuchte")
	(FLAGS TAKEBIT DIEBIT)>

<OBJECT SCEPTRE
	(LOC COFFIN)
	(SYNONYM ZEPTER ;TREASURE SCHATZ)
	(ADJECTIVE SCHARFE SCHARFEN AEGYPTEN ;ANCIENT REICHVERZIERTE ENAMELED)
	(DESC "Zepter")
	(FLAGS TAKEBIT WEAPONBIT DASBIT)
	(ACTION SCEPTRE-FUNCTION)
	(LDESC
"Ein reichverziertes Zepter, das zu einer scharfen Spitze ausl%auft,
ist hier.")
	(FDESC
"Ein Zepter, das wom%oglich direkt aus %Agypten stammt, ist in dem Sarg. Das Zepter ist mit farbigem Emaille verziert und l%auft zu einer scharfen Spitze
aus.")
	(SIZE 3)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT TIMBERS
	(LOC TIMBER-ROOM)
	(SYNONYM GEBALK)
	;(ADJECTIVE WOODEN BROKEN)
	(DESC "Geb%alk")
	(FLAGS TAKEBIT DASBIT)
	(SIZE 50)>

<OBJECT	SLIDE
	(LOC LOCAL-GLOBALS)
	(SYNONYM RAMPE ;CHUTE ;RAMP ;SLIDE)
	(ADJECTIVE STEEP METAL TWISTING)
	(DESC "Rampe")
	(FLAGS CLIMBBIT DIEBIT)
	(ACTION SLIDE-FUNCTION)>

<OBJECT KITCHEN-TABLE
	(LOC KITCHEN)
	(SYNONYM TISCH KUECHENTISCH)
	;(ADJECTIVE KITCHEN)
	(DESC "Kuechentisch") 
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT DERBIT)
	(CAPACITY 50)>

<OBJECT ATTIC-TABLE
	(LOC ATTIC)
	(SYNONYM TISCH)
	(DESC "Tisch")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT DERBIT)
	(CAPACITY 40)>

<OBJECT SANDWICH-BAG
	(LOC KITCHEN-TABLE)
	(SYNONYM SACK)
	(ADJECTIVE LAEGLICHER L\%AGLICHER BRAUNE BRAUNER)
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
	(SYNONYM REIHE WERKZEUGK ;-AESTEN WERKZEUGK ;-\%ASTEN K\%ASTEN KAESTEN)
	(ADJECTIVE WERKZEUGE)
	(DESC "Werkzeugk%astenreihe")
	(FLAGS CONTBIT OPENBIT TRYTAKEBIT SACREDBIT DIEBIT)
	(ACTION TOOL-CHEST-FCN)>

<OBJECT YELLOW-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM KNOPF ;SWITCH)
	(ADJECTIVE GELBE GELBEN)
	(DESC "Knopf")
	(ADJDESC "gelb")
	(FLAGS NDESCBIT DERBIT)
	(ACTION BUTTON-F)>

<OBJECT BROWN-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM KNOPF ;SWITCH)
	(ADJECTIVE BRAUNE BRAUNEN)
	(DESC "Knopf")
	(ADJDESC "braun")
	(FLAGS NDESCBIT DERBIT)
	(ACTION BUTTON-F)>

<OBJECT RED-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM KNOPF ;SWITCH)
	(ADJECTIVE ROTE ROTEN)
	(DESC "Knopf")
	(ADJDESC "rot")
	(FLAGS NDESCBIT DERBIT)
	(ACTION BUTTON-F)>

<OBJECT BLUE-BUTTON
	(LOC MAINTENANCE-ROOM)
	(SYNONYM KNOPF ;SWITCH)
	(ADJECTIVE BLAUE BLAUEN)
	(DESC "Knopf")
	(ADJDESC "blau")
	(FLAGS NDESCBIT DERBIT)
	(ACTION BUTTON-F)>

<OBJECT TROPHY-CASE	
	(LOC LIVING-ROOM)
	(SYNONYM TROPHAEENSCHRANK TROPH\%AENSCHRANK SCHRANK)
	(ADJECTIVE TROPHY)
	(DESC "Troph%aenschrank")
	(FLAGS TRANSBIT CONTBIT NDESCBIT TRYTAKEBIT SEARCHBIT DERBIT)
	(ACTION TROPHY-CASE-FCN)
	(CAPACITY 10000)>

<OBJECT RUG
	(LOC LIVING-ROOM)
	(SYNONYM ;RUG ;CARPET PERSERTEPPICH TEPPICH LAEUFER L\%AUFER)
	(ADJECTIVE GROSSE GROSSEN GRO\%SE GRO\%SEN PERSER)
	(DESC "Teppich")
	(FLAGS NDESCBIT TRYTAKEBIT DERBIT)
	(ACTION RUG-FCN)>

<OBJECT CHALICE
	(LOC TREASURE-ROOM)
	(SYNONYM SILBERKELCH KELCH SCHATZ)
	(ADJECTIVE SILBER ;ENGRAVINGS)
	(DESC "Silberkelch")
	(FLAGS TAKEBIT TRYTAKEBIT CONTBIT DERBIT)
	(ACTION CHALICE-FCN)
	(LDESC "Es gibt hier einen Silberkelch, der sehr fein graviert ist.")
	(CAPACITY 5)
	(SIZE 10)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT GARLIC
	(LOC SANDWICH-BAG)
	(SYNONYM KNOB KNOBLAUCHZEHE)
	(DESC "Knoblauchzehe")
	(FLAGS TAKEBIT FOODBIT DIEBIT)
	(ACTION GARLIC-F)
	(SIZE 4)>

<OBJECT TRIDENT
	(LOC ATLANTIS-ROOM)
	(SYNONYM DREIZACK KRISTALL KRISTALLDREIZACK SCHATZ) 
	(ADJECTIVE POSEIDONS KRISTALL)
	(DESC "Kristalldreizack")
	(FLAGS TAKEBIT DERBIT)
	(FDESC "Am Ufer liegt Poseidons ureigener Kristalldreizack.")
	(SIZE 20)
	(VALUE 4)
	(TVALUE 11)>

<OBJECT CYCLOPS
	(LOC CYCLOPS-ROOM)
	(SYNONYM ZYKLOP MONSTER AUGE)
	;(ADJECTIVE HUNGRY GIANT)
	(DESC "Zyklop")
	(FLAGS ACTORBIT NDESCBIT TRYTAKEBIT DERBIT)
	(ACTION CYCLOPS-FCN)
	(STRENGTH 10000)>

<OBJECT DAM
	(LOC DAM-ROOM)
	(SYNONYM DAMM SCHLEUSENTORE TOR TORE ;GATE ;GATES ;FCD\#3
	         HOCHWASSERKONTROLLDAMM)
	(ADJECTIVE KONTROLLDAMM KONTROLL)
	(DESC "Damm")
	(FLAGS NDESCBIT TRYTAKEBIT DERBIT)
	(ACTION DAM-FUNCTION)>

<OBJECT TRAP-DOOR
	(LOC LIVING-ROOM)
	(SYNONYM FALLTUER FALLT\%UR TUER T\%UR OBERFLAECHE OBERBL\%ACHE)
	(ADJECTIVE FALL STAUBIGE STAUBIGEN)
	(DESC "Fallt%ur")
	(FLAGS DOORBIT NDESCBIT INVISIBLE DIEBIT)
	(ACTION TRAP-DOOR-FCN)>

<OBJECT BOARDED-WINDOW
        (LOC LOCAL-GLOBALS)
	(SYNONYM FENSTER)
	;(ADJECTIVE BOARDED)
	(DESC "Fenster")
	(FLAGS NDESCBIT DASBIT)
	(ACTION BOARDED-WINDOW-FCN)>

<OBJECT FRONT-DOOR
	(LOC WEST-OF-HOUSE)
	(SYNONYM HAUSTUER TUER T\%UR)
	(ADJECTIVE HAUS)
	(DESC "Haust%ur")
	(FLAGS DOORBIT NDESCBIT DIEBIT)
	(ACTION FRONT-DOOR-FCN)>

<OBJECT BARROW-DOOR	
	(LOC STONE-BARROW)
	(SYNONYM STEINTUER STEIT\%UR TUER T\%UR)
	(ADJECTIVE RIESIGE REISIGEN STEINE STEINEN)
	(DESC "Steint%ur")
	(FLAGS DOORBIT NDESCBIT OPENBIT DIEBIT)
	(ACTION BARROW-DOOR-FCN)>

<OBJECT BARROW
	(LOC STONE-BARROW)
	(SYNONYM HUEGELGRAB H\%UGELGRAB GRAB ;BARROW ;TOMB STEIN)
	(ADJECTIVE ENORMEN STEINERNE STEINERNE)
	(DESC "H%ugelgrab")
	(ADJDESC "steinern")
	(FLAGS NDESCBIT DASBIT)
	(ACTION BARROW-FCN)>

<OBJECT BOTTLE
	(LOC KITCHEN-TABLE)
	(SYNONYM FLASHE ;CONTAINER)
	(ADJECTIVE KLARE KLAREN)
	(DESC "Flasche")
	(FLAGS TAKEBIT TRANSBIT CONTBIT DIEBIT)
	(ACTION BOTTLE-FUNCTION)
	(FDESC "Auf dem Tisch steht eine Flasche.")
	(CAPACITY 4)>

<OBJECT CRACK
	(LOC LOCAL-GLOBALS)
	(SYNONYM RITZE)
	;(ADJECTIVE NARROW)
	(DESC "Ritze")
	(FLAGS NDESCBIT DIEBIT)
	(ACTION CRACK-FCN)>

<OBJECT COFFIN
	(LOC EGYPT-ROOM)
	(SYNONYM SARG ;COFFIN ;CASKET SCHATZ)
	(ADJECTIVE REINGOLDENE GOLDENE GOLDENE)
	(DESC "Sarg")
	(ADJDESC "reingolden")
	(FLAGS TAKEBIT CONTBIT SACREDBIT SEARCHBIT DERBIT)
	(LDESC
"Der reingoldene Sarg, den man f%ur das Begr%abnis von Ramses II. benutzt hat, ist hier.")
	(CAPACITY 35)
	(SIZE 55)
	(VALUE 10)
	(TVALUE 15)>

<OBJECT GRATE
	(SYNONYM GITTER)
	(DESC "Gitter")
	(FLAGS DOORBIT NDESCBIT INVISIBLE DASBIT)
	(ACTION GRATE-FUNCTION)>

<OBJECT PUMP
	(LOC RESERVOIR-NORTH)
	(SYNONYM FAHRRADPUMPE PUMPE)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Fahrradpumpe")
	(FLAGS TAKEBIT TOOLBIT DIEBIT)>

<OBJECT DIAMOND
	(SYNONYM DIAMANTEN SCHATZ DIAMANT)
	(ADJECTIVE RIESIGEN RIESIGE)
	(DESC "Diamant")
	(ADJDESC "riesig")
	(FLAGS TAKEBIT DERBIT)
	(LDESC 
"Es gibt hier einen riesigen Diamant (elegant geschliffen).")
	(VALUE 10)
	(TVALUE 10)>

<OBJECT JADE
	(LOC BAT-ROOM)
	(SYNONYM JADE-FIGUR FIGUR SCHATZ)
	(ADJECTIVE KOSTBARE KOSTBAREN JADE)
	(DESC "Jade-Figur")
	(FLAGS TAKEBIT DIEBIT)
	(LDESC "Es gibt hier eine kostbare Jade-Figur.")
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT KNIFE
	(LOC ATTIC-TABLE)
	(SYNONYM ;KNIVES ;KNIFE ;BLADE MESSER SCHNEIDE)
	(ADJECTIVE GEFAEHRLICH GEF\%AHRLICH AUSSEHEND AU\%SEHENDE)
	(DESC "Messer")
	(ADJDESC "au%senhend")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT DASBIT)
	(FDESC "Auf einem Tisch liegt ein gef%ahrlich au%sehendes Messer.")
	(ACTION KNIFE-F)>

<OBJECT BONES
	(LOC MAZE-5)
	(SYNONYM SKELETT GESTELL ;BONES ;SKELETON ;BODY)
	(DESC "Skelett")
	(FLAGS TRYTAKEBIT NDESCBIT DASBIT)
	(ACTION SKELETON)>

<OBJECT BURNED-OUT-LANTERN
	(LOC MAZE-5)
	(SYNONYM LANTERNE LAMPE LEUCHTE)
	(ADJECTIVE AUSGEBRANN NUTZLOSE NUTZLOSEN ;RUSTY ;BURNED ;DEAD ;USELESS)
	(DESC "Laterne")
	(ADJDESC "ausgebrannt")
	(FLAGS TAKEBIT DIEBIT)
	(FDESC "Die ausgebrannte Lanterne des toten Abenteurers liegt hier.")
	(SIZE 20)>

<OBJECT BAG-OF-COINS
	(LOC MAZE-5)
	(SYNONYM LEDERSACK SACK M\%UNZEN GOLDM\%UNZEN SCHATZ)
	(ADJECTIVE LEDER SCH\%ABIGE SCH\%ABIGEN)
	(DESC "Ledersack voll M%unzen")
	(FLAGS TAKEBIT DERBIT)
	(LDESC 
"Ein sch%abiger Ledersack vollgepfropft mit Goldm%unzen ist hier.")
	(ACTION BAG-OF-COINS-F)
	(SIZE 15)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT LAMP
	(LOC LIVING-ROOM)
	(SYNONYM LAMPE LATERNE LICHT LEUCHTE MESSINGLEUCHTE)
	(ADJECTIVE MESSING MESSINGE MESSINGEN BATTERIEN)
	(DESC "Messingleuchte")
	(ADJDESC "batteriengespeist")
	(FLAGS TAKEBIT LIGHTBIT DIEBIT)
	(ACTION LANTERN)
	(FDESC 
"Eine batteriengespeiste Messingleuchte ist auf dem Troph%aenschrank.")
	(LDESC 
;"There is a brass lantern (battery-powered) here."
"Hier ist eine batteriengespeiste Messingleuchte.")
	(SIZE 15)>

<OBJECT EMERALD
	(LOC BUOY)
	(SYNONYM SMARAGD SCHRIFTGRAD SCHATZ)
	(ADJECTIVE GROSSE GROSSEN GRO\%SEN GRO\%SE)
	(DESC "Smaragd")
	(ADJDESC "gro%s")
	(FLAGS TAKEBIT DERBIT)
	(VALUE 5)
	(TVALUE 10)>

<OBJECT ADVERTISEMENT
	(LOC MAILBOX)
	(SYNONYM ZETTEL ;ADVERTISEMENT POSTSACK)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Zettel")
	(FLAGS READBIT TAKEBIT BURNBIT DERBIT)
	(LDESC "Ein kleine Zettel liegt auf der Erde.")
	(TEXT
"%>Willkommen in Zork!|
|
Zork ist ein Spiel voller Abenteuer, Gefahren und gemeiner Schlauheit Beim. Spielen wirst du einige der wundersamsten Welten entdecken, die irgend ein Sterblicher gesehen hat. Kein Heimcomputer sollte ohne dieses Spiel sein.%<")
	(SIZE 2)>

<OBJECT LEAK
	(LOC MAINTENANCE-ROOM)
	(SYNONYM ;LEAK LECK ;DRIP ;PIPE ROHR)
	(DESC "Leck")
	(FLAGS NDESCBIT INVISIBLE DASBIT)
	(ACTION LEAK-FUNCTION)>

<OBJECT MACHINE
	(LOC MACHINE-ROOM)
	(SYNONYM ;MACHINE MASCHINE WAESCHETROCKNER W\%ASCHETROCKNER ;LID
	         DECKEL)
	(DESC "Maschine")
	(FLAGS CONTBIT NDESCBIT TRYTAKEBIT DIEBIT)
	(ACTION MACHINE-F)
	(CAPACITY 50)>

<OBJECT INFLATED-BOAT
	(SYNONYM BOOT ZAUBERBOOT ;HAUFEN PLASTIK)
	(ADJECTIVE ZAUBERE ZAUBEREN PLASTISCHE ;HAUFEN)
	(DESC "Zauberboot")
	(FLAGS TAKEBIT BURNBIT VEHBIT OPENBIT SEARCHBIT DASBIT)
	(ACTION RBOAT-FUNCTION)
	(CAPACITY 100)
	(SIZE 20)
	(VTYPE NONLANDBIT)>

<OBJECT MAILBOX
	(LOC WEST-OF-HOUSE)
	(SYNONYM KASTEN BRIEFKASTEN)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Briefkasten")
	(ADJDESC "klein")
	(FLAGS CONTBIT TRYTAKEBIT DERBIT)
	(CAPACITY 10)
	(ACTION MAILBOX-F)>

<OBJECT MATCH
	(LOC DAM-LOBBY)
	(SYNONYM STREICHHO SCHACHTEL ;MATCHBOOK)
	(ADJECTIVE ;MATCH STREICHHO)
	(DESC "Streichholzschachtel")
	(FLAGS READBIT TAKEBIT DIEBIT)
	(ACTION MATCH-FUNCTION)
	;"ren: some eng."
	(LDESC
"Eine Streichholzschachtel mit der Auffschrift: Visit Beautiful FCD#3 liegt hier.")
	(SIZE 2)
	(TEXT
"|
(Schlie%se die Schachtel, bevor du das Streichholz anz%undest.)|
|
Herr Superschlau aus Hack sagt: Bevor ich in diese Vorlesung ging war ich ein mickeriger Bit-Mischer. Jetzt, mit dem, was ich an der Hacker T.U gelernt habe, f%uhle ich mich wichtig und kann mit den Besten interfacen und verr%uckt spielen.|
|
Herr Dr. Leer hatte folgendes zu sagen: %>Vor nur zehn kurzen Tagen hatte ich nur die Aussicht auf eine chancenlose Stelle als Doktor. Jetzt habe ich eine vielversprechende Zukunft und mache wirkliche Zorkknete.%<
|
Die Technische Uni Hack kann diese fantastischen Resultate nicht jedem versprechen. Aber, einen Doktortitel von der Hack TU malt auch deine Zukunft rosiger aus.")>

<OBJECT MIRROR-2
	(LOC MIRROR-ROOM-2)
	(SYNONYM REFLEX REFLEXION RUECKSTRAHLUNG R\%UCKSTRAHLUNG)
	(ADJECTIVE RIESIGE RIESIGEN)
	(DESC "Spiegel")
	(ADJDESC "riesig")
	(FLAGS TRYTAKEBIT NDESCBIT DERBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT MIRROR-1
	(LOC MIRROR-ROOM-1)
	(SYNONYM REFLEX REFLEXION RUECKSTRAHLUNG R\%UCKSTRAHLUNG)
	(ADJECTIVE RIESIGE RIESIGEN)
	(DESC "Spiegel")
	(ADJDESC "riesig")
	(FLAGS TRYTAKEBIT NDESCBIT DERBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT PAINTING
	(LOC GALLERY)
	(SYNONYM GEM\%ALDE GEMAELDE SCHATZ)
	(ADJECTIVE SCHOENE SCHOENEN SCH\%ONE SCH\%ONEN)
	(DESC "Gem%alde")
	(ADJDESC "sch%on")
	(FLAGS TAKEBIT BURNBIT DASBIT)
	(ACTION PAINTING-FCN)
	(FDESC
"Gl%ucklicherweise bleibt dir noch eine Chance auch ein Gangster zu werden, denn an der anderen Wand h%angt ein Gem%alde von einmaliger Sch%onheit.")
	(LDESC 
;"A painting by a neglected genius is here."
"Ein Gem%alde von einem unbeachteten Gro%sen ist hier.")
	(SIZE 15)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT CANDLES
	(LOC SOUTH-TEMPLE)
	(SYNONYM KERZENPAAR PAAR KERZEN)
	(ADJECTIVE BRENNENDE PAAR)
	(DESC "Kerzenpaar")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT DASBIT)
	(ACTION CANDLES-FCN)
	(FDESC 
"Auf dem Altar steht ein Kerzenpaar.")
	(SIZE 10)>

<OBJECT GUNK
	(SYNONYM ZEUG SCHLACKE ;GUNK ;PIECE ;SLAG)
	(ADJECTIVE WIDERLICHE)
	(DESC "Schlacke")
	(ADJDESC "glasartig")
	(FLAGS TAKEBIT TRYTAKEBIT DIEBIT)
	(ACTION GUNK-FUNCTION)
	(SIZE 10)>

<OBJECT BODIES
	(LOC LOCAL-GLOBALS)
	(SYNONYM HAUFEN K\%ORPERN KOERPERN K\%ORPER KOERPER K\%ORPERHAUFEN
	         KOERPERHAUFEN)
	(ADJECTIVE ZERQUETSCHTE)
	(DESC "K%orperhaufen")
	(FLAGS NDESCBIT TRYTAKEBIT DERBIT)
	(ACTION BODY-FUNCTION)>

<OBJECT LEAVES
	(LOC GRATING-CLEARING)
	(SYNONYM BLAETTERHAUFEN BL\%ATTERHAUFEN BLAETTER BL\%ATTER BLATT
	         HAUFEN)
	(DESC "Bl%atterhaufen")
	(FLAGS TAKEBIT BURNBIT TRYTAKEBIT DASBIT)
	(ACTION LEAF-PILE)
	(LDESC "Auf dem Boden liegt ein Bl%atterhaufen.")
	(SIZE 25)>

<OBJECT PUNCTURED-BOAT
	(SYNONYM BOOT ;PILE PLASTIK HAUFEN)
	(ADJECTIVE HAUFEN PLASTISCHE GEPLATZTE GEPLATZTEN)
	(DESC "Boot")
	(ADJDESC "geplatzt")
	(FLAGS TAKEBIT BURNBIT DASBIT)
	(ACTION DBOAT-FUNCTION)
	(SIZE 20)>

<OBJECT INFLATABLE-BOAT
	(LOC DAM-BASE)
	(SYNONYM HAUFEN BOOT PLASTIK ;VALVE VENTIL)
	(ADJECTIVE HAUFEN PLASTISCHE KLEINE KLEINEN)
	(DESC "Haufen Plastik")
	(FLAGS TAKEBIT BURNBIT DERBIT)
	(ACTION IBOAT-FUNCTION)
	(LDESC
"Hier gibt es einen Haufen Plastik, an dem ein kleines Ventil befestigt ist.")
	(SIZE 20)>

<OBJECT BAR
	(LOC LOUD-ROOM)
	(SYNONYM BARREN PLATINBARREN SCHATZ)
	(ADJECTIVE PLATINISCH)
	(DESC "Platinbarren")
	(FLAGS TAKEBIT SACREDBIT DERBIT)
	(LDESC "Auf dem Boden liegt ein Platinbarren.")
	(SIZE 20)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT POT-OF-GOLD
	(LOC END-OF-RAINBOW)
	(SYNONYM TOPF GOLD GOLDTOPF SCHATZ)
	(ADJECTIVE GOLDE GOLDEN)
	(DESC "Topf voll Gold")
	(FLAGS TAKEBIT INVISIBLE DERBIT)
	(FDESC "Am Ende des Regenbogens steht ein Topf voll Gold.")
	(SIZE 15)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT PRAYER
	(LOC NORTH-TEMPLE)
	(SYNONYM GEBET INSCHRIFT)
	(ADJECTIVE ANTIKE ANTIKEN)
	(DESC "Gebet")
	(FLAGS READBIT SACREDBIT NDESCBIT DASBIT)
	;(TEXT
"The prayer is inscribed in an ancient script, rarely used today. It seems
to be a philippic against small insects, absent-mindedness, and the picking
up and dropping of small objects. The final verse consigns trespassers to
the land of the dead. All evidence indicates that the beliefs of the ancient
Zorkers were obscure.")
	(TEXT "Das Gebet ist in einer uralten Schrift, die man heute kaum
benutzt, eingemeiselt. Es erscheint eingriechisches Dogma gegen kleine
Insekten, Vergesslichkeit, und das Aufheben und Fallenlassen von kleinen
Dingen zu sein. Der letzte Vers verdammt Uebertreter zum
Land der Toten. Alle Nachweise deuten darauf hin, dass die Ideen der
alten Zorker eigentuermlich verwirrt waren.")>

<OBJECT RAILING
	(LOC DOME-ROOM)
	(SYNONYM GELAENDER GEL\%ANDER)
	(ADJECTIVE HOELZERNE HOELZERNE H\%OLZERNE H\%OLZERNEN)
	(DESC "Gel%ander")
	(ADJDESC "h%olzern")
	(FLAGS NDESCBIT DASBIT)>

<OBJECT RAINBOW
	(LOC LOCAL-GLOBALS)
	(SYNONYM REGENBOGEN BOGEN)
	(DESC "Regenbogen")
	(FLAGS NDESCBIT CLIMBBIT DERBIT)
	(ACTION RAINBOW-FCN)>

<OBJECT RIVER
	(LOC LOCAL-GLOBALS)
	(DESC "Flu%s Gletsch")
	(SYNONYM GLETSCH FLUSS FLUSSGLETSCH FLU\%S)
	(ADJECTIVE FLUSS GLETSCH)
	(ACTION RIVER-FUNCTION)
	(FLAGS NDESCBIT DERBIT)>

<OBJECT BUOY
	(LOC RIVER-4)
	(SYNONYM MARKIERUNGSBOJE BOJE)
	(ADJECTIVE ROTE ROTEN)
	(DESC "Markierungsboje")
	(ADJDESC "rot")
	(FLAGS TAKEBIT CONTBIT DIEBIT)
	(FDESC 
"Es gibt hier eine rote Markierungsboje (Wahrscheinlich eine Warnung).")
	(CAPACITY 20)
	(SIZE 10)
	(ACTION TREASURE-INSIDE)>

<OBJECT ROPE
	(LOC ATTIC)
	(SYNONYM SEIL)
	(ADJECTIVE DICKE DICKEN AUFGEROLLTE)
	(DESC "Seil")
	(FLAGS TAKEBIT SACREDBIT TRYTAKEBIT DASBIT)
	(ACTION ROPE-FUNCTION)
	(FDESC "Ein dickes aufgerolltes Seil liegt in der Ecke.")
	(SIZE 10)>

<OBJECT RUSTY-KNIFE
	(LOC MAZE-5)
	(SYNONYM MESSER)
	(ADJECTIVE ROSTIGE ROSTIGEN)
	(DESC "Messer")
	(ADJDESC "rostig")
	(FLAGS TAKEBIT TRYTAKEBIT WEAPONBIT TOOLBIT DASBIT)
	(ACTION RUSTY-KNIFE-FCN)
	(FDESC "Neben dem Knochenger%ust liegt ein rostiges Messer.")
	(SIZE 20)>

<OBJECT SAND
	(LOC SANDY-CAVE)
	(SYNONYM SAND SANDSTRAND)
	(DESC "Sand")
	(FLAGS NDESCBIT DERBIT)
	(ACTION SAND-FUNCTION)>

<OBJECT BRACELET
	(LOC GAS-ROOM)
	(SYNONYM BAND ARMBAND SCHATZ)
	(ADJECTIVE SAPHIREINGELEGT)
	(DESC "Armband")
	(ADJDESC "saphireingelegt")
	(FLAGS TAKEBIT DASBIT)
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT SCREWDRIVER
	(LOC MAINTENANCE-ROOM)
	(SYNONYM SCHRAUBEN ZIEHER ;TOOL)
	(ADJECTIVE SCHRAUBEN)
	(DESC "Schraubenzieher")
	(FLAGS TAKEBIT TOOLBIT DERBIT)>

<OBJECT KEYS
	(LOC MAZE-5)
	(SYNONYM SCHLUESSEL SCHL\%USSEL DIETRICH NACHSCHLUESSEL
	         NACHSCHL\%USSEL HAUPTSCHLUESSEL HAUPTSCHL\%USSEL)
	;(ADJECTIVE SKELETON)
	(DESC "Schl%ussel")
	(FDESC 
"Der Abenteurer war nicht nur gl%ucklos, er war auch verschlossen. Neben dem
Skelett liegt ein Schl%ussel.")
	(FLAGS TAKEBIT TOOLBIT DERBIT)
	(SIZE 10)>

<OBJECT SHOVEL
	(LOC SANDY-BEACH)
	(SYNONYM SCHAUFEL SCHIPPE)
	(DESC "Schaufel")
	(FLAGS TAKEBIT TOOLBIT DIEBIT)
	(SIZE 15)>

<OBJECT COAL
	(LOC DEAD-END-5)
	(SYNONYM KOHLE KOHLEN HALDE KOHLENHALDE)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Kohlenhalde")
	(ADJDESC "klein")
	(FLAGS TAKEBIT BURNBIT DIEBIT)
	(SIZE 20)>

<OBJECT LADDER
	(LOC LOCAL-GLOBALS)
	(SYNONYM HOLZLEITER LEITER LAUFMASCHE)
	(ADJECTIVE HOLZE HOLTZEN EINEWACKELIGE)
	(DESC "Holzleiter")
	(FLAGS NDESCBIT CLIMBBIT DIEBIT)>

<OBJECT SCARAB
	(LOC SANDY-CAVE)
	(SYNONYM SKARAB%AUS SKARABAEUS SCHATZ)
	;(ADJECTIVE BEAUTI CARVED JEWELED)
	(DESC "Skarab%aus")
	(ADJDESC "sch%on")
	(FLAGS TAKEBIT INVISIBLE DERBIT) 
	(SIZE 8)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT LARGE-BAG
	(LOC THIEF)
	(SYNONYM SACK)
	(ADJECTIVE GROSSE GROSSEN GRO\%SE GROS\%SEN)
	(DESC "Sack")
	(ADJDESC "gro%s")
	(ACTION LARGE-BAG-F)
	(FLAGS TRYTAKEBIT NDESCBIT DERBIT)>  

<OBJECT STILETTO
	(LOC THIEF)
	(SYNONYM STILETT)
	(ADJECTIVE TOEDLICHE TOEDLICHE T\%ODLICHEN T\%ODLICHE)
	(DESC "Stilett")
	(ACTION STILETTO-FUNCTION)
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT DASBIT)
	(SIZE 10)>

<OBJECT MACHINE-SWITCH
	(LOC MACHINE-ROOM)
	(SYNONYM SCHALTER)
	(DESC "Schalter")
	(FLAGS NDESCBIT TURNBIT DERBIT)
	(ACTION MSWITCH-FUNCTION)>

<OBJECT WOODEN-DOOR
	(LOC LIVING-ROOM)
	(SYNONYM TUER TU\%R HOLZTUER HOLZT\%UR WORTLAUT INSCHRIFT RUNEN RUNE)
	(ADJECTIVE VERNAGELTE FREMDEN)
	(DESC "Holzt%ur")
	(FLAGS READBIT DOORBIT NDESCBIT TRANSBIT DIEBIT)	
	(ACTION FRONT-DOOR-FCN)
	(TEXT
"Der volle Wortlaut dieser Inschrift ist: %>Dieser Raum wurde mit Absicht freigelassen%<.")>

<OBJECT SWORD
	(LOC LIVING-ROOM)
	(SYNONYM SCHWERT ELFENSCHWERT BLATT HALM)
	(ADJECTIVE ELFEN ALTE ALTEN)
	(DESC "Elfenschwert")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT DASBIT)
	(ACTION SWORD-FCN)
	(FDESC
"%Uber dem Troph%aenschrank h%angt ein Elfenschwert aus dem Altertum.")
	(SIZE 30)
	(TVALUE 0)>

<OBJECT MAP
	(LOC TROPHY-CASE)
	(SYNONYM PERGAMENT LANDKARTE)
	(ADJECTIVE URALTE URALTEN ALTE ALTEN)
	(DESC "Landkarte")
	(ADJDESC "uralt")
	(FLAGS INVISIBLE READBIT TAKEBIT DIEBIT)
	(FDESC "In dem Troph%aenschrank ist ein uraltes Pergament, das eine Landkarte sein k%onte.")
	(SIZE 2)
	(TEXT
;"The map shows a forest with three clearings. The largest clearing contains
a house. Three paths leave the large clearing. One of these paths, leading
southwest, is marked %>To Stone Barrow%<."
"Die Karte zeigt einen Wald mit drei Lichtungen. Die gr%osste Lichtung beherbergt ein Haus. Drei Pfade verlassen die grosse Lichtung. Einer der Pfade, der nach SW fuehrt, hat ein Schild %>zum Steingrab%<.")>

<OBJECT BOAT-LABEL
	(LOC INFLATED-BOAT)
	(SYNONYM SCHILDCHEN)
	(ADJECTIVE BEIGE BEIGEN)
	(DESC "Schildchen")
	(ADJDESC "beig")
	(FLAGS READBIT TAKEBIT BURNBIT DASBIT)
	(SIZE 2)
	(TEXT
" !!!!FROBOZ ZAUBERBOOTFABRIK!!!!|
|
Tag, Seeman!|
|
   Um ins Wasser zu gehen, sage: %>Absto%sen%<.|
   Um ans Land zur%uckzukehen, sage: %>Landen%< oder gib die Richtung, in der du das Boot steuern m%ochtest, an.|
|
Garantie:|
|
   Dieses Boot hat eine Garantie mit einer Laufzeit von einer Tausendstelsekunde, die mit dem Kaufsdatum oder dem Datum der ersten Benutzung beginnt.|
|
Warnung:|
   Dieses Boot ist aus d%unnem Plastik. Hals und Beinbruch!")>

<OBJECT THIEF
	(LOC ROUND-ROOM)
	(SYNONYM DIEB ROBBER MANN MENSCH KERL TYP)
	(ADJECTIVE VERDAECHTIG VERD\%ACHTIG AUSSEHEND \%UBELAUSSEHENDE)
	(DESC "Dieb")
	(FLAGS ACTORBIT INVISIBLE CONTBIT OPENBIT TRYTAKEBIT DASBIT)
	(ACTION ROBBER-FUNCTION)
	(LDESC
"Da steht ein verd%achtig aussehender Kerl, der eine T%ute h%alt, gegen die Wand gelehnt. Er ist mit einem t%odlichen Stilett bewaffnet.")
	(STRENGTH 5)>

<OBJECT PEDESTAL
	(LOC TORCH-ROOM)
	(SYNONYM PODEST MARMORPODEST)
	(ADJECTIVE MARMORE MARMOREN)
	(DESC "Marmorpodest")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT DASBIT)
	(ACTION DUMB-CONTAINER)
	(CAPACITY 30)>

<OBJECT TORCH
	(LOC PEDESTAL)
	(SYNONYM FACKEL ELFENBEIN SCHATZ)
	(ADJECTIVE BRENNENDE ELFENBEIN)
	(DESC "Fackel")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT DIEBIT)
	(ACTION TORCH-OBJECT)
	(FDESC "Auf dem Podest ist eine brennende Fackel aus Elfenbein.")
	(SIZE 20)
	(VALUE 14)
	(TVALUE 6)>

<OBJECT GUIDE
	(LOC DAM-LOBBY)
	(SYNONYM PROSPECK PROSPEKTE BUCH REISENFUEHRER REISENF\%UHRER)
	;(ADJECTIVE TOUR GUIDE)
	(DESC "Prospekt")
	(FLAGS READBIT TAKEBIT BURNBIT DERBIT)
	(FDESC
"Einige Prospekte mit dem Titel: Hochwasserschutzdamm No.3 liegen bei der Rezepzion.") 
	;(TEXT
"%>	Flood Control Dam #3|
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
on your right that....%<" )
	(TEXT 
"%>    Hochwasserschutzdamm No.3|
|
Hochwasserschutzdamm No.3 wurde im Jahr 783 des Gro%sen Untergrund
Reiches errichtet, um den Gletschflu%s zu b%andigen. Diese Arbeit wurde
von einem Zuschu%s im Betrag von 37 Millionen Zorkkneten von eurem
allmaechtigen lokalen Tyranen F%urst Kleingeist Flachkopf dem
%Au%sersten unterstuetzt. Diese eindrucksvolle Baustelle besteht aus
115.000 Kubikmetern von Zement, ist in der Mitte 86 Meter hoch und 64
Meter Breit an der Spitze. Der See, der hinter dem Damm gemacht wurde,
hat ein Volumen von 0,65  Milliarden Kubikmetern, eine Fl%ache von 4
Millionen Quadratmetern und eine K%ustenlinie von 12 Tausend Metern.|
|
Der Bau des Hochwasserschutzdammes No.3 hat 112 Tage vom Anfang der
Bauarbeiten bis zu seiner Einweihung gedauert. Gebraucht wurde eine
Arbeitsmannschaft von 384 Sklaven, 34 Sklavenhaltern, 12 Ingenieuren, 2
Friedenstauben und einer au%sergew%ohnlichen Weihnachtsgans. Die Arbeit
wurde %ubersehen von einer kommandierenden Mannschaft von 2345
B%urokraten, 2347 Sekret%aren und Sekret%arinnen (mindestens zwei davon
konnten tippen), 12.256 Leuten, die sich mit Papieren besch%aftigten,
52.469 Stempelexperten, 245.193 Leuten, die sich mit der l%acherlichen
B%urokratie auskannten und fast einer Million von toten B%aumen.|
|
Jetzt wollen wir einige der au%sergew%ohnlichen Merkmale des
Schutzdammes No.3 vorf%uhren, indem wir eine F%uhrung durch das Projekt
machen:|
|
1) Du beginnst die F%uhrung hier in der Vorhalle des Damms. Du wirst auf
der rechten Seite feststellen, da%s...")>

<OBJECT TROLL
	(LOC TROLL-ROOM)
	(SYNONYM TROLL)
	(ADJECTIVE WIDERLICHE)
	(DESC "Troll")
	(FLAGS ACTORBIT OPENBIT TRYTAKEBIT DERBIT)
	(ACTION TROLL-FCN)
	(LDESC
"Ein widerlicher Troll, der eine blutige Axt schwingt, blockiert alle Ausg%ange aus dem Zimmer.")
	(STRENGTH 2)>

<OBJECT TRUNK
	(LOC RESERVOIR)
	(SYNONYM JUWELENKOFFER KOFFER JUWELEN JUWELE SCHATZ)
	(ADJECTIVE ALTE ALTEN)
	(DESC "Juwelenkoffer")
	(FLAGS TAKEBIT INVISIBLE DERBIT)
	(FDESC
"Halbvergraben im Schlamm ist ein alter Koffer, vollgepfropft mit Juwelen.")
	(LDESC
"Es gibt hier einen alten Koffer, der mit allen m%oglichen Juwelen voll
gepfropft ist.")
	(ACTION TRUNK-F)
	(SIZE 35)
	(VALUE 15)
	(TVALUE 5)>

<OBJECT TUBE
	(LOC MAINTENANCE-ROOM)
	(SYNONYM TUBE ZAHNPASTATUBE)
	(DESC "Tube")
	(FLAGS TAKEBIT CONTBIT READBIT DIEBIT)
	(ACTION TUBE-FUNCTION)
	(LDESC
"Es gibt hier ein Ding, das aussieht wie eine Zahnpastatube.")
	(CAPACITY 7)
	(SIZE 5)
	;(TEXT
"---> Frobozz Magic Gunk Company <---|
	  All-Purpose Gunk")
	(TEXT
"   ---> Frobozz <---|
Zauberschmiere Gesellschaft|
|
   Eine Allzweckschmiere")>

<OBJECT PUTTY
	(LOC TUBE)
	(SYNONYM SCHMIERZEUG ZEUG)
	;(ADJECTIVE VISCOUS)
	(DESC "Schmierzeug")
	(FLAGS TAKEBIT TOOLBIT DASBIT)
	(SIZE 6)
	(ACTION PUTTY-FCN)>

<OBJECT ENGRAVINGS
	(LOC ENGRAVINGS-CAVE)
	(SYNONYM WAND W\%ANDEN WAENDEN EINMEISSELUNGEN EINMEI\%SELLUNGEN)
	(ADJECTIVE ALTE ALTEN)
	(DESC "Einmei%selung")
	(FLAGS READBIT SACREDBIT DIEBIT)
	(LDESC "Dort gibt es alte Einmei%selungen an den W%anden.")
	;(TEXT
"The engravings were incised in the living rock of the cave wall by
an unknown hand. They depict, in symbolic form, the beliefs of the
ancient Zorkers. Skillfully interwoven with the bas reliefs are excerpts
illustrating the major religious tenets of that time. Unfortunately, a
later age seems to have considered them blasphemous and just as skillfully
excised them.")
	(TEXT
"Die Gravierungen waren in den lebenden Stein der H%ohlenwand von einer
unbekannten Hand eingehauen. Sie stellen in einer symbolischen Form den
Glauben der uralten Zorker dar. Kuensterisch eingewoben mit den
fundamentalen Gravierungen findet man Auszuege, die die religi%osen
Glaubenss%atze der Zeit illustrieren. Leider hat eine sp%atere Zeit
diese Markierungen als frevelhaft bezeichnet und hat sie in kluger Form
entfernt.")>

<OBJECT OWNERS-MANUAL
	(LOC STUDIO)
	(SYNONYM ;MANUAL PAPIER)
	(ADJECTIVE ZORK ZORK-ANLEITUNG STUECK ST\%UCK KLEINE KLEINEN ANLEITUNG)
	(DESC "ZORK-Anleitung")
	(FLAGS READBIT TAKEBIT DIEBIT)
	(FDESC "Lose an der Wand h%angt ein kleines St%uck Papier.")
	(TEXT
"Herzlichen Gl%uckwunsch!|
|
Du bist der priveligierte Besitzer von ZORK I: Das Gro%se Unterirdische Imperium, ein unabh%angiges selbstversorgendes Universum Wenn es gem%a%s den Operationsregeln f%ur kleine Universe benutzt und erhalten wird, dann wird ZORK auch viele Monate problemlos operieren.")>

<OBJECT CLIMBABLE-CLIFF
	(LOC LOCAL-GLOBALS)
	(SYNONYM FELSEN FELS FELSW\%ANDE FELSWAENDE FELSWAND VORSPRUNG)
	(ADJECTIVE STEINIGEN STEINIGE ABRUPTE ABRUPTEN)
	(DESC "Fels")
	(ACTION CLIFF-OBJECT)
	(FLAGS NDESCBIT CLIMBBIT DERBIT)>

<OBJECT WHITE-CLIFF
	(SYNONYM FELS FELSEN KLIPPEN KLIPPE) 
	(ADJECTIVE WEISSE WEISSEN WEI\%SE WEI\%SEN)
	(ADJDESC "wei%s")
	(DESC "Fels") ;"Felsen is plural"
	(FLAGS NDESCBIT CLIMBBIT DERBIT)
	(ACTION WCLIF-OBJECT)>

<OBJECT WRENCH
	(LOC MAINTENANCE-ROOM)
	(SYNONYM SCHRAUBEN ;-SCHL\%USSEL SCHL\%USSEL SCHLUESSEL)
	(ADJECTIVE SCHRAUBEN)
	(DESC "Schraubenschl%ussel")
	(FLAGS TAKEBIT TOOLBIT DERBIT)
	(SIZE 10)>

<OBJECT CONTROL-PANEL
	(LOC DAM-ROOM)
	(SYNONYM TAFEL SCHALTTAFEL)
	;(ADJECTIVE CONTROL)
	(DESC "Schalttafel")
	(FLAGS NDESCBIT DIEBIT)>

<OBJECT NEST
	(LOC UP-A-TREE)
	(SYNONYM VOGELNEST NEST)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Vogelnest")
	(FLAGS TAKEBIT BURNBIT CONTBIT OPENBIT SEARCHBIT DASBIT)
	(FDESC "Neben dir auf dem Ast ist ein kleines Vogelnest.")
	(CAPACITY 20)>

<OBJECT EGG
	(LOC NEST)
	(SYNONYM EI SCHATZ)
	(ADJECTIVE JEWELENBESETZT)
	(DESC "Ei")
	(ADJDESC "juwelenbesetzt")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT DASBIT)
	(ACTION EGG-OBJECT)
	(VALUE 5)
	(TVALUE 5)
	(CAPACITY 6)
	(FDESC
"In dem Vogelnest ist ein gro%ses mit kostbaren Juwelen besetztes Ei, das scheinbar von einem kinderlosen Singvogel geraubt wurde. Das Ei ist von einer feinen Goldschicht %uberzogen und mit Lapislazuli und Perlmutter geschm%uckt. Im Gegensatz zu einem gew%ohnlichen Ei, hat dieses ein Scharnier und ist mit einem eleganten Verschlu%s versehen. Das Ei sieht sehr zerbrechlich aus.")>

<OBJECT BROKEN-EGG
	(SYNONYM EI SCHATZ)
	(ADJECTIVE ZERBROCHE JEWELENBESETZT)
	(DESC "Ei")
	(ADJDESC "zerbrochen")
	(FLAGS TAKEBIT CONTBIT OPENBIT DASBIT)
	(CAPACITY 6)
	(TVALUE 2)
	;(LDESC "There is a somewhat ruined egg here.")>

<OBJECT BAUBLE
	(SYNONYM SCHATZ FLITTERKUGEL KUGEL)
	(ADJECTIVE GOLDENE GOLDENEN)
	(ADJDESC "sch%on")
	(DESC "Flitterkugel")
	(FLAGS TAKEBIT DIEBIT)
	(VALUE 1)
	(TVALUE 1)>

<OBJECT CANARY
	(LOC EGG)
	(SYNONYM KANARIENVOGEL KANARIE VOGEL SCHATZ AUFZIEHEN)
	(ADJECTIVE ;CLOCKWORK GOLDENE GOLDENEN)
	(ADJDESC "golden")
	(DESC "Kanarienvogel")
	(FLAGS TAKEBIT SEARCHBIT DERBIT)
	(ACTION CANARY-OBJECT)
	(VALUE 6)
	(TVALUE 4)
	(FDESC
"Ein goldener Kanarienvogel zum Aufziehen ist in dem Ei. Er hat rubinrote Augen und einen silbernen Schnabel. Durch das Kristallfenster unter seinem linken Fl%ugel kannst du den komplizierten Mechanismus in seinem K%orper sehen. Er scheint, abgelaufen zu sein. Hier ist auch ein Silberkelch mit feinen Gravierungen.")>
 
<OBJECT BROKEN-CANARY
	(LOC BROKEN-EGG)
	(SYNONYM KANARIENVOGEL VOGEL SCHATZ)
	(ADJECTIVE ZERBROCHE AUFZIEHBARER GOLDENE GOLDENEN)
	(DESC "Kanarienvogel")
	(ADJDESC "zerbrochen")
	(FLAGS TAKEBIT DERBIT)
	(ACTION CANARY-OBJECT)
	(TVALUE 1)
	(FDESC
"Eingebettet in dem Ei ist ein goldener aufziehbarer Kanarienvogel. Er mu%s vor Kurzem etwas Schreckliches durchgemacht haben. Die H%ohlen f%uer seine jewelen%ahnlichen Augen sind leer und silberner Schnabel ist verbogen. Durch ein gesprungenes Kristallfenster unter seinem linken Fl%uegel kannst du die Reste eines genialen Uhrwerks sehen. Es ist jetzt sonnenklar, da%s das Aufziehen sinnlos w%are, denn die Hauptfeder scheint gesprungen zu sein.")>

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
"Du stehst vor einem enormen steinen H%ugelgrab. Auf der Ostseite ist eine riesige Steint%ur, die ge%offnet ist. Du kannst nicht in die Dunkelheit von dem Grab hineingucken.")
      (DESC "H%ugelgrab")
      (NO TO WEST-OF-HOUSE)
      (ACTION STONE-BARROW-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)>

<ROOM NORTH-OF-HOUSE
      (LOC ROOMS)
      (DESC "N%ordlich vom Haus")
      (LDESC
"Du stehst vor der Nordseite eines wei%sen Hauses. Es gibt hier keine T%ur, und alle Fenster sind mit Brettern vernagelt. Nach Norden windet sich ein schmaler Pfad durch die B%aume.")
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
"Du stehst auf der S%udseite des wei%sen Hauses. Es gibt hier keine T%ur, und alle Fenster sind vernagelt.")
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
      (DESC "Hinter dem Haus")
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
      (DESC "Wald")
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
      (LDESC "Dies ist ein d%usterer Wald mit gro%sen B%aumen rundherum.")
      (DESC "Wald")
      ;"Neben dir auf dem Ast ist ein kleines Vogelnest."
      (RAUF SORRY "Es gibt hier keinen Baum, den man erklettern kann.")
      (NORD SORRY "Nach Norden wird der Wald undurchdringlich.")
      (OST TO MOUNTAINS)
      (SUED TO CLEARING)
      (WEST TO PATH)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM MOUNTAINS
      (LOC ROOMS)
      (LDESC "Der Wald lichtet sich und un%uberwindliche Berge kommen zum
Vorschein.")
      (DESC "Wald")
      (RAUF SORRY "Die Berge sind nicht un%uberwindlich.")
      (NORD TO FOREST-2)
      (OST SORRY "Die Berge sind nicht un%uberwindlich.")
      (SUED TO FOREST-2)
      (WEST TO FOREST-2)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3
      (LOC ROOMS)
      (LDESC "Der Wald lichtet sich und un%uberwindliche Berge kommen zum
Vorschein.")
      (DESC "Wald")
      (RAUF SORRY "Es gibt hier keinen Baum, den man erklettern kann.")
      (NORD TO CLEARING)
      (OST SORRY "Undurchdringliches Unterholz versperrt den Weg nach Osten.")
      (SUED SORRY "Der Weg ist von umgeblasenen B%aumen blockiert.")
      (WEST TO FOREST-1)
      (NW TO SOUTH-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM PATH
      (LOC ROOMS)
      (LDESC
"Dieser Pfad windet sich durch den d%usteren Wald. Er verl%auft von Norden nach S%uden. Ein besonders gro%ser Baum mit einigen niederen %Asten steht am Rande des Pfades.")
      (DESC "Waldpfad")
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
      (DESC "Oben auf dem Baum") 
      (RUNTER TO PATH)
      (RAUF SORRY "H%oher kannst du nicht.")
      (ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE FOREST SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (LOC ROOMS)
      (DESC "Lichtung")
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
		       <TELL "Das Gitter ist geschlossen." CR>
		       <THIS-IS-IT ,GRATE>
		       <RFALSE>)>)
	       (T <TELL "In die Richtung kannst du nicht gehen." CR>
		  <RFALSE>)>>

<ROUTINE TREASURE-INSIDE ()
	 <COND (<VERB? OPEN>
		<SCORE-OBJ ,EMERALD>
		<RFALSE>)>>

<ROOM CLEARING
      (LOC ROOMS)
      (LDESC
"Du stehst auf einer kleinen Lichtung auf einem wohlmarkierten Waldpfad, der sich nach Osten und Westen erstreckt.")
      (DESC "Lichtung")
      (RAUF SORRY "Es gibt hier keinen Baum, den man erklettern kann.")
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
      (WEST TO STRANGE-PASSAGE IF MAGIC-FLAG ELSE "Die T%ur ist vernagelt.")
      (RUNTER PER TRAP-DOOR-EXIT)
      (ACTION LIVING-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL STAIRS)
      ;(PSEUDO "NAILS" NAILS-PSEUDO "NAIL" NAILS-PSEUDO)>

<OBJECT NAILS
	(LOC LIVING-ROOM)
	(SYNONYM NAGEL NAEGEL N\%AGEL)
	(DESC "Nagel")
	(FLAGS NDESCBIT DERBIT)
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
      (DESC "Trollzimmer")
      (SUED TO CELLAR)
      (OST TO EW-PASSAGE
       IF TROLL-FLAG ELSE
"Der Troll schreckt dich mit einer drohenden Geste zur%uck.")
      (WEST TO MAZE-1
       IF TROLL-FLAG ELSE
"Der Troll schreckt dich mit einer drohenden Geste zur%uck.")
      (FLAGS RLANDBIT)
      (ACTION TROLL-ROOM-F)>

<ROOM EAST-OF-CHASM
      (LOC ROOMS)
      (LDESC
"Du bist am %ostlichen Rand einer Spalte, deren Grund nicht zu sehen ist. Ein enger Durchgang geht nach Norden, und der Pfad, auf dem du bist, f%uhrt nach Osten weiter.")
      (DESC ;"East of Chasm" "Ost von der Spalte")
      (NORD TO CELLAR)
      (OST TO GALLERY)
      (RUNTER SORRY 
"Die Spalte f%uhrt wahrscheinlich direkt zur H%olle.")
      (FLAGS RLANDBIT)
      (GLOBAL CHASM)
      ;(PSEUDO "CHASM" CHASM-PSEUDO)>

<OBJECT CHASM
	(LOC LOCAL-GLOBALS)
	(SYNONYM SPALT SPALTE)
	(DESC "Spalte")
	(FLAGS NDESCBIT DIEBIT)
	(ACTION CHASM-PSEUDO)>

<ROOM GALLERY
      (LOC ROOMS)
      (LDESC
"Dies ist eine Kunstgalerie. Die meisten Gem%alde sind von Gangstern mit au%sergew%ohnlich gutem Geschmack gestohlen worden. Die Gangster sind entweder durch den Nord -oder den Westausgang abgehauen.")
      (DESC "Galerie")
      (WEST TO EAST-OF-CHASM)
      (NORD TO STUDIO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STUDIO
      (LOC ROOMS)
      (LDESC
"Dies scheint, ein K%unstleratelier gewesen zu sein. Die W%ande und Fu%sb%oden sind mit Spritzern von 69 verschiedenen Farben bekleckst. Seltsamererweise h%angt hier nichts Wertvolles. Am s%udlichen Ende des Zimmers ist eine offene T%ur (auch mit Farbe bekleckst). Ein dunkler und schmaler Schornstein f%uhrt vom Kamin hinauf. Es w%are wahrscheinlich einfach f%ur dich, dort hinaufzuklettern, aber die Chancen, da%s du wieder runterkommst, sind gering.")
      (DESC "Atelier")
      (SUED TO GALLERY)
      (RAUF PER UP-CHIMNEY-FUNCTION)
      (FLAGS RLANDBIT)
      (GLOBAL CHIMNEY)
      ;(PSEUDO "DOOR" DOOR-PSEUDO "PAINT" PAINT-PSEUDO)>

<OBJECT DOOR-P
	(LOC STUDIO)
	(SYNONYM TUER T\%UR)
	(DESC "T%ur")
	(FLAGS NDESCBIT DIEBIT)
	(ACTION DOOR-PSEUDO)>

<OBJECT PAINT
	(LOC STUDIO)
	(SYNONYM PAINT)
	(DESC "Farbe")
	(FLAGS NDESCBIT DIEBIT)
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
      (DESC "Sackgasse")
      (LDESC "Du bist an eine Sackgasse in dem Irrgarten gekommen.")
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
      (DESC "Sackgasse")
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
      (DESC "Sackgasse")
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
      (DESC "Gitterzimmer")
      (SW TO MAZE-11)
      (RAUF TO GRATING-CLEARING
       IF GRATE IS OPEN ELSE "Das Gitter ist geschlossen.")
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
       IF MAGIC-FLAG ELSE
       "Die Ostwand ist aus undurchdringlichem Felsen.")
      (RAUF TO TREASURE-ROOM IF CYCLOPS-FLAG
        ELSE
"Der Zyklop macht den Eindruck, als ob er dich nicht durchlassen wollte.")
      (ACTION CYCLOPS-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM STRANGE-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein langer Durchgang. Nach Westen ist ein Eingang. Nach Osten gibt es eine h%olzerne T%ur mit einer gro%sen %Offnung darin (ungef%ahr in der Form eines Zyklopen).")
      (DESC "Eigent%umlicher Durchgang")
      (WEST TO CYCLOPS-ROOM)
      (HINEIN TO CYCLOPS-ROOM)
      (OST TO LIVING-ROOM)
      (FLAGS RLANDBIT)>

<ROOM TREASURE-ROOM
      (LOC ROOMS)
      (LDESC
"Dies ist ein gro%ser Raum, dessen Ostwaand aus Granit ist. Eine Menge weggeworfener T%uten, die bei der kleinsten Ber%uhrung zerfallen, sind auf dem Fu%sboden verstreut.")
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
       IF LOW-TIDE ELSE "Du w%urdest ertrinken.")  
      (ACTION RESERVOIR-SOUTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER CHASM LAKE)
      ;(PSEUDO "LAKE" LAKE-PSEUDO "CHASM" CHASM-PSEUDO)>

<OBJECT LAKE
	(LOC LOCAL-GLOBALS)
	(SYNONYM SEE)
	(DESC "See")
	(FLAGS NDESCBIT DERBIT)
	(ACTION LAKE-PSEUDO)>

<ROOM RESERVOIR
      (LOC ROOMS)
      (DESC "Reservoir Nord")
      (NORD TO RESERVOIR-NORTH)
      (SUED TO RESERVOIR-SOUTH)
      (RAUF TO IN-STREAM)
      (WEST TO IN-STREAM)
      (RUNTER SORRY "Der Damm blockiert dein Weg.")
      (ACTION RESERVOIR-FCN)
      (FLAGS NONLANDBIT)
      ;(PSEUDO "STREAM" STREAM-PSEUDO)
      (GLOBAL GLOBAL-WATER STREAM)>

<OBJECT STREAM
	(LOC LOCAL-GLOBALS)
	(SYNONYM FLUSS)
	(ADJECTIVE KLEINE KLEINEN)
	(DESC "Flu%s")
	(ADJDESC "klein")
	(FLAGS NDESCBIT DERBIT)
	(ACTION STREAM-PSEUDO)>

<ROOM RESERVOIR-NORTH
      (LOC ROOMS)
      (DESC "Reservoir Nord")
      (NORD TO ATLANTIS-ROOM)
      (SUED TO RESERVOIR
       IF LOW-TIDE ELSE "Du wuerdest ertrinken.") 
      (ACTION RESERVOIR-NORTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STAIRS LAKE)
      ;(PSEUDO "LAKE" LAKE-PSEUDO)>

<ROOM STREAM-VIEW
      (LOC ROOMS)
      (LDESC
"Du stehst auf einem Pfad bei einem pl%atschernden Bach. Der Pfad folgt dem Bach, der von Westen nach Osten flie%st.")
      (DESC "Blick auf den Bach")
      (OST TO RESERVOIR-SOUTH)
      (WEST SORRY
"Der kleine Fluss kommt aus einem Ort, der fuer dich zu eng zum Eintreten
ist.")
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STREAM)
      ;(PSEUDO "STREAM" STREAM-PSEUDO)>

<ROOM IN-STREAM
      (LOC ROOMS)
      (LDESC
"Du bist auf einem pl%atschernden Flu%s. Der Weg flu%saufw%arts ist zu eng, und die Flu%sabw%artsroute ist nicht %ubersehbar, denn die Felsw%ande stehen im Weg. Es gibt hier einen schmalen Strand zur Landung.")
      (DESC "Der Kleiner Flu%s")
      (RAUF SORRY "Der Flu%skanal ist zu eng.")
      (WEST SORRY "Der Flu%skanal ist zu eng.")
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
      (DESC "Spiegelzimmer")
      (WEST TO WINDING-PASSAGE)
      (NORD TO NARROW-PASSAGE)
      (OST TO TINY-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SMALL-CAVE
      (LOC ROOMS)
      (LDESC
"Dies ist eine winzige H%ohle mit Eing%angen im Westen und Osten und eine Treppe nach unten.")
      (DESC "H%ohle")
      (NORD TO MIRROR-ROOM-1)
      (RUNTER TO ATLANTIS-ROOM)
      (SUED TO ATLANTIS-ROOM)
      (WEST TO TWISTING-PASSAGE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM TINY-CAVE
      (LOC ROOMS)
      (LDESC
"Dies ist eine winzige H%ohle mit Eing%angen im Westen und Osten und eine angsterregende Treppe nach unten.")
      (DESC "H%ohle")
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
      (DESC "Enger Gang")
      (NORD TO ROUND-ROOM)
      (SUED TO MIRROR-ROOM-2)
      (FLAGS RLANDBIT)>

<ROOM WINDING-PASSAGE
      (LOC ROOMS)
      (LDESC
"Dies ist ein sich windender Durchgang. Es scheint, als ob es nur Ausg%ange nach Osten und Norden gibt.")
      (DESC "Windender Durchgang")
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
      (DESC "Ost-Westdurchgang")
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
"Dies ist ein rundes turmartiges Zimmer mit Durchg%angen in alleRichtungen. Einige sind leider durch Einsturz blockiert.")
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
      (DESC "Feuchte H%ohle")
      (WEST TO LOUD-ROOM)
      (OST TO WHITE-CLIFFS-NORTH)
      (SUED SORRY "Da w%uerde nicht einmal eine Fliege hindurchkommen.")
      (FLAGS RLANDBIT)
      (GLOBAL CRACK)>

<ROOM LOUD-ROOM
      (LOC ROOMS)
      (DESC "Laute Zimmer")
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
      (RUNTER SORRY "Bist du verr%uckt geworden?")
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
	(SYNONYM TOR TORES TORE)
	(DESC "Tor")
	(FLAGS NDESCBIT DASBIT)
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
      (DESC "H%ohle mit Einmei%selungen")
      (NW TO ROUND-ROOM)
      (OST TO DOME-ROOM)
      (FLAGS RLANDBIT)>

<ROOM EGYPT-ROOM	
      (LOC ROOMS)
      (LDESC
"Dieser Raum sieht aus wie ein %agyptisches Grab. Im Westen ist eine Treppe nach oben.") 
      (DESC "%Agyptisches Zimmer")  
      (WEST TO NORTH-TEMPLE)
      (RAUF TO NORTH-TEMPLE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM DOME-ROOM	
      (LOC ROOMS)
      (DESC "Kuppelzimmer")
      (WEST TO ENGRAVINGS-CAVE)
      (RUNTER TO TORCH-ROOM
       IF DOME-FLAG ELSE
"Hier kannst du ohne schwere Knochenbr%uche nicht runter.")
      (ACTION DOME-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL DOME)
      ;(PSEUDO "DOME" DOME-PSEUDO)>

<OBJECT DOME
	(LOC LOCAL-GLOBALS)
	(SYNONYM KUPPEL)
	(DESC "Kuppel")
	(FLAGS NDESCBIT DIEBIT)
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
"Dies ist das Nordende eines gro%sen Tempels. Auf der Ostwand siehst du eine antike Inschrift, die wahrscheinlich ein Gebet in einer l%angst vergessenen Sprache ist. Unter dem Gebet f%uhrt ein Treppenhaus nach unten. Die Westwand ist aus Granit. Der Ausgang im Norden des Raumes f%uhrt durch riesige Marmors%aulen.
Es befindet sich hier eine Messingglocke.")
      (DESC "Tempel")
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
"Dies ist das S%udende eines gro%sen Tempels. Vor dir ist eine Art Altar. In einer Ecke ist ein kleines Loch im Boden, das in absolute Dunkelheit f%uhrt. 
Es sieht nicht so aus, als ob du da je wieder rausk%amst.
Auf beiden Seiten des Altars stehen brennende Kerzen.
Auf dem Altar liegt ein gro%ses schwarzes Buch. Es ist bei Seite 569 aufgeschlagen.")
      (DESC "Altar")
      (NORD TO NORTH-TEMPLE)
      (RUNTER TO TINY-CAVE
       IF COFFIN-CURE
       ELSE
"Den Sarg da hinunter zu bringen %ubersteigt deine menschlichen Kr%afte. Dazu brauchst Du die Hilfe Gottes.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (ACTION SOUTH-TEMPLE-FCN)>

"SUBTITLE FLOOD CONTROL DAM #3"

<ROOM DAM-ROOM	
      (LOC ROOMS)
      (DESC "Damm")
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
Es gibt hier offene T%uren, die nach Norden und Osten f%uhren. Sie haben die Aufschrift %>Privat%<, und ein Pfad f%uhrt nach S%uden %uber den oberen Damm.")
      (DESC "Eingangshalle zum Damm")
      (SUED TO DAM-ROOM)
      (NORD TO MAINTENANCE-ROOM)
      (OST TO MAINTENANCE-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MAINTENANCE-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies mu%s der Wartungsraum f%ur den Hochwasserschutzdamm No.3 gewesen sein.
Scheinbar ist dieser Raum vor Kurzem gepl%undert worden, denn die meisten wertvollen Ger%ate sind weg. An der Wand vor dir h%angen bla%ue, gelbe, braune und rote Kn%opfe. T%uren f%uhren nach Westen und S%uden.")
      (DESC "Wartungsraum")
      (SUED TO DAM-LOBBY)
      (WEST TO DAM-LOBBY)
      (FLAGS RLANDBIT)>


"SUBTITLE RIVER AREA"

<ROOM DAM-BASE	
      (LOC ROOMS)
      (LDESC
"Du bist am Fu%s des Hochwasserkontrolldammes No. 3, der %uber dir und nach Norden hin aufragt. Der Flu%s Gletsch flie%st hier vorbei. Den Flu%s entlang t%urmen sich die Wei%sen Felsen, die sich flu%sabw%arts wie eine gigantische Wand von Norden nach S%uden erstrecken.")
      (DESC "Am Fu%s des Dammes")
      (NORD TO DAM-ROOM)
      (RAUF TO DAM-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-1	
      (LOC ROOMS)
      (LDESC
"Du bist auf dem Gletsch bei dem Damm. Der Flu%s flie%st ruhig hier. Es gibt einen Landungssteg am Westufer.")
      (DESC "Flu%s Gletsch")
      (RAUF SORRY "Du kannst hier nicht flu%saufw%arts, denn die Str%omung ist zu stark.")
      (WEST TO DAM-BASE)
      (LANDEN TO DAM-BASE)
      (RUNTER TO RIVER-2)
      (OST SORRY "Die Wei%senfelsen verhindern das Anlegen.")
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-2	
      (LOC ROOMS)
      (LDESC
"Der Flu%s flie%st hier um eine Biegung, die es unm%oglich macht, den Damm zu sehen. Die Wei%sen Felsen ragen %uber dem Ostufer auf und gro%se Steine verhindern die Landung am Westufer.")
      (DESC "Frigid River")
      (RAUF SORRY "Du kannst hier nicht flu%saufw%arts, denn die Str%omung ist zu stark.")
      (RUNTER TO RIVER-3)
      (LANDEN SORRY "Hier kann man nicht sicher anlegen.")
      (OST SORRY "Die Wei%senfelsen verhindern das Anlegen.")
      (WEST SORRY "Gerade noch rechtzeitig steuerst du von den Felsen weg.")
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-3	
      (LOC ROOMS)
      (LDESC
"Der Flu%s flie%st hier in ein Tal hinab. Es gibt einen schmalen Strand an der Westk%uste unter den Felsen. In der Ferne kann man ein schwaches Grollen h%oren.")
      (DESC "Flu%s Gletsch")
      (RAUF SORRY
 "Du kannst hier nicht flu%saufw%arts, denn die Str%omung ist zu stark.")
      (RUNTER TO RIVER-4)
      (LANDEN TO WHITE-CLIFFS-NORTH)
      (WEST TO WHITE-CLIFFS-NORTH)
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM WHITE-CLIFFS-NORTH	
      (LOC ROOMS)
      (LDESC
"Du bist an einem schmalen Strand, der am Fu%se der Wei%sen Felsen entlangl%auft. Es gibt hier einen schmalen Pfad, der entlang der Felsen nach S%uden l%auft und einen engen Durchgang, der nach West mitten in die Klippen hineinf%uhrt.")
      (DESC "Wei%se Felsen Strand")
      (SUED TO WHITE-CLIFFS-SOUTH IF DEFLATE ELSE ;"The path is too narrow."
       "Der Pfad ist zu eng.") 
      (WEST TO DAMP-CAVE IF DEFLATE ELSE ;"The path is too narrow."
       "Der Pfad ist zu eng.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM WHITE-CLIFFS-SOUTH	
      (LOC ROOMS)
      (LDESC
"Du bist auf einem steinigen, engen Strandstreifen neben den Felsen. Ein enger Pfad f%uhrt am Ufer entland nach Norden.")
      (DESC "Wei%se Felsen Strand")
      (NORD TO WHITE-CLIFFS-NORTH
       IF DEFLATE ELSE "Der Pfad ist zu eng.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM RIVER-4	
      (LOC ROOMS)
      (LDESC
"Der Flu%s str%omt hier st%arker, und das Ger%ausch vor dir scheint, das von brausendem Wasser zu sein. An dem Ostufer ist ein Sandstrand. Ein bi%schen Strand lugt auch unter den Felsen an dem Westufer hervor.")
      (DESC "Flu%s Gletsch")
      (RAUF SORRY 
"Du kannst hier nicht flu%saufw%arts, denn die Str%omung ist zu stark.")
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
"Das Ger%ausch von brausendem Wasser ist hier fast unertr%aglich. Auf der Ostk%uste gibt es einen gro%sen Anlegeplatz.")
      (DESC "Flu%s Gletsch")
      (RAUF SORRY
 "Du kannst hier nicht flu%saufw%arts, denn die Str%omung ist zu stark.")
      (OST TO SHORE)
      (LANDEN TO SHORE)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SHORE	
      (LOC ROOMS)
      (LDESC
"Du bist an dem Ostufer des Flu%ses. Das Wasser ist hier etwas gef%ahrlich. Ein Pfad f%uhrt von Norden nach S%uden, das S%udende biegt schnell um eine scharfe Kurve.")
      (DESC "Ufer")
      (NORD TO SANDY-BEACH)
      (SUED TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-BEACH	
      (LOC ROOMS)
      (LDESC
"Du bist an einem gro%sen Sandstrand am Ostufer des Flu%ses. Dieser flie%st schnell vorbei. Ein Pfad verl%auft den Flu%s entlang nach S%uden hier und ein Durchgang ist halb im Sand nach Nordosten vergraben.")
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
      (DESC "Wiedermal F%alle")
      (WEST TO ON-RAINBOW IF RAINBOW-FLAG)
      (RUNTER SORRY "Das ist ein t%odlicher Weg.")  
      (NORD TO SHORE)
      (RAUF TO ON-RAINBOW IF RAINBOW-FLAG)
      (ACTION FALLS-ROOM)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER RAINBOW)>

<ROOM ON-RAINBOW	
      (LOC ROOMS)
      (LDESC
"Du bist auf dem Regenbogen (sicherlich hast du dir nie tr%aumen lassen, da%s du jemals auf einem Regenbogen laufen w%urdest). Du hast einen tollen Blick auf die F%alle. Der Regenbogen verl%auft von Osten nach Westen.")
      (DESC "Auf dem Regenbogen")
      (WEST TO END-OF-RAINBOW)
      (OST TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL RAINBOW)>

<ROOM END-OF-RAINBOW	
      (LOC ROOMS)
      (LDESC
"Du bist am unteren Gletsch hinter den Wasserf%allen an einem schmalen steinigen Ufer. Das Ufer ist wegen der Wei%sen Felsen schmal. Die Flu%schlucht %offnet sich hier, und Sonnenstrahlen fallen von oben herein. Ein Regenbogen weist %uber die F%alle nach Osten, und ein schmaller Pfad f%uhrt weiter nach S%udwesten.")
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
"Du bist unter den W%anden der Flu%schlucht, die hier eher zu erklettern sind. Der geringere Teil des Ablaufs der Wiedermal F%alle flie%st unter dir vorbei. Nach Norden f%uhrt ein schmaler Pfad.")
      (DESC "Auf dem Grund der Schlucht")
      (RAUF TO CLIFF-MIDDLE)
      (NORD TO END-OF-RAINBOW)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER CLIMBABLE-CLIFF RIVER)>

<ROOM CLIFF-MIDDLE	
      (LOC ROOMS)
      (LDESC
"Du bist auf einem Vorsprung, der ungef%ahr auf halber H%ohe auf der Wand der Flu%schlucht liegt. Du kannst von hier sehen, da%s der gr%o%ste Teil der Wiedermal F%alle sich durch einen Durchgang windet, den du nicht passieren kannst. Unter dir ist der Abgrund %Uber dir gibt es weitereFelsen, die erklimmbar scheinen.")
      (DESC "Felsvorsprung")
      (RAUF TO CANYON-VIEW)
      (RUNTER TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER)>

<ROOM CANYON-VIEW	
      (LOC ROOMS)
      (LDESC
"Du bist am oberen Rand der Gro%s-Schlucht, auf dem Gipfel der Westwand. Von hier hat man einen wunderbaren Blick auf die Schlucht und flu%saufw%arts auf den Flu%s Gletsch. Gegen%uber der Schlucht schlie%sen die Wei%sen Felsen dem Gipfel der Hohlkopfberge nach Osten hin an. Verfolgt man die Schlucht flu%saufw%arts nach Norden, dann kann man die Wiedermal F%alle, aus denen ein Regenbogen heraufsteigt, sehen. Der m%achtige Flu%s Gletsch flie%st aus einer gro%sen dunklen H%ohle. Nach Westen und S%uden kann man einen enormen Wald sehen, der sich auf Kilometer hinzieht. Ein Pfad f%uhrt nach Nordwesten. Es ist m%oglich, von hier in die Schlucht hinunterzuklettern.")
      (DESC "Blick auf Schlucht")
      (OST TO CLIFF-MIDDLE)
      (RUNTER TO CLIFF-MIDDLE)
      (NW TO CLEARING)
      (WEST TO FOREST-3)
      (SUED SORRY "Der Weg ist von umgeblasenen B%aumen blockiert.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER RAINBOW)
      (ACTION CANYON-VIEW-F)>

<ROUTINE CANYON-VIEW-F (RARG)
	 <COND (<AND <==? .RARG ,M-BEG>
		     <VERB? LEAP>
		     <NOT ,PRSO>>
		<JIGS-UP 
"Das war nicht der sicherste Platz f%ur den Absprung.">
		<RTRUE>)>>
	       

"SUBTITLE COAL MINE AREA"

<ROOM MINE-ENTRANCE	
      (LOC ROOMS)
      (LDESC
"Du stehst an einem Eingang. Er sieht aus wie ein ehemaliger Grubeneingang. Der Schacht f%uhrt in die Westwand, und es gibt dort noch einen Ausgang am S%udende des Raumes.")
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
"Dies ist ein gro%ser Raum, in dessen Mitte sich ein kleiner durch den Fu%sboden nach unten in die Dunkelheit verlaufender Schaft ist. Nach Westen und Norden gibt es Ausg%ange von diesem Zimmer. %Uber dem Schacht hat man ein Metalgeh%ause gebaut, an dem eine schwere eiserne Kette befestigt ist. An dem anderen Ende der Kette h%angt ein Korb.")
      (DESC "Schachtzimmer")
      (RUNTER SORRY 
"Da passt du nicht rein und w%urdest sterben, wenn du k%onntest.") 
      (WEST TO BAT-ROOM)
      (NORD TO SMELLY-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL CHAIN)
      ;(PSEUDO "CHAIN" CHAIN-PSEUDO)>

<OBJECT CHAIN
	(LOC LOCAL-GLOBALS)
	(SYNONYM KETTER)
	(DESC "Kette")
	(FLAGS NDESCBIT DIEBIT)
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
	(SYNONYM GAS KOHLENOXYD GESTANK)
	(DESC "Gas")
	(FLAGS NDESCBIT DASBIT)
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
      (DESC "Sackgasse")
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
       ELSE
"Mit der Last pa%st du nicht durch diesen Durchgang.")
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
       ELSE "Mit der Last pa%st du nicht durch diesen Durchgang.")
      (OST TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "Mit der Last pa%st du nicht durch diesen Durchgang.")
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
      (LDESC "Dies ist ein unwichtiger Teil einer Kohlengrube.")
      (DESC "Kohlengrube")
      (NORD TO GAS-ROOM)
      (OST TO MINE-1)
      (NO TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-2	
      (LOC ROOMS)
      (LDESC "Dies ist ein unwichtiger Teil einer Kohlengrube.")
      (DESC "Kohlengrube")
      (NORD TO MINE-2)
      (SUED TO MINE-1)
      (SO TO MINE-3)
      (FLAGS RLANDBIT)>

<ROOM MINE-3	
      (LOC ROOMS)
      (LDESC "Dies ist ein unwichtiger Teil einer Kohlengrube.")
      (DESC "Kohlengrube")
      (SUED TO MINE-3)
      (SW TO MINE-4)
      (OST TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-4	
      (LOC ROOMS)
      (LDESC "Dies ist ein unwichtiger Teil einer Kohlengrube.")
      (DESC "Kohlengrube")
      (NORD TO MINE-3)
      (WEST TO MINE-4)
      (RUNTER TO LADDER-TOP)
      (FLAGS RLANDBIT)>

<ROOM SLIDE-ROOM	
      (LOC ROOMS)
      (LDESC
"Dies ist eine kleine Kammer, die der Teil einer Kohlengrube gewesen sein mu%s. Auf deren S%udwand sind die Buchstaben: %>Granitwand%< in den Fels eingraviert. Nach Osten gibt es einen langen Durchgang, und dort ist auch eine steile Metalrutsche, die sich nach unten windet. N%ordlich davon gibt es eine kleine %Offnung.") 
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