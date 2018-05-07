<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BookLimousine.aspx.vb" Inherits="LimoProj.BookLimousine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Limousine</title>
    <style type="text/css">
        .style1 {
            width: 49%;
        }

        .style2 {
            width: 130px;
        }
    </style>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtPickupDate").datepicker({ dateFormat: "yy-mm-dd", gotoCurrent: true });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#990000" Text="Book Limousine"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblIntruction1" runat="server" Font-Bold="True" Text="Please enter your first name, last name, and phone number"></asp:Label>
            <br />
            <br />
            <table class="style1">
                <tr>
                    <td class="style2">First Name :</td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ControlToValidate="txtFirstName" ErrorMessage="First name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Last Name :</td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ControlToValidate="txtLastName" ErrorMessage="Last name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">Phone Number :</td>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                            ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="btnLookupClient" runat="server" Text="Lookup Client" CausesValidation="False" />
        <br />
        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red" Text="Please make sure you entered right phone number without hyphen (-)" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblLimoBooking" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#CC6600" Text="Limousine service booking"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblIntruction2" runat="server" Font-Bold="True" Text="Please enter pickup date, time, duration, and limousine style."></asp:Label>
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style2">Pickup Date :</td>
                <td>
                    <asp:TextBox ID="txtPickupDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPickupDate" runat="server"
                        ControlToValidate="txtPickupDate" ErrorMessage="Pickup date is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">Pickup Time :</td>
                <td>
                    <asp:DropDownList ID="ddlPickupTime" runat="server" Width="130px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPickupTime" runat="server"
                        ControlToValidate="ddlPickupTime" ErrorMessage="Pickup time is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">Duration :</td>
                <td>
                    <asp:DropDownList ID="ddlDuration" runat="server" Width="130px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDuration" runat="server"
                        ControlToValidate="ddlDuration" ErrorMessage="Duration is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">Style :</td>
                <td>
                    <asp:DropDownList ID="ddlStyle" runat="server" Height="16px" Width="130px">
                        <asp:ListItem>Any</asp:ListItem>
                        <asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Stretch</asp:ListItem>
                        <asp:ListItem>Bus</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnCheckAvailability" runat="server" Text="Check Availability" Width="130px" />
&nbsp;<br />
        <asp:GridView ID="gvAvailableVehicles" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="margin-top: 0px" Width="485px" CellSpacing="2">
            <Columns>
                <asp:BoundField HeaderText="VIN" DataField="vin" />
                <asp:BoundField HeaderText="Model" DataField="Model">
                <HeaderStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Style" DataField="Style">
                <HeaderStyle Width="70px" />
                </asp:BoundField>
                <asp:ButtonField ButtonType="Button" CommandName="BOOK" HeaderText="Booking" Text="Book Limousine" CausesValidation="True" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="lblError" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnHome" runat="server" Text="Home" />
    </form>
</body>
</html>
