Attribute VB_Name = "Module1"
Sub CopiarColunaSemRepeticao()

    Dim planilhaOrigem As Worksheet
    Dim planilhaDestino As Worksheet
    Dim colunaOrigem As Range
    Dim celula As Range
    Dim elemento As Variant
    Dim listaElementos As Object ' Usando um Dictionary para armazenar os elementos ?nicos
    
   
    ' Defina a planilha de origem
    Set planilhaOrigem = ThisWorkbook.Worksheets("1")
    
    planilhaOrigem.Activate
    
    ' Crie uma nova planilha de destino
    Set planilhaDestino = ThisWorkbook.Worksheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
    planilhaDestino.Name = "Sheet1"
    
    ' Defina a coluna de origem a partir da c?lula F6 at? o ?ltimo elemento
    Set colunaOrigem = planilhaOrigem.Range("F6", planilhaOrigem.Cells(Rows.Count, "F").End(xlUp))
    
    ' Crie um Dictionary para armazenar os elementos ?nicos
    Set listaElementos = CreateObject("Scripting.Dictionary")
    

    ' Percorra cada c?lula na coluna de origem
    For Each celula In colunaOrigem
        elemento = celula.Value
        
        ' Verifique se o elemento n?o ? 'Respons?vel'
        If elemento <> "Responsável" Then
            ' Verifique se o elemento j? existe no Dictionary
            If Not listaElementos.Exists(elemento) Then
                listaElementos.Add elemento, elemento
            End If
        End If
    Next celula
    
    ' Copie os elementos ?nicos para o novo sheet
    planilhaDestino.Cells.Clear ' Limpe o sheet de destino antes de copiar
    planilhaDestino.Range("A1").Resize(listaElementos.Count).Value = Application.Transpose(listaElementos.Keys)
    
    ' Muda a planilha para visualiza??o
    planilhaOrigem.Activate
    
    Dim ws As Worksheet
    Dim lista As Range
    Dim criterios As Range
    Dim criterio As Range
    
    ' Defina a planilha que cont?m a lista de crit?rios
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
  ' Defina a faixa de c?lulas que cont?m a lista de crit?rios
    Dim lastRow As Long
    Dim lastCol As Long

' Determine a ?ltima linha com dados na coluna A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row

' Determine a ?ltima coluna com dados na linha 1
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column

' Defina a faixa de c?lulas que cont?m a lista de crit?rios
    Set lista = ws.Range("A1:A" & lastRow)

    ' Defina a faixa de c?lulas que cont?m os crit?rios de filtro
    Set criterios = ws.Range("A1:A" & lastRow)

    
    ' Loop atrav?s de cada crit?rio
    For Each criterio In criterios
        ' Atribui o valor do crit?rio atual ? vari?vel "criterio"
        criterioValor = criterio.Value
        
        ' Atualiza o valor na c?lula correspondente na lista de crit?rios
        lista.Cells(criterio.Row, 1).Value = criterioValor
        
         ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=23, Criteria1:= _
        "Planejada"
        
        ' Aplica o filtro com base no crit?rio atual
        ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=4, Criteria1:=criterioValor
        
        ' Gera o arquivo PDF com base no crit?rio atual
        ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
            "C:\Users\rootd\OneDrive\Imagens\Teste" & criterio.Row & "_pdf.pdf", Quality:=xlQualityStandard, _
            IncludeDocProperties:=True, IgnorePrintAreas:=False, OpenAfterPublish:=False
        
        ' Limpa o filtro antes de prosseguir para o pr?ximo crit?rio
        ActiveSheet.ListObjects("Data9").AutoFilter.ShowAllData
    Next criterio
    
    ' Restaura os valores originais na lista de crit?rios
    ' lista.Value = ""
    Application.DisplayAlerts = False
    
    Sheets("Sheet1").Select
    ActiveWindow.SelectedSheets.Delete
    
    Application.DisplayAlerts = True
    
    ' NOVOS ARQUIVOS PARA EXPORTACAO
    
    Dim Data As String
    Dim wsheet As Worksheet
    Dim planilhasArquivo1 As String
    Dim planilhasArquivo2 As String
    Dim planilhasArquivo3 As String
    Dim nomeArquivo1 As String
    Dim nomeArquivo2 As String
    Dim nomeArquivo3 As String
    
    Data = Format(Now(), "MM-DD-YYYY")
    
    ' Definir quais planilhas devem ser inclu?das em cada arquivo PDF
    planilhasArquivo1 = "2"
    planilhasArquivo2 = "3,4,5,6,7,8"
    planilhasArquivo3 = "1,0"
    
    ' Nomear os arquivos de acordo com a data atual
    nomeArquivo1 = "Kanban " & Data & ".pdf"
    nomeArquivo2 = "Dashboards " & Data & ".pdf"
    nomeArquivo3 = "Tasks " & Data & ".pdf"
    
    ' Exportar as planilhas do arquivo 1 para um ?nico PDF
    Dim planilhas1 As Variant
    planilhas1 = Split(planilhasArquivo1, ",")
    ThisWorkbook.Sheets(planilhas1).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo1
    
    ' Exportar as planilhas do arquivo 2 para um ?nico PDF
    Dim planilhas2 As Variant
    planilhas2 = Split(planilhasArquivo2, ",")
    ThisWorkbook.Sheets(planilhas2).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo2

    planilhaOrigem.Activate
    ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=23, Criteria1:= _
        "Planejada"
    Dim planilhas3 As Variant
    planilhas3 = Split(planilhasArquivo3, ",")
    ThisWorkbook.Sheets(planilhas3).Select
    ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:=nomeArquivo3
    MsgBox "Exportado com sucesso!"
    
End Sub


Function IsInArray(val As Variant, arr As Variant) As Boolean
    Dim element As Variant
    For Each element In arr
        If element = val Then
            IsInArray = True
            Exit Function
        End If
    Next element
    IsInArray = False
End Function








