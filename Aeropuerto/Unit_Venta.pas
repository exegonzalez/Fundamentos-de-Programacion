Unit Unit_Venta;

Interface

Type T_Venta=record
        ID_Venta:integer;
        Costo:real;
        Fecha:string[20];
        Hora:string[10];
        ID_Pasajero:integer;
        Activo:boolean;
     End;
     Arch_Venta= file of T_Venta;
     T_Ven = record
            ID_Venta: integer;
            Pos: integer;
     end;
     T_Vec_Ven = array [1..100] of T_Ven;

Var Arch_V:Arch_Venta;
    Reg_V:T_Venta;
    Posicion:integer;
    Buscado:integer;

Procedure Abrir_VE(var A_Ven:Arch_Venta);
Procedure Cerrar_VE(var A_Ven:Arch_Venta);
Procedure Leer_VE(var A_Ven:Arch_Venta; var R_Ven:T_Venta; Pos:integer);
Procedure Modificar_VE(var A_Ven:Arch_Venta;Pos:integer;R_Ven:T_Venta);
Procedure Guardar_VE(var A_Ven:Arch_Venta;R_Ven:T_Venta);
Procedure Busqueda_VE(var A_Ven:Arch_Venta; Bus:integer; var Pos:integer;var R_Ven:T_Venta);
procedure Cargar_VE(var A_Ven:Arch_Venta; var V:T_Vec_Ven; var Cant:integer);
Procedure Burbuja_VE(var V:T_Vec_Ven; var Cant:integer);

Implementation

Procedure Abrir_VE(var A_Ven:Arch_Venta);
begin
     Assign(A_Ven,'venta.dat');
     Reset(A_Ven);
     If (ioresult <> 0) then
     Rewrite(A_Ven);
end;

Procedure Cerrar_VE(var A_Ven:Arch_Venta);
begin
     Close(A_Ven)
end;

procedure Leer_VE(var A_Ven:Arch_Venta; var R_Ven:T_Venta; Pos:integer);
begin
     seek(A_Ven,Pos);
     read(A_Ven,R_Ven);
end;



Procedure Modificar_VE(var A_Ven:Arch_Venta; Pos:integer; R_Ven:T_Venta);
begin
     seek(A_Ven,Pos);
     write(A_Ven,R_Ven);
end;

Procedure Guardar_VE(var A_Ven:Arch_Venta;R_Ven:T_Venta);
begin
     seek(A_Ven,filesize(A_Ven));
     write(A_Ven,R_Ven);
end;

Procedure Busqueda_VE(var A_Ven:Arch_Venta; Bus:integer; var Pos:integer;var R_Ven:T_Venta);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_Ven)) and (Pos=-1) do
     Begin
          Leer_VE(A_Ven,R_Ven,P);
          If (Bus=R_Ven.ID_Venta) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_VE(var A_Ven:Arch_Venta; var V:T_Vec_Ven; var Cant:integer);
var p:integer;
begin
     Abrir_VE(A_Ven);
     p:=0;
     Cant:=0;
     while(not eof(A_Ven)) do
     begin
          Leer_VE(A_Ven, Reg_V, p);
          if(Reg_V.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Venta := Reg_V.ID_Venta;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_VE(A_Ven);
end;

Procedure Burbuja_VE(var V:T_Vec_Ven; var Cant:integer);
Var I,J:byte;
    Aux:T_Ven;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Venta)>(V[J+1].ID_Venta) then
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
