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
        public static DataSet CommandSelectById(string id_command)
        {
            string sqlQuery = string.Format("SELECT co.*, cl.enterprise FROM command co, client cl where co.id_client = cl.id and co.id_command='{0}'",id_command);
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static void CommandDeleteById(string id_command)
        {
            var sqlQuery = string.Format("DELETE FROM command where id_command = {0}", id_command);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }

        public static void CommandInsert(string id_command, string id_command_last, string id_cilent, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done, string date_delivery, string date_pay, string remark, string Is_Done, string Is_Sent, string Is_Paid)
        {
            var sqlQuery = string.Format("INSERT INTO command VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}')",
                id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_delivery, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }

        public static void CommandUpdateById(string id_command, string id_command_last, string id_cilent, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done, string date_delivery, string date_pay, string remark, string Is_Done, string Is_Sent, string Is_Paid)
        {
            var sqlQuery = string.Format("UPDATE command SET  id_command_last='{1}',id_cilent='{2}',name_product='{3}',date_pre_done='{4}',date_begin='{5}',format='{6}',quantity='{7}',price_unit='{8}',unit='{9}',date_done='{10}',date_delivery='{11}',date_pay='{12}',remark='{13}',Is_Done='{14}',Is_Sent='{15}',Is_Paid='{16}' WHERE id_command='{0}')",
                id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_delivery, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
    }
}
