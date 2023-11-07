' access funciona com Function 
Public Function importarDados()
  Dim report_path As String, file_name As String
  report_path = "C:\Users\afromito\Desktop\teste\"

  file_name = Dir(report_path & "*.xlsx", vbDirectory)
  
  ' busca todos os arquivos xlsx
  Do While file_name <> vbNullString
    DoCmd.TransferSpreadsheet acImportDelim, , Trim(Replace(file_name, ".xlsx", "")), report_path & file_name, True
    file_name = Dir
  Loop

  MsgBox "sucesso", vbInformation
End Function


' 01
Public Function ImportarDadosDeMDB()
    Dim reportPath As String, fileName As String
    reportPath = "C:\Users\afromito\Desktop\acess-db\"

    fileName = Dir(reportPath & "*.mdb")

    ' Loop para importar todos os arquivos .mdb
    Do While fileName <> ""
        DoCmd.TransferDatabase acImport, "Microsoft Access", reportPath & fileName, acTable, "", Replace(fileName, ".mdb", "")
        fileName = Dir
    Loop

    MsgBox "Dados importados com sucesso!", vbInformation
End Function

' 02
Public Function ImportarDadosDeMDB()
    Dim reportPath As String, fileName As String
    reportPath = "C:\Users\afromito\Desktop\acess-db\"

    fileName = Dir(reportPath & "*.mdb")

    ' Loop para importar todos os arquivos .mdb
    Do While fileName <> ""
        DoCmd.TransferDatabase acImport, "Microsoft Access", reportPath & fileName, "", Replace(fileName, ".mdb", "")
        fileName = Dir
    Loop

    MsgBox "Dados importados com sucesso!", vbInformation
End Function


'03
Public Function ImportarTodasAsTabelasDoMDB()
    Dim reportPath As String, fileName As String
    reportPath = "C:\Users\afromito\Desktop\acess-db\"

    fileName = Dir(reportPath & "*.mdb")

    Do While fileName <> ""
        DoCmd.TransferDatabase acImport, "Microsoft Access", reportPath & fileName, acTable, , , True
        fileName = Dir
    Loop

    MsgBox "Todas as tabelas foram importadas com sucesso!", vbInformation
End Function
