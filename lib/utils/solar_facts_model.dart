
class SolarFacts{
  final String content;
  final String image;

  SolarFacts({required this.content, required this.image});
  
  static List<SolarFacts> data =[
    SolarFacts(content: "Enjoy reduced electricity bills by generating your own power. Solar panels can significantly cut down your monthly expenses.",
        image: "assets/sf1"),
    
    SolarFacts(content: "Reduce your carbon footprint! Solar energy is a green, sustainable option, contributing to a healthier planet.",
        image: "assets/sf2"),

    SolarFacts(content: "Homes with solar panels often have higher resale values. Invest in your property and its future marketability.",
        image: "assets/sf3"),

    SolarFacts(content: "Gain independence from the grid! Solar panels empower you to produce your own energy, providing reliability during outages.",
        image: "assets/sf4")

  ];
}

