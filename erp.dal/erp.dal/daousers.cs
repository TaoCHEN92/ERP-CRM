using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace erp.dal
{
    public class daousers : dao 
    {
        /// <summary>
        /// Look up this login in the database
        /// </summary>
        public static DataSet GetUserDetailByLogin(string login)
        {
            var sqlQuery = string.Format("SELECT * FROM users WHERE login = '{0}'", login);
            return ExecuteDataAdapter(sqlQuery, variables.SqlConStrERP);
        }
    }
}
