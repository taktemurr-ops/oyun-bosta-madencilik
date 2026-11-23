import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bosta_madencilik/oyun_bosta_madencilik.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bostaMadencilikConfig.title.length, 33);
    expect(bostaMadencilikConfig.tagline.length, 33);
    for (final s in bostaMadencilikConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(bostaMadencilikConfig.gameId, bostaMadencilikId);
    expect(bostaMadencilikRules.gameId, bostaMadencilikId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bostaMadencilikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bostaMadencilikId, optionalMechanics: bostaMadencilikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bostaMadencilikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
