library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_metrics/cyclomatic_complexity/cyclomatic_complexity_metric.dart';
import 'package:solid_metrics/cyclomatic_complexity/models/cyclomatic_complexity_parameters.dart';

/// creates plugin
PluginBase createPlugin() => _SolidMetrics();

/// Solid metric linter
class _SolidMetrics extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    final List<LintRule> rules = [];

    if (configs.rules[CyclomaticComplexityMetric.lintCode.name]?.enabled ??
        false) {
      final complexityMetricParameters =
          CyclomaticComplexityParameters.fromJson(
        _getParamsForLintRule(
              configs,
              CyclomaticComplexityMetric.lintCode.name,
            ) ??
            {},
      );

      rules.add(
        CyclomaticComplexityMetric(
          additionalParameters: complexityMetricParameters,
        ),
      );
    }

    return rules;
  }

  /// Get params of lint rule
  Map<String, Object?>? _getParamsForLintRule(
    CustomLintConfigs configs,
    String code,
  ) {
    return configs.rules[code]?.json;
  }
}
