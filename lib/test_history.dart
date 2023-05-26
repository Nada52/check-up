import 'package:flutter/material.dart';
import 'package:untitled1/dio/dio.dart';
import 'package:untitled1/models/patient_history.dart';
import 'package:untitled1/widgets/record.dart';

class TestHistory extends StatefulWidget {
  TestHistory({Key? key, required this.records}) : super(key: key);
  final List<PatientHistory> records;
  @override
  State<TestHistory> createState() => _TestHistoryState();
}

class _TestHistoryState extends State<TestHistory> {
  late String diseaseName;
  late String subDiseaseName;
  late String date;
  late String image;
  late String pdfUrl;
  late var record;
  void GetRecordData(value) {
    setState(() {
      diseaseName = value.iterator.current.diseaseName!;
      subDiseaseName = value.iterator.current.subDiseaseName!;
      date = value.iterator.current.checkRecordDate!;
      image = value.iterator.current.image!;
      pdfUrl = value.iterator.current.pdfUrl!;
    });

    print(diseaseName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPatientHistory().then((value) {
      record = Record(
          diseaseName: value.iterator.current.diseaseName!,
          subDiseaseName: value.iterator.current.subDiseaseName!,
          date: value.iterator.current.checkRecordDate!,
          image: value.iterator.current.image!,
          pdfUrl: value.iterator.current.pdfUrl!);
    });
    // getPatientHistory(context).then((value) {
    //   setState(() {
    //     diseaseName = value.iterator.current.diseaseName!;
    //     subDiseaseName = value.iterator.current.subDiseaseName!;
    //     date = value.iterator.current.checkRecordDate!;
    //     image = value.iterator.current.image!;
    //     pdfUrl = value.iterator.current.pdfUrl!;
    //   });
    //   return GetRecordData(value);
    // });
  }
  //Record(
  //                 image: widget.records[index].image!,
  //                 date: widget.records[index].checkRecordDate!,
  //                 diseaseName: widget.records[index].diseaseName!,
  //                 pdfUrl: widget.records[index].pdfUrl!,
  //                 subDiseaseName: widget.records[index].subDiseaseName!,
  //               )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => record,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: widget.records.length),
    );
  }
}
