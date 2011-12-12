require "spec_helper"

describe Anomaly::Detector do
  let(:data) { [[-1,-2],[0,0],[1,2]] }
  let(:ad) { Anomaly::Detector.new(data) }

  # mean = [0, 0], std = [1, 2]
  it "computes the right probability" do
    ad.probability([0,0]).should == 0.079577471545947667
  end

  it "marshalizes" do
    expect{ Marshal.dump(ad) }.to_not raise_error
  end

  context "when standard deviation is 0" do
    let(:data) { [[0],[0]] }

    it "returns infinity for mean" do
      ad.probability([0]).should == 1
    end

    it "returns 0 for not mean" do
      ad.probability([1]).should == 0
    end
  end

  context "when one training example" do
    let(:data) { [[0]] }

    it "returns infinity" do
      ad.probability([0]).should == 1
    end
  end

  context "when data is a matrix" do
    let(:data) { [[-1,-2],[0,0],[1,2]] }
    let(:sample) { [rand, rand] }

    it "returns the same probability as an NMatrix" do
      prob = ad.probability(sample)
      Object.send(:remove_const, :NMatrix)
      prob.should == Anomaly::Detector.new(data).probability(sample)
    end
  end
end