package br.com.danley.todolist.domain.exception;

public class DomainException extends RuntimeException{
   public DomainException(String msg) {
      super(msg);
   }
}
