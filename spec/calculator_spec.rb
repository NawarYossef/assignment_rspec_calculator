require 'example'

describe Calculator do
  let (:calculator) {Calculator.new}

  describe "#initialize" do
    value = false
    it "creates an instance variable with the value 'false'" do
    expect(calculator.instance_variable_get(:@stringify)).to eq(value)
    end

    it "creates an instance variable 'memory' with the value 'nil'" do
    expect(calculator.instance_variable_get(:@memory)).to eq(nil)
    end
  end

  describe "#add" do
    it "raises error if only one value is passed as argument" do
      expect{ Calculator.new.add(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.add(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "adds two positive numbers" do
      expect(calculator.add(1, 2)).to eq(3)
    end

    it "adds two negative numbers" do
      expect(calculator.add(-1, -2)).to eq(-3)
    end

    it "adds a positive number and a negative number" do
      expect(calculator.add(1, -2)).to eq(-1)
    end

    it "adds two floats" do
      expect(calculator.add(1.2, 2.6)).to be_within(0.5).of(4)
    end

    it "adds a float and an integer" do
      expect(calculator.add(1.2, 2)).to be_within(0.5).of(3)
    end
  end

  describe "#subtract" do
    it "raises error if only one value is passed as argument" do
      expect{ Calculator.new.subtract(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.subtract(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "subtracts two positive numbers" do
      expect(calculator.subtract(3, 1)).to eq(2)
    end

    it "subtracts two negative numbers" do
      expect(calculator.subtract(-1, -2)).to eq(1)
    end

    it "subtracts a positive number and a negative number" do
      expect(calculator.subtract(1, -2)).to eq(3)
    end

    it "subtracts two floats" do
      expect(calculator.subtract(2.8, 0.6)).to be_within(0.5).of(2.5)
    end

    it "subtracts a float and an integer" do
      expect(calculator.subtract(1.2, 2)).to be_within(0.5).of(-1)
    end
  end

  describe "#multiply" do
    it "raises error if only one value is passed as argument" do
      expect{ Calculator.new.multiply(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.multiply(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "multiplies two positive numbers" do
      expect(calculator.multiply(3, 2)).to eq(6)
    end

    it "multiplies two negative numbers" do
      expect(calculator.multiply(-2, -3)).to eq(6)
    end

    it "multiplies a positive number and a negative number" do
      expect(calculator.multiply(5, -2)).to eq(-10)
    end

    it "multiplies two floats" do
      expect(calculator.multiply(2.8, 0.6)).to be_within(0.5).of(2)
    end

    it "multiplies a float and an integer" do
      expect(calculator.multiply(1.2, 2)).to be_within(0.5).of(2.5)
    end
  end

  describe "#divide" do
    it "raises error if only one value is passed as argument" do
      expect{ Calculator.new.divide(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.divide(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "divides two positive numbers" do
      expect(calculator.divide(6, 2)).to eq(3)
    end

    it "divides two negative numbers" do
      expect(calculator.divide(-6, -3)).to eq(2)
    end

    it "divides a positive number and a negative number" do
      expect(calculator.divide(10, -2)).to eq(-5)
    end

    it "divides two floats" do
      expect(calculator.divide(2.8, 0.6)).to be_within(0.5).of(4.5)
    end

    it "divide a float and an integer" do
      expect(calculator.divide(2.4, 2)).to be_within(0.5).of(1)
    end
  end

  describe "#pow" do
    it "raises error if only one value is passed as argument" do
      expect{ Calculator.new.pow(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.pow(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "it always returns value as float" do
      expect(calculator.pow(6, 2)).to be_within(0.5).of(36.1)
    end

    it "it exponentiate a positive float numbers to another positive float " do
      expect(calculator.pow(9.2, 2.1)).to be_within(0.5).of(105.27066425)
    end

    it "it exponentiate a positive number to another positive number" do
      expect(calculator.pow(6, 2)).to be_within(0.5).of(36.1)
    end

    it "it exponentiate a positive number to a negative number" do
      expect(calculator.pow(7, -3)).to be_within(0.005).of(0.00591545189)
    end

    it "it exponentiate a negative number to another negative number" do
      expect(calculator.pow(-7, -2)).to be_within(0.05).of(-0.01040816326)
    end
  end

  describe "#sqr" do
    it "does not raise an error if only one value is passed as argument" do
      expect{ Calculator.new.sqrt(1) }.not_to raise_error
    end

    it "raises error if more than two values are passed as argument" do
      expect{ Calculator.new.sqrt(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "returns the square root for a positive number" do
      expect(calculator.sqrt(5)).to be_within(0.5).of(2.53)
    end

    it "raises errors for negative inputs" do
      expect{ Calculator.new.sqrt(-5) }.to raise_error(ArgumentError)
    end

    it "returns integers for round roots" do
      expect(calculator.sqrt(25)).to eq(5)
    end

    it "returns 2-digit decimals for non-round roots" do
      expect(calculator.sqrt(5.2)).to eq(2.28)
    end
  end

  describe "#memory" do
    new_calculator = Calculator.new
    new_calculator.memory = 2200

    it "returns the value created with the setter method" do
      expect(new_calculator.memory).to eq(2200)
    end

    it "resets the value of @memory to 'nil' after #memory method is finished execution" do
      new_calculator.memory = "some value"
      expect(new_calculator.memory).to eq("some value")
      expect(new_calculator.instance_variable_get(:@memory)).to eq(nil)
    end
  end

  describe "#output" do
    calculator = Calculator.new
    it " it does not return the outcome of each arithmatic method as a string" do
      expect(calculator.output(33)).not_to eq(33.to_s)
    end
  end
end