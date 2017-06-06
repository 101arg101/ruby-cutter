#!/usr/bin/ruby
# ARGV[0] = pp_1536x2048.png (file with no path to)
# ARGV[1] = 0 (zoom level)
if ARGV.length == 2
  target_dir = ARGV[0][0...2] + ARGV[1]
  width, height = *ARGV[0].scan(/\d+/)
  columns = width.to_i  / 256
  rows    = height.to_i / 256
  puts "target_dir = #{target_dir}"
  puts "columns = #{columns}"
  puts "rows = #{rows}"
  
  columns.times do |x|
    rows.times do |y|
      puts "convert -extract 256x256+#{ (x * 256) }+#{ (y * 256) } #{ ARGV[0] } #{ target_dir }/#{ y }_#{ x }.png"
           `convert -extract 256x256+#{ (x * 256) }+#{ (y * 256) } #{ ARGV[0] } #{ target_dir }/#{ y }_#{ x }.png`
    end
  end
  puts 'bye'
else
  puts <<EOF
  ARGV[0] = pp_1536x2048.png (file with no path to)
  ARGV[1] = 0 (zoom level)
EOF
end