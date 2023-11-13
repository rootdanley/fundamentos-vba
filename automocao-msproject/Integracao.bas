Sub integracao()
   Dim caminho As String
    caminho = Application.GetSaveAsFilename(FileFilter:="Arquivos do Microsoft Project (*.mpp), *.mpp", Title:="Salvar Projeto Como")
   
    On Error Resume Next
    FileSaveAs Name:=caminho, FormatID:="MSProject.ACE", map:="dab"
    
    If Err.Number <> 0 Then
        MsgBox "Escolha um nome de arquivo diferente ou sobrescreva o existente.", vbExclamation
        Err.Clear
    End If
    On Error GoTo 0
    End
    
    MsgBox "Arquivo salvo em: " & caminho, vbInformation
    

    Dim caminhoArquivo As String
    caminhoArquivo = "C:\Dash_VMC\XLS\DB_CRON_PROJ_XX.xlsm"
    Dim nomeMacro As String
    
 
    nomeMacro = "Atualizar"

    Dim excelApp As Object
    Set excelApp = CreateObject("Excel.Application")

    excelApp.Visible = True
    excelApp.Workbooks.Open caminhoArquivo
    excelApp.Run nomeMacro
   

   'fecha arquivo excel
    excelApp.Quit
    Set excelApp = Nothing


End Sub