   M S B A M L   `   `   `  ????G  CParfume_shop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Parfume_shop.WindowsParfume_shop.Windows  5   	   &     Parfume_shop.Windows.AdminWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Parfume_shop.Windows     5   	     ? Title$  AdminWindow??5   	   $	??450??6   $	??800??6*   ???#FFFFFF$	??800??6K   $	??450??6Z    ? WindowStartupLocation$ CenterScreen=?6j    ? Icon$ /Windows/logo.png??6?   .??5	      ?  ? RowDefinitions 5
   
   ?? 5      $	??80* ?6   ?? 5      $
??374* ?6   ?? 5      $	??60* ?6   .+?5   
   ?? $??Stretch=?6   ???#B3F4E9$??Stretch=?6B   $??0??6^   ?? 5   
   $
??Wrap=?6   $B??<ДОБРО ПОЖАЛОВАТЬ, АДМИНИСТРАТОР!??6(   $??Times New Roman)?6P   $??24(?6m   $
??Bold"?6{    ?? TextAlignment$
 Left=?6?   $??Center=?6?   $??38??6?   $??Center=?6?   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ Products??5      $??1??6%      AutoGenerateColumns .     
IsReadOnly .    ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6`   $??Times New Roman)?6p   $
??Bold"?6?   	   CanUserReorderColumns	 .  
   CanUserResizeColumns
 .     Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Номер товара??6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   ?? *
Product_id+  5      $ Артикул??6%    66   ?? *Vendor_code+  5      $ Название??6%    67   ?? *Name+  5      $ Измерение??6%    68   ?? *Unit+  5      $ Стоимость??6%    68   ?? *Cost+  5      $ Скидка??6%    65   ?? *MaxDiscount+5      ?? 5   
   $??Stretch=?6   ???#B3F4E9$??Stretch=?6B   $??3??6^   5      5      