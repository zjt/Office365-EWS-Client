package Office365::EWS::Client::GAL;
use Moose;
with 'Office365::EWS::GAL::Role::Reader';
has client => (
    is => 'ro',
    isa => 'EWS::Client',
    required => 1,
    weak_ref => 1,
);
__PACKAGE__->meta->make_immutable;
no Moose;
1;
