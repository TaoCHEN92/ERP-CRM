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
        #region command
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
            var sqlQuery = string.Format("DELETE FROM command where id_command = '{0}'", id_command);
            var sqlQuery_ = string.Format("DELETE FROM material_used where id_command = '{0}'", id_command);

            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
            ExecuteNonQuery(sqlQuery_, variables.SqlConStrERP);
        }

        public static void CommandInsert(string id_command, string id_command_last, string id_cilent, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done, string date_pay, string remark, string Is_Done, string Is_Sent, string Is_Paid)
        {
            var sqlQuery = string.Format("INSERT INTO command VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}')",
                id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            var sqlQuery_ = string.Format("UPDATE command SET date_done = NULL ,date_pay = NULL where id_command = '{0}'", id_command);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
            ExecuteNonQuery(sqlQuery_, variables.SqlConStrERP);
        }

        public static void CommandUpdateById(string id_command, string id_command_last, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done,  string date_pay, string remark, string Is_Done, string Is_Sent, string Is_Paid)
        {
            if (Is_Done == "False")
                date_done = "";
            if (Is_Sent == "False")
                //补上
            if (Is_Paid == "False")
                date_pay = "";
            var sqlQuery = string.Format("UPDATE command SET  id_command_last='{1}',name_product='{2}',date_pre_done='{3}',date_begin='{4}',format='{5}',quantity='{6}',price_unit='{7}',unit='{8}',date_done='{9}',date_pay='{10}',remark='{11}',Is_Done='{12}',Is_Sent='{13}',Is_Paid='{14}' WHERE id_command='{0}'",
                id_command, id_command_last, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        #endregion
        #region Delivery Record
        public static DataSet DeliveryRecordSelectByCommandId(string id_command)
        {
            string sqlQuery = string.Format("SELECT * from delivery_record where id_command = '{0}'",id_command);
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static void DeliveryRecordInsertCommandId(string id_command, string quantity, string dateTime)
        {
            string sqlQuery = string.Format("INSERT INTO delivery_record VALUES('{0}','{1}','{2}')", id_command,quantity,dateTime);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        #endregion
    }
}
