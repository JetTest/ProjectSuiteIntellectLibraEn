//USEUNIT GlobalVariables
//USEUNIT GlobalFunctions

// Open pop-up Intellect menu, go to equipment tab, setup Dev.EsitART  
function SetDevEsitART()
{ 
  // Local variables
  var deviceName = "Dev.Esit.ART";

  // Set libra device
  // Select weighen module
  selectWeighenModule();
  
  // Choose device and make sets
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("Com");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
  
  // Set addition options
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).
  WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1).
  WPFObject("_PanelHolder").WPFObject("Panel", "", 1).WPFObject("_PanelView").
  WPFObject("GroupBox", en_connection, 1).WPFObject("Grid", "", 1).
  WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  
  // Press OK in Libra "Advanced" options
  pressOkayButtonLibraAdvanced();      
    
}

 

function SendSetDevEsitARTMessageToLibraMonitor()
{
  var Port;
  var messagesPerSecond = 30;  
  var mass = 700;
    
  //Port = dotNET.System_IO_Pots.SerialPort.zctor_4("COM11", 9600);
  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);

  Port.Close();
      
  Port.Open();

  //Writing data to the port
  for(var cntr = 0; cntr < messagesPerSecond; cntr++)
  {  
    Port.Write("@000" + mass + "\r\n");   
    aqUtils.Delay(1000);
  }  
  
  Port.Close();
  
  // Check the color of output value on monitor  
  var colour = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("Border", "", 1).WPFObject("Label", "????", 1).get_Foreground();
  colour = colour.ToString();
  
  checkColour(colour);  
  
  // Compare output with input values
  
  // Compare i/o netto value  
  var massMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").
  WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).
  WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).
  WPFObject("_root").WPFObject("Border", "", 1).
  WPFObject("Label", "??????", 1).get_Content()
    
  compareVariables(massMonitor, mass);
  
}
