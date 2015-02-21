using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace erp.dal
{
    public class daocommand : dao
    {
        public static DataSet CommandSelectAll()
        {
            string sqlQuery = string.Format("SELECT co.*, cl.enterprise FROM command co, client cl where co.id_client = cl.id");
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static void CommandDeleteById(string id_command)
        {
            var sqlQuery = string.Format("DELETE FROM command where id_command = {0}", id_command);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
    }
}
