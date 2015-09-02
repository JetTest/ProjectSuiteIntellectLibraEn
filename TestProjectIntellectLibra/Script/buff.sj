﻿//USEUNIT GUIGlobalNames
//USEUNIT GlobalVariables

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

function Test1()
{
  var grid;
  var grid2;
  grid = Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1);
  grid2 = grid.WPFObject("_PanelHolder").WPFObject("PanelView", "", 1).WPFObject("_PanelView");
  grid2.WPFObject("GroupBox", "Connection", 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  grid2.WPFObject("GroupBox", "Total weight", 2).WPFObject("Grid", "", 1).WPFObject("RadioButton", "Gross", 1).ClickButton();
  grid.WPFObject("StackPanel", "", 1).WPFObject("Button", "OK", 1).ClickButton();
}

function Test2()
{
  var grid;
  var grid2;
  grid = Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1);
  grid2 = grid.WPFObject("_PanelHolder").WPFObject("PanelView", "", 1).WPFObject("_PanelView");
  grid2.WPFObject("GroupBox", "Connection", 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem("COM10");
  grid2.WPFObject("GroupBox", "Total weight", 2).WPFObject("Grid", "", 1).WPFObject("RadioButton", "Net", 2).ClickButton();
  grid.WPFObject("StackPanel", "", 1).WPFObject("Button", "OK", 1).ClickButton();
}

function Test3()
{
  var grid;
  grid = Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1);
  grid.WPFObject("_PanelHolder").WPFObject("ComPortOnlyPanel", "", 1).WPFObject("_PanelView").WPFObject("GroupBox", "Connection", 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem("COM10");
  grid.WPFObject("StackPanel", "", 1).WPFObject("Button", "OK", 1).ClickButton();
}