using System;
using System.Windows.Forms;

namespace ProgramCSharp
{
	public partial class MainForm : Form
	{
		Matlab matlab = new Matlab();
		OpenFileDialog openFileDialog = new OpenFileDialog();

		public string FileName { get; private set; }
		public string ReferenceFileName { get; private set; }

		Staw staw;
		Os os;
		Plaszczyzna plaszczyzna;

		int poczatek, koniec, liczbaHarmonicznych, szerokoscOkna;

		public MainForm()
		{
			FileName = string.Empty;
			matlab.WczytajPlik(@"cd c:\temp\example");
			InitializeComponent();
			comboBoxJoint1D.DataSource = Stawy.StawToList();
			comboBoxAxis.DataSource = Osie.OsToList();
			comboBoxPlane.DataSource = Plaszczyzny.PlaszczyznaToList();
			openFileDialog.Filter = "Biovision hierarchical data (*.bvh)|*.bvh";
		}

		private void otwórzToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (openFileDialog.ShowDialog() == DialogResult.OK)
			{
				FileName = openFileDialog.FileName;
				labelFilePath.Text = FileName;
				matlab.WczytajPlik(FileName);
				labelRecordTime.Text = Math.Floor(matlab.CzasTrwaniaNagrania()) + "s";
				numericUpDownTimeTo.Minimum = 0.0M;
				numericUpDownTimeFrom.Minimum = 0.0M;
				numericUpDownTimeFrom.Maximum = (decimal)matlab.CzasTrwaniaNagrania();
				numericUpDownTimeTo.Maximum = (decimal)matlab.CzasTrwaniaNagrania() - 1;
				numericUpDown1.Maximum = (decimal)matlab.CzasTrwaniaNagrania() - 1;
				poczatek = (int)numericUpDownTimeFrom.Value;
				koniec = (int)numericUpDownTimeTo.Value;

			}
		}

		private void comboBoxAxis_SelectedIndexChanged(object sender, EventArgs e)
		{
			os = (Os)comboBoxAxis.SelectedValue;
			matlab.WyborOsi(os);
		}

		private void comboBoxJoint_SelectedIndexChanged(object sender, EventArgs e)
		{
			staw = (Staw)comboBoxJoint1D.SelectedValue;
			matlab.WyborStawu(staw);
		}

		private void buttonWykresTransformaty_Click(object sender, EventArgs e)
		{
			matlab.TransformataFouriera1D(poczatek, koniec);
		}

		private void comboBoxPlane_SelectedIndexChanged(object sender, EventArgs e)
		{
			plaszczyzna = (Plaszczyzna)comboBoxPlane.SelectedValue;
			matlab.WyborPlaszczyzny(plaszczyzna);
		}

		private void buttonWykresPrzebieguCzasowego_Click(object sender, EventArgs e)
		{
			matlab.RysowanieWykresu1D();
		}

		private void buttonWykresHarmonicznych_Click(object sender, EventArgs e)
		{
			matlab.SkuteczneHarmoniczne(poczatek, koniec, liczbaHarmonicznych);
		}

		private void button1_Click(object sender, EventArgs e)
		{
			matlab.TransformataFouriera2D(poczatek, koniec);
		}

		private void button2_Click(object sender, EventArgs e)
		{
			matlab.RysowanieWykresu2D();
		}

		private void numericUpDownTimeTo_ValueChanged(object sender, EventArgs e)
		{
			numericUpDownTimeFrom.Maximum = numericUpDownTimeTo.Value;
			koniec = (int)numericUpDownTimeTo.Value;
		}

		private void numericUpDownTimeFrom_ValueChanged(object sender, EventArgs e)
		{
			numericUpDownTimeTo.Minimum = numericUpDownTimeFrom.Value;
			poczatek = (int)numericUpDownTimeFrom.Value;
		}

		private void numericUpDownNumberOfHarmonics_ValueChanged(object sender, EventArgs e)
		{
			liczbaHarmonicznych = (int)numericUpDownNumberOfHarmonics.Value;
		}

		private void usawBiezacyJakoWzorcowyToolStripMenuItem_Click(object sender, EventArgs e)
		{
			matlab.UstawBiezacySkeletonJakoWzorcowy();
		}

		private void otwórzToolStripMenuItem1_Click(object sender, EventArgs e)
		{
			if (openFileDialog.ShowDialog() == DialogResult.OK)
			{
				ReferenceFileName = openFileDialog.FileName;
				matlab.WczytajPlikWzorcowy(ReferenceFileName);
			}
		}

		private void buttonDTW_Click(object sender, EventArgs e)
		{
			matlab.AlgorytmDTW(szerokoscOkna);
		}

		private void numericUpDown1_ValueChanged(object sender, EventArgs e)
		{
			szerokoscOkna = (int)numericUpDown1.Value;
		}

		private void button1_Click_1(object sender, EventArgs e)
		{
			matlab.LiczCalki();
			var dane = matlab.StosunkiCalek();
			StosunkiCalek sc = new StosunkiCalek(dane);
			sc.Show();
		}

		private void buttonCzysc_Click(object sender, EventArgs e)
		{
			matlab.Czysc();
		}

		private void buttonZapisz_Click(object sender, EventArgs e)
		{
			matlab.ZapiszStosunkiCalek();
		}


	}
}
