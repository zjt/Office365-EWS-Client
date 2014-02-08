use strict;
use warnings;
package Office365::EWS::Client;
use Moose;
extends 'EWS::Client';
with qw/
    Office365::EWS::Client::Role::SOAP
/;
no Moose;
1;

# ABSTRACT: Office 365 Exchange Web Services client

=head1 SYNOPSIS

Set up your Office 365 Exchange Web Services client.

 use Office365::EWS::Client;
 use DateTime;
 
 my $ews = Office365::EWS::Client->new({
     server         => 'pod12345.outlook.com',
     username       => 'oliver@some.org',
     password       => 's3krit', # or set in $ENV{EWS_PASS}
     server_version => "Exchange2010_SP2",
 });

Then perform operations on the Exchange server:

 my $entries = $ews->calendar->retrieve({
     start => DateTime->now(),
     end   => DateTime->now->add( months => 1 ),
 });
 
 print "I retrieved ". $entries->count ." items\n";
 
 while ($entries->has_next) {
     print $entries->next->Subject, "\n";
 }
 
 my $contacts = $ews->contacts->retrieve;

=head1 DESCRIPTION

This module acts as a client to the Office 365 Exchange Web Services API. From
here you can access calendar and contact entries using the capabilities of 
L<EWS::Client>.

=cut
