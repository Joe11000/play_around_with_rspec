require_relative '../lib/person'

describe Person do
  context 'class' do
    context 'instance of ' do

      it '#to_s' do
        expect(described_class.new.to_s).to be
      end
    end
  end

  context 'instance' do
    context 'initialize' do
      it 'default intialize' do
        expect(described_class.new 'Paul').to be_a Person
      end
    end
  end
end

describe Partier do
  context '#initialize' do
    it 'has a name, bal, and is alive' do
      p = Partier.new
      expect(p.name).to match /^[a-z]{5}$/
      expect(p.bal).to eq 0.0
      expect(p.alive).to eq true
    end
  end

  context '#drink' do
    it 'takes a drink and bal increases' do
      p = Partier.new

      p.drink

      expect(p.bal).to eq 0.01
      expect(p.alive).to eq true
    end

    it 'user dies if bal >= 0.4' do
      p = Partier.new

      # partier drank 39 drinks and is still alive
      39.times { p.drink }
      expect(p.bal).to eq 0.39
      expect(p.alive).to eq true

      # partier dies from alcohol poisening on 40th drink
      p.drink
      expect(p.bal).to eq 0.4
      expect(p.alive).to eq false

      # dead people can't drink any more
      p.drink
      expect(p.bal).to eq 0.4
      expect(p.alive).to eq false
    end
  end

  context '#test' do
    it 'partier should be rescued by his friends and doesnt punch you in the face' do
      expect(Partier.new.test).to eq 'Back off man...not tonight'
    end
  end

  context '#provoke' do
    it "you provoked a partier without his friends around to stop him from punching you in the face" do
      expect{Partier.new.provoke}.to raise_error('You got punched in the face')
    end
  end

  context '#say' do
    it '#say_block' do
      sentence = "Hey Party!!!"
      expect(Partier.new.say_block('useless param'){ sentence }).to eq sentence
    end

    it '#say_lambda' do
      sentence = lambda { |words| return "Hey Party!!!#{words}" }

      expect(Partier.new.say_lambda('useless_param'){ sentence.call('...and Kevin') }).to eq 'Hey Party!!!...and Kevin'
    end

    it '#say_proc' do
      sentence = Proc.new { |words| "Hey Party!!!#{words}" }

      expect(Partier.new.say_proc('useless_param'){ sentence.call('...and Kevin') }).to eq 'Hey Party!!!...and Kevin'
    end
  end

  context '#say_yield' do
    it '#say_block_yield' do
      sentence = "Hey Party!!!"
      expect(Partier.new.say_block_yield('useless param'){ sentence }).to eq sentence
    end

    it '#say_lambda_yield' do
      sentence = lambda { |words| return "Hey Party!!!#{words}" }

      expect(Partier.new.say_lambda_yield('useless_param'){ sentence.call('...and Kevin') }).to eq 'Hey Party!!!...and Kevin'
    end

    it '#say_proc_yield' do
      sentence = Proc.new { |words| "Hey Party!!!#{words}" }

      expect(Partier.new.say_proc_yield('useless_param'){ sentence.call('...and Kevin') }).to eq 'Hey Party!!!...and Kevin'
    end
  end

  context '#to_s' do
    it 'partier intro' do
      p = Partier.new
      expect(p.to_s).to eq "'Heeeellloooooooo there!', says #{p.name.capitalize}"
    end
  end
end
