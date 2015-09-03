//USEUNIT GlobalVariables
//USEUNIT GlobalFunctions

// Open pop-up Intellect menu, go to equipment tab, setup Dev.R420  
function SetDevR420()
{ 
  // Local variables
  var deviceName = "Dev.R420";
  
  // Set libra device
  // Select weighen module
  selectWeighenModule();
  
  // Choose device and make sets
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("COM");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
  
  // Set addition options
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1).
  WPFObject("_PanelHolder").WPFObject("ComPortOnlyPanel", "", 1).WPFObject("_PanelView").
  WPFObject("GroupBox", en_connection, 1).WPFObject("Grid", "", 1).
  WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  
  // Press OK in Libra "Advanced" options
  pressOkayButtonLibraAdvanced();      
  
}

 

function SendSetDevR420MessageToLibraMonitor()
{
  var Port;
  var messagesPerSecond = 30;
  
  var massRow1 = 4483;
  var massRow2 = 4686;
  var massRow3 = 4422;
  var massRow4 = 4520;
  var massRow5 = 5195;
  var massRow6 = 4713;
  var massRow7 = 5180;
  
  var massNumRow1 = 1;
  var massNumRow2 = 2;
  var massNumRow3 = 3;
  var massNumRow4 = 4;
  var massNumRow5 = 5;
  var massNumRow6 = 6;
  var massNumRow7 = 7;
  
  var sumTotal = 33199;
     
  var message = "000003115     4483kg\r\n000003116     4686kg\r\n000003117     4422kg\r\n000003118     4520kg\r\n000003119     5195kg\r\n000003120     4713kg\r\n000003121     5180kg\r\nTOTAL:    33199kg\r\n";

    
  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);
    
  Port.Open();

  //Writing data to the port
  for(var cntr = 0; cntr < messagesPerSecond; cntr++)
  {    
    Port.Write(message);
    
    aqUtils.Delay(1000);   
  }  
      
  Port.Close();
  
  var sumTotalMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 2).WPFObject("Label", "", 1).get_Content();
  
  var massMonitorRow1 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 1).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow2 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 2).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow3 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 3).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow4 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 4).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow5 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 5).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow6 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 6).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  var massMonitorRow7 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 7).WPFObject("Grid", "", 1).WPFObject("Label", "", 2).get_Content();
  
//  var massNumMonitorRow1 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 1).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();
//  var massNumMonitorRow2 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 2).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();
//  var massNumMonitorRow3 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 3).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();
//  var massNumMonitorRow4 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 4).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();
//  var massNumMonitorRow5 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 5).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();
//  var massNumMonitorRow6 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 6).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();;
//  var massNumMonitorRow6 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("ListBox", "", 1).WPFObject("ListBoxItem", "", 7).WPFObject("Grid", "", 1).WPFObject("Label", "", 1).get_Content();;
  
  compareVariables(sumTotalMonitor, sumTotal);
    
  compareVariables(massMonitorRow1, massRow1);
  compareVariables(massMonitorRow2, massRow2);
  compareVariables(massMonitorRow3, massRow3);
  compareVariables(massMonitorRow4, massRow4);
  compareVariables(massMonitorRow5, massRow5);
  compareVariables(massMonitorRow6, massRow6);
  compareVariables(massMonitorRow7, massRow7);
}
