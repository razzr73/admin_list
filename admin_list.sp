#include <sourcemod>
#include <morecolors>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Admin List",
	author = "xd",
	description = "Shows online admins.",
	version = "1.0",
	url = ""
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_admins", CMD_ADMINS, "Shows Online Admins");
}

public Action CMD_ADMINS(int client, int args)
{
	int count=0;
	CPrintToChat(client,"{ghostwhite}++++++++++{fullred}[{yellow}ADMINS{fullred}]{ghostwhite}++++++++++");
	for(int i=1; i<=MaxClients; i++)
	{
		if(IsClientInGame(i))
		{
			AdminId playerAdmin = GetUserAdmin(i);	
			if(GetAdminFlag(playerAdmin, Admin_Generic, Access_Effective) && !IsFakeClient(i))
			{
				if (GetAdminFlag(playerAdmin, Admin_Root, Access_Effective))
				{
					char adminName[50];
					GetClientName(i,adminName, sizeof(adminName));
					CPrintToChat(client,"{ghostwhite}[{lime}OWNER{ghostwhite}]  {fullred}%s", adminName);
					count++;
				}
				else if (GetAdminFlag(playerAdmin, Admin_Custom2, Access_Effective))
				{
					char adminName[50];
					GetClientName(i, adminName, sizeof(adminName));
					CPrintToChat(client,"{ghostwhite}[{cyan}ELDER{ghostwhite}]  {red}%s", adminName);
					count++;
				}
				else if (GetAdminFlag(playerAdmin, Admin_Custom3, Access_Effective))
				{
					char adminName[50];
					GetClientName(i, adminName, sizeof(adminName));
					CPrintToChat(client,"{ghostwhite}[{cyan}SUPER-ADMIN{ghostwhite}]  {red}%s", adminName);
					count++;
				}
				else
				{
					char adminName[50];
					GetClientName(i, adminName, sizeof(adminName));
					CPrintToChat(client,"{ghostwhite}[{cyan}ADMIN{ghostwhite}]  {red}%s", adminName);
					count++;
				}
			}
		}
	}
	
	if(count == 0)
	{
		CPrintToChat(client, "{fullred}No admins are online.");
	}
	
	CPrintToChat(client, "{ghostwhite}++++++++++++++++++++++++++++");
	return Plugin_Handled;
}

