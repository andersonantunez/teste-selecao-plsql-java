# teste-selecao-plsql-java
----------
Avaliação de conhecimento técnico
Anderson Antunes
anderson.ant.oli@gmail.com

# Exercícios sobre:
* Lógica de programação
* JAVA
* SQL
* Oracle PL/SQL

# Como foi desenvolvido?
Arquivos .sql foram executados e compilados utilizando a seguinte versão em máquina local:

* Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - Production
* PL/SQL Release 11.2.0.1.0 - Production
* CORE	11.2.0.1.0	Production
* TNS for 32-bit Windows: Version 11.2.0.1.0 - Production
* NLSRTL Version 11.2.0.1.0 - Production

Foi utilizado o TOAD for Oracle para compilar os códigos e executar as consultas.

Arquivos .java foram executados no site:
https://www.onlinegdb.com/


# Comentários sobre as soluções apresentadas

## Exercício 02 - JAVA
O exercício 2 cobrava uma solução para identificar e informar os números de 1 a 100 múltiplos de 3 e/ou 5 utilizando a menor quantidade de linhas de código possíveis.
Para tal, foi armazenado os restos de 3 e 5 em m3 e m5 respectivamente. Em seguida, é utilizado o "ternary conditional operator" numa única linha.

## Exercício 03 - JAVA
O exercício 3 pedia para criar uma função que fosse capaz de converter uma string na outra comparando cada caractere entre as duas strings e contando quantas remoções de caracteres são necessárias em S (parâmetro 1) e quantas concatenações extraídas de T (parâmetro 2). 

As restrições estabelecidas foram respeitadas independente dos valores informados para S e T. Sendo assim, a solução imprimirá "Não".

Ressalta-se uma dúvida a respeito do exemplo 2, o qual menciona que são necessários 7 movimentos para converter S em T sendo que as strings são idênticas. Nesse ponto específico, a solução desenvolvida contraria tal comportamento desde que K esteja entre 1 a 100. Por esse motivo, pede-se revisão sobre este ponto. Também houve o entendimento de que o problema pedia a quantidade mínima necessária para que T seja convertido em S, ou seja, se for informado mais movimentos para K, a solução também imprimirá "Sim".

## Exercício 04 - JAVA
O exercício 4 cobrava testes unitários a partir do algoritmo desenvolvido no exercício 3. Não foi especificado a metodologia a ser utilizada, portanto adotou-se a solução mais simples possível.

## Exercício 05 - SQL
O exercício 5 pedia um relatório que ordenasse as notas maiores ou igual a 8 em ordem descrente. Notas menores, não deveria ser mostrado o nome do aluno e a ordenação deveria ser crescente. Foi desenvolvida uma única consulta SQL que contemplasse a solução ao invés de UNION com duas consultas. A intenção era trazer de forma mais rápida e utilizando menos código pensando numa situação hipotética de milhares de registros.

## Exercício 06 - OO
O exercício 6 cobrava uma resposta objetiva sobre Orientação a Objetos quando duas subclasses herdam o método da classe pai mas possuem comportamentos diferentes em sua lógica.

## Exercício 07 - JAVA
O Exercício 7 pedia um algoritmo capaz de contar a quantidade de caracteres sem utilizar a função length ou similar. Pesquisei alguma coisa no stack overflow se existia algum caracter tais como '\0' para identificar o fim de uma string, porém, ao que parece, JAVA não possui isto. Neste caso, propus quebrar a string em array usando um loop for-each.

## Exercício 08 - SQL
O exercício 8 cobrava o retorno de uma consulta onde não poderia trazer nomes iguais nas tabelas: dogs e cats.

## Exercício 09 - PL/SQL
O exercício 9 pedia uma solução que inserisse um registro automático na tabela om_record sempre que um registro fosse inserido antes na tabela tcall.
Para isto, foi criado um gatilho e uma função para recuperar o código da natureza correto a partir dos parâmetros tipo, subtipo.

## Exercício 10 - PL/SQL
O exercício 10 cobrava conhecimentos sobre transações e sessão no banco de dados Oracle. Em primeiro momento, foram executadas as instruções conforme a ordem de apresentação, retornando 1 linha. No segundo momento, foi aberta uma segunda conexão de banco de dados é executado somente a última instrução, sendo observado 0 linha retornada.

## Exercício 11 - PL/SQL
O exercício 11 pedia que fossem criadas as estruturas das tabelas bem como suas integridades referenciais, sequências e registros.

## Exercício 12 - PL/SQL
O exercício 12 cobrava conhecimentos um pouco mais aprofundados sobre pacotes, funções, parâmetros de entrada e saída, testes utilizando bloco anônimo.
O entendimento foi de que a área já viria com os nomes concatenados e seria necessário concatenar as colunas (nome_b1, nome_b2 e nome_b3) para identificar se havia ou não uma equipe ativa. Logo após, foram inseridos todos testes no log. E caso a função encontrasse uma equipe ativa, então seria gravada a tarefa na tabela t_cabecalho.

