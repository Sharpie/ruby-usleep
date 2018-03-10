require 'usleep'

describe Usleep do
  it 'blocks other threads when sleeping' do
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC, :float_second)

    sleeper = Thread.new { Usleep.sleep(1) }

    5.times do
      sleep(0.1)
      Thread.pass
    end

    sleeper.kill
    sleeper.join

    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC, :float_second)

    expect(end_time - start_time).to be > 1.0
  end
end
