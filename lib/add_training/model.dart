
class PostModel {
  String? image;
  String? uId;


 String? companyName;
  String? trainingName;
  String? city;
 String? street;
 String? trainingSpecialization;
 String? trainingCost;
 String? trainingDescription;
 String? startDate;
 String? endDate;



  PostModel({
    required this.companyName,
    required this.trainingName,
    required this.city,
    required this.uId,
    required this.image,
    required this.street,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.trainingDescription,
    required this.startDate,
    required this.endDate,

  });

  PostModel.fromJson(Map<String ,dynamic > json){

    companyName = json['companyName'];
    companyName = json['trainingName'];
    city = json['city'];
    uId = json['uId'];
    image = json['image'];
    street = json['street'];
    trainingSpecialization = json['trainingSpecialization'];
    trainingCost = json['trainingCost'];
    trainingDescription = json['trainingDescription'];
    startDate = json['startDate'];
    endDate = json['endDate'];


  }

  Map<String, dynamic>  toMap (){

    return {
      'uId' : uId,
      'image':image,
      'companyName':companyName,
      'trainingName':trainingName,
      'city':city,
      'street':street,
      'trainingSpecialization':trainingSpecialization,
      'trainingCost':trainingCost,
      'trainingDescription':trainingDescription,
      'startDate':startDate,
      'endDate':endDate,

    };

  }
}
