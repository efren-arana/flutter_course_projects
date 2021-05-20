import 'package:flutter/material.dart';
import 'package:qr_map_sqlite/src/bloc/scans_bloc.dart';
import 'package:qr_map_sqlite/src/providers/db_provider.dart';
import 'package:qr_map_sqlite/src/utils/scan_util.dart' as utilscan;

class MapsPages extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    //ejecuto esta instruccion para obtener todos los scans a lo que se vuelve
    // a recargar la pagina
    scansBloc.obtenerScans();

    return StreamBuilder(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(child: Text('No hay informacion!!!'));
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.redAccent),
              onDismissed: (direction) => scansBloc.borrarScan(scans[index].id),
              child: ListTile(
                leading:
                    Icon(Icons.cloud, color: Theme.of(context).primaryColor),
                title: Text('${scans[index].valor}'),
                subtitle: Text('${scans[index].id}'),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Theme.of(context).primaryColor),
                onTap: () => utilscan.launchURL(context, scans[index]),
              ),
            );
          },
        );
      },
    );
  }
}
