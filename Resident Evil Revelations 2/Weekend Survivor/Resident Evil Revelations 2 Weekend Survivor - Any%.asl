state("rerev2", "5.00")
{
	int isInMission : "rerev2.exe", 0x11DD87C, 0x20, 0x204, 0x1A0, 0x24;
	int isMissionCompleted : "rerev2.exe", 0x117CCF4, 0x228;
}

//TODO : identify game versions
init
{
	version = "5.00";
}

startup
{
	vars.floor = 0;
}

start 
{
	// please start Livesplit after entering raid mode!
	if (current.isInMission == 1 && old.isInMission == 0 && vars.floor == 0)
	{
		vars.floor = 1;
		return true;
	}
}

split
{
	if (current.isMissionCompleted == 1 && old.isMissionCompleted == 0 && vars.floor >= 1 && vars.floor <= 30)
	{
		vars.floor = vars.floor + 1;
		return true;
	}
}

isLoading
{
	return current.isInMission == 0 || current.isMissionCompleted == 1;
}