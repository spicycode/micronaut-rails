module Micronaut
  module Rails
    module Version
      MAJOR = 0
      MINOR = 0
      TINY  = 6
      MINISCULE = 1
      
      STRING = [MAJOR, MINOR, TINY, MINISCULE].join('.')
      
      MICRONAUT_REQUIRED_VERSION = ">= 0.1.6"
    end
  end
end
