## 1. Introduction ##

/*Escreva uma query que mostre todas as colunas e as cinco primeiras linhas da tabela recent_grads*/
SELECT * from recent_grads LIMIT 5;

## 2. Calculating Group-Level Summary Statistics ##

/*Use o SELECT para selecionar as seguintes colunas e agregados na query: Major_category,AVG(ShareWomen)
    Use o GROUP BY para agrupar a query pela coluna Major_category*/
SELECT Major_category, AVG(ShareWomen) FROM recent_grads GROUP BY Major_category;

## 3. Practice: Using GROUP BY ##

/* Para cada categoria de graduação, encontre a porcentagem dos graduados que estão empregdos.
    Use SELECT para selecionar as seguintes colunas e agregados na query: Major_category,AVG(Employed)/AVG(Total) as share_employed;
    Use o GROUP BY para agrupar por Major_category na query. 
*/
SELECT Major_category, (AVG(Employed)/AVG(Total)) as share_employed FROM recent_grads GROUP BY Major_category;

## 4. Querying Virtual Columns With the HAVING Statement ##

/* Encontre todas as categorias de graduações em que proporção de graduados com empregos remuneração é superior a 0,1.
        Use SELECT para selecionar as seguintes colunas e agregados na query: Major_category,AVG(Low_wage_jobs)/AVG(Total) as share_low_wage;
    Use o GROUP BY para agrupar por Major_category na query;
    Use o HAVING para restrigir a seleção das linhas em share_low_wage maior qe .1.
*/
SELECT Major_category, (AVG(Low_wage_jobs) / AVG(Total)) as share_low_wage FROM recent_grads GROUP BY Major_category HAVING share_low_wage > .1;

## 5. Rounding Results With the ROUND() Function ##

/* Escreva uma query SQL que retorne as seguintes colunas da tabela recent_grads(na mesma ordem descrita): ShareWomen arrendode o valor para 4 decimais, Major_category. Obs: limite em 10 linhas.
*/
SELECT ROUND(ShareWomen, 4), Major_category FROM recent_grads LIMIT 10;

## 6. Nesting functions ##

/* Use o SELECT para selecionar as seguintes colunas e agregados na query: Major_category, AVG(College_jobs) / AVG(Total) as share_degree_jobs.
    Use o ROUND para arredondar o share_degree_jobs em 3 decimais;
    Use o GROUP BY para agrupar por Major_category;
    Apenas selecione as linhas share_degree_jobs menor que .3.
*/
SELECT Major_category, (ROUND(AVG(College_jobs)/AVG(Total), 3)) as share_degree_jobs FROM recent_grads GROUP BY Major_category HAVING share_degree_jobs < .3;

## 7. Casting ##

/* Escreva uma query que:
    Divida a soma da coluna Women pela soma da coluna Total, com o nome de SW;
    Agrupe o resultado por Major_category e ordene por SW;
    Apenas contenha as colunas Major_category e SW, nesta ordem.
*/
SELECT Major_category, (Cast (SUM(Women) as Float) / Cast(SUM(Total) as Float)) as SW FROM recent_grads GROUP BY Major_category ORDER BY SW;