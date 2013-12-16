{Васильков Александр. ИКТ-13}

program Rome_<=>_Arab;

var
  s,res1,f,n1:string;
  i,n,err1,err2,err3,err4,errn,res:integer;
  eq:array[1..7] of integer;
{функция, по всем правилам проверяющая, римское ли введено число}
function is_it_really_rome(s:string):string; 
var
  check:set of char;
  i:integer;
begin
  for i:=1 to length(s) do
    s[i]:=uppercase(s[i]);
  check:=['I', 'V', 'X', 'L', 'C', 'D', 'M'];
  if length(s)>0 then
    is_it_really_rome:='it is ok ;)'
  else
    is_it_really_rome:='err';
  {вдруг введены совсем не те знаки?}
  for i:=1 to length(s) do
    if (s[i] in check)=false then 
      begin
        if err1>1 then 
          begin
            writeln('Прежде чем пользоваться программой, предлагаю Вам ознакомиться с алфавитом римской системы счисления, для этого посетите следующую страницу: http://ru.wikipedia.org/wiki/Римские_цифры');
            halt;
          end;
        inc(err1);
        is_it_really_rome:='err1';
        writeln('Таких символов в римской системе счисления нет! Сконцентрируйтесь и попробуйте ввести еще раз.');
        exit;
      end;
  {проверка на трехкратное повторение}
  if length(s)>3 then
    for i:=1 to length(s)-3 do
      begin
        if err2>1 then 
          begin
            writeln('Прежде чем пользоваться программой, предлагаю Вам ознакомиться с правилами записи чисел в римской системе счисления, для этого посетите следующую страницу: http://ru.wikipedia.org/wiki/Римские_цифры');
            halt;
          end;
        if (s[i]=s[i+1]) and (s[i+1]=s[i+2]) and (s[i+2]=s[i+3]) then 
          begin
            inc(err2);
            is_it_really_rome:='err2';
            writeln('Цифры в римской системе счисления не могут повторяться более трех раз подряд, ибо это противоречит философии Той Эпохи. Попробуйте еще.');
            exit;
          end;
      end;
  {тут создается одномерный массив с десятичными квивалентами римских чисел для последующей работы с ними}
  for i:=1 to length(s) do
    begin
      if s[i]='I'then 
        eq[i]:=1;
      if s[i]='V'then 
        eq[i]:=5;
      if s[i]='X'then 
        eq[i]:=10;
      if s[i]='L'then 
        eq[i]:=50;
      if s[i]='C'then 
        eq[i]:=100;
      if s[i]='D'then 
        eq[i]:=500;
      if s[i]='M'then 
        eq[i]:=1000;
    end;  
  if length(s)>=3 then
    for i:=length(s) downto 3 do
      begin
        if err3>1 then 
          begin
            writeln('Прежде чем пользоваться программой, предлагаю Вам ознакомиться с правилами записи чисел в римской системе счисления, для этого посетите следующую страницу: http://ru.wikipedia.org/wiki/Римские_цифры');
            halt;
          end;
        if (eq[i]>eq[i-1]) and (eq[i]>eq[i-2]) then
          begin
            inc(err3);
            is_it_really_rome:='err3';
            writeln('Кажется, запись неправильная. Попробуйте еще.');
            exit;
          end;
      end;
  {исключение неправильного вычитания}
  for i:=2 to length(s) do 
    if eq[i]>eq[i-1] then
      if (s[i-1]+s[i]<>'IV') and (s[i-1]+s[i]<>'IX') and (s[i-1]+s[i]<>'XL') and (s[i-1]+s[i]<>'XC') and (s[i-1]+s[i]<>'CD') and (s[i-1]+s[i]<>'CM') then
        begin
          if err4>1 then 
            begin
              writeln('Прежде чем пользоваться программой, предлагаю Вам ознакомиться с правилами вычитания чисел в римской системе счисления, для этого посетите следующую страницу: http://ru.wikipedia.org/wiki/Римские_цифры');
              halt;
            end;
          inc(err4);
          is_it_really_rome:='err4';
          writeln('Запись не соответствует правилам вычитания Той Эпохи. Попробуйте ввести еще раз.');
          exit;
        end;
end;

begin
  {начинаем}
  writeln('Какой перевод вы бы хотели осуществить? Из римской системы счисления в десятичную (1) или же из десятичной в римскую? (2)');
  readln(f);
  if f='1' then 
    begin
      writeln('Введите римское число. Помните, что оно должно соответствовать всем правилам записи чисел Той Эпохи и быть меньше MMMCMXCIX.');
      err1:=0;
      err2:=0;
      err3:=0;
      err4:=0;
      {запрашиваем число до тех пор, пока оно нам не понравится}
      while not (is_it_really_rome(s)='it is ok ;)') do
        readln(s);
      res:=0;
      {сам незамысловатый алгоритм перевода римского числа в арабское}
      for i:=1 to length(s) do
        begin
          res:=res+eq[i];
          if(i>1) and (eq[i-1]<eq[i]) then res:=res-2*eq[i-1];
        end;
      {выводим результат}
      writeln(res);
    end
  else
    if f='2' then
      begin
        {опять же, требуем от пользователя правильно введенных данных, иначе обижаемся и прекращаем работу}
        writeln('Введите целое положительное десятичное число для перевода в римскую систему счисления. Работа программы для чисел более 3999 ограничена, ибо запись оных не соответствует канонам записи чисел в римской системе счисления с использованием стандартного алфавита.');
        res1:='';
        err1:=0;
        errn:=1;
        repeat
          if err1>3 then
            begin
              writeln('Кажется, мы не сойдемся.');
              writeln('***');
              writeln('Если вы недовольны работой программы, обратитесь с соответствующим заявлением в службу технической поддержки данного проекта: feedback.miem@gmail.com');
              halt;
            end;
          if err1>0 then 
            writeln('Я не могу работать с такими данными. Попробуйте еще раз.');
          inc(err1);
          readln(n1);
          val(n1,n,errn);
        until (errn=0) and (n in [1..3999]);
        {алгоритм перевода из десятичной системы в римскую. не такой лаконичный, как его собрат по переводу в десятичную, но достаточно эффективный}
        begin
          while n>=1000 do 
            begin 
              res1:=res1+'M'; 
              n:=n-1000; 
            end; 
          if n>=900 then 
            begin 
              res1:=res1+'CM'; 
              n:=n-900; 
            end 
          else 
            if n>=500 then 
              begin 
                res1:=res1+'D';
                n:=n-500; 
              end
            else 
              if n>=400 then 
                begin 
                  res1:=res1+'CD';
                  n:=n-400; 
                end; 
          while n>=100 do 
            begin 
              res1:=res1+'C';
              n:=n-100; 
            end; 
          if n>=90 then 
            begin 
              res1:=res1+'XC'; 
              n:=n-90; 
            end 
          else
            if n>=50 then
              begin 
                res1:=res1+'L';
                n:=n-50;
              end 
            else 
              if n>=40 then 
                begin 
                  res1:=res1+'XL';
                  n:=n-40; 
                end;
          while n>=10 do
            begin
              res1:=res1+'X';
              n:=n-10;
            end;
          if n=9 then
            begin
              res1:=res1+'IX';
              n:=n-9;
            end
          else
            if n>=5 then 
              begin 
                res1:=res1+'V';
                n:=n-5;
              end 
            else 
              if n=4 then 
                begin
                  res1:=res1+'IV'; 
                  n:=n-4;
                end; 
            while n>=1 do
              begin 
                res1:=res1+'I';
                n:=n-1;
              end;
        end;
        {выводим результат}
        writeln(res1);
      end
    else 
      writeln('Внимательно прочитайте первый диалог программы. Требуется ввести либо число 1 (Rome to Dec), либо число 2 (Dec to Rome)');
  writeln('***');
  writeln('Если вы недовольны работой программы, обратитесь с соответствующим заявлением в службу технической поддержки данного проекта: feedback.miem@gmail.com');
{конец программы}
end.
