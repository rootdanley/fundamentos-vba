Private Sub VerificarDatas()
  Dim Tarefa As Task
  Dim ColunaDI As PjField
  Dim ColunaDF As PjField
  Dim ColunaFisicoConcluida As PjField
  ColunaDI = pjTaskDate1
  ColunaDF = pjTaskDate2
  ColunaFisicoConcluida = pjTaskNumber2


  Dim resumo As PjField
  resumo = pjTaskSummary

 For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(resumo) <> "Sim" And (Tarefa.GetField(ColunaFisicoConcluida) >= 1 And Tarefa.GetField(ColunaFisicoConcluida) <= 99) Then
      If Tarefa.GetField(ColunaDI) = "ND" And Tarefa.GetField(ColunaDF) = "NA" Then
        MsgBox "DATAS ESTAO VAZIAS!", vbExclamation
      ElseIf Tarefa.GetField(ColunaDI) = "ND" Then
        MsgBox "DATA I ESTA VAZIA!", vbExclamation
      ElseIf Tarefa.GetField(ColunaDF) <> "NA" Then
        MsgBox "DATA F NÃO PODE SER PREENCHIDA POIS NÃO ESTA FINALIZADA!", vbExclamation
      End If
    ElseIf Tarefa.GetField(resumo) <> "Sim" And Tarefa.GetField(ColunaFisicoConcluida) = 100 Then
     If Tarefa.GetField(ColunaDI) = "ND" And Tarefa.GetField(ColunaDF) = "NA" Then
        MsgBox "DATAS ESTÃO VAZIAS!", vbExclamation
     ElseIf Tarefa.GetField(ColunaDI) = "ND" Then
        MsgBox "DATA I ESTA VAZIA E PORCENTAGEM 100!", vbExclamation
     ElseIf Tarefa.GetField(ColunaDF) = "ND" Then
        MsgBox "DATA F ESTA VAZIA E PORCENTAGEM 100!", vbExclamation
     End If
    ElseIf Tarefa.GetField(resumo) <> "Sim" And Tarefa.GetField(ColunaFisicoConcluida) = 0 Then
        If Tarefa.GetField(ColunaDI) <> "ND" And Tarefa.GetField(ColunaDF) <> "NA" Then
          MsgBox "DATAS ESTÃO PREENCHIDAS E PORCENTAGEM 0!", vbExclamation
        ElseIf Tarefa.GetField(ColunaDF) <> "ND" Then
          MsgBox "PORCENTAGEM ESTA EM 0 E DATA F PREENCHIDA", vbExclamation
        ElseIf Tarefa.GetField(ColunaDI) <> "ND" Then
          MsgBox "PORCENTAGEM ESTA EM 0 E DATA I PREENCHIDA", vbExclamation
        End If
    End If
  Next Tarefa
  
End Sub