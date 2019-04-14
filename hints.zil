"HINTS for GERMAN ZORK - (VIA SHERLOCK)
(c) Copyright 1987 Infocom, Inc. All Rights Reserved."

<FILE-FLAGS CLEAN-STACK?>

<GLOBAL HINT-WARNING <>>

<GLOBAL HINTS-OFF <>>

<ROUTINE V-HINT ("AUX" CHR MAXC (C <>) Q WHO)
	<TELL "Hints are not in this version." CR>
	<RTRUE> 
	<COND (,HINTS-OFF
	       <TELL "Hints have been disabled for this session." CR>
	       <RFATAL>)
	      (<NOT ,HINT-WARNING>
	       <SETG HINT-WARNING T>
	       <TELL
"[Warning: It is recognized that the temptation for help may at times be so
exceedingly strong that you might fetch hints prematurely. Therefore, you may
at any time during the story type HINTS OFF, and this will disallow the
seeking out of help for the present session of the story. If you still want a
hint now, indicate HINT.]" CR>
	       <RFATAL>)>
	<SET MAXC <GET ,HINTS 0>>
	<INIT-HINT-SCREEN>
	<CURSET 5 1>
	<PUT-UP-CHAPTERS>
	<SETG CUR-POS <- ,CHAPT-NUM 1>>
	;<SETG CHAPT-NUM 1>
	;<CURSET 5 2>
	<NEW-CURSOR>
	;<PRINTI ">">
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
		       <SET Q T>
		       <RETURN>)
		      (<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n>>
		       <COND (<NOT <EQUAL? ,CHAPT-NUM .MAXC>>
			      <ERASE-CURSOR>
			      <SETG CUR-POS <+ ,CUR-POS 1>>
			      <SETG CHAPT-NUM <+ ,CHAPT-NUM 1>>
			      <NEW-CURSOR>
			      <SETG QUEST-NUM 1>)>)
		      (<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p>>
		       <COND (<NOT <EQUAL? ,CHAPT-NUM 1>>
			      <ERASE-CURSOR>
			      <SETG CUR-POS <- ,CUR-POS 1>>
			      <SETG CHAPT-NUM <- ,CHAPT-NUM 1>>
			      <NEW-CURSOR>
			      <SETG QUEST-NUM 1>)>)
		      (<EQUAL? .CHR 13 10>
		       ;<PUTP ,SCENE ,P?SCENE-CUR ,CUR-POS>
		       <PICK-QUESTION>
		       <RETURN>)>>
	<COND (<NOT .Q>
	       <AGAIN>	;"AGAIN does whole routine?")>
	;<SETG CUR-POS 0>
	;<SETG CHAPT-NUM 1>
	;<PUTP ,SCENE ,P?SCENE-CUR ,CUR-POS>
	<SPLIT 0>
	<CLEAR -1>
	<INIT-STATUS-LINE>
	<RFATAL>>

<ROUTINE PICK-QUESTION ("AUX" CHR MAXQ (Q <>))
	<INIT-HINT-SCREEN <>>
	<LEFT-LINE 3 " RETURN = see hint" %<LENGTH " RETURN = see hint">>
	<RIGHT-LINE 3 "Q = main menu" %<LENGTH "Q = main menu">>
	<SET MAXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
	<CURSET 5 1>
	<PUT-UP-QUESTIONS>
	<SETG CUR-POS <- ,QUEST-NUM 1>>
	;<SETG QUEST-NUM 1>
	;<CURSET 5 2>
	<NEW-CURSOR>
	;<PRINTI ">">
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
		       <SET Q T>
		       <RETURN>)
		      (<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n>>
		       <COND (<NOT <EQUAL? ,QUEST-NUM .MAXQ>>
			      <ERASE-CURSOR>
			      <SETG CUR-POS <+ ,CUR-POS 1>>
			      <SETG QUEST-NUM <+ ,QUEST-NUM 1>>
			      <NEW-CURSOR>)>)
		      (<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p>>
		       <COND (<NOT <EQUAL? ,QUEST-NUM 1>>
			      <ERASE-CURSOR>
			      <SETG CUR-POS <- ,CUR-POS 1>>
			      <SETG QUEST-NUM <- ,QUEST-NUM 1>>
			      <NEW-CURSOR>)>)
		      (<EQUAL? .CHR 13 10>
		       <DISPLAY-HINT>
		       <RETURN>)>>
	<COND (<NOT .Q>
	       <AGAIN>)>>

;"zeroth (first) element is 5"
<GLOBAL LINE-TABLE
	<PTABLE
		5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21
		5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21>>

;"zeroth (first) element is 4"
<GLOBAL COLUMN-TABLE
	<PTABLE
		 4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4
		24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24>>

;"four and nineteen are where the text of questions start"

<GLOBAL CUR-POS 0>	;"determines where to place the highlight cursor
			  Can go up to 34, that is 17 slots in each row"

<GLOBAL QUEST-NUM 1> ;"shows in HINT-TBL ltable which QUESTION it's on"

<GLOBAL CHAPT-NUM 1>	;"shows in HINT-TBL ltable which CHAPTER it's on"

<ROUTINE ERASE-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		<- <GET ,COLUMN-TABLE ,CUR-POS> 2 ;1>>
	<TELL " ">	;"erase previous highlight cursor">

;"go back 2 spaces from question text, print cursor and flash is between
the cursor and text"

<ROUTINE NEW-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		<- <GET ,COLUMN-TABLE ,CUR-POS> 2 ;1>>
	<TELL ">">	;"print the new cursor">

<ROUTINE INVERSE-LINE ("AUX" (CENTER-HALF <>)) 
	<HLIGHT ,H-INVERSE>
	<PRINT-SPACES <LOWCORE SCRH>>
	<HLIGHT ,H-NORMAL>>

<ROUTINE DISPLAY-HINT ("AUX" H MX (CNT 2 ;,HINT-HINTS) CHR (FLG T) N)
	<SPLIT 0>
	<CLEAR -1>
	<SPLIT 3>
	<SCREEN ,S-WINDOW>
	<CURSET 1 1>
	<INVERSE-LINE>
	<CENTER-LINE 1 "INVISICLUES (tm)" %<LENGTH "INVISICLUES (tm)">>
	<CURSET 3 1>
	<INVERSE-LINE>
	;<COND (,WIDE
	       <TELL " ">)>
	<LEFT-LINE 3 "RETURN = see new hint">
	<RIGHT-LINE 3 "Q = see hint menu" %<LENGTH "Q = see hint menu">>
	<HLIGHT ,H-BOLD>
	<SET H <GET <GET ,HINTS ,CHAPT-NUM> <+ ,QUEST-NUM 1>>>
	<CENTER-LINE 2 <GET .H 1 ;,HINT-QUESTION>>
	<HLIGHT ,H-NORMAL>
	<SET MX <GET .H 0>>
	;<CURSET 5 2>	;"instead of CRLF"
	<SCREEN ,S-TEXT>
	<CRLF>
	<REPEAT ()
		<COND (.FLG
		       <SET N <+ <- .MX .CNT> 1>> ;"added +1 - Jeff"
		       <TELL "[" N .N " hint">
		       <COND (<NOT <EQUAL? .N 1>>
			      <TELL "s">)>
		       <TELL " left.]" CR CR " -> ">
		       <SET FLG <>>)>
		<SET CHR <INPUT 1>>
		<COND (<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
		       ;<PUT .H ,HINT-SEEN .CNT>
		       ;<SETG CUR-POS <GET ,SCENE ,P?SCENE-CUR>>
		       <RETURN>)
		      (<EQUAL? .CHR 13 10>
		       <COND (<NOT <G? .CNT .MX>>
			      <SET FLG T>	;".cnt starts as 2"
			      <TELL <GET .H .CNT>>
			      <CRLF>
			      <CRLF>
			      <SET CNT <+ .CNT 1>>
			      ;<CURSET <+ <* .CNT 2> 1> 2>
			      ;"3rd = line 7, 4th = line 9, ect"
			      <COND (<G? .CNT .MX>
				     <SET FLG <>>
				     <TELL "[Final hint]" CR>
				     ;<CURSET <* .CNT 2> 1>)>)>)>>>

<ROUTINE PUT-UP-QUESTIONS ("AUX" (ST 1) MXQ MXL)
	<SET MXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
	<SET MXL <- <LOWCORE SCRV> 1>>
	<REPEAT ()
		<COND (<G? .ST .MXQ>
		       ;<TELL CR "[Last question]" CR>
		       <RETURN>)
		      (T                        ;"zeroth"
		       <CURSET <GET ,LINE-TABLE <- .ST 1>>
			       <- <GET ,COLUMN-TABLE <- .ST 1>> 1>>) 
		      ;(<G? .LN .MXL>
		       <TELL CR "[More questions follow]" CR>
		       <RETURN <- .ST 1>>)>
		<TELL " " <GET <GET <GET ,HINTS ,CHAPT-NUM> <+ .ST 1>> 1>>
		;<CRLF>	;"above curset will do the trick?"
		<SET ST <+ .ST 1>>>>

<ROUTINE PUT-UP-CHAPTERS ("AUX" (ST 1) MXC MXL)
	<SET MXC <GET ,HINTS 0>>
	<SET MXL <- <LOWCORE SCRV> 1>>
	<REPEAT ()
		<COND (<G? .ST .MXC>
		       ;<TELL CR "[Last chapter]" CR>
		       <RETURN>)
		      (T                        ;"zeroth"
		       <CURSET <GET ,LINE-TABLE <- .ST 1>>
			       <- <GET ,COLUMN-TABLE <- .ST 1>> 1>>) 
		      ;(<G? .LN .MXL>
		       <TELL CR "[More chapters follow]" CR>
		       <RETURN <- .ST 1>>)>
		<TELL " " <GET <GET ,HINTS .ST> 1 ;,HINT-QUEST>>
		;<CRLF>	;"above curset will do the trick?"
		<SET ST <+ .ST 1>>>>

<GLOBAL HINTS
	<PLTABLE
	 <PLTABLE "Ueber der Erde"
		  <LTABLE 3 "Wo finde ich ein Buschmesser?"
			    "...Es gibt keines. Dieses Spiel muss doch IRGENDWO seine Grenzen haben.Du kannst doch nicht ploetzlich erwarten, dass du zum naechsten Flugplatz gehst, um von dort  nach London zu fliegen, um das Britische Museum zu besuchen.">
		  <LTABLE 3 "Wie ueberquere ich die Berge?"
			    "Spiele ZORK II.">
		  <LTABLE 3 "Wie bringe ich den Singvogel um?"
			    "Was fuer eine Schnapsidee? Du brauchst einen Psychater.">
		  <LTABLE 3 "Wofuer ist das Nest sonst gut?"
			    "In China koennte man Vogelnestersuppe daraus machen."
			    "Wir sind nicht in China."
			    "In anderen Worten: Nein.">
		  <LTABLE 3 "Wie mache ich das Ei heil auf?"
			    ;"ren:"
			    "You don't."
			    "Hast du versucht zu sagen: EI %OFFNE."
			    "Es gehoert grosse Fingerferigkeit dazu und die richtigen Werkzeuge."
			    "Ein anderer Spieler kann es vielleicht."
			    "Nur der Dieb kann das Ei oeffnen. Gibt es ihm,oder lass es unteriridisch sein, wo er es finden kann.">
		  <LTABLE 3 "Kanarienvogel braucht Hilfe?"
			    "Er ist nicht mehr reparierbar."
			    "Keiner kann ihn reparieren. Sicher!">
		  <LTABLE 3 "Wozu sind Blaetter denn gut?"
			    "Die sind gut, um Gitter zu verbergen."
			    "Man kann sie nehmen, zaehlen, oder verbrennen.">
		  <LTABLE 3 "Ich habe mich im Wald verlaufen."
			    "Es gibt nur vier verschiedene Orte, die \"Wald\" heissen. Aber die Verbindungen sind gewoehnlich nicht gerade Wege. Um die Konfusion zu vergroesseren, gibt es zwei Oertlichkeiten, die \"Lichtung\" heissen. 
Von dem \"Waldpfad\" kann man nach Sueden zu dem \"Norden des Hauses\" gehen.">
		  <LTABLE 3 "Wie oeffne ich das Gitter?"
			  "Du musst es aufschliessen."
			  "Du brauchst den Schluessel beim Skelett."
			  "Es kann nur von unten aufgeschlossen werden."
			  "Das Gitter und der Schluessel koennen im Irrgarten gefunden werden.">
		  <LTABLE 3 "Wie komme ich von dem Hausdach?"
			    "Wie bist du denn raufgekommen."
			    "Einer von Infocom wuerde gerne wissen, wie du das geschafft hast."
			    "Das ist wirklich eine Falle. Verwende weder das Nichtvorhandensein oder das Vorhandenseins eines Themas als Indikator fuer das,was wichtig ist.">
		  <LTABLE 3 "Wozu ist der Kanarienvogel gut?"
			  "Er muss natuerlich unversehrt sein."
			  "Irgendwer ist von seinem Singen bezaubert."
			  "Es ist auch ein Wertstueck."
			  "Versuche ihn im Wald aufzuziehen.">
		  <LTABLE 3 "Wo ist das Flitterzeug? "
			    "Du musst erst mal das Ei oeffnen."
			    "Schau die vorige Frage an.">
		  <LTABLE 3 "Wie oeffne ich die Haustuer?"
			  "Man kann sie nicht eintreten"
			  "Man kann sie nicht nicht zerstoeren."
			  "Man kann sie nicht oeffnen.">
		  <LTABLE 3 "Wie komme ich ins Haus?"
			  "Hast du alle Seiten ausgechecked?"
			  "Da ist eine Fenster hinten, das ein bisschen offen steht."
			  "Mach's auf und klettere hinein.">
		  <LTABLE 3 "Kann ich das Brot essen?"
			    "Versuch's."
			    "Versuch auch das Wasser."
			    "In ZORK I darfst du vor nichts Angst haben (aber es ist sinnvoll, deinen Spielstand erst zu SICHERN).">
		  <LTABLE 3 "Wie komme ich in den Kerker?"
			  "Der Eingang ist im Haus."
			  "Falltueren koennen versteckt sein."
			  "Zieh den Teppich weg.">
		  <LTABLE 3
			  "Was ist ein Greul?"
			  "Tippe, WAS  IST EIN GREUL">>
	 <PLTABLE "Der Keller"
		  <LTABLE 3 "Geht die Falltuer von unten auf?"
			    "Nein. Der einzige Weg, den es gibt die Falltuer daran zu hindern hinter dir zuzufallen, ist einen anderen Ausweg zu finden (nicht den Kamin, der sehr limitiert ist).">
		  <LTABLE 3 "Geht es die Kellerrampe rauf?"
			  "Die Rampe ist zu schluepfrig zum Klettern."
			  "Kann man was gegen die Schluepfrigkeit tun?"
			  "Nein, die Rampe kommst du nie rauf.">
		  <LTABLE 3 "Wie verhandle ich mit dem Troll?"
			  "Trolle unterhalten sich gewoehnlich nicht gern. Man muss sie meist mit direkten Methoden angehen."
			  "So lange er bei Bewusstsein ist, kannst du nicht an ihm vorbei."
			  "Bring ihn mit dem Schwert um.">
		  <LTABLE 3 "Was mache ich mit der Axt?"
			  "Man kann es als Waffe benutzen, aber es ist eigentlich zu nichts gut."
			  "Dieser Platz ist absichtlich leer.">
		  <LTABLE 3 
			  "Warum sind hier Farbkleckse?"
			  "Der Kuenstler war ein Ferkel.">>
	 <PLTABLE "Der Irrgarten"
		  <LTABLE 3 "Wie geht's durch den Irrgarten?"
			  "Es ist notwendig eine Karte von dem Irrgarten zu zeichnen."
			  "Alle zehn Richtungen werden benutzt: N, S, O, W, NO, NW, SO, SW, RAUF, RUNTER."
			  "Einige Durchgaenge fuehren zu demselben Zimmer zurueck."
			  "Zimmer koennen dadurch markiert werden, dass man Dinge fallen laesst. (Der Dieb aber kann ein Problem sein)."
			  "Es gibt 22 Zimmer westlich von dem Trollzimmer.">
		  <LTABLE 3 "Wie durch den Irrgarten?"
			  "Von dem Trollzimmer zu dem Gitterzimmer:"
			  "W. W. W. RAUF. SW. RAUF. RUNTER. NO"
			  "Von dem Gitterzimmer zu dem Trollzimmer:"
			  "SW. RUNTER. O. N. RUNTER. N. N. N. O"
			  "Von dem Trollzimmer zu dem Zyklopenzimmer:"
			  "W. W. W. U. SW. E. S. SE."
			  "Von dem Zyklopenzimmer zu dem Trollzimmer:"
			  "NW. S. W. RUNTER. N. N. N. O"
			  "Von dem Gitterzimmer zu dem Zyklopenzimmer:"
			  "SW. RUNTER. O. N. O. S. SO"
			  "Von dem Zyklopenzimmer zu dem Gitterzimmer:"
			  "NW. S. W. RAUF. RUNTER. NO">
		  <LTABLE 3 "Wozu ist das rostige Messer?"
			  "Wenn du dein Schwert gehabt haettest, als du es genommen hast, haette das flackernde blendende Licht als Warnung gedient."
			  "Versuche das Messer zu werfen oder jemanden damit anzugreifen.">
		  <LTABLE 3 "Wozu ist ein Skelett gut?"
			  "Lasse den Toten ihren Frieden."
			  "Dieser Platz ist absichtlich frei gelassen worden.">
		  <LTABLE 3 "Brauch ich die kaputte Leuchte?"
			  "Wenn du denkst, dass sie nuetzlich ist, da gibt es die Bruecke, die dich vielleicht interessiert.">
		  <LTABLE 3 "Wie komm ich am Zyklop vorbei?"
			  "Kaempfen ist nicht immer die Antwort."
			  "Es gibt zwei Loesungen."
			  "Erst die erste Loesung:"
			  "Was passiert, wenn du herumhaengst oder dem Zyklop etwas gibst?"
			  "Er ist hungrig, nicht wahr?"
			  "Gib ihm das Brot und das Wasser.">>
	 <PLTABLE "Die Rundzimmergegend"
		  <LTABLE 3 "Wie bekomme ich das Platin?"
			  "Da gibt es eigentlich zwei Loesungen."
			  "Was macht das laute Tosen?"
			  "Gibt es eine Moeglichkeit den Fluss des Wassers zu kontrollieren?"
			  "Loese das Raetsel des Dammes."
			  "Hat das Oeffnen oder Schliessen der Schleusentore irgendwelchen Einfluss auf den Unterlauf des Flusses."
			  "Oeffne die Schleusentore."
			  "Warte bis das Reservoir leer ist, dann schliesse die Tore."
			  "Benutze die Ruhe im lauten Zimmer, waehrend sich das Reservoir anfuellt."
			  "Hier ist die zweite Loesung."
			  "Die Loesung, die das laute Zimmer betrifft, benoetigt keine Objekte aus dem Spiel oder auch irgendwelche Auskunft ueber das uebrige Spiel."
			  "Die Loesung hat etwas mit der Akustik in diesem Raum zu tun."
			  "Was passiert, wenn du etwas... etwas...etwas tippst?"
			  "Tippe ECHO.">
		  <LTABLE 3 "Wie bring ich den Rock um?"
			    "Wie dumm!"
			    "Der Ausdruck \"lebender Rock\" ist metaphorisch und sollte nicht woertlich genommen werden.">
		  <LTABLE 3 "Was Besonderes am Spiegel?"
			  "Ihn zerschlagen ist nicht die beste Idee."
			  "Hineingucken kann Spass machen."
			  "Hast du jemals versucht ihn zu beruehren oder ihn zu reiben?"
			  "Es gibt zwei Spiegelzimmer."
			  "Wenn man einen davon in einem Zimmer anruehrt, wird man automatisch ins andere Zimmer versetzt.">
		  <LTABLE 3 "Wie komme ich in den Hades?"
			  "Du musst die boesen Geister austreiben."
			  "Hier ein Tip: schlage die Seite im schwarzen Buch um."
			  "Man benoetigt die Glocke, das Buch und Kerzen."
			  "Laeute die Glocke, stecke die Kerzen an und lies das schwarze Buch."
			  "Die Reihenfolge in dieser feierlichen Handlung ist sehr wichtig."
			  "Auch musst du die Kerzen in der Hand halten, wenn du sie ansteckst."
			  "Geschwindigkeit ist in diesem Fall auch wichtig,--verschwende auch  nicht mehr Zeit, als unbedingt zwischen den Handlungen notwendig ist.">
		  <LTABLE 3 "Geht es runter vom Domzimmer?"
			  "Ja."
			  "Du musst frueher mal das notwendige Hilfsmittel gesehen haben."
			  "Man findet es im Speicher."
			  "Binde das Seil ans Gelaender.">
		  <LTABLE 3 "Geht es rauf vom Fackelzimmer?"
			    "Nein.">
		  <LTABLE 3 "Wie geht's weg vom Tempel?"  
			  "Du wirst  das Seil nie erreichen."
			  "Du kannst vom Altarende aus nach unten gehen, aber du brauchst \Gottes Hilfe\ um den Sarg durch das Loch nach unten zu bekommen."
			  
			  "Der Altar hat magische Kraefte."
			  "Was tut man gewoehnlich vor einem Altar?"
			  "Versuch's doch mal mit Beten.">>
	 <PLTABLE "Die Dammgegend"
		  <LTABLE 3
			  "Wie sprenge ich den Damm?"
			  "Was fuer eine Idee!"
			  "Hier ist absichtlich Platz frei gelassen.">
		  <LTABLE 3 "Wie funktioniert die Kontrolltafel?"
			    "Du kannst die Schraube drehen."
			    "Du brauchst einen Schraubenschluessel."
			    "Du musst die Schalttafel aktivieren. (Gruene Blase leuchtet auf.)">
		  <LTABLE 3 "Fuer was ist die gruene Blase?"
			  "Sie zeigt an, dass die Schalttafel aktiviert ist."
			  "Benutze  die Knoepfe in dem Wartungsraum .">
		  <LTABLE 3 "Was tue ich mit der Tube?"
			  "Lies die Tube."
			  "Die Zaehne damit putzen macht wirklich keinen Sinn."
			  "Zum Oelen der Schraube ist es auch nicht gedacht."
			  "Schwarze Schmiere wie diese, ist gut zum Reparieren von Lecks in Wasserroehren und Booten.">
		  <LTABLE 3 "Wozu ist der Schraubenzieher?"
			  "Wenn es an der Zeit ist, wirst du es wissen.">
		  <LTABLE 3 "Wozu Wartungsraumknoepfe?"
			  "Probier sie alle doch mal. Das sollte dir helfen das rauszufinden."
			  "Der blaue Knopf kann eine Wasserroehre platzen lassen."
			  "Der rote Knopf schaltet die Lichter ein und aus."
			  "Der gelbe Knopf aktiviert die Kontrolltafel am Damm(die gruene Blase leuchtet jetzt auf.)"
			  "Die braune Blase legt die Kontrolltafel lahm.">
		  <LTABLE 3 "Kann ich das Leck dichten?"
			  "Ja, aber nicht mit deinem Finger."
			  "Gibt es nicht irendwelche Schmiere, die man benutzen kann?"
			  "Benutze die Schmiere in der Tube.">
		  <LTABLE 3 "Wozu ist der Haufen Plastik?"
			  "Wofuer ist das Ventil?"
			  "Hast du mal versucht hineinzublasen?"
			  "Du brauchst die Luftpumpe, die noerdlich vom Reservoir ist."
			  "Loese das verDAMMte Problem, oder werd endlich aus dem Spiegel schlau.">>
		  <PLTABLE "Der Fluss"
			   <LTABLE 3 "Kann man ueber den Fluss?"
				     "Nicht ohne Boot.">
			   <LTABLE 3 "Was besaenftigt den Flussgott?"
				   "Was hast du versucht, in den Fluss zu werfen?"
				   "Es gibt keinen Flussgott. Was jemals reingeworfen wird, ist fuer immer verloren.">
			   <LTABLE 3 "Kann ich zurueck ueber den Fluss?"
				     "Wenn du vom sandigen Strand abstoesst, kannst du den Fluss westlich von den Weissen Klippen Sued ueberqueren."
				     "Es ist auch moeglich den Regenbogen zu ueberqueren.">
			   <LTABLE 3 "Wie funktioniert das Boot?"
				   "Lese die Anweisungen."
				   "Du kannst sagen: STEIG INS, STEIG AUS, STOSSEN AB, und LANDEN (oder eine Richtung gegen einen Landeplatz angeben.). Du kannst dich auch von der Stroemung tragen lassen.">
			   <LTABLE 3 "Ich habe eine Bootpanne!"
				   "Spitze Gegenstaende koennen ein Plastikboot kaputt machen. Man sollte sie nicht an Bord nehmen. Man sollte sie in das Boot tun, bevor man einsteigt, oder man solllte sie vorher in einem Behaelter haben, wie zum Beispiel dem braunen Sack.">
			   <LTABLE 3 "Wie komme ich ueber die Faelle?"
				   "Bleib im Boot und warte."
				   "Na ja, was hast du erwartet?"
				   "Ich sehe hier keinerlei Intelligenz.">
			   <LTABLE 3 "Hat der Regenbogen Bedeutung?"
				   "Du kannst ihn ueberqueren und den goldenen Topf bekommen."
				   "Du schlaegst nicht dreimal die Hacken zusammen, waehrend du ausrufst:\"Heimat, suesse Heimat.\""
				   "Die Beschreibung von einem der Schaetze, und das Resultat der richtigen Benutzung davon, sollten versteckte Tips sein."
				   "Erhebe das Zepter oder winke damit, waehrend du am Ende des Regenbogen stehst.">
			   <LTABLE 3 "Kann ich durch die Grottenritze?"
			       "\"Die ist zu eng fuer die meisten Insekten.\""
			       "Das geht nicht.">
			   <LTABLE 3 "Wie werde ich ein Insekt?"
				   "Spinne einen Kokon."
				   "Eine laecherliche Aufgabe.">>
		  <PLTABLE "Die Kohlengrube Gegend."
			   <LTABLE 3 "Was ist mit der Fledermaus?"
				   "Es ist eine Vampirfledermaus."
				   "Hast du je einen Greuelfilm gesehen?"
				   "Benutze den Knoblauch.">
			   <LTABLE 3 "Wie am Stinkzimmer vorbei?"
				   "Wenn die Batterie von deiner Leuchte kaputt ist, vergiss es.">
			   <LTABLE 3 "Die beste Kohlengrubenroute?" 
				   "Vom Gaszimmer zur Spitze der Leiter:"
				   "O. NO. SO. SW. RUNTER"
				   "Von der Spitze der Leiter zum Gaszimmer:"
				   "RUNTER. N. O. S. N">
			   <LTABLE 3 "Ist der Korb nuetzlich?"
				     "Alles in Zork ist nuetzlich.">
			   <LTABLE 3 "Wie durch den engen Durchgang?"
				     "\"Du passt nicht durch diesen Durchgang mit der Last.\""
				    "Hast du versucht,alles fallen zu lassen?">
			   <LTABLE 3  "Eine Lichtquelle fuers zugige Zimmer?"
				   "Streichhoelzer."
				   "Na ja, keiner hat gesagt, dass die in einem Zug angehen. Du kannst keine Lichtquelle reintragen. Es gibt eine andere Moeglichkeit." 
				   "Hast du dir mal ueberlegt wohin der Schacht mit dem Korb gefuehrt hat?"
				   "Dinge, wie z.B. Lichtquellen kann man in den Korb tun. Der Korb kann erhoeht und gesenkt werden.">
			   <LTABLE 3 "Wozu ist das Bauholz?"
				     "Es macht den Raum interessanter und verwirrt den Abenteurer.">
			   <LTABLE 3 "Wie funktioniert die Maschine?"
				   "Die Schalterbeschreibung sollte dich an etwas erinnern."
				   "Versuch mal was reinzutun und die Maschine mit dem Schraubenzieher anzustellen. Hast du einen Duden zur Hand?"
				   "Aus Kohle kann man einen Diamanten machen.">
			   <LTABLE 3 "Wozu ist die Kohle gut?"
				   "Es ist eine Quelle fuer Kohlenstoff."
				   "Einer der wertvollsten Steine ist aus Kohlenstoff gemacht."
				   "Diamanten sind aus reinem Kohlenstoff in einer Kristallform. Sie werden durch enorme Hitze und durch Druck erzeugt.">
			   <LTABLE 3 "Wozu ist das Gas gut?"
				     "Es hat eine tolle Wirkung, wenn man bornierteAbenteurer, die mit offenen Flammen in Kohlengruben rumlatschen, in die Luft blasen will.">>
		  <PLTABLE "Das Land hinter der Spalte."
			   <LTABLE 3 "Wie ueberquere ich die Spalte?"
				     "Es gibt keine Bruecke.">
			   <LTABLE 3 "Wie baue ich eine Bruecke?"
				   "Eine interessante Idee..."
				   "Das Bauholz koennte nuetzlich sein."
				   "Aber, vielleicht auch nicht?."
				   "Ein akzeptabler Versuch, aber vielleicht bringt er dir nichts.">>
		  <PLTABLE "Freie Fragen."
			   <LTABLE 3 "Warum leuchtet das Schwert auf?"
				   "Elfenschwerter haben Zauberkraft und leuchten blau auf, wenn in der Naehe Gefahren drohen (besonders gefaehrliche Personen).">
			   <LTABLE 3 "Was mach ich mit dem Dieb?"
				   "Einschaetzung ist der bessere Teil von Heldenmut."
"Du kannst fast immer einer Gegenueberstellung ausweichen, indem du in die andere Richtung gehst. Obwohl du beraubt werden koenntest
wirst du wenigstens nicht umgebracht.">
			   <LTABLE 3 "Wieviele Gesamtpunkte gibt's?"
				   "350 jedesmal, wenn du AUFH%OREN, NEUBEGINN ODER PUNKTZAHL sagst, das ist angegeben.">
			   <LTABLE 3 "Wie komm ich aus der Hoehle?"
				   "Es gibt da sechs Ausgaenge."
				   "Der Kamin erlaubt dir ausser deiner Lampe, jedesmal ein Objekt zu transportieren."
				   "Wahrscheinlich ist der einfachste Ausgang(rein von der Anlage her) durch das Gitter. Du triffst wahrscheinlich auf die anderen drei Ausgaenge, waehrend du einige der schwierigeren Probleme loest, aber es ist nicht notwendig, mehr als einen zu finden, um das Spiel zu beenden."> 
			   <LTABLE 3 "Was bedeuten die Gravierungen?"
				     "Der superweise Kritiker I.Q. Rundkopf hat eine zehnbaendige Studie ueber die Gravierungen der Ur-Zorker geschrieben. Doch machen wir eine lange Geschichte kurz, er erfasste klar, dass die Zorkers sehr eigentuemliche Kaeuze waren.">
			   <LTABLE 3 "Wie bring ich den Dieb um?"
				   "Der Dieb ist gerissen und gefaehrlich als Gegner, beschlagen in den Kampfarten. Anfaenger Zorker tun sich am Besten, indem sie in vermeiden."
				   "Es besteht die Moeglichkeit ihn fuer einen Zug lang abzulenken, indem man ihm etwas Wertvolles gibt."
				   "Das gefaehrliche Messer ist eine unter Umstaenden wirksamere Waffe, die man gegen ihn benutzen koennte.">
			   <LTABLE 3 "Wie kann ich meine Leuchte aufladen?"
				   "Wie kommst du darauf?"
				   "Es ist immer am besten, seine Mittel zu schonen."
				   "Du kannst ihre Lebensdauer verlaengern, indem du sie ausschaltest, wenn immer du kannst und andere Lichtquellen benutzen.">
			   <LTABLE 3 "Was passiert, wenn du stirbst?"
				   "Du  koenntest im Wald erscheinen von all deinem Besitz  umgeben (Wervolles unterirdisch, Wertloses ueberirdisch.)"
				   "Du koenntest als Geist umhergeistern, bis du eine Form deiner Auferstehung gefunden hast."
				   "ZORK I hat die gleichen Regeln wie Schlagball. Drei Versuche, dann bist du aus dem Spiel."
				   "Du wirst zu einem Geist, wenn du an einem gewissen Ort angekommen bist, der vor dem eigentlichen Tod steht."
				   "Dieser Ort ist der Altar in dem Suedtempel."
				   "Versuche am Altar zu beten.">
			   <LTABLE 3 "Wer ist \"der andere Bewohner\"?"
				   "\"Der von der grossen Tuete.\""
				   "Der Dieb, natuerlich.">
			   <LTABLE 3 "Wozu ist TAG, SEEMAN gut?"
				   "Willst du das wirklich wissen?"
				   "Bist du ganz sicher?"
				   "Um von dem schwarzen Buch zu zitieren: \"Oh Ihr, die Ihr zueinander sagt: %>Tag, Seeman%<. Seid Ihr Euch der Gr%o%se Eurer S%unden vor den G%ottern bewu%st? ... Wahrhaftig Ihr sollt b%ussen f%ur eure Schlauheit.\""
				   "Nirgends. (Man hat dich gewarnt.)">>
		  <PLTABLE "Freie Fragen"
			   <LTABLE 3 "Dinge scheinen hier oder nicht hier."
				   "Der Dieb ist dauernd irgendwo anders."
				   "Es ist sehr moeglich, dass er Wertvolles nimmt(ausser dem goldenen Sarg), den du gesehen hast. Es ist wesentlich weniger moeglich, das er etwas Nichtwertvolles nimmt (natuerlich nur, wenn du es gesehen hast), manchmal laesst er es auch spaeter fallen.">
			   <LTABLE 3 "Wo sind die gestohlenen Schaetze?"
				   "Waehrend der Dieb herumwandert, stielt er Dinge, die er in seinen Sack stopft. Wenn er in seinem Schatzzimmer ankommt, deponiert er die Werte, die er angesammelt hat."
				   "Das Schatzzimmer wird von dem Zyklop bewacht.">
			   <LTABLE 3 "Was mach ich mit dem Stilett?"
				   "Gratuliere! Das Stilett zu bekommen passiert selten. Wenn du es vor dem Dieb verbergen kannst, dann wird er dich nicht angreifen."
				   "Es ist ja nur eine Waffe, sonst nichts.">
			   <LTABLE 3 "Wer ist der duerre,hungrige Typ?"
				     "Der Dieb.">
			   <LTABLE 3 "Wo brauche ich die Schaufel?"
				   "Sie graebt nur in loser Erde."
				   "Probier sie im Sand."
				   "Der Sand in der sandigen Hoehle ist vielversprechend.">
			   <LTABLE 3 "Der beste Selbstbildniswiedergeber?"
				   "Von was sprichst du eigentlich?"
				   "Dieser Platz ist absichtlich offen gelassen.">
			   <LTABLE 3 "In den eigentuemlichen Durchgang?"
				   "Das ist nicht notwendig, um das Spiel zu beenden."
				   "Schau die andere  Zyklopantwort an.">
			   <LTABLE 3 "Wie in das Steingrab?"
				   "Wenn die Zeit reif ist, weisst du es."
				   "Wenn du alle 350 Punkte erreicht hast, dann kannst du ins Steingrab eintreten.">
			   <LTABLE 3 "Wie man Punkte macht. (Bitte nur benutzen, wenn alles verloren scheint.)"
				   "Du bekommst 10 Punkte, wenn du ins Haus gelangst, 25 fuer den Keller, 5 als Bonus, wenn du am Troll vorbei kommst, 13 fuer den Eintritt in das zugige Zimmer,25 fuer das Erreichen des Schatzzimmers."
				   "Diese Punkete zusammen mit all den Schatzpunkten kommen auf 350. Wenn du all diese 350 Punkte hast, wird der zwanzigste Schatz im Trophaenschrank erscheinen-- eine Karte, die (indirekt) zu 400 weiteren Punkten (ZORK II) fuehrt.">
			   <LTABLE 3 "Schaetze: Ihre Werte, wo sie sind."
				     "(Nur benutzen, wenn alles verloren scheint.)"
				     "(Der Schatz wird aufgefuehrt, gefolgt von den Punkten, die man bekommt, wenn man ihn nimmt, die Punkte dafuer, dass man ihn in den Trophaeenkasten tut, dann der Platz, wo er gefunden wird.)"
				     
"Juwelenbedecktes Ei - 5 - 5 - im Nest im Baum"
"Aufziebarer Kanarienvogel 6 - 4 - im Ei"
"Schoenes Gemaelde - 4 - 6 - Kunstgalerie"
"Platinbarren - 10 - 5 - im lauten Zimmer"
"Elfenbeinfackel - 14 - 6 - Fackelzimmer"
"Goldener Sarg - 10 - 15 - Aegyptisches Zimmer"

"Egyptian sceptre - 4 - 6 - in the coffin"

"Koffer mit Juwelen - 15 - 5 - Reservoir"
"Kristaldreizack - 4 - 11 - Atlantiszimmer"
"Jadefigure - 5 - 5 - Fledermauszimmer"
"Saphirarmbanch - 5 - 5 - Gaszimmer"
"Riesendiamant - 10 - 10 - du machst ihn"
"Sack mit Muenzen - 10 - 5 - im Irrgarten."
"Kristallschaedel - 10 - 10 - im Land der lebendigen Toten."
"juwelenbesetzer Skarabaeus - 5 - 5 - in der sandigen Hoehle vergraben"
"grosser Smaragd - 5 - 10 - in der Boje"
"Silberkelch - 10 - 5 - Schatzzimmer"
"Goldener Topf - 10 - 10 - am Ende des Regenbogens"
"Messingflitterkugel - 1 - 1 - der Singvogel hat sie">
			   <LTABLE 3 "Zum Spass"
				   "(Lies nur, nachdem du das Spiel beendet hast.)"
				   "Hast du je:"
"...das Gitter geoeffnet, waehrend die Blaetter noch drauf lagen?"
"...ZORK I so richtig verflucht?"
"...mit dem Zepter gewinkt, als du auf dem Regenbogen gestanden hast?"
"...etwas Boeses mit den Leichen im Hades ausprobiert?"
"...das schwarze Buch verbrannt?"
"...das Gemaelde kaputt gemacht?"
"...die Kerzen mit der Fackel angezuendet?"
"...das Streichholzschaechtelchen gelesen?"
"...versucht dich selber(oder den Dieb, den Troll oder den Zyklop)zu verulken?"
"...versucht Dinge mit dem Messer oder dem Schwert zu zerschneiden?"
"...Wasser auf etwas Brennendes geschuettet?"
"...gesagt WARTE oder SPIELSTAND, als du tot warst (als ein Geist)?">>>>

;<"Loesung mit Goldsngalten gib's auf"
"Warum ist der Raum wohl zugig?"
"Hast du dir mal ueberlegt, runterrunter drohen"
"Vorsicht ist die Mutter der Porzellankiste."
"Sobald du einen Ausgang findest, der nicht der Kamin ist, dann wird sich die Falltuere nicht hinter dir schliessen. allen h"
"Waehrend du Punkte sammelst, wird du zu einem besseren Gegner." "mit nn hauszuhalten., ist so fairn ,besuchs hastInsassemitMehr f unterwegs. wahrscheinlich wahrscheinlichsund" 
"Du kannst den Inhalt des Sackes bekommen, indem du ihn in einem Gefecht besiegst."
"irgstzu wirklichendu feststeckst. du feststeckst.wurde"
"Aegyptisches Zepter -4-6 - im Sarg"
"Topf mit Goldversucht zu en? beschaedigt hereinzulegen?">

<ROUTINE INIT-HINT-SCREEN ("OPTIONAL" (THIRD T) "AUX" WID LEN)
	<SET WID <GETB 0 33>>
	<SPLIT 0>
	<CLEAR -1>
	<SPLIT <- <GETB 0 32> 1>>
	<SCREEN ,S-WINDOW>
	<CURSET 1 1>
	<INVERSE-LINE>
	<CURSET 2 1>
	<INVERSE-LINE>
	<CURSET 3 1>
	<INVERSE-LINE>
	<CENTER-LINE 1 "INVISICLUES (tm)" 16>
	<LEFT-LINE 2 " N = next">
	<RIGHT-LINE 2 "P = previous" %<LENGTH "P = previous">>
	<COND (<T? .THIRD>
	       <LEFT-LINE 3 " RETURN = See hint">
	       <RIGHT-LINE 3 "Q = Resume story" %<LENGTH "Q = Resume story">>)>>

;<CONSTANT HINT-COUNT 0>
;<CONSTANT HINT-QUESTION 1>
;<CONSTANT HINT-SEEN 2>
;<CONSTANT HINT-OFF 3>
;<CONSTANT HINT-HINTS 4>

;<DEFINE NEW-HINT (NAME Q "ARGS" HINTS)
	<SETG .NAME 1>
	<COND (<G? <LENGTH .Q> 39>
	       <ERROR QUESTION-TOO-LONG!-ERRORS NEW-HINT .Q>)>
	<LTABLE .Q
		4
		.NAME
		!.HINTS>>

;<GLOBAL HINT-FLAG-TBL
	<TABLE 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>>

<ROUTINE CENTER-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT ,D-TABLE-ON ,DIROUT-TBL ;,SLINE>
	       <TELL .STR>
	       <DIROUT ,D-TABLE-OFF>
	       <SET LEN <GET ,DIROUT-TBL ;,SLINE 0>>)>
	<CURSET .LN </ <- <LOWCORE SCRH> .LEN> 2>>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<ROUTINE LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CURSET .LN 1>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<ROUTINE RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT 3 ,DIROUT-TBL ;,SLINE>
	       <TELL .STR>
	       <DIROUT -3>
	       <SET LEN <GET ,DIROUT-TBL ;,SLINE 0>>)>
	<CURSET .LN <- <LOWCORE SCRH> .LEN>>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<GLOBAL DIROUT-TBL
	<TABLE
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>>
