module Expressoes where

-- Por convenção se usar CamelCase para os nomes de funções
maiorQue :: Int -> Int -> Bool
maiorQue x y = x > y

menorQue :: Int -> Int -> Bool
menorQue a b = (<) a b

somaNumeros :: Int -> Int -> Int -> Int
somaNumeros a b c = a + b + c

-- o sinal = aqui significa definição, e não atribuição. u é uma função, e não uma consante ou menos ainda, variável.
u :: Int
u = 7
-- a linha abaixo provocaria um erro de ambiguidade
-- u = 6

-- head, tail e last são chamadas funções parciais, pois não são definidas para todo tipo de lista (ex.: lista vazia)
head [1,2,3,4]
-- => 1
tail [1,2,3,4]
-- => [2,3,4]
last [1,2,3,4]
-- => 4
-- As linhas abaixo provocará um erro
-- head []
-- tail []
-- last []

-- Strings são listas de caracteres
head "HASKELL"
-- => 'H'
--
-- reverse
reverse "HASKELL"
-- "LLEKSAH"
reverse [1,2,3,4]
-- [4,3,2,1]
reverse []
-- []

-- A função last, pode ser obtida a partir das funções head e reverse
( head . reverse ) "HASKELL"
-- 'L'
last "HASKELL"
-- 'l'

-- Podemos concatenar um lista na outra com
[1,2] ++ [3,4]
-- => [1,2,3,4]

-- De maneira infixa
(++) [1,2] [3,4]
-- => [1,2,3,4]

(++) [] [1,2]
-- => [1,2]

(++) [1,2] []
-- => [1,2]

[True, False] ++ [True]
-- [True, False, True]

-- Uma string é uma lista de caracteres, ou seja, [Char]
"ABCD" ++ "EFG"
-- "ABCDEFG"

-- Recuperar um elemento em um posição determinada
[1,2,3,4] !! 2
-- 3
[1,2,3,4] !! 0
-- 1

-- As linhas abaixo provocarão erro
-- [1,2,3,4] !! (-2) -- índice negativo
-- [] !! 2 -- índice grande demais para a lista dada

-- Adicionar um elemento no início da lista

3 : [1,2,4]
-- [3,1,2,4]

'A' : "MEIXA"
-- "AMEIXA"

2 : []
-- [2]

'A' : []
-- "A"

-- Adicionando elementos sucessivamente

5 : 4 : [3,2,1]
-- [5,4,3,2,1]

'A' : 'M' : 'E' : "IXA"
--"AMEIXA"

-- Descrobrindo o tamanho de uma lista

length [1,2,3]
-- 3

length ['a']
-- 1

length "a"
-- 1

length []
-- 0

length ""
-- 0

-- Compressão de listas

[ elem + 1 | elem <- [1,2,3,4,5], elem > 5 ]
-- [2,3,4,5]

[x * 2 | x <- [1,2,3,4,5,6,7,8,9], x /=4]
-- [2,4,6,10,12,14,16,18]

dobroLista :: [Int] -> [Int]
dobroLista xs = [2 * x | x <- xs]

lista :: [Int]
lista = [ 2 * x + 1 | x <- [0 .. 10], x /= 5 ]
-- [1,3,5,7,9,13,15,17,19,21]


-- Tuplas
-- Tuplas são imutáveis

-- :t ('A',"ALO")
-- ('A',"ALO") :: (Char,[Char])

foo :: Char -> Int ->(Int, String)
foo x y = (y+9, x:[x])

foo 'E' 2
-- (11, "EE")

fst (1,2)
-- 1
snd (1,2)
-- 2

-- Lista de exercícios do capítulo 1 do Livro de Haskell da casa do código
--
-- [1.0,11.0,121.0,1331.0,14641.0,161051.0,1771561.0]
-- Deveria ser assim:
-- [1,11,121,1331,14641,161051,1771561]
onze :: [Float]
onze = [11**x | x<-[0 .. 6]]

-- [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]
quatro :: [Int]
quatro = [x | x<-[1 .. 40], (rem x 4) /= 0]

-- ["AaBB","AbBB","AcBB","AdBB","AeBB","AfBB","AgBB"]
letras :: [[Char]]
letras = [head "ABB" : x : tail "ABB" | x<-['a' ..'g']]

-- [5,8,11,17,20,26,29,32,38,41]
-- 5+3=8 8+3=11 11+3+3=17 17+3=20 20+3+3=26 26+3=29 29+3=32 32+3+3=38 38+3=41
coisa :: [Int]
coisa = [x | x<-[1 .. 41], x `mod` 3 == 2, x > 3]

-- [1.0,0.5,0.25,0.125,0.0625,0.03125]
quinto = [x**(-x)|x<-[0..5]]

-- [1,10,19,28,37,46,55,64]

-- [2,4,8,10,12,16,18,22,24,28,30]

-- ['@','A','C','D','E','G','J','l']

-- Crie uma função que verifique se o tamanho de uma String é par ou não. Use Bool como retorno.
stringPar :: [Char] -> Bool
stringPar str = length str `mod` == 0

-- Escreva uma função que receba um vetor de Strings e retorne uma lista com todos os elementos em ordem reversa
reverseStr :: [[Char]] -> [[Char]]
reverseStr strList = [reverse str | str<-strList]]

-- Escreva uma função que receba um vetor de Strings e retorne uma lista com o tamanho de cada String. As palavras de tamanho par devem ser excluídas da resposta.
strLength :: [[Char]] -> [Int]
strLength strList = [length str | str<-strList, length str `mod` /= 0]

-- Escreva a função head como composição de duas outras.
anotherHead x = ( last . reverse ) x

-- Faça uma função que receba uma String e retorne True se esta for um palíndromo; caso contrário False.
palindromo :: [Char] -> Bool
palindromo str = str == reverse str

-- Faça uma função que receba um inteiro e retorne uma tupla, contendo: o dobro deste número na primeira coordenada, o triplo na segunda, o quádrulo na terceira e o quíntuplo na quarta.
tups :: Int -> (Int,Int,Int,Int)
tups x = (x*2,x*3,x*4,x*5)




