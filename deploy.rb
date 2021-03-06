#!/usr/bin/env ruby

if ARGV.length == 0
  puts "usage: ./deploy RIAK_VERSION [RIAKCS_VERSION] [RIAKEE_VERSION]"
  exit(0)
end

if ENV['AWS_CLOUDFRONT_DIST_ID'] == '' || ENV['AWS_S3_BUCKET'] == ''
  puts "AWS_CLOUDFRONT_DIST_ID and AWS_S3_BUCKET env vars are required"
  exit(0)
end

`rm -rf build`
ENV['RIAK_VERSION'] = ARGV[0]
ENV['RIAKCS_VERSION'] = ARGV[1] || ARGV[0]
ENV['RIAKEE_VERSION'] = ARGV[2] || ARGV[0]
ENV['DEPLOY'] = 'true'
exec "bundle exec middleman build"
