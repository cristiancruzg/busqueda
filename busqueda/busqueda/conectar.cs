using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace busqueda
{
    public class conectar
    {


           

        public static SqlConnection conexionbd()
        {

            try
            {
                SqlConnection conect = new SqlConnection(ConfigurationManager.AppSettings["cnConnection"]);
                conect.Open();
                return conect;
                
            }
            catch (Exception)
            {

                throw new Exception("error en la conexion");
            }
        }

        public static SqlConnection cerrarconexion()
        {
            SqlConnection conect = new SqlConnection(ConfigurationManager.AppSettings["cnConnection"]);
            conect.Close();
            return conect;
        }
        
    }
}