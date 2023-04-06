# Emojer's compiler
class Emojer
  COMMANDS = ["+", ",", "-", ".", "<", ">", "[", "]"].freeze

  def initialize(program = [])
    @parentheses = {}
    @program = program
  end

  def tokenize
    @program = @program.chomp.strip.chars.map.with_index do |instruction, program_ptr|
      @program[program_ptr + 1] if instruction == ":" && COMMANDS.include?(@program[program_ptr + 1])
    end

    @program = @program.freeze
  end

  def parenthesize
    opened = []

    @program.each.with_index do |instruction, program_ptr|
      case instruction
      when COMMANDS[6]
        opened << program_ptr
      when COMMANDS[7]
        @parentheses[program_ptr] = opened.last
        @parentheses[opened.pop] = program_ptr
      end
    end

    @parentheses = @parentheses.freeze
  end

  def parse
    tokenize
    parenthesize
  end

  def evaluate
    code = []
    memory = [0]
    memory_ptr = 0
    program_ptr = 0

    while program_ptr < @program.length
      instruction = @program[program_ptr]

      case instruction
      when COMMANDS[0]
        memory[memory_ptr] += 1
      when COMMANDS[1]
        memory[memory_ptr] << gets.chop.ord
      when COMMANDS[2]
        memory[memory_ptr] -= 1
      when COMMANDS[3]
        code << memory[memory_ptr].chr
      when COMMANDS[4]
        memory_ptr -= 1
      when COMMANDS[5]
        memory_ptr += 1
        memory[memory_ptr] ||= 0
        memory[memory_ptr] ||= 0
      when COMMANDS[6]
        program_ptr = @parentheses[program_ptr] if memory[memory_ptr].zero?
      when COMMANDS[7]
        program_ptr = @parentheses[program_ptr] if memory[memory_ptr].nonzero?
      end

      program_ptr += 1
    end

    code.join.freeze
  end

  def compile
    parse
    evaluate
  end
end
