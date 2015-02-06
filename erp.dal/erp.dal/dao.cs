using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace erp.dal
{
    public class dao
    {
        /// <summary>
        /// Sql query excute with no value return
        /// </summary>
        public static void ExecuteNonQuery(string SqlQuery, string SqlConnectionStr)
        {
            SqlConnection connection = new SqlConnection(SqlConnectionStr);
            SqlCommand command = new SqlCommand(SqlQuery, connection);
            command.Connection.Open();
            command.ExecuteNonQuery();
            command.Connection.Close();
        }

        /// <summary>
        /// Sql query excute with dataset value return
        /// </summary>
        public static DataSet ExecuteDataAdapter(string SqlQuery, string SqlConnectionStr)
        {
            SqlDataAdapter MyAdapter;
            DataSet DS = new DataSet();
            MyAdapter = new SqlDataAdapter(SqlQuery, SqlConnectionStr);
            MyAdapter.Fill(DS, "values");
            return (DS);
        }
    }
}
