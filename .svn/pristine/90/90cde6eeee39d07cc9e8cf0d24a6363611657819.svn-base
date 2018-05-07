'Vincent Ly
Imports System.Data.OracleClient

Public Class LimousineFleetManagement
    Inherits BasePage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim limoDAO As New LimousineDAO(login.UserId, login.Password)
        gvLimos.DataSource = limoDAO.LoadAllLimousines()
        gvLimos.DataBind()
    End Sub

    Protected Sub gvLimos_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvLimos.RowDeleting
        lblErrorRemoving.Visible = False
        lblErrorSaving.Visible = False

        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim limoDAO As New LimousineDAO(login.UserId, login.Password)
        Dim canRemove As Boolean
        canRemove = limoDAO.RemoveLimousine(gvLimos.Rows(e.RowIndex).Cells(0).Text)
        If canRemove = True Then
            gvLimos.DataSource = limoDAO.LoadAllLimousines()
            gvLimos.DataBind()
        Else
            lblErrorRemoving.Visible = True
        End If
    End Sub

    Protected Sub btnAddLimo_Click(sender As Object, e As EventArgs) Handles btnAddLimo.Click
        lblErrorRemoving.Visible = False
        lblErrorSaving.Visible = False

        Dim login As Administrator = CType(Session.Item("login"), Administrator)
        Dim limoDAO As New LimousineDAO(login.UserId, login.Password)
        Try
            limoDAO.SaveLimousine(txtVin.Text, txtModel.Text, ddlStyle.SelectedItem.Text)
            gvLimos.DataSource = limoDAO.LoadAllLimousines()
            gvLimos.DataBind()
        Catch ex As Exception
            lblErrorSaving.Visible = True
        End Try
    End Sub

    Protected Sub btnHome_Click(sender As Object, e As EventArgs) Handles btnHome.Click
        Response.Redirect("~/Home.aspx")
    End Sub
End Class