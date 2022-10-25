import 'package:ener_prueba/src/navbottom/check_box.dart';
import 'package:ener_prueba/src/widgets/columns_rows.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tables extends StatelessWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ColumnsRows>(
        create: (context) => ColumnsRows(),
        child: Consumer<ColumnsRows>(
          builder: (context, provider, child) {
            if (provider.data == null) {
              provider.gatData(context);
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Folio'),
                        tooltip: 'representa el numero de orden.'),
                    DataColumn(
                        label: Text('Tipo'),
                        tooltip: 'representa el tipo de mercancia.'),
                    DataColumn(
                        label: Text('Cliente'),
                        tooltip: 'representa el nombre del cliente.'),
                    DataColumn(
                        label: Text('Pieza'),
                        tooltip: 'representa cuantas piezas utilizadas.'),
                    DataColumn(
                        label: Text('Entregado'),
                        tooltip: 'representa cuantas piezas utilizadas.'),
                  ],
                  rows: provider.data!.results!
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(Text(data.folio!)),
                            DataCell(Text(data.tipo!)),
                            DataCell(Text(data.cliente!)),
                            DataCell(Text(data.pieza!)),
                            const DataCell(CheckBoxts())
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
