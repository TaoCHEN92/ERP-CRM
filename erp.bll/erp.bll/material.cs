using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using erp.dal;

namespace erp.bll
{
    public class material
    {
        public DataSet MaterialSelectAll(string material_name)
        {
            DataSet DS = daomaterial.MaterialSelectAll();
            if (!string.IsNullOrWhiteSpace(material_name))
            {
                foreach (System.Data.DataTable table in DS.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        if (!row["material_name"].ToString().Contains(material_name))
                            row.Delete();
                    }
                }
            }
            return DS;
        }
        public void MaterialUpdateById(string id, string material_name, string type, string unit, string supplier, string stock)
        {
            daomaterial.MaterialUpdateById(id, material_name, type, unit, supplier, stock);
        }
        public void MaterialDeleteById(string id)
        {
            daomaterial.MaterialDeleteById(id);
        }
        public static void MaterialInsert(string material_name, string type, string unit, string supplier, string stock)
        {
            daomaterial.MaterialInsert(material_name, type, unit, supplier, stock);
        }
        public static void Material_Used_Insert(string id_command, string id_material, string quantity)
        {
            daomaterial.Material_Used_Insert(id_command, id_material, quantity);
        }
    }
}
