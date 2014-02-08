use strict;
use warnings;
package Office365::EWS::Client::Role::SOAP;
use Moose::Role;
with 'EWS::Client::Role::SOAP';
sub _build_wsdl {
    my $self = shift;
    XML::Compile->addSchemaDirs( $self->schema_path );
    my $wsdl = XML::Compile::WSDL11->new('ews-services.wsdl');
    $wsdl->importDefinitions('ews-types.xsd');
    $wsdl->importDefinitions('ews-messages.xsd');
    return $wsdl;
}
sub _build_schema_path {
    my $self = shift;
    return File::ShareDir::dist_dir('Office365-EWS-Client');
}
has server_version => (
    is => 'ro',
    isa => 'Str',
    default => 'Exchange2010_SP2',
    required => 0,
);
no Moose::Role;
1;
