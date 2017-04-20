using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
namespace busqueda
{
    public partial class buscar : System.Web.UI.Page
    {
        filtrarbusqueda df = new filtrarbusqueda();
        string carpeta;
        
     protected void Page_Load(object sender, EventArgs e)
        {
            carpeta= Path.Combine(Server.MapPath(@"~/Documents/imagenesII"), "Documentos");
            Label3.Text = carpeta;


        }

        public void llenargrilla()
        {
            df.llenar_grila(gdbusqueda);
             

        }

        

        protected void gdbusqueda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdbusqueda.PageIndex = e.NewPageIndex;
            df.filtrar_grilla(gdbusqueda, this.txtnumero.Text.Trim());
           // df.buscarxentrada(gdbusqueda, this.txtentrada.Text.Trim());

        }

        protected void gdbusqueda_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void Unnamed1_TextChanged(object sender, EventArgs e)
        {
            df.filtrar_grilla(gdbusqueda,this.txtnumero.Text.Trim());
            gdbusqueda.Visible = true;    
        }

        protected void txtentrada_TextChanged(object sender, EventArgs e)
        {
        //    df.buscarxentrada(gdbusqueda, this.txtentrada.Text.Trim());
        }

        protected void gdbusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;
            int.TryParse(gdbusqueda.SelectedRow.Cells[0].Text,out id);
            
            string radic = (gdbusqueda.SelectedRow.FindControl("Label1") as Label).Text;
            id = int.Parse(radic);
            Session["radicado"] = id;
            Label2.Text = Convert.ToString(Session["radicado"]);
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] { new DataColumn("Radicado",typeof(int)),new DataColumn("nombre",typeof(string)),new DataColumn("ruta",typeof(string)) });
            dt.Rows.Add(id,radic,carpeta);
            GridView1.DataSource = dt;
           
            GridView1.DataBind();
            
            gdbusqueda.Visible = false;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {

            int index = int.Parse(((Button)sender).CommandArgument);

            FileUpload file = (FileUpload) GridView1.Rows[index].FindControl("FileUpload1");


            if (file == null)
            {
                Response.Write("<script>alert('no selecciono ningun archivo')</script>");
                
            }
            else
            { 
                //verificar la extencion
                string extencion = Path.GetExtension(file.PostedFile.FileName);
                switch (extencion.ToLower())
                {
                    //validar tipo
                    case ".jpg":
                    case".gif":
                    case ".png":
                    case ".pdf":
                         break;
                        //no validas
                    default:
                        Response.Write("<script>alert('archivo no valido');</script>");
                        return;                        
                }
                try
                {
                    //verifico rutas directorios y llamo metodo para agregar a bd 
                    string archivo = Path.GetExtension(file.PostedFile.FileName);
                    if (!Directory.Exists(carpeta))
                        Directory.CreateDirectory(carpeta);
                    string carpeta_final = Path.Combine(carpeta,archivo);
                    file.PostedFile.SaveAs(carpeta_final);
                    filtrarbusqueda cd = new filtrarbusqueda();
                    int radicado = (int)(Session["radicado"]) ;
                    cd.archivos(carpeta_final,radicado);
                    Response.Write("<script>alert('archivo guardado correctamente en: "+carpeta_final +"');</script>");
                    gdbusqueda.Visible = true;
                    

                }
                catch (Exception ex)
                {

                   Response.Write("Error: "+ex.Message);
                }
            }
        }






    }
}
