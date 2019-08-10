Unit Unit_Reserva;

Interface

Type T_Reserva=record
        ID_Reserva:integer;
        ID_Pasajero:integer;
        ID_Vuelo:integer;
        Fecha:string[20];
        Hora:string[10];
        Costo:real;
        Activo:boolean;
     End;
     Arch_Reserva= file of T_Reserva;
     T_Res = record
            ID_Reserva: integer;
            Pos: integer;
     end;
     T_Vec_Res = array [1..100] of T_Res;


Var Arch_R:Arch_Reserva;
    Reg_R:T_Reserva;
    Posicion:integer;
    Buscado:integer;

Procedure Abrir_R(var A_Res:Arch_Reserva);
Procedure Cerrar_R(var A_Res:Arch_Reserva);
Procedure Leer_R(var A_Res:Arch_Reserva; var R_Res:T_Reserva; Pos:integer);
Procedure Modificar_R(var A_Res:Arch_Reserva;Pos:integer;R_Res:T_Reserva);
Procedure Guardar_R(var A_Res:Arch_Reserva;R_Res:T_Reserva);
Procedure Busqueda_R(var A_Res:Arch_Reserva; Bus:integer; var Pos:integer;var R_Res:T_Reserva);
procedure Cargar_R(var A_Res:Arch_Reserva; var V:T_Vec_Res; var Cant:integer);
Procedure Burbuja_R(var V:T_Vec_Res; var Cant:integer);

Implementation

Procedure Abrir_R(var A_Res:Arch_Reserva);
begin
     Assign(A_Res,'reserva.dat');
     Reset(A_Res);
     If (ioresult <> 0) then
     Rewrite(A_Res);
end;

Procedure Cerrar_R(var A_Res:Arch_Reserva);
begin
     Close(A_Res)
end;

procedure Leer_R(var A_Res:Arch_Reserva; var R_Res:T_Reserva; Pos:integer);
begin
     seek(A_Res,Pos);
     read(A_Res,R_Res);
end;

Procedure Modificar_R(var A_Res:Arch_Reserva; Pos:integer; R_Res:T_Reserva);
begin
     seek(A_Res,Pos);
     write(A_Res,R_Res);
end;

Procedure Guardar_R(var A_Res:Arch_Reserva;R_Res:T_Reserva);
begin
     seek(A_Res,filesize(A_Res));
     write(A_Res,R_Res);
end;

Procedure Busqueda_R(var A_Res:Arch_Reserva; Bus:integer; var Pos:integer;var R_Res:T_Reserva);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Res,0);
     While (Not eof (A_Res)) and (Pos=-1) do
     Begin
          Leer_R(A_Res,R_Res,P);
          If (Bus=R_Res.ID_Reserva) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_R(var A_Res:Arch_Reserva; var V:T_Vec_Res; var Cant:integer);
var p:integer;
begin
     Abrir_R(A_Res);
     p:=0;
     Cant:=0;
     while(not eof(A_Res)) do
     begin
          Leer_R(A_Res, Reg_R, p);
          if(Reg_R.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Reserva := Reg_R.ID_Reserva;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_R(A_Res);
end;

Procedure Burbuja_R(var V:T_Vec_Res; var Cant:integer);
Var I,J:byte;
    Aux:T_Res;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Reserva)>(V[J+1].ID_Reserva) then
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
