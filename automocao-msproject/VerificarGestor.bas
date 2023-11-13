Private Sub VerificarGestor()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText13
    resumo = pjTaskResumo
    Dim Verificar As Boolean
    
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            Verificar = True
        End If
    Next Tarefa
        
    If Verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (17 GESTOR) VAZIOS.", vbExclamation
    End If
End Sub