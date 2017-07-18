#!/usr/bin/perl

#Author: Kodejunky
#Date: July 12, 2017
#File: WebPageController
#Description: This is the controller class for perl webpage control. This class updates the model, reads the model and selects and displays the correct veiw depending on the state of the model. The controller will handle all HTTP requests, and POST data.

package WebController;

use strict;
use warnings;

use WebModel;

my $mdl = WebModel->new();

sub new {
        my $class = shift;
        my %options = @_;
        my $self = {send => "",receive => "",cookie => "",  %options};
        bless($self, $class);
        return($self);

}

sub setCookie {
	my ($self, $mdl) = @_;
	my $secure = 1;
	my $expire = gmtime(time()+1*24*3600) . " GMT"; #sets the epire time to expire in 1 hour
	my $cookie = "MinecraftServerAdmin=1; path=/; expires=$expire; $secure"; # sets the cookie data
	$self->{cookie} =  "Set-cookie: " . $cookie . "\n"; # sets the cookie
	return $self->{cookie}; #returns the cookie to the viewer
}

sub getCookie {
	my ($self, $mdl, $cookie) = @_;
	
}

sub login {
	my ($self, $mdl, $user, $pass) = @_;
	my $loginResponce = $mdl->login($user, $pass);
	if ($loginResponce  == 0){
		return 0;
	}else{
		return $loginResponce;
	}
}
1;