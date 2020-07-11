
Imports System.Data.SqlClient
Imports System.IO
Partial Class Empregister
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
            Dim con As New SqlConnection
            Dim cmd As New SqlCommand
        Dim m, p As Integer
        Dim myconn1, gender, language, lan1, lan2, lan3, n, pad, Num As String
            gender = RadioBut.SelectedItem.Text
            myconn1 = ConfigurationManager.ConnectionStrings("dbcs").ConnectionString
            con = New SqlConnection(myconn1)
            If Not (FileUpload1.HasFile) Then
                FileUpload.Text = "Plz insert image"
            Else
            If ename.Text = "" Then
                ename_msg.Text = "plz enter your name"
            End If

            If mobile_no.Text = "" Then
                mobile_msg.Text = "plz enter your mobile no."
            End If

            If email.Text = "" Then
                email_msg.Text = "plz enter your email"
            End If

            If faddress.Text = "" Then
                faddress_msg.Text = "plz enter your address"
            End If


            If dob.Text = "" Then
                dob_msg.Text = "plz enter your DOB"
            End If

            If gender = "" Then
                gender_msg.Text = "plz select your gender"
            End If
            If password.Text = "" Then
                password_msg.Text = "plz enter your password"
            End If
            If cpassword.Text = "" Then
                cpassword_msg.Text = "plz enter your confirm password "
            End If
            If language1.Checked = False And language2.Checked = False And language3.Checked = False Then
                language_msg.Text = "plz select your language"
            End If
            If language1.Checked = True Then
                lan1 = language1.Text.ToUpper & "/"
            Else
                lan1 = ""
            End If
            If language2.Checked = True Then
                lan2 = language2.Text.ToUpper & "/"
            Else
                lan2 = ""
            End If
            If language3.Checked = True Then
                lan3 = language3.Text.ToUpper & "/"
            Else
                lan3 = ""
            End If

            con.Open()
            cmd = New SqlCommand("select max(eid) from employee", con)
            cmd.ExecuteNonQuery()
            If IsDBNull(cmd.ExecuteScalar) Then
                Num = 1
            Else
                Num = cmd.ExecuteScalar + 1
            End If
            m = Len(CStr(Num))
            P = 4 - m
            pad = StrDup(P, "0")
            Num = pad & Num

            cmd = New SqlCommand("select * from employee where email='" & email.Text & "'", con)
            cmd.ExecuteNonQuery()
            If (cmd.ExecuteScalar <> 0) Then
                reg_msg.Text = "user already exist"
            Else
                Dim length As Integer
                length = FileUpload1.PostedFile.ContentLength
                Dim pic(length) As Byte
                FileUpload1.PostedFile.InputStream.Read(pic, 0, length)
                cmd = New SqlCommand("insert into employee " + "(ename,mobile_no,email,dob,faddress,gender,district,sdivition,password,pic,language,eid,status) values(@ename,@mobile_no,@email,@dob,@faddress,@gender,@district,@sdivition,@password,@pic,@language,@eid,@status)", con)
                cmd.Parameters.AddWithValue("@eid", Num)
                cmd.Parameters.AddWithValue("@status", "PENDING")
                cmd.Parameters.AddWithValue("@ename", (ename.Text).ToUpper)
                cmd.Parameters.AddWithValue("@mobile_no", mobile_no.Text)
                cmd.Parameters.AddWithValue("@email", (email.Text))
                cmd.Parameters.AddWithValue("@dob", dob.Text)
                cmd.Parameters.AddWithValue("@faddress", (faddress.Text).ToUpper)
                cmd.Parameters.AddWithValue("@gender", gender.ToUpper)
                cmd.Parameters.AddWithValue("@language", (lan1 & lan2 & lan3).ToUpper)
                cmd.Parameters.AddWithValue("@district", (district.Text).ToUpper)
                cmd.Parameters.AddWithValue("@sdivition", (sdivition.Text).ToUpper)
                cmd.Parameters.AddWithValue("@password", password.Text)
                cmd.Parameters.AddWithValue("@pic", pic)
                If Not (ename.Text = "" Or mobile_no.Text = "" Or email.Text = "" Or dob.Text = "" Or faddress.Text = "" Or gender = "" Or district.Text = "" Or sdivition.Text = "") Then
                    cmd.ExecuteNonQuery()
                    con.Close()
                    Response.Redirect("Empregister.aspx")
                End If
            End If
            con.Close()
        End If
    End Sub

    
    'Protected Sub dob1_SelectionChanged(sender As Object, e As EventArgs) Handles dob1.SelectionChanged
    '   dob.Text = dob1.SelectedDate.ToString("dd-MM-yyyy")
    'End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    End Sub


    Protected Sub RadioBut_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioBut.SelectedIndexChanged

    End Sub

    Protected Sub language1_CheckedChanged(sender As Object, e As EventArgs) Handles language1.CheckedChanged

    End Sub
End Class
