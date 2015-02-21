using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using erp.dal;

namespace erp.bll
{
    class command
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
            daocommand.CommandDeleteById(id_command);
        }
    }
}
