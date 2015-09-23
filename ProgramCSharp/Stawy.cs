using System;
using System.Collections.Generic;
using System.Linq;

namespace ProgramCSharp
{
	public enum Staw
	{
		Biodra = 1,
		LeweBiodro,
		LeweKolano,
		LewaStopa,
		PraweBiodro,
		PraweKolano,
		PrawaStopa,
		Kregoslup,
		LewyBark,
		LeweRamie,
		LewePrzedramie,
		LewaDlon,
		PrawyBark,
		PraweRamie,
		PrawePrzedramie,
		PrawaDlon,
		Szyja,
		Glowa
	}
	public static class Stawy
	{
		public static List<Staw> StawToList()
		{
			return Enum.GetValues(typeof(Staw)).Cast<Staw>().ToList();
		}
	}
}
