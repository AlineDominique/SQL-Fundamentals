## 1. Introduction ##

/*Escreva um query que retorne o número de graduações que a maioria de estudantes masculinos.
    Use todas as maiúsculas na cláusula SELECT para que nossa verificação de resposta corresponda a - COUNT(Major).
*/
SELECT COUNT(Major) FROM recent_grads WHERE ShareWomen < 0.5;


## 2. Finding a Column's Minimum and Maximum Values in SQL ##

/* Escreva um query que retorne a menor média salarial da categoria de Engenharia.
*/
SELECT MIN(Median) from recent_grads WHERE Major_category = "Engineering";

## 3. Calculating Sums and Averages in SQL ##

/*Escreva uma query que calcule a soma da coluna Total.
    Retorne apenas o Total de números de estudantes em integer value.*/
SELECT SUM(Total) from recent_grads;

## 4. Combining Multiple Aggregation Functions ##

/*Escreva uma query que calcule a média da coluna Total, o minimo da coluna Men e o máximo da coluna Women, nesta ordem.
    Tenha certeza que todas funções esteja em maisculo (SUM()),então o resultado será igual ao seu.*/
SELECT AVG(Total), MIN(Men), MAX(Women) FROM recent_grads;

## 5. Customizing The Results ##

/* Escreva uma query que retorne, da seguinte ordem:
    o número de linhas Number of Students;
    o valor máximo da coluna Unemployment_rate como Highest Unemployment Rate
*/
SELECT COUNT(*) as "Number of Students", MAX(Unemployment_rate) as "Highest Unemployment Rate" FROM recent_grads;

## 6. Counting Unique Values ##

/*Escreva uma query que retorne o número de valores únicos nas colunas Major, Major_category e Major_code. Use as seguintes nomes e nesta ordem:
    Para os valores únicos da coluna Major, use unique_majors;
    Para os valores únicos da coluna Major_category, use unique_major_categories;
    Para os valores únicos da coluna Major_code,use unique_major_codes.*/
SELECT COUNT(DISTINCT(Major)) as unique_majors, COUNT(DISTINCT(Major_category)) as unique_major_categories, COUNT(DISTINCT(Major_code)) as unique_major_codes FROM recent_grads;

## 7. Performing Arithmetic in SQL ##

/*Escreva uma query que calcule a diferença entre as colunas 25th e 75th percentual de salários de todas graduações.
    Retorne a primeira coluna Major, usando o nome padrão;
    Retorne a segunda coluna Major_category, usando o nome padrão da coluna;
    Retorne o calculo da diferença entre 25th e 75th como terceira coluna, com o nome de quartile_spread;
    Na ordem do menor para o maior e apenas 20 primeiras linhas.*/
SELECT Major , Major_category, (P75th - P25th) as quartile_spread FROM recent_grads ORDER BY(quartile_spread) LIMIT 20;