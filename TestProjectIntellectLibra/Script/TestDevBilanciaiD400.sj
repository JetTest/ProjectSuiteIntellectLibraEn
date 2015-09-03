﻿//USEUNIT GlobalVariables
//USEUNIT GlobalFunctions
//USEUNIT GUIGlobalNames

// Open pop-up Intellect menu, go to equipment tab, setup Dev.Bilanciai.D400  
function SetDevBilanciaiD400()
{ 
  // Local variables
  var deviceName = "Dev.Bilanciai.D400";
      
  // Set libra device
  // Select weighen module
  selectWeighenModule();
  
  // Choose device and make sets
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("Com");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
  
  // Set addition options
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
  
  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1).WPFObject("_PanelHolder").WPFObject("ComPortOnlyPanel", "", 1).WPFObject("_PanelView").WPFObject("GroupBox", "Connection", 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Button", en_Ok, 1).ClickButton();
  
  // Press OK and Appy in Libra en_advanced options
  pressOkayButtonLibraAdvanced();
  
  SendSetDevBilanciaiD400MessageToLibraMonitor();    
}

//// Open pop-up Intellect menu, go to equipment tab, setup Dev.Bilanciai.D400 with Net radiobutton  
//function SetDevBilanciaiD400Net()
//{ 
//  // Local variables
//  var deviceName = "Dev.Bilanciai.D400";
//      
//  // Set libra device
//  // Select weighen module
//  selectWeighenModule();
//  
//  // Local variables
//  var deviceName = "Dev.Bilanciai.D400";
//      
//  // Set libra device
//  // Select weighen module
//  selectWeighenModule();
//  
//  // Choose device and make sets
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("Com");
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
//  
//  // Set addition options
//  var grid;
//  var grid2;  
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
//  grid = Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1);
//  grid2 = grid.WPFObject("_PanelHolder").WPFObject("PanelView", "", 1).WPFObject("_PanelView");
//  grid2.WPFObject("GroupBox", en_connection, 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
//  //grid2.WPFObject("GroupBox", "Total weight", 2).WPFObject("Grid", "", 1).WPFObject("RadioButton", "Net", 2).ClickButton();
//  
//  // Press OK in Libra en_advanced options
//  pressOkayButtonLibraAdvanced();
//  
//  SendSetDevBilanciaiD400MessageToLibraMonitor();
//}
 

function SendSetDevBilanciaiD400MessageToLibraMonitor()
{
  var Port;
  var netto = 890;
  var tara = 890;
  var brutto = netto + tara; 
    
  //Port = dotNET.System_IO_Pots.SerialPort.zctor_4("COM11", 9600);
  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);
    
  Port.Open();

  //Writing data to the port
  for(var cntr = 0; cntr < 30; cntr++)
  {  
    Port.Write("$000000" + netto + " 000000" + tara + " kg 0200\r\n");
    aqUtils.Delay(1000)  
  }  
    
  Port.Close();
  
  // Compare output with input values
  // Compare i/o netto value
  var nettoMonitor = 
  Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();

  compareVariables(nettoMonitor, netto);
  
  // Compare i/o tara value
  var taraMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 2).WPFObject("Label", "", 2).get_Content();
  
  compareVariables(taraMonitor ,tara);
  
  // Compare i/o brutto value
  
  var bruttoMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("StackPanel", "", 1).WPFObject("Grid", "", 3).WPFObject("Label", "", 2).get_Content();
  
  compareVariables(bruttoMonitor, brutto);
}
