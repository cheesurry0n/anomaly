
# AnomalyDetector

Anomaly detection using a normal distribution.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "anomaly_detector"
```

And then execute:

```sh
bundle install
```

## How to Use

Train the detector with **only non-anomalies**. Each row is a sample.

```ruby
train_data = [
  [0.1, 100, 1.4],
  [0.2, 101, 2.1],
  [0.5, 102, 1.6]
]
ad = AnomalyDetector.new(train_data)
```

That's it! Let's test for anomalies.

```ruby
test_sample = [1.0, 100, 1.4]
ad.probability(test_sample)
# => 0.0007328491480297603
```

**Super-important:** You must select a threshold for anomalies (which we denote with ε - "epsilon")

Probabilities less than ε are considered anomalies. If ε is higher, more things are considered anomalies.

``` ruby
ad.anomaly?(test_sample, 1e-10)
# => false
ad.anomaly?(test_sample, 0.5)
# => true
```

Here's sample to code to help you find the best ε for your application.

```ruby
# TODO
```

You can easily persist the detector in a file or database.

```ruby
# TODO Finish example
Marshal.dump(ad)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

A special thanks to [Andrew Ng](http://www.ml-class.org).