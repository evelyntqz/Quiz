(* ********************************Introduction******************************** *)
(* i := 100;
  j := 200;
  k := i+j;        //To comment and uncomment on that particular line, Ctrl+/
  Writeln(i);     //Next line after print i
  Write(i);       //Print i
  Write (k); *)

(* Write('Enter first number: ');            //prompt input from user
  ReadLn(i);
  write('Enter second number: ');
  Readln(j);

  writeln('Sum is ',i+j);

  writeln('Product is ', i*j); *)

(* *************************If-Else Statement********************************** *)
// write('Enter a number:  ');                    //if-else condition
// Readln(i);

(* if(i mod 2 = 1)then
  writeln(i, ' is odd number')
  else
  writeln(i, ' is even number'); *)

(* if(i mod 2 = 1)then begin                    //Use begin-end when output
  writeln(i, ' is odd number');                  //has more than 1 line
  writeln(i, ' is odd number');

  end else begin
  writeln(i, ' is even number');
  writeln(i, ' is even number');
  end; *)

(* *********************************Looping************************************ *)
(* for i := 1 to 5 do             //looping
  writeln(i);

  for i := 1 to 5 do begin          //if more than 1 line, use begin-end
  writeln(i);                     //i need to declare in advance before use
  writeln(i);
  end; *)

// i:=1;                             //while loop
(* while i<=5 do begin
  writeln(i);
  i:=i+1;
  end; *)
(* repeat
  writeln(i);
  inc(i);                   //increment i by 1 (i,5) is increase i by 5
  until i>5; *)

(* ********************************Recursive*********************************** *)

(* function Recursive(n:Integer): Integer;         //Recursive
  begin
  Recursive(n-1);
  end;

  var aChar:Char;
  begin
  aChar:='b';
  Inc(aChar,-10)                               //based on ASCII
  Writeln(aChar);
  Readln;
  end; *)

(* *******************************Source Code********************************** *)
program Project1;

{$APPTYPE CONSOLE}
{$R *.res} // window's resource

uses
  System.SysUtils, System.StrUtils;

var
  x, i, j, k: Integer;
  s1, s2: String;
  a, aChar, b: Char; // string data type

Function IntToStr(x: Integer): String; // Q2
Var
  s1: String;
begin
  Str(x, s1);
  IntToStr := s1;
end;

Function RomantoArabic(s: String): Integer;
  Function Valueof(char1: Char): Integer;
  begin
    case char1 of
      'I':
        Valueof := 1;
      'V':
        Valueof := 5;
      'X':
        Valueof := 10;
      'L':
        Valueof := 50;
      'C':
        Valueof := 100;
      'D':
        Valueof := 500;
      'M':
        Valueof := 1000;
    else
      Valueof := -1;
    end;
  end;

  Function Afive(char1: Char): Boolean;
  begin
    Afive := char1 in ['V', 'L', 'D'];
  end;

var
  Position: Byte;
  Value, Current, Previous: Integer;

begin
  Position := Length(s);
  Value := 0;
  Previous := Valueof(s[Position]);
  while Position > 0 do
  begin
    Current := Valueof(s[Position]);
    if Current < 0 then
    begin
      RomantoArabic := -1;
    end;
    if Current >= Previous then
    begin
      Value := Value + Current;
      Previous := Current;
    end
    else
    begin
      if Afive(s[Position]) then
      begin
        RomantoArabic := -1;
        exit;
      end;
      if Previous div Current > 10 then
      begin
        RomantoArabic := -1;
        exit;
      end;
      Value := Value - Current;
    end;
    Dec(Position);
  end;
  RomantoArabic := Value;
end;

procedure Q1;
begin
  Writeln('Enter a sentence'); // Reverse String
  Readln(s1);

  s2 := '';
  for i := 1 to Length(s1) do
  begin
    s2 := s1[i] + s2;
  end;

  write(s2);

end;

procedure Q2;
begin
  Writeln('Enter number');
  Readln(x);
  s1 := IntToStr(x);
  Writeln('"' + s1 + '"');
end;

procedure Q3;
var
  j: Integer;
begin
  Writeln('Enter a recursive number');
  Readln(x);

  j := 1;
  for i := 1 to x do
    j := j * i;

  write(j);
end;

procedure Q4;
var
  x, i, j: Integer;

begin
  Writeln('Enter a number');
  Readln(x);
  Writeln;

  for i := 1 to x do
  begin // Pattern 1 in Quiz

    for j := 1 to i do
      write('*');

    Writeln;
  end;
end;

procedure Q5;
var
  x, i, j: Integer;

begin

  Writeln('Enter a number');
  Readln(x);

  for i := 1 to x do
  begin // Pattern 2 in Quiz

    for j := i to x do
      write(' ');
    for j := 1 to i do
      write('*');
    for j := 2 to i do
      write('*');

    Writeln;
  end;
end;

procedure Q6; // Pattern 3 in Quiz
begin
  Writeln('Enter a number');
  Readln(x);

  for i := 1 to x do
  begin // Pattern 2 in Quiz

    for j := i to x do
      write(' ');
    for j := 1 to i do
      write('*');
    for j := 2 to i do
      write('*');

    Writeln;

  end;

  for i := 1 to x do
  begin // last * doesnt appear
    for j := 1 to i do
      write(' ');
    for j := i to x do
      write('*');
    for j := i to x do
      write('*');

    Writeln;

  end;


  // for i := 1 to x do begin       //down right angle-triangle(left)
  // for j := i to x do
  // write('*');
  // for j := 1 to i do
  // write(' ');
  //
  //
  // writeln;
  //
  // end;

end;

procedure Q7;
begin
  Writeln('Enter text to be encrypt:');
  Readln(s1);
  s1 := UpperCase(s1);

  s2 := '';

  for i := 1 to Length(s1) do
  begin

    j := ord(s1[i]);

    inc(j, 13); // Convert char to ASCII

    if j = 45 then
      j := 32;
    if j > 90 then
      j := 64 + (j - 90);

    s2 := chr(j); // Convert ASCII to char
    s2 := UpperCase(s2);
    write(s2);
  end;
end;

procedure Q8;
var
  s: String;
  char1: Char;

begin
  Write('Enter Roman Letter: ');
  Readln(s);
  Writeln(RomantoArabic(s));
end;

procedure Q9;
var
  strand1, strand2, new: String;
  check: Integer;

begin
  Write('Enter 1st strand: ');
  Readln(strand1);
  strand1 := UpperCase(strand1);
  Writeln('Enter 2nd strand: ');
  Readln(strand2);
  strand2 := UpperCase(strand2);

  for i := 1 to Length(strand1) do
  begin
    if (strand1[i] <> 'A') AND (strand1[i] <> 'T') AND (strand1[i] <> 'C') AND
      (strand1[i] <> 'G') then
    begin
      Writeln('Invalid input.');
      exit;
    end
    else
    begin
      if strand1[i] = 'A' then
        strand1[i] := 'T'
      else if strand1[i] = 'T' then
        strand1[i] := 'A'
      else if strand1[i] = 'C' then
        strand1[i] := 'G'
      else if strand1[i] = 'G' then
        strand1[i] := 'C';
    end;
  end;

  for i := 1 to Length(strand2) do
  begin

    if (strand2[i] <> 'A') AND (strand2[i] <> 'T') AND (strand2[i] <> 'C') AND
      (strand2[i] <> 'G') then
    begin
      Writeln('Invalid input.');
      exit;
    end;
  end;

  // check:= Pos(strand1,strand2);
  strand2 := StringReplace(strand2, strand1, '-' + strand1 + '-',
    [rfReplaceAll]);
  Writeln(strand2);

end;

procedure Q10;
var
  key: Integer;
begin
  Write('Enter key: ');
  Readln(key);
  Writeln('Enter text to be encrypt:');
  Readln(s1);
  s1 := UpperCase(s1);

  s2 := '';

  for i := 1 to Length(s1) do
  begin

    j := ord(s1[i]);

    if j = 32 then
      j := 32
    else
    begin

      inc(j, key); // Convert char to ASCII

      if j > 90 then
        j := 64 + (j - 90);
    end;
    s2 := chr(j); // Convert ASCII to char
    s2 := UpperCase(s2);
    write(s2);
  end;
end;

procedure Q11;

var
  num, len: Integer;
  num_s, s2: String;
  check: Boolean;

begin
  Writeln('Enter number');
  Readln(num);

  num_s := IntToStr(num); // convert num into string
  len := Length(num_s);

  s2 := '';
  if num_s[len] = '0' then
  begin
    Delete(num_s, len, 1); // Delete 0
    len := Length(num_s); // update length
  end;

  for i := 1 to len do
  begin
    s2 := num_s[i] + s2; // reverse string
  end;

  // CompareText(num_s, s2);
  // if num_s = s2 then
  // Writeln('True');
  // if num_s <> s2 then
  // Writeln('False');
  check := num_s = s2;
  write(check);

end;

(**********************************Exercise*********************************** *)
begin

  // Q1;
  // Q2;
  // Q3;
  // Q4;
  // Q5;
  // Q6;
  // Q7;
  // Q8;
  // Q9;
  // Q10;
  // Q11;
  Writeln('Enter a number: ');
  Readln(x);

  for i := (-1 * x + 1) to (x - 1) do
  begin
    for j := 1 to abs(i) do
      write(' ');
    for j := 1 to (2 * x - 1 - 2 * abs(i)) do // 2n-1-2i
      write('*');
    Writeln;
  end;

  Readln;

end.
