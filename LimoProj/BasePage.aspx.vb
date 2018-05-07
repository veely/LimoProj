Public Class BasePage
    Inherits System.Web.UI.Page

    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
        MyBase.OnInit(e)

        If Context IsNot Nothing AndAlso Context.Session IsNot Nothing AndAlso Session.Item("login") Is Nothing Then
            Response.Redirect("~/login.aspx")
        End If
    End Sub
End Class