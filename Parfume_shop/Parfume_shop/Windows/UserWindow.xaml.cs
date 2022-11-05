using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Parfume_shop.Windows
{
    /// <summary>
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        public UserWindow()
        {
            InitializeComponent();
            FillProductTable();
        }

        public void FillProductTable()
        {
            try
            {
                Parfume_dbEntities1 db = new Parfume_dbEntities1();
                Products.ItemsSource = db.Product.ToList();
            }
            catch
            {
                MessageBox.Show("Произошла ошибка связи с базой данных, исправьте ошибку!");
            }
        }
    }
}
