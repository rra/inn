# Sample Perl filtering file for the innd hooks.
# 
# This file gets loaded at innd process startup, and everytime a
# "ctlinnd reload filter.perl 'reason'" or a
# "ctlinnd reload all 'reason'" is done.
#
# Before this file is loaded, the perl routine `filter_before_reload' is
# called, and after it's finished loading, the perl routine
# `filter_after_reload' is called. See startup_innd.pl for more details.
#
# When filtering is disabled, the filter_end() Perl routine is called,
# if defined, prior to the deactivation of the filter.
#
# The following routines can be defined here for use by innd:
#
#	sub filter_art { ... }
#
#		This routine is called before every article is accepted for
#		posting. Is is called with no arguments, but has access to
#		all the non-empty standard headers of the article via the
#		global associative array `%hdr.'  If it returns the empty
#		string ("") then the article is accepted. If it returns any
#		non-null string value, then the article is rejected and the
#		returned string value is logged as the reason why (make sure
#               that such a message is properly encoded in UTF-8 so as to comply
#               with the NNTP protocol).
#
#		The standard headers are:
#
#			Approved, Control, Date, Distribution, Expires,
#			From, Lines, Message-ID, Newsgroups, Path,
#			Reply-To, Sender, Subject, Supersedes, Bytes,
#			Also-Control, References
#
#	sub filter_mode { ... }
#
#		This routine is called every time `go', `pause', or
#		`throttle' is called. It is called with no arguments and
#		returns no value. The global associative array `%mode' has
#		three keyed values stored in it:
#
#			'Mode'		The current mode
#					   ("running", "paused", "throttled") 
#			'NewMode"	The new mode
#			'reason'	The reason given.
#
#		For example:	%mode =	('Mode', 'running', 
#					'NewMode', 'throttled', 
#					'reason', 'doing nightly backups')
#
# If filter_art is not defined when this file is done loading, then
# filtering is disabled. If any syntax error occurs when loading the file,
# then filtering is disabled.
#
#	sub filter_messageid { ... }
#
#		This routine is called when each article (in streaming
#		mode only) is checked to see if INN wants to accept the
#		article.  If it returns the empty string, the article
#		is accepted.  If it returns a non-empty value, the
#		article is refused (make sure that such a message is
#               properly encoded in UTF-8 so as to comply with the
#               NNTP protocol).  It is called with one argument,
#		the message-id to check.



#
# Called on each article innd receives from a peer. Return "" to accept,
# and any other non-null string to reject. If rejecting the string returned
# will be part of the logged reason.
#

sub filter_art {
	my $rval = "" ; # Assume we'll accept. Cannot be `0'

### Remove two leading '##' from the following section (and then
### "ctlinnd reload filter.perl 'reason'" and the filter will reject articles that
### have "make money" in the subject, or are posted to more than 10
### newsgroups. 

##	my ($maxgroups) = 10 ;
##
### Normally this output would be lost, but if you run innd with '-d -f' you
### can see what's going on.
###
###	foreach $key (sort keys %hdr) {
###		print "Header:\t$key Value:\t $hdr{$key}\n" ;
###	}
##
##	if ($hdr{"Subject"} =~ /\$*make.*money.*\$*/i ) {
##		$rval = "no money requests here"
##	} elsif ( ( @_ = split(",",$hdr{'Newsgroups'}) ) > $maxgroups ) {
##		$rval = "too many groups" ;
###	Kill article with "Re: " but no References:
##	} elsif ($hdr{'Subject'} =~ /^Re: /o and $hdr{'References'} eq "") {
##       $rval = "Followup without References:";
###	Kill article with invalid From:
##	} elsif ($hdr{'From'} =~ /^\w*$/o or
##          $hdr{'From'} !~ /^(.+?)\@([-\w\d]+\.)*([-\w\d]+)\.([-\w\d]{2,})$/o) {
##       $rval = "From: is invalid, must be user\@[host.]domain.tld";
##   }
###
###	print "Accepting\n" if ! $rval ;

	$rval ;
}

sub filter_mode {
	if ($mode{'NewMode'} eq "throttled" || $mode{'NewMode'} eq "paused") {
#		print "Closing spam database\n" ; # won't kill server.
#		&close_spam_database ;
	} else {
#		print "Opening spam database\n" ; # won't kill server
#		&open_spam_database ;
	}
}

sub filter_messageid {
    my ($messageid) = @_;
    $rval = '';
#    $rval = 'No' if ($messageid =~ /a\.spam\.domain>?/i);
     $rval;
}

sub filter_end {
# Do whatever you want to clean up things when Perl filtering is disabled.
}



###########################################################################
##
## Another sample. More elaborate, but cleaner... from Christophe
## Wolfhugel <wolf@pasteur.fr>.
##


#### Regular expressions we reject.
#### Format : Header => regexp => reason
##%reject = (
##   'Subject'	=> {
##      'make.*money.*fast'		=>	'MMF rejected',
##      'cash.*cash.*cash'		=>	'Cash rejected'
##   },
##);
##
##sub filter_art {
##   my($rval) = '';
##   my(@ng, $i, $j, $k, $l);
##
##   if ($hdr{'From'} !~ /\@/o) {
##      $rval = 'Invalid From';
##   } else {
##      while (($i, $j) = each %reject) {
##         while (($k, $l) = each %{$j}) {
##            if ($hdr{$i} =~ /$k/i) {
##               $rval = $l;
##               goto the_end;
##            }
##         }
##      }
##   }
##   @ng = split(/,/, $hdr{'Newsgroups'});
##   if ($#ng > 10) {
##     $rval = 'ECP rejected';
##   }
##the_end:
##   undef %hdr;
##   return $rval
##}
##
##sub filter_mode {
##}
##
###%hdr = (
###	'Subject'	=>	'Make money fast',
###	'From'		=>	'bozo@gov.org'
###);
###&filter_art;



###########################################################################
##
## From Chrisophe Wolfhugel again (wolf@pasteur.fr). This is not 
## standalone code. 
##

##Just for the fun, I've added following code to filter_innd.pl :
##
##   ## Keep track of the From and subject.
##   $i = "$hdr{'From'} $hdr{'Subject'}";
##   push(@history, $i);
##   $history{$i}++;
##
##   ## Reject the EMP.
##   if ($history{$i} > 10) {
##      $rval = "EMP rejected (appeared $history{$i} times): $i";
##   }
##
##   ## Remove too old things.
##   while ($#history > 1000) {
##      delete($history{shift(@history)});
##   }
##
##It is pretty successfull in detecting and refusing excessive multi-posting.
##Same sender, same subject, appearing more than 10 times without the last
##1000 articles gets junked.
##
##Already catched a few hundreds :
##
##Nov 20 08:27:23.175 - vishnu.jussieu.fr <3292ac9a.4064710@nntp.cts.com> 437 EMP rejected (btr@trenet.com Be a Beta Tester!)
##
##That was just for the pleasure. It is still sucking a non significant CPU
##time on my slow Alpha.

