package br.com.danley.todolist.domain.service;

import br.com.danley.todolist.domain.exception.DomainException;
import br.com.danley.todolist.domain.model.Task;
import br.com.danley.todolist.domain.persistence.repository.TaskRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@AllArgsConstructor
@Service
public class TaskService {

   private final TaskRepository taskRepository;


   @Transactional
   public Task create(Task task) {
      return this.taskRepository.save(task);
   }

   @Transactional
   public Task update(Task task) {
      return taskRepository.save(task);
   }

   @Transactional(readOnly = true)
   public Task findById(Long id) {
      return taskRepository.findById(id)
          .orElseThrow(() -> new DomainException("Task not found"));
   }

   public boolean existsById(Long id) {
      return taskRepository.existsById(id);
   }

   @Transactional
   public void delete(Long id) {
      Task task = this.findById(id);
      this.taskRepository.delete(task);
   }

   @Transactional(readOnly = true)
   public List<Task> findAll() {
      return taskRepository.findAll();
   }

}
