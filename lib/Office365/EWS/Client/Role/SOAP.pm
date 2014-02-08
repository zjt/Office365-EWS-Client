use strict;
use warnings;
package Office365::EWS::Client::Role::SOAP;
use Moose::Role;
with 'EWS::Client::Role::SOAP';
sub _build_wsdl {
    my $self = shift;
    XML::Compile->addSchemaDirs( $self->schema_path );
print $self->schema_path;
    my $wsdl = XML::Compile::WSDL11->new('ews-services-365.wsdl');
    $wsdl->importDefinitions('ews-types-365.xsd');
    $wsdl->importDefinitions('ews-messages-365.xsd');
    return $wsdl;
}
no Moose::Role;
1;
