Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Partial Class notific_details
    Inherits System.Web.UI.Page

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        If DropDownList2.SelectedValue = "New" Then
            TextBox2.Enabled = True
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If Not (DropDownList1.SelectedValue = "select") Then
            DropDownList2.Enabled = True
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim fname, fname1 As String
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim Num, Num1, m, p As Integer
        Dim n, myconn1, Num2, Num3, pad As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(id) from notification", con)
        cmd.ExecuteNonQuery()
        If IsDBNull(cmd.ExecuteScalar) Then
            Num = 1
        Else
            Num = cmd.ExecuteScalar + 1
        End If
        m = Len(CStr(Num))
        p = 4 - m
        pad = StrDup(p, "0")
        Num2 = pad & CStr(Num)
        cmd = New SqlCommand("select max(notifi_id) from notification", con)
        cmd.ExecuteNonQuery()
        If IsDBNull(cmd.ExecuteScalar) Then
            Num1 = 1
        Else
            Num1 = cmd.ExecuteScalar + 1
        End If
        m = Len(CStr(Num1))
        p = 4 - m
        pad = StrDup(p, "0")
        Num3 = pad & CStr(Num1)

        If Not (FileUpload1.HasFile) Or TextBox2.Text = "" Or DropDownList1.SelectedValue = "select" Or DropDownList2.Text = "select" Then
            msg.Text = "Enter all required field"
        Else
            fname = FileUpload1.FileName.ToString()
            'MsgBox(Request.PhysicalApplicationPath + "/notification/" + fname)
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/notification/" + fname)
            fname1 = "notification\" + fname
            cmd = New SqlCommand("insert into notification(id,notifi_id,notifi_desc,notifi_date,notifi_status,notifi_category_id,pdf_location)values(@id,@notifi_id,@notifi_desc,@notifi_date,@notifi_status,@notifi_category_id,@pdf_location)", con)
            cmd.Parameters.AddWithValue("@id", Num2)
            cmd.Parameters.AddWithValue("@notifi_id", Num3)
            cmd.Parameters.AddWithValue("@notifi_desc", (TextBox2.Text).ToUpper)
            cmd.Parameters.AddWithValue("@notifi_date", Date.Now)
            cmd.Parameters.AddWithValue("@notifi_status", "ENABLE")
            cmd.Parameters.AddWithValue("@notifi_category_id", DropDownList1.Text)
            cmd.Parameters.AddWithValue("@pdf_location", fname1)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("notific_details.aspx")
        End If
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
            cmd = New SqlCommand("delete from notification where notifi_id=@notifi_id", con)
            cmd.Parameters.AddWithValue("@notifi_id", e.CommandArgument)
            'MsgBox(e.CommandArgument)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("notific_details.aspx")
        End If
    End Sub

    Protected Sub GridView2_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView2.RowUpdating

        Dim id As Label = CType(GridView2.Rows(e.RowIndex).FindControl("notifi_id"), Label)
        'Dim ncid As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("notifi_category_id"), TextBox)
        Dim ndate As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("notifi_date"), TextBox)
        Dim desc As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("notifi_desc"), TextBox)
        Dim status As TextBox = CType(GridView2.Rows(e.RowIndex).FindControl("notifi_status"), TextBox)
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        'MsgBox(nm.Text)
        'MsgBox(id.Text)
        SqlDataSource2.UpdateCommand = "update notification set notifi_date='" & ndate.Text & "',notifi_desc='" & desc.Text & "',notifi_status='" & status.Text & "' where notifi_id=" & Convert.ToInt32(id.Text)
        'cmd = New SqlCommand("update notification set notifi_desc='" & nm.Text & "' where notifi_id=" & Convert.ToInt32(id.Text), con)
        'cmd.Parameters.AddWithValue("@notifi_desc", nm.Text)
        'cmd.Parameters.AddWithValue("@notifi_id", Convert.ToInt32(id.Text))
        'SqlDataSource1.UpdateCommand = cmd
        'cmd.ExecuteNonQuery()
        SqlDataSource2.Update()
        GridView2.EditIndex = -1
        Response.Redirect("notific_details.aspx")
    End Sub

    Protected Sub GridView2_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView2.RowCancelingEdit
        GridView2.EditIndex = -1
        Response.Redirect("notific_details.aspx")
    End Sub
    Protected Sub GridView2_PreRender(sender As Object, e As EventArgs) Handles GridView2.PreRender
        Label3.Text = "Displaying page " & (GridView2.PageIndex + 1).ToString() & " of " & (GridView2.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String = "SELECT [notifi_id], [notifi_category_id], [notifi_date], [notifi_desc], [notifi_status] FROM [notification]"
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    sql += " WHERE notifi_desc LIKE @notifi_desc + '%'"
                    cmd.Parameters.AddWithValue("@notifi_desc", TextBox3.Text.Trim())
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