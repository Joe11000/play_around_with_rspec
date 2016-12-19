class Person
  attr_reader :name

  def initialize name=('a'..'z').to_a.sample(5).join
    @name = name
  end

  def to_s
    "what's up, #{@name}?"
  end
end


class Partier < Person
  attr_reader :alive

  def initialize name=('a'..'z').to_a.sample(5).join
    super name
    @drank = 0
    @alive = true
  end

  def to_s
    "'Heeeellloooooooo there!', says #{@name.capitalize}"
  end

  def drink
    if @alive
       @drank += 1

      if @drank >= 40
        @alive = false
      end
    end
    @drank
  end

  def bal
    @drank / 100.0
  end

  def test
    begin
      raise 'You got punched in the face'
    rescue
      'Back off man...not tonight'
    end
  end

  def provoke
    raise 'You got punched in the face'
  end


  def say_block unless_param, &sentence
    sentence.call
  end

  def say_proc unless_param, &sentence
    sentence.call
  end

  def say_lambda useless_param, &sentence
    sentence.call
  end

  def say_block_yield unless_param
    yield
  end

  def say_proc_yield unless_param
    yield
  end

  def say_lambda_yield useless_param
    yield
  end
end
