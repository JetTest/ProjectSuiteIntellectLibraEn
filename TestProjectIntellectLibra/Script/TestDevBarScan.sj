////USEUNIT GlobalVariables
////USEUNIT GlobalFunctions
//  
//// Open pop-up Intellect menu, go to equipment tab, setup Dev.BarScan  
//function SetDevBarScan()
//{ 
//  // Local variables 
//  var deviceName = "Dev.BarScan";
//  
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
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
//  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).
//  WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1).
//  WPFObject("_PanelHolder").WPFObject("Panel", "", 1).WPFObject("_PanelView").
//  WPFObject("GroupBox", en_connection, 1).WPFObject("Grid", "", 1).
//  WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
//  
//   
//  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", en_advanced).
//  WPFObject("MainWindow", en_advanced, 1).WPFObject("Grid", "", 1).
//  WPFObject("StackPanel", "", 1).WPFObject("Button", "ОК", 1).ClickButton();
//  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("Button", "", 1).ClickButton();      
//  
//}
//
// 
//
//function SendSetDevBarScanMessageToLibraMonitor()
//{
//  var Port;
//    
//  //Port = dotNET.System_IO_Pots.SerialPort.zctor_4("COM11", 9600);
//  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);
//    
//  Port.Open();
//
//  //Writing data to the port
//  for(var cntr = 0; cntr < 10; cntr++)
//  {  
//    Port.Write("HI!!!\r\n");
//    aqUtils.Delay(1000);   
//  }  
//    
//  Port.Close();
//}
