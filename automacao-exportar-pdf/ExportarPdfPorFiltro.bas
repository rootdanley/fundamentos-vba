Sub ExportarPdfPorFiltro()
    Dim ws As Worksheet
    Dim lista As Range
    Dim criterios As Range
    Dim criterio As Range
    
    ' Defina a planilha que contém a lista de critérios
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    ' Defina a faixa de células que contém a lista de critérios
    Set lista = ws.Range("A1:A7") ' Por exemplo, assumindo que a lista está nas células A1:A2
    
    ' Defina a faixa de células que contém os critérios de filtro
    Set criterios = ws.Range("A1:A7") ' Por exemplo, assumindo que os critérios estão nas células B1:B2
    
    ' Loop através de cada critério
    For Each criterio In criterios
        ' Atribui o valor do critério atual à variável "criterio"
        criterioValor = criterio.Value
        
        ' Atualiza o valor na célula correspondente na lista de critérios
        lista.Cells(criterio.Row, 1).Value = criterioValor
         ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=23, Criteria1:= _
        "Planejada"
        
        ' Aplica o filtro com base no critério atual
        ActiveSheet.ListObjects("Data9").Range.AutoFilter Field:=4, Criteria1:=criterioValor
        
        ' Gera o arquivo PDF com base no critério atual
        ActiveSheet.ExportAsFixedFormat Type:=xlTypePDF, Filename:= _
            "C:\Users\rootd\OneDrive\Imagens\Teste" & criterio.Row & "_pdf.pdf", Quality:=xlQualityStandard, _
            IncludeDocProperties:=True, IgnorePrintAreas:=False, OpenAfterPublish:=False
        
        ' Limpa o filtro antes de prosseguir para o próximo critério
        ActiveSheet.ListObjects("Data9").AutoFilter.ShowAllData
    Next criterio
    
    ' Restaura os valores originais na lista de critérios
    ' lista.Value = ""
End Sub




