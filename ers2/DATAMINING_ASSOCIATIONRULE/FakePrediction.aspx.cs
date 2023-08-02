using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Collections;
using System.Threading;
using System.Configuration;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class FakePrediction : System.Web.UI.Page
    {
        public static OleDbConnection oledbConn;
        DataTable dt = new DataTable();
        DataTable dtDistinct = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                TrainingDS();

                if (!this.IsPostBack)
                    LoadParameters();
            }
            catch
            {

            }
        }

        private void DisableTxts()
        {
            txtAge.Enabled = false;
            txtDay.Enabled = false;
            txtExperience.Enabled = false;
            txtGender.Enabled = false;
            txtHowOften.Enabled = false;
            txtLocation.Enabled = false;
            txtMessageSize.Enabled = false;            
            txtNegativeCnt.Enabled = false;
            txtPositiveCnt.Enabled = false;
            txtTime.Enabled = false;
            txtTotalPosts.Enabled = false;
        }

        //function to fetch parameters
        private void LoadParameters()
        {
            DisableTxts();
            Member_Class obj = new Member_Class();
            DataTable tab = new DataTable();

            tab = obj.GetCustomerDetails(Session["Customer_ID"].ToString());

            if (tab.Rows.Count > 0)
            {
                txtGender.Text = tab.Rows[0]["Gender"].ToString();
                txtAge.Text = tab.Rows[0]["Age"].ToString();
                txtExperience.Text = tab.Rows[0]["Experience"].ToString();
                txtTotalPosts.Text = tab.Rows[0]["TotalPosts"].ToString();                
                txtMessageSize.Text = Request.QueryString["Size"].ToString();
                txtHowOften.Text = tab.Rows[0]["Howoften"].ToString();
                txtPositiveCnt.Text = Request.QueryString["PositiveCnt"].ToString();

                txtNegativeCnt.Text = Request.QueryString["NegativeCnt"].ToString();
                txtLocation.Text = tab.Rows[0]["location"].ToString();
                txtDay.Text = Request.QueryString["Day"].ToString();
                txtTime.Text = Request.QueryString["Time"].ToString();
            }
        }

        private void TrainingDS()
        {
            string FileName = "TrainingDataset.xls";

            string Extension = ".xls";

            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

            string _Location = "TrainingDataset";

            string FilePath = Server.MapPath(FolderPath + FileName);

            ImportTrainingDS(FilePath, Extension, _Location);
        }

        private void ImportTrainingDS(string FilePath, string Extension, string _Location)
        {
            string conStr = "";

            switch (Extension)
            {
                case ".xls": //Excel 97-03

                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]

                             .ConnectionString;

                    break;

                case ".xlsx": //Excel 07

                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]

                              .ConnectionString;

                    break;

            }

            conStr = String.Format(conStr, FilePath, _Location);

            OleDbConnection connExcel = new OleDbConnection(conStr);

            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbCommand cmdDistinct = new OleDbCommand();
            OleDbCommand cmdPatientsCnt = new OleDbCommand();

            OleDbDataAdapter oda = new OleDbDataAdapter();
            OleDbDataAdapter odaDistinct = new OleDbDataAdapter();

            cmdExcel.Connection = connExcel;
            cmdDistinct.Connection = connExcel;
            cmdPatientsCnt.Connection = connExcel;
            //Get the name of First Sheet

            connExcel.Open();

            DataTable dtExcelSchema;

            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            connExcel.Close();

            //Read Data from First Sheet

            connExcel.Open();

            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
            cmdDistinct.CommandText = "SELECT DISTINCT(result) From [" + SheetName + "]";

            oda.SelectCommand = cmdExcel;
            odaDistinct.SelectCommand = cmdDistinct;

            oda.Fill(dt);
            odaDistinct.Fill(dtDistinct);

            //BLL obj = new BLL();

            if (dt.Rows.Count > 0)
            {
                //if (dtDistinct.Rows.Count > 0)
                //{
                //    for (int i = 0; i < dtDistinct.Rows.Count; i++)
                //    {
                //        cmdPatientsCnt.CommandText = "SELECT COUNT(*) From [" + SheetName + "] where RESULT=" + dtDistinct.Rows[i]["RESULT"].ToString() + "";
                //        _arrayPatientsCnt.Add(cmdPatientsCnt.ExecuteScalar());
                //    }
                //}

                connExcel.Close();

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<Script>alert('No Training Dataset!!!')</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string _data = txtGender.Text + "," + txtAge.Text + "," +
                               txtExperience.Text + "," + txtTotalPosts.Text + "," +
                                txtMessageSize.Text + "," +
                               txtHowOften.Text + "," + txtPositiveCnt.Text + "," +
                               txtNegativeCnt.Text + "," + txtLocation.Text + "," +
                               txtDay.Text + "," + txtTime.Text;


                string[] values = _data.Split(',');

                string _output = _NaiveBayes(values);

                lblResult.ForeColor = System.Drawing.Color.Green;
                lblResult.Font.Bold = true;
                lblResult.Font.Size = 16;

                string _result = null;

                if (_output.Equals("1"))
                {
                    lblResult.Text = "THIS REVIEW IS CLASSIFIED TO FAKE";
                    _result = "FAKE";
                }
                else
                {
                    lblResult.Text = "THIS REVIEW IS CLASSIFIED TO REAL";
                    _result = "REAL";
                }

                Member_Class obj = new Member_Class();
                int _id = obj.GetMaxReviewId();

                obj.UpdateReview(_result, _id);
            }
            catch
            {

            }
        }

        double pi;
        int nc, n;
        double result;
        ArrayList output = new ArrayList();
        ArrayList mul = new ArrayList();

        //function which contains the algorithm steps
        private string _NaiveBayes(string[] values)
        {
            ArrayList s = new ArrayList();
            output.Clear();

            //try
            //{
            s = GetSubject();

            int m = 11;
            double numer = 1.0;
            double dino = double.Parse(s.Count.ToString());
            double p = numer / dino;


            for (int i = 0; i < s.Count; i++)
            {
                mul.Clear();

                for (int j = 0; j < 11; j++)
                {
                    n = 0;
                    nc = 0;

                    for (int d = 0; d < dt.Rows.Count; d++)
                    {
                        if (dt.Rows[d][j].ToString().Equals(values[j]))
                        {
                            ++n;

                            if (dt.Rows[d][m].ToString().Equals(s[i]))

                                ++nc;
                        }
                    }

                    double x = m * p;
                    double y = n + m;
                    double z = nc + x;

                    pi = z / y;
                    mul.Add(Math.Abs(pi));
                }

                double mulres = 1.0;

                for (int z = 0; z < mul.Count; z++)
                {
                    mulres *= double.Parse(mul[z].ToString());
                }

                result = mulres * p;
                output.Add(Math.Abs(result));
            }

            ArrayList list1 = new ArrayList();

            for (int x = 0; x < s.Count; x++)
            {
                list1.Add(output[x]);
            }

            list1.Sort();
            list1.Reverse();

            string _output = null;

            for (int y = 0; y < s.Count; y++)
            {
                if (output[y].Equals(list1[0]))
                {
                    _output = s[y].ToString();

                    //if (_output.Equals("0"))
                    //{
                    //    _output = "No";
                    //}
                    //else
                    //{
                    //    _output = "Yes";
                    //}

                    return _output;
                }
            }
            //}
            //catch
            //{

            //}

            return _output;
        }


        //function to load subject
        public ArrayList GetSubject()
        {
            ArrayList s = new ArrayList();

            if (dtDistinct.Rows.Count > 0)
            {
                for (int i = 0; i < dtDistinct.Rows.Count; i++)
                {
                    if (dtDistinct.Rows[i]["result"].ToString().Equals(""))
                    {

                    }
                    else
                    {
                        s.Add(dtDistinct.Rows[i]["result"].ToString());
                    }
                }
            }

            return s;
        }
        
    }
}