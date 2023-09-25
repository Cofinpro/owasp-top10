#!/usr/bin/perl
# little perl script to produce a log like output to STDERR
# it waits for a random amount of time between writing the entries
# and choses randomly from log entries at the bottom of the script
# >>> takes the following arguments:
# -c 150
# --count=150     produces 100 log entries (default: 150)
#
# -min=0.2
# -min-pause=0.2  wait at minimum 0.1 secs (default: 0.2)
#
# -max=1.2
# -max-pause=1.2  wait at minimum 1.1 secs (default: 1.2)
# -------
use Getopt::Long;

my $count = 150;
my $minPause = 0.2;
my $maxPause = 1.2;
my $showHelp;

$result = GetOptions (
    "count=i"     => \$count,
    "min-pause=f" => \$minPause,
    "max-pause=f" => \$maxPause,
    "help"        => \$showHelp,
);

sub showHelpAndExit {
    print <<"    _END";
    $0\n
    takes the following arguments:
        -c 150
        --count=150     produces 100 log entries (default: 150)\n
        --min=0.2
        --min-pause=0.2  wait at minimum 0.2 secs (default: 0.2)\n
        --max=1.2
        --max-pause=1.2  wait at minimum 1.2 secs (default: 1.2)\n
    _END
    exit 1;
}

if ($showHelp) {
    showHelpAndExit();
}

sub printError {
    my (
        $status, $message,
        $sec, $min, $hour, $mday, $mon, $year
    );
    ($status, $message) = @_;
    ($sec, $min, $hour, $mday, $mon, $year) = localtime();
    $year += 1900;
    $mon += 1;
    $mon = $mon < 10 ? "0$mon" : "$mon";
    $mday = $mday < 10 ? "0$mday" : "$mday";
    $min = $min < 10 ? "0$min" : "$min";
    $hour = $hour < 10 ? "0$hour" : "$hour";
    $sec = $sec < 10 ? "0$sec" : "$sec";

    my $date = "$year-$mon-$mday";
    my $time = "$hour:$min:$sec";

    printf(
        STDERR
        "%10s %5s: %03d / %-90s\n",
        $date, $time, $status || "204", $message
    );
}

# @param $max
sub getRandomArrayIdx {
    return int(rand($_[0]));
}

sub waitSomeMs {
    my $ms;
    my $min = $minPause;
    my $max = $maxPause;
    $ms = sprintf('%1.4f', $min + rand($max - $min));
    select(undef, undef, undef, $ms);
}

sub getRandomStatus {
    my $status = shift @_;
    my $rand = getRandomArrayIdx(scalar @{$status});
    return $status->[$rand];
}

sub getRandomMessage {
    my $msgs = shift @_;
    my $rand = getRandomArrayIdx(scalar @{$msgs});
    return $msgs->[$rand];
}

my %messages = (
    "100", [
        'NOOP - nothing to do, ask again later',
        'NOOP - its sunday here, i aint gonna work today',
        'NOOP - syscall int(10) + sprintf(v) // no problem',
        'NOOP - resource busy, try again later',
        'NOOP - with std::istream_iterator<int>(str), std::istream_iterator<int>()',
        "NOOP - i've been trying to call you forever ... and now that?",
    ],
    "200", [
        'OK - file found, request again for delivery',
        'OK - file uploaded, request again for processing',
        'OK - access granted to user or no access needed',
        'OK - calculation done',
        'OK - check output, job is done',
        'OK - layout layouts/application.html.erb rendered and done',
        'OK - printing done / enjoy! YOU KILLED 3 TREES!',
    ],
    "300", [
        'RDIR - checking MEM or else ...',
        'RDIR - redirecting to admin',
        "RDIR - don't get me wrong, but this has to be done by someone else",
        'RDIR - go away, i do not want to do this',
        'RDIR - check at https://www.google.com/ how the request should been done',
        'RDIR - check at https://www.duckduckgo.com/ to see how software works',
    ],
    "400", [
        'ERR - what did you ask me to do? you crazy?',
        'ERR - could not find file, will never try again!',
        'ERR - E0131: main function is not allowed to have generic parameters',
        'ERR - cmon, you dont need a supercomputer for a simple addition',
        'ERR - some error, cannot determine what went wrong, sorry',
        'ERR - E0026: A struct pattern attempted to extract a nonexistent field from a struct.',
    ],
    "500", [
        'INFO - dont push me, cause im close to the edge!',
        'INFO - you have to wait - out for lunch!',
        'INFO - gimme more MEM if you keep requesting that',
        'INFO - gimme more CPU if you keep calculating that',
        'INFO - requesting the same thing AGAIN! = using cached result!!',
        'INFO - checking for undefined symbols for architecture x86_64',
    ],
    "600", [
        'PANIC - exiting process, going to australia',
        'PANIC - cowardly refusing to process empty list',
        'PANIC - aaaaaaahhhhhhhhhhhhh, help, help, help at ADR 0012f980 09de9000',
        'PANIC - typedef struct _OBJECT_ATTRIBUTES {...} this wont work on unix!!',
    ],
);

@allStatus = keys %messages;

for ($i = 0; $i < $count; $i += 1) {
    my $state = getRandomStatus(\@allStatus);
    my $message = getRandomMessage($messages{$state});

    waitSomeMs();
    printError($state, $message);
}
