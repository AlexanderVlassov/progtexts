{��� ����祭 �� ��ࣥ� ����⮢�}

{�᭮���� ��楤��:
��⠭����� ���⨭�� ��� ᨬ���� c.
f ������ ���� ���ᨢ ᪮॥ array[1..k] of byte, ��� k --- 
������⢮ ���祪 ���ᥫ�� � ᨬ����. k ������ 䨪�஢���, ⮫쪮 � �� �����, 祬� ��� ࠢ��. 
(���浪� 19-20, ����୮�)
����� ᨬ��� ����� ࠧ���, ������, 8 x k ���ᥫ�� --- i-�� ���窠 ��।������ ��⮢�� ������� �᫠ f[i]
⨯� ⮣�. ��筮 �� �����, ���ᯥਬ������ :)}
procedure setsym(c: byte; var f); assembler;
asm
  push bp
  mov ax, 1110h
  mov bx, 1000h
  mov cx,    1h
  mov dl, c
  xor dh, dh
  les di, f
  mov bp, di
  int 10h
  pop bp
end;

{���࠭��� ⥪�騩 ���� (�� 256 ᨬ�����, ������)
oldfnt ������ ���� ������ ������쭠� ��६����� --- pointer �� ���ᨢ ᨬ�����}
procedure getfnt;
var p: pointer;
begin new(oldfnt);
  asm
    push bp
    mov ax, 1130h
    mov bh, 6
    int 10h
    mov si, bp
    pop bp
    mov word ptr p, si
    mov word ptr p+2, es
  end;
  move(p^,oldfnt^,sizeof(tfnt));
end;

{����⠭����� ����}
procedure rstfnt;
begin
  setfnt(0,$100,oldfnt^);
  dispose(oldfnt);
end;

procedure curfnt(var p: tfnt); begin move(oldfnt^,p,sizeof(p)); end;

{��⠭����� 楫� ���� �ࠧ� --- �� 256 ᨬ�����
tfnt --- ⨯, �� ���� �����, ���஡�� ������ ᠬ� (���ᨢ ���⨭�� ��� 㪠��⥫� �� ���ᨢ)}
procedure setfnt(s,c: integer; var f: tfnt); assembler;
asm
  push bp
  mov ax, 1110h
  mov bx, 1000h
  mov cx, c
  mov dx, s
  les di, f
  mov bp, di
  int 10h
  pop bp
end;