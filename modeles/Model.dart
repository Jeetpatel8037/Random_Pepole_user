class UserData {
  final String photo;
  final String name;
  final String mail;
  final String phoneNumber;
  final String bod;
  final int age;
  final String gender;
  final String location;

  UserData(
      {required this.photo,
      required this.name,
      required this.mail,
      required this.phoneNumber,
      required this.bod,
      required this.age,
      required this.gender,
      required this.location});

  factory UserData.fromMap({required Map e}) {
    return UserData(
        photo: e["results"][0]["picture"]["large"],
        name:
            "${e["results"][0]["name"]["title"]} ${e["results"][0]["name"]["first"]}",
        mail: e["results"][0]["email"],
        phoneNumber: e["results"][0]["phone"],
        bod: e["results"][0]["dob"]["date"],
        age: e["results"][0]["dob"]["age"],
        gender: e["results"][0]["gender"],
        location:
            "${e["results"][0]["location"]["street"]["number"]}, ${e["results"][0]["location"]["street"]["name"]}, ${e["results"][0]["location"]["city"]}\n${e["results"][0]["location"]["state"]}, ${e["results"][0]["location"]["country"]},\n ${e["results"][0]["location"]["postcode"]}");
  }
}
