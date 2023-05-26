import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:untitled1/dio/dio.dart';
import 'package:untitled1/models/mr.dart';
import 'package:untitled1/models/patient_history.dart';
import '../services/sample.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  List<String> _selectedRowKeys = [];
  int _rowsPerPage = 10;
  List<PatientHistory> ? records = [];
  var record = MedicalRecord(
      diseaseName: "", subDiseaseName: "", checkRecordDate: "", image: "");

  getRecords() async {
    setState(() async{
      records = await getPatientHistory();
    });

    print(records);
  }

  @override
  void initState() {
    super.initState();
    getRecords();
    // _sortColumnName = 'diseaseName';
    // _sortAscending = false;
    // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (!_willSearch) {
    //     if (_latestTick != null && timer.tick > _latestTick!) {
    //       _willSearch = true;
    //     }
    //   }
    //   if (_willSearch) {
    //     _willSearch = false;
    //     _latestTick = null;
    //     setState(() {
    //       if (_filterTexts != null && _filterTexts!.isNotEmpty) {
    //         _filterTexts = _filterTexts;
    //         print('filterTexts = $_filterTexts');
    //       }
    //     });
    //   }
    // });
    // getPatientHistory(context);
    print(records);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(1.0),
          //WebDataTable(
          //               header: const Text(' Previous Checks',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
          //               actions: [
          //                 if (_selectedRowKeys.isNotEmpty)
          //                   SizedBox(
          //                     height: 40,
          //                     width: 100,
          //                     child: MaterialButton(
          //                       color: Colors.red,
          //                       child: const Text(
          //                         'Delete',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                       onPressed: () {
          //                         print('Delete!');
          //                         setState(() {
          //                           _selectedRowKeys.clear();
          //                         });
          //                       },
          //                     ),
          //                   ),
          //
          //               ],
          //               source: WebDataTableSource(
          //                 sortColumnName: _sortColumnName,
          //                 sortAscending: _sortAscending,
          //                 filterTexts: _filterTexts,
          //                 columns: [
          //                   WebDataColumn(
          //                     name: 'categoryName',
          //                     label: const Text('Category Name',style:TextStyle(color:Colors.lightBlueAccent,fontWeight: FontWeight.bold)),
          //                     dataCell: (value) => DataCell(Text('$value')),
          //                   ),
          //                   WebDataColumn(
          //                     name: 'diseaseName',
          //                     label: const Text(' Disease Name',style:TextStyle(color:Colors.lightBlueAccent,fontWeight: FontWeight.bold)),
          //                     dataCell: (value) => DataCell(Text('$value')),
          //                   ),
          //
          //                   WebDataColumn(
          //                       name: 'dateTime',
          //                       label: const Text('DateTime',style:TextStyle(color:Colors.lightBlueAccent,fontWeight: FontWeight.bold)),
          //                       dataCell: (value) {
          //                         if (value is DateTime) {
          //                           final text =
          //                               '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
          //                           return DataCell(Text(text));
          //                         }
          //                         return DataCell(Text(value.toString()));
          //                       },
          //                       filterText: (value) {
          //                         if (value is DateTime) {
          //                           return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
          //                         }
          //                         return value.toString();
          //                       }),
          //                   WebDataColumn(
          //                       name: 'xrayImage',
          //                       label: const Text('X-Ray Image',style:TextStyle(color:Colors.lightBlueAccent,fontWeight: FontWeight.bold)),
          //                       dataCell: (value) {
          //
          //                         return DataCell(value);
          //                       },
          //                       filterText: (value) {
          //                         if (value is DateTime) {
          //                           return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
          //                         }
          //                         return value.toString();
          //                       }),
          //                 ],
          //                 rows: SampleData().data,
          //                 selectedRowKeys: _selectedRowKeys,
          //                 onTapRow: (rows, index) {
          //                   print('onTapRow(): index = $index, row = ${rows[index]}');
          //                 },
          //                 onSelectRows: (keys) {
          //                   print('onSelectRows(): count = ${keys.length} keys = $keys');
          //                   setState(() {
          //                     _selectedRowKeys = keys;
          //                   });
          //                 },
          //                 primaryKeyName: 'categoryName',
          //               ),
          //               horizontalMargin: 100,
          //               onPageChanged: (offset) {
          //                 print('onPageChanged(): offset = $offset');
          //               },
          //               onSort: (columnName, ascending) {
          //                 print(
          //                     'onSort(): columnName = $columnName, ascending = $ascending');
          //                 setState(() {
          //                   _sortColumnName = columnName;
          //                   _sortAscending = ascending;
          //                 });
          //               },
          //               onRowsPerPageChanged: (rowsPerPage) {
          //                 print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
          //                 setState(() {
          //                   if (rowsPerPage != null) {
          //                     _rowsPerPage = rowsPerPage;
          //                   }
          //                 });
          //               },
          //               rowsPerPage: _rowsPerPage,
          //             ),
          child: records == null ? CircularProgressIndicator() : ListView.separated(
              itemBuilder: (context, index) => MedicalRecord(
                    subDiseaseName: records![index].subDiseaseName!,
                    diseaseName: records![index].diseaseName!,
                    image: records![index].image!,
                    checkRecordDate: records![index].checkRecordDate!,
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: records!.length));

  }
}
