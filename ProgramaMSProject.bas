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
    
End Sub

Private Sub VerificarDate5()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskDate5
    Sucessora = pjTaskText12
    Dim verificar As Boolean
    
   For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "NA" And Tarefa.GetField(Sucessora) <> "" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "ESTABELEÇA UMA DATA DE STATUS ANTES DE CONTINUAR", vbExclamation
    End If
    
End Sub

Private Sub VerificarLinhaDeBase()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskBaselineStart
    Sucessora = pjTaskText12
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "NA" And Tarefa.GetField(Sucessora) <> "" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
         MsgBox "HÁ TAREFAS SEM LINHA DE BASE." & "DEFINA UMA LINHA DE BASE.", vbExclamation
    End If
End Sub

Private Sub VerificarGestor()

    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskText13
    Sucessora = pjTaskText12
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" Then
            verificar = True
            
            
        End If
    Next Tarefa
        
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE GESTORES VAZIOS.", vbExclamation
    End If
End Sub

Private Sub VerificarObra()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskText10
    Sucessora = pjTaskText12
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" Then
            verificar = True
        End If
    Next Tarefa
         
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE NOMES DO CONTRATO VAZIOS.", vbExclamation
    End If
        
End Sub


Private Sub VerificarCliente()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskText9
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" Then
            verificar = True
        End If
    Next Tarefa
         
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE CLIENTE VAZIOS.", vbExclamation
    End If
End Sub

Private Sub VerificarRespInterferencia()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskText7
    Dim verificar As Boolean
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE RESPONSAVEL INTERFERENCIA VAZIOS.", vbExclamation
    End If
        
End Sub

Private Sub VerificarInterferencia()
    Dim Tarefa As Task
    Dim Coluna As PjField
    Dim Sucessora As PjField
    Coluna = pjTaskText6
    Dim verificar As Boolean
    Sucessora = pjTaskText12
    
    For Each Tarefa In ActiveProject.Tasks
        If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(Sucessora) <> "" Then
            verificar = True
        End If
    Next Tarefa
    
    If verificar = True Then
        MsgBox "EXISTEM CAMPOS DE NOMES DE INTERFERENCIA VAZIOS.", vbExclamation
    End If
    
End Sub


Private Sub VerificarCategoria()
  Dim Tarefa As Task
  Dim Coluna As PjField
  Dim Sucessora As PjField
  Coluna = pjTaskText3 
  Dim verificar As Boolean
  Sucessora = pjTaskText12

  For Each Tarefa In ActiveProject.Tasks
    If Tarefa.GetField(Coluna) = "" And Tarefa.GetField(Sucessora) <> "" then
      Verificar = True
    End If
  Next Tarefa

  If verificar = True then
    MsgBox "EXISTEM CAMPOS DE CATEGORIA VAZIOS.", vbExclamation
  End If

End Sub

