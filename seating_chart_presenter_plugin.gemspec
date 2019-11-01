lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "seating_chart_presenter_plugin"
  spec.version       = '0.1.0'
  spec.authors       = ["Tyler Lemburg"]
  spec.email         = ["tyler@geotix.com"]

  spec.summary       = %q{For utilizing a geotix seating chart.}
  spec.homepage      = 'http://github.com/mynorth/seating_chart_presenter_plugin'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "bundler", "~> 2.0"
end
