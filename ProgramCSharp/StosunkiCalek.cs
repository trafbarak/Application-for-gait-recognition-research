using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProgramCSharp
{
	public partial class StosunkiCalek : Form
	{
		public StosunkiCalek(List<double[,]> data)
		{
			InitializeComponent();

			specialDataTable1.Text = "Stosunki prawo/lewo";
			specialDataTable2.Text = "Stosunki biodro/kolano/stopa";
			specialDataTable3.Text = "Różnice biodro/kolano/stopa";
			specialDataTable4.Text = "Stosunki (biodro-kolano)/(kolano-stopa)";
			specialDataTable1.DataSource = data[0].ToDataTable(new string[] { "Staw", "Wartosc" }, new string[] { "Biodra", "Kolana", "Stopy" });
			specialDataTable2.DataSource = data[1].ToDataTable(new string[] { "Stosunek", "Prawa", "Lewa" }, new string[] { "Biodro/Kolano", "Kolano/Stopa", "Biodro/Stopa" });
			specialDataTable3.DataSource = data[2].ToDataTable(new string[] { "Różnica", "Prawa", "Lewa" }, new string[] { "Biodro-Kolano", "Kolano-Stopa", "Biodro-Stopa" });
			specialDataTable4.DataSource = data[3].ToDataTable(new string[] { "Stosunek różnic", "Prawa", "Lewa" }, new string[] { "(B-K)/(K-S)" });
		}
	}
}
