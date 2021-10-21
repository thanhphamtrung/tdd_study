import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_study/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_study/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_study/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConCreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConCreteNumberTrivia(mockNumberTriviaRepository);
  });

  test(
    "should get trivia for the number from the repository",
    () async {
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(Params(number: tNumber));

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
