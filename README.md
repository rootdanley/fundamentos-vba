# TodoList API RESTFul

## Descrição
Lista de Tarefas API é uma aplicação SpringBoot projetada para gerenciar um sistema de tarefas.
Ela fornece endpoints para criar, recuperar, atualizar e deletar tarefas (**CRUD)**, e é estruturada seguindo as melhores praticas de arquitetura de software.
Foi seguido os princípios REST para criar uma interface clara e intuitiva para a API. 
Isso inclui o uso de métodos HTTP padronizados, URIs descritivas e códigos de status para comunicação.

## Motivação


A motivação por trás disso é compreender de como implementar boas praticas de codigo, testes, interações com o banco de dados e documentação de api.

## Estrutura do Projeto

A aplicação está organizada da seguinte forma:

![image](https://github.com/rootdanley/todolist-api-springboot/assets/85087531/d87686cf-102b-4ce0-ad38-2545ed108285)

**api:** Contem os controladores, DTOs, captura de exceção global e a logica de montagem entre entidades e os DTOs

**config:** Configurações do modelmapper

**domain:** Logica de negocio, incluindo entidades, serviços, DomainException e persistencia

**resources:** Contem arquivos de configuração e migrações de banco de dados;

## **Tecnologias Utilizadas**


- **Spring Boot**: Framework principal para criação da aplicação.
- **MySQL**: Sistema de gerenciamento de banco de dados.
- **Flyway**: Para migrações de banco de dados versionadas.
- **ModelMapper**: Para o mapeamento entre objetos.
- **Lombok**: Para reduzir o boilerplate.
- **Spring Boot Test**: Para testes de integração e unidade.
- **Swagger**: Documentação da API
- **HTTPie:**  simplifica a realização de solicitações HTTP

## Iniciando o Projeto

**Pré-requisitos**: Java 17 e Maven.

Para iniciar a aplicação, execute os seguintes comandos:

```
mvn clean install
mvn spring-boot:run
```

A aplicação estará disponível em **`http://localhost:8080`**.

## Endpoints


A API inclui os seguintes endpoints:

- **`POST /api/tasks`**: Cria uma nova tarefa.
- **`GET /api/tasks`**: Lista todas as tarefas.
- **`GET /api/tasks/{id}`**: Recupera uma tarefa pelo ID.
- **`PUT /api/tasks/{id}`**: Atualiza uma tarefa existente.
- **`DELETE /api/tasks/{id}`**: Remove uma tarefa pelo ID.

## Documentação da API

A documentação completa da API, incluindo detalhes sobre todos os endpoints, está disponível através da interface do Swagger UI. Acesse a documentação navegando até o seguinte link quando a aplicação estiver em execução:

Swagger UI: [TodoList API Documentation](http://localhost:8080/swagger-ui/index.html#/)

Esta documentação interativa permite que você visualize todos os endpoints, seus métodos HTTP associados, parâmetros esperados e os modelos de dados. Você também pode executar chamadas de API diretamente da interface do Swagger para testar a funcionalidade em tempo real.

## Como acessar a documentação
Certifique-se de que a aplicação está em execução seguindo as instruções na seção "Iniciando o Projeto".
Abra um navegador e acesse o link fornecido acima.
Explore os diferentes endpoints disponíveis e utilize as funcionalidades de testes integradas para enviar requisições diretamente do navegador.

## Executando Testes


## Criando o Projeto


