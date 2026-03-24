#include <stdlib.h>
#include <pwd.h>
#include <stdio.h>
#include <unistd.h>

/*
Luc's SEC335 Illustrate SUID
Provided by Class Activity 10.1 from Furkan's Eth Hack 335
Run 'sudo chown root:root nameofprogram' and
'sudo chmod u+s nameofprogram' before running this program
*/

int main(int argc, char *argv[])
{
	struct passwd *pw;
	uid_t uid;

	uid = geteuid ();
	pw = getpwuid (uid);
	if (pw)
	{
		puts (pw->pw_name);
		exit (EXIT_SUCCESS);
	}
	else
	{
	puts ("ERROR");
	exit (EXIT_FAILURE);
	}
}
