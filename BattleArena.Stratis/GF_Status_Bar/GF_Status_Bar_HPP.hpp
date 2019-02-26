


//________________  Author : [GR]GEORGE F ___________ 10.06.18 _____________

/*
________________ GF Status Bar Script ________________ 
________________ Originally created for Ravage ________________

https://forums.bohemia.net/forums/topic/217240-gf-status-bar-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

include this in the desrcription.ext :

//____________________________________________________
class RscTitles
{
	#include "GF_Status_Bar\GF_Status_Bar_HPP.hpp"	
};
//____________________________________________________

*/

//	https://community.bistudio.com/wiki/Dialog_Control

class RscStatusBar_Vanilla
{
        idd = -1;
		duration = 10000000000;
        onLoad = "uiNamespace setVariable ['RscStatusBar_Vanilla', _this select 0];";
		fadein = 0;
		fadeout = 0;
		movingEnable = 0;
		objects[] = {};

//____________________________________________________



//________________ Background Image ________________
class controlsBackground
{
		class statusBarImage_Vanilla
      {
       	idc = 55557;
		type = 0;
		style = 48;
	    x = safezoneX + safezoneW - 1.90;	//1.50 	left  	 1.20 	right	1.90 for 1920 ,	1.38 for 1024
        y = safezoneY + safezoneH - 0.075;	//70 	down 	 75 	up		0.075
        w = 1.38;
        h = 0.08;
        colorText[] = {1, 1, 1, 1};
		colorBackground[]={0,0,0,0};
		sizeEx = 0.4;
		font = "EtelkaMonospaceProBold";
        text = "GF_Status_Bar\images\Background.paa";	
		
		class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "EtelkaMonospaceProBold";
        };
      };
};



//________________ Images and status ________________
class controls
{
        class statusBarText_Vanilla
      {
        idc = 55554;
        x = safezoneX + safezoneW - 1.90;	//1.50 	left  	 1.20 	right	1.90 for 1920 ,	1.38 for 1024
        y = safezoneY + safezoneH - 0.070;	//70 	down 	 75 	up		0.070
        w = 1.38;
        h = 0.08;
        shadow = 1;
        font = "EtelkaMonospaceProBold";
        size = 0.040;
        type = 13;
		style = 2;
        text = "";
		
        class Attributes
        {
        align="center";
        color = "#ffffff";
        font = "EtelkaMonospaceProBold";
		// https://community.bistudio.com/wiki/FXY_File_Format#Available_Fonts
        };
      };
   };
};