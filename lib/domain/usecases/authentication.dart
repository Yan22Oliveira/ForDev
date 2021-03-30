import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication{
  Future<AccontEntity>auth(AutheticationParams params);
}

class AutheticationParams{

  final String email;
  final String secret;

  AutheticationParams({
    @required this.email,
    @required this.secret,
  });

}