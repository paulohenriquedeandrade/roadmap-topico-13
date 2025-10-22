# Banco de Dados SQL - Copa do Mundo

Este projeto faz parte da entrega do décimo terceiro tópico do roadmap de estágio, focado em criação de esquema SQL, definição de constraints, inserção de dados e execução de queries.

## Tecnologias Utilizadas

* MySQL
* DBeaver
* SQL

## Estrutura do Projeto
```
database/
├── copa_mundo_dump.sql
└── queries.sql
```

## Esquema do Banco de Dados

O banco de dados `copa_mundo` contém duas tabelas com relacionamento 1:N (uma seleção possui vários jogadores).

### Tabela: selecoes

| Coluna   | Tipo        | Constraints                          |
|----------|-------------|--------------------------------------|
| id       | INT         | PRIMARY KEY, AUTO_INCREMENT          |
| nome     | VARCHAR(30) | UNIQUE, NOT NULL                     |
| grupo    | CHAR(1)     |                                      |
| titulos  | INT         | DEFAULT 0                            |

### Tabela: jogadores

| Coluna         | Tipo        | Constraints                                    |
|----------------|-------------|------------------------------------------------|
| id             | INT         | PRIMARY KEY, AUTO_INCREMENT                    |
| nome           | VARCHAR(50) | NOT NULL                                       |
| posicao        | ENUM        | 'goleiro', 'zagueiro', 'meio-campo', 'atacante'|
| numero_camisa  | INT         | CHECK (numero_camisa BETWEEN 1 AND 99)         |
| selecao_id     | INT         | NOT NULL, FOREIGN KEY REFERENCES selecoes(id)  |

## Constraints Implementadas

* **PRIMARY KEY:** Identificador único em ambas as tabelas
* **FOREIGN KEY:** Relacionamento entre jogadores e seleções
* **AUTO_INCREMENT:** Geração automática de IDs
* **NOT NULL:** Campos obrigatórios (nome, selecao_id)
* **UNIQUE:** Garante nomes únicos de seleções
* **DEFAULT:** Valor padrão de 0 títulos para novas seleções
* **CHECK:** Valida número de camisa entre 1 e 99
* **ENUM:** Restringe posições aos valores permitidos

## Dados Inseridos

* **8 seleções** cadastradas (Brasil, Suíça, Camarões, Sérvia, Argentina, Polônia, México, Arábia Saudita)
* **16 jogadores** distribuídos entre as seleções (2 por seleção)

## Queries Implementadas

O arquivo `queries.sql` contém 5 tipos de consultas:

1. **Consulta simples:** Retorna todas as seleções
2. **Filtro com WHERE:** Seleções que possuem títulos mundiais
3. **Ordenação:** Seleções ordenadas por quantidade de títulos (decrescente)
4. **JOIN:** Lista jogadores com suas respectivas seleções
5. **Agregação:** Conta total de jogadores por seleção usando GROUP BY

## Como Executar

### Restaurar o banco de dados

No MySQL via terminal:
```bash
mysql -u root -p < database/copa_mundo_dump.sql
```

Ou no DBeaver:
1. Criar novo banco de dados `copa_mundo`
2. Abrir o arquivo `copa_mundo_dump.sql`
3. Executar o script completo

### Executar as queries

1. Abrir o arquivo `queries.sql` no DBeaver
2. Executar cada query individualmente ou todas de uma vez
3. Observar os resultados retornados

## Relacionamento Entre Tabelas

O relacionamento 1:N é estabelecido através da chave estrangeira `selecao_id` na tabela `jogadores`, que referencia o `id` da tabela `selecoes`. Isso garante integridade referencial, impedindo que jogadores sejam cadastrados para seleções inexistentes.
