Private Sub Ajustar_Click()
Unload Compass
End Sub

Private Sub Avancar_Click()
     
    Call VerificarDate5
    Call VerificarLinhaDeBase
    Call VerificarGestor
    Call VerificarObra
    Call VerificarCliente
    Call VerificarRespInterferencia
    Call VerificarInterferencia
    Call VerificarCategoria
    Call VerificarResponsavel
    Call VerificarDisciplina
    Call VerificarLocal
    Call VerificarDataMedicao
    Call VerificarDataReprog
    
End Sub

Private Sub VerificarDate5()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskDate5
    resumo = pjTaskResumo
    Dim verificar As Boolean
    
   For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "ND" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "ESTABELEÇA UMA (DATA DE STATUS) ANTES DE CONTINUAR", vbExclamation
    End If
    
End Sub

Private Sub VerificarLinhaDeBase()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskBaselineStart
    resumo = pjTaskResumo
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "ND" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
         MsgBox "HÁ TAREFAS SEM (LINHA DE BASE) " & "DEFINA UMA (LINHA DE BASE)", vbExclamation
    End If
End Sub

Private Sub VerificarGestor()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText13
    resumo = pjTaskResumo
    Dim verificar As Boolean
    
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
        
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (17 GESTOR) VAZIOS.", vbExclamation
    End If
End Sub

Private Sub VerificarObra()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText10
    resumo = pjTaskText12
    Dim verificar As Boolean
    resumo = pjTaskResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
         
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (14 NOME DO CONTRATO OU OBRA) VAZIOS.", vbExclamation
    End If
        
End Sub


Private Sub VerificarCliente()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText9
    Dim verificar As Boolean
    resumo = pjTaskResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
         
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (13 CLIENTE) VAZIOS.", vbExclamation
    End If
End Sub

Private Sub VerificarRespInterferencia()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText7
    Dim verificar As Boolean
    resumo = pjTaskResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (11 RESPONSAVEL PELA INTERFERENCIA) VAZIOS.", vbExclamation
    End If
        
End Sub

Private Sub VerificarInterferencia()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText6
    Dim verificar As Boolean
    resumo = pjTaskResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (06 INTERFERENCIA) VAZIOS.", vbExclamation
    End If
    
End Sub

Private Sub VerificarCategoria()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim resumo As PjField
    Coluna = pjTaskText3
    Dim verificar As Boolean
    resumo = pjTaskTextResumo
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (03 CATEGORIA) VAZIOS.", vbExclamation
    End If
    
End Sub

Private Sub VerificarResponsavel()
  Dim Tarefa As Task
  Dim Coluna As PjField
  Dim resumo As PjField
  Coluna = pjTaskText4
  Dim verificar As Boolean
  resumo = pjTaskResumo

  For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (04 RESPONSAVEL) VAZIOS.", vbExclamation
    End If
    
End Sub


Private Sub VerificarLocal()
  Dim Tarefa As Task
  Dim Coluna As PjField
  Dim resumo As PjField
  Coluna = pjTaskText2
  Dim verificar As Boolean
  resumo = pjTaskResumo

  For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (02 LOCAL) VAZIOS.", vbExclamation
    End If
    
End Sub


Private Sub VerificarDisciplina()
Dim Tarefa As Task
  Dim Coluna As PjField
  Dim resumo As PjField
  Coluna = pjTaskText5
  Dim verificar As Boolean
  resumo = pjTaskResumo

  For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(resumo) <> "Sim" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE (05 DISCIPLINA) VAZIOS.", vbExclamation
    End If

End Sub

Private Sub VerificarDataMedicao()
  Dim Tarefa As Task 
  Dim Coluna As PjField 
  Coluna = pjTaskDate3
  Dim verificar As Boolean

  For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(Coluna) = "ND" Then 
      verificar = True
    End if
  Next Tarefa

  If verificar = True Then
    MsgBox "EXISTEM CAMPOS DE [O9 DATA DE MEDICAO] VAZIOS", vbExclamation
  End If

End Sub

Private Sub VerificarDataReprog()
  Dim Tarefa As Task 
  Dim Coluna As PjField 
  Coluna = pjTaskDate4
  Dim verificar As Boolean

  For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(Coluna) = "ND" Then 
      verificar = True
    End if
  Next Tarefa

  If verificar = True then
    MsgBox "EXISTEM CAMPOS DE [10 DATA REPROG] VAZIOS", vbExclamation
  End If
End Sub

