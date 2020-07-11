
Partial Class usr_logout
    Inherits System.Web.UI.Page
        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("e_id"))
        If eid = Nothing Then
            Response.Redirect("EmpLogin.aspx")
        End If
        Session.Remove("e_id")
        Label1.Text = "<p>Logout Successfully</p>"
        End Sub
    End Class

