Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Partial Class usr_keyinfo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim sess_id As String
        sess_id = Nothing
        sess_id = CStr(Session("e_id"))
        If sess_id = Nothing Then
            Response.Redirect("EmpLogin.aspx")
            'MsgBox("hi")
        End If
        Dim con As SqlConnection
        Dim mycon As String
        Dim da As SqlDataAdapter
        Dim dset As New DataSet
        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(mycon)
        con.Open()
        da = New SqlDataAdapter("select ename,mobile_no,email,faddress,dob,district,sdivition,language,gender,status from employee where email='" & sess_id & "'", con)
        da.Fill(dset)
        If dset.Tables(0).Rows.Count > 0 Then
            name.Text = dset.Tables(0).Rows(0)("ename")
            mobile_no.Text = dset.Tables(0).Rows(0)("mobile_no")
            email.Text = dset.Tables(0).Rows(0)("email")
            address.Text = dset.Tables(0).Rows(0)("faddress")
            district.Text = dset.Tables(0).Rows(0)("district")
            sdivition.Text = dset.Tables(0).Rows(0)("sdivition")
            language.Text = dset.Tables(0).Rows(0)("language")
            gender.Text = dset.Tables(0).Rows(0)("gender")
            dob.Text = dset.Tables(0).Rows(0)("dob")
            status.Text = dset.Tables(0).Rows(0)("status")
        End If
    End Sub
End Class