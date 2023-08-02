<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminFakeReviews.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.AdminFakeReviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server">
    
<div class="container">
<br />

<h2>FAKE REVIEWS DETECTION USING ML</h2>
<hr class="colorgraph">


			<br />
             <div style="height:500px; width:auto; overflow:auto">
<asp:GridView ID="GridView1" runat="server" BackColor="White" 
         BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="3" BorderStyle="None">

    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle ForeColor="#000066" 
        HorizontalAlign="Left" BackColor="White" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" ForeColor="White" Font-Bold="True" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />

</asp:GridView>
</div>
      
            <br />

             <h2><span>FAKE REVIEWS </span>DETECTION USING NAIVE BAYES ALGORITHM</h2>
          <hr />

          <br />
          <div class="col-xs-12 col-md-6">
          <asp:Button ID="btnPrediction" runat="server" 
                      Text="Click Here to Predict" 
              onclick="btnPrediction_Click" class="btn btn-primary btn-block btn-lg"  /></div> &nbsp;&nbsp;&nbsp;

              <div class="col-xs-12 col-md-6">
          <asp:Button ID="btnResults" runat="server" class="btn btn-primary btn-block btn-lg" 
              onclick="btnResults_Click" Text="Results" /></div>
          <br /><br /><div>
          <h2> 1-FAKE, 0-REAL</td> </h2>
      <asp:Table ID="tablePrediction" runat="server">
      </asp:Table>

            <br />
		
	

</div>

<br />
<br />

</asp:Panel>

</asp:Content>
