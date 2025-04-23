#!/usr/bin/env python3
from robot.api import ExecutionResult, ResultWriter
import json, os, sys

def merge_and_analyze(browser_results):
    """Merge multiple output.xml files and generate combined metrics"""
    # Merge all results
    merged_result = ExecutionResult(*browser_results.values())
    
    # Generate combined statistics
    stats = merged_result.statistics.total
    combined = {
        'summary': {
            'total': stats.total,
            'passed': stats.passed,
            'failed': stats.failed,
            'skipped': stats.skipped,
            'pass_rate': (stats.passed / stats.total) * 100 if stats.total > 0 else 0,
            'duration': merged_result.suite.elapsedtime / 1000  # seconds
        },
        'browsers': {}
    }

    # Add per-browser breakdown
    for browser, path in browser_results.items():
        result = ExecutionResult(path)
        browser_stats = result.statistics.total
        combined['browsers'][browser] = {
            'passed': browser_stats.passed,
            'failed': browser_stats.failed,
            'pass_rate': (browser_stats.passed / browser_stats.total) * 100 if browser_stats.total > 0 else 0
        }

    return combined

if __name__ == '__main__':
    browser_files = {
        'chrome': 'chrome/output.xml',
        'firefox': 'firefox/output.xml',
        'safari': 'safari/output.xml'
    }
    
    # Verify all files exist
    missing = [b for b, f in browser_files.items() if not os.path.exists(f)]
    if missing:
        print(f"Missing results for: {', '.join(missing)}", file=sys.stderr)
        sys.exit(1)

    results = merge_and_analyze(browser_files)
    
    # Save merged results
    with open('combined_results.json', 'w') as f:
        json.dump(results, f, indent=2)
    
    # Generate merged HTML report (optional)
    ResultWriter(ExecutionResult(*browser_files.values())).write_results(
        report='merged_report.html',
        log='merged_log.html'
    )
    
    print(json.dumps(results, indent=2))