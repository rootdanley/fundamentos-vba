' access funciona com Function 
Public Function importarDados()
  Dim report_path As String, file_name As String
  report_path = "C:\Users\afromito\Desktop\teste\"

  file_name = Dir(report_path & "*.csv", vbDirectory)
  
  Do While file_name <> vbNullString
    DoCmd.TransferText acImportDelim, , Trim(Replace(file_name, ".csv", "")), report_path & file_name, True
    file_name = Dir
  Loop

  MsgBox "sucesso", vbInformation
End Function
