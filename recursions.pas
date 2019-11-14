program recursions;

procedure writeAB(a, b: integer);
begin
  if a = b then write(a, ' ') else 
  if a < b then begin
    writeAB(a, b - 1);
    write(b, ' ');
  end else begin
    writeAB(a, b + 1);
    write(b, ' ');
  end;
end;

procedure prA;
var
  n: integer;
begin
  writeln('Введите натуральное число N:');
  readln(n);
  writeAB(1, n);
  writeln;
end;

procedure prB;
var
  a, b: integer;
begin
  writeln('Введите целое число А:');
  readln(a);
  writeln('Введите целое число В:');
  readln(b);
  writeAB(a, b);
  writeln;
end;

function akkerman(m, n: integer): integer;
begin
  if m = 0 then result := n + 1 
  else if n = 0 then result := akkerman(m - 1, 1) 
  else result := akkerman(m - 1, akkerman(m, n - 1));
end;

procedure prC;
var
  m, n: integer;
begin
  writeln('Введите целое неотрицательное число m:');
  readln(m);
  writeln('Введите целое неотрицательное число n:');
  readln(n);
  writeln('A(m,n) = ', akkerman(m, n));
end;

function st(a: integer): boolean;
begin
  if a < 3 then result := (a mod 2) = 0 
  else if a mod 2 = 0 then result := st(a div 2) 
  else result := false;
end;

procedure prD;
var
  n: integer;
begin
  writeln('Введите натуральное число N:');
  readln(n);
  if st(n) then writeln('Введённое число является степенью двойки.')
  else writeln('Введённое число не является степенью двойки.');
end;

function sum(n: longint): integer;
begin
  if n < 10 then result := n
  else result := (n mod 10) + sum(n div 10);
end;

procedure prE;
var
  n: longint;
begin
  writeln('Введите натуральное число N:');
  readln(n);
  writeln('Сумма цифр числа равна: ', sum(n));
end;

procedure writeNum(n: longint; t: byte);
begin
  if n < 10 then write(n, ' ') else
  if t = 0 then begin//обратный порядок
    write(n mod 10, ' ');
    writeNum(n div 10, t);
  end else begin//нормальный порядок
    writeNum(n div 10, t);
    write(n mod 10, ' '); 
  end;
end;

procedure prF;
var
  n: longint;
begin
  writeln('Введите натуральное число N:');
  readln(n);
  writeNum(n, 0);
  writeln;
end;

procedure prG;
var
  n: longint;
begin
  writeln('Введите натуральное число N:');
  readln(n);
  writeNum(n, 1);
  writeln;
end;

function Prime(n, i: integer): boolean;
begin
  if n < 2 then result := false 
  else if n = 2 then result := true 
  else if n mod i = 0 then result := false 
  else if i < n / 2 then result := Prime(n, i + 1) 
  else result := true;
end;

procedure prH;
var
  n: integer;
begin
  writeln('Введите натуральное число N > 1:');
  readln(n);
  if Prime(n, 2) then writeln('Введённое число простое.')
  else writeln('Введённое число не является простым.');
end;

procedure writePrimeDiv(n, i: integer);
begin
  if i > n / 2 then write(n) else
  if n mod i = 0 then begin
    write(i, ' ');
    writePrimeDiv(n div i, i);
  end else
    writePrimeDiv(n, i + 1);
end;

procedure prI;
var
  n: integer;
begin
  writeln('Введите натуральное число N > 1:');
  readln(n);
  writePrimeDiv(n, 2);
  writeln;
end;

function palindrom(s: string): boolean;
begin
  if (length(s) = 1) or (length(s) = 0) then result := true 
  else if  s[1] = s[length(s)] then begin
    Delete(s, length(s), 1);
    Delete(s, 1, 1);
    result := palindrom(s)
  end else result := false;
end;

procedure prJ;
var
  s: string;
begin
  writeln('Введите слово, состоящее только из строчных латиских букв:');
  readln(s);
  if palindrom(s) then writeln('Данное слово - палиндром.') 
  else writeln('Данное слово не является палиндромом.');
end;

procedure seqK(var ar: array of integer; n: integer);
begin
  if ar[n] > 0 then begin
    if ar[n] mod 2 = 1 then write(ar[n], ' ');
    seqK(ar, n + 1);
  end;
end;

procedure prK;
var
  ar: array of integer;
  i: integer;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  i := 0;
  repeat
    i := i + 1;
    setlength(ar, i);
    readln(ar[i - 1]);
  until ar[i - 1] = 0;
  seqK(ar, 0);
  writeln;
end;

procedure seqL;
var
  n: integer;
begin
  readln(n);
  if n > 0 then begin
    writeln(n);
    readln(n);
    if n > 0 then seqL;
  end;
end;

procedure prL;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  seqL;
end;

function maxSeq: integer;
var
  n, m: integer;
begin
  readln(n);
  if n = 0 then result := n else begin
    m := maxSeq;
    if n > m then result := n else result := m;  
  end;
end;

procedure prM;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  writeln(maxSeq);
end;

function sumSeq(sum, k: integer): real;
var
  n: integer;
begin
  readln(n);
  sum := sum + n;
  if n > 0 then begin
    k := k + 1;
    result := sumSeq(sum, k);
  end else result := sum / k;
end;

procedure prN;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  writeln(sumSeq(0, 0));
end;

function secondMax(m1, m2: integer): integer;
var
  n: integer;
begin
  readln(n);
  if n = 0 then result := m2
  else begin
    if n > m1 then begin
      m2 := m1;
      m1 := n;
    end else
    if n > m2 then m2 := n;
    result := secondMax(m1, m2);
  end;
end;

procedure prO;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  writeln(secondMax(0, 0));
end;

function amountMax(m, k: integer): integer;
var
  n: integer;
begin
  readln(n);
  if n = 0 then result := k
  else begin
    if n > m then begin
      m := n;
      k := 1;
    end 
    else if n = m then k := k + 1;
    result := amountMax(m, k);
  end;
end;

procedure prP;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода введите 0.');
  writeln(amountMax(0, 0));
end;

function once: integer;
var
  n, m: integer;
begin
  readln(n);
  if n = 0 then begin
    readln(n);
    result := 0;    
  end else
  if n = 1 then result := once + 1 
  else if n > 0 then result := once;    
end;

procedure prQ;
begin
  writeln('Введите последовательность натуральных чисел (одно число в строке).');
  writeln('Для завершения ввода дважды введите 0.');
  writeln(once);
end;

function writeSeq(n: integer): string;
var
  i, sum, j: integer;
begin
  if n = 1 then write('1') 
  else begin
    i := 1;
    sum := 0;
    j := 0;
    while sum < n do
    begin
      sum := sum + i;
      j := i;
      i := i + 1;
    end;
    write(writeSeq(n - 1), ' ', j);
  end; result := '';   
end;

procedure prR;
var
  n: integer;
begin
  writeln('Введите натуральное число.');
  readln(n);
  writeSeq(n);
end;

function sumDig(len, sum, k, s: integer): integer;
var
  c, res, i: integer;
begin
  if len = k then 
    if sum = s then begin
      result := 1;
      exit;
    end else begin
      result := 0;
      exit;
    end;
  if len = 0 then c := 1
  else c := 0;
  res := 0;
  for i := c to 9 do 
    res := res + sumDig(len + 1, sum + i, k, s);  
  result := res;
end;

procedure prS;
var
  k, s: integer;
begin
  writeln('Введите два натуральных числа k и s:');
  read(k, s);
  writeln(sumDig(0, 0, k, s));
end;

function seqZero(a, b: integer): integer;
begin
  if a > b + 1 then result := 0
  else if (a = 0) or (b = 0) then result := 1
  else result := seqZero(a, b - 1) + seqZero(a - 1, b - 1);
end;

procedure prT;
var
  a, b: integer;
begin
  writeln('Введите два неотрицательных числа а и b:');
  read(a, b);
  writeln(seqZero(a, b));
end;

function reversNum(n, i: integer): integer;
begin
  if n = 0 then result := i
  else result := reversNum(n div 10, i * 10 + n mod 10)
end;

procedure prU;
var
  n: integer;
begin
  writeln('Введите натуральное число n, не содержащее в своей записи нулей:');
  readln(n);
  writeln(reversNum(n, 0));
end;

var
  ans:char;
  answer: string;

begin
  repeat
    writeln('Введите прописную латинскую букву A-U включительно (обозначение вызываемой программы):');
    readln(ans);
    repeat
      case ans of    
        'A': prA;
        'B': prB;
        'C': prC;
        'D': prD;
        'E': prE;
        'F': prF;
        'G': prG;
        'H': prH;
        'I': prI;
        'J': prJ;
        'K': prK;
        'L': prL;
        'M': prM;
        'N': prN;
        'O': prO;
        'P': prP;
        'Q': prQ;
        'R': prR;
        'S': prS;
        'T': prT;
        'U': prU;
      end;
      writeln('Желаете продолжить работу с программой? Для выхода из программы введите 0:');
      readln(answer);
    until answer = '0';
    writeln('Желаете продолжить работу? Для выхода введите 0:');
    readln(answer);
  until answer = '0';  
end.