Private Sub VerificarCategoria()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText3
    Dim Verificar As Boolean
    resumo = pjTaskTextResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            Verificar = True
        End If
    Next Tarefa
    
    If Verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (03 CATEGORIA) VAZIOS.", vbExclamation
    End If
    
End Sub