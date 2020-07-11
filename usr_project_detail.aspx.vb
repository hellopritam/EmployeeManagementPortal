Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Partial Class usr_project_detail
    Inherits System.Web.UI.Page
    Dim path As String = ""
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim value As String
        value = Request.QueryString("id")
        Dim sess_id As String = Session("e_id").ToString()
        Dim con As SqlConnection
        Dim mycon As String
        Dim da As SqlDataAdapter
        Dim dset As New DataSet
        mycon = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(mycon)
        con.Open()
        da = New SqlDataAdapter("SELECT task.task_code, project.proj_desc, module.module_desc,task.task_desc,task.to_date, task.from_date, task.working_status,task.task_desc_path FROM task INNER JOIN project ON task.proj_code = project.proj_code INNER JOIN module ON module.module_code = task.module_code INNER JOIN employee ON employee.eid=task.emp_id where task.task_code='" & value & "' and email='" & sess_id & "'", con)
        da.Fill(dset)

        If dset.Tables(0).Rows.Count > 0 Then
            task_code.Text = dset.Tables(0).Rows(0)("task_code")
            proj_name.Text = dset.Tables(0).Rows(0)("proj_desc")
            module_name.Text = dset.Tables(0).Rows(0)("module_desc")
            task_desc.Text = dset.Tables(0).Rows(0)("task_desc")
            From_date.Text = dset.Tables(0).Rows(0)("from_date")
            If Status.Text = "" Then
                Status.Text = dset.Tables(0).Rows(0)("working_status")
            End If
            If to_date.Text = "" Then
                If IsDBNull(dset.Tables(0).Rows(0)("to_date")) Then
                    to_date.Text = ""
                Else
                    to_date.Text = dset.Tables(0).Rows(0)("to_date")
                End If
            End If
            path = dset.Tables(0).Rows(0)("task_desc_path")
            End If
    End Sub

    Protected Sub pdf_Click(sender As Object, e As ImageClickEventArgs) Handles pdf.Click

        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment;filename=" & path)
        Response.TransmitFile(Server.MapPath("~/" & "/" & path))
        Response.End()
        
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cmd As New SqlCommand
        Dim con As New SqlConnection
        Dim myconn As String
        myconn = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
        con = New SqlConnection(myconn)
        con.Open()
        cmd = New SqlCommand("update task set working_status='" & ((Status.Text).ToString()).ToUpper() & "',to_date='" & to_date.Text.ToString() & "' where task_code='" & (task_code.Text).ToString() & "'", con)
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("usrview.aspx")
    End Sub
End Class




