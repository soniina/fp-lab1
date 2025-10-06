# Лабораторная работа №1

`Павличенко Софья P3315`

##  Задача проэкта Эйлера №2 (Even Fibonacci Numbers)

Рассматривая слагаемые в последовательности Фибоначчи, значения которых не превышают четырех миллионов, найдите сумму четных слагаемых.

Основной идеей было построение последовательности Фибоначчи до значения 4_000_000, отбор чётных чисел из этой последовательности и суммирование выбранных элементов.

### Реализация на Kotlin

```kotlin
fun sol(aInit: Int, bInit: Int): Int {
    var a = aInit
    var b = bInit
    var res = 0
    while (a <= 4_000_000) {
        if (a % 2 == 0) res += a
        b = (a + b).also { a = b }
    }
    return res
}
```

### Реализация на Haskell
#### Рекурсия
```haskell
recSol :: Int -> Int -> Int
recSol a b
  | a > 4000000 = 0
  | even a = a + recSol b next
  | otherwise = recSol b next
  where
    next = a + b
```

#### Хвостовая рекурсия
```haskell
tailRecSol :: Int -> Int -> Int
tailRecSol a b = helper a b 0
  where
    helper x y acc
      | x > 4000000 = acc
      | even x = helper y next (acc + x)
      | otherwise = helper y next acc
      where
        next = x + y
```
#### Модульная
```haskell
moduleSol :: Int -> Int -> Int
moduleSol a b = moduleSum . moduleEven $ moduleFibSeq a b
  where
    moduleSum = foldl (+) 0
    moduleEven = filter even
    moduleFibSeq x y = takeWhile (<= 4000000) fibs
      where
        fibs = x : y : zipWith (+) fibs (tail fibs)
```

#### Генерация последовательности через `map`
```haskell
mapSol :: Int -> Int -> Int
mapSol a b = sum $ filter even $ takeWhile (<= 4000000) fibs
  where
    fibs = map fst $ iterate (\(x, y) -> (y, x + y)) (a, b)
```
#### Бесконечный список
```haskell
infiniteListSol :: Int -> Int -> Int
infiniteListSol a b = sum $ filter even $ takeWhile (<= 4000000) fibs
  where
    fibs = a : b : zipWith (+) fibs (tail fibs)
```
<br><br>

##  Задача проэкта Эйлера №29 (Even Fibonacci Numbers)

Рассмотрим все числа вида 𝑎^𝑏, где 𝑎 и 𝑏 — целые числа, 2≤𝑎≤100, 2≤𝑏≤100. Сколько различных чисел получится в этом наборе?

Основной идеей было сгенерировать все числа вида 𝑎^𝑏, оставить только уникальные значения, поместив их в стек, и посчитать их количество.

### Реализация на Kotlin

```kotlin
import java.math.BigInteger

fun sol(n: Int): Int {
    val set = mutableSetOf<BigInteger>()
    for (a in 2L..n) {
        val bigA = BigInteger.valueOf(a)
        for (b in 2..n) {
            set.add(bigA.pow(b))
        }
    }
    return set.size
}
```

### Реализация на Haskell
#### Рекурсия
```haskell
recSol :: Integer -> Int
recSol n = Set.size . Set.fromList $ helper 2
  where
    helper a
      | a > n = []
      | otherwise = map (a ^) [2 .. n] ++ helper (a + 1)
```

#### Хвостовая рекурсия
```haskell
tailRecSol :: Integer -> Int
tailRecSol n = helper 2 Set.empty
  where
    helper a acc
      | a > n = Set.size acc
      | otherwise = helper (a + 1) (Set.union acc (Set.fromList [a ^ b | b <- [2 .. n]]))
```
#### Модульная
```haskell
moduleSol :: Integer -> Int
moduleSol n = count
  where
    generate = [(a, b) | a <- [2 .. n], b <- [2 .. n]]
    powerPairs = map (uncurry (^)) generate
    uniqueSet = Set.fromList powerPairs
    count = Set.size uniqueSet
```

#### Генерация последовательности через `map`
```haskell
mapSol :: Integer -> Int
mapSol n = Set.size . Set.fromList $ concatMap (\a -> map (a ^) [2 .. n]) [2 .. n]
```
#### Бесконечный список
```haskell
infiniteListSol :: Integer -> Int
infiniteListSol n = Set.size . Set.fromList $ (n ^ n) : takeWhile (< n^n) [a^b | a <- [2..], b <- [2..n]]
```


<br><br>

## Выводы

В ходе выполнения лабораторной работы были опробованы различные приёмы, присущие функциональному программированию: рекурсия, хвостовая рекурсия, свёртки, использование списковых выражений, бесконечных списков. Эти приёмы демонстрируют преимущества функциональной парадигмы для некоторых задач — чистоту кода, минимизацию побочных эффектов и возможность выражать сложные вычисления через простые комбинации функций. Особенно интересным оказалось то, как ленивые вычисления языка позволяют описывать потенциально бесконечные структуры, не загружая память и не выполняя лишние операции.
