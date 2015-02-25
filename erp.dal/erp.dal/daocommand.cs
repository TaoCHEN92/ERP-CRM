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
        public static void CommandInsert(string id_command, string id_command_last, string id_cilent, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string status, string date_done, string date_delivery, string remark)
        {
            var sqlQuery = string.Format("INSERT INTO command VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}')",
                id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, status, date_done, date_delivery, remark);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
    }
}
