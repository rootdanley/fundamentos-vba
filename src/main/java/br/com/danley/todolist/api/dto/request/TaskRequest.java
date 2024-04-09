package br.com.danley.todolist.api.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaskRequest {

   @NotNull
   @Size(max = 30)
   private String nome;
   @NotBlank
   @Size(max = 255)
   private String descricao;
   private boolean realizado;
   private Integer prioridade;
}
