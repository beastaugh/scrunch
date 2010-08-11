module Scrunch
  
  module Parser
    alias :tokenise, :tokenize # Americanism
    
    TOKENS = {
      :space => "\s+",
      :ident => "-?[A-Za-z_][A-Za-z0-9_-]*",
      :oper  => "(*|>)"
    }
    
    def read_and_parse(file)
      css_string   = self.read(file)
      token_stream = self.tokenise(css_string)
      
      self.parse(token_stream)
    end
    
    def read(file)
      File.read(file)
    end
    
    def tokenise(css_string)
      
    end
    
    def parse(token_stream)
      styleheet = Scrunch::Stylesheet.new
      
      # ... parsing goes here!
      
      styleheet
    end
  end
end
