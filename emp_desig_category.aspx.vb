Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Partial Class emp_desig_category
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If
        If Not (Me.IsPostBack) Then
            Me.SearchCustomers()
        End If
    End Sub
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue = "New" Then
            TextBox2.Enabled = True
        End If
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim Num, Num1, m, p As Integer
        Dim myconn1, num2, num3, pad As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(id) from emp_desig", con)
        cmd.ExecuteNonQuery()
        If IsDBNull(cmd.ExecuteScalar) Then
            Num = 1
        Else
            Num = cmd.ExecuteScalar + 1
        End If
        m = Len(CStr(Num))
        p = 4 - m
        pad = StrDup(p, "0")
        num2 = pad & CStr(Num)
        cmd = New SqlCommand("select max(emp_desig_id) from emp_desig", con)
        cmd.ExecuteNonQuery()
        If IsDBNull(cmd.ExecuteScalar) Then
            Num1 = 1
        Else
            Num1 = cmd.ExecuteScalar + 1
        End If
        m = Len(CStr(Num1))
        p = 4 - m
        pad = StrDup(p, "0")
        num3 = pad & CStr(Num1)

        If TextBox2.Text = "" Or DropDownList1.SelectedValue = "select" Then
            msg.Text = "Enter all required field"
        Else
            cmd = New SqlCommand("insert into emp_desig(id,emp_desig_id,emp_desig_desc,emp_desig_status)values(@id,@emp_desig_id,@emp_desig_desc,@emp_desig_status)", con)
            cmd.Parameters.AddWithValue("@id", num2)
            cmd.Parameters.AddWithValue("@emp_desig_id", num3)
            cmd.Parameters.AddWithValue("@emp_desig_desc", (TextBox2.Text).ToUpper)
            cmd.Parameters.AddWithValue("@emp_desig_status", "ENABLE")
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("emp_desig_category.aspx")
        End If
    End Sub

    Protected Sub GridView2_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView2.RowEditing
        GridView2.EditIndex = e.NewEditIndex
        'TO FIND THE THE INDEX OF THE ROW BEING EDITED
        GridView2.DataSource = SqlDataSource2
        GridView2.DataBind()
    End Sub

    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView2.RowCommand
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        If e.CommandName = "DeleteCommand" Then
            cmd = New SqlCommand("delete from emp_desig where emp_desig_id=@emp_desig_id", con)
            cmd.Parameters.AddWithValue("@emp_desig_id", e.CommandArgument)
            'MsgBox(e.CommandArgument)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("emp_desig_category.aspx")
        End If
    End Sub

    Protected Sub GridView2_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView2.RowUpdating

        Dim id As Label = CType(GridView2.Rows(e.RowIndex).FindControl("emp_desig_id"), Label)
        Dim desc As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("emp_desig_desc"), TextBox)
        Dim status As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("emp_desig_status"), TextBox)
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        SqlDataSource2.UpdateCommand = "update emp_desig set emp_desig_desc='" & desc.Text & "',emp_desig_status='" & status.Text & "' where emp_desig_id=" & Convert.ToInt32(id.Text)
        SqlDataSource2.Update()
        GridView2.EditIndex = -1
        Response.Redirect("emp_desig_category.aspx")
    End Sub

    Protected Sub GridView2_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView2.RowCancelingEdit
        GridView2.EditIndex = -1
        Response.Redirect("emp_desig_category.aspx")
    End Sub
    Protected Sub GridView2_PreRender(sender As Object, e As EventArgs) Handles GridView2.PreRender
        Label5.Text = "Displaying page " & (GridView2.PageIndex + 1).ToString() & " of " & (GridView2.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String = "SELECT * FROM [emp_desig]"
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    sql += " WHERE emp_desig_desc LIKE @emp_desig_desc + '%'"
                    cmd.Parameters.AddWithValue("@emp_desig_desc", TextBox3.Text.Trim())
                End If
                cmd.CommandText = sql
                cmd.Connection = con
                Using sda As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    GridView2.DataSourceID = String.Empty
                    GridView2.DataSource = dt
                    GridView2.DataBind()
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Search(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        Me.SearchCustomers()
    End Sub
    Protected Sub OnPaging(sender As Object, e As GridViewPageEventArgs)
        GridView2.PageIndex = e.NewPageIndex
        Me.SearchCustomers()
    End Sub
End Class







