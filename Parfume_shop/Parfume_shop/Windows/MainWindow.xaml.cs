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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Parfume_shop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Enter_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int a = 0;
                Parfume_dbEntities1 db = new Parfume_dbEntities1();
                foreach (Users user in db.Users)
                {
                    if(user.Login == TextBox1.Text && user.Password== TextBox2.Text)
                    {
                        if(user.Role== "Администратор")
                        {
                            a = 1;
                            Windows.AdminWindow adminWindow = new Windows.AdminWindow();
                            this.Close();
                            adminWindow.ShowDialog();
                        }
                        if (user.Role == "Менеджер")
                        {
                            a = 1;
                            Windows.MenegerWindow menegerWindow = new Windows.MenegerWindow();
                            this.Close();
                            menegerWindow.ShowDialog();
                        }
                        if (user.Role == "Клиент")
                        {
                            a = 1;
                            Windows.UserWindow userWindow = new Windows.UserWindow();
                            this.Close();
                            userWindow.ShowDialog();
                        }
                    }
                }
                if (a == 0)
                {
                    MessageBox.Show("Пользователь не найден");
                }
            }
            catch
            {
                MessageBox.Show("Произошла ошибка связи с базой данных, исправьте ошибку!");
            }
        }
    }
}
