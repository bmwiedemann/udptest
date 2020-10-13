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
        PeerPort => 12255,
        Proto => 'udp',
        ) or die "Can't bind : $@\n";

$sock->send("test ".strftime("%F %T",gmtime));

my $data="";
$sock->recv($data, 1024);
print "Server replied: ".$data;
