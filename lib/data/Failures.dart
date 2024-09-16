class Failures{
  String?errorMessage;
  Failures({required this.errorMessage});
  @override
  String toString(){
    return "Failures(errorMessage:$errorMessage)";
  }
}
class ServerError extends Failures{
  ServerError({required super.errorMessage});

}
class NetworkError extends Failures{
  NetworkError({required super.errorMessage});

}