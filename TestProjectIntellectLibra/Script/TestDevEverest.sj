﻿//USEUNIT GlobalVariables
//USEUNIT GlobalFunctions

// Open pop-up Intellect menu, go to equipment tab, setup Dev.Everest  
function SetDevEverest()
{ 
  // Local variables
  var deviceName = "Dev.Everest";
  
  // Set libra device
  // Select weighen module
  selectWeighenModule();
  
  // Choose device and make sets
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("COM");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
  
  // Set addition options
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();

  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1).WPFObject("_PanelHolder").WPFObject("PlatformStaticWeightPanel", "", 1).WPFObject("_PanelView").WPFObject("GroupBox", en_connection, 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  
  // Press OK in Libra "Advanced" options
  pressOkayButtonLibraAdvanced();      
  
  // Press Apply in Intellect system
  pressApplyButtonLibraAdvanced();
}

 

function SendSetDevEverestMessageToLibraMonitor()
{
  var Port;
  var messagesPerSecond = 30;  
  var mass = 890;  

  var message = " 00890\r\n";
        
  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);
    
  Port.Open();

  //Writing data to the port
  for(var cntr = 0; cntr < messagesPerSecond; cntr++)
  {  
    Port.Write(message);
    aqUtils.Delay(1000);   
  }  
      
  Port.Close();
   
  var massMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("Label", "??????", 1).get_Content();
  
  var colour = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("Label", "??????", 1).get_Foreground(); 
 
  colour = colour.ToString();
  
  checkColour(colour);
  
  Log.Message(typeOf(massMonitor));
  Log.Message(typeOf(mass));
  
  //massMonitor = aqConvert.StrToInt(massMonitor);
  massMonitor = aqConvert.StrToInt(massMonitor);
  mass = aqConvert.StrToInt(mass);
  
  Log.Message(typeOf(massMonitor));
  Log.Message(typeOf(mass));

  compareVariables(massMonitor, mass);
}
