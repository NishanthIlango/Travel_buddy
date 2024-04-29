class PostCardModel{
  final String origin;
  final String destination;
  final String travelDate;
  final String weightAllowance;

  PostCardModel({required this.origin,required this.destination,required this.travelDate,required this.weightAllowance,});
  factory PostCardModel.fromJson(Map<dynamic,dynamic> json,String id){
    return PostCardModel( origin: json["origin"].toString(), destination: json["destination"].toString(), travelDate: json["travelDate"].toString(), weightAllowance: json["weightAllowance"].toString());
  }
}