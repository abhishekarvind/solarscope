import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class Companies{
  final String name;
  final String title;
  final String content;
  final String image;
  final List<String> model;
  final List<String> Pmax;
  final List<String> voltage;
  final List<String> current;

  Companies({required this.name, required this.title, required this.content, required this.image, required this.model, required this.Pmax, required this.voltage, required this.current});
}

Future<List<Companies>> loadCompanyData() async {
  List<Companies> data = [];

  final String csvString = await rootBundle.loadString('assets/companies.csv');
  final List<List<dynamic>> fields = const CsvToListConverter().convert(csvString);

  for (var row in fields) {
    final name = row[0].toString();
    final content = row[1].toString();
    final title = row[2].toString();
    final image = row[3].toString();
    final model = row[4].toString().split(',');
    final pmax = row[5].toString().split(',');
    final voltage = row[6].toString().split(',');
    final current = row[7].toString().split(',');

    final company = Companies(
      name: name,
      title: title,
      content: content,
      image: image,
      model: model,
      Pmax: pmax,
      voltage: voltage,
      current: current,
    );

    data.add(company);
  }

  return data;
}