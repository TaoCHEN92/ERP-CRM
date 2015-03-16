﻿using System;
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
            string sqlQuery = string.Format("SELECT * FROM material");
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static DataSet MaterialUsedSelectByCommandId(string id_command)
        {
            string sqlQuery = string.Format("select ma.material_name, ma_used.quantity from material ma, material_used ma_used where ma_used.id_command = '{0}' and ma_used.id_material = ma.id",id_command);
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialUsedUpdateByCommandId(string id_command, string material_name, string quantity)
        {
            var sqlQuery = string.Format("UPDATE material_used SET quantity='{2}' where id_command = '{0}' and id_material = (select id from material where material_name= '{1}')", id_command, material_name, quantity);
            ExecuteNonQuery(sqlQuery, variables.SqlConStrERP);
        }
        public static void MaterialUpdateById(string id, string material_name, string type, string unit, string supplier, string stock)
        {
            var sqlQuery = string.Format("UPDATE material SET material_name='{0}', type='{1}',unit='{2}',supplier='{3}',stock='{4}' where id = {5}", material_name, type, unit, supplier,stock, id);
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
