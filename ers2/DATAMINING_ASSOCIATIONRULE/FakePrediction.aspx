<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="FakePrediction.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.FakePrediction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server">
    
<div class="container">
<br />

<h2>FAKE REVIEW DETECTION</h2>
<hr class="colorgraph">


			
			

			<div class="form-group">
             <p><b>Gender</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Gender" 
                    tabindex="4" ID="txtGender" runat="server" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Enter Gender" ControlToValidate="txtGender" 
                    CssClass="validation" ToolTip="Enter Gender" ValidationGroup="a">Enter Gender</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Age</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Age" 
                    tabindex="4" ID="txtAge" runat="server" TextMode="SingleLine" Width=50% 
                   ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Enter Age" ControlToValidate="txtAge" 
                    CssClass="validation" ToolTip="Enter Age" ValidationGroup="a">Enter Age</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Experience</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Experience" 
                    tabindex="4" ID="txtExperience" runat="server" TextMode="SingleLine" Width=50% 
                   ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Enter Experience" ControlToValidate="txtExperience" 
                    CssClass="validation" ToolTip="Enter Experience" ValidationGroup="a">Enter Experience</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Total Posts</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Total Posts" 
                    tabindex="4" ID="txtTotalPosts" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Enter Total Posts" ControlToValidate="txtTotalPosts" 
                    CssClass="validation" ToolTip="Enter Total Posts" ValidationGroup="a">Enter Total Posts</asp:RequiredFieldValidator>

			</div>

           

            <div class="form-group">
             <p><b>Message Size</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter MessageSize" 
                    tabindex="4" ID="txtMessageSize" runat="server" TextMode="SingleLine" Width=50% 
                   ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="Enter MessageSize" ControlToValidate="txtMessageSize" 
                    CssClass="validation" ToolTip="Enter MessageSize" ValidationGroup="a">Enter MessageSize</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>HowOften</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter HowOften" 
                    tabindex="4" ID="txtHowOften" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="Enter HowOften" ControlToValidate="txtHowOften" 
                    CssClass="validation" ToolTip="Enter HowOften" ValidationGroup="a">Enter HowOften</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Positive Words Count</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter PositiveWords Cnt" 
                    tabindex="4" ID="txtPositiveCnt" runat="server" TextMode="SingleLine" Width=50% 
                   ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="Enter PositiveCnt" ControlToValidate="txtPositiveCnt" 
                    CssClass="validation" ToolTip="Enter PositiveCnt" ValidationGroup="a">Enter PositiveCnt</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Negative Words Count</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Negative Cnt" 
                    tabindex="4" ID="txtNegativeCnt" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ErrorMessage="Enter NegativeCnt" ControlToValidate="txtNegativeCnt" 
                    CssClass="validation" ToolTip="Enter NegativeCnt" ValidationGroup="a">Enter NegativeCnt</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Location</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Location" 
                    tabindex="4" ID="txtLocation" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="Enter Location" ControlToValidate="txtLocation" 
                    CssClass="validation" ToolTip="Enter Location" ValidationGroup="a">Enter Location</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Posted Day</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Day" 
                    tabindex="4" ID="txtDay" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ErrorMessage="Enter Day" ControlToValidate="txtDay" 
                    CssClass="validation" ToolTip="Enter Day" ValidationGroup="a">Enter Day</asp:RequiredFieldValidator>

			</div>

            <div class="form-group">
             <p><b>Posted Time</b></p>
				<asp:TextBox class="form-control input-lg" placeholder="Enter Time" 
                    tabindex="4" ID="txtTime" runat="server" TextMode="SingleLine" Width=50% 
                    ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ErrorMessage="Enter Time" ControlToValidate="txtTime" 
                    CssClass="validation" ToolTip="Enter Time" ValidationGroup="a">Enter Time</asp:RequiredFieldValidator>

			</div>

                       
			
			
			<div class="row">
				<div class="col-xs-12 col-md-6">
                    <asp:Button ID="btnUpdate" runat="server" Text="Predict Result" 
                        class="btn btn-primary btn-block btn-lg" Width=50% 
                        ValidationGroup="a" onclick="btnUpdate_Click" />
                    <br />
                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                </div>
				
			</div>
		
	

</div>

<br />
<br />

</asp:Panel>
</asp:Content>
