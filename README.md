# TodoList API RESTFul

### Descrição
Lista de Tarefas API é uma aplicação SpringBoot projetada para gerenciar um sistema de tarefas.
Ela fornece endpoints para criar, recuperar, atualizar e deletar tarefas (**CRUD)**, e é estruturada seguindo as melhores praticas de arquitetura de software.
Foi seguido os princípios REST para criar uma interface clara e intuitiva para a API. 
Isso inclui o uso de métodos HTTP padronizados, URIs descritivas e códigos de status para comunicação.

### Motivação

---

Este projeto foi criado para demonstrar a construção de uma API REST usando SpringBoot.

A motivação por trás disso é compreender de como implementar boas praticas de codigo, testes, interações com o banco de dados e documentação de api.

### Estrutura do Projeto

---

A aplicação está organizada da seguinte forma:

![image](https://github.com/rootdanley/todolist-api-springboot/assets/85087531/d87686cf-102b-4ce0-ad38-2545ed108285)

**api:** Contem os controladores, DTOs, captura de exceção global e a logica de montagem entre entidades e os DTOs

**config:** Configurações do modelmapper

**domain:** Logica de negocio, incluindo entidades, serviços, DomainException e persistencia

**resources:** Contem arquivos de configuração e migrações de banco de dados;

### **Tecnologias Utilizadas**

---

- **Spring Boot**: Framework principal para criação da aplicação.
- **MySQL**: Sistema de gerenciamento de banco de dados.
- **Flyway**: Para migrações de banco de dados versionadas.
- **ModelMapper**: Para o mapeamento entre objetos.
- **Lombok**: Para reduzir o boilerplate.
- **Spring Boot Test**: Para testes de integração e unidade.
- **HTTPie:**  simplifica a realização de solicitações HTTP

### Iniciando o Projeto

---

**Pré-requisitos**: Java 17 e Maven.

Para iniciar a aplicação, execute os seguintes comandos:

```
mvn clean install
mvn spring-boot:run
```

A aplicação estará disponível em **`http://localhost:8080`**.

### Endpoints

---

A API inclui os seguintes endpoints:

- **`POST /api/tasks`**: Cria uma nova tarefa.
- **`GET /api/tasks`**: Lista todas as tarefas.
- **`GET /api/tasks/{id}`**: Recupera uma tarefa pelo ID.
- **`PUT /api/tasks/{id}`**: Atualiza uma tarefa existente.
- **`DELETE /api/tasks/{id}`**: Remove uma tarefa pelo ID.

### Documentação da API

---

A documentação completa da API, com exemplos de uso, está disponível através da interface Swagger, acessível em **`/swagger-ui.html`**.

### Executando Testes

---

Para executar a suíte de testes, use o comando:

```
mvn test
```

### Criando o Projeto

---
