using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using erp.dal;

namespace erp.bll
{
    public class command
    {
        #region Data Methode
        public DataSet CommandSelectAll(string id_command)
        {
            DataSet DS = daocommand.CommandSelectAll();
            if (!string.IsNullOrWhiteSpace(id_command))
            {
                foreach (System.Data.DataTable table in DS.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        if (!row["id_command"].ToString().Contains(id_command))
                            row.Delete();
                    }
                }
            }

            string Is_Done;
            string Is_Sent;
            string Is_Paid;

            DataColumn col_status = DS.Tables[0].Columns.Add("status", typeof(string));
            foreach (DataRow row in DS.Tables[0].Rows)
            {
                 Is_Done = "";
                 Is_Sent = "";
                 Is_Paid = "";

                 Is_Done = row["Is_Done"].ToString();
                 Is_Sent = row["Is_Sent"].ToString();
                 Is_Paid = row["Is_Paid"].ToString();
                 row["status"] = GetStatus(Is_Done, Is_Sent, Is_Paid);
            }
            return DS;
        }
        public DataSet CommandSelectById(string id_command)
        {
            DataSet DS = daocommand.CommandSelectById(id_command);
            string Is_Done = DS.Tables[0].Rows[0]["Is_Done"].ToString();
            string Is_Sent = DS.Tables[0].Rows[0]["Is_Sent"].ToString();
            string Is_Paid = DS.Tables[0].Rows[0]["Is_Paid"].ToString();

            string status = GetStatus(Is_Done, Is_Sent, Is_Paid);
            DataColumn col_status = DS.Tables[0].Columns.Add("status", typeof(string));
            DS.Tables[0].Rows[0]["status"] = status;
            return DS;
        }
        public void CommandDeleteById(string id_command)
        {
            try
            {
                daocommand.CommandDeleteById(id_command);
            }
            catch { }
        }

        public static void CommandInsert(string id_command, string id_command_last, string id_cilent, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done, string date_delivery, string date_pay, string remark, string Is_Done, string Is_Sent, string Is_Paid)
        {
            try
            {
                daocommand.CommandInsert(id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_delivery, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            }
            catch { }
        }

        public static void CommandUpdateById(string id_command, string id_command_last, string status, string name_product,
        string date_pre_done, string date_begin, string format, string quantity, string price_unit, string unit,
        string date_done, string date_delivery, string date_pay, string remark,string enterprise)
        {
            string Is_Done = "False";
            string Is_Sent = "False";
            string Is_Paid = "False";

            if (status == "生产中") { }
            else if (status == "准备发货")
            { 
                Is_Done = "True"; 
            }
            else if (status == "已发货")
            {
                Is_Done = "True";
                Is_Sent = "True";
            }
            else if (status == "已付款")
            {
                Is_Done = "True";
                Is_Sent = "True";
                Is_Paid = "True";
            }
            try
            {
                daocommand.CommandUpdateById(id_command, id_command_last, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, date_done, date_delivery, date_pay, remark, Is_Done, Is_Sent, Is_Paid);
            }
            catch { }
        }
        #endregion
        #region Business Methode
        protected string GetStatus(string Is_Done, string Is_Sent, string Is_Paid)
        {
            string Status = "生产中";
            if (Is_Done == "True")
                Status = "准备发货";
            if (Is_Sent == "True")
                Status = "已发货";
            if (Is_Paid == "True")
                Status = "已付款";

            return Status;
        }
        #endregion

    }
}
