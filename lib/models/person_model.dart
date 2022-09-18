class variables {
  var name;
  var image;

  variables({this.image, this.name});
}

class DataOfPerson {
  static final data = [
    variables(
      image: "assets/images/person 1.png",
      name: "Person 1",
    ),
    variables(
      image: "assets/images/person 2.png",
      name: "Person 2",
    ),
    variables(
      image: "assets/images/person 3.png",
      name: "Person 3",
    ),
  ];
}
