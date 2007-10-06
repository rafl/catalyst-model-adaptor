package TestApp::BaseController::Adaptor;
use strict;
use warnings;
use base 'Catalyst::Controller';

sub model { shift->{model} }

sub is_a :Path(isa) {
    my ($self, $c) = @_;
    $c->res->body(ref $c->model($self->model));
}

sub try_twice :Local {
    my ($self, $c) = @_;
    $c->res->body(join '|', map { $c->model($self->model)->id } 1..2);
}

sub count :Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model)->count);
}

sub foo :Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model)->foo);
}

1;
