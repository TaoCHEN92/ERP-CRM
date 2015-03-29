using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace erp.dal
{
    public class daomaterial : dao
    {
        public static DataSet MaterialSelectAll()
        {
            string sqlQuery = string.Format("select m.id, m.material_name,m.supplier,m.type,m.unit,stock=ISNULL(m.stock, 0)-ISNULL(mu.quantity,0) from material m  left join (select id_material,quantity=sum(quantity) from material_used group by id_material) mu on m.id=mu.id_material");
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static DataSet MaterialUsedSelectByCommandId(string id_command)
        {
            string sqlQuery = string.Format("select ma.material_name, ma_used.quantity from material ma, material_used ma_used where ma_used.id_command = '{0}' and ma_used.id_material = ma.id",id_command);
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
      
        public static void MaterialUpdateById(string id, string material_name, string type, string unit, string supplier, string stock)
        {
            var sqlQuery = @"DECLARE @rest INT
                               DECLARE @added INT
                               SET @rest = (select stock=ISNULL(m.stock, 0)-ISNULL(mu.quantity,0) from material m  left join (select id_material,quantity=sum(quantity) from material_used group by id_material) mu
                                 on m.id=mu.id_material where m.id='@m_id')
                               SET @added=@m_added
                               UPDATE material SET material_name='@m_name', type='@m_type',unit='@m_unit',supplier='@m_supplier', stock = stock + (@added-@rest) where id='@m_id' "
                                .Replace("@m_id", id)
                                .Replace("@m_name", material_name)
                                .Replace("@m_type", type)
                                .Replace("@m_unit", unit)
                                .Replace("@m_added",stock)
                                .Replace("@m_supplier", supplier);

            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialUsedUpdateByCommandId(string id_command, string material_name, string quantity)
        {
            var sqlQuery = string.Format("UPDATE material_used SET quantity='{2}' where id_command = '{0}' and id_material = (select id from material where material_name= '{1}')", id_command, material_name, quantity);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialUsedDeleteByCommandId(string id_command, string material_name)
        {
            var sqlQuery = string.Format("DELETE FROM material_used where id_command = '{0}' and id_material =(select id from material where material_name= '{1}')", id_command, material_name);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialDeleteById(string id)
        {
            var sqlQuery = string.Format("DELETE FROM material where id = {0}", id);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialInsert(string material_name, string type, string unit, string supplier, string stock)
        {
            var sqlQuery = string.Format("INSERT INTO material VALUES('{0}','{1}','{2}','{3}','{4}')", material_name, type, supplier, stock, unit);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void Material_Used_Insert(string id_command, string id_material, string quantity)
        {
            var sqlQuery = string.Format("INSERT INTO material_used VALUES('{0}','{1}','{2}')", id_command, id_material, quantity);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
    }
}
