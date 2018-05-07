'Vincent Ly
Imports System.Data.OracleClient
Public Class LimousineDAO

    Private Property UserId() As String
    Private Property Password() As String

    Public Sub New(ByVal UserId As String, ByVal Password As String)
        Me.UserId = UserId
        Me.Password = Password
    End Sub

    Public Function LoadAllLimousines() As List(Of Limousine)
        Dim conn As New OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", UserId, Password))
        Dim cmd As New OracleCommand("SELECT * FROM limousine ORDER BY style, model ASC", conn)
        Dim da As New OracleDataAdapter(cmd)
        Dim dt As New DataTable
        Dim limousines As New List(Of Limousine)
        da.Fill(dt)
        For Each dr As DataRow In dt.Rows
            Dim vin As String = Convert.ToString(dr.Item("vin"))
            Dim model As String = Convert.ToString(dr.Item("model"))
            Dim style As String = Convert.ToString(dr.Item("style"))
            limousines.Add(New Limousine(vin, model, style))
        Next
        Return limousines
    End Function

    Public Function RemoveLimousine(ByVal Vin As String) As Boolean
        Dim conn As New OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", UserId, Password))
        Dim cmd As New OracleCommand(UserId + ".DELETE_LIMOUSINE", conn)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("vin_param", Vin)
        cmd.Parameters.Add("success_status", OracleType.Number).Direction = ParameterDirection.Output
        conn.Open()
        Try
            cmd.ExecuteNonQuery()
        Finally
            conn.Close()
        End Try
        If cmd.Parameters("success_status").Value = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function SaveLimousine(ByVal Vin As String, ByVal Model As String, ByVal Style As String) As Limousine
        Dim conn As New OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", UserId, Password))
        Dim cmd As New OracleCommand("INSERT INTO limousine(vin, model, style) VALUES (:vin, :model, :style)", conn)
        cmd.Parameters.AddWithValue(":vin", Vin)
        cmd.Parameters.AddWithValue(":model", Model)
        cmd.Parameters.AddWithValue(":style", Style)
        conn.Open()
        Try
            cmd.ExecuteNonQuery()
        Finally
            conn.Close()
        End Try
    End Function

    Public Function AuthenticateAdministrator() As Administrator
        Dim conn As New OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1};", UserId, Password))
        Dim cmd As New OracleCommand("SELECT first_name, last_name FROM administrator WHERE user_id = :username", conn)
        cmd.Parameters.AddWithValue(":username", UserId.ToUpper())
        Dim da As New OracleDataAdapter(cmd)
        Dim dt As New DataTable
        da.Fill(dt)
        If dt.Rows.Count <> 0 Then
            Dim firstName = dt.Rows(0)(0)
            Dim lastName = dt.Rows(0)(1)
            Return New Administrator(UserId, Password, firstName, lastName)
        Else
            Return Nothing
        End If
    End Function
End Class
