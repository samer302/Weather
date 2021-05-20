


class Main{
 var temp;
 var feels_like;
 var temp_min;
 var temp_max;
 var pressure;
 var sea_level;
 var grnd_level;
 var humidity;
 var temp_kf;
 Main({
   this.temp,
   this.feels_like,
   this.temp_min,
   this.temp_max,
   this.pressure,
   this.sea_level,
   this.grnd_level,
   this.humidity,
   this.temp_kf,
});
 Main.fromJson(Map<String,dynamic>json){
   temp = json['temp'];
   feels_like = json['feels_like'];
   temp_min = json['temp_min'];
   temp_max = json['temp_max'];
   pressure = json['pressure'];
   sea_level = json['sea_level'];
   grnd_level = json['grnd_level'];
   humidity = json['humidity'];
   temp_kf = json['temp_kf'];
 }
 Map<String,dynamic> toJson(){
   final Map<String,dynamic> data = new Map<String,dynamic>();
   data ['temp']=this.temp;
   data ['feels_like']=this.feels_like;
   data ['temp_min']=this.temp_min;
   data ['temp_max']=this.temp_max;
   data ['pressure']=this.pressure;
   data ['sea_level']=this.sea_level;
   data ['grnd_level']=this.grnd_level;
   data ['humidity']=this.humidity;
   data['temp_kf'] =this.temp_kf;
   return data;


 }
}