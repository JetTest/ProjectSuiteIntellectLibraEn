function openDeviceTab()
{
  for(var i =0; i < 10; i++)
  {
    // Open device tab
    Sys.Process("explorer").Window("Progman", "Program Manager").
    Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").Click(1917, 0);    
    Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(244, 14);
    Sys.Process("intellect").WaitWindow("AfxFrameOrView100", "CORE", -1, 2000);
    Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.Click("Настройка системы");
    Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(1901, 24);
  }  
}

  
 