


class Weather{
  int id;
  String main ;
  String description;
  String icon;
  Weather({this.id, this.main, this.description, this.icon});
  Weather.fromJson(Map<String,dynamic>json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data ['id'] =this.id;
    data ['id'] =this.id;
    data ['id'] =this.id;
    data ['id'] =this.id;
    return data;
  }
}