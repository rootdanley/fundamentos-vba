Private Sub VerificarLinhaDeBase()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskBaselineStart
    resumo = pjTaskResumo
    Dim Verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "ND" And Tarefa.GetField(resumo) <> "Sim" Then
            Verificar = True
        End If
    Next Tarefa
    
    If Verificar = True Then
         MsgBox "HÁ TAREFAS SEM (LINHA DE BASE) " & "DEFINA UMA (LINHA DE BASE)", vbExclamation
    End If
End Sub