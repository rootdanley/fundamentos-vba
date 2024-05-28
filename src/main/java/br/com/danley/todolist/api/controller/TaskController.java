package br.com.danley.todolist.api.controller;

import br.com.danley.todolist.api.assembler.TaskAssembler;
import br.com.danley.todolist.api.dto.request.TaskRequest;
import br.com.danley.todolist.api.dto.response.TaskResponse;
import br.com.danley.todolist.domain.model.Task;
import br.com.danley.todolist.domain.service.TaskService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/api/tasks")
@Tag(name = "Task Management", description = "API para gerenciamento de tarefas")
public class TaskController {

   private final TaskService taskService;
   private final TaskAssembler taskAssembler;


   @Operation(summary = "Criar Tarefa", description = "Cria uma nova tarefa no sistema e retorna a tarefa criada com status 201.")
   @ApiResponses(value = {
       @ApiResponse(responseCode = "201", description = "Tarefa salva com sucesso", content = @Content(schema = @Schema(implementation = TaskResponse.class))),
       @ApiResponse(responseCode = "417", description = "Erro de validação nos dados fornecidos"),
       @ApiResponse(responseCode = "500", description = "Erro interno do servidor")
   })
   @PostMapping
   public ResponseEntity<TaskResponse> createTask(
       @Valid @RequestBody TaskRequest taskRequest
   ) {
      Task task = taskAssembler.toEntity(taskRequest);
      Task savedTask = taskService.create(task);
      TaskResponse taskResponse = taskAssembler.toResponse(savedTask);

      return new ResponseEntity<>(taskResponse, HttpStatus.CREATED);
   }

   @Operation(summary = "Listar tarefas", description = "Obtém uma lista de todas as tarefas disponíveis.")
   @ApiResponse(responseCode = "200", description = "Operação bem sucedida", content = @Content(schema = @Schema(implementation = TaskResponse.class)))
   @GetMapping
   public ResponseEntity<List<TaskResponse>> getAllTasks() {
      List<Task> tasks = taskService.findAll();
      List<TaskResponse> taskResponses = taskAssembler.toCollectionsResponse(tasks);

      return ResponseEntity.ok(taskResponses);
   }


   @Operation(summary = "Deletar tarefa", description = "Remove uma tarefa específica pelo ID.")
   @ApiResponses({
       @ApiResponse(responseCode = "204", description = "Tarefa deletada com sucesso"),
       @ApiResponse(responseCode = "404", description = "Tarefa não encontrada")
   })
   @DeleteMapping("/{id}")
   public ResponseEntity<Void> deleteTask(@PathVariable Long id) {
      taskService.delete(id);
      return ResponseEntity.noContent().build();
   }

   @Operation(summary = "Atualizar tarefa", description = "Atualiza os dados de uma tarefa existente pelo ID e retorna a tarefa atualizada.")
   @ApiResponses({
       @ApiResponse(responseCode = "200", description = "Tarefa editada com sucesso", content = @Content(schema = @Schema(implementation = TaskResponse.class))),
       @ApiResponse(responseCode = "404", description = "Tarefa não encontrada"),
       @ApiResponse(responseCode = "417", description = "Erro de validação nos dados fornecidos"),
       @ApiResponse(responseCode = "500", description = "Erro interno do servidor")
   })
   @PutMapping("/{id}")
   public ResponseEntity<TaskResponse> updateTask(
       @PathVariable Long id,
       @Valid @RequestBody TaskRequest taskRequest
   ) {
      if(!taskService.existsById(id))
         return ResponseEntity.notFound().build();

      Task task = taskAssembler.toEntity(taskRequest);
      task.setId(id);
      Task updateTask = taskService.update(task);
      TaskResponse taskResponse = taskAssembler.toResponse(updateTask);

      return ResponseEntity.ok(taskResponse);
   }
}
