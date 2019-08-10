Unit Unit_LineaAerea;

Interface

Type T_LineaAerea=record
        ID_LineaAerea:string[30];
        Cuit:string[15];
        Nombre:string[50];
        Domicilio:string[50];
        Activo:boolean;
     End;
     Arch_LineaAerea= file of T_LineaAerea;
     T_LA = record
            Nombre: String[50];
            Pos: integer;
     end;
     T_Vec_LA = array [1..100] of T_LA;

Var Arch_LA:Arch_LineaAerea;
    Reg_LA:T_LineaAerea;
    Posicion:integer;
    Buscado:string;

Procedure Abrir_LA(var A_LA:Arch_LineaAerea);
Procedure Cerrar_LA(var A_LA:Arch_LineaAerea);
Procedure Leer_LA(var A_LA:Arch_LineaAerea; var R_LA:T_LineaAerea; Pos:integer);
Procedure Modificar_LA(var A_LA:Arch_LineaAerea;Pos:integer;R_LA:T_LineaAerea);
Procedure Guardar_LA(var A_LA:Arch_LineaAerea;R_LA:T_LineaAerea);
Procedure Busqueda_LA(var A_LA:Arch_LineaAerea; Bus:string; var Pos:integer;var R_LA:T_LineaAerea);
procedure Cargar_LA(var A_LA:Arch_LineaAerea; var V:T_Vec_LA; var Cant:integer);
Procedure Burbuja_LA(var V:T_Vec_LA; var Cant:integer);


Implementation

Procedure Abrir_LA(var A_LA:Arch_LineaAerea);
begin
     Assign(A_LA,'lineaaerea.dat');
     Reset(A_LA);
     If (ioresult <> 0) then
     Rewrite(A_LA);
end;

Procedure Cerrar_LA(var A_LA:Arch_LineaAerea);
begin
     Close(A_LA)
end;

procedure Leer_LA(var A_LA:Arch_LineaAerea; var R_LA:T_LineaAerea; Pos:integer);
begin
     seek(A_LA,Pos);
     read(A_LA,R_LA);
end;

Procedure Modificar_LA(var A_LA:Arch_LineaAerea; Pos:integer; R_LA:T_LineaAerea);
begin
     seek(A_LA,Pos);
     write(A_LA,R_LA);
end;

Procedure Guardar_LA(var A_LA:Arch_LineaAerea;R_LA:T_LineaAerea);
begin
     seek(A_LA,filesize(A_LA));
     write(A_LA,R_LA);
end;

Procedure Busqueda_LA(var A_LA:Arch_LineaAerea; Bus:string; var Pos:integer;var R_LA:T_LineaAerea);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_LA)) and (Pos=-1) do
     Begin
          Leer_LA(A_LA,R_LA,P);
          If (Bus=R_LA.Nombre) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_LA(var A_LA:Arch_LineaAerea; var V:T_Vec_LA; var Cant:integer);
var p:integer;
begin
     Abrir_LA(A_LA);
     p:=0;
     Cant:=0;
     while(not eof(A_LA)) do
     begin
          Leer_LA(A_LA, Reg_LA, p);
          if(Reg_LA.Activo) then
          begin
                inc(Cant);
                V[Cant].Nombre := Reg_LA.Nombre;
                V[Cant].pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_LA(A_LA);
end;

Procedure Burbuja_LA(var V:T_Vec_LA; var Cant:integer);
Var I,J:byte;
    Aux:T_LA;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].Nombre)>(V[J+1].Nombre) then
               Begin
                    Aux:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Aux;
               End;
          End;
     End;
End;


Begin
End.
