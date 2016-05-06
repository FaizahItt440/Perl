use Socket;

$iaddr = inet_aton("127.1");
$hersockaddr = getpeername(SOCK);
($port,$iaddr) = sockaddr_in($hersockaddr);
$herhostname = gethostbyaddr($iaddr,AF_INET);
$herstraddr = inet_ntoa($iaddr);

defined(my $tcp = getprotobyname("tcp"))
	or die "Could not determine the protocol number for tcp";

my $packed = getsockopt($socket,$tcp,TCP_NODELAY)
	or die "Could not query TCP_NODELAY socket option: $!";

my $nodelay = unpack("I",$packed);
print "Done..", $nodelay? ;

shutdown(SOCKET,0);
shutdown(SOCKET,1);
shutdown(SOCKET,2);
