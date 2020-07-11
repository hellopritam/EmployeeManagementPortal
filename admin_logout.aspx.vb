
Partial Class admin_logout
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If
        Session.Remove("uid")
        Label1.Text = "<p>Logout Successfully</p>"
    End Sub
End Class
