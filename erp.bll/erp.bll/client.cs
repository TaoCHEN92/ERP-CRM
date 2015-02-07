using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using erp.dal;

namespace erp.bll
{
    public class client
    {
        public DataSet ClientSelectAll(string enterprise)
        {
            DataSet DS = daoclient.ClientSelectAll();
            if (!string.IsNullOrWhiteSpace(enterprise))
            {
                foreach (System.Data.DataTable table in DS.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        if (!row["enterprise"].ToString().Contains(enterprise))
                            row.Delete();
                    }
                }
            }
            return DS;
        }
        public void ClientUpdateById(string id, string enterprise, string phone_number, string fax_number, string address)
        {
            daoclient.ClientUpdateById(id, enterprise, phone_number,fax_number, address);
        }
        public void ClientDeleteById(string id) 
        {
            daoclient.ClientDeleteById(id);
        }
        public static void ClientInsert(string enterprise, string phone_number, string fax_number, string address)
        {
            daoclient.ClientInsert(enterprise, phone_number, fax_number, address);
        }
    }
}
