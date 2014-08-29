package Office365::EWS::GAL::Item;
use Moose;
use Encode;
has DisplayName => (
    is => 'ro',
    isa => 'Str',
    required => 1,
);
has Surname => (
    is => 'ro',
    isa => 'Str',
);
has GivenName => (
    is => 'ro',
    isa => 'Str',
);
has DisplayNameLastFirst => (
    is => 'ro',
    isa => 'Str',
);
has ImAddress => (
    is => 'ro',
    isa => 'Str',
);
has WorkCity => (
    is => 'ro',
    isa => 'Str',
);
has PersonaType => (
    is => 'ro',
    isa => 'Str',
);
has DisplayNameFirstLast => (
    is => 'ro',
    isa => 'Str',
);
has FileAs => (
    is => 'ro',
    isa => 'Str',
);
has CreationTime => (
    is => 'ro',
    isa => 'Str',
);
has RelevanceScore => (
    is => 'ro',
    isa => 'Str',
);
has EmailAddress => (
    is => 'ro',
    isa => 'HashRef',
    default => sub { {} },
);
has EmailAddresses => (
    is => 'ro',
    isa => 'HashRef',
    default => sub { {} },
);
sub BUILDARGS {
    my ($class, @rest) = @_;
    my $params = (scalar @rest == 1 ? $rest[0] : {@rest});
    foreach my $key (keys %$params) {
        if (not ref $params->{$key}) {
            $params->{$key} = Encode::encode('utf8', $params->{$key});
        }
    }
    return $params;
}
__PACKAGE__->meta->make_immutable;
no Moose;
1;
