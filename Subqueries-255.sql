## 2. Subqueries ##

/* Escreva uma query que retorne as graduações com tenha as menores média de Unemployment_rate. O resultado deverá:
    Conter apenas as colunas Major e Unemployment_rate;
    Ordenar de forma crescente pelo Unemployment_rate.
*/
select Major, Unemployment_rate from recent_grads where Unemployment_rate < (select AVG(Unemployment_rate) from recent_grads) order by Unemployment_rate;

## 3. Subquery In SELECT ##

/*Escreva uma query SQL que calcule a proporção(valor em float)de linhas que contêm média acima dos valores do ShareWomen.
    O resultado deverá retornar apenas a proporção, com o nome de proportion_abv_avg.
*/
SELECT CAST(COUNT(*) as float)/CAST((SELECT COUNT(*) from recent_grads) as float) proportion_abv_avg from recent_grads
WHERE ShareWomen > 
(SELECT AVG(ShareWomen) from recent_grads);

## 4. Returning Multiple Results In Subqueries ##

/* Escreva um query que retorne as colunas Major e Major_category em cada linha tenha:
    Major_category é uma das 5 somas de nível de grupo mais altas da coluna Total
*/
SELECT Major, Major_category FROM recent_grads
WHERE Major_category IN (select Major_category from recent_grads
group by Major_category
order by SUM(Total) DESC
limit 5);

## 5. Building Complex Subqueries ##

/* Escreva uma query que retorne a média do ratio (Sample_size/Total) para todas graduações.
    Você precisa do cast nas duas colunas com o tipo float;
    Use o alias para nomear a média como avg_ratio.
*/
select AVG(cast(Sample_size as float) / cast(Total as float)) as avg_ratio from recent_grads;

## 6. Practice Integrating A Subquery With The Outer Query ##

/* Escreva uma query que:
    Seleciona as colunas Major, Major_category e a razão calculada
filtra apenas as linhas em que a proporção é maior que avg_ratio:
        Lembre-se de que esse valor é o resultado da subconsulta da última tela: selecione AVG (cast (Sample_size as float) / cast(Total as float)) avg_ratio de recent_grads
*/
select Major, Major_category,cast(Sample_size as float)/cast(Total as float) ratio from recent_grads
 where ratio > (
select AVG(cast(Sample_size as float)/cast(Total as float)) avg_ratio from recent_grads);