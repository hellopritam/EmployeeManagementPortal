Imports System.Data.SqlClient
Imports System.Data

Partial Class task_assign
    Inherits System.Web.UI.Page
    'Dim con As New SqlConnection
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("dbcs").ConnectionString)
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet()
    Dim query As String = ""

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim fname, fname1 As String
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim Num, Num1, m, p As Integer
        Dim n, myconn1, Num2, Num3, pad, num4 As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(id) from task", con)
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
        cmd = New SqlCommand("select max(task_code) from task", con)
        cmd.ExecuteNonQuery()
        If IsDBNull(cmd.ExecuteScalar) Then
            Num1 = 1
        Else
            num4 = CStr(cmd.ExecuteScalar)
            num4 = num4.Substring(1, 4)
            Num1 = Int(num4) + 1
        End If
        m = Len(CStr(Num1))
        p = 4 - m
        pad = StrDup(p, "0")
        Num3 = "T" & pad & CStr(Num1)
        If Not (FileUpload1.HasFile) Or emp_desig.SelectedIndex = 0 Or emp_name.SelectedIndex = 0 Or proj_name.SelectedIndex = 0 Or module_name.SelectedIndex = 0 Or eff_date.Text = "" Or task_desc.Text = "" Then
            msg.Text = "provide all field properly"
        Else
            fname = FileUpload1.FileName.ToString()
            'MsgBox(Request.PhysicalApplicationPath + "/notification/" + fname)
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/employee_task/" + fname)
            fname1 = "employee_task\" + fname
            cmd = New SqlCommand("insert into task(id,task_code,desig_id,emp_id,proj_code,module_code,task_desc,from_date,working_status,task_desc_path)values(@id,@task_code,@desig_id,@emp_id,@proj_code,@module_code,@task_desc,@from_date,@working_status,@task_desc_path)", con)
            cmd.Parameters.AddWithValue("@id", Num2)
            cmd.Parameters.AddWithValue("@task_code", Num3)
            cmd.Parameters.AddWithValue("@desig_id", emp_desig.SelectedValue)
            cmd.Parameters.AddWithValue("@emp_id", emp_name.SelectedValue)
            cmd.Parameters.AddWithValue("@proj_code", proj_name.SelectedValue)
            cmd.Parameters.AddWithValue("@notifi_category_id", proj_name.SelectedValue)
            cmd.Parameters.AddWithValue("@module_code", module_name.SelectedValue)
            cmd.Parameters.AddWithValue("@task_desc", task_desc.Text)
            cmd.Parameters.AddWithValue("@from_date", eff_date.Text)
            cmd.Parameters.AddWithValue("@Working_status", "PENDING")
            cmd.Parameters.AddWithValue("@task_desc_path", fname1)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("task_assign.aspx")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim eid As String
        eid = Nothing
        eid = CStr(Session("uid"))
        If eid = Nothing Then
            Response.Redirect("admin_login.aspx")
        End If

        If Not (IsPostBack) Then
            GetDesignation()
            emp_name.Items.Insert(0, "No employee available")
        End If
    End Sub
    Public Function GetDesignation()
        query = "select * from emp_desig"
        da = New SqlDataAdapter(query, con)
        da.Fill(ds)
        If (ds.Tables(0).Rows.Count > 0) Then
            emp_desig.DataSource = ds
            emp_desig.DataTextField = "emp_desig_desc"
            emp_desig.DataValueField = "emp_desig_id"
            emp_desig.DataBind()
            emp_desig.Items.Insert(0, New ListItem("Choose designation", "0"))
            emp_desig.SelectedIndex = 0
        End If
    End Function

    Protected Sub emp_desig_SelectedIndexChanged(sender As Object, e As EventArgs) Handles emp_desig.SelectedIndexChanged
        ds.Clear()
        emp_name.Items.Clear()
        Dim get_designation, designation As String
        designation = emp_desig.SelectedItem.Text
        get_designation = emp_desig.SelectedValue.ToString
        If Not (get_designation = 0) Then
            query = "select eid,ename from employee where designation_id='" & get_designation & "'"
            da = New SqlDataAdapter(query, con)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                emp_name.DataSource = ds
                emp_name.DataTextField = "ename"
                emp_name.DataValueField = "eid"
                emp_name.DataBind()
                emp_name.Items.Insert(0, New ListItem("Choose " & designation, "0"))
                emp_name.SelectedIndex = 0
            Else
                emp_name.Items.Insert(0, "No employee available")
                emp_name.DataBind()
            End If
        End If

    End Sub

    Protected Sub add_module_Click(sender As Object, e As EventArgs) Handles add_module.Click
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim con As New SqlConnection
        Dim cmd As New SqlCommand
        Dim mycon As String = ""
        Dim Num, Num1, m, p As Integer
        Dim n, myconn1, Num2, Num3, pad As String
        myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn1)
        con.Open()
        cmd = New SqlCommand("select max(id) from module", con)
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
        cmd = New SqlCommand("select max(module_code) from module", con)
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

        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString()
        con = New SqlConnection(mycon)
        con.Open()
        If Not TextBox1.Text = "" Then
            cmd = New SqlCommand("insert into module(id,module_code,module_desc)values(@id,@module_code,@module_desc)", con)
            cmd.Parameters.AddWithValue("@id", Num2)
            cmd.Parameters.AddWithValue("@module_code", Num3)
            cmd.Parameters.AddWithValue("@module_desc", TextBox1.Text)
            cmd.ExecuteNonQuery()
        End If
        con.Close()
        SqlDataSource4.DataBind()
        ' GridView1.DataSource = ""
        module_name.DataSourceID = "SqlDataSource4"
        module_name.SelectedIndex = -1
    End Sub

    Protected Sub SqlDataSource3_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource3.Selecting

    End Sub

    Protected Sub cancel_Click(sender As Object, e As EventArgs) Handles cancel.Click
        emp_desig.SelectedIndex = 0
        emp_name.SelectedIndex = ""
        proj_name.SelectedIndex = 0
        module_name.SelectedIndex = 0
        eff_date.Text = ""
        task_desc.Text = ""
    End Sub
End Class
