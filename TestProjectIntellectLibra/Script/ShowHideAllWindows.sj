function HideAllWindows()
{
  Sys.Process("explorer").Window("Shell_TrayWnd", "", 1).
  Window("TrayNotifyWnd", "", 1).
  Window("TrayShowDesktopButtonWClass", "", 1).Click();
}

function ShowAllWindows()
{
  Sys.Process("explorer").Window("Shell_TrayWnd", "", 1).
  Window("TrayNotifyWnd", "", 1).
  Window("TrayShowDesktopButtonWClass", "", 1).Click();
}