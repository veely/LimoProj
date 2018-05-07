'Jeha Kwon

Public Class Home
    Inherits BasePage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim admin As Administrator = CType(Session.Item("login"), Administrator)
        Dim ClientDAO As New ClientDAO(admin.FirstName, admin.LastName)
        lbl_fn.Text = admin.FirstName
        lbl_ln.Text = admin.LastName



       

    End Sub


    Protected Sub btn_show_booking_Click(sender As Object, e As EventArgs) Handles btn_show_booking.Click
        If IsValid Then
            lbl_3.Visible = False
            Dim admin As Administrator = CType(Session.Item("login"), Administrator)
            Dim ClientDAO As New ClientDAO(admin.FirstName, admin.LastName)
            Dim PhoneNumber As String = Convert.ToString(txt_phone_number.Text)
            Dim client As Client = New ClientDAO(admin.UserId, admin.Password).FindByPhoneNumber(PhoneNumber)
            If client IsNot Nothing Then
                Response.Redirect(String.Format("~/ClientBookingsPage.aspx?PhoneNumber={0}", Server.UrlEncode(PhoneNumber)))
            Else
                lbl_3.Visible = True
            End If
        End If
    End Sub


    Protected Sub btn_limousine_booking_Click(sender As Object, e As EventArgs) Handles btn_limousine_booking.Click
        Response.Redirect("~/BookLimousine.aspx")
        ' book limousine page name should be changed... there is space between book and limousine....
    End Sub


    Protected Sub btn_lfm_Click(sender As Object, e As EventArgs) Handles btn_lfm.Click
        Response.Redirect("~/LimousineFleetManagement.aspx")
    End Sub


    Protected Sub btn_logout_Click(sender As Object, e As EventArgs) Handles btn_logout.Click
        Session.Abandon()
        Response.Redirect("~/Home.aspx")
    End Sub
End Class