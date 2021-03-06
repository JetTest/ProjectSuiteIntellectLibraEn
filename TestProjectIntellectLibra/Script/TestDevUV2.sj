﻿//USEUNIT GlobalVariables
//USEUNIT GlobalFunctions

// Open pop-up Intellect menu, go to equipment tab, setup Dev.UV2  
function SetDevUV2()
{ 
  // Local variables
  var deviceName = "Dev.UV2";
  
  // Set libra device
  // Select weighen module
  selectWeighenModule();
    
  // Choose device and make sets
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 1).ClickItem(deviceName);
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 2).ClickItem("COM");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("ComboBox", "", 3).ClickItem("1.1");
  
  // Set addition options
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("#32770").Window("#32770", "", 2).Window("Button", en_advanced + "...").ClickButton();
  
  Sys.Process("intellect").WPFObject("HwndSource: MainWindow", "Advanced").WPFObject("MainWindow", "Advanced", 1).WPFObject("Grid", "", 1).WPFObject("_PanelHolder").WPFObject("ComPortOnlyPanel", "", 1).WPFObject("_PanelView").WPFObject("GroupBox", "Connection", 1).WPFObject("Grid", "", 1).WPFObject("ComboBox", "", 1).ClickItem(COMPORT_FOR_LIBRA_CONNECTION);
  
  
  // Press OK in Libra "Advanced" options
  pressOkayButtonLibraAdvanced();      
  
  // Press Apply in Intellect system
  pressApplyButtonLibraAdvanced();
}

 

function SendSetDevUV2MessageToLibraMonitor()
{
 var Port;
  var messagesPerSecond = 30;  
  
  // Initialize input variables
  var currentWeight= "1200";
  
  var totalWeight = "1200";
  
  var textBox1 = "10";
  var textBox2 = "20"; 
  var textBox3 = "300";
  var textBox4 = "400";
  var textBox5 = "50";
  var textBox6 = "50";
  var textBox7 = "50";
  var textBox8 = "50"; 
  
     
//  
  var message = "ALL " + currentWeight + " " + textBox1 + " " + textBox2 + " " 
  + textBox3 + " " + textBox4 + " " + textBox5 + " " + textBox6 + " " 
  + textBox7 + " " + textBox8 + " 8 " + totalWeight + " 0 1 0 108\r\n"  
  
  Port = dotNET.System_IO_Ports.SerialPort.zctor_7("COM11", 9600, "None", 8, 1);
    
  Port.Open();

  //Writing data to the port
  for(var cntr = 0; cntr < messagesPerSecond; cntr++)
  {  
  
    Port.Write(message);
    
    aqUtils.Delay(1000);   
  }  
      
  Port.Close();
 
  
  // Initialize weighing monitor output variables  
  var currentWeightMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 9).get_Text(); 
  
  var totalWeightMonitor = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 10).get_Text();
  
  var textBoxMonitor1 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 1).get_Text();
  var textBoxMonitor2 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 2).get_Text(); 
  var textBoxMonitor3 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 3).get_Text();
  var textBoxMonitor4 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 4).get_Text();
  var textBoxMonitor5 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 5).get_Text();
  var textBoxMonitor6 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 6).get_Text();
  var textBoxMonitor7 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 7).get_Text();
  var textBoxMonitor8 = Sys.Process("VitLibraView").WPFObject("HwndSource: _window").WPFObject("_window").WPFObject("MainView", "", 1).WPFObject("Grid", "", 1).WPFObject("ContentControl", "", 1).WPFObject("DriverView", "", 1).WPFObject("_root").WPFObject("WeightView", "", 1).WPFObject("Border", "", 1).WPFObject("Grid", "", 1).WPFObject("TextBox", "", 8).get_Text(); 
 
  // Convert to integer type 
  currentWeightMonitor = aqConvert.StrToInt(currentWeightMonitor);
  totalWeightMonitor = aqConvert.StrToInt(totalWeightMonitor);
  textBoxMonitor1 = aqConvert.StrToInt(textBoxMonitor1);
  textBoxMonitor2 = aqConvert.StrToInt(textBoxMonitor2);
  textBoxMonitor3 = aqConvert.StrToInt(textBoxMonitor3);
  textBoxMonitor4 = aqConvert.StrToInt(textBoxMonitor4);
  textBoxMonitor5 = aqConvert.StrToInt(textBoxMonitor5);
  textBoxMonitor6 = aqConvert.StrToInt(textBoxMonitor6);
  textBoxMonitor7 = aqConvert.StrToInt(textBoxMonitor7);
  textBoxMonitor8 = aqConvert.StrToInt(textBoxMonitor8);
  
  currentWeight = aqConvert.StrToInt(currentWeight);
  totalWeight = aqConvert.StrToInt(totalWeight);
  textBox1 = aqConvert.StrToInt(textBox1);
  textBox2 = aqConvert.StrToInt(textBox2);
  textBox3 = aqConvert.StrToInt(textBox3);
  textBox4 = aqConvert.StrToInt(textBox4);
  textBox5 = aqConvert.StrToInt(textBox5);
  textBox6 = aqConvert.StrToInt(textBox6);
  textBox7 = aqConvert.StrToInt(textBox7);
  textBox8 = aqConvert.StrToInt(textBox8);
    
  // Compare input with output variables compareVariables([var output][var input])
  compareVariables(currentWeightMonitor ,currentWeight);
  compareVariables(totalWeightMonitor , totalWeight);
  compareVariables(textBoxMonitor1 , textBox1);
  compareVariables(textBoxMonitor2 , textBox2);
  compareVariables(textBoxMonitor3 , textBox3);
  compareVariables(textBoxMonitor4 , textBox4);
  compareVariables(textBoxMonitor5 , textBox5);
  compareVariables(textBoxMonitor6 , textBox6);
  compareVariables(textBoxMonitor7 , textBox7);
  compareVariables(textBoxMonitor8 , textBox8);
  
}
