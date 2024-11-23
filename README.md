# Projeto CRUD Simples com WebStencil

Este repositório apresenta um projeto simples de **CRUD** (Create, Read, Update, Delete) desenvolvido utilizando o framework **WebStencil** no Delphi. O objetivo é testar uma aplicação web funcional utilizando o WebStencil.

## Recursos do Projeto

- **CRUD Completo**:

  - **Create**: Cria novos registros.
  - **Read**: Lista e exibe detalhes dos registros existentes.
  - **Update**: Atualiza registros existentes.
  - **Delete**: Exclui registros.

- **Rotas Estruturadas**:

  - Uso de rotas para manipulação de dados.

- **Organização Baseada em MVC**:

  - Modelo para representação de dados.
  - Controladores para gerenciar a lógica de negócio.
  - Visualização responsiva para exibir as informações (HTML/JSON).

## Tecnologias Utilizadas

- **Delphi**
- **WebStencil Framework**

## Requisitos para Executar

1. **Delphi IDE** instalado (versão compatível com WebStencil).
2. **Framework WebStencil** configurado. Caso ainda não esteja configurado, consulte o repositório oficial do [WebStencil](https://github.com/andersonvinicius/webstencil).
3. Navegador ou ferramenta de teste de APIs (como Postman ou cURL) para testar as rotas.

## Como Executar

1. Clone este repositório:

   ```bash
   git clone https://github.com/lucasdefreitasroberto/CRUD_WebStencil.git
   ```

2. Abra o projeto no Delphi IDE.

3. Configure o servidor na porta desejada no código (padrão: 8080).

4. Compile e execute o projeto.

5. Acesse as rotas pelo navegador ou por uma ferramenta de teste de APIs:

   - **GET**: `http://localhost:8080/` - Exibe a lista de registros.
   - **POST**: `http://localhost:8080/create` - Cria um novo registro.
   - **PUT**: `http://localhost:8080/update/:id` - Atualiza um registro existente.
   - **DELETE**: `http://localhost:8080/delete/:id` - Exclui um registro.

## Estrutura do Projeto

O projeto está estruturado em:

- **Models**: Representação dos dados manipulados pela aplicação.
- **Controllers**: Gerencia a lógica de negócio e as operações CRUD.
- **Rotas**: Define as URLs para interação com a aplicação.
- **Views**: Exibe os dados (HTML/JSON).

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).

