program pr;

var a: array of integer;
    n,i: word;
    t,b: integer;

function bin(l,r: word;x: integer): integer;
var mid: integer;
begin
  mid:= a[ (r+l)div 2];
  if l<>r then begin
    if mid > x then result:= bin(l,(r+l)div 2-1,t);
    if mid < x then result:= bin((r+l)div 2+1,r,t);
    if mid = x then result:= (r+l)div 2;
  end else 
  if mid = x 
    then result:= (r+l)div 2 
    else result:= -1;
end;


begin
  readln(n);
  setlength(a,n);
  for i:= 0 to n-1 do
    read(a[i]);
  readln(t);
  if (t<a[0]) or (t>a[n-1]) then writeln('no') else begin
    b:= bin(0,n-1,t);
    if b >=0 then writeln('yes: ',b+1) else writeln('no');
  end;
end.