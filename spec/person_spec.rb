require_relative '../lib/person'

xdescribe Person do
  context 'class' do
    context 'has module Gayness' do
      it 'includes the module' do
        expect(Person.ancestors).to include Person
      end

      it '#to_s' do
        "Heeeellloooooooo There sailer"
      end
    end
  end

  context 'instance' do
    context 'initialize' do
      it 'default intialize' do
        expect(described_class.new 'Paul').to be_a Person
      end
    end

    context '#to_s' do
      xit '' do

      end
    end

  end
end

describe Partier do
  context '#safe_test' do
    it 'should raise a GoFuckYourself error' do
      expect(Partier.new.test).to eq 'Back off man...not tonight'
    end

    it '#provoke' do
      expect{Partier.new.provoke}.to raise_error('You got punched in the face')
    end
  end

  context 'say' do
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

  context 'say_yield' do
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
end
