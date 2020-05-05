using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Software2
{
    public partial class main : Form
    {
        public main()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Suppliers sup = new Suppliers();
            sup.Show();
            this.Hide();
        }

        private void btnSales_Click(object sender, EventArgs e)
        {
            Form AddMonthlySales = new AddMonthlySales();
            AddMonthlySales.Show();
        }
    }
}
