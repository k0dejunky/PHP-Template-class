#!/usr/bin/perl

#Author K0dejunky
#Date July 7, 2017
#Version 1.0

package WebViewer;

use GUI;
use WebController;
use strict;
use warnings;

my $GUI = GUI->new();

sub new{
	my $class = shift;
	my %options = @_;
	my $self = {output => "", mode => "", %options};
	bless($self, $class);
	return($self);
}

sub start {
	my ($self) = @_;
	print $GUI->headers();
	print $GUI->startPage("Minecraft Server Admin");
	$self->{output} = $self->{output}.$GUI->divStart("menu");
	$self->renderLogin();
	$self->{output} = $self->{output}.$GUI->divEnd();
	$self->displayPage();
}
sub renderLogin {
	my ($self) = @_;
	$self->{output} = $self->{output}.$GUI->divStart("logon1", "right");
	$self->{output} = $self->{output}.$GUI->formStart("center","index.cgi", "post", "login");
	$self->{output} = $self->{output}.$GUI->input("username", "text", "username", "20", "20");
	$self->{output} = $self->{output}.$GUI->br();
	$self->{output} = $self->{output}.$GUI->input("pword", "password", "pword", "20", "20");
	$self->{output} = $self->{output}.$GUI->br();
	$self->{output} = $self->{output}.$GUI->input("submit", "submit","login");
	$self->{output} = $self->{output}.$GUI->formEnd();
	$self->{output} = $self->{output}.$GUI->divEnd();
}
sub displayPage{
	my ($self) = @_;
	print $self->{output};
}
1;