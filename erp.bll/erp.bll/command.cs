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
        string status, string date_done, string date_delivery, string remark)
        {
            try
            {
                daocommand.CommandInsert(id_command, id_command_last, id_cilent, name_product, date_pre_done,
                date_begin, format, quantity, price_unit, unit, status, date_done, date_delivery, remark);
            }
            catch { }
        }
    }
}
