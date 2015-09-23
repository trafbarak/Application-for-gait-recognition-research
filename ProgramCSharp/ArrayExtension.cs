using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramCSharp
{
	public static class ArrayExtension
	{
		public static DataTable ToDataTable<T>(this T[,] obj, string[] columnNames, string[] firstColumn)
		{
			DataTable dataTable = new DataTable();
			int h = obj.GetLength(0);
			int w = obj.GetLength(1)+1;

			for (int i = 0; i < w; i++)
				dataTable.Columns.Add(columnNames[i]);

			for (int i = 0; i < h; i++)
			{
				DataRow dataRow = dataTable.NewRow();

				dataRow[0] = firstColumn[i];

				for (int j = 1; j < w; j++)
					dataRow[j] = obj[i, j-1].ToString();

				dataTable.Rows.Add(dataRow);
			}
			return dataTable;
		}
	}
}
