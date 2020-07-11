Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Partial Class usrview
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("e_id"))
        If eid = Nothing Then
            Response.Redirect("EmpLogin.aspx")
        End If
        Dim value As String = ""
        sess_id.Text = Session("e_id").ToString()
        Dim con As SqlConnection
        Dim mycon As String
        Dim da As SqlDataAdapter
        Dim dset As New DataSet
        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(mycon)
        con.Open()
        da = New SqlDataAdapter("SELECT ename FROM employee where email='" & sess_id.Text & "'", con)
        da.Fill(dset)
        If dset.Tables(0).Rows.Count > 0 Then
            msg.Text = "Welcome " & dset.Tables(0).Rows(0)("ename")
        End If

    End Sub
End Class
