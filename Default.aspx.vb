Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim con As New SqlConnection
        Dim cmd, cmd1 As New SqlCommand
        Dim pic As Byte
        Dim myconn1, k As String
        'Dim imagedata() As Byte
        k = Convert.ToString(Session("uid"))
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select admin_name from admin_login where uid='" & k & "'", con)
        Label1.Text = "Welcome " & cmd.ExecuteScalar
        cmd.ExecuteNonQuery()
        con.Close()
        ' con.Open()
        ' cmd = New SqlCommand("select pic from admin_login where uid='" & k & "'", con)
        'Dim dr As SqlDataReader = cmd.ExecuteReader()
        'If (dr.HasRows) Then
        'While (dr.Read())

        'imagedata = (Byte[]).dr("pic").ToString
        'Dim img As String = Convert.ToBase64String(imagedata, 0, imagedata.Length)
        'Image1.ImageUrl = "data:Image;base64," & img

        'End While
        'End If
    End Sub
End Class


