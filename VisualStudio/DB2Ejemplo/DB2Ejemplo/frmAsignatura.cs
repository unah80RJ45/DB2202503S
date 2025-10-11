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
    public partial class frmAsignatura : Form
    {
        SqlDataAdapter adpAsignatura;
        DataTable tabAsigatura;

        public frmAsignatura()
        {
            InitializeComponent();
        }
        public frmAsignatura(SqlConnection cnx)
        {
            InitializeComponent();

            adpAsignatura = new SqlDataAdapter();

            adpAsignatura.SelectCommand = new SqlCommand();
            adpAsignatura.SelectCommand.CommandText = "spSelectAsignatura";
            adpAsignatura.SelectCommand.Connection = cnx;
            adpAsignatura.SelectCommand.CommandType = CommandType.StoredProcedure;

            adpAsignatura.InsertCommand = new SqlCommand("spInsertAsignatura");
            adpAsignatura.InsertCommand.Connection = cnx;
            adpAsignatura.InsertCommand.CommandType = CommandType.StoredProcedure;
            adpAsignatura.InsertCommand.Parameters.Add("@asi", SqlDbType.Int, 4, "AsignaturaID");
            adpAsignatura.InsertCommand.Parameters.Add("@nom", SqlDbType.VarChar, 50, "Nombre");
            adpAsignatura.InsertCommand.Parameters.Add("@unidades", SqlDbType.Int, 4, "UV");
            adpAsignatura.InsertCommand.Parameters.Add("@lab", SqlDbType.Bit, 1, "Laboratorio");
            adpAsignatura.InsertCommand.Parameters.Add("@req", SqlDbType.Int, 4, "RequisitoID");
            adpAsignatura.InsertCommand.Parameters["@asi"].Direction = ParameterDirection.InputOutput;

            adpAsignatura.UpdateCommand = new SqlCommand("spUpdateAsignatura", cnx);
            adpAsignatura.UpdateCommand.CommandType = CommandType.StoredProcedure;
            adpAsignatura.UpdateCommand.Parameters.Add("@Nombre", SqlDbType.VarChar, 50, "Nombre");
            adpAsignatura.UpdateCommand.Parameters.Add("@laboratorio", SqlDbType.Bit, 1, "laboratorio");
            adpAsignatura.UpdateCommand.Parameters.Add("@requisitoid", SqlDbType.Int, 4, "requisitoid");
            adpAsignatura.UpdateCommand.Parameters.Add("@asignaturaid", SqlDbType.Int, 4, "AsignaturaID");
            adpAsignatura.UpdateCommand.Parameters.Add("@uv", SqlDbType.Int, 4, "UV");

            adpAsignatura.DeleteCommand = new SqlCommand("spDeleteAsignatura", cnx);
            adpAsignatura.DeleteCommand.CommandType = CommandType.StoredProcedure;
            adpAsignatura.DeleteCommand.Parameters.Add("@asignaturaid", SqlDbType.Int, 4, "AsignaturaID");
        }
        private void cmdCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void frmAsignatura_Load(object sender, EventArgs e)
        {
            tabAsigatura = new DataTable();
            adpAsignatura.Fill(tabAsigatura);
            dataGridView1.DataSource = tabAsigatura;
        }

        private void cmdSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                adpAsignatura.Update(tabAsigatura);
                MessageBox.Show("Informacion Salvada Correctamente", "Confirmacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
