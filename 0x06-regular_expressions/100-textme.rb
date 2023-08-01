#!/usr/bin/env ruby

# Define the method to process log entries and extract information
def process_log_entry(log_entry)
  sender = log_entry.match(/\[from:(\S+)]/)&.captures&.first
  receiver = log_entry.match(/\[to:(\S+)]/)&.captures&.first
  flags = log_entry.match(/\[flags:(.*?)\]/)&.captures&.first

  "#{sender},#{receiver},#{flags}"
end

# Main method
def main
  if ARGV.length != 1
    puts "Please provide the path to the log file as the argument."
    return
  end

  log_file_path = ARGV[0]

  begin
    File.foreach(log_file_path) do |line|
      if line.include?("SMS") # Process only the lines containing SMS entries
        result = process_log_entry(line)
        puts result
      end
    end
  rescue Errno::ENOENT
    puts "File not found. Please provide a valid log file path."
  end
end

main

