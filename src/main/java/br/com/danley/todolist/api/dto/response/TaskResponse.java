package br.com.danley.todolist.api.dto.response;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaskResponse {
   private Long id;
   private String nome;
   private String descricao;
   private boolean realizado;
   private Integer prioridade;
}
