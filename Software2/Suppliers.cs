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
	public partial class Suppliers : Form
	{
		public Suppliers()
		{
			InitializeComponent();
		}

		private void Suppliers_Load(object sender, EventArgs e)
		{
			// TODO: This line of code loads data into the 'coffeeShopChristouDataSet.Suppliers' table. You can move, or remove it, as needed.
			this.suppliersTableAdapter.Fill(this.coffeeShopChristouDataSet.Suppliers);

		}
	}
}
