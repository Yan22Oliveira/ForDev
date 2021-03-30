import 'package:fordev/domain/entities/account_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';

import '../http/http.dart';

class RemoteAuthentication{
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AutheticationParams params) async{
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    await httpClient.request(url: url,method: 'post',body: body);
  }

}

class RemoteAuthenticationParams{

  final String email;
  final String password;

  RemoteAuthenticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AutheticationParams entity)=>
    RemoteAuthenticationParams(email: entity.email, password: entity.secret);
  
  Map toJson() => {'email':email, 'password': password};

}