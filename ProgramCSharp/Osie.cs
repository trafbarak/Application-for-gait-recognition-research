using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramCSharp
{
	public enum Os
	{
		X = 1,
		Y,
		Z
	}
	public static class Osie
	{
		public static List<Os> OsToList()
		{
			return Enum.GetValues(typeof(Os)).Cast<Os>().ToList();
		}
	}
}
