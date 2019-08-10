Unit Unit_Pasajero;

Interface

Type T_Pasajero=record
        ID_Pasajero:integer;
        Apellido:string[50];
        Nombre:string[50];
        Edad:integer;
        Activo:boolean;
     End;
     Arch_Pasajero= file of T_Pasajero;
     T_Pasaj = record
            Apellido: String[50];
            Nombre: String[50];
            Pos: integer;
     end;
     T_Vec_Pasaj = array [1..100] of T_Pasaj;

Var Arch_P:Arch_Pasajero;
    Reg_P:T_Pasajero;
    Posicion:integer;

Procedure Abrir_P(var A_Pasaj:Arch_Pasajero);
Procedure Cerrar_P(var A_Pasaj:Arch_Pasajero);
Procedure Leer_P(var A_Pasaj:Arch_Pasajero; var R_Pasaj:T_Pasajero; Pos:integer);
Procedure Modificar_P(var A_Pasaj:Arch_Pasajero;Pos:integer;R_Pasaj:T_Pasajero);
Procedure Guardar_P(var A_Pasaj:Arch_Pasajero;R_Pasaj:T_Pasajero);
Procedure Busqueda_P(var A_Pasaj:Arch_Pasajero; Bus:integer; var Pos:integer;var R_Pasaj:T_Pasajero);
procedure Cargar_P(var A_Pasaj:Arch_Pasajero; var V:T_Vec_Pasaj; var Cant:integer);
Procedure Burbuja_P(var V:T_Vec_Pasaj; var Cant:integer);

Implementation

Procedure Abrir_P(var A_Pasaj:Arch_Pasajero);
begin
     Assign(A_Pasaj,'pasajero.dat');
     Reset(A_Pasaj);
     If (ioresult <> 0) then
     Rewrite(A_Pasaj);
end;

Procedure Cerrar_P(var A_Pasaj:Arch_Pasajero);
begin
     Close(A_Pasaj)
end;

procedure Leer_P(var A_Pasaj:Arch_Pasajero; var R_Pasaj:T_Pasajero; Pos:integer);
begin
     seek(A_Pasaj,Pos);
     read(A_Pasaj,R_Pasaj);
end;

Procedure Modificar_P(var A_Pasaj:Arch_Pasajero; Pos:integer; R_Pasaj:T_Pasajero);
begin
     seek(A_Pasaj,Pos);
     write(A_Pasaj,R_Pasaj);
end;

Procedure Guardar_P(var A_Pasaj:Arch_Pasajero;R_Pasaj:T_Pasajero);
begin
     seek(A_Pasaj,filesize(A_Pasaj));
     write(A_Pasaj,R_Pasaj);
end;

Procedure Busqueda_P(var A_Pasaj:Arch_Pasajero; Bus:integer; var Pos:integer;var R_Pasaj:T_Pasajero);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Pasaj,0);
     While (Not eof (A_Pasaj)) and (Pos=-1) do
     Begin
          Leer_P(A_Pasaj,R_Pasaj,P);
          If (Bus=R_Pasaj.ID_Pasajero) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_P(var A_Pasaj:Arch_Pasajero; var V:T_Vec_Pasaj; var Cant:integer);
var p:integer;
begin
     Abrir_P(A_Pasaj);
     p:=0;
     Cant:=0;
     while(not eof(A_Pasaj)) do
     begin
          Leer_P(A_Pasaj, Reg_P, p);
          if(Reg_P.Activo) then
          begin
                inc(Cant);
                V[Cant].Apellido := Reg_P.Apellido;
                V[Cant].Nombre := Reg_P.Nombre;
                V[Cant].Pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_P(A_Pasaj);
end;

Procedure Burbuja_P(var V:T_Vec_Pasaj; var Cant:integer);
Var I,J:byte;
    Aux:T_Pasaj;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If ((V[J].Apellido)+(V[J].Nombre))>((V[J+1].Apellido)+(V[J+1].Nombre)) then
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
