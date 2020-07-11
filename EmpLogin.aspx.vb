Imports System.Data.SqlClient

Partial Class EmpLogin
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        captcha1.ValidateCaptcha(TextBox3.Text.Trim())
        If (captcha1.UserValidated) Then
            Dim con As New SqlConnection
            Dim cmd, cmd1 As New SqlCommand
            Dim myconn1 As String
            Dim K As String
            myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
            con = New SqlConnection(myconn1)
            con.Open()
            cmd = New SqlCommand("select count(*) from employee where email='" & abc.Text & "' and password='" & TextBox2.Text & "'", con)
            cmd.ExecuteNonQuery()
            If (cmd.ExecuteScalar <> 0) Then
                Session("e_id") = abc.Text
                Response.Redirect("usrview.aspx")
                MsgBox("login success")
            Else
                Label4.Text = "<p style=color:red>Login Failed</p>"
                abc.Text = ""
                TextBox2.Text = ""
                TextBox3.Text = ""
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Empregister.aspx")
    End Sub
End Class

