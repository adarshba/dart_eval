import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/src/eval/declarations.dart';

class EvalCompilationUnit {
  EvalCompilationUnit(this.declarations);

  final List<DartDeclaration> declarations;

  EvalScope buildScope() {
    final scope = EvalScope(null, {});

    for (final d in declarations) {
      final dec = d.declare(DeclarationContext.TOPLEVEL, scope, scope);
      dec.forEach((key, value) {
        scope.define(key, value);
      });
    }
    return scope;
  }
}
