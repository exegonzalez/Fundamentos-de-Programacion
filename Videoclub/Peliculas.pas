Unit Peliculas;

INTERFACE
uses crt,General,sysutils;

Procedure ALTA_PELICULAS(var A_Pel:F_Peliculas);
Procedure BAJA_PELICULAS(var A_Pel:F_Peliculas);
Procedure MODIFICACION_PELICULAS(var A_Pel:F_Peliculas);
PROCEDURE LISTADO_PELICULAS(var A_Pel:F_Peliculas);
Procedure BUSCA_PELICULAS(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; Titulo:String; var Pos:integer);
Procedure MOSTRAR_DATOS_PELICULAS(var R_Pel:T_Peliculas);
Procedure CONSULTA_PELICULAS(var A_Pel:F_Peliculas);
Procedure BUSCA_PELICULAS_ID(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; ID_Peli:Integer; var Pos:integer);

implementation


{---------------------------------BUSQUEDA PELICULAS---------------------------------}


Procedure BUSCA_PELICULAS(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; Titulo:String; var Pos:integer);
var P:integer;
Begin
     seek(A_Pel, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Pel)) and (Pos=-1) do
     Begin
          LEER_PELICULAS(A_Pel,R_Pel,P);
          If (Titulo=R_Pel.Titulo) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{---------------------------------BUSQUEDA PELICULAS POR ID---------------------------------}


Procedure BUSCA_PELICULAS_ID(var A_Pel:F_Peliculas; var R_Pel:T_Peliculas; ID_Peli:Integer; var Pos:integer);
var P:integer;
Begin
     seek(A_Pel, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Pel)) and (Pos=-1) do
     Begin
          LEER_PELICULAS(A_Pel,R_Pel,P);
          If (ID_Peli=R_Pel.ID_Pelicula) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{---------------------------------PEDIR DATOS SOCIOS---------------------------------}
{Este procedimiento es un auxiliar para el procedimiento ALTA_PELICULAS.}


Procedure PEDIR_DATOS_PELICULAS(var R_Pel:T_Peliculas; Opc:char);
BEGIN
	CASE Opc of
	 '1':begin
		  write(' Anio de la pelicula: '); readln(R_Pel.Anio);
		end;
	 '2':begin
		  write(' Genero: '); readln(R_Pel.Genero);
		end;
	 '3':begin
		  Write(' Duracion: '); readln(R_Pel.Duracion);
		end;
     '4':begin
		   write(' Actores: '); readln(R_Pel.Actores);
	    end;
     '5':begin
		   write(' Productor: '); readln(R_Pel.Productor);
	    end;
     '6':begin
		   write(' Director: '); readln(R_Pel.Director);
	    end;
     '7':begin
		   write(' Formato: '); readln(R_Pel.Formato);
	    end;
     '8':begin
		   write(' Calificacion: '); readln(R_Pel.Calificacion);
	    end;
	end;
END;


{---------------------------------MOSTRAR DATOS PELICULAS---------------------------------}


Procedure MOSTRAR_DATOS_PELICULAS(var R_Pel:T_Peliculas);
BEGIN
     Writeln(' INFORMACION DE LA PELICULA ');
     Writeln('');
     Writeln(' - Anio: ',R_Pel.Anio);
     Writeln(' - Genero: ',R_Pel.Genero);
     Writeln(' - Duracion: ',R_Pel.Duracion);
     Writeln(' - Actores: ',R_Pel.Actores);
     Writeln(' - Productor: ',R_Pel.Productor);
     Writeln(' - Director: ',R_Pel.Director);
     Writeln(' - Formato: ',R_Pel.Formato);
     Writeln(' - Calificacion: ',R_Pel.Calificacion);
     Writeln(' - ID Pelicula: ',R_Pel.ID_Pelicula);
     Writeln('');
END;

{---------------------------------ALTA PELICULAS---------------------------------}


Procedure ALTA_PELICULAS(var A_Pel:F_Peliculas);
Var Pos:integer;
    R_Pel:T_Peliculas;
    Titulo:String;
    Opc:char;
Begin
     TextColor(11);
     writeln('                                            ALTA DE REGISTROS DE PELICULAS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL TITULO: ');
     readln(Titulo);
     ABRIR_PELICULAS(A_Pel);
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,Pos);
     If (Pos=-1)then //Si la posicion del Tํtulo en el archivo Pelํculas es -1, significa que la pelicula con ese titulo aun no se dio de alta
     Begin
          PEDIR_DATOS_PELICULAS(R_Pel,'1');  // Llama al procedimiento auxiliar para pedir los datos.
          PEDIR_DATOS_PELICULAS(R_Pel,'2');
          PEDIR_DATOS_PELICULAS(R_Pel,'3');
          PEDIR_DATOS_PELICULAS(R_Pel,'4');
          PEDIR_DATOS_PELICULAS(R_Pel,'5');
          PEDIR_DATOS_PELICULAS(R_Pel,'6');
          PEDIR_DATOS_PELICULAS(R_Pel,'7');
          PEDIR_DATOS_PELICULAS(R_Pel,'8');
          R_Pel.Activo:=True;
          R_Pel.Titulo:=Titulo;
          R_Pel.ID_Pelicula:=(Filesize(A_Pel)+1);
          GUARDAR_PELICULAS(A_Pel,R_Pel);
          CERRAR_PELICULAS(A_Pel);
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          readkey;
     End
     Else //En el ELSE, significa que la posicion fue diferente de -1, y por lo tanto la pelicula con ese titulo ya fue dada de alta
     Begin
          clrscr;
          LEER_PELICULAS(A_Pel,R_Pel,Pos);
          CERRAR_PELICULAS(A_Pel);
          If (R_Pel.Activo=True) then //Como el titulo ya estaba dado de alta, realizamos un IF para ver si se encuentra Activo, si es asi mostramos los datos
          Begin
               Repeat
                     MOSTRAR_DATOS_PELICULAS(R_Pel);
                     Gotoxy(1,2);
                     writeln('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
                     Gotoxy(45,3);
                     Writeln(' LA PELICULA YA ESTA DADA DE ALTA.');
                     Gotoxy(45,4);
                     Writeln(' a- SALIR');
                     Gotoxy(46,5);
                     Writeln ('[ ]');
                     gotoxy(47,5);
                     Opc:=readkey;
               Until (Opc='a') or (Opc='A');
          End
          Else //el TITULO de la pelicula ya fue dada de alta en el archivo, pero no esta activo. mostramos sus datos y consultamos si desean reactivarlo
          Begin
               Repeat
                     MOSTRAR_DATOS_PELICULAS(R_Pel);
                     Gotoxy(45,1);
                     Writeln('PELICULA INACTIVA - OPERACIONES A REALIZAR:');
                     writeln ('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
                     Gotoxy(45,3);
                     Writeln('1- REACTIVAR');
                     Gotoxy(45,4);
                     Writeln('a- SALIR');
                     Gotoxy(45,5);
                     Writeln ('[ ]');
                     Gotoxy(46,5);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   R_Pel.Activo:=True;
                                   ABRIR_PELICULAS(A_Pel);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   CERRAR_PELICULAS(A_Pel);
                                   clrscr;
                                   Writeln(' PELICULA REACTIVADA EXITOSAMENTE');
                                   Writeln ('');
                                   TextColor(11);
                                   Writeln (' [Presione cualquier tecla para salir]');
                                   readkey;
                              End;
                     End;
               Until (Opc='a') or (Opc='A') or (Opc='1');
          End;
     End;
End;


{---------------------------------BAJA PELICULAS---------------------------------}


Procedure BAJA_PELICULAS(var A_Pel:F_Peliculas);
Var Titulo:String;
    Pos:Integer;
    R_Pel:T_Peliculas;
BEGIN
     TextColor(11);
     writeln('                                            BAJA DE REGISTROS DE PELICULAS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL TITULO: ');
     readln(Titulo);
     ABRIR_PELICULAS(A_Pel);
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,Pos);
     If (Pos<>-1) then  //Para la baja, si la posicion es diferente a -1, significa que el Titulo de la pelicula esta cargado en el archivo
     Begin
          LEER_PELICULAS(A_Pel,R_Pel,Pos);
          If (R_Pel.Activo=True) then //Este IF permite saber si el Titulo de la pelicula cargado en el archivo, se encuentra activo, si es asi se da de baja
          Begin

               R_Pel.Activo:=False;
               MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
               Writeln('');
               Writeln(' LA PELICULA FUE DADA DE BAJA EXITOSAMENTE ');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               readkey;
          End
          Else //El ELSE significa que el Titulo de la pelicula ya esta cargado y ademas esta dado de baja
          Begin
               Writeln('');
               Writeln(' LA PELICULA YA ESTA DADA DE BAJA. ');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               Readkey;
          End;
     End
     Else //Este ELSE indica que el Titulo de la pelicula no existe en el archivo
     Begin
          Writeln ('');
          Writeln(' LA PELICULA NO EXISTE.');
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          Readkey;
     End;
     CERRAR_PELICULAS(A_Pel);
END;


{---------------------------------MODIFICACION PELICULAS---------------------------------}


Procedure MODIFICACION_PELICULAS(var A_Pel:F_Peliculas);
Var Titulo:String;
    Pos:Integer;
    R_Pel:T_Peliculas;
    Opc:char;
Begin
     TextColor(11);
     writeln('                                        MODIFICACION DE REGISTROS DE PELICULAS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL TITULO: ');
     readln(Titulo);
     ABRIR_PELICULAS(A_Pel);
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,Pos);
     If (Pos<>-1) then  //Se busca si el Titulo de la pelํcula esta cargado en el archivo, si la posicion es diferente a -1 significa que si
     Begin
          clrscr;
          LEER_PELICULAS(A_Pel,R_Pel,Pos);
          If (R_Pel.Activo=True) then  //Este IF permite conocer si el Titulo de la pelicula en el archivo esta dado de alta, si es asi podremos modificarlo
          Begin
               Repeat
                     TextColor(15);
                     MOSTRAR_DATOS_PELICULAS(R_Pel);
                     Gotoxy(45,1);
                     Writeln(' OPERACIONES A REALIZAR');
                     writeln ('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
                     Gotoxy(45,3);
                     Writeln(' 1- MODIFICAR ANIO');
                     Gotoxy(45,4);
                     Writeln(' 2- MODIFICAR GENERO');
                     Gotoxy(45,5);
                     Writeln(' 3- MODIFICAR DURACION');
                     Gotoxy(45,6);
                     Writeln(' 4- MODIFICAR ACTORES');
                     Gotoxy(45,7);
                     Writeln(' 5- MODIFICAR PRODUCTOR');
                     Gotoxy(45,8);
                     Writeln(' 6- MODIFICAR DIRECTOR');
                     Gotoxy(45,9);
                     Writeln(' 7- MODIFICAR FORMATO');
                     Gotoxy(45,10);
                     Writeln(' 8- MODIFICAR CALIFICACION');
                     Gotoxy(45,11);
                     Writeln(' a- Salir');
                     gotoxy(46,12);
                     Writeln ('[ ]');
                     gotoxy(47,12);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   clrscr;
                                   Write(' INGRESE EL ANIO: '); Readln(R_Pel.Anio);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' EL ANIO DE LA PELICULA FUE MODIFICADA EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;

                           '2':Begin
                                   clrscr;
                                   Write(' INGRESE EL GENERO: '); Readln(R_Pel.genero);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' EL GENERO DE LA PELICULA FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '3':Begin
                                   clrscr;
                                   Write(' INGRESE LA DURACION: '); Readln(R_Pel.duracion);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' LA DURACION DE LA PELICULA FUE MODIFICADA EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '4':Begin
                                   clrscr;
                                   Write(' INGRESE LOS ACTORES: '); Readln(R_Pel.actores);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' LOS ACTORES DE LA PELICULA FUERON MODIFICADOS EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '5':Begin
                                   clrscr;
                                   Write(' INGRESE EL PRODUCTOR: '); Readln(R_Pel.productor);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' EL PRODUCTOR DE LA PELICULA FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '6':Begin
                                   clrscr;
                                   Write(' INGRESE EL DIRECTOR: '); Readln(R_Pel.director);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' EL DIRECTOR DE LA PELICULA FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '7':Begin
                                   clrscr;
                                   Write(' INGRESE EL FORMATO: '); Readln(R_Pel.formato);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' EL FORMATO DE LA PELICULA FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                           '8':Begin
                                   clrscr;
                                   Write(' INGRESE LA CALIFICACION: '); Readln(R_Pel.calificacion);
                                   MODIFICAR_PELICULAS(A_Pel,R_Pel,Pos);
                                   Writeln(' LA CALIFICACION DE LA PELICULA FUE MODIFICADA EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else //Este ELSE indica que el Titulo de la pelicula se encuentra en el archivo, pero no esta activo
          Begin
               Writeln ('');
               Writeln(' LA PELICULA ESTA DADA DE BAJA.');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               Readkey;
          End;
     End
     Else //Este ELSE indica que el Titulo de la pelicula no existe en el archivo
     Begin
          clrscr;
          Writeln ('');
          Writeln(' LA PELICULA NO EXISTE.');
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          Readkey;
     End;
     CERRAR_PELICULAS(A_Pel);
End;


{---------------------------------LISTADO PELICULAS---------------------------------}


PROCEDURE LISTADO_PELICULAS(var A_Pel:F_Peliculas);

var Pos,pos2:Integer;
    Vector_Pel:T_Vec_Peliculas_Orden;
    Cantidad:Integer;
    R_Pel:T_Peliculas;
    I,j:Integer;
    opc:char;

Begin
     TextColor(0);
     TextBackground(7);
     clrscr;
     ABRIR_PELICULAS(A_Pel);
     Pos:=0;
     pos2:=4;
     Cantidad:=0;
     opc:=#13;
     i:=1;
     j:=1;
     While(not eof(A_Pel)) do
     begin
          LEER_PELICULAS(A_Pel, R_Pel, Pos);
          if(R_Pel.Activo=True) then
          begin
                Cantidad:=Cantidad+1;
                Vector_Pel[Cantidad].Titulo := R_Pel.Titulo;
                Vector_Pel[Cantidad].Pos := Pos;
          end;
          Pos:=Pos+1;
     end;
     BURBUJA_PELICULAS(Vector_Pel,Cantidad);
     TextColor(White);
     TextBackground(Black);
     Writeln ('                                             LISTADO ORDENADO DE PELICULAS                                              ');
     Writeln('ID Peliculas |           Titulo                         | Anio           | Genero                                       ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(0);
          TextBackground(7);
          LEER_PELICULAS(A_Pel,R_Pel,Vector_Pel[i].pos);
          GotoXY(2,pos2);
          Writeln(R_Pel.ID_Pelicula);
          GotoXY(11,pos2);
          Writeln('   | ',R_Pel.Titulo);
          GotoXY(55,pos2);
          Writeln('  | ',R_Pel.Anio);
          GotoXY(72,pos2);
          Writeln('  | ',R_Pel.Genero);
          inc(pos2);
          inc(i);
          inc(j);
          If ((pos2=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,28);
               Writeln(' a- Anterior | s- Siguiente | esc- Salir:                                                                               ');
               TextColor(0);
               TextBackground(7);
               Repeat
                     GotoXY(42,28);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
              If (opc='a')then
               begin
                       If (i=25) then
                           i:=1
                       else
                           i:=i-24-j+1;
                       j:=1;
                       pos2:=4;
                       clrscr;
                       TextColor(White);
                       TextBackground(Black);
                       Writeln ('                                             LISTADO ORDENADO DE PELICULAS                                              ');
                       Writeln('ID Peliculas |           Titulo                         | Anio           | Genero                                       ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos2:=4;
                    j:=1;
                    clrscr;
                    TextColor(White);
                    TextBackground(Black);
                    Writeln ('                                             LISTADO ORDENADO DE PELICULAS                                              ');
                    Writeln('ID Peliculas |           Titulo                         | Anio           | Genero                                       ');
               end;
          end;
     end;
     CERRAR_PELICULAS(A_Pel);
End;


{---------------------------------CONSULTA PELICULAS---------------------------------}


Procedure CONSULTA_PELICULAS(var A_Pel:F_Peliculas);
var  R_Pel:T_Peliculas;
     Titulo: String;
     pos:integer;
Begin

     TextColor(11);
     writeln('                                                 CONSULTA DE PELICULAS');
     Writeln('');
     TextColor(15);
     Write(' Ingrese el titulo de la pelicula que desea buscar: ');
     Readln(Titulo);
     Writeln ('');
     ABRIR_PELICULAS(A_Pel);
     Pos:=-1;
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,pos);
     CERRAR_PELICULAS(A_Pel);

     If (pos<>-1) then
        Begin

          ABRIR_PELICULAS(A_Pel);
          LEER_PELICULAS(A_Pel,R_Pel,pos);
          MOSTRAR_DATOS_PELICULAS(R_Pel);
          CERRAR_PELICULAS(A_Pel);
          TextColor(11);
          Writeln (' [Presione cualquier tecla para salir]');
          readkey;
        end
     Else
       begin
         clrscr;
         Writeln ('');
         Writeln(' La pelicula no esta registrada.');
         Writeln('');
         TextColor(11);
         Writeln (' [Presione cualquier tecla para salir]');
         readkey;
       end;

End;


BEGIN

END.
