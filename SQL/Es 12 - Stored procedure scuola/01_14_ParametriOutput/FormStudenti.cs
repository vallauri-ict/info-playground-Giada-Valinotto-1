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

namespace _01_14_ParametriOutput
{
    public partial class FormStudenti : Form
    {
        const string CONSTR = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"S:\\informatica\\5 superiore\\informatica\\info playground\\01_14_ParametriOutput\\Scuola.mdf\";Integrated Security=True;Connect Timeout=30";

        public FormStudenti()
        {
            InitializeComponent();
        }

        private void btnElenco_Click(object sender, EventArgs e)
        {
            if(txtClasse.Text == "")
            {
                MessageBox.Show("Metti la classe");
                txtClasse.Focus();
                return;
            }

            using (SqlConnection con = new SqlConnection(CONSTR))
            {
                string sql = "ElencoClasse";

                con.Open();

                SqlCommand cmd = new SqlCommand(sql, con);

                SqlParameter classe = new SqlParameter();
                classe.ParameterName = "Classe";
                classe.Direction = ParameterDirection.Input;
                classe.DbType = DbType.String;
                classe.Size = 10;
                classe.Value = txtClasse.Text;
                cmd.Parameters.Add(classe);

                SqlParameter nome = new SqlParameter();
                nome.ParameterName = "Nome";
                nome.Direction = ParameterDirection.Output;
                nome.DbType = DbType.String;
                nome.Size = 30;
                cmd.Parameters.Add(nome);

                SqlParameter cognome = new SqlParameter();
                cognome.ParameterName = "Cognome";
                cognome.Direction = ParameterDirection.Output;
                cognome.DbType = DbType.String;
                cognome.Size = 30;
                cmd.Parameters.Add(cognome);

                SqlParameter telefono = new SqlParameter();
                telefono.ParameterName = "Telefono";
                telefono.Direction = ParameterDirection.Output;
                telefono.DbType = DbType.String;
                telefono.Size = 20;
                cmd.Parameters.Add(telefono);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader ris = cmd.ExecuteReader();

                if (!ris.HasRows)
                {
                    MessageBox.Show("La classe non esiste");
                    return;
                }

                string output = "";
                while (ris.Read())
                    output += string.Format("\n\t - id: {0} | Nome: {1} | Cognome: {2} | Data nascita: {3} | Telefono: {4}",
                                            ris.GetInt32(0), ris.GetString(1), ris.GetString(2), ris.GetDateTime(3).ToShortDateString(), ris.GetString(4));
                ris.Close();

                output += string.Format("\n\n Studente più giovane: {0} {1} - Tel: {2}", nome.Value, cognome.Value, telefono.Value);
                MessageBox.Show("Classe " + txtClasse.Text + ":" + output);

                con.Close();
            }
        }
    }
}