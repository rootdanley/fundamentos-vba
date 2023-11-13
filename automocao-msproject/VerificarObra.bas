Private Sub VerificarObra()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText10
    resumo = pjTaskText12
    Dim Verificar As Boolean
    resumo = pjTaskResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            Verificar = True
        End If
    Next Tarefa
         
    If Verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (14 NOME DO CONTRATO OU OBRA) VAZIOS.", vbExclamation
    End If
        
End Sub