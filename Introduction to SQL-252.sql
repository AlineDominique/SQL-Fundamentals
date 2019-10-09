## 2. Previewing A Table Using SELECT ##

/*Escreva uma query SQL que retorne as 10 primeiras linhas do recent_grads*/
SELECT * FROM recent_grads LIMIT 10;

## 3. Filtering Rows Using WHERE ##

/*Escreva uma query SQL que retorne as graduações onde a minoria são mulheres
    # Retorne as colunas Major e ShareWomen (nesta ordem) e não limite os números de linhas. */
SELECT Major,ShareWomen from recent_grads where ShareWomen < 0.5;


## 4. Expressing Multiple Filter Criteria Using AND ##

/* Escreva query SQL que retorne:
    # Todas as graduações com maioria feminina e 
    # Todas as graduações que tenha a média salarial maior que 50000.
Apenas inclua as seguintes colunas no resultado e nesta ordem: Major,Major_category,Median,ShareWomen.*/
SELECT Major,Major_category,Median,ShareWomen FROM recent_grads WHERE ShareWomen > 0.5 AND Median > 50000;


## 5. Returning One of Several Conditions With OR ##

/* Escreva query SQL que retorne as 20 primeiras principais graduações:
    # Que tenha a média salarial maior ou igual 10,000, ou 
    # Que tenha menos ou igual 1,000 trabalhadores desempregados  
   Apenas inclua as seguintes colunas e e nesta ordem: Major,Median,Unemployed.*/
SELECT Major,Median,Unemployed from recent_grads WHERE Median >=10000 or Unemployed < 1000 LIMIT 20;

## 6. Grouping Operators With Parentheses ##

/*Execute a query nós exploramos acima, que retorna todas as graduações:
    Se enquadra na categoria Engineering e quer:
        Tenha a maioria mulheres graduadas
        Ou tenha taxa desempregados abaixo 5,1%, que foi taxa seja de August 2015 
     Apenas inclua os seguintes colunas e nesta ordem:
        Major, Major_category, ShareWomen, Unemployment_rate*/
SELECT Major, Major_category, ShareWomen, Unemployment_rate from recent_grads WHERE (Major_category = 'Engineering') and (ShareWomen > 0.5 or Unemployment_rate < 0.051);

## 7. Ordering Results Using ORDER BY ##

/*Escreva uma query que retorne todas as graduações quando:
    ShareWomen é maior que 0.3
    E Unemployment_rate é menor que .1
    Apenas inclua as seguintes colunas  e nesta ordem: Major, ShareWomen e Unemployment_rate.
    A order dos resultados é decrescente pela coluna ShareWomen.*/
SELECT Major, ShareWomen, Unemployment_rate FROM recent_grads WHERE (ShareWomen > 0.3 AND Unemployment_rate < .1) ORDER BY ShareWomen DESC; 

## 8. Practice Writing A Query ##

/*Escreva um query que retorne as graduações Engineering ou Physical Sciences na ORDER crescente pela taxa de desempregados.
    O resultado deve que apenas as colunas Major_category, Major e Unemployment_rate.*/
SELECT Major_category, Major, Unemployment_rate FROM recent_grads WHERE Major_category = "Engineering" OR Major_category = "Physical Sciences" ORDER BY Unemployment_rate ASC;