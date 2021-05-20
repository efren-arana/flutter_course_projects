
class Cast {
  List<Actor> actores = new List();

  Cast();

  Cast.fromJsonList(List<dynamic> jsonList){

    if ( jsonList == null ) return;

    jsonList.forEach((element) {
      final actor =  Actor.fromJsonMap(element);
      actores.add(actor);
    });
  }
}
class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String,dynamic> json) {
    this.castId       = json['cast_id'];
    this.character    = json['character'];
    this.creditId     = json['credit_id'];
    this.gender       = json['gender'];
    this.id           = json['id'];
    this.name         = json['name'];
    this.order        = json['order'];
    this.profilePath  = json['profile_path'];
  }

  getProfile() {
    if ( this.profilePath == null ) {
      return 'https://i.dlpng.com/static/png/6728146_preview.png';
    }else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
