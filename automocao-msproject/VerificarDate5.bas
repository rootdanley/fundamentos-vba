Private Sub VerificarDate5()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskDate5
    resumo = pjTaskResumo
    Dim Verificar As Boolean
    
   For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "ND" And Tarefa.GetField(resumo) <> "Sim" Then
            Verificar = True
        End If
    Next Tarefa
    
    If Verificar = True Then
        MsgBox "ESTABELEÇA UMA (DATA DE STATUS) ANTES DE CONTINUAR", vbExclamation
    End If
    
End Sub