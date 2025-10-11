namespace DB2Ejemplo
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmdAlumnos = new System.Windows.Forms.Button();
            this.cmdAsignaturas = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmdAlumnos
            // 
            this.cmdAlumnos.Location = new System.Drawing.Point(46, 42);
            this.cmdAlumnos.Name = "cmdAlumnos";
            this.cmdAlumnos.Size = new System.Drawing.Size(260, 76);
            this.cmdAlumnos.TabIndex = 0;
            this.cmdAlumnos.Text = "Alumnos";
            this.cmdAlumnos.UseVisualStyleBackColor = true;
            this.cmdAlumnos.Click += new System.EventHandler(this.cmdAlumnos_Click);
            // 
            // cmdAsignaturas
            // 
            this.cmdAsignaturas.Location = new System.Drawing.Point(329, 42);
            this.cmdAsignaturas.Name = "cmdAsignaturas";
            this.cmdAsignaturas.Size = new System.Drawing.Size(260, 76);
            this.cmdAsignaturas.TabIndex = 1;
            this.cmdAsignaturas.Text = "Asignaturas";
            this.cmdAsignaturas.UseVisualStyleBackColor = true;
            this.cmdAsignaturas.Click += new System.EventHandler(this.cmdAsignaturas_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(681, 349);
            this.Controls.Add(this.cmdAsignaturas);
            this.Controls.Add(this.cmdAlumnos);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cmdAlumnos;
        private System.Windows.Forms.Button cmdAsignaturas;
    }
}

