Sub integracao()
    FileSaveAs Name:="C:\testes\Dash.xlsx", FormatID:="MSProject.ACE", map:="dab"
    
    MsgBox "arquivo salvo", vbInformation
    
    
    Dim caminhoArquivo As String
    caminhoArquivo = "C:\testes\sh.xlsm" 
    Dim nomeMacro As String
    nomeMacro = "teste"


    Dim excelApp As Object
    Set excelApp = CreateObject("Excel.Application")

    excelApp.Visible = True
    excelApp.Workbooks.Open caminhoArquivo
    excelApp.Run nomeMacro
    'excelApp.Quit
    'Set excelApp = Nothing
End Sub

