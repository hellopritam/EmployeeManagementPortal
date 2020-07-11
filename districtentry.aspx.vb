Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class districtentry
    Inherits System.Web.UI.Page
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue = "New" Then
            TextBox2.Enabled = True
        End If
    End Sub

    Protected Sub button1_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim Num, m, p As Integer
        Dim n, myconn1, pad, num2 As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(code) from district4", con)
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
        cmd = New SqlCommand("insert into district4 values('" & num2 & "','" & TextBox2.Text.ToUpper & "')", con)
        If (TextBox2.Text = "") Then
            msg.Text = "Enter all required field"
        Else
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("districtentry.aspx")
        End If
    End Sub
    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        GridView1.DataSource = SqlDataSource1
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        If e.CommandName = "DeleteCommand" Then
            cmd = New SqlCommand("delete from district4 where code=@code", con)
            cmd.Parameters.AddWithValue("@code", e.CommandArgument)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("districtentry.aspx")
        End If


    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        Dim id As Label = CType(GridView1.Rows(e.RowIndex).FindControl("code"), Label)
        Dim nm As TextBox = CType(GridView1.Rows(e.RowIndex).FindControl("name"), TextBox)
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        SqlDataSource1.UpdateCommand = "update district4 set name='" & nm.Text & "' where code=" & Convert.ToInt32(id.Text)
        SqlDataSource1.Update()
        GridView1.EditIndex = -1
        Response.Redirect("districtentry.aspx")
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        Response.Redirect("districtentry.aspx")
    End Sub
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
    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        Label5.Text = "Displaying page " & (GridView1.PageIndex + 1).ToString() & " of " & (GridView1.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String = "SELECT code,name FROM district4"
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    sql += " WHERE name LIKE @name + '%'"
                    cmd.Parameters.AddWithValue("@name", TextBox3.Text.Trim())
                End If
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






