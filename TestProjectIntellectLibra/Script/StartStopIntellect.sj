﻿//USEUNIT GUIGlobalNames

// Start Intellect
function StartIntellect()
{
  process1 = Sys.WaitProcess("intellect");
  
  if (process1.Exists)  
  {
      // Continue script execution
      Log.Message("The process " + TestedApps.intellect.FileName + " already exist.");
  }
  else
  {
    Log.Message("The process " + TestedApps.intellect.FileName + " does not exist.");
    
    TestedApps.intellect.Run();
    
    process2 = Sys.WaitProcess("intellect", 15000);
    
    if (process2.Exists)  
    {
      
      // Continue script execution
      Log.Message("The process " + TestedApps.intellect.FileName + " exist.");
    }
    else
    {
      Log.Error("The process " + TestedApps.intellect.FileName + " does not exist.");
    }
  
  }
  
}

// Stop Intellect
function StopIntellect()
{
  Sys.Process("explorer").Window("Progman", "Program Manager").
  Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").Click(1917, 0);    
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(244, 14);
  Sys.Process("intellect").WaitWindow("AfxFrameOrView100", "CORE", -1, 3000);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.Click(en_logOff);
  
  aqUtils.Delay(5000);
  
  p = Sys.WaitProcess("intellect");
  
  if (p.Exists)  
  {
      // Continue script execution
      Log.Error("The process " + TestedApps.intellect.FileName + " exist.");
  }
  else
      Log.Message("The process " + TestedApps.intellect.FileName + " does not exist.");  
}

