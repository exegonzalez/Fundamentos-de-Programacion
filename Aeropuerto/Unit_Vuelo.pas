Unit Unit_Vuelo;

Interface

Type T_Vuelo=record
        Origen:string[30];//ID_Aeropuerto
        ID_Vuelo:integer;
        FechaP:string[20];
        HoraP:string[10];
        Destino:string[30];//ID_Aeropuerto
        FechaL:string[20];
        HoraL:string[10];
        Escalas:array [1..3] of string;
        ID_LineaAerea:string[30];
        Cant_Pasajeros:integer;
        Estado:string;
        Activo:boolean;
     End;
     Arch_Vuelo= file of T_Vuelo;
     T_Vue = record
             ID_Vuelo: integer;
             Pos: integer;
     end;
     T_Vec_Vue = array [1..100] of T_Vue;

Var Arch_VU:Arch_Vuelo;
    Reg_VU:T_Vuelo;
    Posicion:integer;
    Buscado:integer;

Procedure Abrir_VU(var A_Vue:Arch_Vuelo);
Procedure Cerrar_VU(var A_Vue:Arch_Vuelo);
Procedure Leer_VU(var A_Vue:Arch_Vuelo; var R_Vue:T_Vuelo; Pos:integer);
Procedure Modificar_VU(var A_Vue:Arch_Vuelo;Pos:integer;R_Vue:T_Vuelo);
Procedure Guardar_VU(var A_Vue:Arch_Vuelo;R_Vue:T_Vuelo);
Procedure Busqueda_VU(var A_Vue:Arch_Vuelo; Bus:integer;var Pos:integer;var R_Vue:T_Vuelo);
procedure Cargar_VU(var A_Vue:Arch_Vuelo; var V:T_Vec_Vue; var Cant:integer);
Procedure Burbuja_VU(var V:T_Vec_Vue; var Cant:integer);

Implementation

Procedure Abrir_VU(var A_Vue:Arch_Vuelo);
begin
     Assign(A_Vue,'vuelo.dat');
     Reset(A_Vue);
     If (ioresult <> 0) then
     Rewrite(A_Vue);
end;

Procedure Cerrar_VU(var A_Vue:Arch_Vuelo);
begin
     Close(A_Vue)
end;

procedure Leer_VU(var A_Vue:Arch_Vuelo; var R_Vue:T_Vuelo; Pos:integer);
begin
     seek(A_Vue,Pos);
     read(A_Vue,R_Vue);
end;

Procedure Modificar_VU(var A_Vue:Arch_Vuelo; Pos:integer; R_Vue:T_Vuelo);
begin
     seek(A_Vue,Pos);
     write(A_Vue,R_Vue);
end;

Procedure Guardar_VU(var A_Vue:Arch_Vuelo;R_Vue:T_Vuelo);
begin
     seek(A_Vue,filesize(A_Vue));
     write(A_Vue,R_Vue);
end;

Procedure Busqueda_VU(var A_Vue:Arch_Vuelo; Bus:integer;var Pos:integer;var R_Vue:T_Vuelo);
var P:integer;
Begin
     Pos:=-1;
     P:=0;
     seek(A_Vue,0);
     While (Not eof (A_Vue)) and (Pos=-1) do
     Begin
          Leer_VU(A_Vue,R_Vue,P);
          If (Bus=R_Vue.ID_Vuelo) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;

procedure Cargar_VU(var A_Vue:Arch_Vuelo; var V:T_Vec_Vue; var Cant:integer);
var p:integer;
begin
     Abrir_VU(A_Vue);
     p:=0;
     Cant:=0;
     while(not eof(A_Vue)) do
     begin
          Leer_VU(A_Vue, Reg_VU, p);
          if(Reg_VU.Activo) then
          begin
                inc(Cant);
                V[Cant].ID_Vuelo := Reg_VU.ID_Vuelo;
                V[Cant].pos:= p;
          end;
          inc(p);
     end;
     Cerrar_VU(A_Vue);
end;

Procedure Burbuja_VU(var V:T_Vec_Vue; var Cant:integer);
Var I,J:byte;
    Aux:T_Vue;
Begin
     For I:= 1 to (Cant-1) do //recorridas
     Begin
          For J:= 1 to (Cant-I) do //comparaciones
          Begin
               If (V[J].ID_Vuelo)>(V[J+1].ID_Vuelo) then
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
