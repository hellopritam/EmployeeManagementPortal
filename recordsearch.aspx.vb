Imports System.Data
Imports System
Imports System.Text
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data.DataTable

Partial Class recordsearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If
        Me.SearchCustomers()
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim gr As GridViewRow = GridView1.SelectedRow()
        ename.Text = gr.Cells(0).Text.ToString()
        mobile_no.Text = gr.Cells(1).Text.ToString()
        email.Text = gr.Cells(2).Text.ToString()
        faddress.Text = gr.Cells(3).Text.ToString()
        dob.Text = gr.Cells(4).Text.ToString()
        'district.SelectedItem = gr.Cells(5).Text.ToString()
        'sdivition.SelectedItem = gr.Cells(6).Text.ToString()
        sdivition.SelectedValue = gr.Cells(6).Text.ToString()
        district.SelectedValue = gr.Cells(5).Text.ToString()
        language.Text = gr.Cells(7).Text.ToString()
        gender.SelectedValue = gr.Cells(8).Text.ToString().ToLower()
        password.Text = gr.Cells(9).Text.ToString()
        eid.Text = gr.Cells(12).Text.ToString()
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim n, myconn1 As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        If eid.Text = "" Then
            Response.Redirect("recordsearch.aspx")
        Else
            con.Open()
            cmd = New SqlCommand("update employee set ename='" & ename.Text & "',mobile_no='" & mobile_no.Text & "',email='" & email.Text & "',faddress='" & faddress.Text & "',dob='" & dob.Text & "',district='" & district.Text & "',sdivition='" & sdivition.Text & "',language='" & language.Text & "',gender='" & gender.Text & "',password='" & password.Text & "'  where eid='" & eid.Text & "' ", con)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("recordsearch.aspx")
        End If
    End Sub

    Protected Sub gender_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gender.SelectedIndexChanged
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim mycon As String
        Dim Arg_Code As String = ""
        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(mycon)
        If eid.Text = "" Then
            Response.Redirect("recordsearch.aspx")
        Else
            con.Open()
            cmd = New SqlCommand("delete from employee where eid='" & eid.Text & "'", con)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("recordsearch.aspx")
        End If
    End Sub
    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        Label14.Text = "Displaying page " & (GridView1.PageIndex + 1).ToString() & " of " & (GridView1.PageCount).ToString()
    End Sub
    Private Sub SearchCustomers()
        Dim constr As String = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                Dim sql As String
                If DropDownList1.SelectedIndex = 0 And DropDownList2.SelectedIndex = 0 Then
                    sql = "select * from [employee]"
                Else
                    sql = "SELECT * FROM [employee] WHERE district=@district AND sdivition=@sdivition"
                End If
                If Not String.IsNullOrEmpty(TextBox3.Text.Trim()) Then
                    If DropDownList1.SelectedIndex = 0 And DropDownList2.SelectedIndex = 0 Then
                        sql += " where ename LIKE @ename + '%'"
                    Else
                        sql += " AND ename LIKE @ename + '%'"
                    End If
                    cmd.Parameters.AddWithValue("@ename", TextBox3.Text.Trim())
                End If
                cmd.Parameters.AddWithValue("@district", DropDownList1.SelectedValue)
                cmd.Parameters.AddWithValue("@sdivition", DropDownList2.SelectedValue)
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













