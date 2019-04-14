			"Generic PARSER file for
			    The ZORK Trilogy
		       started on 7/28/83 by MARC
 
                     -- GERMAN VIA <ZORK1>, pdl's revision"

;"ein, eine, ect. replaces w?one in all cases"

<SETG SIBREAKS ".,\"\%<\%>">

<GLOBAL PRSA <>>
<GLOBAL PRSI <>>
<GLOBAL PRSO <>>

<GLOBAL P-TABLE 0>
<GLOBAL P-ONEOBJ 0>
<GLOBAL P-SYNTAX 0>

<GLOBAL P-CCTBL <TABLE 0 0 0 0>>
;"pointers used by CLAUSE-COPY (source/destination beginning/end pointers)"
<CONSTANT CC-SBPTR 0>
<CONSTANT CC-SEPTR 1>
<CONSTANT CC-DBPTR 2>
<CONSTANT CC-DEPTR 3>

<CONSTANT LAST-OBJECT 0> ;"zilch automatically sticks number of last obj here"

<GLOBAL P-LEN 0>
<GLOBAL P-DIR 0>
<GLOBAL HERE:OBJECT WEST-OF-HOUSE>
<GLOBAL WINNER 0>

<GLOBAL P-LEXV
	<ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0> ;<ITABLE BYTE 120>>
<GLOBAL AGAIN-LEXV
	<ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0> ;<ITABLE BYTE 120>>
<GLOBAL RESERVE-LEXV
	<ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0> ;<ITABLE BYTE 120>>
<GLOBAL RESERVE-PTR <>>

;"INBUF - Input buffer for READ"

<GLOBAL P-INBUF
	<ITABLE 120 (BYTE LENGTH) 0>
	;<ITABLE BYTE 60>>
<GLOBAL OOPS-INBUF
	<ITABLE 120 (BYTE LENGTH) 0>
	;<ITABLE BYTE 60>>
<GLOBAL OOPS-TABLE <TABLE <> <> <> <>>>
<CONSTANT O-PTR 0>	"word pointer to unknown token in P-LEXV"
<CONSTANT O-START 1>	"word pointer to sentence start in P-LEXV"
<CONSTANT O-LENGTH 2>	"byte length of unparsed tokens in P-LEXV"
<CONSTANT O-END 3>	"byte pointer to first free byte in OOPS-INBUF"

;"Parse-cont variable"

<GLOBAL P-CONT <>>

;<GLOBAL LAST-PSEUDO-LOC <>>

;"Orphan flag"

<GLOBAL P-OFLAG <>>
<GLOBAL P-MERGED <>>
<GLOBAL P-ACLAUSE <>>
<GLOBAL P-ANAM <>>
<GLOBAL P-AADJ <>>
;"Parser variables and temporaries"

;"Byte offset to # of entries in LEXV"

<CONSTANT P-LEXWORDS 1> ;"Word offset to start of LEXV entries"
<CONSTANT P-LEXSTART 1> ;"Number of words per LEXV entry"
<CONSTANT P-LEXELEN 2>
<CONSTANT P-WORDLEN 4> ;"Offset to parts of speech byte"


<CONSTANT P-PSOFF %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 6) (T 4)>>
			"Offset to parts of speech byte"
<CONSTANT P-P1OFF %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE> 7) (T 5)>>
			"Offset to first part of speech"

;<CONSTANT P-PSOFF 4> ;"Offset to first part of speech"
;<CONSTANT P-P1OFF 5> ;"First part of speech bit mask in PSOFF byte"
<CONSTANT P-P1BITS 3>

<CONSTANT P-ITBLLEN 9>
<GLOBAL P-ITBL <TABLE 0 0 0 0 0 0 0 0 0 0>>
<GLOBAL P-OTBL <TABLE 0 0 0 0 0 0 0 0 0 0>>
<GLOBAL P-VTBL <TABLE 0 0 0 0>>
<GLOBAL P-OVTBL <TABLE 0 #BYTE 0 #BYTE 0>>

<GLOBAL P-NCN 0>

<CONSTANT P-VERB 0>
<CONSTANT P-VERBN 1>
<CONSTANT P-PREP1 2>
<CONSTANT P-PREP1N 3>
<CONSTANT P-PREP2 4>
<CONSTANT P-PREP2N 5>
<CONSTANT P-NC1 6>
<CONSTANT P-NC1L 7>
<CONSTANT P-NC2 8>
<CONSTANT P-NC2L 9>

<GLOBAL QUOTE-FLAG <>>
<GLOBAL P-END-ON-PREP <>>

" Grovel down the input finding the verb, prepositions, and noun clauses.
   If the input is <direction> or <walk> <direction>, fall out immediately
   setting PRSA to ,V?WALK and PRSO to <direction>. Otherwise, perform
   all required orphaning, syntax checking, and noun clause lookup."

<ROUTINE PARSER ("AUX" (PTR ,P-LEXSTART) WRD (VAL 0) (VERB <>) (OF-FLAG <>)
		       OWINNER OMERGED LEN (DIR <>) (NW 0) (LW 0) (CNT -1))
	<REPEAT ()
		<COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN> <RETURN>)
		      (T
		       <COND (<NOT ,P-OFLAG>
			      <PUT ,P-OTBL .CNT <GET ,P-ITBL .CNT>>)>
		       <PUT ,P-ITBL .CNT 0>)>>
	<SET OWINNER ,WINNER>
	<SET OMERGED ,P-MERGED>
	<SETG P-ADVERB <>>
	<SETG P-MERGED <>>
	<SETG P-END-ON-PREP <>>
	<PUT ,P-PRSO ,P-MATCHLEN 0>
	<PUT ,P-PRSI ,P-MATCHLEN 0>
	<PUT ,P-BUTS ,P-MATCHLEN 0>
	<COND (<AND <NOT ,QUOTE-FLAG> <N==? ,WINNER ,PLAYER>>
	       <SETG WINNER ,PLAYER>
	       <SETG HERE <META-LOC ,PLAYER>>
	       ;<COND (<NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		      <SETG HERE <LOC ,WINNER>>)>
	       <SETG LIT <LIT? ,HERE>>)>
	<COND (,RESERVE-PTR
	       <SET PTR ,RESERVE-PTR>
	       <STUFF ,RESERVE-LEXV ,P-LEXV>
	       <COND (<AND <NOT ,SUPER-BRIEF>
			   <EQUAL? ,PLAYER ,WINNER>>
		      <CRLF>)>
	       <SETG RESERVE-PTR <>>
	       <SETG P-CONT <>>)
	      (,P-CONT
	       <SET PTR ,P-CONT>
	       <COND (<AND <NOT ,SUPER-BRIEF>
			   <EQUAL? ,PLAYER ,WINNER>
			   <NOT <VERB? SAY>>>
		      <CRLF>)>
	       <SETG P-CONT <>>)
	      (T
	       <SETG WINNER ,PLAYER>
	       <SETG QUOTE-FLAG <>>
	       <COND (<NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		      <SETG HERE <LOC ,WINNER>>)>
	       <SETG LIT <LIT? ,HERE>>
	       <COND (<NOT ,SUPER-BRIEF> 
		      <CRLF>)>
	       %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
		       '<PROG ()
			      <UPDATE-STATUS-LINE>
			      <TELL ">">>)
		      (T
		       '<TELL ">">)>
	       <PUTB ,P-INBUF 1 0>
	       <READ ,P-INBUF ,P-LEXV>)>
	<SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
	<COND (<ZERO? ,P-LEN> <TELL "Bitte?" CR> <RFALSE>)>
	<COND (<EQUAL? <SET WRD <GET ,P-LEXV .PTR>> ,W?ACH>
	       <COND (<EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
			      ,W?PERIOD ,W?COMMA>
		      <SET PTR <+ .PTR ,P-LEXELEN>>
		      <SETG P-LEN <- ,P-LEN 1>>)>
	       <COND (<NOT <G? ,P-LEN 1>>
		      <TELL "Das war tolpatschig." CR>
		      <RFALSE>)
		     (<GET ,OOPS-TABLE ,O-PTR>
		      <COND (<AND <G? ,P-LEN 2>
				  <EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
					  ,W?QUOTE>>
			     <TELL
"Es tut mir leid, aber Fehler im vorgegebenen Text lassen sich nicht korrigieren." CR>
			     <RFALSE>)
			    (<G? ,P-LEN 2>
			     <TELL
"Warnung: nur das erste Wort nach ACH kann gelten." CR>)>
		      <PUT ,AGAIN-LEXV <GET ,OOPS-TABLE ,O-PTR>
			   <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>
		      <SETG WINNER .OWINNER> ;"maybe fix oops vs. chars.?"
		      <INBUF-ADD <GETB ,P-LEXV <+ <* .PTR ,P-LEXELEN> 6>>
				 <GETB ,P-LEXV <+ <* .PTR ,P-LEXELEN> 7>>
				 <+ <* <GET ,OOPS-TABLE ,O-PTR> ,P-LEXELEN> 3>>
		      <STUFF ,AGAIN-LEXV ,P-LEXV>
		      <SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
		      <SET PTR <GET ,OOPS-TABLE ,O-START>>
		      <INBUF-STUFF ,OOPS-INBUF ,P-INBUF>)
		     (T
		      <PUT ,OOPS-TABLE ,O-END <>>
		      <TELL "Hier gab es kein Wort zu ersetzen!" CR>
		      <RFALSE>)>)
	      (T
	       <COND (<NOT <EQUAL? .WRD ,W?WIEDER>>
		      <SETG P-NUMBER 0>)>
	       <PUT ,OOPS-TABLE ,O-END <>>)>
	<COND (<EQUAL? <GET ,P-LEXV .PTR> ,W?WIEDER>
	       <COND (<ZERO? <GETB ,OOPS-INBUF 1>>
		      <TELL "Bitte?" CR>
		      <RFALSE>)
		     (,P-OFLAG
		      <TELL "Gespr%achsfetzen wiederholen ist schwierig." CR>
		      <RFALSE>)
		     (<NOT ,P-WON>
		      <TELL "Das w%urde den Fehler nur wiederholen." CR>
		      <RFALSE>)
		     (<G? ,P-LEN 1>
		      <COND (<OR <EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
					,W?PERIOD ,W?COMMA ,W?DANN>
				 <EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
					,W?UND>>
			     <SET PTR <+ .PTR <* 2 ,P-LEXELEN>>>
			     <PUTB ,P-LEXV ,P-LEXWORDS
				   <- <GETB ,P-LEXV ,P-LEXWORDS> 2>>)
			    (T
			     <TELL 
"Dieser Satz ist nicht verstanden worden." CR>
			     <RFALSE>)>)
		     (T
		      <SET PTR <+ .PTR ,P-LEXELEN>>
		      <PUTB ,P-LEXV ,P-LEXWORDS
			    <- <GETB ,P-LEXV ,P-LEXWORDS> 1>>)>
	       <COND (<G? <GETB ,P-LEXV ,P-LEXWORDS> 0>
		      <STUFF ,P-LEXV ,RESERVE-LEXV>
		      <SETG RESERVE-PTR .PTR>)
		     (T
		      <SETG RESERVE-PTR <>>)>
	       ;<SETG P-LEN <GETB ,AGAIN-LEXV ,P-LEXWORDS>>
	       <SETG WINNER .OWINNER>
	       <SETG P-MERGED .OMERGED>
	       <INBUF-STUFF ,OOPS-INBUF ,P-INBUF>
	       <STUFF ,AGAIN-LEXV ,P-LEXV>
	       <SET CNT -1>
	       <SET DIR ,AGAIN-DIR>
	       <REPEAT ()
		<COND (<IGRTR? CNT ,P-ITBLLEN> <RETURN>)
		      (T <PUT ,P-ITBL .CNT <GET ,P-OTBL .CNT>>)>>)
	      (T
	       <STUFF ,P-LEXV ,AGAIN-LEXV>
	       <INBUF-STUFF ,P-INBUF ,OOPS-INBUF>
	       <PUT ,OOPS-TABLE ,O-START .PTR>
	       <PUT ,OOPS-TABLE ,O-LENGTH <* 4 ,P-LEN>>
	       <SET LEN
		    <* 2 <+ .PTR <* ,P-LEXELEN <GETB ,P-LEXV ,P-LEXWORDS>>>>>
	       <PUT ,OOPS-TABLE ,O-END <+ <GETB ,P-LEXV <- .LEN 1>>
					  <GETB ,P-LEXV <- .LEN 2>>>>
	       <SETG RESERVE-PTR <>>
	       <SET LEN ,P-LEN>
	       <SETG P-DIR <>>
	       <SETG P-NCN 0>
	       <SETG P-GETFLAGS 0>
	       <REPEAT ()
		<COND (<L? <SETG P-LEN <- ,P-LEN 1>> 0>
		       <SETG QUOTE-FLAG <>>
		       <RETURN>)
		      (<OR <SET WRD <GET ,P-LEXV .PTR>>
			   <SET WRD <NUMBER? .PTR>>>
		       <COND (<ZERO? ,P-LEN> <SET NW 0>)
			     (T <SET NW <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>)>
		       <COND (<AND <EQUAL? .WRD ,W?ZU>
				   <EQUAL? .VERB ,ACT?SAG ;,ACT?ASK>>
			      <SET WRD ,W?QUOTE>)
			     (<AND <EQUAL? .WRD ,W?DANN>
				   <G? ,P-LEN 0>
				   <NOT .VERB>
				   <NOT ,QUOTE-FLAG> ;"Last NOT added 7/3">
			      <COND (<EQUAL? .LW 0 ,W?PERIOD>
				     <SET WRD ,W?DER>)
				    (ELSE
				     <PUT ,P-ITBL ,P-VERB ,ACT?SAG>
				     <PUT ,P-ITBL ,P-VERBN 0>
				     <SET WRD ,W?QUOTE>)>)>
		       <COND (<EQUAL? .WRD ,W?DANN ,W?PERIOD ,W?QUOTE>
			      <COND (<EQUAL? .WRD ,W?QUOTE>
				     <COND (,QUOTE-FLAG
					    <SETG QUOTE-FLAG <>>)
					   (T <SETG QUOTE-FLAG T>)>)>
			      <OR <ZERO? ,P-LEN>
				  <SETG P-CONT <+ .PTR ,P-LEXELEN>>>
			      <PUTB ,P-LEXV ,P-LEXWORDS ,P-LEN>
			      <RETURN>)
			     (<AND <SET VAL
					<WT? .WRD
					     ,PS?DIRECTION
					     ,P1?DIRECTION>>
				   <EQUAL? .VERB <> ,ACT?GEH>
				   <OR <EQUAL? .LEN 1>
				       <AND <EQUAL? .LEN 2>
					    <EQUAL? .VERB ,ACT?GEH>>
				       <AND <EQUAL? .NW
					            ,W?DANN
					            ,W?PERIOD
					            ,W?QUOTE>
					    <NOT <L? .LEN 2>>>
				       <AND ,QUOTE-FLAG
					    <EQUAL? .LEN 2>
					    <EQUAL? .NW ,W?QUOTE>>
				       <AND <G? .LEN 2>
					    <EQUAL? .NW ,W?COMMA ,W?UND>>>>
			      <SET DIR .VAL>
			      <COND (<EQUAL? .NW ,W?COMMA ,W?UND>
				     <PUT ,P-LEXV
					  <+ .PTR ,P-LEXELEN>
					  ,W?DANN>)>
			      <COND (<NOT <G? .LEN 2>>
				     <SETG QUOTE-FLAG <>>
				     <RETURN>)>)
			     (<AND <SET VAL <WT? .WRD ,PS?VERB ,P1?VERB>>
				   <NOT .VERB>>
			      <SET VERB .VAL>
			      <PUT ,P-ITBL ,P-VERB .VAL>
			      <PUT ,P-ITBL ,P-VERBN ,P-VTBL>
			      <PUT ,P-VTBL 0 .WRD>
			      <PUTB ,P-VTBL 2 <GETB ,P-LEXV
						    <SET CNT
							 <+ <* .PTR 2> 2>>>>
			      <PUTB ,P-VTBL 3 <GETB ,P-LEXV <+ .CNT 1>>>)
			     (<OR <SET VAL <WT? .WRD ,PS?PREPOSITION 0>>
				  <EQUAL? .WRD ,W?ALLES ;,W?ONE ;,W?BOTH>
				  <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN>
				  <WT? .WRD ,PS?ADJECTIVE>
				  <WT? .WRD ,PS?OBJECT>>
			      <COND (<AND <G? ,P-LEN 1>
					  ;"JEFF 'VOLL' FOR BAG OF COINS"
					  <EQUAL? .NW ;,W?OF ,W?VOLL ;,W?VON>
					  <ZERO? .VAL>
					  <NOT <EQUAL? .WRD
						       ,W?ALLES ;,W?ONE ;,W?A>>
					  <NOT <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN>>
					  ;<NOT <EQUAL? .WRD ,W?BOTH>>>
				     <SET OF-FLAG T>)
				    (<AND <NOT <ZERO? .VAL>>
				          <OR <ZERO? ,P-LEN>
					      <EQUAL? .NW ,W?DANN ,W?PERIOD>>>
				     <SETG P-END-ON-PREP T>
				     <COND (<L? ,P-NCN 2>
					    <PUT ,P-ITBL ,P-PREP1 .VAL>
					    <PUT ,P-ITBL ,P-PREP1N .WRD>)>)
				    (<EQUAL? ,P-NCN 2>
				     <TELL
"Der Satz hatte zu viele Substantive." CR>
				     <RFALSE>)
				    (T
				     <SETG P-NCN <+ ,P-NCN 1>>
				     <SETG P-ACT .VERB>
				     <OR <SET PTR <CLAUSE .PTR .VAL .WRD>>
					 <RFALSE>>
				     <COND (<L? .PTR 0>
					    <SETG QUOTE-FLAG <>>
					    <RETURN>)>)>)
			     (<EQUAL? .WRD ;,W?OF ;,W?VON ,W?VOLL>
			      <COND (<OR <NOT .OF-FLAG>
					 <EQUAL? .NW ,W?PERIOD ,W?DANN>>
				     <CANT-USE .PTR>
				     <RFALSE>)
				    (T
				     <SET OF-FLAG <>>)>)
			     (<WT? .WRD ,PS?BUZZ-WORD>)
			     (<AND <EQUAL? .VERB ,ACT?SAG>
				   <WT? .WRD ,PS?VERB ,P1?VERB>
				   <EQUAL? ,WINNER ,PLAYER>>
			      <TELL
"Bitte lies die Anleitung zum Spiel, um die richtige Anrede zu finden, die man f%ur andere Leute oder Biester benutzt." CR>
			      <RFALSE>)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T
		       <UNKNOWN-WORD .PTR>
		       <RFALSE>)>
		<SET LW .WRD>
		<SET PTR <+ .PTR ,P-LEXELEN>>>)>
	<PUT ,OOPS-TABLE ,O-PTR <>>
	<COND (.DIR
	       <SETG PRSA ,V?WALK>
	       <SETG PRSO .DIR>
	       <SETG P-OFLAG <>>
	       <SETG P-WALK-DIR .DIR>
	       <SETG AGAIN-DIR .DIR>)
	      (ELSE
	       <COND (,P-OFLAG <ORPHAN-MERGE>)>
	       <SETG P-WALK-DIR <>>
	       <SETG AGAIN-DIR <>>
	       <COND (<AND <SYNTAX-CHECK>
			   <SNARF-OBJECTS>
			   <MANY-CHECK>
			   <TAKE-CHECK>>
		      T)>)>>

<GLOBAL P-ACT <>>
<GLOBAL P-WALK-DIR <>>
<GLOBAL AGAIN-DIR <>>

;"For AGAIN purposes, put contents of one LEXV table into another."
<ROUTINE STUFF (SRC DEST "OPTIONAL" (MAX 29) "AUX" (PTR ,P-LEXSTART) (CTR 1)
						   BPTR)
	 <PUTB .DEST 0 <GETB .SRC 0>>
	 <PUTB .DEST 1 <GETB .SRC 1>>
	 <REPEAT ()
	  <PUT .DEST .PTR <GET .SRC .PTR>>
	  <SET BPTR <+ <* .PTR 2> 2>>
	  <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
	  <SET BPTR <+ <* .PTR 2> 3>>
	  <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
	  <SET PTR <+ .PTR ,P-LEXELEN>>
	  <COND (<IGRTR? CTR .MAX>
		 <RETURN>)>>>

;"Put contents of one INBUF into another"
<ROUTINE INBUF-STUFF (SRC DEST "AUX" CNT)
	 <SET CNT <- <GETB .SRC 0> 1>>
	 <REPEAT ()
		 <PUTB .DEST .CNT <GETB .SRC .CNT>>
		 <COND (<DLESS? CNT 0> <RETURN>)>>>

;"Put the word in the positions specified from P-INBUF to the end of
OOPS-INBUF, leaving the appropriate pointers in AGAIN-LEXV"
<ROUTINE INBUF-ADD (LEN BEG SLOT "AUX" DBEG (CTR 0) TMP)
	 <COND (<SET TMP <GET ,OOPS-TABLE ,O-END>>
		<SET DBEG .TMP>)
	       (T
		<SET DBEG <+ <GETB ,AGAIN-LEXV
				   <SET TMP <GET ,OOPS-TABLE ,O-LENGTH>>>
			     <GETB ,AGAIN-LEXV <+ .TMP 1>>>>)>
	 <PUT ,OOPS-TABLE ,O-END <+ .DBEG .LEN>>
	 <REPEAT ()
	  <PUTB ,OOPS-INBUF <+ .DBEG .CTR> <GETB ,P-INBUF <+ .BEG .CTR>>>
	  <SET CTR <+ .CTR 1>>
	  <COND (<EQUAL? .CTR .LEN> <RETURN>)>>
	 <PUTB ,AGAIN-LEXV .SLOT .DBEG>
	 <PUTB ,AGAIN-LEXV <- .SLOT 1> .LEN>>

;"Check whether word pointed at by PTR is the correct part of speech.
   The second argument is the part of speech (,PS?<part of speech>). The
   3rd argument (,P1?<part of speech>), if given, causes the value
   for that part of speech to be returned."

<ROUTINE WT? (PTR BIT "OPTIONAL" (B1 5) "AUX" (OFFS ,P-P1OFF) TYP)
	<COND (<BTST <SET TYP <GETB .PTR ,P-PSOFF>> .BIT>
	       <COND (<G? .B1 4> <RTRUE>)
		     (<EQUAL? .BIT ,PS?OBJECT> 1)	;"NEW-VOC"
		     (T
		      <SET TYP <BAND .TYP ,P-P1BITS>>
		      <COND (<NOT <EQUAL? .TYP .B1>> <SET OFFS <+ .OFFS 1>>)>
		      <GETB .PTR .OFFS>)>)>>

;" Scan through a noun clause, leave a pointer to its starting location"

<ROUTINE CLAUSE (PTR VAL WRD "AUX" OFF NUM (ANDFLG <>) (FIRST?? T) NW (LW 0))
	<SET OFF <* <- ,P-NCN 1> 2>>
	<COND (<NOT <EQUAL? .VAL 0>>
	       <PUT ,P-ITBL <SET NUM <+ ,P-PREP1 .OFF>> .VAL>
	       <PUT ,P-ITBL <+ .NUM 1> .WRD>
	       <SET PTR <+ .PTR ,P-LEXELEN>>)
	      (T <SETG P-LEN <+ ,P-LEN 1>>)>
	<COND (<ZERO? ,P-LEN> <SETG P-NCN <- ,P-NCN 1>> <RETURN -1>)>
	<PUT ,P-ITBL <SET NUM <+ ,P-NC1 .OFF>> <REST ,P-LEXV <* .PTR 2>>>
	<COND (<OR <EQUAL? <GET ,P-LEXV .PTR> ,W?DER ,W?DIE ,W?DAS>
		   <EQUAL? <GET ,P-LEXV .PTR> ,W?EIN ,W?EINE ,W?EINEM>
		   <EQUAL? <GET ,P-LEXV .PTR> ,W?EINEN ,W?EINER>>
	       <PUT ,P-ITBL .NUM <REST <GET ,P-ITBL .NUM> 4>>)>
	<REPEAT ()
		<COND (<L? <SETG P-LEN <- ,P-LEN 1>> 0>
		       <PUT ,P-ITBL <+ .NUM 1> <REST ,P-LEXV <* .PTR 2>>>
		       <RETURN -1>)>
		<COND (<OR <SET WRD <GET ,P-LEXV .PTR>>
			   <SET WRD <NUMBER? .PTR>>>
		       <COND (<ZERO? ,P-LEN> <SET NW 0>)
			     (T <SET NW <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>)>
		       <COND (<EQUAL? .WRD ,W?UND ,W?COMMA> <SET ANDFLG T>)
			     (<OR <EQUAL? .WRD ,W?ALLES ;,W?ONE ;,W?BOTH>
				  <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN>>
			      <COND (<EQUAL? .NW ;,W?OF ;,W?VON ,W?VOLL>
				     <SETG P-LEN <- ,P-LEN 1>>
				     <SET PTR <+ .PTR ,P-LEXELEN>>)>)
			     (<OR <EQUAL? .WRD ,W?DANN ,W?PERIOD>
				  <AND <WT? .WRD ,PS?PREPOSITION>
				       <GET ,P-ITBL ,P-VERB>
				          ;"ADDED 4/27 FOR TURTLE,UP"
				       <NOT .FIRST??>>>
			      <SETG P-LEN <+ ,P-LEN 1>>
			      <PUT ,P-ITBL
				   <+ .NUM 1>
				   <REST ,P-LEXV <* .PTR 2>>>
			      <RETURN <- .PTR ,P-LEXELEN>>)
			     (<WT? .WRD ,PS?OBJECT>
			      <COND (<AND <G? ,P-LEN 0>
					  <EQUAL? .NW ;,W?OF ;,W?VON ,W?VOLL>
					  <NOT <EQUAL? .WRD ,W?ALLES ;,W?ONE>>
					  <NOT <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN>>>
				     T)
				    (<AND <WT? .WRD
					       ,PS?ADJECTIVE
					       ;,P1?ADJECTIVE>
					  ;"semi ala BZork and elsewhere"
					  <NOT <EQUAL? .NW 0>>
					  <WT? .NW ,PS?OBJECT>>)
				    (<AND <NOT .ANDFLG>
					  <NOT <EQUAL? .NW ,W?ABER ,W?AUSSER
						       ,W?AU\%SER>>
					  <NOT <EQUAL? .NW ,W?UND ,W?COMMA>>>
				     <PUT ,P-ITBL
					  <+ .NUM 1>
					  <REST ,P-LEXV <* <+ .PTR 2> 2>>>
				     <RETURN .PTR>)
				    (T <SET ANDFLG <>>)>)
			     (<AND <OR ,P-MERGED
				       ,P-OFLAG
				       <NOT <EQUAL? <GET ,P-ITBL ,P-VERB> 0>>>
				   <OR <WT? .WRD ,PS?ADJECTIVE>
				       <WT? .WRD ,PS?BUZZ-WORD>>>)
			     (<AND .ANDFLG
				   <OR <WT? .WRD ,PS?DIRECTION>
				       <WT? .WRD ,PS?VERB>>>
			      <SET PTR <- .PTR 4>>
			      <PUT ,P-LEXV <+ .PTR 2> ,W?DANN>
			      <SETG P-LEN <+ ,P-LEN 2>>)
			     (<WT? .WRD ,PS?PREPOSITION> T)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T <UNKNOWN-WORD .PTR> <RFALSE>)>
		<SET LW .WRD>
		<SET FIRST?? <>>
		<SET PTR <+ .PTR ,P-LEXELEN>>>>

<ROUTINE NUMBER? (PTR "AUX" CNT BPTR CHR (SUM 0) (TIM <>))
	 <SET CNT <GETB <REST ,P-LEXV <* .PTR 2>> 2>>
	 <SET BPTR <GETB <REST ,P-LEXV <* .PTR 2>> 3>>
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0> <RETURN>)
		       (T
			<SET CHR <GETB ,P-INBUF .BPTR>>
			<COND (<EQUAL? .CHR 58>
			       <SET TIM .SUM>
			       <SET SUM 0>)
			      (<G? .SUM 10000> <RFALSE>)
			      (<AND <L? .CHR 58> <G? .CHR 47>>
			       <SET SUM <+ <* .SUM 10> <- .CHR 48>>>)
			      (T <RFALSE>)>
			<SET BPTR <+ .BPTR 1>>)>>
	 <PUT ,P-LEXV .PTR ,W?INTNUM>
	 <COND (<G? .SUM 1000> <RFALSE>)
	       (.TIM
		<COND (<L? .TIM 8> <SET TIM <+ .TIM 12>>)
		      (<G? .TIM 23> <RFALSE>)>
		<SET SUM <+ .SUM <* .TIM 60>>>)>
	 <SETG P-NUMBER .SUM>
	 ,W?INTNUM>

<GLOBAL P-NUMBER 0>

<GLOBAL P-DIRECTION <>>


;"New ORPHAN-MERGE for TRAP Retrofix 6/21/84"

<ROUTINE ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD)
   <SETG P-OFLAG <>>
   <COND (<OR <EQUAL? <WT? <SET WRD <GET <GET ,P-ITBL ,P-VERBN> 0>>
			   ,PS?VERB ,P1?VERB>
		      <GET ,P-OTBL ,P-VERB>>
	      <NOT <ZERO? <WT? .WRD ,PS?ADJECTIVE>>>>
	  <SET ADJ T>)
	 (<AND <NOT <ZERO? <WT? .WRD ,PS?OBJECT ,P1?OBJECT>>>
	       <EQUAL? ,P-NCN 0>>
	  <PUT ,P-ITBL ,P-VERB 0>
	  <PUT ,P-ITBL ,P-VERBN 0>
	  <PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
	  <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>
	  <SETG P-NCN 1>)>
   <COND (<AND <NOT <ZERO? <SET VERB <GET ,P-ITBL ,P-VERB>>>>
	       <NOT .ADJ>
	       <NOT <EQUAL? .VERB <GET ,P-OTBL ,P-VERB>>>>
	  <RFALSE>)
	 (<EQUAL? ,P-NCN 2> <RFALSE>)
	 (<EQUAL? <GET ,P-OTBL ,P-NC1> 1>
	  <COND (<OR <EQUAL? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP1>>
		     <ZERO? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-OTBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<ZERO? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>
			<COND (<ZERO? ,P-NCN> <SETG P-NCN 1>)>)
		       (T
			<PUT ,P-OTBL ,P-NC1 <GET ,P-ITBL ,P-NC1>>)>
		 <PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)
		(T <RFALSE>)>)
	 (<EQUAL? <GET ,P-OTBL ,P-NC2> 1>
	  <COND (<OR <EQUAL? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP2>>
		     <ZERO? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<ZERO? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>)>
		 <PUT ,P-OTBL ,P-NC2 <GET ,P-ITBL ,P-NC1>>
		 <PUT ,P-OTBL ,P-NC2L <GET ,P-ITBL ,P-NC1L>>
		 <SETG P-NCN 2>)
		(T <RFALSE>)>)
	 (<NOT <ZERO? ,P-ACLAUSE>>
	  <COND (<AND <NOT <EQUAL? ,P-NCN 1>> <NOT .ADJ>>
		 <SETG P-ACLAUSE <>>
		 <RFALSE>)
		(T
		 <SET BEG <GET ,P-ITBL ,P-NC1>>
		 <COND (.ADJ <SET BEG <REST ,P-LEXV 2>> <SET ADJ <>>)>
		 <SET END <GET ,P-ITBL ,P-NC1L>>
		 <REPEAT ()
			 <SET WRD <GET .BEG 0>>
			 <COND (<EQUAL? .BEG .END>
				<COND (.ADJ <ACLAUSE-WIN .ADJ> <RETURN>)
				      (T <SETG P-ACLAUSE <>> <RFALSE>)>)
			       (<AND <NOT .ADJ>
				     <OR <BTST <GETB .WRD ,P-PSOFF>
					       ,PS?ADJECTIVE>
					 <EQUAL? .WRD ,W?ALLES ;,W?ONE>
					 <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN>>>
				<SET ADJ .WRD>)
			       (;<EQUAL? .WRD ,W?ONE>
			        <EQUAL? .WRD ,W?EIN ,W?EINE
						       ,W?EINER ,W?EINEM 
						       ,W?EINEN> 
				<ACLAUSE-WIN .ADJ>
				<RETURN>)
			       (<BTST <GETB .WRD ,P-PSOFF> ,PS?OBJECT>
				<COND (<EQUAL? .WRD ,P-ANAM>
				       <ACLAUSE-WIN .ADJ>)
				      (T
				       <NCLAUSE-WIN>)>
				<RETURN>)>
			 <SET BEG <REST .BEG ,P-WORDLEN>>
			 <COND (<EQUAL? .END 0>
				<SET END .BEG>
				<SETG P-NCN 1>
				<PUT ,P-ITBL ,P-NC1 <BACK .BEG 4>>
				<PUT ,P-ITBL ,P-NC1L .BEG>)>>)>)>
   <PUT ,P-VTBL 0 <GET ,P-OVTBL 0>>
   <PUTB ,P-VTBL 2 <GETB ,P-OVTBL 2>>
   <PUTB ,P-VTBL 3 <GETB ,P-OVTBL 3>>
   <PUT ,P-OTBL ,P-VERBN ,P-VTBL>
   <PUTB ,P-VTBL 2 0>
   <REPEAT ()
	   <COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN>
		  <SETG P-MERGED T>
		  <RTRUE>)
		 (T <PUT ,P-ITBL .CNT <GET ,P-OTBL .CNT>>)>>
   T>

;"New ACLAUSE-WIN for TRAP retrofix 6/21/84"

<ROUTINE ACLAUSE-WIN (ADJ)
	<PUT ,P-ITBL ,P-VERB <GET ,P-OTBL ,P-VERB>>
	<PUT ,P-CCTBL ,CC-SBPTR ,P-ACLAUSE>
	<PUT ,P-CCTBL ,CC-SEPTR <+ ,P-ACLAUSE 1>>
	<PUT ,P-CCTBL ,CC-DBPTR ,P-ACLAUSE>
	<PUT ,P-CCTBL ,CC-DEPTR <+ ,P-ACLAUSE 1>>
	<CLAUSE-COPY ,P-OTBL ,P-OTBL .ADJ>
	<AND <NOT <EQUAL? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	<SETG P-ACLAUSE <>>
	<RTRUE>>

<ROUTINE NCLAUSE-WIN ()
        <PUT ,P-CCTBL ,CC-SBPTR ,P-NC1>
	<PUT ,P-CCTBL ,CC-SEPTR ,P-NC1L>
	<PUT ,P-CCTBL ,CC-DBPTR ,P-ACLAUSE>
	<PUT ,P-CCTBL ,CC-DEPTR <+ ,P-ACLAUSE 1>>
	<CLAUSE-COPY ,P-ITBL ,P-OTBL>
	<AND <NOT <EQUAL? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	<SETG P-ACLAUSE <>>
	<RTRUE>>

;"Print undefined word in input.
   PTR points to the unknown word in P-LEXV"

<ROUTINE WORD-PRINT (CNT BUF "OPT" (CAP? <>) "AUX" (DID-CAP <>))
	 <REPEAT ()
		 <COND (<DLESS? CNT 0> <RETURN>)
		       (ELSE
			<COND (<AND <NOT .DID-CAP>
				    .CAP?>
				<SET DID-CAP T>
				<PRINTC <- <GETB ,P-INBUF .BUF> 32>>)
			      (T
			       <PRINTC <GETB ,P-INBUF .BUF>>)>
			<SET BUF <+ .BUF 1>>)>>>

<ROUTINE UNKNOWN-WORD (PTR "AUX" BUF)
	<PUT ,OOPS-TABLE ,O-PTR .PTR>
	<COND (<VERB? SAY>
	       <TELL "Hier passiert garnichts." CR>
	       <RFALSE>)>
	;<TELL "I don't know the word %>">
	<TELL "Das Wort %>"> 
	<WORD-PRINT <GETB <REST ,P-LEXV <SET BUF <* .PTR 2>>> 2>
		    <GETB <REST ,P-LEXV .BUF> 3>>
	<TELL "%< kann nicht von dem Spielvokabular verstanden werden." CR>
	;<TELL "%<." CR>
	<SETG QUOTE-FLAG <>>
	<SETG P-OFLAG <>>>

<ROUTINE CANT-USE (PTR "AUX" BUF)
	<COND (<VERB? SAY>
	       <TELL "Hier passiert garnichts." CR>
	       <RFALSE>)>
	;<TELL "You used the word %<">
	<TELL "Du hast das Wort %>"> 
	<WORD-PRINT <GETB <REST ,P-LEXV <SET BUF <* .PTR 2>>> 2>
		    <GETB <REST ,P-LEXV .BUF> 3>>
	<TELL "%< so gebraucht, da%s ich es nicht verstehen kann." CR>
	<SETG QUOTE-FLAG <>>
	<SETG P-OFLAG <>>>

;" Perform syntax matching operations, using P-ITBL as the source of
   the verb and adjectives for this input. Returns false if no
   syntax matches, and does it's own orphaning. If return is true,
   the syntax is saved in P-SYNTAX."

<GLOBAL P-SLOCBITS 0>

<CONSTANT P-SYNLEN 8>

<CONSTANT P-SBITS 0>
<CONSTANT P-SPREP1 1>
<CONSTANT P-SPREP2 2>
<CONSTANT P-SFWIM1 3>
<CONSTANT P-SFWIM2 4>
<CONSTANT P-SLOC1 5>
<CONSTANT P-SLOC2 6>
<CONSTANT P-SACTION 7>
<CONSTANT P-SONUMS 3>

<ROUTINE SYNTAX-CHECK ("AUX" SYN LEN NUM OBJ
		       	    (DRIVE1 <>) (DRIVE2 <>) PREP VERB TMP THE-PREP)
	<COND (<ZERO? <SET VERB <GET ,P-ITBL ,P-VERB>>>
	       <TELL "In diesem Satz fehlt das Verb!" CR>
	       <RFALSE>)>
	<SET SYN <GET ,VERBS <- 255 .VERB>>>
	<SET LEN <GETB .SYN 0>>
	<SET SYN <REST .SYN>>
	<REPEAT ()
		<SET NUM <BAND <GETB .SYN ,P-SBITS> ,P-SONUMS>>
		<COND (<G? ,P-NCN .NUM> T)
		      (<AND <NOT <L? .NUM 1>>
			    <ZERO? ,P-NCN>
			    <OR <ZERO? <SET PREP <GET ,P-ITBL ,P-PREP1>>>
				<EQUAL? .PREP <GETB .SYN ,P-SPREP1>>>>
		       <SET DRIVE1 .SYN>)
		      (<EQUAL? <GETB .SYN ,P-SPREP1> <GET ,P-ITBL ,P-PREP1>>
		       <COND (<AND <EQUAL? .NUM 2> <EQUAL? ,P-NCN 1>>
			      <SET DRIVE2 .SYN>)
			     (<EQUAL? <GETB .SYN ,P-SPREP2>
				   <GET ,P-ITBL ,P-PREP2>>
			      <SYNTAX-FOUND .SYN>
			      <RTRUE>)>)>
		<COND (<DLESS? LEN 1>
		       <COND (<OR .DRIVE1 .DRIVE2> <RETURN>)
			     (T
			      <TELL
"Das Spiel erkennt diesen Satz nicht." CR>
			      <RFALSE>)>)
		      (T <SET SYN <REST .SYN ,P-SYNLEN>>)>>
	<COND (<AND .DRIVE1
		    <SETG GWIM-PRSO? T>
		    <SET OBJ
			 <GWIM <GETB .DRIVE1 ,P-SFWIM1>
			       <GETB .DRIVE1 ,P-SLOC1>
			       <GETB .DRIVE1 ,P-SPREP1>>>>
	       <PUT ,P-PRSO ,P-MATCHLEN 1>
	       <PUT ,P-PRSO 1 .OBJ>
	       <SYNTAX-FOUND .DRIVE1>)
	      (<AND .DRIVE2
		    <SET-GWIM-PRSO?>
		    <SET OBJ
			 <GWIM <GETB .DRIVE2 ,P-SFWIM2>
			       <GETB .DRIVE2 ,P-SLOC2>
			       <GETB .DRIVE2 ,P-SPREP2>>>>
	       <PUT ,P-PRSI ,P-MATCHLEN 1>
	       <PUT ,P-PRSI 1 .OBJ>
	       <SYNTAX-FOUND .DRIVE2>)
	      (<EQUAL? .VERB ,ACT?FIND>
	       <TELL "Diese Frage kann nicht beantwortet werden." CR>
	       <RFALSE>)
	      (<NOT <EQUAL? ,WINNER ,PLAYER>>
	       <CANT-ORPHAN>)
	      (T
	       <ORPHAN .DRIVE1 .DRIVE2>
	       <SET TMP <GET ,P-OTBL ,P-VERBN>>
	       <SETG P-OFLAG T>
	       <COND (.DRIVE1 ;"syntax needs obj after first prep." 
		      ;"print verb"
		      <COND (<EQUAL? .TMP 0> 
			     <TELL "Was?!" CR>
			     <RFALSE>)
			    (<ZERO? <GETB ,P-VTBL 2>>
			     <;PRINTB CAPITALIZE <GET .TMP 0>>)
			    (T
			     <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3> T>;"cap"
			     <PUTB ,P-VTBL 2 0>)>
		      ;<TELL " ">
		             ;"REMEMBER: THE FIRST SYNTAX IN SYNTAX FILE THAT'S
			       FOUND WILL BE THE ONE ORPHANED - but player CAN
			       type only verb and a specific prep"
		             ;"etc., ie, is verb a non-sep? eg, SEH IN OBJ"
		      <SET THE-PREP <GETB .DRIVE1 ,P-SPREP1>>
		      <COND (<NON-SEP? .VERB .THE-PREP>
			     <PREP-PRINT <GETB .DRIVE1 ,P-SPREP1>>
			     <TELL " was">)
			    (T
			     <TELL " was">
			     <PREP-PRINT <GETB .DRIVE1 ,P-SPREP1>>)>)
		     (.DRIVE2 ;"syntax needs an second prep and object"
		              ;"eg, Mit was?"  
		      <TELL "Na ja,">
		      ;"will not CAPITALIZE a prep, somehow - thus T semied"
		      <PREP-PRINT <GETB .DRIVE2 ,P-SPREP2> ;T>
		      <TELL " was">)
		     (T
		      <TELL "Na ja, "> ;"perhaps this ELSE can't happen"
		      <COND (<EQUAL? .TMP 0> 
			     <TELL "was?" CR>
			     <RFALSE>)
			    (<ZERO? <GETB ,P-VTBL 2>>
			     <PRINTB <GET .TMP 0>>)
			    (T
			     <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
			     <PUTB ,P-VTBL 2 0>)>
		      <TELL " was">)>
	       <TELL "?" CR>
	       <RFALSE>)>>

<ROUTINE NON-SEP? (VERB THE-PREP)
	 <COND (<OR <EQUAL? .VERB ,ACT?TRINK ,ACT?SPRING
			    ,ACT?GRAB ,ACT?ISS ,ACT?TRITT 
			    ,ACT?UNTERSUCH ,ACT?SUCH ,ACT?SCHWIMM>
		    <AND <EQUAL? .VERB ,ACT?HOER>
			 <EQUAL? .THE-PREP ,W?NACH>>
		    <AND <EQUAL? .VERB ,ACT?SCHAU>
			 <NOT <EQUAL? .THE-PREP ,W?AN>>>
		    <AND <EQUAL? .VERB ,ACT?STEIG>
			 <EQUAL? .THE-PREP ,W?AUF ,W?DURCH>>
		    <AND <EQUAL? .VERB ,ACT?GEH>
			 <EQUAL? .THE-PREP ,W?DURCH ,W?IN ,W?AUF>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-ORPHAN ()
	 <TELL "%>Ich verstehe das nicht! Worauf beziehst du dich?%<" CR>
	 <RFALSE>>

<ROUTINE ORPHAN (D1 D2 "AUX" (CNT -1))
	<COND (<NOT ,P-MERGED>
	       <PUT ,P-OCLAUSE ,P-MATCHLEN 0>)>
	<PUT ,P-OVTBL 0 <GET ,P-VTBL 0>>
	<PUTB ,P-OVTBL 2 <GETB ,P-VTBL 2>>
	<PUTB ,P-OVTBL 3 <GETB ,P-VTBL 3>>
	<REPEAT ()
		<COND (<IGRTR? CNT ,P-ITBLLEN> <RETURN>)
		      (T <PUT ,P-OTBL .CNT <GET ,P-ITBL .CNT>>)>>
	<COND (<EQUAL? ,P-NCN 2>
	       <PUT ,P-CCTBL ,CC-SBPTR ,P-NC2>
	       <PUT ,P-CCTBL ,CC-SEPTR ,P-NC2L>
	       <PUT ,P-CCTBL ,CC-DBPTR ,P-NC2>
	       <PUT ,P-CCTBL ,CC-DEPTR ,P-NC2L>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL>)>
	<COND (<NOT <L? ,P-NCN 1>>
	       <PUT ,P-CCTBL ,CC-SBPTR ,P-NC1>
	       <PUT ,P-CCTBL ,CC-SEPTR ,P-NC1L>
	       <PUT ,P-CCTBL ,CC-DBPTR ,P-NC1>
	       <PUT ,P-CCTBL ,CC-DEPTR ,P-NC1L>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL>)>
	<COND (.D1
	       <PUT ,P-OTBL ,P-PREP1 <GETB .D1 ,P-SPREP1>>
	       <PUT ,P-OTBL ,P-NC1 1>)
	      (.D2
	       <PUT ,P-OTBL ,P-PREP2 <GETB .D2 ,P-SPREP2>>
	       <PUT ,P-OTBL ,P-NC2 1>)>>

;<ROUTINE CLAUSE-PRINT (BPTR EPTR "OPTIONAL" (THE? T))
	<BUFFER-PRINT <GET ,P-ITBL .BPTR> <GET ,P-ITBL .EPTR> .THE?>>

<ROUTINE THING-PRINT (PRSO? "OPTIONAL" (THE? <>) "AUX" BEG END)
	 <COND (.PRSO?
		<SET BEG <GET ,P-ITBL ,P-NC1>>
		<SET END <GET ,P-ITBL ,P-NC1L>>)
	       (ELSE
		<SET BEG <GET ,P-ITBL ,P-NC2>>
		<SET END <GET ,P-ITBL ,P-NC2L>>)>
	 <BUFFER-PRINT .BEG .END .THE?>>

<ROUTINE BUFFER-PRINT (BEG END CP
		       "AUX" (NOSP T) WRD (FIRST?? T) (PN <>) (Q? <>))
	 <REPEAT ()
		<COND (<EQUAL? .BEG .END> <RETURN>)
		      (T
		       <SET WRD <GET .BEG 0>>
		       <COND ;(<EQUAL? .WRD ,W?$BUZZ> T)
			     (<EQUAL? .WRD ,W?COMMA>
			      <TELL ", ">)
			     (.NOSP <SET NOSP <>>)
			     (ELSE <TELL " ">)>
		       <COND (<EQUAL? .WRD ,W?PERIOD ,W?COMMA>
			      <SET NOSP T>)
			     (<EQUAL? .WRD ,W?MICH>
			      <PRINTD ,ME>
			      <SET PN T>)
			     (<EQUAL? .WRD ,W?INTNUM>
			      <PRINTN ,P-NUMBER>
			      <SET PN T>)
			     (T
			      <COND (<AND .FIRST?? <NOT .PN> .CP>
				     <TELL "the ">)>
			      <COND (<OR ,P-OFLAG ,P-MERGED> <PRINTB .WRD>)
				    (<AND <EQUAL? .WRD ,W?ER ,W?IHN ,W?IHM>
					  <ACCESSIBLE? ,P-HIM-OBJECT>>
				     <PRINTD ,P-HIM-OBJECT>)
				    (<AND <EQUAL? .WRD ,W?SIE ,W?IHR>
					  <ACCESSIBLE? ,P-HER-OBJECT>>
				     <PRINTD ,P-HER-OBJECT>)
				    (<AND <EQUAL? .WRD ,W?ES ,W?IHM>
					  <ACCESSIBLE? ,P-IT-OBJECT>>
				     <PRINTD ,P-IT-OBJECT>)
				    (T
				     <WORD-PRINT <GETB .BEG 2>
						 <GETB .BEG 3>>)>
			      <SET FIRST?? <>>)>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

;"in, e.g. Wishbringer, for preps longer that 6 letters, special case to print"
<ROUTINE PREP-PRINT (PREP "OPT" (CAP? <>) "AUX" WRD)
	 <COND (<ZERO? .PREP>
		<RFALSE>)>
	 <SET WRD <PREP-FIND .PREP>>
	 <COND (.CAP?
		<CAPITALIZE .WRD>)
	       (T
		<TELL " ">
		<PRINTB .WRD>)>>

<ROUTINE CAPITALIZE (PTR)
	 ;<COND (<OR ,P-OFLAG ,P-MERGED> ;"e.g., suspect has no this clause"
		<PRINTB <GET .PTR 0>>)> ;"semied to print, Mit was?"
	 <PRINTC <- <GETB ,P-INBUF <GETB .PTR 3>> 32>>
	 <WORD-PRINT <- <GETB .PTR 2> 1> <+ <GETB .PTR 3> 1>>>

<ROUTINE CLAUSE-COPY (SRC DEST "OPTIONAL" (INSRT <>) "AUX" BEG END)
	<SET BEG <GET .SRC <GET ,P-CCTBL ,CC-SBPTR>>>
	<SET END <GET .SRC <GET ,P-CCTBL ,CC-SEPTR>>>
	<PUT .DEST
	     <GET ,P-CCTBL ,CC-DBPTR>
	     <REST ,P-OCLAUSE
		   <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN> 2>>>
	<REPEAT ()
		<COND (<EQUAL? .BEG .END>
		       <PUT .DEST
			    <GET ,P-CCTBL ,CC-DEPTR>
			    <REST ,P-OCLAUSE
				  <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN>
				     2>>>
		       <RETURN>)
		      (T
		       <COND (<AND .INSRT <EQUAL? ,P-ANAM <GET .BEG 0>>>
			      <CLAUSE-ADD .INSRT>)>
		       <CLAUSE-ADD <GET .BEG 0>>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

<ROUTINE CLAUSE-ADD (WRD "AUX" PTR)
	<SET PTR <+ <GET ,P-OCLAUSE ,P-MATCHLEN> 2>>
	<PUT ,P-OCLAUSE <- .PTR 1> .WRD>
	<PUT ,P-OCLAUSE .PTR 0>
	<PUT ,P-OCLAUSE ,P-MATCHLEN .PTR>>

<ROUTINE PREP-FIND (PREP "AUX" (CNT 0) SIZE)
	<SET SIZE <* <GET ,PREPOSITIONS 0> 2>>
	<REPEAT ()
		<COND (<IGRTR? CNT .SIZE> <RFALSE>)
		      (<EQUAL? <GET ,PREPOSITIONS .CNT> .PREP>
		       <RETURN <GET ,PREPOSITIONS <- .CNT 1>>>)>>>

<ROUTINE SYNTAX-FOUND (SYN)
	<SETG P-SYNTAX .SYN>
	<SETG PRSA <GETB .SYN ,P-SACTION>>>

<GLOBAL P-GWIMBIT 0>

<GLOBAL GWIM-PRSO? <>>

<ROUTINE SET-GWIM-PRSO? ()
	 <SETG GWIM-PRSO? <>>
	 <RTRUE>>
	       
;"it seems most direct objects are in the acc. case and all indirect objects
 are in the dative case; ie, for GWIMing just look at PRSO or PRSI to determine
 case - except for 'talk with troll', listen for bird, listen to bird"
<ROUTINE GWIM (GBIT LBIT PREP "AUX" OBJ VERB THE-PREP ;ACT?FOO)
	<COND (<EQUAL? .GBIT ,KLUDGEBIT>
	       <RETURN ,ROOMS>)>
	<SETG P-GWIMBIT .GBIT>
	<SETG P-SLOCBITS .LBIT>
	<SET VERB <GET ,P-ITBL ,P-VERB>>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<COND (<GET-OBJECT ,P-MERGE <>>
	       <SETG P-GWIMBIT 0>
	       <COND (<EQUAL? <GET ,P-MERGE ,P-MATCHLEN> 1>
		      <SET OBJ <GET ,P-MERGE 1>>
		      <TELL "(">
		      <COND (<AND <NOT <ZERO? .PREP>>
				  <NOT ,P-END-ON-PREP>>
			     <SET THE-PREP <PREP-FIND .PREP>>
			     ;<COND (<EQUAL? .PREP ,W?OUT>
				    <TELL " of">)>
			     ;<TELL " ">
			     <COND (,GWIM-PRSO?
				    <COND (<OR <EQUAL? .VERB ,ACT?SAG 
						       ,ACT?FRAG>
					       <EQUAL? .THE-PREP ,W?MIT ,W?NACH
						   ,W?AUS ,W?ZU ,W?VON>>
					   <COND (<NON-SEP? .VERB .THE-PREP>
					   	  <PRINTB .THE-PREP>
					   	  <TELL " ">
					   	  <TELL DER-DAT .OBJ>)
						 (T
						  <TELL DER-DAT .OBJ>
						  <TELL " ">
						  <PRINTB .THE-PREP>)>)
					  ;"acc prep for prso"
					  (<NON-SEP? .VERB .THE-PREP>
					   <PRINTB .THE-PREP>
					   <TELL " ">
					   <TELL DER-ACC .OBJ>)
					  (T
					   <TELL DER-ACC .OBJ>
					   <TELL " ">
					   <PRINTB .THE-PREP>)>
				    <SETG GWIM-PRSO? <>>)
				  ;"GWIM-PRSI"
				  (<EQUAL? .THE-PREP ,W?MIT ,W?AUS ,W?ZU ,W?VON
					    ,W?NACH>
				    <PRINTB .THE-PREP>
				    <TELL " ">
				    <TELL DER-DAT .OBJ>)
				   (T
				    <PRINTB .THE-PREP>
				    <TELL " ">
				    <TELL DER-ACC .OBJ>)>
			     ;<COND (<EQUAL? .OBJ ,HANDS>
				    <TELL "your hands">)
				   (T
				    <TELL "the " D .OBJ>)>
			     <TELL ")" CR CR>)
			    ;ELSE
			    (<OR <EQUAL? .VERB ,ACT?SAG ,ACT?FRAG>
				 <EQUAL? .THE-PREP ,W?MIT ,W?NACH
						   ,W?AUS ,W?ZU ,W?VON>>
			     <TELL DER-DAT .OBJ ")" CR CR>)
			    (T
			     <TELL DER-ACC .OBJ ")" CR CR>)>
		      .OBJ)>)
	      (T <SETG P-GWIMBIT 0> <RFALSE>)>>

<ROUTINE SNARF-OBJECTS ("AUX" OPTR IPTR L)
	 <PUT ,P-BUTS ,P-MATCHLEN 0>
	 <COND (<NOT <EQUAL? <SET IPTR <GET ,P-ITBL ,P-NC2>> 0>>
		<SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC2>>
		<OR <SNARFEM .IPTR <GET ,P-ITBL ,P-NC2L> ,P-PRSI> <RFALSE>>)>
	 <COND (<NOT <EQUAL? <SET OPTR <GET ,P-ITBL ,P-NC1>> 0>>
		<SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC1>>
		<OR <SNARFEM .OPTR <GET ,P-ITBL ,P-NC1L> ,P-PRSO> <RFALSE>>)>
	 <COND (<NOT <ZERO? <GET ,P-BUTS ,P-MATCHLEN>>>
		<SET L <GET ,P-PRSO ,P-MATCHLEN>>
		<COND (.OPTR <SETG P-PRSO <BUT-MERGE ,P-PRSO>>)>
		<COND (<AND .IPTR
			    <OR <NOT .OPTR>
				<EQUAL? .L <GET ,P-PRSO ,P-MATCHLEN>>>>
		       <SETG P-PRSI <BUT-MERGE ,P-PRSI>>)>)>
	 <RTRUE>>

<ROUTINE BUT-MERGE (TBL "AUX" LEN BUTLEN (CNT 1) (MATCHES 0) OBJ NTBL)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<REPEAT ()
		<COND (<DLESS? LEN 0> <RETURN>)
		      (<ZMEMQ <SET OBJ <GET .TBL .CNT>> ,P-BUTS>)
		      (T
		       <PUT ,P-MERGE <+ .MATCHES 1> .OBJ>
		       <SET MATCHES <+ .MATCHES 1>>)>
		<SET CNT <+ .CNT 1>>>
	<PUT ,P-MERGE ,P-MATCHLEN .MATCHES>
	<SET NTBL ,P-MERGE>
	<SETG P-MERGE .TBL>
	.NTBL>

<GLOBAL P-NAM <>>
<GLOBAL P-ADJ <>>
<GLOBAL P-ADVERB <>>
;<GLOBAL P-ADJN <>>
<GLOBAL P-PRSO <ITABLE NONE 50>>
<GLOBAL P-PRSI <ITABLE NONE 50>>
<GLOBAL P-BUTS <ITABLE NONE 50>>
<GLOBAL P-MERGE <ITABLE NONE 50>>
<GLOBAL P-OCLAUSE <ITABLE NONE 100>>
<GLOBAL P-MATCHLEN 0>
<GLOBAL P-GETFLAGS 0>
<CONSTANT P-ALL 1>
<CONSTANT P-ONE 2>
<CONSTANT P-INHIBIT 4>


<GLOBAL P-AND <>>

<ROUTINE SNARFEM (PTR EPTR TBL "AUX" (BUT <>) LEN WV WRD NW (WAS-ALL <>))
   <SETG P-AND <>>
   <COND (<EQUAL? ,P-GETFLAGS ,P-ALL>
	  <SET WAS-ALL T>)>
   <SETG P-GETFLAGS 0>
   <PUT .TBL ,P-MATCHLEN 0>
   <SET WRD <GET .PTR 0>>
   <REPEAT ()
	   <COND (<EQUAL? .PTR .EPTR>
		  <SET WV <GET-OBJECT <OR .BUT .TBL>>>
		  <COND (.WAS-ALL <SETG P-GETFLAGS ,P-ALL>)>
		  <RETURN .WV>)
		 (T
		  <COND (<==? .EPTR <REST .PTR ,P-WORDLEN>>
			 <SET NW 0>)
			(T <SET NW <GET .PTR ,P-LEXELEN>>)>
		  <COND (<EQUAL? .WRD ,W?ALLES ;,W?BOTH>
			 <SETG P-GETFLAGS ,P-ALL>
			 <COND (<EQUAL? .NW ;,W?OF ;,W?VON ,W?VOLL>
				<SET PTR <REST .PTR ,P-WORDLEN>>)>)
			(<EQUAL? .WRD ,W?ABER ,W?AUSSER ,W?AU\%SER>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 <SET BUT ,P-BUTS>
			 <PUT .BUT ,P-MATCHLEN 0>)
			(<EQUAL? .WRD ;,W?A ;,W?ONE ,W?EIN ,W?EINE ,W?EINEM
				 ,W?EINEN ,W?EINER>
			 <COND (<NOT ,P-ADJ>
				<SETG P-GETFLAGS ,P-ONE>
				<COND (<EQUAL? .NW ;,W?OF ;,W?VON ,W?VOLL>
				       <SET PTR <REST .PTR ,P-WORDLEN>>)>)
			       (T
				<SETG P-NAM ,P-ONEOBJ>
				<OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
				<AND <ZERO? .NW> <RTRUE>>)>)
			(<AND <EQUAL? .WRD ,W?UND ,W?COMMA>
			      <NOT <EQUAL? .NW ,W?UND ,W?COMMA>>>
			 <SETG P-AND T>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 T)
			(<WT? .WRD ,PS?BUZZ-WORD>)
			(<EQUAL? .WRD ,W?UND ,W?COMMA>)
			(<EQUAL? .WRD ;,W?OF ;,W?VON ,W?VOLL>
			 <COND (<ZERO? ,P-GETFLAGS>
				<SETG P-GETFLAGS ,P-INHIBIT>)>)
			(<AND ;<SET WV <WT? .WRD ,PS?ADJECTIVE ,P1?ADJECTIVE>>
			      ;"below replacement line via BZork"
			      <WT? .WRD ,PS?ADJECTIVE>
			      <NOT ,P-ADJ>>
			 <SETG P-ADJ .WRD ;.WV>
			 ;<SETG P-ADJN .WRD>)
			(<WT? .WRD ,PS?OBJECT ,P1?OBJECT>
			 <SETG P-NAM .WRD>
			 <SETG P-ONEOBJ .WRD>)>)>
	   <COND (<NOT <EQUAL? .PTR .EPTR>>
		  <SET PTR <REST .PTR ,P-WORDLEN>>
		  <SET WRD .NW>)>>>

<CONSTANT SH 128>
<CONSTANT SC 64>
<CONSTANT SIR 32>
<CONSTANT SOG 16>
<CONSTANT STAKE 8>
<CONSTANT SMANY 4>
<CONSTANT SHAVE 2>

<ROUTINE GET-OBJECT (TBL
		     "OPTIONAL" (VRB T)
		     "AUX" BITS LEN XBITS TLEN (GCHECK <>) (OLEN 0) OBJ)
	 <SET XBITS ,P-SLOCBITS>
	 <SET TLEN <GET .TBL ,P-MATCHLEN>>
	 <COND (<BTST ,P-GETFLAGS ,P-INHIBIT> <RTRUE>)>
	 <COND (<AND <NOT ,P-NAM> ,P-ADJ>
		<COND (<WT? ,P-ADJ ;N ,PS?OBJECT ,P1?OBJECT>
		       <SETG P-NAM ,P-ADJ ;N>
		       <SETG P-ADJ <>>)
		      ;"added by JEFF or Z3 to make 'go to dir' work"
		      (<SET BITS <WT? ,P-ADJ ;N ,PS?DIRECTION ,P1?DIRECTION>>
		       <SETG P-ADJ <>>
		       <PUT .TBL ,P-MATCHLEN 1>
		       <PUT .TBL 1 ,INTDIR>
		       <SETG P-DIRECTION .BITS>
		       <RTRUE>)>)>
	 <COND (<AND <NOT ,P-NAM>
		     <NOT ,P-ADJ>
		     <NOT <EQUAL? ,P-GETFLAGS ,P-ALL>>
		     <ZERO? ,P-GWIMBIT>>
		<COND (.VRB
		       <TELL
"In diesem Satz scheint ein Substantiv zu fehlen!" CR>)>
		<RFALSE>)>
	 <COND (<OR <NOT <EQUAL? ,P-GETFLAGS ,P-ALL>> <ZERO? ,P-SLOCBITS>>
		<SETG P-SLOCBITS -1>)>
	 <SETG P-TABLE .TBL>
	 <PROG ()
	       <COND (.GCHECK <GLOBAL-CHECK .TBL>)
		     (T
		      <COND (,LIT
			     <FCLEAR ,PLAYER ,TRANSBIT>
			     <DO-SL ,HERE ,SOG ,SIR>
			     <FSET ,PLAYER ,TRANSBIT>)>
		      <DO-SL ,PLAYER ,SH ,SC>)>
	       <SET LEN <- <GET .TBL ,P-MATCHLEN> .TLEN>>
	       <COND (<BTST ,P-GETFLAGS ,P-ALL>)
		     (<AND <BTST ,P-GETFLAGS ,P-ONE>
			   <NOT <ZERO? .LEN>>>
		      <COND (<NOT <EQUAL? .LEN 1>>
			     <PUT .TBL 1 <GET .TBL <RANDOM .LEN>>>
			     <TELL "(">
			     <PRINTD <GET .TBL 1>>
			     <TELL "?)" CR>)>
		      <PUT .TBL ,P-MATCHLEN 1>)
		     (<OR <G? .LEN 1>
			  <AND <ZERO? .LEN> <NOT <EQUAL? ,P-SLOCBITS -1>>>>
		      <COND (<EQUAL? ,P-SLOCBITS -1>
			     <SETG P-SLOCBITS .XBITS>
			     <SET OLEN .LEN>
			     <PUT .TBL
				  ,P-MATCHLEN
				  <- <GET .TBL ,P-MATCHLEN> .LEN>>
			     <AGAIN>)
			    (T
			     <COND (<ZERO? .LEN> <SET LEN .OLEN>)>
			     <COND (<NOT <EQUAL? ,WINNER ,PLAYER>>
				    <CANT-ORPHAN>
				    <RFALSE>)
				   (<AND .VRB ,P-NAM>
				    <WHICH-PRINT .TLEN .LEN .TBL>
				    <SETG P-ACLAUSE
					  <COND (<EQUAL? .TBL ,P-PRSO> ,P-NC1)
						(T ,P-NC2)>>
				    <SETG P-AADJ ,P-ADJ>
				    <SETG P-ANAM ,P-NAM>
				    <ORPHAN <> <>>
				    <SETG P-OFLAG T>)
				   (.VRB
				    <TELL
"In diesem Satz scheint ein Substantiv zu fehlen!" CR>)>
			     <SETG P-NAM <>>
			     <SETG P-ADJ <>>
			     <RFALSE>)>)>
	       <COND (<AND <ZERO? .LEN> .GCHECK>
		      <COND (.VRB
			     ;"next added 1/2/85 by JW"
			     <SETG P-SLOCBITS .XBITS>
			     <COND (<OR ,LIT <VERB? TELL ;WHERE ;WHAT ;WHO>>
				    ;"Changed 6/10/83 - MARC"
				    <OBJ-FOUND ,NOT-HERE-OBJECT .TBL>
				    <SETG P-XNAM ,P-NAM>
				    <SETG P-XADJ ,P-ADJ>
				    ;<SETG P-XADJN ,P-ADJN>
				    <SETG P-NAM <>>
				    <SETG P-ADJ <>>
				    ;<SETG P-ADJN <>>
				    <RTRUE>)
				   (T <TELL 
"Es ist zu dunkel, um das zu sehen." CR>)>)>
		      <SETG P-NAM <>>
		      <SETG P-ADJ <>>
		      <RFALSE>)
		     (<ZERO? .LEN> <SET GCHECK T> <AGAIN>)>
	       <SETG P-SLOCBITS .XBITS>
	       <SETG P-NAM <>>
	       <SETG P-ADJ <>>
	       <RTRUE>>>

<GLOBAL P-XNAM <>>
<GLOBAL P-XADJ <>>
;<GLOBAL P-XADJN <>>

;"If the possible matching syns for an object are all the same gender,
then you could just check gender of the first object found to determine
'Welcher, Welches, or Welche'" 
<ROUTINE WHICH-PRINT (TLEN LEN TBL "AUX" OBJ RLEN)
	 <SET RLEN .LEN>
	 <TELL "Welche">
         <SET TLEN <+ .TLEN 1>>
	 <SET OBJ <GET .TBL .TLEN>>
	 <COND (;<EQUAL? <GETP .OBJ ,P?GENDER> 1>
	        <FSET? .OBJ ,DERBIT>
		<TELL "r">)
	       (;<EQUAL? <GETP .OBJ ,P?GENDER> 3>
	         <FSET? .OBJ ,DASBIT>
		 <TELL "s">)>
	 ;<TELL " ">
	 <COND (<OR ,P-OFLAG ,P-MERGED ,P-AND>
		<COND (,P-NAM
		       <TELL " ">
		       <PRINTB ,P-NAM>)
		      (,P-ADJ 
		       <TELL " ">
		       <PRINTB ,P-ADJ ;N>)
		      ;(ELSE <PRINTB ,W?ONE>)>)
	       (ELSE
		<TELL " ">
		<THING-PRINT <EQUAL? .TBL ,P-PRSO>>)>
	 <TELL " meinst du, ">
	 <REPEAT ()
		 <TELL DER-ACC .OBJ>
		 <SET TLEN <+ .TLEN 1>> ;"this and next line used above TELL"
		 <SET OBJ <GET .TBL .TLEN>>
		 <COND (<EQUAL? .LEN 2>
		        <COND (<NOT <EQUAL? .RLEN 2>> <TELL ",">)>
		        <TELL " or ">)
		       (<G? .LEN 2> <TELL ", ">)>
		 <COND (<L? <SET LEN <- .LEN 1>> 1>
		        <TELL "?" CR>
		        <RETURN>)>>>

<ROUTINE GLOBAL-CHECK (TBL "AUX" LEN RMG RMGL (CNT 0) OBJ OBITS FOO)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<SET OBITS ,P-SLOCBITS>
	<COND (<SET RMG <GETPT ,HERE ,P?GLOBAL>>
	       <SET RMGL <- </ <PTSIZE .RMG> 2> 1>>
	       <REPEAT ()
		       <COND (<THIS-IT? <SET OBJ <GET .RMG .CNT>> .TBL>
			      <OBJ-FOUND .OBJ .TBL>)>
		       <COND (<IGRTR? CNT .RMGL> <RETURN>)>>)>
	;<COND (<SET RMG <GETPT ,HERE ,P?PSEUDO>>
	       <SET RMGL <- </ <PTSIZE .RMG> 4> 1>>
	       <SET CNT 0>
	       <REPEAT ()
		       <COND (<EQUAL? ,P-NAM <GET .RMG <* .CNT 2>>>
			      <PUTP ,PSEUDO-OBJECT
				    ,P?ACTION
				    <GET .RMG <+ <* .CNT 2> 1>>>
			      <SET FOO
				   <BACK <GETPT ,PSEUDO-OBJECT ,P?ACTION> 5>>
			      <PUT .FOO 0 <GET ,P-NAM 0>>
			      <PUT .FOO 1 <GET ,P-NAM 1>>
			      <OBJ-FOUND ,PSEUDO-OBJECT .TBL>
			      <RETURN>)
		             (<IGRTR? CNT .RMGL> <RETURN>)>>)>
	<COND (<EQUAL? <GET .TBL ,P-MATCHLEN> .LEN>
	       <SETG P-SLOCBITS -1>
	       <SETG P-TABLE .TBL>
	       <DO-SL ,GLOBAL-OBJECTS 1 1>
	       <SETG P-SLOCBITS .OBITS>
	       <COND (<AND <ZERO? <GET .TBL ,P-MATCHLEN>>
			   <EQUAL? ,PRSA ,V?LOOK-INSIDE ,V?SEARCH ,V?EXAMINE>>
		      <DO-SL ,ROOMS 1 1>)>)>>

<ROUTINE DO-SL (OBJ BIT1 BIT2 "AUX" BTS)
	<COND (<BTST ,P-SLOCBITS <+ .BIT1 .BIT2>>
	       <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCALL>)
	      (T
	       <COND (<BTST ,P-SLOCBITS .BIT1>
		      <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCTOP>)
		     (<BTST ,P-SLOCBITS .BIT2>
		      <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCBOT>)
		     (T <RTRUE>)>)>>

<CONSTANT P-SRCBOT 2>
<CONSTANT P-SRCTOP 0>
<CONSTANT P-SRCALL 1>

<ROUTINE SEARCH-LIST (OBJ TBL LVL "AUX" FLS NOBJ)
	<COND (<SET OBJ <FIRST? .OBJ>>
	       <REPEAT ()
		       <COND (<AND <NOT <EQUAL? .LVL ,P-SRCBOT>>
				   <GETPT .OBJ ,P?SYNONYM>
				   <THIS-IT? .OBJ .TBL>>
			      <OBJ-FOUND .OBJ .TBL>)>
		       <COND (<AND <OR <NOT <EQUAL? .LVL ,P-SRCTOP>>
				       <FSET? .OBJ ,SEARCHBIT>
				       <FSET? .OBJ ,SURFACEBIT>>
				   <SET NOBJ <FIRST? .OBJ>>
				   <OR <FSET? .OBJ ,OPENBIT>
				       <FSET? .OBJ ,TRANSBIT>>>
			      <SET FLS
				   <SEARCH-LIST .OBJ
						.TBL
						<COND (<FSET? .OBJ ,SURFACEBIT>
						       ,P-SRCALL)
						      (<FSET? .OBJ ,SEARCHBIT>
						       ,P-SRCALL)
						      (T ,P-SRCTOP)>>>)>
		       <COND (<SET OBJ <NEXT? .OBJ>>) (T <RETURN>)>>)>>

<ROUTINE OBJ-FOUND (OBJ TBL "AUX" PTR)
	<SET PTR <GET .TBL ,P-MATCHLEN>>
	<PUT .TBL <+ .PTR 1> .OBJ>
	<PUT .TBL ,P-MATCHLEN <+ .PTR 1>>>

<ROUTINE TAKE-CHECK ()
	<AND <ITAKE-CHECK ,P-PRSO <GETB ,P-SYNTAX ,P-SLOC1>>
	     <ITAKE-CHECK ,P-PRSI <GETB ,P-SYNTAX ,P-SLOC2>>>>

<ROUTINE ITAKE-CHECK (TBL IBITS "AUX" PTR OBJ TAKEN)
	 #DECL ((TBL) TABLE (IBITS PTR) FIX (OBJ) OBJECT
		(TAKEN) <OR FALSE FIX ATOM>)
	 <COND (<AND <SET PTR <GET .TBL ,P-MATCHLEN>>
		     <OR <BTST .IBITS ,SHAVE>
			 <BTST .IBITS ,STAKE>>>
		<REPEAT ()
			<COND (<L? <SET PTR <- .PTR 1>> 0> <RETURN>)
			      (T
			       <SET OBJ <GET .TBL <+ .PTR 1>>>
			       <COND (<EQUAL? .OBJ ,HIM>
			  	      <COND (<NOT <ACCESSIBLE? ,P-HIM-OBJECT>>
				 	     <REFERRING>
					     <RFALSE>)
					    (T
					     <SET OBJ ,P-HIM-OBJECT>)>)
				      (<EQUAL? .OBJ ,HER>
			  	       <COND (<NOT <ACCESSIBLE? ,P-HER-OBJECT>>
				 	      <REFERRING>
					      <RFALSE>)
					     (T
					      <SET OBJ ,P-HER-OBJECT>)>)
				      (<EQUAL? .OBJ ,IT>
			  	       <COND (<NOT <ACCESSIBLE? ,P-IT-OBJECT>>
				 	      <REFERRING>
					      <RFALSE>)
					     (T
					      <SET OBJ ,P-IT-OBJECT>)>)>
			       <COND (<AND <NOT <HELD? .OBJ>>
					   <NOT <EQUAL? .OBJ ,HANDS ,ME>>>
				      <SETG PRSO .OBJ>
				      <COND (<FSET? .OBJ ,TRYTAKEBIT>
					     <SET TAKEN T>)
					    (<NOT <EQUAL? ,WINNER ,ADVENTURER>>
					     <SET TAKEN <>>)
					    (<AND <BTST .IBITS ,STAKE>
						  <EQUAL? <ITAKE <>> T>>
					     <SET TAKEN <>>)
					    (T <SET TAKEN T>)>
				      <COND (<AND .TAKEN
						  <BTST .IBITS ,SHAVE>
						  <EQUAL? ,WINNER
							  ,ADVENTURER>>
					     <COND (<EQUAL? .OBJ
							    ,NOT-HERE-OBJECT>
						    <TELL
"Das hast du nicht!" CR>
						    <RFALSE>)>
					     <TELL 
"Du hast " DER-ACC .OBJ " nicht." CR>
					     ;<TELL "You don't have the ">
					     ;<PRINTD .OBJ>
					     ;<TELL "." CR>
					     <RFALSE>)
					    (<AND <NOT .TAKEN>
						  <EQUAL? ,WINNER ,ADVENTURER>>
					     ;<TELL 
"(taking " DER-ACC .OBJ " first)" CR>
					     <TELL 
"(" DER-ACC-CAP .OBJ " erst nehmen)" CR>)>)>)>>)
	       (T)>>

<ROUTINE REFERRING ()
	 <TELL "Es ist nicht klar, worauf du dich beziehst." CR>> 

<ROUTINE MANY-CHECK ("AUX" (LOSS <>) TMP)
	<COND (<AND <G? <GET ,P-PRSO ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC1> ,SMANY>>>
	       <SET LOSS 1>)
	      (<AND <G? <GET ,P-PRSI ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC2> ,SMANY>>>
	       <SET LOSS 2>)>
	<COND (.LOSS
	       ;<TELL "You can't use multiple ">
	       <TELL 
"Man kann mehrere "> 
	       <COND (<EQUAL? .LOSS 2> <TELL "Dative">)
		     (T
		      <TELL "Akkusitiv">)>
	       <TELL " nicht mit %>">
	       <SET TMP <GET ,P-ITBL ,P-VERBN>>
	       <COND (<ZERO? .TMP> <TELL "das">)
		     (<OR ,P-OFLAG ,P-MERGED>
		      <PRINTB <GET .TMP 0>>)
		     (T
		      <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>
	       <TELL "%< gebrauchen." CR>
	       <RFALSE>)
	      (T)>>

<ROUTINE ZMEMQ (ITM TBL "OPTIONAL" (SIZE -1) "AUX" (CNT 1))
	<COND (<NOT .TBL> <RFALSE>)>
	<COND (<NOT <L? .SIZE 0>> <SET CNT 0>)
	      (ELSE <SET SIZE <GET .TBL 0>>)>
	<REPEAT ()
		<COND (<EQUAL? .ITM <GET .TBL .CNT>>
		       <RETURN <REST .TBL <* .CNT 2>>>)
		      (<IGRTR? CNT .SIZE> <RFALSE>)>>>

;<ROUTINE ZMEMQB (ITM TBL SIZE "AUX" (CNT 0))
	<REPEAT ()
		<COND (<EQUAL? .ITM <GETB .TBL .CNT>>
		       <RTRUE>)
		      (<IGRTR? CNT .SIZE>
		       <RFALSE>)>>>

<GLOBAL ALWAYS-LIT <>>

<ROUTINE LIT? (RM "OPTIONAL" (RMBIT T) "AUX" OHERE (LIT <>))
	<COND (<AND ,ALWAYS-LIT <EQUAL? ,WINNER ,PLAYER>>
	       <RTRUE>)>
	<SETG P-GWIMBIT ,ONBIT>
	<SET OHERE ,HERE>
	<SETG HERE .RM>
	<COND (<AND .RMBIT
		    <FSET? .RM ,ONBIT>>
	       <SET LIT T>)
	      (T
	       <PUT ,P-MERGE ,P-MATCHLEN 0>
	       <SETG P-TABLE ,P-MERGE>
	       <SETG P-SLOCBITS -1>
	       <COND (<EQUAL? .OHERE .RM>
		      <DO-SL ,WINNER 1 1>
		      <COND (<AND <NOT <EQUAL? ,WINNER ,PLAYER>>
				  <IN? ,PLAYER .RM>>
			     <DO-SL ,PLAYER 1 1>)>)>
	       <DO-SL .RM 1 1>
	       <COND (<G? <GET ,P-TABLE ,P-MATCHLEN> 0> <SET LIT T>)>)>
	<SETG HERE .OHERE>
	<SETG P-GWIMBIT 0>
	.LIT>

;<ROUTINE PRSO-PRINT ("AUX" PTR)
	 <COND (<OR ,P-MERGED
		    <EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC1>> 0> ,W?ES>>
		<TELL " " D ,PRSO>)
	       (T <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC1L> <>>)>>

;<ROUTINE PRSI-PRINT ("AUX" PTR)
	 <COND (<OR ,P-MERGED
		    <EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC2>> 0> ,W?ES>>
		<TELL " " D ,PRSO>)
	       (T <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC2L> <>>)>>

;"old zork1 version w/ switch"
<ROUTINE THIS-IT? (OBJ TBL "AUX" SYNS)
 <COND (<FSET? .OBJ ,INVISIBLE> <RFALSE>)
       (<AND ,P-NAM
	     <NOT <ZMEMQ ,P-NAM
			 <SET SYNS <GETPT .OBJ ,P?SYNONYM>>
			 <- </ <PTSIZE .SYNS> 2> 1>>>>
	<RFALSE>)
       (<AND ,P-ADJ
	     <OR <NOT <SET SYNS <GETPT .OBJ ,P?ADJECTIVE>>>
		 ;<NOT <ZMEMQB ,P-ADJ .SYNS <- <PTSIZE .SYNS> 1>>>
		 <NOT %<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
			      '<ZMEMQ  ,P-ADJ .SYNS <RMGL-SIZE .SYNS>>)
			     (T
			      '<ZMEMQB ,P-ADJ .SYNS <RMGL-SIZE .SYNS>>)>>>>
	<RFALSE>)
       (<AND <NOT <ZERO? ,P-GWIMBIT>> <NOT <FSET? .OBJ ,P-GWIMBIT>>>
	<RFALSE>)>
 <RTRUE>>

<ROUTINE ACCESSIBLE? (OBJ "AUX" L) ;"can player TOUCH object?"
	 ;"revised 5/2/84 by SEM and SWG"
	 <COND (<NOT .OBJ>
		<RFALSE>)
	       (T
		<SET L <LOC .OBJ>>)>
	 <COND (<NOT .L>
		<RFALSE>)
	       (<FSET? .OBJ ,INVISIBLE>
		<RFALSE>)
	       ;(<EQUAL? .OBJ ,PSEUDO-OBJECT>
		<COND (<EQUAL? ,LAST-PSEUDO-LOC ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<NOT .L>
		<RFALSE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<RTRUE>)
	       (<AND <EQUAL? .L ,LOCAL-GLOBALS>
		     <GLOBAL-IN? .OBJ ,HERE>>
		<RTRUE>)
	       (<NOT <EQUAL? <META-LOC .OBJ> ,HERE <LOC ,WINNER>>>
		<RFALSE>)
	       (<EQUAL? .L ,WINNER ,HERE <LOC ,WINNER>>
		<RTRUE>)
	       (<AND <FSET? .L ,OPENBIT>
		     <ACCESSIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE META-LOC (OBJ)
	 <REPEAT ()
		 <COND (<NOT .OBJ>
			<RFALSE>)
		       (<IN? .OBJ ,GLOBAL-OBJECTS>
			<RETURN ,GLOBAL-OBJECTS>)>
		 <COND (<IN? .OBJ ,ROOMS>
			<RETURN .OBJ>)
		       (T
			<SET OBJ <LOC .OBJ>>)>>>
