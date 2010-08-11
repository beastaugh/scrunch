# Autogenerated from a Treetop grammar. Edits may be lost.

# encoding: utf-8
module CascadingStylesheets
  include Treetop::Runtime

  def root
    @root ||= :ident
  end

  module Ident0
    def nmstart
      elements[1]
    end

  end

  def _nt_ident
    start_index = index
    if node_cache[:ident].has_key?(index)
      cached = node_cache[:ident][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('-', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_nmstart
      s0 << r3
      if r3
        s4, i4 = [], index
        loop do
          r5 = _nt_nmchar
          if r5
            s4 << r5
          else
            break
          end
        end
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Ident0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:ident][start_index] = r0

    r0
  end

  module Name0
    def nmchar
      elements[0]
    end

  end

  def _nt_name
    start_index = index
    if node_cache[:name].has_key?(index)
      cached = node_cache[:name][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_nmchar
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_nmchar
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Name0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:name][start_index] = r0

    r0
  end

  def _nt_nmstart
    start_index = index
    if node_cache[:nmstart].has_key?(index)
      cached = node_cache[:nmstart][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('\G[a-zA-Z]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('_', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('_')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        r3 = _nt_nonascii
        if r3
          r0 = r3
        else
          r4 = _nt_escape
          if r4
            r0 = r4
          else
            @index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:nmstart][start_index] = r0

    r0
  end

  def _nt_nonascii
    start_index = index
    if node_cache[:nonascii].has_key?(index)
      cached = node_cache[:nonascii][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[\\x80-\\xD7FF\\xE000-\\xFFFD\\x10000-\\x10FFFF]', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:nonascii][start_index] = r0

    r0
  end

  module Unicode0
  end

  def _nt_unicode
    start_index = index
    if node_cache[:unicode].has_key?(index)
      cached = node_cache[:unicode][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\\', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('\\')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9a-fA-F]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
        if s2.size == 6
          break
        end
      end
      if s2.size < 1
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        r5 = _nt_wc
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Unicode0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:unicode][start_index] = r0

    r0
  end

  module Escape0
  end

  def _nt_escape
    start_index = index
    if node_cache[:escape].has_key?(index)
      cached = node_cache[:escape][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_unicode
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      if has_terminal?('\\', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('\\')
        r3 = nil
      end
      s2 << r3
      if r3
        if has_terminal?('\G[\\x20-\\x7E\\x80-\\xD7FF\\xE000-\\xFFFD\\x10000-\\x10FFFF]', true, index)
          r4 = true
          @index += 1
        else
          r4 = nil
        end
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Escape0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:escape][start_index] = r0

    r0
  end

  def _nt_nmchar
    start_index = index
    if node_cache[:nmchar].has_key?(index)
      cached = node_cache[:nmchar][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('\G[a-zA-Z0-9]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('-', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('-')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('_', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('_')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          r4 = _nt_nonascii
          if r4
            r0 = r4
          else
            r5 = _nt_escape
            if r5
              r0 = r5
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end
    end

    node_cache[:nmchar][start_index] = r0

    r0
  end

  module Num0
  end

  def _nt_num
    start_index = index
    if node_cache[:num].has_key?(index)
      cached = node_cache[:num][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    if r1
      r0 = r1
    else
      i3, s3 = index, []
      s4, i4 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r5 = true
          @index += 1
        else
          r5 = nil
        end
        if r5
          s4 << r5
        else
          break
        end
      end
      r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      s3 << r4
      if r4
        if has_terminal?('.', false, index)
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('.')
          r6 = nil
        end
        s3 << r6
        if r6
          s7, i7 = [], index
          loop do
            if has_terminal?('\G[0-9]', true, index)
              r8 = true
              @index += 1
            else
              r8 = nil
            end
            if r8
              s7 << r8
            else
              break
            end
          end
          if s7.empty?
            @index = i7
            r7 = nil
          else
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          end
          s3 << r7
        end
      end
      if s3.last
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        r3.extend(Num0)
      else
        @index = i3
        r3 = nil
      end
      if r3
        r0 = r3
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:num][start_index] = r0

    r0
  end

  module String0
  end

  module String1
  end

  def _nt_string
    start_index = index
    if node_cache[:string].has_key?(index)
      cached = node_cache[:string][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?('"', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r2 = nil
    end
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        i4 = index
        r5 = _nt_stringchar
        if r5
          r4 = r5
        else
          if has_terminal?("'", false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("'")
            r6 = nil
          end
          if r6
            r4 = r6
          else
            @index = i4
            r4 = nil
          end
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s1 << r3
      if r3
        if has_terminal?('"', false, index)
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('"')
          r7 = nil
        end
        s1 << r7
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(String0)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i8, s8 = index, []
      if has_terminal?("'", false, index)
        r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("'")
        r9 = nil
      end
      s8 << r9
      if r9
        s10, i10 = [], index
        loop do
          i11 = index
          r12 = _nt_stringchar
          if r12
            r11 = r12
          else
            if has_terminal?('"', false, index)
              r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('"')
              r13 = nil
            end
            if r13
              r11 = r13
            else
              @index = i11
              r11 = nil
            end
          end
          if r11
            s10 << r11
          else
            break
          end
        end
        r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
        s8 << r10
        if r10
          if has_terminal?("'", false, index)
            r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("'")
            r14 = nil
          end
          s8 << r14
        end
      end
      if s8.last
        r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
        r8.extend(String1)
      else
        @index = i8
        r8 = nil
      end
      if r8
        r0 = r8
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:string][start_index] = r0

    r0
  end

  module Stringchar0
    def nl
      elements[1]
    end
  end

  def _nt_stringchar
    start_index = index
    if node_cache[:stringchar].has_key?(index)
      cached = node_cache[:stringchar][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_urlchar
    if r1
      r0 = r1
    else
      if has_terminal?('\x20', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure('\x20')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        i3, s3 = index, []
        if has_terminal?('\\', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('\\')
          r4 = nil
        end
        s3 << r4
        if r4
          r5 = _nt_nl
          s3 << r5
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Stringchar0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          r0 = r3
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:stringchar][start_index] = r0

    r0
  end

  def _nt_urlchar
    start_index = index
    if node_cache[:urlchar].has_key?(index)
      cached = node_cache[:urlchar][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('\G[\\x9\\x21\\x23-\\x26\\x27-\\x7E]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r2 = _nt_nonascii
      if r2
        r0 = r2
      else
        r3 = _nt_escape
        if r3
          r0 = r3
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:urlchar][start_index] = r0

    r0
  end

  module Nl0
  end

  def _nt_nl
    start_index = index
    if node_cache[:nl].has_key?(index)
      cached = node_cache[:nl][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('\xA', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('\xA')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      if has_terminal?('\xD', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('\xD')
        r3 = nil
      end
      s2 << r3
      if r3
        if has_terminal?('\xA', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('\xA')
          r4 = nil
        end
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Nl0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('\xD', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('\xD')
          r5 = nil
        end
        if r5
          r0 = r5
        else
          if has_terminal?('\xC', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('\xC')
            r6 = nil
          end
          if r6
            r0 = r6
          else
            @index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:nl][start_index] = r0

    r0
  end

  def _nt_w
    start_index = index
    if node_cache[:w].has_key?(index)
      cached = node_cache[:w][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_wc
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:w][start_index] = r0

    r0
  end

  def _nt_wc
    start_index = index
    if node_cache[:wc].has_key?(index)
      cached = node_cache[:wc][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('\x9', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('\x9')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('\xA', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('\xA')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('\xC', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('\xC')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?('\xD', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('\xD')
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?('\x20', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 4))
              @index += 4
            else
              terminal_parse_failure('\x20')
              r5 = nil
            end
            if r5
              r0 = r5
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end
    end

    node_cache[:wc][start_index] = r0

    r0
  end

  def _nt_css_ident
    start_index = index
    if node_cache[:css_ident].has_key?(index)
      cached = node_cache[:css_ident][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_ident

    node_cache[:css_ident][start_index] = r0

    r0
  end

  module CssAtkeyword0
    def ident
      elements[1]
    end
  end

  def _nt_css_atkeyword
    start_index = index
    if node_cache[:css_atkeyword].has_key?(index)
      cached = node_cache[:css_atkeyword][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('@', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('@')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_ident
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssAtkeyword0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_atkeyword][start_index] = r0

    r0
  end

  def _nt_css_string
    start_index = index
    if node_cache[:css_string].has_key?(index)
      cached = node_cache[:css_string][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_string

    node_cache[:css_string][start_index] = r0

    r0
  end

  module CssHash0
    def name
      elements[1]
    end
  end

  def _nt_css_hash
    start_index = index
    if node_cache[:css_hash].has_key?(index)
      cached = node_cache[:css_hash][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('#', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('#')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_name
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssHash0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_hash][start_index] = r0

    r0
  end

  def _nt_css_number
    start_index = index
    if node_cache[:css_number].has_key?(index)
      cached = node_cache[:css_number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_num

    node_cache[:css_number][start_index] = r0

    r0
  end

  module CssPercentage0
    def num
      elements[0]
    end

  end

  def _nt_css_percentage
    start_index = index
    if node_cache[:css_percentage].has_key?(index)
      cached = node_cache[:css_percentage][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_num
    s0 << r1
    if r1
      if has_terminal?('%', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('%')
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssPercentage0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_percentage][start_index] = r0

    r0
  end

  module CssDimension0
    def num
      elements[0]
    end

    def ident
      elements[1]
    end
  end

  def _nt_css_dimension
    start_index = index
    if node_cache[:css_dimension].has_key?(index)
      cached = node_cache[:css_dimension][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_num
    s0 << r1
    if r1
      r2 = _nt_ident
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssDimension0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_dimension][start_index] = r0

    r0
  end

  module CssUri0
    def w1
      elements[1]
    end

    def w2
      elements[3]
    end

  end

  def _nt_css_uri
    start_index = index
    if node_cache[:css_uri].has_key?(index)
      cached = node_cache[:css_uri][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('url(', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 4))
      @index += 4
    else
      terminal_parse_failure('url(')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_w
      s0 << r2
      if r2
        i3 = index
        r4 = _nt_string
        if r4
          r3 = r4
        else
          s5, i5 = [], index
          loop do
            r6 = _nt_urlchar
            if r6
              s5 << r6
            else
              break
            end
          end
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          if r5
            r3 = r5
          else
            @index = i3
            r3 = nil
          end
        end
        s0 << r3
        if r3
          r7 = _nt_w
          s0 << r7
          if r7
            if has_terminal?(')', false, index)
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(')')
              r8 = nil
            end
            s0 << r8
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssUri0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_uri][start_index] = r0

    r0
  end

  module CssUnicodeRange0
  end

  module CssUnicodeRange1
  end

  def _nt_css_unicode_range
    start_index = index
    if node_cache[:css_unicode_range].has_key?(index)
      cached = node_cache[:css_unicode_range][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('U+', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('U+')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9A-F?]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
        if s2.size == 6
          break
        end
      end
      if s2.size < 1
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        i5, s5 = index, []
        if has_terminal?('-', false, index)
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('-')
          r6 = nil
        end
        s5 << r6
        if r6
          s7, i7 = [], index
          loop do
            if has_terminal?('\G[0-9A-F]', true, index)
              r8 = true
              @index += 1
            else
              r8 = nil
            end
            if r8
              s7 << r8
            else
              break
            end
            if s7.size == 6
              break
            end
          end
          if s7.size < 1
            @index = i7
            r7 = nil
          else
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          end
          s5 << r7
        end
        if s5.last
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          r5.extend(CssUnicodeRange0)
        else
          @index = i5
          r5 = nil
        end
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssUnicodeRange1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_unicode_range][start_index] = r0

    r0
  end

  def _nt_css_cdo
    start_index = index
    if node_cache[:css_cdo].has_key?(index)
      cached = node_cache[:css_cdo][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('<!--', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 4))
      @index += 4
    else
      terminal_parse_failure('<!--')
      r0 = nil
    end

    node_cache[:css_cdo][start_index] = r0

    r0
  end

  def _nt_css_cdc
    start_index = index
    if node_cache[:css_cdc].has_key?(index)
      cached = node_cache[:css_cdc][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('-->', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('-->')
      r0 = nil
    end

    node_cache[:css_cdc][start_index] = r0

    r0
  end

  def _nt_css_s
    start_index = index
    if node_cache[:css_s].has_key?(index)
      cached = node_cache[:css_s][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_wc
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:css_s][start_index] = r0

    r0
  end

  module CssComment0
  end

  module CssComment1
  end

  def _nt_css_comment
    start_index = index
    if node_cache[:css_comment].has_key?(index)
      cached = node_cache[:css_comment][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('/*', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('/*')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[^*]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        s4, i4 = [], index
        loop do
          if has_terminal?('*', false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('*')
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          @index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        s0 << r4
        if r4
          s6, i6 = [], index
          loop do
            i7, s7 = index, []
            if has_terminal?('\G[^/]', true, index)
              r8 = true
              @index += 1
            else
              r8 = nil
            end
            s7 << r8
            if r8
              s9, i9 = [], index
              loop do
                if has_terminal?('\G[^*]', true, index)
                  r10 = true
                  @index += 1
                else
                  r10 = nil
                end
                if r10
                  s9 << r10
                else
                  break
                end
              end
              r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
              s7 << r9
              if r9
                s11, i11 = [], index
                loop do
                  if has_terminal?('*', false, index)
                    r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure('*')
                    r12 = nil
                  end
                  if r12
                    s11 << r12
                  else
                    break
                  end
                end
                if s11.empty?
                  @index = i11
                  r11 = nil
                else
                  r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
                end
                s7 << r11
              end
            end
            if s7.last
              r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
              r7.extend(CssComment0)
            else
              @index = i7
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s0 << r6
          if r6
            if has_terminal?('/', false, index)
              r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('/')
              r13 = nil
            end
            s0 << r13
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssComment1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_comment][start_index] = r0

    r0
  end

  module CssFunction0
    def ident
      elements[0]
    end

  end

  def _nt_css_function
    start_index = index
    if node_cache[:css_function].has_key?(index)
      cached = node_cache[:css_function][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_ident
    s0 << r1
    if r1
      if has_terminal?('(', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('(')
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CssFunction0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:css_function][start_index] = r0

    r0
  end

  def _nt_css_includes
    start_index = index
    if node_cache[:css_includes].has_key?(index)
      cached = node_cache[:css_includes][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('~=', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('~=')
      r0 = nil
    end

    node_cache[:css_includes][start_index] = r0

    r0
  end

  def _nt_css_dashmatch
    start_index = index
    if node_cache[:css_dashmatch].has_key?(index)
      cached = node_cache[:css_dashmatch][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('|=', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('|=')
      r0 = nil
    end

    node_cache[:css_dashmatch][start_index] = r0

    r0
  end

  def _nt_css_prefixmatch
    start_index = index
    if node_cache[:css_prefixmatch].has_key?(index)
      cached = node_cache[:css_prefixmatch][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('^=', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('^=')
      r0 = nil
    end

    node_cache[:css_prefixmatch][start_index] = r0

    r0
  end

  def _nt_css_suffixmatch
    start_index = index
    if node_cache[:css_suffixmatch].has_key?(index)
      cached = node_cache[:css_suffixmatch][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('$=', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('$=')
      r0 = nil
    end

    node_cache[:css_suffixmatch][start_index] = r0

    r0
  end

  def _nt_css_substringmatch
    start_index = index
    if node_cache[:css_substringmatch].has_key?(index)
      cached = node_cache[:css_substringmatch][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('*=', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('*=')
      r0 = nil
    end

    node_cache[:css_substringmatch][start_index] = r0

    r0
  end

  def _nt_css_char
    start_index = index
    if node_cache[:css_char].has_key?(index)
      cached = node_cache[:css_char][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[^"\']', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:css_char][start_index] = r0

    r0
  end

  def _nt_css_bom
    start_index = index
    if node_cache[:css_bom].has_key?(index)
      cached = node_cache[:css_bom][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\xFEFF', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('\xFEFF')
      r0 = nil
    end

    node_cache[:css_bom][start_index] = r0

    r0
  end

end

class CascadingStylesheetsParser < Treetop::Runtime::CompiledParser
  include CascadingStylesheets
end