/*	zstring.c	String operations

	1988 Zinn Computer Company, for Infocom


Contained in this file:

	addfstr		Add string to frequent-string table
	zstr		Translate ASCII to Z-string
	zstrlen		Return # of words in a Z-string
	zword		Translate ASCII to Zword-string
	
*/

#include <stdio.h>
#include <fcntl.h>

#include "zap.h"


/* Local definitions */


/* External routines */

extern	char	*CALLOC();
extern  char	*REALLOC();
extern  char    *MALLOC();

/* External data */

extern	BOOL	Permshift;
extern 	int		Max_buf_len;
extern  int character_count;
extern  long character_counts[];
extern int build_freq;
extern char language_char;
extern unsigned char *language_table;

/* Local routines (and forward references) */


/* Local data */


/* Private data */

static	int	FreqC = 0;		/* Number of frequent strings */
static	UBYTE	*Zstrbuf = NULL;
static 	int Zstrbuf_size = 0;

static	struct freq_node {			/* Frequent string table */
	  int	fs_len;			/* Length of string */
	  char	*fs_strP;		/* Ptr to string */
	  int   fs_num;
	  struct freq_node *next;
	}  *Freqstr[256];               /* We assume this is initialized to 0 */

static	struct {			/* Character set codes */
	  UBYTE	zc_set;			/* Set number */
	  UBYTE	zc_char;		/* Character value */
	}	Zctbl[256];		/* Indexed by character */
/*
 
*//* addfstr( strP )

	Add a string to the list of frequent strings

Accepts :

	strP		Address of the Z-string

Returns :

	<value>		status code

Notes :

	No check is made to ensure that the string to be
added is not already in the frequent string list.  We assume
that the compiler knew what it was doing; anyway, doing so would
probably throw the application's assumptions out of sync.

*/

int
addfstr( strP )
AREG1	char		*strP;		/* Addr of zstring */
{
DREG1	int		len;		/* Length of string */
AREG2   struct freq_node *new;
    if (build_freq) return(SCOK);
    if ( FreqC == MAXFREQSTR )
	zerror( E_PASS1, "Too many frequent strings at \"%s\"", strP );
    else {
        new = (struct freq_node *)MALLOC(sizeof(struct freq_node));
	new->next = Freqstr[(unsigned char)(*strP)];
	Freqstr[(unsigned char)(*strP)] = new;
        len = strlen( strP );		/* Number of bytes */
	if ( ( new->fs_strP = CALLOC( 1, len+1 ) ) == NULL )
	    zerror( E_PASS1, "addfstr: can not allocate string space!" );
	else {
	    strcpy( new->fs_strP, strP );
	    new->fs_len = len;
	    new->fs_num = FreqC;
	    ++FreqC;
	}
    }
    return( SCOK );
}
/*
 
*//* zstr( strP, freqF, reqlen )

	Translate ASCII to Z-string

Accepts :

	strP		Address of the ASCII string
	freqF		Whether to use frequent-words in the translation
	reqlen		Number of bytes of required string length.  If
			 non-zero, resulting Z string must contain exactly
			 this many bytes.  It will be truncated if too long,
			 or padded if too short.

Returns :

	<value>		The address of the translated string


Notes :

	The returned value is a pointer to a static reusable buffer.

*/

UBYTE *translate_char(strP, chrp)
UBYTE *strP;
UBYTE *chrp;
{
  UBYTE *tbl = language_table;
  UBYTE tch, ch;
  ch = strP[1];
  if (ch != NUL) {
    /* Ignore escape at end of string */
    strP++;
    if (ch != language_char) {
      /* %% turns into % */
      while (tch = *tbl++) {
	if (tch == ch) {
	  *chrp = *tbl;
	  break; }
	tbl++; } } }
  return(strP); }

UBYTE *
zstr( strP, freqF, reqlen )
AREG1	UBYTE		*strP;		/* Ptr to input string */
	int		freqF;		/* Whether to use frequent words */
	int		reqlen;		/* Required length, if any */
{
	UBYTE		ch;		/* Character */
	UBYTE		curcset;	/* Currently selected cs */
	UBYTE		ccode;		/* Character code */
	UBYTE		cset;		/* Character set */
AREG2   struct freq_node *fnode;		/* Frequent string node */
	char		*fsP;		/* Frequent string ptr */
	int		fsL;		/* Frequent string length */
	int		matchX;		/* Match index */
	int		matchL;		/* Match length */

if (Zstrbuf_size < Max_buf_len) {
		Zstrbuf_size = Max_buf_len;
		Zstrbuf = (UBYTE *)REALLOC(Zstrbuf,Max_buf_len);
}

    startzstr( &Zstrbuf[0], reqlen );
    if (freqF && build_freq) {
      /* If freqF is not set, it's for a vocabulary word, which doesn't
	 get included in the frequent words stuff. */
      fw_string(strP); }
    else {
      curcset = 0;

      for( ; ( ch = *strP ) != NUL; ++strP ) {
	/* Check for frequent word encoding */
	if (ch == language_char) {
	  strP = translate_char(strP, &ch); }
	if ( freqF ) {
	    /* Look through the frequent strings */
	    matchL = 0;			/* No match */
	    for( fnode = Freqstr[(unsigned char)ch]; fnode != NULL;
		                                     fnode = fnode->next ) {
		fsP = fnode->fs_strP;
		if ( ch == *fsP ) {
		    fsL = fnode->fs_len;
		    if ( strncmp( strP, fsP, fsL ) == 0 )
			if ( fsL > matchL ) {	/* Bigger than last match? */
			    matchL = fsL;	/* Remember match length */
			    matchX = fnode->fs_num;	/* Remember match num */
			}
		}
	    }

	    /* If we had a match, use it... */
	    if ( matchL > 0 ) {
		addzchar( ( matchX/32 ) +1 );	/* String set */
		addzchar( matchX % 32 );	/* String number in set */
		strP += matchL-1;		/* Skip the string */
		continue;			/* Go process next guy */
	    }
	}
	if (character_count)
	  character_counts[ch]++; /* Maintain count of characters encoded */
	/* Encode the character into 5-bit charset */
	if ( ch == ' ' )
	    addzchar( '\0' );		/* Space is always zero */

	else if ( ( ccode = Zctbl[ch].zc_char ) == 0 ) {
	   /* Doesn't map -- use full ASCII sequence */
	   if ( curcset == 1 ) {
		addzchar( '\005' );	/* Shift to set 0 */
		curcset = 0;
	   }
	   if ( curcset == 0 )
		addzchar( '\005' );	/* Temp shift to set 2 */
		
	   addzchar( '\006' );		/* Shift to ASCII */
	   addzchar( ( ch >> 5 ) & 0x1f );
	   addzchar( ch & 0x1f );
	}
	else {
	    cset = Zctbl[ch].zc_set;

	    /* If need to switch character set, make sure we are in set
	       zero -- it's the only way we can get to the others. */
	    if ( ( cset != curcset ) && ( curcset != 0 ) ) {
		addzchar( '\004' + (2-curcset) );
		curcset = 0;
	    }

	    /* See if we still need to change sets */
	    if ( cset != curcset ) {
	    	/* Note that if we get in here, curcset==0 */

		/* Start with temporary shift */
		addzchar( '\003' + cset );

		/* Make a guess as to whether we should make it permanent */
		if ( Permshift && ( ( ch = strP[1] ) != NUL ) &&
		     ( Zctbl[ch].zc_char != 0 ) &&
		     ( Zctbl[ch].zc_set == cset ) ) {
		    addzchar( '\003' + cset );
		    curcset = cset;
		}
	    }

	    /* Put out the character (phew) */
	    addzchar( ccode );
	}
    }

      endzstr();				/* Finish zstring */ }
    return( &Zstrbuf[0] );
}
/*
 
*//* zstrlen( strP )

	Count words in a Zstring

Accepts :

	strP		Pointer to string in Z{word} format

Returns :

	<value>		Number of words in the string

*/

int
zstrlen( strP )
AREG1	UBYTE		*strP;		/* Ptr to string */
{
DREG1	int		len;		/* Length of string */

    for( len = 1; ( *strP & 0x80 ) == 0; ++len, strP += 2 )
	;

    return( len );
}
/*
 
*//* zcset( csP )

	Identify a character set

Accepts :

	csP		Pointer to the new character set; an array of 78
			characters that make up values 6-31 in each of
			the 5-bit encoded character subranges.

Returns :

*/

zcset( csP )
AREG1	UBYTE		*csP;		/* New character set */
{
DREG1	int		i;		/* Scratch */
DREG2	int		ch;		/* Char val */

    /* Clear out current character set */
    for( i = 0; i < 256; ++i )
	Zctbl[i].zc_char = 0;		/* Clear it */

    /* Process the new set */
    for( i = 0; i < 78; ++i ) {
	ch = *csP++;
	if ( ch != 0 ) {		/* Zero means not used */
	    Zctbl[ch].zc_set = i/26;	/* Charset # */
	    Zctbl[ch].zc_char = (i%26) +6; /* Encoding value */
	}
    }
}
/*
 
*//* startzstr, addzchar, endzstr - 5bit string stuff

	These routine help construct 5-bit-byte strings

*/

static	UBYTE	*ZstrP;			/* String being made */
static	UWORD	Zword;			/* Element of string */
static	int	ZwordC;			/* Byte count */
static	int	ZwordX;			/* Zword index */
static	int	Zwordrlen;		/* Required length, if any */

/* Start making a string */
startzstr( strP, reqlen )
	UBYTE		*strP;		/* Where to put the string */
	int		reqlen;		/* Required length, if any */
{
    ZstrP = strP;			/* Remember the ptr */
    Zwordrlen = reqlen;			/* Required length */
    Zword = ZwordC = ZwordX = 0;
}


/* Add a 5-bit byte to a string */
addzchar( ch )
	UBYTE		ch;		/* byte value to add */
{
    /* Proceed only if within the required length */
    if ( ( Zwordrlen == 0 ) || ( ZwordC < Zwordrlen ) ) {
	if ( ZwordX == 3 ) {		/* Last word full ? */
	    *ZstrP++ = (Zword>>8) & 0xff;
	    *ZstrP++ = Zword & 0xff;
	    Zword = ZwordX = 0;
	}

	/* Add in new byte */
	if (ZwordC * 2 / 3 >= Max_buf_len) {
	  my_fprintf(stderr,"Error in addzchar from zstring.c: zstring too long.\n");
	  my_exit(1);
	}
	Zword = ( Zword << 5 ) | ch;
	++ZwordX;
	++ZwordC;
    }
}


/* End the Z-string */
endzstr()
{
    /* Take care of any minimum length requirement first by adding pad bytes */
    if ( Zwordrlen != 0 ) {
	while( ZwordC < Zwordrlen )
	    addzchar( '\005' );
    }

    /* Finish off the last word by adding pad (5) chars. */
    while( ZwordX++ != 3 )
	Zword = ( Zword << 5 ) | '\005';

    /* Set the high bit to mean last word of string */
    Zword |= 0x8000;

    /* Place the word in the string */
    *ZstrP++ = (Zword>>8) & 0xff;
    *ZstrP++ = Zword & 0xff;

    /* Add a zero byte just for luck. */
    *ZstrP = NUL;
}

int zchar_size(ch, cset_ptr)
UBYTE ch;
int *cset_ptr;
{
  int val, cset;
  if (cset_ptr) *cset_ptr = 2;
  if (ch == ' ')
    return(1);
  else if (!ch) return(0);
  else if (Zctbl[ch].zc_char == 0) {
    cset = 2;
    val = 4; }
  else {
    cset = Zctbl[ch].zc_set;
    if (cset != 0) {
      val = 2; }
    else
      val = 1; }
  if (cset_ptr)
    *cset_ptr = cset;
  return(val); }

typedef struct fw_obj {
  struct fw_obj *fw_next;		/* Next element in hash bucket */
  UBYTE *fw_str;
  int fw_strlen;		/* Length of fw_str */
  int fw_original_zlen;		/* Original encoded length */
  int fw_zlen;			/* Used to compute rating' */
  int fw_freq;			/* Number of uses */
  int fw_original_freq;		/* Safety first */
  int fw_goodness;
  int fw_id;
  struct fw_obj *fw_parent;		/* If this is 'The ', points to 'The' */
  struct fw_obj *fw_child;		/* If this is 'The', points to 'The ' */
  struct fw_obj *fw_sibling;		/* If this is 'The ', points to 'The,' */
} *fw_node;

#define fw_hash_len 997
fw_node fw_hash[fw_hash_len];

fw_get_hash(str, len)
UBYTE *str;
int len;
{
  int hash = 0;
  int i, woffs = 0, shft = 0;
  UBYTE ch;
  for (i = 0; i < len; i++) {
    ch = str[i];
    hash ^= ch << shft;
    woffs++;
    if (woffs >= sizeof(int)) {
      woffs = 0;
      shft = 0; }
    else
      shft += 8; }
  hash = hash % fw_hash_len;
  if (hash < 0) return(-hash);
  else return(hash); }

fw_node fw_lookup(str, len, hash)
UBYTE *str;
int len;
int hash;
{
  fw_node buck;
  if (buck = fw_hash[hash]) {
    while (buck) {
      if ((buck->fw_strlen == len) &&
	  (strncmp(str, buck->fw_str, len) == 0)) {
	buck->fw_freq++;
	return(buck); }
      buck = buck->fw_next; } }
  return(0); }

int fw_node_ct = 0;

fw_node fw_add(str, len, zlen, parent, hash)
UBYTE *str;
int len, zlen;
fw_node parent;
int hash;
{
  fw_node buck;
  UBYTE *nstr;
  fw_node_ct++;
  buck = (fw_node)MALLOC(sizeof(struct fw_obj));
  buck->fw_id = 0;
  buck->fw_next = fw_hash[hash];
  fw_hash[hash] = buck;
  buck->fw_strlen = len;
  buck->fw_zlen = zlen;
  buck->fw_original_zlen = zlen;
  buck->fw_freq = 1;
  buck->fw_parent = parent;
  buck->fw_child = 0;
  if (parent) {
    buck->fw_sibling = parent->fw_child;
    parent->fw_child = buck; }
  else
    buck->fw_sibling = 0;
  nstr = (UBYTE *)MALLOC(len);
  strncpy(nstr, str, len);
  buck->fw_str = nstr;
  return(buck); }

/* Call this with a string pointer.  Update all the frequent-words stuff. */
/* As currently constituted, this includes all prefixes that might be interesting
   as well.  Thus "theory of" will cause "the", "theo", "theor", "theory", and
   "theory " to be added to the database.  The process of assigning the actual
   frequent words becomes something of a relaxation process:  if "the" becomes
   a frequent word, then the goodness of "theory" must be adjusted downward.
   If "theory" becomes a frequent word anyway, then the goodness of
   "the" must be adjusted downward, leading to a corresponding upward adjustment
   in the goodness of "theory".  This could be fun. */
fw_string(strP)
UBYTE *strP;
{
  UBYTE ch;			/* Character */
  UBYTE curcset;		/* Current character set */
  UBYTE ccode;			/* Character */
  int cset;
  int cchar_size;
  int ccount = 0;		/* Number of input characters */
  int cstrlen = 0;		/* Number of output characters */
  UBYTE *strP_save = strP;
  fw_node frob, last_frob = 0;
  int last_frob_len;
  if (!strP) return;
  for (; (ch = *strP) != NUL; ++strP) {
    if (ch == language_char)
      strP = translate_char(strP, &ch);
    if (character_count)
      character_counts[ch]++;
    cchar_size = zchar_size(ch, &cset);	/* This puts space into set 2... */
    if ((cset == 0) || (cset == 1) || (ch == '.') || (ch == '?') ||
	(ch == '!') || (ch == ',')) {
      /* Normally character sets 0 and 1 are upper and lower case letters.
	 If .CHRSETs have happened, they might be something else. */
      cstrlen += cchar_size;
      ccount++;
      last_frob = 0;
      last_frob_len = 0;
      strP_save = strP;		/* Save pointer to first interesting char */
      while (1) {
	int hash;
	ch = *++strP;
	cchar_size = zchar_size(ch, &cset);
	if (cset != 2) {
	  /* Still in a word */
	  cstrlen += cchar_size;
	  ccount++;
	  if (cstrlen > 2) {
	    hash = fw_get_hash(strP_save, ccount);
	    if (!(frob = fw_lookup(strP_save, ccount, hash)))
	      frob = fw_add(strP_save, ccount, cstrlen, last_frob, hash);
	    last_frob_len = ccount;
	    last_frob = frob; }
	  continue; }
	/* Hit end of word:  end of string or non-"alpha" */
	if (ch == '\'') {
	  /* Look for "'s" and friends */
	  zchar_size(*(strP + 1), &cset); /* Get the next character's set */
	  if (cset != 2) {
	    /* it's alpha, so add in the ' and continue */
	    cstrlen += cchar_size;
	    ccount++;
	    continue; } }
	if (ch == ' ') {
	  ccount++;
	  cstrlen++; }
	else if (cset == 2) {
	  /* We already did this one */
	  strP--;
	  cstrlen = 0;
	  ccount = 0;
	  break; }
	/* strP_save contains pointer to beginning of string with
	   ccount characters, and encoded size of cstrlen. */
	if (cstrlen > 2) {
	  if (last_frob_len == ccount)
	    printf("losing\n");
	  hash = fw_get_hash(strP_save, ccount);
	  /* Don't bother if the encoding is too short to be helpful */
	  if (!fw_lookup(strP_save, ccount, hash))
	    fw_add(strP_save, ccount, cstrlen, last_frob, hash); }
	strP--;
	cstrlen = 0;
	ccount = 0;
	break; } } } }

fw_node frequent_words[96];

int fw_worst_allocated = 0x3fffffff;
int fw_worst_index = -1;

prune_parents(thing)
fw_node thing;
{
  fw_node parent = thing->fw_parent;
  /* For a given node, find out if its parent has no other descendants.
     If that's true, then there's no reason to consider it.  Wander up
     the tree until an interesting parent is found, or until we run out
     of them. */
  while (parent) {
    fw_node new_parent;
    if (thing->fw_freq == parent->fw_freq) {
      parent->fw_id = -1;	/* This will keep the parent from being considered */
      parent->fw_child = 0;	/* The parent has no child any more */
      if (parent->fw_sibling) {
	/* If the parent has siblings, then we can stop anyway */
	fw_node new_thing = parent->fw_parent;
	fw_node kid = new_thing->fw_child;
	/* The parent doesn't have a parent either */
	parent->fw_parent = 0;
	thing->fw_parent = new_thing;
	/* Now place thing in its ancestor's tree in place of the parent. */
	if (kid == parent) {
	  thing->fw_sibling = parent->fw_sibling;
	  new_thing->fw_child = thing;
	  thing->fw_parent = new_thing;
	  break; }
	while (1) {
	  if (kid->fw_sibling == parent) {
	    kid->fw_sibling = thing;
	    thing->fw_sibling = parent->fw_sibling;
	    break; }
	  kid = kid->fw_sibling; }
	break; }
      /* At this point we know that the parent has no siblings */
      new_parent = parent->fw_parent;
      parent->fw_parent = 0;
      parent = new_parent;
      thing->fw_parent = parent;
      if (!parent) {
	/* No more parents, so stop */
	thing->fw_sibling = 0;
	break; }
      thing->fw_sibling = parent->fw_child;
      parent->fw_child = thing; }
    else
      break; } }

print_name(thing)
fw_node thing;
{
  UBYTE *str = thing->fw_str;
  int len = thing->fw_strlen, i;
  for (i = 0; i < len; i++)
    printf("%c", str[i]); }

fw_node any_frequent_words(thing)
fw_node thing;
{
  for (; thing; thing = thing->fw_parent)
    if (thing->fw_id > 0) return(thing);
  return(0); }

dump_frequent_words(game_name)
char *game_name;
{
  int i, j;
  fw_node buck;
  int fw_allocated = 0;
  int fw_best = 0;
  int goodness;
  int changed = 1;
  int passes = 0;
  printf("%d nodes allocated.\n", fw_node_ct);
  for (i = 0; i < fw_hash_len; i++) {
    buck = fw_hash[i];
    while (buck) {
      if (buck->fw_parent)
	prune_parents(buck);
      buck->fw_goodness = (buck->fw_freq - 1) * (buck->fw_zlen - 2);
      /* Subtract one because the string will still occur in the frequent
	 words table; two because that's the assumed length of the fw
	 reference. */
      buck->fw_original_freq = buck->fw_freq;
      buck = buck->fw_next; } }
  while (1) {
    if (!changed) break;
    changed = 0;
    passes++;
    if (passes > 100) {
      printf("Giving up after 100 passes\n");
      break; }
    for (i = 0; i < fw_hash_len; i++) {
      buck = fw_hash[i];
      while (buck) {
	fw_node parent;
	goodness = buck->fw_goodness;
	if ((goodness > 0) && (buck->fw_id == 0) &&
	    ((fw_allocated < 96) || (goodness > fw_worst_allocated))) {
	  changed++;
	  /* Try this word in the frequent words table */
	  if (fw_allocated == 96) {
	    /* Table is full, so have to kill something that was already
	       there */
	    fw_insert(buck, fw_worst_index, 1); }
	  else {
	    fw_insert(buck, fw_allocated, 0);
	    fw_allocated++; }
	  fw_set_worst(fw_allocated); }
	else if ((buck->fw_id == 0) && (parent = buck->fw_parent) &&
		 (parent = any_frequent_words(parent))) {
	  /* We're looking at the descendant of a word that's already in the
	     table.  Decide whether it would be better to have the descendant
	     in the table with the ancestor removed. */
	  int new_goodness, new_parent_goodness;
	  /* Get the rating for the child with the parent removed.  We already
	     know that the child isn't good enough to be added to the table
	     with the parent present. */
	  new_goodness = buck->fw_goodness +
	    (buck->fw_freq - 1) * (parent->fw_zlen - 2);
	  if (new_goodness > parent->fw_goodness) {
	    print_name(buck);
	    printf(" in for ");
	    print_name(parent);
	    printf(".\n");
	    fw_insert(buck, parent->fw_id - 1, 1);
	    changed++; } }
	buck = buck->fw_next; } }
    printf("End of pass %d.  %d changes, worst entry is %d.\n",
	   passes, changed, fw_worst_allocated);  }
  sort_stuff(fw_allocated);
  print_stuff(game_name, fw_allocated); }

sort_stuff(cnt)
int cnt;
{
  int i, j;
  fw_node temp;
  for (i = (cnt - 2); i >= 0; i--) {
    for (j = 0; j <= i; j++) {
      if (frequent_words[j]->fw_goodness <
	  frequent_words[j + 1]->fw_goodness) {
	temp = frequent_words[j];
	frequent_words[j] = frequent_words[j + 1];
	frequent_words[j + 1] = temp; } } } }

print_stuff(game_name, cnt)
char *game_name;
int cnt;
{
  int i, j;
  fw_node temp;
  FILE *fw_file;
  int tdesc;
  char real_name[255];
  char new_name[255];
  char c;
  int original_zbytes = 0, final_zbytes = 0;
  strcpy(&real_name[0], game_name);
  strcat(&real_name[0], "freq.zap");
  tdesc = open(&real_name[0], O_RDONLY, 0);
  if (tdesc >= 0) {
    strcpy(&new_name[0], &real_name[0]);
    strcat(&new_name[0], "~");
    close(tdesc);
    rename(&real_name[0], &new_name[0]); }
  fw_file = fopen(&real_name[0], "w");
  for (i = 0; i < cnt; i++) {
    temp = frequent_words[i];
    original_zbytes += temp->fw_freq * temp->fw_zlen;
    final_zbytes += temp->fw_zlen + temp->fw_freq * 2;
    fprintf(fw_file, "	.FSTR FSTR?%d,\"", i + 1);
    for (j = 0; j < temp->fw_strlen; j++) {
      c = temp->fw_str[j];
      if (c == '\"')
	fprintf(fw_file, "\"\"");
      else
	fprintf(fw_file, "%c", c); }
    fprintf(fw_file, "\"	;%d	%d	%d\n",
	    temp->fw_goodness, temp->fw_freq, temp->fw_original_freq); }
  fprintf(fw_file, "\n\nWORDS::	.TABLE\n");
  for (i = 0; i < cnt; i++)
    fprintf(fw_file, "	FSTR?%d\n", i + 1);
  fprintf(fw_file, "	.ENDT\n\n	.ENDI\n");
  printf("%d to %d = %d.\n", original_zbytes, final_zbytes,
	 original_zbytes - final_zbytes);
  fclose(fw_file); }

check_name(thing, str)
fw_node thing;
char *str;
{
  char *ostr = (char *)(thing->fw_str);
  if (strlen(str) != thing->fw_strlen)
    return(0);
  if (strncmp(str, ostr, thing->fw_strlen) != 0) return(0);
  return(1); }

update_parents(thing, ct)
fw_node thing;
int ct;
{
  thing = thing->fw_parent;
  while (thing) {
    thing->fw_freq += ct;
    thing->fw_goodness += ct * (thing->fw_zlen - 2);
    /* The parent's goodness decreases only by the lost frequency from
       its child */
    if (thing->fw_id) {
      break; }
    thing = thing->fw_parent; } }

update_kids(thing, fudge)
fw_node thing;
int fudge;
{
  thing = thing->fw_child;
  while (thing) {
    /* If the parent is becoming a frequent word, the child's goodness decreases:
       its effective length is now only (child_zlen - parent_zlen + 2), because
       it can be encoded in that.  */
    /* Fudge is the encoded length of the parent */
    if (fudge > 0)
      thing->fw_zlen = thing->fw_original_zlen - fudge + 2;
    else
      thing->fw_zlen = thing->fw_zlen - fudge -2;
    thing->fw_goodness = (thing->fw_freq - 1) * (thing->fw_zlen - 2);
    if ((thing->fw_child) && !thing->fw_id)
      update_kids(thing, fudge);
    thing = thing->fw_sibling; } }

/* Find the lowest-quality frequent word */
fw_set_worst(ct)
int ct;
{
  int i;
  fw_worst_allocated = 0x3fffffff;
  fw_worst_index = -1;
  for (i = 0; i < ct; i++) {
    if (frequent_words[i]->fw_goodness < fw_worst_allocated) {
      fw_worst_allocated = frequent_words[i]->fw_goodness;
      fw_worst_index = i; } } }

/* We think that 'thing' wants to be a frequent word.  'at' is either
   fw_worst_index (if kill is true) or the next empty slot (if kill is
   false; happens when fewer than 96 words have been allocated). */
fw_insert(thing, at, kill)
fw_node thing;
int at;
int kill;
{
  fw_node other_thing;
  if (kill)
    fw_dealloc(at);
  thing->fw_id = at + 1;
  frequent_words[at] = thing;
  if (thing->fw_parent)
    update_parents(thing, -thing->fw_freq);
  if (thing->fw_child)
    update_kids(thing, thing->fw_zlen); }

/* Kill the last entry in the frequent words table.  Update goodness of any
   of its relatives. */
fw_dealloc(at)
int at;     
{
  fw_node thing = frequent_words[at], other_thing;
  thing->fw_id = 0;
  if (thing->fw_parent)
    /* If this has a parent, the parent's goodness miraculously increases
       (along with the goodness of all ancestors) */
    update_parents(thing, thing->fw_freq);
  if (thing->fw_child)
    update_kids(thing, -thing->fw_zlen); }

