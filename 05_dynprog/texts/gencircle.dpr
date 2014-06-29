{$q+,r+,s+,i+,o+}
{$APPTYPE CONSOLE}
uses sysutils;
var f:text;
    nlines,nlines2,nlinespre:integer;
    i:integer;
    z:double;
    outcoeff,outadd:double;
    varunit:double;
    width:double;
begin
assign(f,'circle.tex');rewrite(f);
nlines:=14;
varunit:=62/72.27*2.54;
width:=17;
writeln(f,format('\varunit=%0.3fcm%% getting ready to make circular insert',[varunit]));
writeln(f,format('\firstlinehang=%0.3f\varunit',[sqrt(1-sqr((0.5)/nlines*2-1))]));
writeln(f,'\setbox0=\vtop{\null');
writeln(f,'\parfillskip0pt');
writeln(f,'\parshape ',nlines);
for i:=1 to nlines do begin
    z:=(i-0.5)/nlines*2-1;
    writeln(f,format('%0.3f\varunit %0.3f\varunit',[-sqrt(1-z*z),2*sqrt(1-z*z)]));
end;
writeln(f,'\footnotesize');
writeln(f,format('\baselineskip%0.4f\varunit',[2/nlines]));
writeln(f,'\frenchspacing');
writeln(f,'\noindent');
writeln(f,'\hbadness 6000');
writeln(f,'\tolerance 9999');
writeln(f,'\pretolerance 0');
writeln(f,'�) � �� �� ��� ᤥ���� ����������� ᮧ����� ����楢 ');
writeln(f,'�ந����쭮� ���, �.""�. ��� ������ $n$ ����, � ��ࢠ� ');
writeln(f,'��ப� ����� ������ ��������� ��ࢮ� �����, ���� "--- ��ன, ');
writeln(f,'����� "--- ���쥩 � �.�. ��� ');
writeln(f,'�� �� �� ��ࠡ�⠫�? �.�. ����� ��������� ��� ���ॡ���� ');
writeln(f,'����� � ������, � �� �� ��� ���ॡ���� �������� � ');
writeln(f,'��������?');
writeln(f,'}');
nlines2:=13;
nlinespre:=3;
writeln(f,'\parshape ',nlines2+nlinespre+1);
outcoeff:=1.2;
outadd:=0.8;
for i:=1 to nlinespre do
    writeln(f,format('0pt %0.3fcm',[width]));
for i:=1 to nlines2 do begin
    z:=(i-0.5)/nlines2*2-1;
    writeln(f,format('0pt %0.3fcm',[width-outcoeff*2*sqrt(1-z*z)-outadd]));
end;
writeln(f,format('0pt %0.3fcm',[width]));

close(f);
end.