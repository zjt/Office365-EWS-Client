package Office365::EWS::Client::Role::FindPeople;
use Moose::Role;
has FindPeople => (
    is => 'ro',
    isa => 'CodeRef',
    lazy_build => 1,
);
sub _build_FindPeople {
    my $self = shift;
    return $self->wsdl->compileClient(
        operation => 'FindPeople',
        transport => $self->transporter->compileClient(
            action => 'http://schemas.microsoft.com/exchange/services/2006/messages/FindPeople' ),
    );
}
no Moose::Role;
1;

