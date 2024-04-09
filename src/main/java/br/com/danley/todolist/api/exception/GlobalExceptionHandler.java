package br.com.danley.todolist.api.exception;

import br.com.danley.todolist.domain.exception.DomainException;
import lombok.AllArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.*;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.net.URI;
import java.util.stream.Collectors;

@AllArgsConstructor
@RestControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {
   private final MessageSource messageSource;

   @Override
   protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
      ProblemDetail problemDetail = ProblemDetail.forStatus(status);
      problemDetail.setTitle("Um ou mais campos estao invalidos");
      problemDetail.setType(URI.create("https://danley.com.br/erros/campos-invalidos"));

      var fields = ex.getBindingResult().getAllErrors().stream()
          .collect(Collectors.toMap(error -> ((FieldError) error).getField(),
              error -> messageSource.getMessage(error, LocaleContextHolder.getLocale())));

      problemDetail.setProperty("fields", fields);

      return super.handleExceptionInternal(ex, problemDetail, headers, status, request);
   }

   @ExceptionHandler(DomainException.class)
   public ProblemDetail handleDomain(DomainException e) {
      ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.CONFLICT);
      problemDetail.setTitle(e.getMessage());
      problemDetail.setType(URI.create("https://danley.com.br/erros/regra-de-negocios"));

      return problemDetail;
   }

   @ExceptionHandler(DataIntegrityViolationException.class)
   public ProblemDetail handleDateIntegrityViolation(DataIntegrityViolationException e) {
      ProblemDetail problemDetail = ProblemDetail.forStatus(HttpStatus.CONFLICT);
      problemDetail.setTitle("Recurso está em uso");
      problemDetail.setType(URI.create("https://danley.com.br/erros/recurso-em-uso"));

      return problemDetail;
   }
}
