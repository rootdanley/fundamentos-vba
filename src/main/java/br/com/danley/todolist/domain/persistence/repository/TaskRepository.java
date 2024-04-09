package br.com.danley.todolist.domain.persistence.repository;

import br.com.danley.todolist.domain.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

}
