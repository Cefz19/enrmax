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
          body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                  width: 150.0,
                  child: MaterialButton(
                      color: Colors.greenAccent,
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'Barlow',
                            fontSize: 14.0),
                      ),
                      onPressed: () {}),
                ),
                Expanded(
                  child: SfDataGrid(
                    source: _distribucionDataGridSource,
                    columnSizer: ColumnSizeController(),
                    columnWidthMode: ColumnWidthMode.auto,
                    allowSorting: true,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'Id',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Id',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      GridColumn(
                          maximumWidth: 400,
                          minimumWidth: 200,
                          columnName: 'Folio',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Folio',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      GridColumn(
                          columnName: 'tipo',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Tipo',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      GridColumn(
                          columnName: 'cliente',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Cliente',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      GridColumn(
                          columnName: 'pieza',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Pieza',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      GridColumn(
                          columnName: 'entregado',
                          label: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Entregado',
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
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
