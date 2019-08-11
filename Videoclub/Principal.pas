program Principal;

uses crt,Socios,General,Peliculas,Alquileres;

type
t_menu=array[1..10] of string;

var opcion: char;
	izq,izq2:integer;
	menu:t_menu;
    A_Soc:F_Socios;
    A_Pel:F_Peliculas;
    A_Alq:F_Alquileres;


{---------------------------------MENSAJE DE INICIALIZAR---------------------------------}


Procedure mensaje;
begin
     gotoxy(izq+4,24);
     textcolor (8);
     writeln ('- Si es la primera vez que se utiliza el programa, presiona i para');
     gotoxy (izq+4,25);
     writeln ('inicializar los archivos por primera y unica vez.');
end;


{---------------------------------TEXTO 'VIDEOCLUB'---------------------------------}


procedure videoclub;
begin
     textcolor (3);
     gotoxy (izq+15,16);
     writeln('        _     _                 _       _');
     gotoxy (izq+15,17);
     writeln('       (_)   | |               | |     | |');
     gotoxy (izq+15,18);
     writeln(' __   ___  __| | ___  ___   ___| |_   _| |__');
     gotoxy (izq+15,19);
     writeln(' \ \ / / |/ _` |/ _ \/ _ \ / __| | | | |  _ \');
     gotoxy (izq+15,20);
     writeln('  \ V /| | (_| |  __/ (_) | (__| | |_| | |_) |');
     gotoxy (izq+15,21);
     writeln('   \_/ |_|\__,_|\___|\___/ \___|_|\__,_|_.__/');
end;


{---------------------------------CUADRO PRINCIPAL---------------------------------}


procedure cuadro;
     begin
        textbackground(0);
		clrscr;
		textcolor (15);
		gotoxy(izq,3);
		writeln ('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
		gotoxy(izq,4);
		writeln ('บ                                                                           บ');
		gotoxy(izq,5);
		writeln ('ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน');
		gotoxy(izq,6);
		writeln ('บ                                                                           บ');
		gotoxy(izq,7);
		writeln ('บ                                                                           บ');
		gotoxy(izq,8);
		writeln ('บ                                                                           บ');
		gotoxy(izq,9);
		writeln ('บ                                                                           บ');
		gotoxy(izq,10);
		writeln ('บ                                                                           บ');
		gotoxy(izq,11);
		writeln ('บ                                                                           บ');
		gotoxy(izq,12);
		writeln ('บ                                                                           บ');
		gotoxy(izq,13);
		writeln ('บ                                                                           บ');
		gotoxy(izq,14);
		writeln ('บ                                                                           บ');
		gotoxy(izq,15);
		writeln ('บ                                                                           บ');
		gotoxy(izq,16);
		writeln ('บ                                                                           บ');
		gotoxy(izq,17);
		writeln ('บ                                                                           บ');
		gotoxy(izq,18);
		writeln ('บ                                                                           บ');
		gotoxy(izq,19);
		writeln ('บ                                                                           บ');
		gotoxy(izq,20);
		writeln ('บ                                                                           บ');
        gotoxy(izq,21);
		writeln ('บ                                                                           บ');
		gotoxy(izq,22);
  		writeln ('บ                                                                           บ');
		gotoxy(izq,23);
  		writeln ('บ                                                                           บ');
		gotoxy(izq,24);
  		writeln ('บ                                                                           บ');
		gotoxy(izq,25);
  		writeln ('บ                                                                           บ');
		gotoxy(izq,26);
  		writeln ('บ                                                                           บ');
		gotoxy(izq,27);
  		writeln ('บ   (Esc) -  VOLVER/SALIR.                                                  บ');
		gotoxy(izq,28);
		writeln ('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ[ ]อผ');
		normvideo;
     end;


{---------------------------------CUADRO SECUNDARIO---------------------------------}


procedure cuadro2;
  begin
        textbackground(0);  //blanco
        clrscr;
   		textcolor (15);
  		gotoxy(izq2,2);
		writeln ('                                                                                                                   ');
        gotoxy(izq2,3);
        writeln ('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
        gotoxy(izq2,4);
        writeln ('                                                                                                                   ');
		gotoxy(izq2,5);
        writeln ('                                                                                                                   ');
		gotoxy(izq2,6);
        writeln ('                                                                                                                   ');
		gotoxy(izq2,7);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,8);
        writeln ('                                                                                                                   ');
		gotoxy(izq2,9);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,10);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,11);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,12);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,13);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,14);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,15);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,16);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,17);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,18);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,19);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,20);
		writeln ('                                                                                                                   ');
        gotoxy(izq2,21);
		writeln ('                                                                                                                   ');
		gotoxy(izq2,22);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,23);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,24);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,25);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,26);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,27);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,28);
  		writeln ('                                                                                                                   ');
		gotoxy(izq2,29);
		writeln ('ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');
		normvideo;
  end;


{---------------------------------MENU PRINCIPAL---------------------------------}


procedure Mostrar_menu(par_menu:t_menu; titulo:string; ulti:integer);
var x:integer;

  begin
		gotoxy(izq+4,4);
        textcolor (11);
        textbackground(0);
		Writeln (titulo);
        textcolor (15);
        textbackground(0);
		for x:=1 to ulti do
			begin
				gotoxy(izq+4,(x*2)+6);
				Writeln (x,' - '+par_menu[x]);
			end;
		REPEAT
			gotoxy(izq+73,28);  //CURSOR.
			opcion := readkey;
		until ((opcion='x') or (opcion='X') or (opcion='i')  or ((ord(opcion)-48) <= ulti)  or (opcion=#27));
              {Hasta que el usuario presione // Para inicializar //   Se utiliza el c๓digo     // Esc para salir.
              'X' o 'x' para salir.                                ASCII para leer nro. de opc}
  end;


{------------------------------------------------------------------------------}


BEGIN
	izq:=22;
    izq2:=0;
	repeat
	cuadro;
    mensaje;
    videoclub;
	menu[1]:='Socios.';
    menu[2]:='Peliculas.';
    menu[3]:='Alquileres.';
    Mostrar_menu(menu,'                                MENU',3);
	case opcion of
		'1':
		begin
			repeat
				cuadro();
				menu[1]:='Alta.';
				menu[2]:='Modificacion.';
				menu[3]:='Baja.';
                menu[4]:='Listado ordenado de socios.';
                menu[5]:='Consulta socios.';
				Mostrar_menu(menu,'                               SOCIOS',5);
				case opcion of
					'1':begin
                       cuadro2();
                       gotoxy (1,1);
			           ALTA_SOCIOS(A_Soc);
					end;
					'2':begin
                        cuadro2();
                        gotoxy (1,1);
			            MODIFICACION_SOCIOS(A_Soc);
					end;
					'3':begin
                        cuadro2();
                        gotoxy (1,1);
			            BAJA_SOCIOS(A_Soc);
                    end;
                    '4':begin
                        LISTADO_SOCIOS(A_Soc);
					end;
                    '5':begin
                        cuadro2();
                        gotoxy (1,1);
                        CONSULTA_SOCIOS(A_Soc);
					end;
				end;
			until (opcion='x') or (opcion='X1') or (opcion=#27);
			opcion:=' ';
		end;
		'2':
		begin
			repeat
				cuadro();
				menu[1]:='Alta.';
				menu[2]:='Modificacion.';
				menu[3]:='Baja.';
                menu[4]:='Listado ordenado de peliculas.';
                menu[5]:='Consulta peliculas.';
				Mostrar_menu(menu,'                              PELICULAS',5);
    case opcion of
					'1':begin
                    cuadro2();
                    gotoxy (1,1);
                    ALTA_PELICULAS(A_Pel);
					end;
					'2':begin
                    cuadro2();
                    gotoxy (1,1);
                    MODIFICACION_PELICULAS(A_Pel);
					end;
					'3':begin
                    cuadro2();
                    gotoxy (1,1);
                    BAJA_PELICULAS(A_Pel);
					end;
                    '4':begin
                    LISTADO_PELICULAS(A_Pel);
                    end;
                    '5':begin
                    cuadro2();
                    gotoxy (1,1);
                    CONSULTA_PELICULAS(A_Pel);
                    end;
				end;
			until (opcion='x') or (opcion='X')  or (opcion=#27);
			opcion:=' ';
		end;
		'3':begin
              repeat
				cuadro();
				menu[1]:='Alta.';
				menu[2]:='Recepcion/Devolucion.';
                menu[3]:='Listado de alquileres entre dos fechas.';
                menu[4]:='Listado de alquileres activos.';
                menu[5]:='Datos de alquiler por pelicula.';

				Mostrar_menu(menu,'                              ALQUILERES',5);
                case opcion of
                    '1':begin
                        cuadro2();
                        gotoxy (1,1);
                        ALTA_ALQUILERES(A_Alq,A_Pel,A_Soc);
					end;
					'2':begin
                        cuadro2();
                        gotoxy (1,1);
                        BAJA_ALQUILERES(A_Alq);
					end;
					'3':begin
                        cuadro2();
                        gotoxy (1,1);
                        LISTADO_ALQUILERES_2_FECHAS(A_Alq);
					end;
                    '4':begin
                        LISTADO_ALQUILERES(A_Alq,A_Pel,A_Soc);
					end;
                    '5':begin
                    cuadro2();
                    gotoxy (1,1);
                    CONSULTA_ALQUILER(A_Alq,A_Pel,A_Soc);
                    end;
				end;
			until (opcion='x') or (opcion='X')  or (opcion=#27);
			opcion:=' ';
		end;
		'i':begin
	         inicializa_archivos(A_Alq,A_Pel,A_Soc);
		end;
	
	end;
		until (opcion='x') or (opcion='X')  or (opcion=#27);
END.

