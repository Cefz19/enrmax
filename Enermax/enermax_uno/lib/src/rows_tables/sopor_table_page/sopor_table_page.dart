import 'package:flutter/material.dart';

import '../data/all_usuarios.dart';
import '../model/usuarios.dart';
import '../widget2/scrollable_widget.dart';

class SoporTablePage extends StatefulWidget {
  const SoporTablePage({Key? key}) : super(key: key);

  @override
  State<SoporTablePage> createState() => _SoporTablePageState();
}

class _SoporTablePageState extends State<SoporTablePage> {
  late List<Usuarios> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsuarios);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Folio', 'Tipo', 'Cilente', 'Pieza'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Usuarios> users) => users.map((Usuarios user) {
        final cells = [user.folio, user.tipo, user.cliente, user.pieza];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.folio}', '${user2.folio}'));
    } else if (columnIndex == 1) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.tipo, user2.tipo));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.cliente, user2.cliente));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.pieza}', '${user2.pieza}'));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
