using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProgramCSharp
{
	public partial class SpecialDataTable : UserControl
	{
		public new string Text 
		{ 
			get { return groupBox1.Text; } 
			set { groupBox1.Text = value; } 
		}

		public DataTable DataSource
		{
			get { return dataGridView1.DataSource as DataTable; }
			set { dataGridView1.DataSource = value; }
		}

		public SpecialDataTable()
		{
			InitializeComponent();
		}

		public SpecialDataTable(string name, DataTable dataTable)
		{
			Name = name;
			DataSource = dataTable;
		}
	}
}
