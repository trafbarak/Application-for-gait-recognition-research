using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace ProgramCSharp
{
	public class Matlab
	{
		MLApp.MLApp matlab = new MLApp.MLApp();

		public Matlab()
		{
			matlab.Execute(@"cd c:\temp\example");
			matlab.Execute("deklaracja_zmiennych");
		}

		public void WczytajPlik(string fileName)
		{
			matlab.Execute(@"[SKELETON, t] = loadbvh('" + fileName + @"');");
			Filtruj();
		}

		public void WczytajPlikWzorcowy(string fileName)
		{
			matlab.Execute(@"[SKELETON_WZORCOWY, ~] = loadbvh('" + fileName + @"');");
			Filtruj("SKELETON_WZORCOWY");
		}

		public void WyborStawu(Staw staw)
		{
			matlab.Execute(@"[staw, stawik] = wybor_stawu(" + (int)staw + ");");
		}

		public void WyborOsi(Os os)
		{
			matlab.Execute(@"[os, oska] = wybor_osi(" + (int)os + @");");
		}

		public void WyborPlaszczyzny(Plaszczyzna plaszczyzna)
		{
			matlab.Execute(@"[plaszczyzna] = wybor_plaszczyzny(" + (int)plaszczyzna + @");");
		}

		public void RysowanieWykresu1D()
		{
			matlab.Execute(@"rysowanie_wykresu_1D(t, SKELETON, os, oska, staw, stawik);");
		}

		public void TransformataFouriera1D(int pocz, int kon)
		{
			matlab.Execute(@"transformata_fouriera(" + pocz + ", " + kon + ", SKELETON, t, staw, oska);");
		}

		public void SkuteczneHarmoniczne(int pocz, int kon, int liczbaHarmonicznych)
		{
			matlab.Execute(@"skuteczne_harmoniczne(" + pocz + ", " + kon + ", SKELETON, t, oska, staw, stawik, " + liczbaHarmonicznych + ", kolory, znaczki);");
		}

		public void RysowanieWykresu2D()
		{
			matlab.Execute(@"rysowanie_wykresu_2D(t, SKELETON, staw, stawik, plaszczyzna);");
		}

		public void TransformataFouriera2D(int pocz, int kon)
		{
			matlab.Execute(@"transformata_fouriera_2D(" + pocz + ", " + kon + ", SKELETON, t, staw, plaszczyzna);");
		}

		public double CzasTrwaniaNagrania()
		{
			double czas = 0;
			string[] tokens = matlab.Execute(@"[czas] = dlugosc_pliku(t); czas").Split();
			string czasString = Array.Find(tokens, x => Array.IndexOf(x.ToCharArray(), '.') != -1);
			double.TryParse(czasString, NumberStyles.Number, CultureInfo.CreateSpecificCulture("en-US"), out czas);
			return czas;
		}

		private void Filtruj(string nazwaSkeletona = "SKELETON")
		{
			foreach (Os os in Enum.GetValues(typeof(Os)))
				foreach (Staw staw in Enum.GetValues(typeof(Staw)))
					Filtruj(staw, os);
		}

		private void Filtruj(Staw staw, Os os, string nazwaSkeletona = "SKELETON")
		{
			matlab.Execute(@"[SKELETON] = filtr(SKELETON, " + (int)staw + ", " + (int)os + ");");
		}

		public void UstawBiezacySkeletonJakoWzorcowy()
		{
			matlab.Execute(@"SKELETON_WZORCOWY = SKELETON");
		}

		public void AlgorytmDTW(int szerokoscOkna)
		{
			matlab.Execute(@"badania_DTW(SKELETON, SKELETON_WZORCOWY, t, staw, stawik, " + szerokoscOkna + ", kolory, znaczki);");
		}

		public string WykonajPolecenie(string s)
		{
			return matlab.Execute(s);
		}

		public void LiczCalki()
		{
			matlab.Execute(@"[calki] = liczenie_calek(SKELETON, t);");
			matlab.Execute(@"[stosunki_P_L, stosunki_bks, roznice_bks, stosunki_roznic] = stosunki_calek_y(calki);");
		}

		public List<double[,]> StosunkiCalek()
		{
			var stosunkiCalek = new List<double[,]>();
			
			double[,] tab = new double[3, 1];
			string[] tokens = matlab.Execute("stosunki_P_L").Split();
			
			tokens = tokens.Where(x => x.Contains(".")).ToArray();

			int i = 0;
			foreach (var item in tokens)
				double.TryParse(tokens[i], NumberStyles.Number, CultureInfo.CreateSpecificCulture("en-US"), out tab[i++, 0]);

			

			stosunkiCalek.Add(tab);

			tab = new double[3, 2];
			tokens = matlab.Execute("stosunki_bks").Split();
			tokens = tokens.Where(x => x.Contains(".") && !x.Contains("e")).ToArray();

			for (i = 0; i < 3; i++)
				for (int j = 0; j < 2; j++)
					double.TryParse(tokens[2 * i + j], NumberStyles.Number, CultureInfo.CreateSpecificCulture("en-US"), out tab[i, j]);

			stosunkiCalek.Add(tab);

			tab = new double[3, 2];

			tokens = matlab.Execute("roznice_bks").Split();

			double mnoznik = 1;
			var tmp = tokens.Where(x => x.Contains("e+")).ToList();
			
			if (tmp.Count != 0)
			{
				tmp = matlab.Execute(tmp[0]).Split().ToList();
				tmp = tmp.Where(x => x.Contains("0")).ToList();
				double.TryParse(tmp[0].ToString(), out mnoznik);
			}

			tokens = tokens.Where(x => x.Contains(".") && !x.Contains("e")).ToArray();

			for (i = 0; i < 3; i++)
				for (int j = 0; j < 2; j++)
					double.TryParse(tokens[2 * i + j], NumberStyles.Number, CultureInfo.CreateSpecificCulture("en-US"), out tab[i, j]);

			for (i = 0; i < 3; i++)
				for (int j = 0; j < 2; j++)
					tab[i, j] *= mnoznik;

			stosunkiCalek.Add(tab);

			tab = new double[1, 2];
			tokens = matlab.Execute("stosunki_roznic").Split();
			tokens = tokens.Where(x => x.Contains(".") && !x.Contains("e")).ToArray();
			i = 0;
			foreach (var item in tokens)
				double.TryParse(tokens[i], NumberStyles.Number, CultureInfo.CreateSpecificCulture("en-US"), out tab[0, i++]);

			stosunkiCalek.Add(tab);

			return stosunkiCalek;
		}
		
		public void Czysc()
		{
			matlab.Execute("close all");
		}

		public void ZapiszStosunkiCalek()
		{
			matlab.Execute("zapis_do_pliku(calki, stosunki_P_L, stosunki_bks, roznice_bks, stosunki_roznic);");
		}
	}
}
