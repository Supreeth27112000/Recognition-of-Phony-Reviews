using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class PostReviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblProductName.Font.Bold = true;
            lblProductName.ForeColor = System.Drawing.Color.SteelBlue;
            lblProductName.Text = "Item Name: " + Request.QueryString["ItemName"].ToString();
        }

       
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int _cntD = 0;
            int _cntS = 0;

            Member_Class obj = new Member_Class();

            string dipressed = null;
            string satisfied = null;

            DataTable tabDipressed = new DataTable();
            DataTable tabSatisfied = new DataTable();

            tabDipressed = obj.GetWordnetByType("Depressed");
            tabSatisfied = obj.GetWordnetByType("Satisfied");

            //code to remove the stop words [preprocessing of data]
            string[] stopwords = { "a", "about", "above", "above", "across", "after", "afterwards", "again", "against", "all", "almost", "alone", "along", "already", "also", "although", "always", "am", "among", "amongst", "amoungst", "amount", "an", "and", "another", "any", "anyhow", "anyone", "anything", "anyway", "anywhere", "are", "around", "as", "at", "back", "be", "became", "because", "become", "becomes", "becoming", "been", "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill", "both", "bottom", "but", "by", "call", "can", "cannot", "cant", "co", "con", "could", "couldnt", "cry", "de", "describe", "detail", "do", "done", "down", "due", "during", "each", "eg", "eight", "either", "eleven", "else", "elsewhere", "empty", "enough", "etc", "even", "ever", "every", "everyone", "everything", "everywhere", "except", "few", "fifteen", "fify", "fill", "find", "fire", "first", "five", "for", "former", "formerly", "forty", "found", "four", "from", "front", "full", "further", "get", "give", "go", "had", "has", "hasnt", "have", "he", "hence", "her", "here", "hereafter", "hereby", "herein", "hereupon", "hers", "herself", "him", "himself", "his", "how", "however", "hundred", "ie", "if", "in", "inc", "indeed", "interest", "into", "is", "it", "its", "itself", "keep", "last", "latter", "latterly", "least", "less", "ltd", "made", "many", "may", "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must", "my", "myself", "name", "namely", "neither", "never", "nevertheless", "next", "nine", "no", "nobody", "none", "noone", "nor", "not", "nothing", "now", "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "other", "others", "otherwise", "our", "ours", "ourselves", "out", "over", "own", "part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming", "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "six", "sixty", "so", "some", "somehow", "someone", "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "ten", "than", "that", "the", "their", "them", "themselves", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon", "these", "they", "thickv", "thin", "third", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", "too", "top", "toward", "towards", "twelve", "twenty", "two", "un", "under", "until", "up", "upon", "us", "very", "via", "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you", "your", "yours", "yourself", "yourselves", "the" };

            string[] sentance = null;
            sentance = txtReview.Text.Split('.');
            List<string> specialWords = new List<string>();
            int depressedCnt = 0;
            int satisfiedCnt = 0;

            int msgSize = 0;

            for (int z = 0; z < sentance.Length; z++)
            {
                specialWords.Clear();

                string[] opinion = sentance[z].Split(' ');

                msgSize += opinion.Length;

                for (int y = 0; y < sentance.Length; y++)
                {
                    sentance[y] = sentance[y].Replace(",", String.Empty);
                    sentance[y] = sentance[y].Replace("?", String.Empty);
                    sentance[y] = sentance[y].Replace(":", String.Empty);
                    sentance[y] = sentance[y].Replace("(", String.Empty);
                    sentance[y] = sentance[y].Replace(")", String.Empty);
                }

                for (int j = 0; j < opinion.Length; j++)
                {
                    if (!stopwords.Contains(opinion[j], StringComparer.InvariantCultureIgnoreCase))
                    {
                        specialWords.Add(opinion[j]);
                    }
                }

                //loading the keywords into string array
                string[] Keywords = specialWords.ToArray();

                for (int k = 0; k < tabDipressed.Rows.Count; k++)
                {
                    if (Keywords.Contains(tabDipressed.Rows[k]["Keyword"].ToString(), StringComparer.InvariantCultureIgnoreCase))
                    {
                        if (Keywords.Contains("Not") || Keywords.Contains("not") || Keywords.Contains("NOT"))
                        {
                            satisfied += "Not " + tabDipressed.Rows[k]["Keyword"].ToString() + ",";
                            ++satisfiedCnt;
                        }
                        else
                        {
                            dipressed += tabDipressed.Rows[k]["Keyword"].ToString() + ",";
                            ++depressedCnt;
                        }
                    }
                }

                for (int k = 0; k < tabSatisfied.Rows.Count; k++)
                {
                    if (Keywords.Contains(tabSatisfied.Rows[k]["Keyword"].ToString(), StringComparer.InvariantCultureIgnoreCase))
                    {
                        if (Keywords.Contains("Not") || Keywords.Contains("not") || Keywords.Contains("NOT"))
                        {
                            dipressed += "Not " + tabSatisfied.Rows[k]["Keyword"].ToString() + ",";
                            ++depressedCnt;
                        }
                        else
                        {
                            satisfied += tabSatisfied.Rows[k]["Keyword"].ToString() + ",";
                            ++satisfiedCnt;
                        }
                    }
                }
            }

            //if (dipressed == null)
            //{
            //    TableCell cellDipressed = new TableCell();
            //    cellDipressed.Width = 150;
            //    cellDipressed.Text = "No";
            //    row.Controls.Add(cellDipressed);

            //}
            //else
            //{
            //    TableCell cellDipressed = new TableCell();
            //    cellDipressed.Width = 150;
            //    cellDipressed.Text = dipressed.Substring(0, dipressed.Length - 1);
            //    row.Controls.Add(cellDipressed);
            //}

            //if (satisfied == null)
            //{
            //    TableCell cellSatisfied = new TableCell();
            //    cellSatisfied.Width = 150;
            //    cellSatisfied.Text = "No";
            //    row.Controls.Add(cellSatisfied);
            //}
            //else
            //{
            //    TableCell cellSatisfied = new TableCell();
            //    cellSatisfied.Width = 150;
            //    cellSatisfied.Text = satisfied.Substring(0, satisfied.Length - 1);
            //    row.Controls.Add(cellSatisfied);
            //}



            if (depressedCnt > 0 || satisfiedCnt > 0)
            {

                if (depressedCnt > satisfiedCnt)
                {
                    ++_cntD;
                }
                else
                {
                    ++_cntS;
                }

                if (depressedCnt > satisfiedCnt)
                {
                    lblPercentage.Text = "Negative";
                }
                else
                {
                    lblPercentage.Text = "Positive";
                }

            }
            else
            {
                lblPercentage.Text = "No Keywords Matchings!!!";
            }

            //int _total = tab.Rows.Count;

            //double _percentageN = double.Parse(_cntD.ToString()) / double.Parse(_total.ToString()) * 100;
            //double _percentageP = double.Parse(_cntS.ToString()) / double.Parse(_total.ToString()) * 100;

            //lblPercentage.Text = "Negative Opinions(%): " + _percentageN + "<br/>" + "Positive Opinions(%): " + _percentageP;

            string _time = null;
            string _date = DateTime.Now.ToShortDateString();
            DateTime dateValue = DateTime.Parse(_date);
            string _day = dateValue.DayOfWeek.ToString();

            if (DateTime.Now.Hour < 12)
            {
                _time = "morning";
            }
            else if (DateTime.Now.Hour < 16)
            {
                _time = "afternoon";
            }
            else if (DateTime.Now.Hour < 18)
            {
                _time = "evening";
            }
            else
            {
                _time = "night";
            }

            obj.InsertReview(Session["Customer_ID"].ToString(), txtReview.Text, int.Parse(Request.QueryString["ItemId"].ToString()));

            Response.Redirect(string.Format("FakePrediction.aspx?Type={0}&Size={1}&PositiveCnt={2}&NegativeCnt={3}&Day={4}&Time={5}", lblProductName.Text, msgSize, satisfiedCnt, depressedCnt, _day, _time));

        }
    }
}