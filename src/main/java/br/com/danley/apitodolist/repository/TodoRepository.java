package br.com.danley.apitodolist.repository;

import br.com.danley.apitodolist.entity.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepository extends JpaRepository<Todo, Long> {

}
