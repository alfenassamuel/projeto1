# Minha Agenda

Aplicativo de agenda de tarefas desenvolvido com **Flutter** e **Dart**. O usuário se cadastra, faz login, escolhe um dia no calendário e gerencia a lista de tarefas daquele dia.

## Funcionalidades

- **Cadastro** de usuário (nome, email, senha e confirmação de senha), com validação dos campos
- **Login** com verificação dos usuários cadastrados
- **Calendário** interativo: ao tocar em um dia, abre a lista de tarefas dele
- **Lista de tarefas por dia**: adicionar, concluir e excluir tarefas
- **Ordenação automática**: tarefas pendentes primeiro, seguidas das concluídas, ambas em ordem alfabética
- **Indicação visual**: ícone verde (concluída) e vermelho (pendente)

## Telas

| Login | Cadastro |
|---|---|
| ![Login](prints/login.png) | ![Cadastro](prints/cadastro.png) |

| Calendário | Lista de tarefas |
|---|---|
| ![Calendário](prints/calendario.png) | ![Tarefas](prints/tarefas.png) |

## Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [table_calendar](https://pub.dev/packages/table_calendar)

## Estrutura do projeto

```
lib/
├── main.dart          # Ponto de entrada e configuração do MaterialApp
├── cores.dart         # Paleta de cores e degradê do app
├── login.dart         # Tela de login
├── cadastro.dart      # Tela de cadastro de usuário
├── calendarpage.dart  # Tela do calendário
└── todo.dart          # Lista de tarefas do dia
```

## Como executar

**Pré-requisitos:** [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado.

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/projeto1.git
cd projeto1
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Execute o app (exemplo para Windows):

```bash
flutter run -d windows
```

## Usuário de teste

| Email | Senha |
|---|---|
| admin@uniube.br | 123456 |

Também é possível criar um novo usuário pela tela de cadastro.

## Limitações

- Os dados (usuários e tarefas) ficam apenas na memória e são perdidos ao fechar o app
- Os usuários e senhas não são criptografados nem validados por um servidor

## Melhorias futuras

- Persistência de dados com `shared_preferences` ou banco de dados
- Autenticação por servidor (por exemplo, Firebase)
- Classe `Tarefa` para maior segurança de tipos
- Marcação dos dias com tarefas no calendário
- Calendário em português

## Autor

Samuel Alfenas

Trabalho acadêmico — Universidade de Uberaba (UNIUBE)