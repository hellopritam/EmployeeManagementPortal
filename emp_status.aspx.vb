Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Partial Class Default2
    Inherits System.Web.UI.Page
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim gr As GridViewRow = GridView1.SelectedRow()
        ename.Text = gr.Cells(1).Text.ToString()
        eid.Text = gr.Cells(0).Text.ToString()
        ModalPopupExtender1.Show()
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim mycon As String = ""
        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString()
        con = New SqlConnection(mycon)
        con.Open()
        If Not DropDownList1.SelectedIndex = 0 Then
            cmd = New SqlCommand("update employee set status='APPROVED',designation_id='" & DropDownList1.SelectedValue & "' where eid='" & eid.Text & "'", con)
            cmd.ExecuteNonQuery()
        End If
        con.Close()
        'SqlDataSource1.DataBind()
        ' GridView1.DataSource = ""
        'GridView1.DataSourceID = "SqlDataSource1"
        'GridView1.DataBind()
        GridView1.SelectedIndex = -1
        Response.Redirect("emp_status.aspx")
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If
        Me.SearchCustomers()
    End Sub
    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        Label5.Text = "Displaying page " & (GridView1.PageIndex + 1).ToString() & " of " & (GridView1.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String = "SELECT [eid], [ename], [mobile_no], [email], [status] FROM [employee] WHERE ([status] = @status)"
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    sql += " and ename LIKE @ename + '%'"
                    cmd.Parameters.AddWithValue("@ename", TextBox3.Text.Trim())
                End If
                cmd.Parameters.AddWithValue("@status", emp_status.SelectedValue)
                cmd.CommandText = sql
                cmd.Connection = con
                Using sda As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    GridView1.DataSourceID = String.Empty
                    GridView1.DataSource = dt
                    GridView1.DataBind()

                End Using
            End Using
        End Using
    End Sub
    Protected Sub Search(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        Me.SearchCustomers()
    End Sub
    Protected Sub OnPaging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.SearchCustomers()
    End Sub
End Class
