//USEUNIT GUIGlobalNames

// Show pop-up Intellect menu
function showIntellectPopUPMenu()
{
  // Open device tab
  //aqUtils.Delay(30000);
  Sys.Process("explorer").Window("Progman", "Program Manager").Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").Click(1917, 0);
      
  Sys.Process("intellect").WaitWindow("AfxFrameOrView100", "CORE", -1, 10000);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(244, 14);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.Click(en_systemSettings);
}

// Hide pop-up Intellect menu
function hideIntellectPopUPMenu()
{
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(1897, 23);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.Click(en_systemSettings);
}