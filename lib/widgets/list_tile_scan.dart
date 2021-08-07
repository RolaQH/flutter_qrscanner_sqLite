import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ListTileScan extends StatelessWidget {
  ListTileScan({required this.scan});
  final ScanModel scan;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<ScanListProvider>(context, listen: false)
            .borrarScanPorId(scan.id!);
      },
      child: ListTile(
        leading: Icon(
          scan.tipo == "http" ? Icons.location_city : Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scan.valor),
        subtitle: Text(scan.id.toString()),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () => launchURL(context, scan),
      ),
    );
  }
}
