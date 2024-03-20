class estimate{
  final String value;
  final int solarPlant;
  final int solarStructure;
  final int inverter;
  final int mc;
  final int dc;
  final int ac;
  final int space;
  final int cost;

  estimate({required this.value, required this.solarPlant, required this.solarStructure, required this.inverter, required this.mc, required this.dc, required this.ac, required this.space, required this.cost});
  
  static List<estimate> data =[

    estimate(value: "Select",
        solarPlant:0,
        solarStructure: 0,
        inverter: 0,
        mc: 0,
        dc: 0,
        ac: 0,
        space: 0,
        cost: 0),

    estimate(value: "1kwp",
        solarPlant:4,
        solarStructure: 1,
        inverter: 1,
        mc: 2,
        dc: 1,
        ac: 1,
        space: 100,
        cost: 65000),

    estimate(value: "2kwp",
        solarPlant:8,
        solarStructure: 2,
        inverter: 2,
        mc: 2,
        dc: 1,
        ac: 1,
        space: 200,
        cost: 110000),

    estimate(value: "3kwp",
        solarPlant:9,
        solarStructure: 3,
        inverter: 3,
        mc: 2,
        dc: 1,
        ac: 1,
        space: 280,
        cost: 165000),

    estimate(value: "4kwp",
        solarPlant:12,
        solarStructure: 4,
        inverter: 4,
        mc: 2,
        dc: 1,
        ac: 1,
        space: 450,
        cost: 250000),

    estimate(value: "5kwp",
        solarPlant:15,
        solarStructure: 5,
        inverter: 5,
        mc: 2,
        dc: 1,
        ac: 1,
        space: 500,
        cost: 300000),
  ];

  static estimate? getDataForValue(String value) {
    final selectedData = data.firstWhere(
          (element) => element.value == value,
    );
    if(value==null){
      return null;
    }
    return selectedData;
  }

}