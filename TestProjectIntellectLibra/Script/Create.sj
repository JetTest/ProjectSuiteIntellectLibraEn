function CreateWeighingModule()
{
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").ClickItemR("|LOCALHOST");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("SysTreeView32").PopupMenu.Click("Создать объект|Модуль взвешивания");
  Sys.Process("intellect").Window("Afx:*", "Navigator").Window("Button", "", 1).ClickButton();
}