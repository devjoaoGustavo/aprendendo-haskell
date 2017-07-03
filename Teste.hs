module Teste where

maiorQue :: Int -> Int -> Bool
maiorQue x y = x > y

menorQue :: Int -> Int -> Bool
menorQue a b = (<) a b

u :: Int
u = 7

-- head, tail e last são chamadas funções parciais, pois não são definidas para todo tipo de lista (ex.: lista vazia)

somaNumeros :: Int -> Int -> Int -> Int
somaNumeros a b c = a + b + c

-- [x * 2 | x <- [1,2,3,4,5,6,7,8,9], x /=4]
dobroLista :: [Int] -> [Int]
dobroLista xs = [2*x | x<-xs]

lista :: [Int]
lista = [2*x+1 | x<-[0 .. 10], x/=5]

foo :: Char -> Int ->(Int, String)
foo x y = (y+9, x:[x])

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

-- [1.0,0.5,0.25,0.125,0.0625,0.03125]

-- [1,10,19,28,37,46,55,64]

-- [2,4,8,10,12,16,18,22,24,28,30]

-- [2,4,8,10,12,16,18,22,24,28,30]

-- Crie uma função que verifique se o tamanho de uma String é par ou não. Use Bool como retorno.

-- Escreva uma função que receba um vetor de Strings e retorne uma lista com todos os elementos em ordem reversa

-- Escreva uma função que receba um vetor de Strings e retorne uma lista com o tamanho de cada String. As palavras de tamanho par devem ser exlcluídas da resposta.

-- Escreva a função head como composição de duas outras.

-- Faça uma função que receba uma String e retorne True se esta for um palíndromo; caso contrário False.

-- Faça uma função que receba um inteiro e retorne uma tupla, contendo: o dobro deste número na primeira coordenada, o triplo na segunda, o quádrulo na terceira e o quíntuplo na quarta.




