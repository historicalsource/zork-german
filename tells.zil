"TELLS (formerly GMACROS) for
			    The Zork Trilogy
	 (c) Copyright 1983 Infocom, Inc. All Rights Reserved
	 -- GERMAN EDITION"

<SETG C-ENABLED? 0>
<SETG C-ENABLED 1>
<SETG C-DISABLED 0>

<TELL-TOKENS (CRLF CR)     <CRLF>
	     D *           <DPRINT .X <>>
	     N *           <PRINTN .X>
	     C *           <PRINTC .X>
	     DER-NOM *	   <DER-NOM-PRINT .X>
	     DER-NOM-CAP * <DER-NOM-CAP-PRINT .X>
	     DER-ACC *	   <DER-ACC-PRINT .X>
	     DER-ACC-CAP * <DER-ACC-CAP-PRINT .X>
	     DER-DAT *	   <DER-DAT-PRINT .X>
	     
	     EIN-NOM *	   <EIN-NOM-PRINT .X>
	     EIN-NOM-CAP * <EIN-NOM-CAP-PRINT .X>
	     EIN-ACC *	   <EIN-ACC-PRINT .X>
	     EIN-ACC-CAP * <EIN-ACC-CAP-PRINT .X>
	     EIN-DAT *     <EIN-DAT-PRINT .X>
	     
	     PRONOUN-NOM *     <PRONOUN-NOM-PRINT .X>
	     PRONOUN-NOM-CAP * <PRONOUN-NOM-CAP-PRINT .X>
	     PRONOUN-ACC *     <PRONOUN-ACC-PRINT .X>>

;"German character names. For non-C64 machines, the font is switched to
font-3 then these chars. below are printed, then, the font is switched
back to font-1, the default font."

;"I could have special umlaut-descs and no pure strings in the game -- but
still there would have to be this switching of fonts WITHIN a word. Which
must be done in some funny TELL routine."

;"Or I could be REALLY REALLY disgusting and have 3 descs for an object -- 
the first half of the word, the flavor of umlaut, then the last half
of the word." 

<ROUTINE DO-CURSET (Y X)
	 <COND (<EQUAL? 1 ,CWIDTH ,CHEIGHT>
		<CURSET .Y .X>
		<RFALSE>)
	       (T
		<SET X <* .X ,CWIDTH>>
		<CURSET <* .Y ,CHEIGHT> .X>
		<RFALSE>)>>

;"CASE : DER = NOM / DEN = ACC / DEM = DAT
         EIN = NOM / EINEN = ACC / EINEM = DAT"

<ROUTINE DPRINT (OBJ CASE) 
	 <COND (<GETP .OBJ ,P?ADJDESC>
	        <TELL <GETP .OBJ ,P?ADJDESC>>
		<COND ;"is a Der-word"
		      (<EQUAL? .CASE ,W?DER ,W?DEN ,W?DEM> 
		       <COND (<OR <EQUAL? .CASE ,W?DER>
				  <AND <EQUAL? .CASE ,W?DEN>
				       ;<EQUAL? <GETP .OBJ ,P?GENDER> ,W?DER>
				       <NOT <FSET? .OBJ ,DERBIT>>>>
			      <PRINTI "e">)
			     (T
			      <PRINTI "en">)>)
		      ;"is an Ein-word"
		      (;<EQUAL? <GETP .OBJ ,P?GENDER> ,W?DER>
		       <FSET? .OBJ ,DERBIT>
		       <PRINTI "er">)
		      (<AND ;<EQUAL? <GETP .OBJ ,P?GENDER> ,W?DAS>
			    <FSET? .OBJ ,DASBIT>
			    <NOT <EQUAL? .CASE ,W?EINEM>>>
		       <PRINTI "es">)
		      (<AND ;<EQUAL? <GETP .OBJ ,P?GENDER> ,W?DIE>
			    <FSET? .OBJ ,DIEBIT>
			    <EQUAL? .CASE ,W?EINEM>>
		       <PRINTI "e">)
		      (T
		       <PRINTI "en">)>
		<TELL " ">)>
	 <PRINTD .OBJ>>

;<ROUTINE IS-FEM? (OBJ)
	 <COND (<AND <NOT <FSET? .OBJ ,DERBIT>>
		     <NOT <FSET? .OBJ ,DASBIT>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE DER-NOM-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "der ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "die ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "das ">)>
	<DPRINT .OBJ ,W?DER>>

<ROUTINE DER-NOM-CAP-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "Der ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "Die ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "Das ">)>
	<DPRINT .OBJ ,W?DER>> 

<ROUTINE DER-ACC-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "den ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "die ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "das ">)>
	<DPRINT .OBJ ,W?DEN>>

<ROUTINE DER-ACC-CAP-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "Den ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "Die ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "Das ">)>
	<DPRINT .OBJ ,W?DEN>> 

<ROUTINE DER-DAT-PRINT (OBJ)
	<COND (<OR <FSET? .OBJ ,DERBIT>
		   <FSET? .OBJ ,DASBIT>>
	       <TELL "dem ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "der ">)>
	<DPRINT .OBJ ,W?DEM>>

<ROUTINE EIN-NOM-PRINT (OBJ)
	<COND (<OR <FSET? .OBJ ,DERBIT>
		   <FSET? .OBJ ,DASBIT>>
	       <TELL "ein ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "eine ">)>
	<DPRINT .OBJ ,W?EIN>>

<ROUTINE EIN-NOM-CAP-PRINT (OBJ)
	<COND (<OR <FSET? .OBJ ,DASBIT>
	           <FSET? .OBJ ,DERBIT>>
	       <TELL "Ein ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "Eine ">)>
	<DPRINT .OBJ ,W?EIN>>

<ROUTINE EIN-ACC-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "einen ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "eine ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "ein ">)>
	<DPRINT .OBJ ,W?EINEN>>

<ROUTINE EIN-ACC-CAP-PRINT (OBJ)
	<COND (<FSET? .OBJ ,DERBIT>
	       <TELL "Einen ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "Eine ">)
	      (<FSET? .OBJ ,DASBIT>
	       <TELL "Ein ">)>
	<DPRINT .OBJ ,W?EINEN>>

<ROUTINE EIN-DAT-PRINT (OBJ)
	<COND (<OR <FSET? .OBJ ,DERBIT>
		   <FSET? .OBJ ,DASBIT>>
	       <TELL "einem ">)
	      (<FSET? .OBJ ,DIEBIT>
	       <TELL "einer ">)>
	<DPRINT .OBJ ,W?EINEM>>

<ROUTINE PRONOUN-NOM-PRINT (OBJ)
	 <COND (<FSET? .OBJ ,DERBIT>
		<TELL "er">)
	       (<FSET? .OBJ ,DASBIT>
		<TELL "es">)
	       (<FSET? .OBJ ,DIEBIT>
		<TELL "sie">)
	       (T
		<TELL "es">)>>

<ROUTINE PRONOUN-NOM-CAP-PRINT (OBJ)
	 <COND (<FSET? .OBJ ,DERBIT>
		<TELL "Er">)
	       (<FSET? .OBJ ,DIEBIT>
		<TELL "Sie">)
	       (T
		<TELL "Es">)>>

<ROUTINE PRONOUN-ACC-PRINT (OBJ)
	 <COND (<FSET? .OBJ ,DERBIT>
		<TELL "ihn">)
	       (<FSET? .OBJ ,DIEBIT>
		<TELL "sie">)
	       (T
		<TELL "es">)>>	       

<DEFMAC VERB? ("ARGS" ATMS)
	<MULTIFROB PRSA .ATMS>>

<DEFMAC PRSO? ("ARGS" ATMS)
	<MULTIFROB PRSO .ATMS>>

<DEFMAC PRSI? ("ARGS" ATMS)
	<MULTIFROB PRSI .ATMS>>

<DEFMAC ROOM? ("ARGS" ATMS)
	<MULTIFROB HERE .ATMS>>

<DEFINE MULTIFROB (X ATMS "AUX" (OO (OR)) (O .OO) (L ()) ATM) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .OO 1> <ERROR .X>)
				       (<LENGTH? .OO 2> <NTH .OO 2>)
				       (ELSE <CHTYPE .OO FORM>)>>)>
		<REPEAT ()
			<COND (<EMPTY? .ATMS> <RETURN!->)>
			<SET ATM <NTH .ATMS 1>>
			<SET L
			     (<COND (<TYPE? .ATM ATOM>
				     <FORM GVAL
					   <COND (<==? .X PRSA>
						  <PARSE
						    <STRING "V?"
							    <SPNAME .ATM>>>)
						 (ELSE .ATM)>>)
				    (ELSE .ATM)>
			      !.L)>
			<SET ATMS <REST .ATMS>>
			<COND (<==? <LENGTH .L> 3> <RETURN!->)>>
		<SET O <REST <PUTREST .O (<FORM EQUAL? <FORM GVAL .X> !.L>)>>>
		<SET L ()>>>

<DEFMAC BSET ('OBJ "ARGS" BITS)
	<MULTIBITS FSET .OBJ .BITS>>

<DEFMAC BCLEAR ('OBJ "ARGS" BITS)
	<MULTIBITS FCLEAR .OBJ .BITS>>

<DEFMAC BSET? ('OBJ "ARGS" BITS)
	<MULTIBITS FSET? .OBJ .BITS>>

<DEFINE MULTIBITS (X OBJ ATMS "AUX" (O ()) ATM) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .O 1> <NTH .O 1>)
				       (<==? .X FSET?> <FORM OR !.O>)
				       (ELSE <FORM PROG () !.O>)>>)>
		<SET ATM <NTH .ATMS 1>>
		<SET ATMS <REST .ATMS>>
		<SET O
		     (<FORM .X
			    .OBJ
			    <COND (<TYPE? .ATM FORM> .ATM)
				  (ELSE <FORM GVAL .ATM>)>>
		      !.O)>>>

<DEFMAC RFATAL ()
	'<PROG () <PUSH 2> <RSTACK>>>

<DEFMAC PROB ('BASE? "OPTIONAL" 'LOSER?)
	<COND (<ASSIGNED? LOSER?> <FORM ZPROB .BASE?>)
	      (ELSE <FORM G? .BASE? '<RANDOM 100>>)>>

<ROUTINE ZPROB
	 (BASE)
	 <COND (,LUCKY <G? .BASE <RANDOM 100>>)
	       (ELSE <G? .BASE <RANDOM 300>>)>>

<ROUTINE RANDOM-ELEMENT (FROB)
	 <GET .FROB <RANDOM <GET .FROB 0>>>>

<ROUTINE PICK-ONE (FROB
		   "AUX" L ;<GET .FROB 0> CNT ;<GET .FROB 1> RND MSG RFROB)
	 <SET L <GET .FROB 0>>
	 <SET CNT <GET .FROB 1>>
	 <SET L <- .L 1>>
	 <SET FROB <REST .FROB 2>>
	 <SET RFROB <REST .FROB <* .CNT 2>>>
	 <SET RND <RANDOM <- .L .CNT>>>
	 <SET MSG <GET .RFROB .RND>>
	 <PUT .RFROB .RND <GET .RFROB 1>>
	 <PUT .RFROB 1 .MSG>
	 <SET CNT <+ .CNT 1>>
	 <COND (<==? .CNT .L> <SET CNT 0>)>
	 <PUT .FROB 0 .CNT>
	 .MSG>

<DEFMAC ENABLE ('INT) <FORM PUT .INT ,C-ENABLED? 1>>

<DEFMAC DISABLE ('INT) <FORM PUT .INT ,C-ENABLED? 0>>

<DEFMAC FLAMING? ('OBJ)
	<FORM AND <FORM FSET? .OBJ ',FLAMEBIT>
	          <FORM FSET? .OBJ ',ONBIT>>>

<DEFMAC OPENABLE? ('OBJ)
	<FORM OR <FORM FSET? .OBJ ',DOORBIT>
	         <FORM FSET? .OBJ ',CONTBIT>>> 

<DEFMAC ABS ('NUM)
	<FORM COND (<FORM L? .NUM 0> <FORM - 0 .NUM>)
	           (T .NUM)>>

<DEFMAC RMGL-SIZE ('TBL)
	<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
	       <FORM - <FORM / <FORM PTSIZE .TBL> 2> 1>)
	      (T <FORM - <FORM PTSIZE .TBL> 1>)>>

;<DEFMAC GET/B ('TBL 'PTR)
	<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
	       <FORM GET .TBL .PTR>)
	      (T <FORM GETB .TBL .PTR>)>>

;<DEFMAC PUT/B ('TBL 'PTR 'OBJ)
	<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
	       <FORM PUT .TBL .PTR .OBJ>)
	      (T <FORM PUTB .TBL .PTR .OBJ>)>>

;<DEFMAC ZMEMQ/B ('OBJ 'TBL "OPT" ('SIZ <>))
	<COND (<AND <GASSIGNED? PLUS-MODE> ,PLUS-MODE>
	       <COND (<NOT .SIZ>
		      <FORM ZMEMQ .OBJ .TBL>)
		     (T <FORM ZMEMQ .OBJ .TBL .SIZ>)>)
	      (T
	       <COND (<NOT .SIZ>
		      <FORM ZMEMQB .OBJ .TBL>)
		     (T <FORM ZMEMQB .OBJ .TBL .SIZ>)>)>>