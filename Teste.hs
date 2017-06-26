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

[x * 2 | x <- [1,2,3,4,5,6,7,8,9], x /=4]
