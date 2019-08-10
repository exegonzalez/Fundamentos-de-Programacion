Unit Menu;

interface

Uses Crt,Unit_Aeropuerto,Unit_Pasajero, Unit_LineaAerea,Unit_Venta,Unit_Reserva,Unit_Vuelo;

Procedure Inicio;
Procedure Cuadro_Alta;
Procedure Cuadro_Baja;
Procedure Cuadro_Modificacion;
Procedure Cuadro_Reactivacion;
Procedure Fondo;
Procedure Menu_Aeropuertos;
Procedure Menu_Vuelos;
Procedure Menu_Reservas;
Procedure Menu_Pasajeros;
Procedure Menu_Ventas;
Procedure Menu_Lineas;
Procedure Menu_Busqueda;
Procedure Alta_Aeropuerto(var A_Aero:Arch_Aeropuerto);
Procedure Baja_Aeropuerto(Var A_Aero:Arch_Aeropuerto);
Procedure Modificar_Aeropuerto(Var A_Aero:Arch_Aeropuerto);
Procedure Consulta_Aeropuerto(Var A_Aero:Arch_Aeropuerto);
Procedure Alta_Pasajero(var A_Pasaj:Arch_Pasajero);
Procedure Baja_Pasajero(var A_Pasaj:Arch_Pasajero);
Procedure Modificar_Pasajero(var A_Pasaj:Arch_Pasajero);
Procedure Consulta_Pasajero(var A_Pasaj:Arch_Pasajero);
Procedure Alta_Linea(var A_LA:Arch_LineaAerea);
Procedure Baja_Linea(var A_LA:Arch_LineaAerea);
Procedure Modificar_Linea(var A_LA:Arch_LineaAerea);
Procedure Consulta_Linea(var A_LA:Arch_LineaAerea);
Procedure Alta_Venta(var A_Ven:Arch_Venta;var A_Pasaj:Arch_Pasajero);
Procedure Baja_Venta(var A_Ven:Arch_Venta);
Procedure Modificar_Venta(var A_Ven:Arch_Venta);
Procedure Consulta_Venta(var A_Ven:Arch_Venta;var A_Pasaj:Arch_Pasajero);
Procedure Alta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
Procedure Baja_Vuelo(Var A_Vue:Arch_Vuelo);
Procedure Modificar_Vuelo(var A_Vue:Arch_Vuelo);
Procedure Alta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
Procedure Consulta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
Procedure Baja_Reserva(Var A_Res:Arch_Reserva);
Procedure Modificar_Reserva(var A_Res:Arch_Reserva);
Procedure Consulta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo);
Procedure Fecha_Vuelo_Aeropuerto(Var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto);
Procedure Fechas_Vuelo_Aerolinea(Var A_Vue:Arch_Vuelo;var A_LA:Arch_LineaAerea);
Procedure Pasajero_Vuelo(Var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo;var A_Pasaj:Arch_Pasajero);
procedure M_Principal();

implementation

////////////////////////////////////////// PROCEDIMIENTO FONDO //////////////////////////////////
Procedure Fondo();
Begin
     TextColor(2);
     GotoXY(13,3);
     Writeln('##::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::##');
     GotoXY(13,4);
     Writeln('::                                                                                         ::');
     GotoXY(13,5);
     Writeln('##                                                                                         ##');
     GotoXY(13,6);
     Writeln('::                                                                                         ::');
     GotoXY(13,7);
     Writeln('##::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::##');
     GotoXY(13,8);
     Writeln('::                                                                                         ::');
     GotoXY(13,9);
     Writeln('##                                                                                         ##');
     GotoXY(13,10);
     Writeln('::                                                                                         ::');
     GotoXY(13,11);
     Writeln('##                                                                                         ##');
     GotoXY(13,12);
     Writeln('::                                                                                         ::');
     GotoXY(13,13);
     Writeln('##                                                                                         ##');
     GotoXY(13,14);
     Writeln('::                                                                                         ::');
     GotoXY(13,15);
     Writeln('##                                                                                         ##');
     GotoXY(13,16);
     Writeln('::                                                                                         ::');
     GotoXY(13,17);
     Writeln('##                                                                                         ##');
     GotoXY(13,18);
     Writeln('::                                                                                         ::');
     GotoXY(13,19);
     Writeln('##                                                                                         ##');
     GotoXY(13,20);
     Writeln('::                                                                                         ::');
     GotoXY(13,21);
     Writeln('##                                                                                         ##');
     GotoXY(13,22);
     Writeln('::                                                                                         ::');
     GotoXY(13,23);
     Writeln('##                                                                                         ##');
     GotoXY(13,24);
     Writeln('::                                                                                         ::');
     GotoXY(13,25);
     Writeln('##                                                                                         ##');
     GotoXY(13,26);
     Writeln('::                                                                                         ::');
     GotoXY(13,27);
     Writeln('##::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::#::##');
     TextColor(1);
     TextBackground(7);
End;

/////////////////////////////////////////////////////////////// INICIO ///////////////////////////////////////////////////////////////////

Procedure Inicio();
var Opc:char;
begin
     Clrscr;
     TextColor(10);
     TextBackground(Black);
     GotoXY(4,4);
     Writeln(':::::::::  ::::::::::: :::::::::: ::::    ::: :::     ::: :::::::::: ::::    ::: ::::::::::: :::::::::   ::::::::');
     GotoXY(4,5);
     Writeln(':+:    :+:     :+:     :+:        :+:+:   :+: :+:     :+: :+:        :+:+:   :+:     :+:     :+:    :+: :+:    :+:');
     GotoXY(4,6);
     Writeln('+:+    +:+     +:+     +:+        :+:+:+  +:+ +:+     +:+ +:+        :+:+:+  +:+     +:+     +:+    +:+ +:+    +:+');
     GotoXY(4,7);
     Writeln('+#++:++#+      +#+     +#++:++#   +#+ +:+ +#+ +#+     +:+ +#++:++#   +#+ +:+ +#+     +#+     +#+    +:+ +#+    +:+');
     GotoXY(4,8);
     Writeln('+#+    +#+     +#+     +#+        +#+  +#+#+#  +#+   +#+  +#+        +#+  +#+#+#     +#+     +#+    +#+ +#+    +#+');
     GotoXY(4,9);
     Writeln('#+#    #+#     #+#     #+#        #+#   #+#+#   #+#+#+#   #+#        #+#   #+#+#     #+#     #+#    #+# #+#    #+#');
     GotoXY(4,10);
     Writeln('#########  ########### ########## ###    ####     ###     ########## ###    #### ########### #########   ########');
     GotoXY(5,13);
     Writeln('                                                     |                                                            ');
     GotoXY(5,14);
     Writeln('                                               --====|====--                                                      ');
     GotoXY(5,15);
     Writeln('                                                     |                                                            ');
     GotoXY(5,16);
     Writeln('                                                 .-"""""-.                                                        ');
     GotoXY(5,17);
     Writeln('                                                `','_________','`                                                    ');
     GotoXY(5,18);
     Writeln('                                              /_/_|__|__|_\_\                                                     ');
     GotoXY(5,19);
     Writeln('                                              ;','-._       _.-',';                                                  ');
     GotoXY(5,20);
     Writeln('                        ,--------------------|    `-. .-`    |--------------------,                               ');
     GotoXY(5,21);
     Writeln('                         ``""--..__    ___   ;       "       ;   ___    __..--""``                                ');
     GotoXY(5,22);
     Writeln('                                   `"-// \\.._\             /_..// \\-"`                                          ');
     GotoXY(5,23);
     Writeln('                                      \\_//    `._       _.`    \\_//                                             ');
     GotoXY(5,24);
     Writeln('                                       `"`        ``---``        `"`                                              ');
     TextColor(White);
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     Opc:=Readkey;
     If (Opc=#13) then
     Begin
          M_Principal;
     End;
     Readkey;
End;

///////////////////////////////////////// PROCEDIMIENTOS CUADROS /////////////////////////////////

Procedure Cuadro_Alta;
Begin
     TextColor(White);
     TextBackground(Blue);
     GotoXY(30,9);
     Writeln('                                              ');
     GotoXY(30,10);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,11);
     Writeln(' /\                                        /\ ');
     GotoXY(30,12);
     Writeln(' /\                                        /\ ');
     GotoXY(30,13);
     Writeln(' /\   SE HA REALIZADO CON EXITO EL ALTA!   /\ ');
     GotoXY(30,14);
     Writeln(' /\                                        /\ ');
     GotoXY(30,15);
     Writeln(' /\                                        /\ ');
     GotoXY(30,16);
     Writeln(' /\ Enter-Para continuar                   /\ ');
     GotoXY(30,17);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,18);
     Writeln('                                              ');
     Readkey;
     TextColor(White);
     TextBackground(Black);
End;

Procedure Cuadro_Baja;
Begin
     TextColor(White);
     TextBackground(Blue);
     GotoXY(30,9);
     Writeln('                                              ');
     GotoXY(30,10);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,11);
     Writeln(' /\                                        /\ ');
     GotoXY(30,12);
     Writeln(' /\                                        /\ ');
     GotoXY(30,13);
     Writeln(' /\   SE HA REALIZADO CON EXITO LA BAJA!   /\ ');
     GotoXY(30,14);
     Writeln(' /\                                        /\ ');
     GotoXY(30,15);
     Writeln(' /\                                        /\ ');
     GotoXY(30,16);
     Writeln(' /\ Enter-Para continuar                   /\ ');
     GotoXY(30,17);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,18);
     Writeln('                                              ');;
     Readkey;
     TextColor(White);
     TextBackground(Black);
End;

Procedure Cuadro_Modificacion;
Begin
     TextColor(White);
     TextBackground(Blue);
     GotoXY(30,9);
     Writeln('                                                      ');
     GotoXY(30,10);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,11);
     Writeln(' /\                                                /\ ');
     GotoXY(30,12);
     Writeln(' /\                                                /\ ');
     GotoXY(30,13);
     Writeln(' /\   SE HA REALIZADO CON EXITO LA MODIFICACION!   /\ ');
     GotoXY(30,14);
     Writeln(' /\                                                /\ ');
     GotoXY(30,15);
     Writeln(' /\                                                /\ ');
     GotoXY(30,16);
     Writeln(' /\ Enter-Para continuar                           /\ ');
     GotoXY(30,17);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,18);
     Writeln('                                                      ');
     Readkey;
     TextColor(White);
     TextBackground(Black);
End;

Procedure Cuadro_Reactivacion;
Begin
     TextColor(White);
     TextBackground(Blue);
     GotoXY(30,9);
     Writeln('                                                      ');
     GotoXY(30,10);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,11);
     Writeln(' /\                                                /\ ');
     GotoXY(30,12);
     Writeln(' /\                                                /\ ');
     GotoXY(30,13);
     Writeln(' /\   SE HA REALIZADO CON EXITO LA REACTIVACION!   /\ ');
     GotoXY(30,14);
     Writeln(' /\                                                /\ ');
     GotoXY(30,15);
     Writeln(' /\                                                /\ ');
     GotoXY(30,16);
     Writeln(' /\ Enter-Para continuar                           /\ ');
     GotoXY(30,17);
     Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
     GotoXY(30,18);
     Writeln('                                                      ');
     Readkey;
     TextColor(White);
     TextBackground(Black);
End;

///////////////////////////////////////// PROCEDIMIENTOS VUELOS ///////////////////////////////////

Procedure Alta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
var Escala:string;
    Opc1,Opc2,Opc3:char;   //Opc;
    C,Pos1,Pos2,Pos3,j,x,s:integer;  //Bus,Pos,i;
    R_Vue:T_Vuelo;
    R_Aero:T_Aeropuerto;
    R_LA:T_LineaAerea;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(26,5);
//
     Abrir_VU(A_Vue);
     Writeln('  Ingrese los datos para realizar el alta del vuelo ');
     GotoXY(15,9);
     Writeln('  Aeropuerto de origen:');
     Pos1:=-1;
     Repeat
           GotoXY(38,9);
           Readln(R_Vue.Origen);
           Abrir_A(A_Aero);
           Busqueda_A(A_Aero,Pos1,R_Vue.Origen,R_Aero);
           Cerrar_A(A_Aero);
           If (Pos1<>-1) then
           Begin
                Abrir_A(A_Aero);
                R_Vue.Origen:=R_Aero.ID_Aeropuerto;
                Cerrar_A(A_Aero);
                GotoXY(16,10);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(16,10);
                Writeln(' Esc: ingresar de nuevo | Enter: dar de alta');
                Opc1:=readkey;
                Until (Opc1=#27) or (Opc1=#13);
                If(Opc1=#27) then
                Begin
                     GotoXY(15,10);
                     Writeln('                                                      ');
                     GotoXY(38,9);
                     Writeln('                                   ');
                End
                Else
                Begin
                     Alta_Aeropuerto(A_Aero);
                     Abrir_A(A_Aero);
                     Busqueda_A(A_Aero,Pos1,R_Vue.Origen,R_Aero);
                     Cerrar_A(A_Aero);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,9);
                     Writeln('  Aeropuerto de origen:');
                     GotoXY(38,9);
                     Writeln('                                     ');
                End;
          End;
     Until (Pos1<>-1);
     GotoXY(15,11);
     Writeln('  Fecha de partida(DD/MM/AAAA): ');
     GotoXY(46,11);
     Readln(R_Vue.FechaP);
     GotoXY(15,12);
     Writeln('  Hora de partida(HH:MM):');
     GotoXY(40,12);
     Readln(R_Vue.HoraP);
     GotoXY(15,13);
     Writeln('  Aeropuerto de destino:');
     Pos2:=-1;
     Repeat
           GotoXY(39,13);
           Readln(R_Vue.Destino);
           Abrir_A(A_Aero);
           Busqueda_A(A_Aero,Pos2,R_Vue.Destino,R_Aero);
           Cerrar_A(A_Aero);
           If (Pos2<>-1) then
           Begin
                Abrir_A(A_Aero);
                R_Vue.Destino:=R_Aero.ID_Aeropuerto;
                Cerrar_A(A_Aero);
                GotoXY(16,14);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(16,14);
                Writeln(' Esc: ingresar de nuevo | Enter: dar de alta');
                Opc2:=readkey;
                Until (Opc2=#27) or (Opc2=#13);
                If(Opc2=#27) then
                Begin
                     GotoXY(15,14);
                     Writeln('                                                          ');
                     GotoXY(39,13);
                     Writeln('                                   ');
                End
                Else
                Begin
                     Alta_Aeropuerto(A_Aero);
                     Abrir_A(A_Aero);
                     Busqueda_A(A_Aero,Pos2,R_Vue.Destino,R_Aero);
                     Cerrar_A(A_Aero);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,13);
                     Writeln('  Aeropuerto de destino:');
                     GotoXY(39,13);
                     Writeln('                                  ');
                End;
          End;
     Until (Pos2<>-1);
     GotoXY(15,15);
     Writeln('  Fecha de llegada(DD/MM/AAAA): ');
     GotoXY(46,15);
     Readln(R_Vue.FechaL);
     GotoXY(15,16);
     Writeln('  Hora de llegada(HH:MM): ');
     GotoXY(40,16);
     Readln(R_Vue.HoraL);
     GotoXY(15,17);
     Writeln('  Escalas: ');
     GotoXY(25,17);
     Readln(Escala);
     x:=17;
     C:=0;
     for j:=1 to 3 do
         R_Vue.Escalas[j]:='';
     While (Escala<>'') and (C<=3) do
     begin
          Inc(C);
          R_Vue.Escalas[C]:=Escala;
          Inc(x);
          GotoXY(15,x);
          If (C<3) then
          Begin
               Writeln('  Ingrese otra escala:');
               GotoXY(37,x);
               Readln(Escala);
          end
          Else
          Begin
               x:=19;
          End;
     End;
     inc(x);
     GotoXY(15,x);
     s:=x;
     Writeln('  Linea aerea:');
     Pos3:=-1;
     inc(x);
     Repeat
           GotoXY(29,s);
           Readln(R_Vue.ID_LineaAerea);
           Abrir_LA(A_LA);
           Busqueda_LA(A_LA,R_Vue.ID_LineaAerea,Pos3,R_LA);
           Cerrar_LA(A_LA);
           If (Pos3<>-1) then
           Begin
                Abrir_LA(A_LA);
                R_Vue.ID_LineaAerea:=R_LA.ID_LineaAerea;
                Cerrar_LA(A_LA);
                GotoXY(16,x);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(16,x);
                Writeln(' Esc: ingresar de nuevo | Enter: dar de alta');
                Opc3:=readkey;
                Until (Opc3=#27) or (Opc3=#13);
                If(Opc3=#27) then
                Begin
                     GotoXY(15,x);
                     Writeln('                                                      ');
                     GotoXY(29,s);
                     Writeln('                                   ');
                End
                Else
                Begin
                     Alta_Linea(A_LA);
                     Abrir_LA(A_LA);
                     Busqueda_LA(A_LA,R_Vue.ID_LineaAerea,Pos3,R_LA);
                     Cerrar_LA(A_LA);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,s);
                     Writeln('  Linea aerea:');
                     GotoXY(29,s);
                     Writeln('                                ');
                End;
          End;
     Until (Pos3<>-1);
     inc(x);
     GotoXY(15,x);
     Writeln('  Cantidad de pasajeros:');
     GotoXY(39,x);
     Readln(R_Vue.Cant_Pasajeros);
     inc(x);
     GotoXY(15,x);
     Writeln('  Estado:');
     GotoXY(24,x);
     Readln(R_Vue.Estado);
     R_Vue.Activo:=True;
     R_Vue.ID_Vuelo:=(Filesize(A_Vue)+1);
     Guardar_VU(A_Vue,R_Vue);
     Cerrar_VU(A_Vue);
     Cuadro_Alta;
End;

Procedure Baja_Vuelo(Var A_Vue:Arch_Vuelo);
Var Bus:integer;
    Pos:integer;
    R_Vue:T_Vuelo;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el ID del vuelo que desea dar de baja:');
     GotoXY(63,5);
     Readln(Bus);
     Abrir_VU(A_Vue);
     Busqueda_VU(A_Vue,Bus,Pos,R_Vue);
     If (Pos<>-1) then
     Begin
          Leer_VU(A_Vue,R_Vue,Pos);
          If (R_Vue.Activo=True) then
          Begin
               R_Vue.Activo:=False;
               Modificar_VU(A_Vue,Pos,R_Vue);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El vuelo ya esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El vuelo no existe');
          Readkey;
     End;
     Cerrar_VU(A_Vue);
End;

Procedure Modificar_Vuelo(var A_Vue:Arch_Vuelo);
Var Bus,x,s:integer;
    Pos,i:integer;
    R_Vue:T_Vuelo;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el ID del vuelo que desea modificar:');
     GotoXY(61,5);
     Readln(Bus);
     Abrir_VU(A_Vue);
     Busqueda_VU(A_Vue,Bus,Pos,R_Vue);
     If (Pos<>-1) then
     Begin
          Leer_VU(A_Vue,R_Vue,Pos);
          If (R_Vue.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El vuelo esta dado de alta');
                     GotoXY(15,8);
                     Writeln('  Sus datos son:');
                     GotoXY(31,9);
                     Writeln('> ID Vuelo: ',R_Vue.ID_Vuelo);
                     GotoXY(31,10);
                     Writeln('> ID Linea aerea: ',R_Vue.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Origen: ',R_Vue.Origen);
                     GotoXY(31,12);
                     Writeln('> Fecha de partida: ',R_Vue.FechaP);
                     GotoXY(31,13);
                     Writeln('> Hora de partida: ',R_Vue.HoraP);
                     GotoXY(31,14);
                     Writeln('> Destino: ',R_Vue.Destino);
                     GotoXY(31,15);
                     Writeln('> Fecha de llegada: ',R_Vue.FechaL);
                     GotoXY(31,16);
                     Writeln('> Hora de llegada: ',R_Vue.HoraL);
                     x:=16;
                     For i:= 1 to 3 do
                     Begin
                          If (R_Vue.Escalas[i]<>'') then
                          Begin
                               Inc(x);
                               GotoXY(31,x);
                               Writeln('> Escalas: ',R_Vue.Escalas[i]);
                          End;
                     End;
                     inc(x);
                     GotoXY(31,x);
                     Writeln('> Cantidad de pasajeros: ',R_Vue.Cant_Pasajeros);
                     inc(x);
                     GotoXY(31,x);
                     Writeln('> Estado: ',R_Vue.Estado);
                     x:=x+2;
                     s:=x;
                     GotoXY(15,x);
                     Writeln('  Elija el campo que desea modificar:');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> 1- Cantidad de pasajeros');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> 2- Estado');
                     inc(x);
                     GotoXY(52,x);
                     Writeln('--> a- Salir');
                     GotoXY(52,s);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Cantidad de pasajeros:');
                                   GotoXY(39,9);
                                   Readln(R_Vue.Cant_Pasajeros);
                                   Modificar_VU(A_Vue,Pos,R_Vue);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Estado:');
                                   GotoXY(24,9);
                                   Readln(R_Vue.Estado);
                                   Modificar_VU(A_Vue,Pos,R_Vue);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El vuelo esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El vuelo no existe');
          Readkey;
     End;
     Cerrar_VU(A_Vue);
End;

Procedure Consulta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
Var pos,pos2,cantidad, i,j,c,x,bus,s:integer; Vec:T_Vec_Vue;
    R_Vue:T_Vuelo;   opc:char;
Begin
     Cargar_VU(A_Vue,Vec, cantidad);
     Burbuja_VU(Vec, cantidad);
     Abrir_VU(A_Vue);
     Abrir_A(A_Aero);
     Abrir_LA(A_LA);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     gotoxy(1,1);
     TextColor(1);
     TextBackground(7);
     Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(1);
          TextBackground(7);
          Leer_VU(A_Vue,R_Vue,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_Vue.ID_Vuelo);
          GotoXY(11,pos);
          Writeln('| ',R_Vue.ID_LineaAerea);
          GotoXY(19,pos);
          Writeln('| ',R_Vue.Origen);
          GotoXY(28,pos);
          Writeln('| ',R_Vue.FechaP);
          GotoXY(41,pos);
          Writeln('| ',R_Vue.HoraP);
          GotoXY(51,pos);
          Writeln('| ',R_Vue.Destino);
          GotoXY(61,pos);
          Writeln('| ',R_Vue.FechaL);
          GotoXY(74,pos);
          Writeln('| ',R_Vue.HoraL);
          GotoXY(84,pos);
          c:=0;
          For j:= 1 to 3 do
          Begin
               If (R_Vue.Escalas[j]<>'') then
               Begin
                    inc(c);
               End;
          End;
          Writeln('| ',c);
          GotoXY(96,pos);
          Writeln('| ',R_Vue.Cant_Pasajeros);
          GotoXY(108,pos);
          Writeln('| ',R_Vue.Estado);
          inc(pos);
          inc(i);
          If ((pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | v-Ver escalas | esc-Salir   :                                                              ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(58,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s') or (opc='v');
               If (Opc='v') then
               Begin
                    TextColor(White);
                    TextBackground(Blue);
                    GotoXY(25,9);
                    Writeln('                                                                ');
                    GotoXY(25,10);
                    Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
                    GotoXY(25,11);
                    Writeln(' /\    Ingrese el ID del vuelo para ver las escalas:         /\ ');
                    GotoXY(25,12);
                    Writeln(' /\                                                          /\ ');
                    GotoXY(25,13);
                    Writeln(' /\                                                          /\ ');
                    GotoXY(25,14);
                    Writeln(' /\                                                          /\ ');
                    GotoXY(25,15);
                    Writeln(' /\                                                          /\ ');
                    GotoXY(25,16);
                    Writeln(' /\                                                          /\ ');
                    GotoXY(25,17);
                    Writeln(' /\ Enter-Para continuar                                     /\ ');
                    GotoXY(25,18);
                    Writeln(' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ');
                    GotoXY(25,19);
                    Writeln('                                                                ');
                    GotoXY(77,11);
                    Readln(bus);
                    pos2:=-1;
                    seek(A_Vue,0);
                    Busqueda_VU(A_Vue,bus,pos2,R_Vue);
                    If (pos2<>-1) then
                    Begin
                         s:=0;
                         x:=12;
                         For j:= 1 to 3 do
                         Begin
                              inc(x);
                              GotoXY(40,x);
                              Writeln(R_Vue.Escalas[j]);
                              if (R_Vue.Escalas[j]='') then
                              Begin
                                   Inc(s);
                              End;
                         End;
                         if (s=3) then
                         Begin
                              GotoXY(40,13);
                              Writeln(' El vuelo no posee escalas');
                         End;
                         TextColor(1);
                         TextBackground(7);
                    End
                    Else
                    Begin
                         GotoXY(37,12);
                         Writeln('No existe el vuelo');
                         TextColor(1);
                         TextBackground(7);
                    End;
                    Readkey;
                    i:=i-(pos-2);
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               End;
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
                       clrscr;
                       TextColor(1);
                       TextBackground(7);
                       gotoxy(1,1);
                       Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
          end;
     end;
     Cerrar_VU(A_Vue);
     Cerrar_A(A_Aero);
     Cerrar_LA(A_LA);
     Readkey;
End;

////////////////////////////////////////////////// PROCEDIMIENTOS AEROPUERTO ////////////////////////////////////////////////

Procedure Alta_Aeropuerto(var A_Aero:Arch_Aeropuerto);
Var Pos:integer;
    R_Aero:T_Aeropuerto;
    Bus:string;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea dar de alta:');
     GotoXY(72,5);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(Black);
          Clrscr;
          GotoXY(1,29);
          Writeln(' Enter-Para continuar ');
          TextColor(1);
          TextBackground(7);
          Fondo;
          GotoXY(30,5);
          Writeln('  Ingrese los datos para realizar el alta del aeropuerto');
          GotoXY(15,9);
          Writeln('  ID Aeropuerto:');
          GotoXY(31,9);
          Readln(R_Aero.ID_Aeropuerto);
          GotoXY(15,10);
          Writeln('  Ciudad:');
          GotoXY(24,10);
          Readln(R_Aero.Ciudad);
          GotoXY(15,11);
          Writeln('  Pais:');
          GotoXY(22,11);
          Readln(R_Aero.Pais);
          R_Aero.Activo:=True;
          R_Aero.Nombre:=Bus;
          Guardar_A(A_Aero,R_Aero);
          Cuadro_Alta;
          Cerrar_A(A_Aero);
     End
     Else
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          Cerrar_A(A_Aero);
          If (R_Aero.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El aeropuerto ya fue dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja aeropuerto');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar aeropuerto');
                     GotoXY(45,18);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1': Baja_Aeropuerto(A_Aero);
                          '2': Modificar_Aeropuerto(A_Aero);
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El aeropuerto esta dado de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Reactivarlo');
                     GotoXY(45,17);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   R_Aero.Activo:=True;
                                   Abrir_A(A_Aero);
                                   Modificar_A(A_Aero,Pos,R_Aero);
                                   Cerrar_A(A_Aero);
                                   Cuadro_Reactivacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End;
     End;
End;


Procedure Baja_Aeropuerto(Var A_Aero:Arch_Aeropuerto);
Var Bus:string;
    Pos:integer;
    R_Aero:T_Aeropuerto;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea dar de baja:');
     GotoXY(72,5);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero);
     If (Pos<>-1) then
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          If (R_Aero.Activo=True) then
          Begin
               R_Aero.Activo:=False;
               Modificar_A(A_Aero,Pos,R_Aero);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El aeropuerto ya esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El aeropuerto no existe');
          Readkey;
     End;
     Cerrar_A(A_Aero);
End;

Procedure Modificar_Aeropuerto(var A_Aero:Arch_Aeropuerto);
Var Bus:string;
    Pos:integer;
    R_Aero:T_Aeropuerto;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre del aeropuerto que desea modificar:');
     GotoXY(70,5);
     Readln(Bus);
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,Bus,R_Aero);
     If (Pos<>-1) then
     Begin
          Leer_A(A_Aero,R_Aero,Pos);
          If (R_Aero.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El aeropuerto esta dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Aeropuerto: ',R_Aero.ID_Aeropuerto);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_Aero.Nombre);
                     GotoXY(31,12);
                     Writeln('> Pais: ',R_Aero.Pais);
                     GotoXY(31,13);
                     Writeln('> Ciudad: ',R_Aero.Ciudad);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln('--> 1- Nombre');
                     GotoXY(52,17);
                     Writeln('--> 2- ID Aeropuerto');
                     GotoXY(52,18);
                     Writeln('--> a- Salir');
                     GotoXY(52,15);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Nombre:');
                                   GotoXY(24,9);
                                   Readln(R_Aero.Nombre);
                                   Modificar_A(A_Aero,Pos,R_Aero);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  ID Aeropuerto:');
                                   GotoXY(31,9);
                                   Readln(R_Aero.ID_Aeropuerto);
                                   Modificar_A(A_Aero,Pos,R_Aero);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El aeropuerto esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El aeropuerto no existe');
          readkey;
     End;
     Cerrar_A(A_Aero);
End;

Procedure Consulta_Aeropuerto(var A_Aero:Arch_Aeropuerto);
Var pos,cantidad, i:integer; Vec:T_Vec_Aero;
    R_Aero:T_Aeropuerto;   opc:char;
Begin
     Cargar_A(A_Aero,Vec, cantidad);
     Burbuja_A(Vec, cantidad);
     Abrir_A(A_Aero);
     i:=1;
     opc:=#13;
     pos:=2;
     Clrscr;
     gotoxy(1,1);
     TextColor(1);
     TextBackground(7);
     Writeln(' ID Aeropuerto | Nombre                | Ciudad             | Pais         ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(1);
          TextBackground(7);
          Leer_A(A_Aero,R_Aero,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_Aero.ID_Aeropuerto);
          GotoXY(16,pos);
          Writeln('| ',R_Aero.Nombre);
          GotoXY(40,pos);
          Writeln('| ',R_Aero.Ciudad);
          GotoXY(61,pos);
          Writeln('| ',R_Aero.Pais);
          inc(pos);
          inc(i);
          If ((pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                              ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
                       clrscr;
                       TextColor(1);
                       TextBackground(7);
                       gotoxy(1,1);
                       Writeln(' ID Aeropuerto | Nombre                | Ciudad             | Pais         ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Aeropuerto | Nombre                | Ciudad             | Pais         ');
               end;
          end;
     end;
     Cerrar_A(A_Aero);
     Readkey;
End;

////////////////////////////////////////////////////// PROCEDIMIENTOS PASAJEROS ///////////////////////////////////////////////////////////////

Procedure Alta_Pasajero(var A_Pasaj:Arch_Pasajero);
Var Pos:integer;
    R_Pasaj:T_Pasajero;
    Bus:integer;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el dni del pasajero que desea dar de alta:');
     GotoXY(67,5);
     Readln(Bus);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(Black);
          Clrscr;
          GotoXY(1,29);
          Writeln(' Enter-Para continuar ');
          TextColor(1);
          TextBackground(7);
          Fondo;
          GotoXY(25,5);
          Writeln('  Ingrese los datos para realizar el alta del pasajero');
          GotoXY(15,9);
          Writeln('  Apellido:');
          GotoXY(26,9);
          Readln(R_Pasaj.Apellido);
          GotoXY(15,10);
          Writeln('  Nombre:');
          GotoXY(24,10);
          Readln(R_Pasaj.Nombre);
          GotoXY(15,11);
          Writeln('  Edad:');
          GotoXY(22,11);
          Readln(R_Pasaj.Edad);
          R_Pasaj.Activo:=True;
          R_Pasaj.ID_Pasajero:=Bus;
          Guardar_P(A_Pasaj,R_Pasaj);
          Cuadro_Alta;
          Cerrar_P(A_Pasaj);
     End
     Else
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          Cerrar_P(A_Pasaj);
          If (R_Pasaj.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El pasajero ya fue dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja pasajero');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar pasajero');
                     GotoXY(45,18);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1': Baja_Pasajero(A_Pasaj);
                          '2': Modificar_Pasajero(A_Pasaj);
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El pasajero esta dado de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Reactivarlo');
                     GotoXY(45,17);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   R_Pasaj.Activo:=True;
                                   Abrir_P(A_Pasaj);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   Cerrar_P(A_Pasaj);
                                   Cuadro_Reactivacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End;
     End;
End;

Procedure Baja_Pasajero(Var A_Pasaj:Arch_Pasajero);
Var Bus:integer;
    Pos:integer;
    R_Pasaj:T_Pasajero;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el dni del pasajero que desea dar de baja:');
     GotoXY(67,5);
     Readln(Bus);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos<>-1) then
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          If (R_Pasaj.Activo=True) then
          Begin
               R_Pasaj.Activo:=False;
               Modificar_P(A_Pasaj,Pos,R_Pasaj);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El pasajero ya esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El pasajero no existe');
          Readkey;
     End;
     Cerrar_P(A_Pasaj);
End;

Procedure Modificar_Pasajero(var A_Pasaj:Arch_Pasajero);
Var Bus:integer;
    Pos:integer;
    R_Pasaj:T_Pasajero;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el dni del pasajero que desea modificar:');
     GotoXY(65,5);
     Readln(Bus);
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Bus,Pos,R_Pasaj);
     If (Pos<>-1) then
     Begin
          Leer_P(A_Pasaj,R_Pasaj,Pos);
          If (R_Pasaj.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  El pasajero esta dado de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> DNI: ',R_Pasaj.ID_Pasajero);
                     GotoXY(31,11);
                     Writeln('> Apellido: ',R_Pasaj.Apellido);
                     GotoXY(31,12);
                     Writeln('> Nombre: ',R_Pasaj.Nombre);
                     GotoXY(31,13);
                     Writeln('> Edad: ',R_Pasaj.Edad);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln(' --> 1- Apellido');
                     GotoXY(52,17);
                     Writeln(' --> 2- Nombre');
                     GotoXY(52,18);
                     Writeln(' --> 3- Edad');
                     GotoXY(52,19);
                     Writeln(' --> a- Salir');
                     GotoXY(52,15);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Apellido:');
                                   GotoXY(26,9);
                                   Readln(R_Pasaj.Apellido);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Nombre:');
                                   GotoXY(24,9);
                                   Readln(R_Pasaj.Nombre);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   Cuadro_Modificacion;
                              End;
                          '3':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Edad:');
                                   GotoXY(22,9);
                                   Readln(R_Pasaj.Edad);
                                   Modificar_P(A_Pasaj,Pos,R_Pasaj);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  El pasajero esta dado de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  El pasajero no existe');
          Readkey;
     End;
     Cerrar_P(A_Pasaj);
End;

Procedure Consulta_Pasajero(var A_Pasaj:Arch_Pasajero);
Var Pos,cantidad, i:integer; Vec:T_Vec_Pasaj;
    R_Pasaj:T_Pasajero; opc:char;
Begin
     Cargar_P(A_Pasaj,Vec, cantidad);
     Burbuja_P(Vec, cantidad);
     Abrir_P(A_Pasaj);
     i:=1;
     opc:=#13;
     Pos:=2;
     clrscr;
     TextColor(1);
     TextBackground(7);
     GotoXY(1,1);
     Writeln(' Apellido         | Nombre             | DNI          | Edad      ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(1);
          TextBackground(7);
          Leer_P(A_Pasaj,R_Pasaj,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_Pasaj.Apellido);
          GotoXY(19,pos);
          Writeln('| ',R_Pasaj.Nombre);
          GotoXY(40,pos);
          Writeln('| ',R_Pasaj.ID_Pasajero);
          GotoXY(55,pos);
          Writeln('| ',R_Pasaj.Edad);
          inc(Pos);
          inc(i);
          If ((Pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                             ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(Pos-3)
                    Else
                       i:=1;
                       Pos:=2;
                       clrscr;
                       TextColor(1);
                       TextBackground(7);
                       gotoxy(1,1);
                       Writeln(' Apellido         | Nombre             | DNI          | Edad      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' Apellido         | Nombre             | DNI          | Edad      ');
               end;
          end;
     End;
     Cerrar_P(A_Pasaj);
     Readkey;
End;

/////////////////////////////////////////////////// PROCEDIMIENTOS LINEAS AEREAS ///////////////////////////////////////////////////////////////

Procedure Alta_Linea(var A_LA:Arch_LineaAerea);
Var Pos:integer;
    R_LA:T_LineaAerea;
    Bus:string;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea dar de alta:');
     GotoXY(75,5);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA);
     If (Pos=-1)then
     Begin
          TextColor(White);
          TextBackground(Black);
          Clrscr;
          GotoXY(1,29);
          Writeln(' Enter-Para continuar ');
          TextColor(1);
          TextBackground(7);
          Fondo;
          GotoXY(23,5);
          Writeln('  Ingrese los datos para realizar el alta de la linea aerea');
          GotoXY(15,9);
          Writeln('  ID Linea Aerea:');
          GotoXY(32,9);
          Readln(R_LA.ID_LineaAerea);
          GotoXY(15,10);
          Writeln('  Cuit(NN-NNNNNNNN-N):');
          GotoXY(37,10);
          Readln(R_LA.Cuit);
          GotoXY(15,11);
          Writeln('  Domicilio:');
          GotoXY(27,11);
          Readln(R_LA.Domicilio);
          R_LA.Activo:=True;
          R_LA.Nombre:=Bus;
          Guardar_LA(A_LA,R_LA);
          Cerrar_LA(A_LA);
          Cuadro_Alta;
     End
     Else
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          Cerrar_LA(A_LA);
          If (R_LA.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  La linea aerea ya fue dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Baja linea aerea');
                     GotoXY(45,17);
                     Writeln(' --> 2- Modificar linea aerea');
                     GotoXY(45,18);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                         '1': Baja_Linea(A_LA);
                         '2': Modificar_Linea(A_LA);
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  La linea aerea esta dada de baja');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija una opcion para seguir:');
                     GotoXY(45,16);
                     Writeln(' --> 1- Reactivarla');
                     GotoXY(45,17);
                     Writeln(' --> a- Salir');
                     GotoXY(46,15);
                     Opc:=readkey;
                     Case (Opc) of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   R_LA.Activo:=True;
                                   Abrir_LA(A_LA);
                                   Modificar_LA(A_LA,Pos,R_LA);
                                   Cerrar_LA(A_LA);
                                   Cuadro_Reactivacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End;
     End;
End;

Procedure Baja_Linea(Var A_LA:Arch_LineaAerea);
Var Bus:string;
    Pos:integer;
    R_LA:T_LineaAerea;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea dar de baja:');
     GotoXY(75,5);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA);
     If (Pos<>-1) then
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          If (R_LA.Activo=True) then
          Begin
               R_LA.Activo:=False;
               Modificar_LA(A_LA,Pos,R_LA);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La linea aerea ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La linea aerea no existe');
          Readkey;
     End;
     Cerrar_LA(A_LA);
End;

Procedure Modificar_Linea(var A_LA:Arch_LineaAerea);
Var Bus:string;
    Pos:integer;
    R_LA:T_LineaAerea;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el nombre de la linea aerea que desea modificar:');
     GotoXY(73,5);
     Readln(Bus);
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Bus,Pos,R_LA);
     If (Pos<>-1) then
     Begin
          Leer_LA(A_LA,R_LA,Pos);
          If (R_LA.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  La linea aerea esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Linea Aerea: ',R_LA.ID_LineaAerea);
                     GotoXY(31,11);
                     Writeln('> Nombre: ',R_LA.Nombre);
                     GotoXY(31,12);
                     Writeln('> Cuit: ',R_LA.Cuit);
                     GotoXY(31,13);
                     Writeln('> Domicilio: ',R_LA.Domicilio);
                     GotoXY(15,15);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,16);
                     Writeln('--> 1- Nombre');
                     GotoXY(52,17);
                     Writeln('--> 2- Domicilio');
                     GotoXY(52,18);
                     Writeln('--> a- Salir');
                     GotoXY(52,15);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Nombre:');
                                   GotoXY(24,9);
                                   Readln(R_LA.Nombre);
                                   Modificar_LA(A_LA,Pos,R_LA);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Domicilio:');
                                   GotoXY(27,9);
                                   Readln(R_LA.Domicilio);
                                   Modificar_LA(A_LA,Pos,R_LA);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La linea aerea esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La linea aerea no existe');
          Readkey;
     End;
     Cerrar_LA(A_LA);
End;

Procedure Consulta_Linea(var A_LA:Arch_LineaAerea);
Var Pos,cantidad, i:integer; Vec:T_Vec_LA;
    R_LA:T_LineaAerea; opc:char;
Begin
     Cargar_LA(A_LA,Vec, cantidad);
     Burbuja_LA(Vec, cantidad);
     Abrir_LA(A_LA);
     i:=1;
     opc:=#13;
     Pos:=2;
     clrscr;
     TextColor(1);
     TextBackground(7);
     GotoXY(1,1);
     Writeln(' ID Linea Aerea | Nombre                        | Cuit             | Domicilio                     ');
     While(i<=cantidad) and (opc<>#27) do
     begin
          TextColor(1);
          TextBackground(7);
          Leer_LA(A_LA,R_LA,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_LA.ID_LineaAerea);
          GotoXY(17,pos);
          Writeln('| ',R_LA.Nombre);
          GotoXY(49,pos);
          Writeln('| ',R_LA.Cuit);
          GotoXY(68,pos);
          Writeln('| ',R_LA.Domicilio);
          inc(Pos);
          inc(i);
          If ((pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                              ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(Pos-3)
                    Else
                       i:=1;
                       Pos:=2;
                       clrscr;
                       TextColor(1);
                       TextBackground(7);
                       gotoxy(1,1);
                       Writeln(' ID Linea Aerea | Nombre                        | Cuit             | Domicilio                     ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    Pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Linea Aerea | Nombre                        | Cuit             | Domicilio                     ');
               end;
          end;
     end;
     Cerrar_LA(A_LA);
     Readkey;
End;

////////////////////////////////////////////////////// PROCEDIMIENTOS VENTA ////////////////////////////////////////////////////////////////////

Procedure Alta_Venta(var A_Ven:Arch_Venta;var A_Pasaj:Arch_Pasajero);
Var Pos1:integer;
    R_Ven:T_Venta;
    R_Pasaj:T_Pasajero;
    //Bus,Pos:integer;
    Opc1:char; //Opc;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
//
     Abrir_VE(A_Ven);
     GotoXY(26,5);
     Writeln('  Ingrese los datos para realizar el alta de la venta');
     GotoXY(15,9);
     Writeln('  Costo:$');
     GotoXY(24,9);
     Readln(R_Ven.Costo);
     GotoXY(15,10);
     Writeln('  Fecha(DD/MM/AAAA):');
     GotoXY(35,10);
     Readln(R_Ven.Fecha);
     GotoXY(15,11);
     Writeln('  Hora(HH:MM):');
     GotoXY(29,11);
     Readln(R_Ven.Hora);
     GotoXY(15,12);
     Writeln('  DNI:');
     Pos1:=-1;
     Repeat
           GotoXY(21,12);
           Readln(R_Ven.ID_Pasajero);
           Abrir_P(A_Pasaj);
           Busqueda_P(A_Pasaj,R_Ven.ID_Pasajero,Pos1,R_Pasaj);
           Cerrar_P(A_Pasaj);
           If (Pos1<>-1) then
           Begin
                GotoXY(16,13);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(15,13);
                Writeln('  Esc: ingresar de nuevo | Enter: dar de alta');
                Opc1:=readkey;
                Until (Opc1=#27) or (Opc1=#13);
                If(Opc1=#27) then
                Begin
                     GotoXY(15,13);
                     Writeln('                                                      ');
                     GotoXY(21,12);
                     Writeln('                           ');
                End
                Else
                Begin
                     Alta_Pasajero(A_Pasaj);
                     Abrir_P(A_Pasaj);
                     Busqueda_P(A_Pasaj,R_Ven.ID_Pasajero,Pos1,R_Pasaj);
                     Cerrar_P(A_Pasaj);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,12);
                     Writeln('  DNI:');
                     GotoXY(21,12);
                     Writeln('                            ');
                End;
           End;
     Until (Pos1<>-1);
     R_Ven.Activo:=True;
     R_Ven.ID_Venta:=(Filesize(A_Ven)+1);
     Guardar_VE(A_Ven,R_Ven);
     Cerrar_VE(A_Ven);
     Cuadro_Alta;
     Readkey;
End;

Procedure Baja_Venta(Var A_Ven:Arch_Venta);
Var Bus:integer;
    Pos:integer;
    R_Ven:T_Venta;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de venta que desea dar de baja:');
     GotoXY(66,5);
     Readln(Bus);
     Abrir_VE(A_Ven);
     Busqueda_VE(A_Ven,Bus,Pos,R_Ven);
     If (Pos<>-1) then
     Begin
          Leer_VE(A_Ven,R_Ven,Pos);
          If (R_Ven.Activo=True) then
          Begin
               R_Ven.Activo:=False;
               Modificar_VE(A_Ven,Pos,R_Ven);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La venta ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La venta no existe');
          Readkey;
     End;
     Cerrar_VE(A_Ven);
End;

Procedure Modificar_Venta(var A_Ven:Arch_Venta);
Var Bus:integer;
    Pos:integer;
    R_Ven:T_Venta;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de la venta que desea modificar:');
     GotoXY(67,5);
     Readln(Bus);
     Abrir_VE(A_Ven);
     Busqueda_VE(A_Ven,Bus,Pos,R_Ven);
     If (Pos<>-1) then
     Begin
          Leer_VE(A_Ven,R_Ven,Pos);
          If (R_Ven.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(40,5);
                     Writeln('  La venta esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Venta: ',R_Ven.ID_Venta);
                     GotoXY(31,11);
                     Writeln('> ID Pasajero: ',R_Ven.ID_Pasajero);
                     GotoXY(31,12);
                     Writeln('> Costo: ',R_Ven.Costo:2:2);
                     GotoXY(31,13);
                     Writeln('> Fecha: ',R_Ven.Fecha:0);
                     GotoXY(31,14);
                     Writeln('> Hora: ',R_Ven.Hora);
                     GotoXY(15,16);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,17);
                     Writeln('--> 1- Fecha');
                     GotoXY(52,18);
                     Writeln('--> 2- Hora');
                     GotoXY(52,19);
                     Writeln('--> a- Salir');
                     GotoXY(52,16);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Fecha(DD/MM/AAAA):');
                                   GotoXY(35,9);
                                   Readln(R_Ven.Fecha);
                                   Modificar_VE(A_Ven,Pos,R_Ven);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Hora(HH:MM):');
                                   GotoXY(29,9);
                                   Readln(R_Ven.Hora);
                                   Modificar_VE(A_Ven,Pos,R_Ven);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La venta esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La venta no existe');
          Readkey;
     End;
     Cerrar_VE(A_Ven);
End;

Procedure Consulta_Venta(var A_Ven:Arch_Venta;var A_Pasaj:Arch_Pasajero);
Var pos,cantidad, i:integer; Vec:T_Vec_Ven;
    R_Ven:T_Venta;   opc:char;
Begin
     Cargar_VE(A_Ven,Vec, cantidad);
     Burbuja_VE(Vec, cantidad);
     Abrir_VE(A_Ven);
     Abrir_P(A_Pasaj);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     gotoxy(1,1);
     TextColor(1);
     TextBackground(7);
     Writeln(' ID Venta   | Costo     | Fecha      | Hora     | DNI        ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(1);
          TextBackground(7);
          Leer_VE(A_Ven,R_Ven,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_Ven.ID_Venta);
          GotoXY(13,pos);
          Writeln('| $',R_Ven.Costo:2:2);
          GotoXY(25,pos);
          Writeln('| ',R_Ven.Fecha:0);
          GotoXY(38,pos);
          Writeln('| ',R_Ven.Hora);
          GotoXY(49,pos);
          Writeln('| ',R_Ven.ID_Pasajero);
          inc(pos);
          inc(i);
          If ((pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                              ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
                       clrscr;
                       gotoxy(1,1);
                       TextColor(1);
                       TextBackground(7);
                       Writeln(' ID Venta   | Costo     | Fecha      | Hora     | DNI        ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    gotoxy(1,1);
                    TextColor(1);
                    TextBackground(7);
                    Writeln(' ID Venta   | Costo     | Fecha      | Hora     | DNI        ');
               end;
          end;
     end;
     Cerrar_VE(A_Ven);
     Cerrar_P(A_Pasaj);
     Readkey;
End;

////////////////////////////////////////////////////// PROCEDIMIENTOS RESERVA //////////////////////////////////////////////////////////////////

Procedure Alta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto;var A_LA:Arch_LineaAerea);
Var Pos1,Pos2:integer;
    R_Res:T_Reserva;
    R_Pasaj:T_Pasajero;
    R_Vue:T_Vuelo;
    //Pos,Bus:integer;
    Opc1,Opc2:char; //Opc;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     Abrir_R(A_Res);
     GotoXY(26,5);
//
     Writeln('  Ingrese los datos para realizar el alta de la reserva');
     GotoXY(15,9);
     Writeln('  ID Vuelo:');
     Pos2:=-1;
     Repeat
           GotoXY(26,9);
           Readln(R_Res.ID_Vuelo);
           Abrir_VU(A_Vue);
           Busqueda_VU(A_Vue,R_Res.ID_Vuelo,Pos2,R_Vue);
           Cerrar_VU(A_Vue);
           If (Pos2<>-1) then
           Begin
                GotoXY(16,10);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(16,10);
                Writeln(' Esc: ingresar de nuevo | Enter: dar de alta');
                Opc2:=readkey;
                Until (Opc2=#27) or (Opc2=#13);
                If(Opc2=#27) then
                Begin
                     GotoXY(16,10);
                     Writeln('                                                     ');
                     GotoXY(26,9);
                     Writeln('                      ');
                End
                Else
                Begin
                     Alta_Vuelo(A_Vue,A_Aero,A_LA);
                     Abrir_VU(A_Vue);
                     Busqueda_VU(A_Vue,R_Res.ID_Vuelo,Pos2,R_Vue);
                     Cerrar_VU(A_Vue);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,9);
                     Writeln('  ID Vuelo:');
                     GotoXY(26,9);
                     Writeln('                         ');
                End;
          End;
     Until (Pos2<>-1);
     GotoXY(15,11);
     Writeln('  Fecha(DD/MM/AAAA):');
     GotoXY(35,11);
     Readln(R_Res.Fecha);
     GotoXY(15,12);
     Writeln('  Hora(HH:MM):');
     GotoXY(29,12);
     Readln(R_Res.Hora);
     GotoXY(15,13);
     Writeln('  Costo:$');
     GotoXY(24,13);
     Readln(R_Res.Costo);
     GotoXY(15,14);
     Writeln('  DNI:');
     Pos1:=-1;
     Repeat
           GotoXY(21,14);
           Readln(R_Res.ID_Pasajero);
           Abrir_P(A_Pasaj);
           Busqueda_P(A_Pasaj,R_Res.ID_Pasajero,Pos1,R_Pasaj);
           Cerrar_P(A_Pasaj);
           If (Pos1<>-1) then
           Begin
                GotoXY(16,15);
                Writeln(' Ok');
           End
           Else
           Begin
                Repeat
                GotoXY(15,15);
                Writeln('  Esc: ingresar de nuevo | Enter: dar de alta');
                Opc1:=readkey;
                Until (Opc1=#27) or (Opc1=#13);
                If(Opc1=#27) then
                Begin
                     GotoXY(15,15);
                     Writeln('                                                     ');
                     GotoXY(21,14);
                     Writeln('                      ');
                End
                Else
                Begin
                     Alta_Pasajero(A_Pasaj);
                     Abrir_P(A_Pasaj);
                     Busqueda_P(A_Pasaj,R_Res.ID_Pasajero,Pos1,R_Pasaj);
                     Cerrar_P(A_Pasaj);
                     TextColor(White);
                     TextBackground(Black);
                     clrscr;
                     GotoXY(1,29);
                     Writeln(' Enter-Para continuar ');
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(15,14);
                     Writeln('  DNI:');
                     GotoXY(21,14);
                     Writeln('                           ');
                End;
          End;
     Until (Pos1<>-1);
     R_Res.Activo:=True;
     R_Res.ID_Reserva:=(Filesize(A_Res)+1);
     Guardar_R(A_Res,R_Res);
     Cerrar_R(A_Res);
     Cuadro_Alta;
End;

Procedure Baja_Reserva(Var A_Res:Arch_Reserva);
Var Bus:integer;
    Pos:integer;
    R_Res:T_Reserva;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de reserva que desea dar de baja:');
     GotoXY(68,5);
     Readln(Bus);
     Abrir_R(A_Res);
     Busqueda_R(A_Res,Bus,Pos,R_Res);
     If (Pos<>-1) then
     Begin
          Leer_R(A_Res,R_Res,Pos);
          If (R_Res.Activo=True) then
          Begin
               R_Res.Activo:=False;
               Modificar_R(A_Res,Pos,R_Res);
               Cuadro_Baja;
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La reserva ya esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La reserva no existe');
          Readkey;
     End;
     Cerrar_R(A_Res);
End;

Procedure Modificar_Reserva(var A_Res:Arch_Reserva);
Var Bus:integer;
    Pos:integer;
    R_Res:T_Reserva;
    Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(15,5);
     Writeln('  Ingrese el codigo de la reserva que desea modificar:');
     GotoXY(69,5);
     Readln(Bus);
     Abrir_R(A_Res);
     Busqueda_R(A_Res,Bus,Pos,R_Res);
     If (Pos<>-1) then
     Begin
          Leer_R(A_Res,R_Res,Pos);
          If (R_Res.Activo=True) then
          Begin
               Repeat
                     TextColor(White);
                     TextBackground(Black);
                     Clrscr;
                     TextColor(1);
                     TextBackground(7);
                     Fondo;
                     GotoXY(20,5);
                     Writeln('  La reserva esta dada de alta');
                     GotoXY(15,9);
                     Writeln('  Sus datos son:');
                     GotoXY(31,10);
                     Writeln('> ID Reserva: ',R_Res.ID_Reserva);
                     GotoXY(31,11);
                     Writeln('> ID Pasajero: ',R_Res.ID_Pasajero);
                     GotoXY(31,12);
                     Writeln('> ID Vuelo: ',R_Res.ID_Vuelo);
                     GotoXY(31,13);
                     Writeln('> Costo: ',R_Res.Costo:2:2);
                     GotoXY(31,14);
                     Writeln('> Fecha: ',R_Res.Fecha:0);
                     GotoXY(31,15);
                     Writeln('> Hora: ',R_Res.Hora);
                     GotoXY(15,17);
                     Writeln('  Elija el campo que desea modificar:');
                     GotoXY(52,18);
                     Writeln('--> 1- Fecha');
                     GotoXY(52,19);
                     Writeln('--> 2- Hora');
                     GotoXY(52,20);
                     Writeln('--> a- Salir');
                     GotoXY(52,17);
                     Opc:=readkey;
                     Case Opc of
                          '1':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Fecha(DD/MM/AAAA):');
                                   GotoXY(35,9);
                                   Readln(R_Res.Fecha);
                                   Modificar_R(A_Res,Pos,R_Res);
                                   Cuadro_Modificacion;
                              End;
                          '2':Begin
                                   TextColor(White);
                                   TextBackground(Black);
                                   Clrscr;
                                   GotoXY(1,29);
                                   Writeln(' Enter-Para continuar ');
                                   TextColor(1);
                                   TextBackground(7);
                                   Fondo;
                                   GotoXY(35,5);
                                   Writeln('  Ingrese el nuevo dato para la modificacion');
                                   GotoXY(15,9);
                                   Writeln('  Hora(HH:MM):');
                                   GotoXY(29,9);
                                   Readln(R_Res.Hora);
                                   Modificar_R(A_Res,Pos,R_Res);
                                   Cuadro_Modificacion;
                              End;
                     End;
               Until (Opc='a') or (Opc='A');
          End
          Else
          Begin
               GotoXY(15,9);
               Writeln('  La reserva esta dada de baja');
               Readkey;
          End;
     End
     Else
     Begin
          GotoXY(15,9);
          Writeln('  La reserva no existe');
          Readkey;
     End;
     Cerrar_R(A_Res);
End;

Procedure Consulta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo);
Var pos,cantidad, i:integer; Vec:T_Vec_Res;
    R_Res:T_Reserva;   opc:char;
Begin
     Cargar_R(A_Res,Vec, cantidad);
     Burbuja_R(Vec, cantidad);
     Abrir_R(A_Res);
     Abrir_P(A_Pasaj);
     Abrir_VU(A_Vue);
     i:=1;
     opc:=#13;
     pos:=2;
     clrscr;
     gotoxy(1,1);
     TextColor(1);
     TextBackground(7);
     Writeln(' ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI        ');
     While(i<=cantidad) and (opc<>#27) do
     Begin
          TextColor(1);
          TextBackground(7);
          Leer_R(A_Res,R_Res,Vec[i].pos);
          GotoXY(2,pos);
          Writeln(R_Res.ID_Reserva);
          GotoXY(15,pos);
          Writeln('| ',R_Res.ID_Vuelo);
          GotoXY(30,pos);
          Writeln('| $',R_Res.Costo:2:2);
          GotoXY(42,pos);
          Writeln('| ',R_Res.Fecha:0);
          GotoXY(55,pos);
          Writeln('| ',R_Res.Hora);
          GotoXY(66,pos);
          Writeln('| ',R_Res.ID_Pasajero);
          inc(pos);
          inc(i);
          If ((pos=28) or (i=cantidad+1)) then
          Begin
               TextColor(White);
               TextBackground(Black);
               GotoXY(1,29);
               Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                              ');
               TextColor(1);
               TextBackground(7);
               Repeat
                     GotoXY(42,29);
                     opc:=readkey;
               Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                       i:=i-27-(pos-3)
                    Else
                       i:=1;
                       pos:=2;
                       clrscr;
                       gotoxy(1,1);
                       TextColor(1);
                       TextBackground(7);
                       Writeln(' ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI        ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    gotoxy(1,1);
                    TextColor(1);
                    TextBackground(7);
                    Writeln(' ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI        ');
               end;
          end;
     end;
     Cerrar_R(A_Res);
     Cerrar_P(A_Pasaj);
     Cerrar_VU(A_Vue);
     Readkey;
End;

////////////////////////////////////////////////////// PROCEDIMIENTOS BUSQUEDA /////////////////////////////////////////////////////////////////

Procedure Fecha_Vuelo_Aeropuerto(Var A_Vue:Arch_Vuelo;var A_Aero:Arch_Aeropuerto);
var i,j,Pos,cantidad,c:integer;
    opc:char;
    Buscado,aeropuerto:string[20];
    R_Vue:T_Vuelo;
    R_Aero:T_Aeropuerto;
    Vec1:T_Vec_Vue;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('  Segun una fecha, listado de vuelos de un determinado aeropuerto');
     GotoXY(15,9);
     Writeln('  Ingrese la fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(64,9);
     Readln(Buscado);
     Cargar_VU(A_Vue,Vec1, cantidad);
     Burbuja_VU(Vec1, cantidad);
     Abrir_VU(A_Vue);
     GotoXY(15,10);
     Writeln('  Ingrese el nombre del aeropuerto que desea buscar:');
     GotoXY(67,10);
     Readln(aeropuerto);
     Pos:=-1;
     Abrir_A(A_Aero);
     Busqueda_A(A_Aero,Pos,aeropuerto,R_Aero);
     Cerrar_A(A_Aero);
     If (Pos<>-1) then
     Begin
          aeropuerto:=R_Aero.ID_Aeropuerto;
          Clrscr;
          i:=1;
          opc:=#13;
          pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_VU(A_Vue,R_Vue,Vec1[i].pos);
               If (Buscado=R_Vue.FechaP) and (aeropuerto=R_Vue.Origen) then
               begin
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                            inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
               end;
               inc(i);
               If ((pos=28) or (i=cantidad+1)) then
               Begin
                    GotoXY(1,29);
                    TextColor(White);
                    TextBackground(Black);
                    Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                         ');
                    Repeat
                    GotoXY(42,29);
                    opc:=readkey;
                    Until  (opc=#27) or (opc='a') or (opc='s') or (opc='v');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                    i:=i-27-(pos-3)
                    Else
                    i:=1;
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
          end;
          end;
     End
     Else
     Begin
         GotoXY(15,11);
         Writeln('  El aeropuerto no existe');
     End;
     Cerrar_VU(A_Vue);
     Readkey;
End;

Procedure Fechas_Vuelo_Aerolinea(Var A_Vue:Arch_Vuelo;var A_LA:Arch_LineaAerea);
var Pos,cantidad,i,codigo,DI1,MI1,AI1,DI2,MI2,AI2,DIP,MIP,AIP,j,c:integer;
    opc:char;
    Fecha1,Fecha2,Aerolinea,DS1,MS1,AS1,DS2,MS2,AS2,DSP,MSP,ASP:string[20];
    R_Vue:T_Vuelo;
    R_LA:T_LineaAerea;
    Vec:T_Vec_Vue;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(20,5);
     Writeln('  Segun un rango de fechas, listado de vuelos de una determinada linea aerea');
     GotoXY(15,9);
     Writeln('  Ingrese la primer fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(71,9);
     Readln(Fecha1);
     GotoXY(15,10);
     Writeln('  Ingrese la segunda fecha (DD/MM/AAAA) que desea buscar:');
     GotoXY(72,10);
     Readln(Fecha2);
     Cargar_VU(A_Vue,Vec, cantidad);
     Burbuja_VU(Vec, cantidad);
     Abrir_VU(A_Vue);
     GotoXY(15,11);
     Writeln('  Ingrese el nombre de la linea aerea que desea buscar:');
     GotoXY(70,11);
     Readln(Aerolinea);
     Pos:=-1;
     Abrir_LA(A_LA);
     Busqueda_LA(A_LA,Aerolinea,Pos,R_LA);
     Cerrar_LA(A_LA);
     If (Pos<>-1) then
     Begin
          Aerolinea:=R_LA.ID_LineaAerea;
          Clrscr;
          i:=1;
          opc:=#13;
          Pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_VU(A_Vue,R_Vue,Vec[i].Pos);
               DS1:= copy(Fecha1,1,2);
               MS1:= copy(Fecha1,4,2);
               AS1:= copy(Fecha1,7,4);
               DS2:= copy(Fecha2,1,2);
               MS2:= copy(Fecha2,4,2);
               AS2:= copy(Fecha2,7,4);
               DSP:= copy(R_Vue.FechaP,1,2);
               MSP:= copy(R_Vue.FechaP,4,2);
               ASP:= copy(R_Vue.FechaP,7,4);
               Val(DS1,DI1,codigo);
               Val(MS1,MI1,codigo);
               Val(AS1,AI1,codigo);
               Val(DS2,DI2,codigo);
               Val(MS2,MI2,codigo);
               Val(AS2,AI2,codigo);
               Val(DSP,DIP,codigo);
               Val(MSP,MIP,codigo);
               Val(ASP,AIP,codigo);
               If (Aerolinea=R_Vue.ID_LineaAerea) and(((AI1<=AIP) and (AI2>=AIP)) and((MI1<=MIP) and (MI2>=MIP))and(((MI1=MIP)and(DIP>=DI1))or((MIP=MI2)and(DIP<=DI2))or((MIP>MI1)and(MIP<MI2)))) then
               begin
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                            inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
               end;
               inc(i);
               If ((pos=28) or (i=cantidad+1)) then
               Begin
                    TextColor(White);
                    TextBackground(Black);
                    GotoXY(1,29);
                    Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                     ');
                    Repeat
                    GotoXY(42,29);
                    opc:=readkey;
                    Until  (opc=#27) or (opc='a') or (opc='s');
               If (opc='a') and (i>=27) then
               begin
                    If (i>27) then
                    i:=i-27-(pos-3)
                    Else
                    i:=1;
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
               If (opc='s') and (i<cantidad)then
               begin
                    pos:=2;
                    clrscr;
                    TextColor(1);
                    TextBackground(7);
                    gotoxy(1,1);
                    Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
               end;
          end;
          End;
     End
     Else
     Begin
         GotoXY(15,12);
         Writeln('  La linea aerea no existe');
     End;
     Cerrar_VU(A_Vue);
     Readkey;
End;

Procedure Pasajero_Vuelo(Var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo;var A_Pasaj:Arch_Pasajero);
Var Buscado,i,c,j,pos,cantidad,cantidad1,posvuelo:integer;
    Vec:T_Vec_Res;
    Vec1:T_Vec_Vue;
    R_Res:T_Reserva;
    R_Vue:T_Vuelo;
    R_Pasaj:T_Pasajero;
    opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Clrscr;
     GotoXY(1,29);
     Writeln(' Enter-Para continuar ');
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(25,5);
     Writeln('  Segun un pasajero, listado de vuelos que ha realizado');
     GotoXY(15,9);
     Writeln('  Ingrese el DNI de la persona que desea ver los vuelos que realizo:');
     GotoXY(83,9);
     Readln(Buscado);
     Cargar_R(A_Res,Vec,cantidad);
     Cargar_VU(A_Vue,Vec1,cantidad1);
     Burbuja_VU(Vec1,cantidad1);
     Abrir_R(A_Res);
     Abrir_VU(A_Vue);
     Pos:=-1;
     Abrir_P(A_Pasaj);
     Busqueda_P(A_Pasaj,Buscado,Pos,R_Pasaj);
     Cerrar_P(A_Pasaj);
     If (pos<>-1) then
     Begin
          clrscr;
          i:=1;
          opc:=#13;
          pos:=2;
          gotoxy(1,1);
          Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
          While(i<=cantidad) and (opc<>#27) do
          Begin
               Leer_R(A_Res,R_Res,Vec[i].Pos);
               inc(i);
               If (Buscado=R_Res.ID_Pasajero) then
               Begin
                    Busqueda_VU(A_Vue,R_Res.ID_Vuelo,posvuelo,R_Vue);
                    Leer_VU(A_Vue,R_Vue,posvuelo);
                    GotoXY(2,pos);
                    Writeln(R_Vue.ID_Vuelo);
                    GotoXY(11,pos);
                    Writeln('| ',R_Vue.ID_LineaAerea);
                    GotoXY(19,pos);
                    Writeln('| ',R_Vue.Origen);
                    GotoXY(28,pos);
                    Writeln('| ',R_Vue.FechaP);
                    GotoXY(41,pos);
                    Writeln('| ',R_Vue.HoraP);
                    GotoXY(51,pos);
                    Writeln('| ',R_Vue.Destino);
                    GotoXY(61,pos);
                    Writeln('| ',R_Vue.FechaL);
                    GotoXY(74,pos);
                    Writeln('| ',R_Vue.HoraL);
                    GotoXY(84,pos);
                    c:=0;
                    For j:= 1 to 3 do
                    Begin
                         If (R_Vue.Escalas[j]<>'') then
                         inc(c);
                    End;
                    Writeln('| ',c);
                    GotoXY(96,pos);
                    Writeln('| ',R_Vue.Cant_Pasajeros);
                    GotoXY(108,pos);
                    Writeln('| ',R_Vue.Estado);
                    inc(pos);
                    end;
                    If ((pos=28) or (i=cantidad+1)) then
                    Begin
                         TextColor(White);
                         TextBackground(Black);
                         GotoXY(1,29);
                         Writeln(' a-Anterior | s-Siguiente | esc-Salir   :                                                                       ');
                         Repeat
                         GotoXY(42,29);
                         opc:=readkey;
                         Until  (opc=#27) or (opc='a') or (opc='s');
                    If (opc='a') and (i>=27) then
                    begin
                         If (i>27) then
                         i:=i-27-(pos-3)
                         Else
                         i:=1;
                         pos:=2;
                         clrscr;
                         TextColor(1);
                         TextBackground(7);
                         gotoxy(1,1);
                         Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
                    end;
                    If (opc='s') and (i<cantidad)then
                    begin
                         pos:=2;
                         clrscr;
                         TextColor(1);
                         TextBackground(7);
                         gotoxy(1,1);
                         Writeln(' ID Vuelo | Linea | Origen | Fecha P.   | Hora P. | Destino | Fecha L.   | Hora L. | Escalas   | Pasajeros | Estado      ');
                    end;
               end;
           end;
    End
    Else
    Begin
         GotoXY(15,10);
         Writeln('  El pasajero no existe');
    End;
    Readkey;
    Cerrar_R(A_Res);
    Cerrar_VU(A_Vue);
End;



////////////////////////////////////////////////////// PROCEDIMIENTOS MENUS ////////////////////////////////////////////////////////////////////

Procedure Menu_Vuelos;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                          MENU DE VUELOS                            ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Vuelos                                                  ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Vuelos                                                  ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Vuelos                                          ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Vuelos                                              ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal                                      ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:                                                ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
           '1': Alta_Vuelo(Arch_VU,Arch_A,Arch_LA);
           '2': Baja_Vuelo(Arch_VU);
           '3': Modificar_Vuelo(Arch_VU);
           '4': Consulta_Vuelo(Arch_VU,Arch_A,Arch_LA);
          End;
          TextColor(White);
          TextBackground(Black);
          readkey;
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Reservas;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                         MENU DE RESERVAS                           ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Reservas                                                ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Reservas                                                ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Reservas                                        ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Reservas                                            ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal                                      ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:                                                ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Reserva(Arch_R,Arch_P,Arch_VU,Arch_A,Arch_LA);
          '2': Baja_Reserva(Arch_R);
          '3': Modificar_Reserva(Arch_R);
          '4': Consulta_Reserva(Arch_R,Arch_P,Arch_VU);
          End;
          TextColor(White);
          TextBackground(Black);
          readkey;
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Pasajeros;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                        MENU DE PASAJEROS         ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Pasajeros                    ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Pasajeros                     ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Pasajeros                 ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Pasajeros                   ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal          ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:            ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Pasajero(Arch_P);
          '2': Baja_Pasajero(Arch_P);
          '3': Modificar_Pasajero(Arch_P);
          '4': Consulta_Pasajero(Arch_P);
          End;
          TextColor(White);
          TextBackground(Black);
          readkey;
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Aeropuertos;
Var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                       MENU DE AEROPUERTOS           ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Aeropuertos                ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Aeropuertos                  ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Aeropuertos             ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Aeropuertos                 ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal              ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:           ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Aeropuerto(Arch_A);
          '2': Baja_Aeropuerto(Arch_A);
          '3': Modificar_Aeropuerto(Arch_A);
          '4': Consulta_Aeropuerto(Arch_A);
          End;
          TextColor(White);
          TextBackground(Black);
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Ventas;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                          MENU DE VENTAS                ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Ventas                         ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Ventas                           ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Ventas                      ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Ventas                 ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal              ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:                   ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Venta(Arch_V,Arch_P);
          '2': Baja_Venta(Arch_V);
          '3': Modificar_Venta(Arch_V);
          '4': Consulta_Venta(Arch_V,Arch_P);
          End;
          TextColor(White);
          TextBackground(Black);
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Lineas;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                       MENU DE LINEAS AEREAS          ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Alta de Lineas Aereas                ');
     GotoXY(26,11);
     Writeln('-->  2- Baja de Lineas Aereas           ');
     GotoXY(26,12);
     Writeln('-->  3- Modificacion de Lineas Aereas            ');
     GotoXY(26,13);
     Writeln('-->  4- Consulta de Lineas Aereas             ');
     GotoXY(26,14);
     Writeln('-->  a- Regresar al Menu Principal          ');
     GotoXY(15,16);
     Writeln('  Ingrese una opcion:         ');
     GotoXY(36,16);
     Opc:=readkey;
     Case (Opc) of
          '1': Alta_Linea(Arch_LA);
          '2': Baja_Linea(Arch_LA);
          '3': Modificar_Linea(Arch_LA);
          '4': Consulta_Linea(Arch_LA);
          End;
          TextColor(White);
          TextBackground(Black);
     Until(Opc='a') or (Opc='A');
End;

Procedure Menu_Busqueda;
var Opc:char;
Begin
     TextColor(White);
     TextBackground(Black);
     Repeat
     Clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                          MENU DE BUSQUEDA        ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Segun una fecha, vuelos que despegan de un aeropuerto           ');
     GotoXY(26,11);
     Writeln('-->  2- Segun un rango de fechas, vuelos realizados por una linea aerea ');
     GotoXY(26,12);
     Writeln('-->  3- Segun un pasajero, vuelos que ha realizado                      ');
     GotoXY(26,13);
     Writeln('-->  a- Regresar al Menu Principal                                      ');
     GotoXY(15,15);
     Writeln('  Ingrese una opcion:                                                ');
     GotoXY(36,15);
     Opc:=readkey;
     Case (Opc) of
           '1': Fecha_Vuelo_Aeropuerto(Arch_VU,Arch_A);
           '2': Fechas_Vuelo_Aerolinea(Arch_VU,Arch_LA);
           '3': Pasajero_Vuelo(Arch_R,Arch_VU,Arch_P);
          End;
          readkey;
          TextColor(White);
          TextBackground(Black);
     Until(Opc='a') or (Opc='A');
End;

procedure M_Principal();
var Opc:char;
begin
     Repeat
     clrscr;
     TextColor(1);
     TextBackground(7);
     Fondo;
     GotoXY(23,5);
     Writeln('                          MENU PRINCIPAL                            ');
     GotoXY(15,9);
     Writeln('  Opciones:');
     GotoXY(26,10);
     Writeln('-->  1- Menu Vuelos     ');
     GotoXY(26,11);
     Writeln('-->  2- Menu Reservas       ');
     GotoXY(26,12);
     Writeln('-->  3- Menu Pasajeros      ');
     GotoXY(26,13);
     Writeln('-->  4- Menu Aeropuertos     ');
     GotoXY(26,14);
     Writeln('-->  5- Menu Ventas      ');
     GotoXY(26,15);
     Writeln('-->  6- Menu Lineas Aereas       ');
     GotoXY(26,16);
     Writeln('-->  7- Menu Busqueda     ');
     GotoXY(26,17);
     Writeln('-->  a- Salir    ');
     GotoXY(15,19);
     Writeln('  Ingrese una opcion: ');
     GotoXY(36,19);
     Opc:=readkey;
     Case (Opc) of
          '1': Menu_Vuelos;
          '2': Menu_Reservas;
          '3': Menu_Pasajeros;
          '4': Menu_Aeropuertos;
          '5': Menu_Ventas;
          '6': Menu_Lineas;
          '7': Menu_Busqueda;
          End;
     Until(Opc='a') or (Opc='A');
end;

////////////////////////////////////////////////////////////////// CUERPO PRINCIPAL //////////////////////////////////////////////////////////////////////
begin

end.
