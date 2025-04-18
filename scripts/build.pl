use strict;
use warnings;
use POSIX ();
use Git::Repository;
use YAML;
use Data::Dumper;


if (@ARGV != 1) {
	die "Usage: $0 <watch | build | fetch>"
}

my ($action) = @ARGV;

watch() if $action eq 'watch';
build() if $action eq 'build';
fetch() if $action eq 'fetch';


# Watch Command
sub watch {
	$SIG{'TERM'} = sub {
		print  "got SIGTERM\n";
		die "Stopping";
	};

	$SIG{'INT'} = sub {
		print  "got SIGINT\n";
		die "Stopping";
	};

	print "Watching...\n";
	watch_tailwind();
	watch_zola();

	while (1) {
		sleep 20;
		fetch()
	}
}

sub watch_tailwind {
	system("tailwindcss -i sass/style.scss -o static/styles/main.css --watch &");
}

sub watch_zola {
	system("zola serve &");
}

# Build Command
sub build {
	print "Building...\n";
	system("tailwindcss -i sass/style.scss -o static/styles/main.css");
	system("zola build")
}

# Fetch Command
sub fetch {
	print "Updating .data.yml\n";

	my $data = {
		git => fetch_git()
	};


	print "Open .data.yml for writing\n";
	open(my $fh, '>', './.data.yml');
	print $fh "# This file is automatically generated. Data will be overwritten by build.pl script\n";
	print $fh Dump $data;
	close $fh;
	print "Wrote .data.yml\n"
}

sub fetch_git {
	print "Fetching git repository meta...\n";

	my $repo = Git::Repository->new();
	my $rev = $repo->run('rev-parse', '--verify', 'HEAD');
	my $shortrev = $repo->run('rev-parse', '--short', 'HEAD');

	my $data = {
		rev => $rev,
		shortrev => $shortrev
	};

	return $data
}
