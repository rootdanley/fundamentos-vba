Private Sub VerificarDataReprog()
  Dim Tarefa As Task
  Dim Coluna As PjField
  Coluna = pjTaskDate4
  Dim Verificar As Boolean

  For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(Coluna) = "ND" Then
      Verificar = True
    End If
  Next Tarefa

  If Verificar = True Then
    MsgBox "EXISTEM CAMPOS DE [10 DATA REPROG] VAZIOS", vbExclamation
  End If
End Sub