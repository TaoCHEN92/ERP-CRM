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
        public DataSet ClientSelectAll()
        {
            return daoclient.ClientSelectAll();
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
