Unit Socios;

INTERFACE
uses crt,sysutils,General;

Procedure ALTA_SOCIOS(var A_Soc:F_Socios);
Procedure BAJA_SOCIOS(var A_Soc:F_Socios);
Procedure MODIFICACION_SOCIOS(var A_Soc:F_Socios);
PROCEDURE LISTADO_SOCIOS(var A_Soc:F_Socios);
Procedure BUSCA_SOCIOS(var A_Soc:F_Socios; var R_Soc:T_Socios; DNI:Integer; var Pos:integer);
Procedure MOSTRAR_DATOS_SOCIOS(var R_Soc:T_Socios);
Procedure CONSULTA_SOCIOS(var A_Soc:F_Socios);
Procedure BUSCA_SOCIOS_ID(var A_Soc:F_Socios; var R_Soc:T_Socios; ID_Soci:Integer; var Pos:integer);

implementation


{---------------------------------BUSQUEDA SOCIOS POR DNI---------------------------------}


Procedure BUSCA_SOCIOS(var A_Soc:F_Socios; var R_Soc:T_Socios; DNI:Integer; var Pos:integer);
var P:integer;
Begin
     seek(A_Soc, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Soc)) and (Pos=-1) do
     Begin
          LEER_SOCIOS(A_Soc,R_Soc,P);
          If (DNI=R_Soc.DNI) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{---------------------------------BUSQUEDA SOCIOS POR ID---------------------------------}


Procedure BUSCA_SOCIOS_ID(var A_Soc:F_Socios; var R_Soc:T_Socios; ID_Soci:Integer; var Pos:integer);
var P:integer;
Begin
     seek(A_Soc, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Soc)) and (Pos=-1) do
     Begin
          LEER_SOCIOS(A_Soc,R_Soc,P);
          If (ID_Soci=R_Soc.ID_Socio) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{---------------------------------PEDIR DATOS SOCIOS---------------------------------}


Procedure PEDIR_DATOS_SOCIOS(var R_Soc:T_Socios; Opc:char);      // Este procedimiento es un auxiliar para el procedimiento ALTA_SOCIOS.
BEGIN
	CASE Opc of
	 '1':begin
		  write(' Apellido y Nombre: '); readln(R_Soc.Apnom);   // Seg๚n el campo_par utilizado en ALTA_SOCIOS se visualizarแ y pedirแ (cargarแn) los datos correspodientes.
          R_Soc.Apnom:=(UpperCase(R_Soc.Apnom));
		end;
	 '2':begin
		  write(' Direccion: '); readln(R_Soc.Direccion);
		end;
	 '3':begin
		  Write(' Telefono: '); readln(R_Soc.Telefono);
		end;
	 '4':begin
		   write(' Email: '); readln(R_Soc.Email);
	    end;
	end;
END;


{---------------------------------MOSTRAR DATOS SOCIOS---------------------------------}
{Muestra los datos ingresados de los socios. Es utilizado para MODIFICACION_SOCIOS.}

Procedure MOSTRAR_DATOS_SOCIOS(var R_Soc:T_Socios);
BEGIN
     Writeln(' DATOS DEL SOCIO ');
     Writeln('');
     Writeln(' - Apellido y Nombre: ',R_Soc.Apnom);
     Writeln(' - Direccion: ',R_Soc.Direccion);
     Writeln(' - Telefono: ',R_Soc.Telefono);
     Writeln(' - Email: ',R_Soc.Email);
     Writeln(' - DNI: ',R_Soc.DNI);
     Writeln(' - ID Socio: ',R_Soc.ID_Socio);
     Writeln('');
END;


{---------------------------------ALTA SOCIOS---------------------------------}


Procedure ALTA_SOCIOS(var A_Soc:F_Socios);
Var Pos:integer;
    R_Soc:T_Socios;
    DNI:Integer;
    Opc:char;
Begin
     TextColor(11);
     writeln('                                              ALTA DE REGISTROS DE SOCIOS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL DNI: '); readln(DNI);
     ABRIR_SOCIOS(A_Soc);
     BUSCA_SOCIOS(A_Soc,R_Soc,DNI,Pos);
     If (Pos=-1)then //Si la posicion del DNI en el archivo Socios es -1, significa que el socio con ese DNI aun no se dio de alta
     Begin
          PEDIR_DATOS_SOCIOS(R_Soc,'1');  // Llama al procedimiento auxiliar para pedir los datos.
          PEDIR_DATOS_SOCIOS(R_Soc,'2');
          PEDIR_DATOS_SOCIOS(R_Soc,'3');
          PEDIR_DATOS_SOCIOS(R_Soc,'4');
          R_Soc.Activo:=True;
          R_Soc.DNI:=DNI;
          R_Soc.ID_Socio:=(Filesize(A_Soc)+1);
          GUARDAR_SOCIOS(A_Soc,R_Soc);
          CERRAR_SOCIOS(A_Soc);
          Writeln('');
          TextColor(11);
          Writeln (' [Presione cualquier tecla para salir]');
          readkey;
     End
     Else //el ELSE significa que la posicion fue diferente de -1, y por lo tanto el socio con ese DNI ya fue dado de alta
     Begin
          LEER_SOCIOS(A_Soc,R_Soc,Pos);
          CERRAR_SOCIOS(A_Soc);
          If (R_Soc.Activo=True) then //Como el DNI ya estaba dado de alta realizamos un IF para ver si se encuentra Activo, si es asi mostramos los datos
          Begin
               Repeat
                     clrscr;
                     MOSTRAR_DATOS_SOCIOS(R_Soc);
                     Gotoxy(1,2);
                     writeln('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
                     Gotoxy(45,3);
                     Writeln(' EL SOCIO YA ESTA DADO DE ALTA.');
                     Gotoxy(45,4);
                     Writeln(' a- SALIR');
                     Gotoxy(46,5);
                     Writeln ('[ ]');
                     gotoxy(47,5);
                     Opc:=readkey;
               Until (Opc='a') or (Opc='A');
          End
          Else //EL ELSE significa que el DNI del Socio ya fue dado de alta pero no esta activo, mostramos sus datos y consultamos si desean reactivarlo
          Begin
               Repeat
                     clrscr;
                     MOSTRAR_DATOS_SOCIOS(R_Soc);
                     Gotoxy(45,1);
                     Writeln('SOCIO INACTIVO - OPERACIONES A REALIZAR:');
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
                                   R_Soc.Activo:=True;
                                   ABRIR_SOCIOS(A_Soc);
                                   MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
                                   CERRAR_SOCIOS(A_Soc);
                                   clrscr;
                                   Writeln('');
                                   Writeln(' SOCIO REACTIVADO EXITOSAMENTE.');
                                   Writeln ('');
                                   TextColor(11);
                                   Writeln (' [Presione cualquier tecla para salir]');
                                   readkey;
                              End;
                     End;
               Until (Opc='a') or (Opc='A')or (Opc='1');
          End;
     End;
End;


{---------------------------------BAJA SOCIOS---------------------------------}


Procedure BAJA_SOCIOS(var A_Soc:F_Socios);
Var DNI:Integer;
    Pos:Integer;
    R_Soc:T_Socios;
BEGIN
     TextColor(11);
     writeln('                                              BAJA DE REGISTROS DE SOCIOS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL DNI: ');
     readln(DNI);
     ABRIR_SOCIOS(A_Soc);
     BUSCA_SOCIOS(A_Soc,R_Soc,DNI,Pos);
     If (Pos<>-1) then  //Para la baja, si la posicion es diferente a -1, significa que el DNI del socio esta cargado en el archivo
     Begin
          LEER_SOCIOS(A_Soc,R_Soc,Pos);
          If (R_Soc.Activo=True) then //Este IF permite saber si el DNI del socio cargado en el archivo se encuentra activo, si es asi se da de baja
          Begin
               R_Soc.Activo:=False;
               MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
               Writeln(' ');
               Writeln(' EL SOCIO FUE DADO DE BAJA EXITOSAMENTE');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               readkey;
          End
          Else //El ELSE significa que el DNI del socio ya esta cargado y ademas esta dado de baja
          Begin
               Writeln('');
               Writeln(' EL SOCIO YA ESTA DADO DE BAJA');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               Readkey;
          End;
     End
     Else
     Begin //Este ELSE indica que el DNI del socio no existe en el archivo
          Writeln ('');
          Writeln(' EL SOCIO NO EXISTE');
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          Readkey;
     End;
     CERRAR_SOCIOS(A_Soc);
END;


{---------------------------------MODIFICACION SOCIOS---------------------------------}


Procedure MODIFICACION_SOCIOS(var A_Soc:F_Socios);
Var DNI:Integer;
    Pos:Integer;
    R_Soc:T_Socios;
    Opc:char;
Begin
     TextColor(11);
     writeln('                                          MODIFICACION DE REGISTROS DE SOCIOS');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL DNI: ');
     readln(DNI);
     ABRIR_SOCIOS(A_Soc);
     BUSCA_SOCIOS(A_Soc,R_Soc,DNI,Pos);
     If (Pos<>-1) then  //Se busca si el DNI del socio esta cargado en el archivo, si la posicion es diferente a -1 significa que si
     Begin
          clrscr;
          LEER_SOCIOS(A_Soc,R_Soc,Pos);
          If (R_Soc.Activo=True) then  //Este IF permite conocer si el DNI del socio en el archivo se encuentra dado de alta, si es asi podremos modificarlo
          Begin
               Repeat
                     TextColor(15);
                     MOSTRAR_DATOS_SOCIOS(R_Soc);
                     Gotoxy(45,1);
                     Writeln(' OPERACIONES A REALIZAR');
                     writeln ('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
                     Gotoxy(45,3);
                     Writeln('1- MODIFICAR APELLIDO Y NOMBRE');
                     Gotoxy(45,4);
                     Writeln('2- MODIFICAR DIRECCION');
                     Gotoxy(45,5);
                     Writeln('3- MODIFICAR TELEFONO');
                     Gotoxy(45,6);
                     Writeln('4- MODIFICAR EMAIL');
                     Gotoxy(45,7);
                     Writeln('a- Salir');
                     Gotoxy(45,8);
                     Writeln ('[ ]');
                     gotoxy(46,8);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   clrscr;
                                   Write(' INGRESE EL NUEVO APELLIDO Y NOMBRE: '); Readln(R_Soc.Apnom);
                                   MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
                                   Writeln(' EL APELLIDO Y NOMBRE DEL SOCIO FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                          '2':Begin
                                   clrscr;
                                   Write(' INGRESE LA NUEVA DIRECCION: '); Readln(R_Soc.Direccion);
                                   MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
                                   Writeln(' LA DIRECCION DEL SOCIO FUE MODIFICADA EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                          '3':Begin
                                   clrscr;
                                   Write(' INGRESE EL NUEVO TELEFONO: '); Readln(R_Soc.Telefono);
                                   MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
                                   Writeln(' EL TELEFONO DEL SOCIO FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                          '4':Begin
                                   clrscr;
                                   Write(' INGRESE EL NUEVO EMAIL: '); Readln(R_Soc.Email);
                                   MODIFICAR_SOCIOS(A_Soc,R_Soc,Pos);
                                   Writeln(' EL EMAIL DEL SOCIO FUE MODIFICADO EXITOSAMENTE');
                                   TextColor(11);
                                   Writeln ('');
                                   Writeln (' [Presione cualquier tecla para continuar]');
                                   readkey;
                                   clrscr;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else //Este ELSE indica que el DNI del socio se encuentra en el archivo, pero no esta activo
          Begin
               Writeln('');
               Writeln(' EL SOCIO ESTA DADO DE BAJA');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               Readkey;
          End;
     End
     Else //Este ELSE indica que el DNI del socio no existe en el archivo
     Begin
          Writeln('');
          Writeln(' EL SOCIO NO EXISTE');
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          Readkey;
     End;
     CERRAR_SOCIOS(A_Soc);
End;


{---------------------------------LISTADO SOCIOS---------------------------------}


PROCEDURE LISTADO_SOCIOS(var A_Soc:F_Socios);
var Pos,pos2:Integer;
    Vector_Soc:T_Vec_Socios_Orden;
    Cantidad:Integer;
    R_Soc:T_Socios;
    I,j:Integer;
    opc: char;
Begin
     TextColor(0);
     TextBackground(7);
     clrscr;
     ABRIR_SOCIOS(A_Soc);
     Pos:=0;
     pos2:=4;
     Cantidad:=0;
     opc:=#13;
     i:=1;
     j:=1;
     While(not eof(A_Soc)) do
     begin
          LEER_SOCIOS(A_Soc, R_Soc, Pos);
          if(R_Soc.Activo=True) then
          begin
                Cantidad:=Cantidad+1;
                Vector_Soc[Cantidad].Apnom := R_Soc.Apnom;
                Vector_Soc[Cantidad].Pos := Pos;
          end;
          Pos:=Pos+1;
     end;
     BURBUJA_SOCIOS(Vector_Soc,Cantidad);
     TextColor(White);
     TextBackground(Black);
     Writeln ('                                             LISTADO ORDENADO DE SOCIOS                                                 ');
     Writeln(' ID Socio |  Nombre y Apellido           | DNI                                                                          ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(0);
          TextBackground(7);
          LEER_SOCIOS(A_Soc,R_Soc,Vector_Soc[i].pos);
          GotoXY(2,pos2);
          Writeln(R_Soc.ID_Socio);
          GotoXY(11,pos2);
          Writeln('| ',R_Soc.Apnom);
          GotoXY(42,pos2);
          Writeln('| ',R_Soc.DNI);
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
              If (opc='a') then
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
                       Writeln ('                                             LISTADO ORDENADO DE SOCIOS                                                 ');
                       Writeln(' ID Socio |  Nombre y Apellido           | DNI                                                                          ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos2:=4;
                    j:=1;
                    clrscr;
                    TextColor(White);
                    TextBackground(Black);
                    Writeln ('                                             LISTADO ORDENADO DE SOCIOS                                                 ');
                    Writeln(' ID Socio |  Nombre y Apellido           | DNI                                                                          ');
               end;
          end;
     end;
     CERRAR_SOCIOS(A_Soc);

End;


{---------------------------------CONSULTA SOCIOS---------------------------------}


Procedure CONSULTA_SOCIOS(var A_Soc:F_Socios);
var  R_Soc:T_Socios;
     DNI,pos:integer;
Begin
     TextColor(11);
     writeln('                                                   CONSULTA DE SOCIOS');
     Writeln('');
     TextColor(15);
     Write(' Ingrese el DNI del socio que desea buscar: ');
     Readln(DNI);
     Writeln ('');
     ABRIR_SOCIOS(A_Soc);
     Pos:=-1;
     BUSCA_SOCIOS(A_Soc,R_Soc,DNI,pos);
     CERRAR_SOCIOS(A_Soc);
     If (pos<>-1) then
        Begin
          ABRIR_SOCIOS(A_Soc);
          LEER_SOCIOS(A_Soc,R_Soc,pos);
          MOSTRAR_DATOS_SOCIOS(R_Soc);
          CERRAR_SOCIOS(A_Soc);
          TextColor(11);
          Writeln (' [Presione cualquier tecla para salir]');
          readkey;
        end
     Else
         Begin
              clrscr;
              Writeln ('');
              Writeln(' El socio no esta registrado.');
              Writeln('');
              TextColor(11);
              Writeln (' [Presione cualquier tecla para salir]');
              readkey;
          end;
End;



BEGIN


END.
