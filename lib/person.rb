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

  def initialize name=('a'..'z').to_a.sample(5).join
    super name
  end

  def to_s
    "'Heeeellloooooooo there!', says #{@name.capitalize}"
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
