//USEUNIT GUIGlobalNames

function testResolution()
{
  var height = 0;
  var width = Sys.Desktop.Width-3;
  
  // Open device tab
  Sys.Process("explorer").Window("Progman", "Program Manager").
  Window("SHELLDLL_DefView").Window("SysListView32", "FolderView").
  Click(width, height);
        
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").Click(244, 14);
  Sys.Process("intellect").WaitWindow("AfxFrameOrView100", "CORE", -1, 2000);
  Sys.Process("intellect").Window("AfxFrameOrView100", "CORE").PopupMenu.
  Click(en_systemSettings);
}