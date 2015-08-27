﻿//USEUNIT GlobalVariables

function compareVariables(output, input)
{
  if(output != input)
  {
    Log.Error("Error, " + input + " ! = " + output +", output value not eqaul to input value");
  }
  else 
  {
    Log.Message("Correct, output value is eqaul to input value");
  }
}

function checkColour(colour)
{
  if(colour == "#FFEAEB20")
  {
    colour = "Yellow";
    Log.Error(colour + " colour, not correct. "+ messagesPerSecond +" messages per second was sent");
  }	
  else if(colour == "#FF58C81B")
  {
    colour = "Green";
    Log.Message(colour + " colour, correct"); 
  }
  else
  {
    colour = "colour";
    Log.Error(colour + "is not correect");
  }
}

// Open device tab
function selectDeviceTab()
{
  // Open device tab
  Sys.Process("explorer").Window("Progman", "Program Manager").
  Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").Click(1917, 0);    
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(244, 14);
  Sys.Process("intellect").WaitWindow("AfxFrameOrView100", "CORE", -1, 2000);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.Click("Настройка системы");
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(1901, 24);
}

// Select weighen module
function selectWeighenModule()
{
  // Select weighen module
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").ClickItem("|" + PCNAME);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").ClickItem("|" + PCNAME);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").ExpandItem("|" + PCNAME);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").ClickItem("|" + PCNAME + "|" + WEIGHINGMODULENAME);
}

