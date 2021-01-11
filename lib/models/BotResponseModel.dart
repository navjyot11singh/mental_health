class BotResponse{

  final List<ResponseData> response;

  BotResponse({
    this.response,
  });

  factory BotResponse.fromJson(List<dynamic> parsedJson) {

    List<ResponseData> response = new List<ResponseData>();
    response = parsedJson.map((i)=>ResponseData.fromJson(i)).toList();

    return new BotResponse(
        response: response
    );
  }
}
class ResponseData{
  final String userId;
  final String text;

  ResponseData({
    this.userId,
    this.text,
  }) ;

  factory ResponseData.fromJson(Map<String, dynamic> json){
    return new ResponseData(
      userId: json['id'].toString(),
      text: json['title'],
    );
  }

}