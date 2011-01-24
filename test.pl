#!/usr/bin/perl

print "# BEGIN TEST ############################################################\n";
use Geni;
print "Using Geni.pm version $Geni::VERSION", "\n";

my $geni = new Geni('erin@thespicelands.com', 'msjeep') or print $Geni::errstr, "\n";

do_tree_conflicts();

sub do_tree_conflicts(){
	print "calling get_tree_conflicts\n";
	my $list = $geni->get_tree_conflicts() or print "$Geni::errstr\n" && die;
	my $count = 0;
	#while(my $conflict = $list->get_next()){
	print "calling get_next\n";
	my $conflict = $list->get_next();
		$count++;
		print "$count. type: ", $conflict->get_type(), "\n\t",
			"profile: ", $conflict->get_profile(), "\n\t",
			"actor: ", $conflict->get_actor(), "\n\t",
			"page_num: ", $conflict->get_page_num(), "\n\t",
			"managers: ", $conflict->get_managers(), "\n";
	print "calling fetch_conflict_array\n";
	my @profiles = $conflict->fetch_conflict_array();
	print "Next conflict array is: ", @profiles, "\n";
	#}
}
