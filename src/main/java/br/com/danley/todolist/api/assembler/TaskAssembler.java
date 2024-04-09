package br.com.danley.todolist.api.assembler;

import br.com.danley.todolist.api.dto.request.TaskRequest;
import br.com.danley.todolist.api.dto.response.TaskResponse;
import br.com.danley.todolist.domain.model.Task;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@AllArgsConstructor
@Component
public class TaskAssembler {

   private final ModelMapper modelMapper;

   public TaskResponse toResponse(Task task) {
      return modelMapper.map(task, TaskResponse.class);
   }

   public List<TaskResponse> toCollectionsResponse(List<Task> tasks) {
      return tasks.stream()
          .map(this::toResponse)
          .toList();
   }

   public Task toEntity(TaskRequest taskRequest) {
      return modelMapper.map(taskRequest, Task.class);
   }
}
