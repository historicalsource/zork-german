"HINTS for GERMAN ZORK - (VIA SHERLOCK)
(c) Copyright 1987 Infocom, Inc.  All Rights Reserved."

<FILE-FLAGS CLEAN-STACK?>

<GLOBAL HINT-WARNING <>>

<GLOBAL HINTS-OFF <>>

<ROUTINE V-HINT ("AUX" CHR MAXC (C <>) Q WHO)
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

;"longest hint topic can be 17 chars"
<GLOBAL HINTS
	<PLTABLE
	 <PLTABLE
	  "The Lair"	  
	  <PLTABLE
	   "How can I stop Moriarty's henchman 1 ?"
	   "Knock him out first."
	   "Perhaps you could smuggle something in."
	   "Have you noticed the henchman's religion, and that this answer should still wrap around, eh, eh??"
	   "He probably won't disturb your hat."
	   "Perhaps the etherium ampoule....">
	  <PLTABLE
	   "How can I stop Moriarty's henchman 2 ?"
	   "Knock him out first."
	   "Perhaps you could smuggle something in."
	   "Have you noticed the henchman's religion, and that this answer should still wrap around, eh, eh??"
	   "He probably won't disturb your hat."
	   "Perhaps the etherium ampoule....">>
	  <PLTABLE
	   "Brian M..."
	   <PLTABLE
	   "How do I keep Moriarty from winning when I wake up?"
	   "If he is free to move around, he will always win."
	   "Tie him up."
	   "Don't forget to tie up the henchman, too.">>
	 <PLTABLE
	  "Miscellaneus"
	  <PLTABLE
	   "What is the square root of 64?"
	   "Eight.">>
	 <PLTABLE 
	  "Another Fine Mess"
	  <PLTABLE 
	   "This is anther mess, etc. and so weiter."
	   "This is anther mess, etc. and so weiter.">>>>

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
