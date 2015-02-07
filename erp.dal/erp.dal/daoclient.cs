using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace erp.dal
{
    public class daoclient : dao
    {
        public static DataSet ClientSelectAll()
        {
            var sqlQuery = string.Format("SELECT * FROM client");
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }

        public static void ClientUpdateById(string id, string enterprise, string phone_number, string fax_number, string address) 
        {
            var sqlQuery = string.Format("UPDATE client SET enterprise='{0}', phone_number='{1}',fax_number='{2}',address='{3}' where id = {4}",enterprise,phone_number,fax_number,address,id);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }

        public static void ClientDeleteById(string id)
        {
            var sqlQuery = string.Format("DELETE FROM client where id = {0}", id);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void ClientInsert(string enterprise, string phone_number, string fax_number, string address) 
        {
            var sqlQuery = string.Format("INSERT INTO client VALUES('{0}','{1}','{2}','{3}')",enterprise, phone_number, fax_number, address);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
    }
}
