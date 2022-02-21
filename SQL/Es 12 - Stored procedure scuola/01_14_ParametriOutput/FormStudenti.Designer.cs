
namespace _01_14_ParametriOutput
{
    partial class FormStudenti
    {
        /// <summary>
        /// Variabile di progettazione necessaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Pulire le risorse in uso.
        /// </summary>
        /// <param name="disposing">ha valore true se le risorse gestite devono essere eliminate, false in caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Codice generato da Progettazione Windows Form

        /// <summary>
        /// Metodo necessario per il supporto della finestra di progettazione. Non modificare
        /// il contenuto del metodo con l'editor di codice.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnElenco = new System.Windows.Forms.Button();
            this.txtClasse = new System.Windows.Forms.TextBox();
            this.lblClasse = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnElenco
            // 
            this.btnElenco.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnElenco.Location = new System.Drawing.Point(100, 100);
            this.btnElenco.Name = "btnElenco";
            this.btnElenco.Size = new System.Drawing.Size(200, 200);
            this.btnElenco.TabIndex = 0;
            this.btnElenco.Text = "Elenco studenti";
            this.btnElenco.UseVisualStyleBackColor = true;
            this.btnElenco.Click += new System.EventHandler(this.btnElenco_Click);
            // 
            // txtClasse
            // 
            this.txtClasse.Location = new System.Drawing.Point(147, 74);
            this.txtClasse.Name = "txtClasse";
            this.txtClasse.Size = new System.Drawing.Size(153, 20);
            this.txtClasse.TabIndex = 1;
            // 
            // lblClasse
            // 
            this.lblClasse.AutoSize = true;
            this.lblClasse.Location = new System.Drawing.Point(97, 77);
            this.lblClasse.Name = "lblClasse";
            this.lblClasse.Size = new System.Drawing.Size(44, 13);
            this.lblClasse.TabIndex = 2;
            this.lblClasse.Text = "Classe: ";
            // 
            // FormStudenti
            // 
            this.AcceptButton = this.btnElenco;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(384, 361);
            this.Controls.Add(this.lblClasse);
            this.Controls.Add(this.txtClasse);
            this.Controls.Add(this.btnElenco);
            this.Name = "FormStudenti";
            this.Text = "Elenco studenti";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnElenco;
        private System.Windows.Forms.TextBox txtClasse;
        private System.Windows.Forms.Label lblClasse;
    }
}

