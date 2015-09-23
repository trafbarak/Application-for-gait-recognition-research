using System;
using System.Collections.Generic;
using System.Linq;

namespace ProgramCSharp
{
	public enum Plaszczyzna
	{
		XY = 1, 
		XZ, 
		YZ
	}
	public static class Plaszczyzny
	{
		public static List<Plaszczyzna> PlaszczyznaToList()
		{
			return Enum.GetValues(typeof(Plaszczyzna)).Cast<Plaszczyzna>().ToList();
		}
	}
}
