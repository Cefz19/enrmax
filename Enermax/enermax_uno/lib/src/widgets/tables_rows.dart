import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablesRows extends StatefulWidget {
  const TablesRows({Key? key}) : super(key: key);

  @override
  State<TablesRows> createState() => _TablesRowsState();
}

class _TablesRowsState extends State<TablesRows> {
  List<Distribucion> _distribucion = <Distribucion>[];
  late DistribucionDataGridSource _distribucionDataGridSource;

  @override
  void initState() {
    super.initState();
    _distribucion = getDistribucionData();
    _distribucionDataGridSource =
        DistribucionDataGridSource(distribuciones: _distribucion);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfDataGrid(
          source: _distribucionDataGridSource,
          selectionMode: SelectionMode.multiple,
          allowSorting: true,
          columns: <GridColumn>[
            GridColumn(
                columnName: 'Id',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Id',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            GridColumn(
                columnName: 'Folio',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Folio',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            GridColumn(
                columnName: 'Tipo',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tipo',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            GridColumn(
                columnName: 'Cliente',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Cliente',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            GridColumn(
                columnName: 'Pieza',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Pieza',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            GridColumn(
                columnName: 'Entregado',
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Entregado',
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  List<Distribucion> getDistribucionData() {
    return <Distribucion>[
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
      Distribucion(001, 'Acumulator', 'Paco', 002, 'Entregado'),
    ];
  }
}

class DistribucionDataGridSource extends DataGridSource {
  DistribucionDataGridSource({required List<Distribucion> distribuciones}) {
    dataGridRows = distribuciones
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.folio),
              DataGridCell<String>(columnName: 'tipo', value: dataGridRow.tipo),
              DataGridCell<String>(
                  columnName: 'cliente', value: dataGridRow.cliente),
              DataGridCell<int>(columnName: 'pieza', value: dataGridRow.pieza),
              DataGridCell<String>(
                  columnName: 'entregado', value: dataGridRow.entregado),
            ]))
        .toList();
  }
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: (dataGridCell.columnName == 'id' ||
                dataGridCell.columnName == 'entregado')
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Text(
          dataGridCell.value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList());
  }
}

class Distribucion {
  Distribucion(
    this.folio,
    this.tipo,
    this.cliente,
    this.pieza,
    this.entregado,
  );
  final int folio;
  final String tipo;
  final String cliente;
  final int pieza;
  final String entregado;
}
