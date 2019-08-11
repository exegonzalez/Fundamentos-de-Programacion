Unit General;

INTERFACE
uses crt;

Type

    T_Socios = Record
		ID_Socio: Integer;
		Apnom: String;
		Direccion: String;
		Telefono: String;
		DNI: Integer;    // Campo por el que se va a buscar al socio.
		Email: String;
        Activo: boolean;
	End;
    F_Socios= File of T_Socios;
	T_Socios_Orden = Record
        Apnom: String;
        Pos: Integer;
    End;
    T_Vec_Socios_Orden = array [1..100] of T_Socios_Orden;  //Usado en burbuja de socios

{-----------------------------------------------------------------------------------}

	T_Peliculas = Record
		ID_Pelicula: Integer;
		Titulo: String;
		Genero: String;
		Duracion: String;
		Actores: String;
		Anio: Integer;
		Director: String;
		Productor: String;
		Formato: String;
		Calificacion: String;
        Activo: boolean;
	End; 
	F_Peliculas= File of T_Peliculas;
    T_Peliculas_Orden = Record
        Titulo: String;
        Genero: String;
        Pos: Integer;
    End;
    T_Vec_Peliculas_Orden = array [1..100] of T_Peliculas_Orden;  //Usado en burbuja de peliculas

{-----------------------------------------------------------------------------------}

	T_Alquileres = Record
		ID_Alquiler: Integer;
		ID_Socio: Integer;
		ID_Pelicula: Integer;
		Fecha_entrega: Real;
		Hora: String;
		Monto_total: Real;
        Fecha_recepcion: Real;
        Activo: boolean;
	End;
    F_Alquileres= File of T_Alquileres;
    T_Alquileres_Orden = Record
        Fecha_entrega: Real;
        Pos: Integer;
    End;
    T_Vec_Alquileres_Orden = array [1..100] of T_Alquileres_Orden;  //Usado en burbuja de alquileres

const
     dias_venc = 3; //const de cantidad de dias del alquiler hasta que se vence, para modificarlo facilmente una vez. La usa Alquileres

var 
 	Posicion:integer;
    Arch_Alquileres:F_Alquileres;
    Arch_Peliculas:F_Peliculas;
    Arch_Socios:F_Socios;
    Reg_Socios: T_Socios;
	Reg_Peliculas: T_Peliculas;
 	Reg_Alquileres: T_Alquileres;

Procedure inicializa_archivos(var A_Alq: F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);

Procedure ABRIR_ALQUILERES(var A_Alq: F_Alquileres);
Procedure ABRIR_PELICULAS(var A_Pel: F_Peliculas);
Procedure ABRIR_SOCIOS(var A_Soc: F_Socios);

Procedure CERRAR_ALQUILERES(var A_Alq: F_Alquileres);
Procedure CERRAR_PELICULAS(var A_Pel: F_Peliculas);
Procedure CERRAR_SOCIOS(var A_Soc: F_Socios);

Procedure LEER_ALQUILERES(var A_Alq:F_Alquileres; var R_Alq:T_Alquileres; Pos:Integer);
Procedure LEER_PELICULAS(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; Pos:Integer);
Procedure LEER_SOCIOS(var A_Soc:F_Socios; var R_Soc:T_Socios; Pos:Integer);

Procedure MODIFICAR_ALQUILERES(var A_Alq:F_Alquileres; R_Alq:T_Alquileres; Pos:Integer);
Procedure MODIFICAR_PELICULAS(var A_Pel:F_Peliculas; R_Pel:T_Peliculas; Pos:Integer);
Procedure MODIFICAR_SOCIOS(var A_Soc:F_Socios; R_Soc:T_Socios; Pos:Integer);

Procedure GUARDAR_ALQUILERES(var A_Alq:F_Alquileres; R_Alq:T_Alquileres);
Procedure GUARDAR_PELICULAS(var A_Pel:F_Peliculas; R_Pel:T_Peliculas);
Procedure GUARDAR_SOCIOS(var A_Soc:F_Socios; R_Soc:T_Socios);

Procedure BURBUJA_ALQUILERES(var V:T_Vec_Alquileres_Orden; var Cant_Elem:integer);
Procedure BURBUJA_PELICULAS(var V:T_Vec_Peliculas_Orden; var Cant_Elem:integer);
Procedure BURBUJA_SOCIOS(var V:T_Vec_Socios_Orden; var Cant_Elem:integer);

IMPLEMENTATION


{-------------------------------------PROCEDIMIENTOS ABRIR-------------------------------------}


PROCEDURE ABRIR_ALQUILERES(var A_Alq: F_Alquileres); //Asignar
BEGIN
    Assign(A_Alq,'c:\ALQUILERES.dat');
	Reset(A_Alq);
	If(IoResult<>0) Then
		Begin
			Rewrite(A_Alq);//Crea el archivo en caso de no existir
		end;
END;

PROCEDURE ABRIR_SOCIOS(var A_Soc: F_Socios); //Asignar
BEGIN
    Assign(A_Soc,'c:\SOCIOS.dat');
	Reset(A_Soc);
	If(IoResult<>0) Then
		Begin
			Rewrite(A_Soc);//Crea el archivo en caso de no existir
		end;
END;

PROCEDURE ABRIR_PELICULAS(var A_Pel: F_Peliculas); //Asignar
BEGIN
    Assign(A_Pel,'c:\PELICULAS.dat');
	Reset(A_Pel);
	If(IoResult<>0) Then
		Begin
			Rewrite(A_Pel);//Crea el archivo en caso de no existir
		end;
END;


{-------------------------------------PROCEDIMIENTOS CERRAR-------------------------------------}


Procedure CERRAR_ALQUILERES(var A_Alq: F_Alquileres);
begin
     Close(A_Alq)
end;

Procedure CERRAR_SOCIOS(var A_Soc: F_Socios);
begin
     Close(A_Soc)
end;

Procedure CERRAR_PELICULAS(var A_Pel: F_Peliculas);
begin
     Close(A_Pel)
end;


{-------------------------------------PROCEDIMIENTOS LEER-------------------------------------}


Procedure LEER_ALQUILERES(var A_Alq:F_Alquileres; var R_Alq:T_Alquileres; Pos:Integer);
begin
     seek(A_Alq,Pos);
     read(A_Alq,R_Alq);
end;

Procedure LEER_SOCIOS(var A_Soc:F_Socios; var R_Soc:T_Socios; Pos:Integer);
begin
     seek(A_Soc,Pos);
     read(A_Soc,R_Soc);
end;

Procedure LEER_PELICULAS(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; Pos:Integer);
begin
     seek(A_Pel,Pos);
     read(A_Pel,R_Pel);
end;


{-------------------------------------PROCEDIMIENTOS MODIFICAR-------------------------------------}


Procedure MODIFICAR_ALQUILERES(var A_Alq:F_Alquileres; R_Alq:T_Alquileres; Pos:Integer);
begin
     seek(A_Alq,Pos);
     write(A_Alq,R_Alq);
end;

Procedure MODIFICAR_PELICULAS(var A_Pel:F_Peliculas; R_Pel:T_Peliculas; Pos:Integer);
begin
     seek(A_Pel,Pos);
     write(A_Pel,R_Pel);
end;

Procedure MODIFICAR_SOCIOS(var A_Soc:F_Socios; R_Soc:T_Socios; Pos:Integer);
begin
     seek(A_Soc,Pos);
     write(A_Soc,R_Soc);
end;


{-------------------------------------PROCEDIMIENTOS GUARDAR-------------------------------------}


Procedure GUARDAR_ALQUILERES(var A_Alq:F_Alquileres; R_Alq:T_Alquileres);
begin
     seek(A_Alq,filesize(A_Alq));
     write(A_Alq,R_Alq);
end;

Procedure GUARDAR_PELICULAS(var A_Pel:F_Peliculas; R_Pel:T_Peliculas);
begin
     seek(A_Pel,filesize(A_Pel));
     write(A_Pel,R_Pel);
end;

Procedure GUARDAR_SOCIOS(var A_Soc:F_Socios; R_Soc:T_Socios);
begin
     seek(A_Soc,filesize(A_Soc));
     write(A_Soc,R_Soc);
end;


{-------------------------------------PROCEDIMIENTOS BURBUJA-------------------------------------}


Procedure BURBUJA_SOCIOS(var V:T_Vec_Socios_Orden; var Cant_Elem:integer);
Var I,J:Integer;
    Reg:T_Socios_Orden;
Begin
     For I:= 1 to (Cant_Elem-1) do //recorridas
     Begin
          For J:= 1 to (Cant_Elem-I) do //comparaciones
          Begin
               If (V[J].Apnom)>(V[J+1].Apnom) then
               Begin
                    Reg:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Reg;
               End;
          End;
     End;
End;

Procedure BURBUJA_PELICULAS(var V:T_Vec_Peliculas_Orden; var Cant_Elem:integer);
Var I,J:Integer;
    Reg:T_Peliculas_Orden;
Begin
     For I:= 1 to (Cant_Elem-1) do //recorridas
     Begin
          For J:= 1 to (Cant_Elem-I) do //comparaciones
          Begin
               If ((V[J].Titulo)+(V[J].Genero))>((V[J+1].Titulo)+(V[J+1].Genero)) then
               Begin
                    Reg:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Reg;
               End;
          End;
     End;
End;

Procedure BURBUJA_ALQUILERES(var V:T_Vec_Alquileres_Orden; var Cant_Elem:integer);
Var I,J:Integer;
    Reg:T_Alquileres_Orden;
Begin
     For I:= 1 to (Cant_Elem-1) do //recorridas
     Begin
          For J:= 1 to (Cant_Elem-I) do //comparaciones
          Begin
               If (V[J].Fecha_entrega)<(V[J+1].Fecha_entrega) then
               Begin
                    Reg:=V[J];
                    V[J]:=V[J+1];
                    V[J+1]:=Reg;
               End;
          End;
     End;
End;


{-------------------------------------INCIALIZAR-------------------------------------}


Procedure inicializa_archivos(var A_Alq: F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);
var izq:Integer;
begin
	clrscr;
	Writeln('INCIALIZANDO ARCHIVOS');
    ABRIR_PELICULAS(A_Pel);
    ABRIR_SOCIOS(A_Soc);
    ABRIR_ALQUILERES(A_Alq);
    Rewrite(A_Alq);
    Rewrite(A_Soc);
    Rewrite(A_Pel);
    CERRAR_PELICULAS(A_Pel);
    CERRAR_SOCIOS(A_Soc);
    CERRAR_ALQUILERES(A_Alq);
    textbackground(0);
	clrscr;
	textcolor (15);
	gotoxy(izq,6);
	writeln ('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
	gotoxy(izq,7);
	writeln ('บ                                                                           บ');
	gotoxy(izq,8);
	writeln ('บ                    SE INCIALIZARON LOS ARCHIVOS                           บ');
	gotoxy(izq,9);
	writeln ('บ                                                                           บ');
	gotoxy(izq,28);
	writeln ('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
	normvideo;

	Readkey;
	Exit;
end;





BEGIN

END.
