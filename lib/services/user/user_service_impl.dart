import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final Logger _log;

  UserServiceImpl({
    required UserRepository userRepository,
    required Logger log,
  })  : _userRepository = userRepository,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _userRepository.register(email, password);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no FirebaseAuth', e, s);
      throw Failure(message: 'Erro ao criar usuário no FirebaseAuth');
    }
  }

  @override
  Future<void> login(String login, String password) async {
    try {
      final accessToken = await _userRepository.login(login, password);
      _log.info('AccessToken: $accessToken');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: password);
      _log.info('Login realizado com sucesso');
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao fazer login no Firebase Auth', e, s);
      throw Failure(message: 'Erro ao fazer login no Firebase');
    }
  }
}
