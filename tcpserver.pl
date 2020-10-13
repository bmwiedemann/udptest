#!/usr/bin/perl
#udpserver.pl

use IO::Socket::INET6;

# flush after every write
$| = 1;

my ($socket,$received_data);
my ($peeraddress,$peerport);

#  we call IO::Socket::INET->new() to create the UDP Socket and bound 
# to specific port number mentioned in LocalPort and there is no need to provide 
# LocalAddr explicitly as in TCPServer.
my $ssocket = new IO::Socket::INET6 (
LocalPort => '12255',
Proto => 'tcp',
Listen => 1,
Reuse => 1
) or die "ERROR in Socket Creation : $!\n";


while(1)
{
$socket = $ssocket->accept();
# read operation on the socket
$socket->recv($recieved_data,1024);

#get the peerhost and peerport at which the recent data received.
$peer_address = $socket->peerhost();
$peer_port = $socket->peerport();
print "\n($peer_address , $peer_port) said : $recieved_data";

#send the data to the client at which the read/write operations done recently.
$data = "OK, I got '$recieved_data' from $peer_address $peer_port\n";
#print $socket "$data";
$socket->send($data);
$socket->close();

}

$socket->close();
