#! /usr/bin/env io

fib := method(n,
  if(n == 1 or n == 2,
     1,
     fib(n - 1) + fib(n - 2))
)

#fib2 := method(n,
#  acc := 1
#)

Number numberDivide := Number getSlot("/")
Number / := method(d, if (d == 0, 0, self numberDivide(d)))

a := list(list(1, 2, 3),
         list(4, 5, 6),
         list(7, 8, 9))

# specific to lists of lists
sumLists := method(alist, alist map(sum) sum)
# n-dimensional version
sumLists := method(alist, alist flatten sum)

List justNumbers := method(
  self select(x, x type == "Number")
)

List averageNumbers := method(
  nums := self justNumbers;
  if(nums size == 0,
    Exception raise("List contains no numbers"),
    (nums sum) / (nums size)
  )
)


Matrix2D := List clone

Matrix2D dim := method(x, y,
  self removeAll;
  for(i, 0, x - 1,
    l := list();
    for(j, 0, y - 1,
      l append(nil)
    );
    self append(l)
  );
  self
)

Matrix2D set := method(x, y, a,
  self at(x) atPut(y, a) ; self
)

Matrix2D transpose := method(
  y := self first size;
  newMatrix := Matrix2D clone;
  newMatrix dim(y, self size);
  for(i, 0, y - 1,
    for(j, 0, self size - 1,
      newMatrix set(i, j, self at(j) at(i))
    )
  );
  newMatrix
)
