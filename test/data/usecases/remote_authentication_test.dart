import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';
import 'package:fordev/domain/usecases/usecases.dart';

class RemoteAuthentication{
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AutheticationParams params) async{
    final body = {
      'email': params.email,
      'password': params.secret
    };
    await httpClient.request(url: url,method: 'post',body: body);
  }
}

abstract class HttpClient{
  Future<void> request({
    @required String url,
    @required String method,
    Map body
  });
}

class HttpClientSpy extends Mock implements HttpClient{

}

void main(){

  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

    setUp((){
       httpClient = HttpClientSpy();
       url = faker.internet.httpsUrl();
       sut = RemoteAuthentication(httpClient: httpClient,url:url);
    });

    test('Should call HttpClient with corrent values',()async{

      final params = AutheticationParams(email: faker.internet.email(),secret: faker.internet.password());
      await sut.auth(params);

      verify(httpClient.request(
        url:url,
        method:'post',
        body: {'email':params.email, 'password': params.secret}
      ));

    });
}