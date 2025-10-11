using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DB2Ejemplo
{
    public partial class frmAlumnos : Form
    {
        public frmAlumnos()
        {
            InitializeComponent();
        }

        private void frmAlumnos_Load(object sender, EventArgs e)
        {
            try
            {
                String url = "Server = 3.128.144.165; DataBase = DB2202503S; User ID = db2; Password = 123";
                SqlConnection conexion = new SqlConnection(url);
                SqlDataAdapter adaptador = new SqlDataAdapter("select * from vAlumnoCarreraCampus", conexion);
                DataTable tabla = new DataTable();

                adaptador.Fill(tabla);
                dataGridView1.DataSource = tabla;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
