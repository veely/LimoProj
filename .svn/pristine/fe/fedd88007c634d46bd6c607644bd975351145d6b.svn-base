<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="LimoProj.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Employee Search</title>
    <style type="text/css">
        #Text1 {
            margin-bottom: 0px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_1" runat="server" Text="Hello, "></asp:Label>
            <asp:Label ID="lbl_fn" runat="server" Text="lbl_fn"></asp:Label>
&nbsp;
            <asp:Label ID="lbl_ln" runat="server" Text="lbl_ln"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#003399" Text="Search for bookings by phone number"></asp:Label>
            <br />
            <asp:Label ID="lbl_2" runat="server" Text="Please enter a phone number:"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txt_phone_number" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_phone_number" ErrorMessage="You must enter a phone number" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btn_show_booking" runat="server" Text="Show Client Service Bookings" />
            <br />
            <br />
            <asp:Label ID="lbl_3" runat="server" Enabled="False" Text="There is no client associated with that phone number." ForeColor="#CC0000" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btn_limousine_booking" runat="server" Height="26px" Text="Go to Limousine Booking Page" Width="197px" CausesValidation="False" />
&nbsp; <asp:Button ID="btn_lfm" runat="server" Text="Go to Limousine Fleet Management Page" CausesValidation="False" />
            <br />
            <br />
            <asp:Button ID="btn_logout" runat="server" CausesValidation="False" Text="Logout" Height="26px" Width="137px" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
