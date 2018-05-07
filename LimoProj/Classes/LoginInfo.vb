'Vincent Ly
Public Class LoginInfo
    Public Property UserName() As String
    Public Property Password() As String

    Public Sub New(ByVal UserName As String, ByVal Password As String)
        Me.UserName = UserName
        Me.Password = Password
    End Sub
End Class
