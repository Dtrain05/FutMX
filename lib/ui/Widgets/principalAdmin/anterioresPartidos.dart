import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_bd/Response/ApiResponse.dart';
import 'package:prueba_bd/models/partido.dart';
import 'package:prueba_bd/blocs/bloc.dart';
import 'package:provider/provider.dart';
import 'package:prueba_bd/providers/estadoGlobal.dart';

class AnterioresPartidosAdminList {
  AnterioresPartidosAdminList();

  Bloc bloc = new Bloc();

  Widget buildList(
      AsyncSnapshot<ApiResponse<PartidoModel>> snapshot, BuildContext context) {
    var myProvider = Provider.of<EstadoGlobal>(context, listen: false);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data.data.partidos
          .length, //El programa tiene que saber cuantos items ha de mostrar en la lista
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 2),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 3.0),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://futbolmx1.000webhostapp.com/imagenes/' +
                                  myProvider.equipo.foto,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        myProvider.equipo.nombre,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text(
                            myProvider.administradorUser.equipo ==
                                    snapshot.data.data.partidos[index].idEquipoA
                                ? snapshot
                                    .data.data.partidos[index].golesEquipoA
                                : snapshot
                                    .data.data.partidos[index].golesEquipoB,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text(
                            myProvider.administradorUser.equipo ==
                                    snapshot.data.data.partidos[index].idEquipoA
                                ? snapshot
                                    .data.data.partidos[index].golesEquipoB
                                : snapshot
                                    .data.data.partidos[index].golesEquipoA,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      snapshot.data.data.partidos[index].ciudad +
                          ', ' +
                          snapshot.data.data.partidos[index].ubicacion,
                      style: TextStyle(fontSize: 9, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      snapshot.data.data.partidos[index].fecha +
                          ', ' +
                          snapshot.data.data.partidos[index].hora,
                      style: TextStyle(fontSize: 9, color: Colors.blueGrey),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://futbolmx1.000webhostapp.com/imagenes/' +
                                  snapshot.data.data.partidos[index]
                                      .fotoEquipoContrario,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        snapshot
                            .data.data.partidos[index].nombreEquipoContrario,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
