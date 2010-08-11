module Scrunch
  
  class Stylesheet
    alias :minify, :to_s
    
    def initialize(media_queries = [])
      @rules         = []
      @media_queries = media_queries
    end
    
    def <<(rule)
      @rules << rule
    end
    
    def pp(indent = 0)
      indent += 4 unless @media_queries.empty?
      
      rules_string = @rules.inject("") {|rs, r| rs << r.pp(indent) }
      space        = " " * indent
      
      if @media_queries.empty?
        rules_string
      else
        "@media " + @media_queries.join(", ") + "{\n" + rules_string + "}\n"
      end
    end
    
    def to_s
      rules_string = @rules.inject("") do |rs, r|
        rs << (rs.empty? ? "" : "\n") + r.to_s }
      end
      
      if @media_queries.empty?
        rules_string
      else
        "@media " + @media_queries.join(",") + "{" + rules_string + "}"
      end
    end
  end
  
  class Block
    
  end
  
  class AtRule
    
    def initialize(identifier, contents, block = nil)
      @identifier = identifier
      @contents   = contents
      @block      = block
    end
    
    def pp(indent = 0)
      rule  = "@" + @identifier + " " + contents
      space = " " * indent
      
      if @block
        space + rule + " {\n" + block.pp(indent + 2) + space + "}\n"
      else
        space + rule + ";\n"
      end
    end
    
    def to_s
      rule = "@" + @identifier + " " + contents
      
      @block ? rule + "{" + block.to_s + "}" : rule + ";"
    end
  end
  
  class Rule
    
    def initialize(selectors, declarations)
      @selectors    = selectors
      @declarations = declarations
    end
    
    def pp(indent = 0)
      return "" if @declarations.empty?
      
      space = " " * indent
      
      space + @selectors.join(", ") + " {\n" +
        @declarations.inject("") {|ds, d| ds << d.pp(indent + 4) }
      + space + "}\n"
    end
    
    def to_s
      @declarations.empty?
        ? ""
        : @selectors.join(",") + "{" + @declarations.join() + "}"
    end
  end
  
  class Declaration
    
    def initialize(property, value)
      @property = property
      @value    = value
    end
    
    def pp(indent = 0)
      (" " * indent) + @property + ": " + @value + ";\n"
    end
    
    def to_s
      @property + ":" + @value + ";"
    end
  end
  
end
