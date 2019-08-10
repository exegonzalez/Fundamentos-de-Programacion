Unit Unit_Aeropuerto;

Interface

Type T_Aeropuerto=record
        ID_Aeropuerto:string[30];
        Nombre:string[50];
        Ciudad:string[50];
        Pais:string[50];
        Activo:boolean;
     End;
     Arch_Aeropuerto= file of T_Aeropuerto;
     T_Aero = record
            Nombre: String[50];
            Pais: String[50];
            Ciudad: String[50];
            Pos: integer;
     end;
     T_Vec_Aero = array [1..100] of T_Aero;

Var Arch_A:Arch_Aeropuerto;
    Reg_A:T_Aeropuerto;
    Posicion:integer;
    Buscado:string;

Procedure Abrir_A(var A_Aero:Arch_Aeropuerto);
Procedure Cerrar_A(var A_Aero:Arch_Aeropuerto);
Procedure Leer_A(var A_Aero:Arch_Aeropuerto; var R_Aero:T_Aeropuerto; Pos:integer);
Procedure Modificar_A(var A_Aero:Arch_Aeropuerto;Pos:integer;R_Aero:T_Aeropuerto);
Procedure Guardar_A(var A_Aero:Arch_Aeropuerto;R_Aero:T_Aeropuerto);
Procedure Busqueda_A(var A_Aero:Arch_Aeropuerto;var Pos:integer;Bus:string; var R_Aero:T_Aeropuerto);
procedure Cargar_A(var A_Aero:Arch_Aeropuerto; var V:T_Vec_Aero; var Cant:integer);
Procedure Burbuja_A(var V:T_Vec_Aero; var Cant:integer);

Implementation

Procedure Abrir_A(var A_Aero:Arch_Aeropuerto);
begin
     Assign(A_Aero,'aeropuerto.dat');
     Reset(A_Aero);
     If (ioresult <> 0) then
     Rewrite(A_Aero);
end;

Procedure Cerrar_A(var A_Aero:Arch_Aeropuerto);
begin
     Close(A_Aero)
end;

procedure Leer_A(var A_Aero:Arch_Aeropuerto; var R_Aero:T_Aeropuerto; Pos:integer);
begin
     seek(A_Aero,Pos);
     read(A_Aero,R_Aero);
end;



Procedure Modificar_A(var A_Aero:Arch_Aeropuerto; Pos:integer; R_Aero:T_Aeropuerto);
begin
     seek(A_Aero,Pos);
     write(A_Aero,R_Aero);
end;

Procedure Guardar_A(var A_Aero:Arch_Aeropuerto;R_Aero:T_Aeropuerto);
begin
     seek(A_Aero,filesize(A_Aero));
     write(A_Aero,R_Aero);
end;

Procedure Busqueda_A(var A_Aero:Arch_Aeropuerto; var Pos:integer;Bus:string; var R_Aero:T_Aeropuerto);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     While (Not eof (A_Aero)) and (Pos=-1) do
     Begin
          Leer_A(A_Aero,R_Aero,P);
          If (Bus=R_Aero.Nombre) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_A(var A_Aero:Arch_Aeropuerto; var V:T_Vec_Aero; var Cant:integer);
var p:integer;
begin
     Abrir_A(A_Aero);
     p:=0;
     Cant:=0;
     while(not eof(A_Aero)) do
     begin
          Leer_A(A_Aero, Reg_A, p);
          if(Reg_A.Activo) then
          begin
                inc(Cant);
                V[Cant].Nombre := Reg_A.Nombre;
                V[Cant].Pais := Reg_A.Pais;
                V[Cant].Ciudad := Reg_A.Ciudad;
                V[Cant].pos :=  p;
          end;
          inc(p);
     end;
     Cerrar_A(A_Aero);
end;

Procedure Burbuja_A(var V:T_Vec_Aero; var Cant:integer);
Var I,J:byte;
    Aux:T_Aero;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If ((V[J].Pais)+(V[J].Ciudad)+(V[J].Nombre))>((V[J+1].Pais)+(V[J+1].Ciudad)+(V[J+1].Nombre)) then
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
