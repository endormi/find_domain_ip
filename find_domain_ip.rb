#!/usr/bin/ruby

require "net/http"
require "resolv"

trap "SIGINT" do
  puts "\nExiting.."
  exit 130
end

dns_resolv = Resolv::DNS.new()

if (ARGV.empty?)
  print "Domain: "
  c = gets.chomp.to_s.downcase
else
  c = ARGV[0]
end

begin
  check_host = dns_resolv.getaddress(c)
  puts "IP for (#{c}): #{check_host}"
rescue Resolv::ResolvError => e
  puts "Error: #{e}"
end
