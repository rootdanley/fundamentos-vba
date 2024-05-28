package br.com.danley.todolist.config;


import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

   @Bean
   public OpenAPI configOpenApi(){
      return new OpenAPI().info(
          new Info()
              .version("1.0.0")
              .title("API de Gestão de Tarefas")
              .description("Esta é uma API para gerenciamento de tarefas, incluindo operações para criar, atualizar, deletar e listar tarefas.")
      );
   }

}
