﻿'Vincent Ly
Imports System.Data.OracleClient
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If IsValid Then
            Try
                Dim conn As New OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1};", txtUsername.Text, txtPassword.Text))
                conn.Open()
                conn.Close()
                Dim logininfo = New LimousineDAO(txtUsername.Text, txtPassword.Text).AuthenticateAdministrator
                Session.Add("login", logininfo)
                Response.Redirect("~/Home.aspx")
            Catch ex As Exception
                lblInvalid.Visible = True
            End Try
        End If
    End Sub
End Class