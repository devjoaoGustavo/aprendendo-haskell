module Tipos where

-- sum type
data Dia = Segunda | Terca | Quarta |
           Quinta | Sexta | Sabado | Domingo

-- Segunda, Terca, Quarta, Quinta, Sexta,
-- Sabado ou Domingo são data ou values constructors

agenda :: Dia -> [Char]
agenda Domingo = "Tudo em mim sabe que eh domingo"
agenda Segunda = "Trabalho"
agenda Terca = "Freela"
agenda Quarta = "Projeto"
agenda Quinta = "Unidade"
agenda _ = "Tira uma folga"

-- Pattern matching
f :: (Int,Int) -> Int
f (0,0) = 0
f (0,1) = 1
f (1,0) = 1
f (x,0) = x
f (0,y) = y
f (x,y) = x+y

g :: (Int, Int) -> Int
g (7,7) = 7
-- g (_,_) = 0
g _ = 0

h :: [Int] -> Int
h [] = 0
h (_:[]) = 1
h (_ :x:[]) = 2+x
h (x:y:z:[]) = 3+x+y+z
h (x:_:_:w:[]) = 4+x+w
h (x:xs) = head xs

-- Todo value constructor pode possuir campos
newtype Nome = FazNome String
newtype Idade = Idade Int
data Pessoa = Fisica Nome Idade | Juridica Nome

coisa :: Pessoa -> (String, String)
coisa (Fisica (FazNome name) (Idade age)) =
      ("Nome: " ++ name, "Idade: " ++ show age)
coisa (Juridica (FazNome name)) =
      ("Nome: " ++ name, "Nao ha idade")


-- Usando o comando newtype para criar novo tipo
newtype Dado = Dado Int

-- Forma preguiçosa
data Dado1 = Dado1 Int

trem :: Dado -> Int
trem (Dado x) = 3

treco :: Dado1 -> Int
treco (Dado1 x) = 3

newtype Natural = MakeNatural Int
toNatural :: Int -> Natural
toNatural x | x < 0 = error "Não é possível criar um número natural negativo"
            | x == 0 = error " Não quero número natural igual a zero"
            | otherwise = MakeNatural x

showNatural :: Natural -> Int
showNatural (MakeNatural x) = x

fromNatural :: Natural -> Int
fromNatural (MakeNatural x) = x
