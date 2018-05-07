'OLS655 Final Project
'Eunhye Chae 010327146

Public Class BookLimousine
    Inherits BasePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim login As Administrator = CType(Session.Item("login"), Administrator)    'Should use Administrator object instead of LoginInfo (Administrator is logininfo)
            Dim BookingDAO As New BookingDAO(login.UserId, login.Password)

            'A valiable that is used for increment of both pickup time and duration
            Dim min As Double = 0

            'Add the first 12:00 AM item to the drop-down list
            Dim firsttimeitem As New ListItem()
            firsttimeitem.Text = "12:00 AM"
            'put 0 min to the item value
            firsttimeitem.Value = min
            ddlPickupTime.Items.Add(firsttimeitem)

            Dim pickuptime As DateTime = Convert.ToDateTime("12:00 AM")
            For i As Integer = 0 To 46
                Dim pickuptimelist As New ListItem()
                pickuptime = pickuptime.AddMinutes(30)
                'Add time interval by 30mins.
                'Examples > 00:30 - 30 min, 01:00 - 60 min, 01:30 - 90 min, and so forth
                min += 30
                pickuptimelist.Text = pickuptime.ToString("hh:mm tt")
                pickuptimelist.Value = min
                ddlPickupTime.Items.Add(pickuptimelist)
            Next

            'reset min to 0 to reused it in duration interval calculation
            min = 0

            Dim duration As Date = "00:00"
            'Add available durations to drop-down list : Maximum 24 hours
            For i As Integer = 0 To 46
                Dim durationlist As New ListItem()
                duration = duration.AddMinutes(30)
                'Add time interval by 30mins.
                'Examples > 00:30 - 30 min, 01:00 - 60 min, 01:30 - 90 min, and so forth
                'Very last min increased by the line below will be ingnore to be added to the value field of list item
                min += 30
                durationlist.Text = duration.ToString("H:mm")
                durationlist.Value = min
                ddlDuration.Items.Add(durationlist)
            Next

            'Add the last 24 hours item to the drop-down list
            'ddlDuration.Items.Add(timelist)
            Dim lasttimeitem As New ListItem()
            lasttimeitem.Text = "24:00"
            'put 1440 min(24 hours) to the item value
            lasttimeitem.Value = min + 30
            ddlDuration.Items.Add(lasttimeitem)

        End If
    End Sub

    Protected Sub btnLookupClient_Click(sender As Object, e As EventArgs) Handles btnLookupClient.Click
        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim clientDAO As New ClientDAO(login.UserId, login.Password)
        Dim client As Client = clientDAO.FindByPhoneNumber(txtPhoneNumber.Text)

        If client Is Nothing Then
            txtFirstName.Text = Nothing
            txtLastName.Text = Nothing
            lblInvalid.Visible = False
        ElseIf Not String.IsNullOrEmpty(txtPhoneNumber.Text) Then
            txtFirstName.Text = client.FirstName
            txtLastName.Text = client.LastName
            lblInvalid.Visible = False
        Else
            lblInvalid.Visible = True
        End If
    End Sub

    Protected Sub btnCheckAvailability_Click(sender As Object, e As EventArgs) Handles btnCheckAvailability.Click
        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim bookingDAO As New BookingDAO(login.UserId, login.Password)
        Dim pickupdate As Date = DateTime.Parse(txtPickupDate.Text)
        Dim time As Integer = Convert.ToInt32(ddlPickupTime.SelectedValue)
        Dim duration As Integer = Convert.ToInt32(ddlDuration.SelectedValue)
        Dim pickupDateandTime As Date = pickupdate.AddMinutes(time)
        Dim limostyle As String = Convert.ToString(ddlStyle.SelectedValue)

        Dim AvailableVehicles As List(Of Limousine) = bookingDAO.FindLimousines(pickupDateandTime, duration, limostyle)

        gvAvailableVehicles.DataSource = AvailableVehicles
        'gvAvailableVehicles.Columns.Item(0).Visible = True
        gvAvailableVehicles.DataBind()
        'gvAvailableVehicles.Columns.Item(0).Visible = False
    End Sub

    Private Sub gvAvailableVehicles_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvAvailableVehicles.RowCommand
        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim client As New ClientDAO(login.UserId, login.Password)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim bookingDAO As New BookingDAO(login.UserId, login.Password)
        Dim pickupdate As Date = DateTime.Parse(txtPickupDate.Text)
        Dim time As Integer = Convert.ToInt32(ddlPickupTime.SelectedValue)
        Dim duration As Integer = Convert.ToInt32(ddlDuration.SelectedValue)
        Dim PickupDateAndTime As Date = pickupdate.AddMinutes(time)
        Dim DropoffDateAndTime As Date = pickupdate.AddMinutes(duration)
        Dim limostyle As String = Convert.ToString(ddlStyle.SelectedValue)
        Dim bookingID As Integer

        If e.CommandName = "BOOK" Then
            Try
                client.SaveClient(txtFirstName.Text, txtLastName.Text, txtPhoneNumber.Text)
                bookingID = bookingDAO.BookLimousine(txtPhoneNumber.Text, gvAvailableVehicles.Rows.Item(index).Cells.Item(0).Text, PickupDateAndTime, DropoffDateAndTime)
            Catch
                lblError.Visible = True
            End Try
            Response.Redirect(String.Format("~/ClientBookingsPage.aspx?PhoneNumber={0}", Server.UrlEncode(txtPhoneNumber.Text))) ' Redirect using a URL-encoded parameter (?clientPhoneNo=value).
        End If
    End Sub

    Protected Sub btnHome_Click(sender As Object, e As EventArgs) Handles btnHome.Click
        Response.Redirect("~/Home.aspx")
    End Sub
End Class