package br.com.danley.todolist.api.controller;

import br.com.danley.todolist.api.assembler.TaskAssembler;
import br.com.danley.todolist.api.dto.request.TaskRequest;
import br.com.danley.todolist.api.dto.response.TaskResponse;
import br.com.danley.todolist.domain.model.Task;
import br.com.danley.todolist.domain.service.TaskService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/api/tasks")
public class TaskController {

   private final TaskService taskService;
   private final TaskAssembler taskAssembler;

   @PostMapping
   public ResponseEntity<TaskResponse> createTask(
       @Valid @RequestBody TaskRequest taskRequest
   ) {
      Task task = taskAssembler.toEntity(taskRequest);
      Task savedTask = taskService.create(task);
      TaskResponse taskResponse = taskAssembler.toResponse(savedTask);

      return new ResponseEntity<>(taskResponse, HttpStatus.CREATED);
   }

   @GetMapping
   public ResponseEntity<List<TaskResponse>> getAllTasks() {
      List<Task> tasks = taskService.findAll();
      List<TaskResponse> taskResponses = taskAssembler.toCollectionsResponse(tasks);

      return ResponseEntity.ok(taskResponses);
   }

   @DeleteMapping("/{id}")
   public ResponseEntity<Void> deleteTask(@PathVariable Long id) {
      taskService.delete(id);
      return ResponseEntity.noContent().build();
   }

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
