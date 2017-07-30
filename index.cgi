#!/usr/bin/perl
#Author: Kodejunky
#Date: July 12, 2017
#File: index.cgi

use strict;
use warnings;

use WebTemplater;
use WebController;
use HTTP::Request::Common qw(POST);
my (@mtd, @uname, @pword);
my @POST;
my $tmpl = WebTemplater->new();
my $ctrl = WebController->new();
my $length = $ENV{CONTENT_LENGTH};
my $input;
my (@data,@username, @password, @method);
if($ENV{REQUEST_METHOD} eq "POST"){
	my ($buffer) = "";
	for (<>){
		$input .= $_;
	}
	if($input){
		@data  = split("&",$input);
		@method = split("=",$data[2]);
		@username = split ("=",$data[0]);
		@password = split ("=",$data[1]);
		if($method[1] eq "login"){
			my $response = $ctrl->login($username[1], $password[1]);
			if($response eq "homePage"){
				$tmpl->headers();
				print "\n";
				$tmpl->renderHomePage();
				$tmpl->displayPage();
			}elsif($response eq "LOGIN FAILED"){
				$tmpl->headers();
				print "\n";
				$tmpl->renderLoginErrorPage("error",$response);
				$tmpl->displayPage();
			}
		}else{
			print "<p>this is were im not supposed to be</p>";
		}
	}else{
        	print "<p>this is were im not supposed to be no input detected</p>";
	}

}else{
	$tmpl->start();
	print $ENV{REQUEST_METHOD};
}
