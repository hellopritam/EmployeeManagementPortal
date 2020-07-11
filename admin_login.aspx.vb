Imports System.Data.SqlClient

Partial Class admin_login
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        captcha1.ValidateCaptcha(TextBox3.Text.Trim())
        If (captcha1.UserValidated) Then
            Dim con As New SqlConnection
            Dim cmd, cmd1 As New SqlCommand
            Dim myconn1 As String
            Dim K As String
            Dim ipaddress, status As String
            Dim currentdatetime As String
            currentdatetime = DateAndTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
            ipaddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
            If ipaddress = "" Or ipaddress Is Nothing Then
                ipaddress = Request.ServerVariables("REMOTE_ADDR")
            End If

            myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
            con = New SqlConnection(myconn1)
            con.Open()
            cmd = New SqlCommand("select count(*) from admin_login where uid='" & abc.Text & "' and password='" & TextBox2.Text & "'", con)
            cmd.ExecuteNonQuery()
            If (cmd.ExecuteScalar <> 0) Then
                Session("uid") = abc.Text
                status = "login success"
                cmd1 = New SqlCommand("insert into odit_log values('" & abc.Text & "','" & currentdatetime & "','" & status & "','" & ipaddress & "')", con)
                cmd1.ExecuteNonQuery()
                Response.Redirect("Default.aspx")
            Else
                status = "login failed"
                cmd1 = New SqlCommand("insert into odit_log values('" & abc.Text & "','" & currentdatetime & "','" & status & "','" & ipaddress & "')", con)
                cmd1.ExecuteNonQuery()
                Label4.Text = "<p style=color:red>Login Failed</p>"
                abc.Text = ""
                TextBox2.Text = ""
                TextBox3.Text = ""
            End If
        End If

    End Sub
End Class
