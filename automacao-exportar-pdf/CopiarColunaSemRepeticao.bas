Attribute VB_Name = "CopiarColunaSemRepeticao"
Sub CopiarColunaSemRepeticao()
    Dim planilhaOrigem As Worksheet
    Dim planilhaDestino As Worksheet
    Dim colunaOrigem As Range
    Dim celula As Range
    Dim elemento As Variant
    Dim listaElementos As Object ' Usando um Dictionary para armazenar os elementos �nicos
    
    ' Defina a planilha de origem
    Set planilhaOrigem = ThisWorkbook.Worksheets("1.1")
    
    ' Crie uma nova planilha de destino
    Set planilhaDestino = ThisWorkbook.Worksheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
    planilhaDestino.Name = "PlanilhaDestino"
    
    ' Defina a coluna de origem a partir da c�lula F6 at� o �ltimo elemento
    Set colunaOrigem = planilhaOrigem.Range("F6", planilhaOrigem.Cells(Rows.Count, "F").End(xlUp))
    
    ' Crie um Dictionary para armazenar os elementos �nicos
    Set listaElementos = CreateObject("Scripting.Dictionary")
    
    ' Percorra cada c�lula na coluna de origem
    For Each celula In colunaOrigem
        elemento = celula.Value
        
        ' Verifique se o elemento n�o � 'Respons�vel'
        If elemento <> "Respons�vel" Then
            ' Verifique se o elemento j� existe no Dictionary
            If Not listaElementos.Exists(elemento) Then
                listaElementos.Add elemento, elemento
            End If
        End If
    Next celula
    
    ' Copie os elementos �nicos para o novo sheet
    planilhaDestino.Cells.Clear ' Limpe o sheet de destino antes de copiar
    planilhaDestino.Range("A1").Resize(listaElementos.Count).Value = Application.Transpose(listaElementos.Keys)
End Sub


