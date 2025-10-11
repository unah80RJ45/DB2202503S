using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DB2Ejemplo
{
    public partial class Form1 : Form
    {
        SqlConnection conexion;

        public Form1()
        {
            InitializeComponent();
        }

        private void cmdAlumnos_Click(object sender, EventArgs e)
        {
            frmAlumnos frm = new frmAlumnos();
            frm.StartPosition = FormStartPosition.CenterScreen;
            frm.ShowDialog();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            String url = "Server = 3.128.144.165; DataBase = DB2202503S; User ID = db2; Password = 123";
            conexion = new SqlConnection(url);
        }

        private void cmdAsignaturas_Click(object sender, EventArgs e)
        {
            frmAsignatura frm = new frmAsignatura(conexion);
            frm.StartPosition = FormStartPosition.CenterScreen;
            frm.ShowDialog();
        }
    }
}
