import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablesRows extends StatefulWidget {
  const TablesRows({Key? key}) : super(key: key);

  @override
  State<TablesRows> createState() => _TablesRowsState();
}

class _TablesRowsState extends State<TablesRows> {
  late List<Distribucion> _distribucion;
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
          columns: <GridColumn>[
            GridColumn(
                columnName: 'id',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Id',
                      overflow: TextOverflow.ellipsis, softWrap: false),
                )),
            GridColumn(
                columnName: 'folio',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Folio',
                      overflow: TextOverflow.ellipsis, softWrap: false),
                )),
            GridColumn(
                columnName: 'tipo',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Tipo',
                      overflow: TextOverflow.ellipsis, softWrap: false),
                )),
            GridColumn(
                columnName: 'cliente',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Cliente',
                      overflow: TextOverflow.ellipsis, softWrap: false),
                )),
            GridColumn(
                columnName: 'pieza',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Pieza',
                      overflow: TextOverflow.ellipsis, softWrap: false),
                )),
            GridColumn(
                columnName: 'entregado',
                autoFitPadding: const EdgeInsets.all(10.0),
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Entregado',
                      overflow: TextOverflow.ellipsis, softWrap: false),
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
  late List<DataGridRow> dataGridRows;

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataCell) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment:
            (dataCell.columnName == 'id' || dataCell.columnName == 'entregado')
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: Text(
          dataCell.value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList());
  }
}

class ColumnSizeController extends ColumnSizer {
  @override
  double computeCellWidth(
    GridColumn column,
    DataGridRow row,
    Object? cellValue,
    TextStyle textStyle,
  ) {
    return column.maximumWidth;
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
