<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ClientBookingsPage.aspx.vb" Inherits="LimoProj.NewEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Edit Employee</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 164px;
        }
        </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#txtHiredate").datepicker({ dateFormat: "yy-mm-dd", gotoCurrent: true });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lbl_fn" runat="server" Text="lbl_fn" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;
        <asp:Label ID="lbl_ln" runat="server" Text="lbl_ln" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gv_booking" runat="server" Width="423px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:ButtonField CommandName="Cancel" Text="Cancel Booking" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="btn_home" runat="server" Text="HOME" />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
