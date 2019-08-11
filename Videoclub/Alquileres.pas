Unit Alquileres;

INTERFACE
uses crt,General,sysutils,Socios,Peliculas;

Procedure ALTA_ALQUILERES(var A_Alq:F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);
Procedure BAJA_ALQUILERES(var A_Alq:F_Alquileres);
PROCEDURE LISTADO_ALQUILERES_2_FECHAS(var A_Alq:F_Alquileres);
Procedure CONSULTA_ALQUILER(Var A_Alq:F_Alquileres;var A_Pel:F_Peliculas;var A_Soc:F_Socios);
Procedure LISTADO_ALQUILERES(var A_Alq:F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);

implementation


{-------------------------------------BUSCA ALQUILERES-------------------------------------}


Procedure BUSCA_ALQUILERES(var A_Alq:F_Alquileres; var R_Alq:T_Alquileres; ID:Integer; var Pos:integer);
var P:integer;
Begin
     seek(A_Alq, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Alq)) and (Pos=-1) do
     Begin
          LEER_ALQUILERES(A_Alq,R_Alq,P);
          If (ID=R_Alq.ID_Alquiler) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{-------------------------------------BUSCA ALQUILERES PELICULAS-------------------------------------}


Procedure BUSCA_ALQUILERES_PELICULAS(var A_Alq:F_Alquileres; var R_Alq:T_Alquileres; ID_Pel:integer; var Pos:integer);
var P:integer;
Begin
     seek(A_Alq, 0);
     Pos:=-1;
     P:=0;
     While (Not eof (A_Alq)) and (Pos=-1) do
     Begin
          LEER_ALQUILERES(A_Alq,R_Alq,P);
          If (ID_Pel=R_Alq.ID_Pelicula) and (R_Alq.Activo = True) then
          Begin
               Pos:=P;
          End;
          P:=P+1;
     End;
End;


{-------------------------------------PEDIR DATOS ALQUILERES-------------------------------------}


Procedure PEDIR_DATOS_ALQUILERES(var R_Alq:T_Alquileres; Opc:char);      // Este procedimiento es un auxiliar para el procedimiento ALTA_ALQUILERES.
var datex:real;
    fecha:String;
BEGIN
	CASE Opc of
	 '1':begin
		  write(' Fecha entrega: '); readln(fecha);
          datex:=strtodate(fecha);
          R_Alq.Fecha_Entrega:=datex;
		end;
	 '2':begin
		  Write(' Hora: '); readln(R_Alq.Hora);
		end;
	 '3':begin
		   write(' Monto: '); readln(R_Alq.Monto_total);
	    end;
	end;
    R_Alq.Fecha_Recepcion:=0;
END;


{-------------------------------------MOSTRAR DATOS ALQUILER-------------------------------------}
{Muestra los datos ingresados de los socios. Es utilizado para MODIFICACION_ALQUILERES.}


Procedure MOSTRAR_DATOS_ALQUILERES(var R_Alq:T_Alquileres);
BEGIN
     Writeln(' DATOS DEL ALQUILER ');
     Writeln('');
     Writeln(' - ID Alquiler: ',R_Alq.ID_Alquiler);
     Writeln(' - ID Pelicula: ',R_Alq.ID_Pelicula);
     Writeln(' - Fecha de entrega: ',DateToStr(R_Alq.Fecha_entrega));
     If (R_Alq.Fecha_recepcion=0) then
        Writeln (' - Fecha de vencimiento del alquiler: ',DatetoStr(R_Alq.Fecha_entrega+dias_venc))
     else
         Writeln(' - Fecha Recepcion: ',DateToStr(R_Alq.Fecha_recepcion));
     Writeln(' - Hora: ',R_Alq.Hora);
	 Writeln(' - Monto total: $',R_Alq.Monto_total:0:2);
     Writeln('');
END;


{-------------------------------------ALTA ALQUILERES-------------------------------------}


Procedure ALTA_ALQUILERES(var A_Alq:F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);
Var
    Pos1:Integer;
    Pos2:Integer;
    Pos3:Integer;
    R_Alq:T_Alquileres;
    R_Pel:T_Peliculas;
    R_Soc:T_Socios;
    Titulo:String;
    DNI:Integer;
    Opc1:char;
Begin
     TextColor(11);
     writeln('                                            ALTA DE REGISTROS DE ALQUILERES');
     Writeln('');
     TextColor(15);
     ABRIR_ALQUILERES(A_Alq);
     ABRIR_PELICULAS(A_Pel);
     ABRIR_SOCIOS(A_Soc);
     Pos2:=-1;
     Write(' INGRESE EL TITULO DE LA PELICULA: ');
     readln(Titulo);
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,Pos2);
     If (Pos2<>-1) then
     Begin
          LEER_PELICULAS(A_Pel,R_Pel,Pos2);
          BUSCA_ALQUILERES_PELICULAS(A_Alq,R_Alq,R_Pel.ID_Pelicula,Pos3);
          If (Pos3<>-1) then
          begin
               LEER_ALQUILERES(A_Alq,R_Alq,Pos3);
               If (R_Alq.Activo=True) then
               begin
                    Writeln('');
                    Writeln(' La pelicula ya ha sido alquilada.');
                    Writeln('');
                    TextColor(11);
                    Writeln (' [Presione cualquier tecla para salir]');
                    readkey;
               end;
          End
          Else
          Begin
               Write(' INGRESE EL DNI DEL SOCIO: '); readln(DNI);
               Pos1:=-1;
               Repeat
               BUSCA_SOCIOS(A_Soc,R_Soc,DNI,Pos1);
               If (Pos1<>-1) then
               Begin
                    LEER_SOCIOS(A_Soc,R_Soc,Pos1);
                    R_Alq.ID_Socio:=R_Soc.ID_Socio;
               End
               Else
               Begin
                    Repeat
                          Writeln('');
                          Writeln (' El socio ingresado no existe.');
                          Writeln('');
                          Writeln(' Presione [Enter] para ingresar de nuevo.');
                          Opc1:=readkey;
                    Until (Opc1=#13);
                    If(Opc1=#13) then
                    Begin
                         Writeln (' ALTA DE REGISTROS DE ALQUILERES');
                         Writeln ('');
                         Write(' INGRESE EL DNI DEL SOCIO: ');
                         readln(DNI);
                    End;
               End;
               Until (Pos1<>-1);
               PEDIR_DATOS_ALQUILERES(R_Alq,'1');
               PEDIR_DATOS_ALQUILERES(R_Alq,'2');
               PEDIR_DATOS_ALQUILERES(R_Alq,'3');
               PEDIR_DATOS_ALQUILERES(R_Alq,'4');
               R_Alq.ID_Pelicula:=R_Pel.ID_Pelicula;
               R_Alq.Activo:=True;
               R_Alq.ID_Alquiler:=(Filesize(A_Alq)+1);
               GUARDAR_ALQUILERES(A_Alq,R_Alq);
               Writeln('');
               TextColor(11);
               Writeln (' [Presione cualquier tecla para salir]');
          readkey;
          End;
     end
     Else
     Begin
          Writeln ('');
          Writeln(' La pelicula no esta registrada.');
          Writeln('');
          TextColor(11);
          Writeln (' [Presione cualquier tecla para salir]');
          readkey;
     End;
     CERRAR_ALQUILERES(A_Alq);
     CERRAR_PELICULAS(A_Pel);
     CERRAR_SOCIOS(A_Soc);
End;


{-------------------------------------BAJA ALQUILERES-------------------------------------}


Procedure BAJA_ALQUILERES(var A_Alq:F_Alquileres);
Var ID_Alquiler:Integer;
    Pos:Integer;
    R_Alq:T_Alquileres;
    fechastr: string;
    fechareal: real;
BEGIN
     TextColor(11);
     writeln('                                               DEVOLUCION DE ALQUILERES');
     Writeln('');
     TextColor(15);
     Write(' INGRESE EL ID DEL ALQUILER: ');
     readln(ID_Alquiler);
     ABRIR_ALQUILERES(A_Alq);
     BUSCA_ALQUILERES(A_Alq,R_Alq,ID_Alquiler,Pos);
     If (Pos<>-1) then  //Para la baja, si la posicion es diferente a -1, significa que el ID_Alquiler esta cargado en el archivo
     Begin
          LEER_ALQUILERES(A_Alq,R_Alq,Pos);
          If (R_Alq.Activo=True) then //Este IF, permite saber si el ID_Alquiler del socio cargado en el archivo, se encuentra activo, si es asi se da de baja
          Begin
               R_Alq.Activo:=False;
               fechastr:=DateToStr(Now);
               fechareal:=strtodate(fechastr);
               R_Alq.Fecha_recepcion:=fechareal;
               MODIFICAR_ALQUILERES(A_Alq,R_Alq,Pos);
               Writeln('');
               Writeln(' EL ALQUILER FUE DADO DE BAJA EXITOSAMENTE');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               readkey;
          End
          Else //El ELSE, significa que el ID_Alquiler ya esta cargado y ademas esta dado de baja
          Begin
               Writeln('');
               Writeln(' EL ALQUILER YA ESTA DADO DE BAJA.');
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
               Readkey;
          End;
     End
     Else
     Begin //Este ELSE, indica que el ID_ALQUILER no existe en el archivo
          Writeln('');
          Writeln(' EL ALQUILER NO EXISTE.');
          TextColor(11);
          Writeln ('');
          Writeln (' [Presione cualquier tecla para salir]');
          Readkey;
     End;
     CERRAR_ALQUILERES(A_Alq);
END;


{-------------------------------------LISTADO ALQUILERES ENTRE 2 FECHAS-------------------------------------}


PROCEDURE LISTADO_ALQUILERES_2_FECHAS(var A_Alq:F_Alquileres);
VAR
	ultima,cantidad, pos2,i, j: integer;
    Vector_Alq:T_Vec_Alquileres_Orden;
    aux1,aux2: string;
    fecha1, fecha2 : real;
    R_Alq:T_Alquileres;
    opc:char;
BEGIN
    TextColor(11);
    writeln('                                        LISTADO DE ALQUILERES ENTRE DOS FECHAS');
    Writeln('');
    TextColor(15);
    Write(' Ingrese la primera fecha (dd/mm/aaaa): ');
    Readln (aux1);
    fecha1:=(StrToDate(aux1));
    Write(' Ingrese la segunda fecha (dd/mm/aaaa): ');
    Readln (aux2);
    fecha2:=(StrToDate(aux2));
    clrscr;
    TextColor(0);
    TextBackground(7);
    clrscr;
    ABRIR_ALQUILERES(A_Alq);
    ultima:=0;
    pos2:=4;
    Cantidad:=0;
    opc:=#13;
    i:=1;
    j:=1; //cantidad de dias que se le suman a la fecha de entrega para calcular vencimiento
    writeln ('');
    While(Not Eof(A_Alq)) Do // Ciclo mientras no se encuentre el final del archivo
		Begin
            LEER_ALQUILERES(A_Alq,R_Alq,ultima);
            if (R_Alq.Activo=True)  then
            Begin
                 Cantidad:=Cantidad+1;
                 Vector_Alq[Cantidad].Fecha_entrega := R_Alq.Fecha_entrega;
                 Vector_Alq[Cantidad].Pos := ultima;
            End;
            inc(ultima);
		End;
     BURBUJA_ALQUILERES(Vector_Alq,Cantidad);
     TextColor(White);
     TextBackground(Black);
     Gotoxy(1,1);
     Writeln ('                               Listado de alquileres entre ', aux1, ' y ', aux2, '                                      ');
     Writeln (' ID Alquiler | ID Pelicula | ID Socio |  Fecha Entrega  |  Fecha Vencimiento                                            ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(0);
          TextBackground(7);
          LEER_ALQUILERES(A_Alq,R_Alq,Vector_Alq[i].pos);
          if (R_Alq.Fecha_entrega >= fecha1) and (R_Alq.Fecha_entrega <= fecha2) then
           begin
             GotoXY(2,pos2);
             Writeln(R_Alq.ID_Alquiler);
             GotoXY(14,pos2);
             Writeln('| ',R_Alq.ID_Pelicula);
             GotoXY(28,pos2);
             Writeln('| ',R_Alq.ID_Socio);
             GotoXY(39,pos2);
             Writeln('| ',DateToStr(R_Alq.Fecha_entrega));
             GotoXY(57,pos2);
             Writeln('| ',DateToStr(R_Alq.Fecha_entrega+dias_venc)); //calcula fecha de vencimiento
            end;
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
                       pos2:=5;
                       clrscr;
                       TextColor(White);
                       TextBackground(Black);
                       Writeln ('                                             Listado de alquileres entre ', aux1, ' y ', aux2, ':                                              ');
                       Writeln(' ID Alquiler | ID Pelicula | ID Socio |  Fecha Entrega  |  Fecha Vencimiento                                       ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos2:=4;
                    j:=1;
                    clrscr;
                    TextColor(White);
                    TextBackground(Black);
                    Writeln ('                                             Listado de alquileres entre ', aux1, ' y ', aux2, ':                                              ');
                    Writeln(' ID Alquiler | ID Pelicula | ID Socio |  Fecha Entrega  |  Fecha Vencimiento                                       ');
                    end;
          end;
     end;

     CERRAR_ALQUILERES(A_Alq);
END;


{-------------------------------------LISTADO DE ALQUILERES ACTIVOS-------------------------------------}


Procedure LISTADO_ALQUILERES(var A_Alq:F_Alquileres; var A_Pel:F_Peliculas; var A_Soc:F_Socios);
var Pos,pos2,pos3,pos4:Integer;
    Vector_Alq:T_Vec_Alquileres_Orden;
    Cantidad:Integer;
    R_Alq:T_Alquileres;
    R_Pel:T_Peliculas;
    R_Soc:T_Socios;
    I,j:Integer;
    ID_Peli,ID_Soci:Integer;
    opc:char;
Begin
     TextColor(0);
     TextBackground(7);
     clrscr;
     ABRIR_ALQUILERES(A_Alq);
     ABRIR_PELICULAS(A_Pel);
     ABRIR_SOCIOS(A_Soc);
     Pos:=0;
     pos4:=4;
     Cantidad:=0;
     opc:=#13;
     i:=1;
     j:=1;
     While(not eof(A_Alq)) do
     begin
          LEER_ALQUILERES(A_Alq, R_Alq, Pos);
          if(R_Alq.Activo=True) then
          begin
                Cantidad:=Cantidad+1;
                Vector_Alq[Cantidad].Fecha_entrega := R_Alq.Fecha_entrega;
                Vector_Alq[Cantidad].Pos := Pos;
          end;
          Pos:=Pos+1;
     end;

     BURBUJA_ALQUILERES(Vector_Alq,Cantidad);
     TextColor(White);
     TextBackground(Black);
     Writeln ('                                         Listado de alquileres activos                                                  ');
     Writeln ('  ID  | Socio que realizo alquiler |  Fecha Entrega  |  Fecha Vencimiento | Titulo                                       ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          LEER_ALQUILERES(A_Alq,R_Alq,Vector_Alq[I].Pos);
          ID_Peli:=R_Alq.ID_Pelicula;
          BUSCA_PELICULAS_ID(A_Pel,R_Pel,ID_Peli,pos2);
          LEER_PELICULAS(A_Pel,R_Pel,pos2);
          ID_Soci:=R_Alq.ID_Socio;
          BUSCA_SOCIOS_ID(A_Soc,R_Soc,ID_Soci,pos3);
          LEER_SOCIOS(A_Soc,R_Soc,pos3);
          TextColor(0);
          TextBackground(7);
          GotoXY(1,pos4);
          Writeln('  ',R_Alq.ID_Alquiler);
          GotoXY(5,pos4);
          Writeln('  | ',R_Soc.Apnom);
          GotoXY(34,pos4);
          Writeln('  | ',DateToStr(R_Alq.Fecha_Entrega));
          GotoXY(54,pos4);
          Writeln('| ',DateToStr(R_Alq.Fecha_entrega+dias_venc)); ///calcula fecha de vencimiento
          GotoXY(73,pos4);
          Writeln('  | ',R_Pel.Titulo);
          inc(pos4);
          inc(i);
          inc(j);
          If ((pos4=28) or (i=cantidad+1)) then
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
                       pos4:=4;
                       clrscr;
                       TextColor(White);
                       TextBackground(Black);
                       Writeln ('                                         Listado de alquileres activos                                                  ');
                       Writeln ('  ID  | Socio que realizo alquiler |  Fecha Entrega  |  Fecha Vencimiento | Titulo                                       ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos4:=4;
                    j:=1;
                    clrscr;
                    TextColor(White);
                    TextBackground(Black);
                    Writeln ('                                         Listado de alquileres activos                                                  ');
                    Writeln('  ID  | Socio que realizo alquiler |  Fecha Entrega  |  Fecha Vencimiento | Titulo                                       ');

               end;
          end;
     end;
     CERRAR_ALQUILERES(A_Alq);
     CERRAR_PELICULAS(A_Pel);
     CERRAR_SOCIOS(A_Soc);
End;


{-------------------------------------CONSULTA ALQUILER POR PELICULA-------------------------------------}


Procedure CONSULTA_ALQUILER(Var A_Alq:F_Alquileres;var A_Pel:F_Peliculas;var A_Soc:F_Socios);
Var Titulo: String;
    pos,pos2,pos3:integer;
    R_Soc:T_Socios;
    R_Pel:T_Peliculas;
    R_Alq:T_Alquileres;
Begin
     TextColor(11);
     writeln('                                            DATOS DE ALQUILER POR PELICULA');
     Writeln('');
     TextColor(15);
     Write(' Ingrese la pelicula que desea buscar: ');
     Readln(Titulo);
     Writeln ('');
     ABRIR_SOCIOS(A_Soc);
     ABRIR_ALQUILERES(A_Alq);
     ABRIR_PELICULAS(A_Pel);
     Pos:=-1;
     BUSCA_PELICULAS(A_Pel,R_Pel,Titulo,pos);
     If (pos<>-1) then
     Begin
          LEER_PELICULAS(A_Pel,R_Pel,pos);
          BUSCA_ALQUILERES_PELICULAS(A_Alq,R_Alq,R_Pel.ID_Pelicula,pos2);
          If (pos2<>-1) then
          Begin
               LEER_ALQUILERES(A_Alq,R_Alq,pos2);
               BUSCA_SOCIOS_ID(A_Soc,R_Soc,R_Alq.ID_Socio,pos3);
               LEER_SOCIOS(A_Soc,R_Soc,pos3);
               MOSTRAR_DATOS_SOCIOS(R_Soc);
               MOSTRAR_DATOS_ALQUILERES(R_Alq);
               TextColor(11);
               Writeln ('');
               Writeln (' [Presione cualquier tecla para salir]');
           end
           Else
           Begin
                Writeln(' La pelicula no ha sido alquilada.');
                TextColor(11);
                Writeln ('');
                Writeln (' [Presione cualquier tecla para salir]');
           End;
    End
    Else
    Begin
         Writeln(' La pelicula no existe.');
         TextColor(11);
         Writeln ('');
         Writeln (' [Presione cualquier tecla para salir]');
    End;
    Readkey;
    CERRAR_ALQUILERES(A_Alq);
    CERRAR_SOCIOS(A_Soc);
    CERRAR_PELICULAS(A_Pel);
End;




BEGIN


END.
