Private Sub VerificarDataMedicao()
  Dim Tarefa As Task
  Dim Coluna As PjField
  Coluna = pjTaskDate3
  Dim Verificar As Boolean

  For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(Coluna) = "ND" Then
      Verificar = True
    End If
  Next Tarefa

  If Verificar = True Then
    MsgBox "EXISTEM CAMPOS DE [O9 DATA DE MEDICAO] VAZIOS", vbExclamation
  End If

End Sub