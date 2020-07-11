Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class notific_category
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue = "New" Then
            TextBox2.Enabled = True
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If
        If Not Me.IsPostBack Then
            Me.SearchCustomers()
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim Num, Num1, m, p As Integer
        Dim n, myconn1, num2, num3, pad As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(notifi_category_id) from notification_category", con)
        cmd.ExecuteNonQuery()
         If IsDBNull(cmd.ExecuteScalar) Then
            Num = 1
        Else
            Num = cmd.ExecuteScalar + 1
        End If
        m = Len(CStr(Num))
        p = 4 - m
        pad = StrDup(p, "0")
        'MsgBox(pad)
        num2 = pad & CStr(Num)
       ' MsgBox(num2)
        cmd = New SqlCommand("select max(id) from notification_category", con)
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
            cmd = New SqlCommand("insert into notification_category (id,notifi_category_id,notifi_category_desc,notifi_category_status)values(@id,@notifi_category_id,@notifi_category_desc,@notifi_category_status)", con)
            cmd.Parameters.AddWithValue("@id", num3)
            cmd.Parameters.AddWithValue("@notifi_category_id", num2)
            cmd.Parameters.AddWithValue("@notifi_category_desc", (TextBox2.Text).ToUpper)
            cmd.Parameters.AddWithValue("@notifi_category_status", "ENABLE")
            cmd.ExecuteNonQuery()
            con.Close()
            'Label2.Text = "<p style=color:red>insert Successfully</p>"
            'TextBox2.Text = ""
            'DropDownList1.SelectedIndex = 0
            Response.Redirect("notific_category.aspx")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

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
            cmd = New SqlCommand("delete from notification_category where notifi_category_id=@notifi_category_id", con)
            cmd.Parameters.AddWithValue("@notifi_category_id", e.CommandArgument)
            MsgBox(e.CommandArgument)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("notific_category.aspx")
         End If


    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        Dim id As Label = CType(GridView1.Rows(e.RowIndex).FindControl("notifi_category_id"), Label)
        Dim nm As TextBox = CType(GridView1.Rows(e.RowIndex).FindControl("notifi_category_desc"), TextBox)
        Dim nm1 As TextBox = CType(GridView1.Rows(e.RowIndex).FindControl("notifi_category_status"), TextBox)
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        'MsgBox(nm.Text)
        'MsgBox(id.Text)
        SqlDataSource1.UpdateCommand = "update notification_category set notifi_category_desc='" & nm.Text & "',notifi_category_status='" & nm1.Text & "' where notifi_category_id=" & Convert.ToInt32(id.Text)
        'cmd = New SqlCommand("update notification set notifi_desc='" & nm.Text & "' where notifi_id=" & Convert.ToInt32(id.Text), con)
        'cmd.Parameters.AddWithValue("@notifi_desc", nm.Text)
        'cmd.Parameters.AddWithValue("@notifi_id", Convert.ToInt32(id.Text))
        'SqlDataSource1.UpdateCommand = cmd
        'cmd.ExecuteNonQuery()
        SqlDataSource1.Update()
        GridView1.EditIndex = -1
        Response.Redirect("notific_category.aspx")
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        Response.Redirect("notific_category.aspx")
    End Sub
    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        Label5.Text = "Displaying page " & (GridView1.PageIndex + 1).ToString() & " of " & (GridView1.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String = "SELECT [notifi_category_id], [notifi_category_desc], [notifi_category_status] FROM [notification_category]"
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    sql += " WHERE notifi_category_desc LIKE @notifi_category_desc + '%'"
                    cmd.Parameters.AddWithValue("@notifi_category_desc", TextBox3.Text.Trim())
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








