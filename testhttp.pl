#!/usr/bin/perl -w
use strict;
use IO::Socket::INET6;
use POSIX;

$| = 1;

my $host = $ENV{host}||"zq1.de";
my $port = $ENV{port}||12254;
my $sock = IO::Socket::INET6->new(
        LocalPort => $port,
        PeerAddr => $host,
        PeerPort => 80,
        Reuse => 1,
        Proto => 'tcp',
        ) or die "Can't bind : $@\n";

$sock->send("GET / HTTP/1.0\r\n\r\n");

my $data="";
$sock->recv($data, 1024);
print "Server replied: ".$data;
