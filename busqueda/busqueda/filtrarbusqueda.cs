using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Markup;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace busqueda
{
    public class filtrarbusqueda
    {
       
        public void  llenar_grila( GridView data)
        {
            try
            {
                SqlDataAdapter dta = new SqlDataAdapter("BUSCARRE", conectar.conexionbd());
                dta.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                dta.Fill(dt);
                
                data.DataBind();
                
                

            }
            catch (Exception)
            {

                throw;
            }
            finally { conectar.cerrarconexion(); }
            }

        public void filtrar_grilla(GridView data, string numeros)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("BUSCARRE", conectar.conexionbd());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@yy", SqlDbType.NVarChar).Value = numeros;
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter adt = new SqlDataAdapter(cmd);
                adt.Fill(dt);
                 data.DataBind();
                                            
            }
            catch (Exception ex)
            {

                throw new ArgumentException (ex.Message);
                
            }
            finally { conectar.cerrarconexion(); }
            
        }

        public void archivos(string rutas, int radicado )
        {
           

            try
            {
                SqlCommand cmd = new SqlCommand("guardararchivo", conectar.conexionbd());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ruta_ar", SqlDbType.NVarChar).Value = rutas;
                cmd.Parameters.Add("@cod_rad", SqlDbType.Int).Value = radicado;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex )
            {
                    
                throw new ArgumentException(ex.Message);
            }
            finally { conectar.cerrarconexion(); }




        }
       

    }
}