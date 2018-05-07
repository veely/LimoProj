<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LimousineFleetManagement.aspx.vb" Inherits="LimoProj.LimousineFleetManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 71px;
        }
        .auto-style4 {
            width: 147px;
        }
        .auto-style2 {
            width: 71px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
            width: 147px;
        }
        .auto-style3 {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblLimoFleet" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#333399" Text="Limousine Fleet"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Click 'Remove Limousine' to delete a limousine from the database. (NOTE: A limousine can only be removed if it is not booked)"></asp:Label>
            <br />
            <asp:GridView ID="gvLimos" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Vin" HeaderText="VIN">
                    <HeaderStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Model" HeaderText="Model">
                    <HeaderStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Style" HeaderText="Style">
                    <HeaderStyle Width="60px" />
                    </asp:BoundField>
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Remove Limousine" />
                </Columns>
                <HeaderStyle BackColor="#006699" ForeColor="White" />
            </asp:GridView>
        </div>
        <asp:Label ID="lblErrorRemoving" runat="server" ForeColor="Red" Text="Error: Limousine is currently booked.  Cannot be removed." Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblAddLimo" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#333399" Text="Add Limousine"></asp:Label>
        <br />
        <table style="width: 39%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblVin" runat="server" Text="VIN: "></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtVin" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvVin" runat="server" ControlToValidate="txtVin" ErrorMessage="VIN is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblModel" runat="server" Text="Model:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="rfvModel" runat="server" ControlToValidate="txtModel" ErrorMessage="Model is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblStyle" runat="server" Text="Style:"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlStyle" runat="server" Height="18px" Width="128px">
                        <asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Stretch</asp:ListItem>
                        <asp:ListItem>Bus</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="btnAddLimo" runat="server" Text="Add to Fleet" Width="106px" />
        &nbsp;<asp:Label ID="lblErrorSaving" runat="server" ForeColor="Red" Text="Error: Save was not successful." Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btnHome" runat="server" Text="Home" CausesValidation="False" />
    </form>
</body>
</html>
