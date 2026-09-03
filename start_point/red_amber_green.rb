
lambda { |stdout,stderr,status|
  output = stdout + stderr
  pattern = Regexp.new('JUnit5 launcher: passed=(\d+), aborted=(\d+), failed=(\d+), skipped=(\d+)')
  match = pattern.match(output)
  return :amber if match.nil?
  passed, aborted, failed, skipped = match.captures.map(&:to_i)
  # A kata holding no specs at all runs nothing, which is not something passing.
  return :amber if passed + aborted + failed + skipped == 0
  return :green if failed.zero?
  # Spock renders a failed condition itself, so the => line under each failure
  # begins with its own wording. Code that broke reads two ways there. An
  # exception leaving a spec shows the throwable, which java prints as its class
  # name followed by a colon. One thrown while a condition was being evaluated
  # is named as that. Either way the spec did not get as far as an answer.
  thrown = output.scan(/^\s*=> (.*)$/).flatten
  broke = thrown.any? do |t|
    t =~ /\A[a-z][\w.]*\.[A-Z]\w*(Error|Exception)\b/ ||
      t.start_with?('Condition failed with Exception:')
  end
  return :amber if broke
  :red
}
