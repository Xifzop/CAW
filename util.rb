module Util
    def self.kill_pid
        current_pid = Process.pid
        result = (`tasklist | grep ruby.exe`).inspect
        processes = result.chomp.split('\n')
        processes.pop
        processes.each { |p|
            pid = p.split[1]
            unless pid.to_i == current_pid
                `taskkill /PID #{pid} /T /F`
            end
        }
    end
end