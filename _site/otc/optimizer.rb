#!/usr/bin/ruby

# Instructions

# - Install optipng + libjpeg (http://mxcl.github.com/homebrew/)
# - Put this file in a directory of images
# - Open in TextMate + run it (cmd+r)

# Config

dir = File.dirname(__FILE__)
optipng = "/usr/local/bin/optipng"
jpegtran = "/usr/local/bin/jpegtran"
png = ".png"
jpg = ".jpg"
suffix = "-opt"
replace = true

# Optimize PNGs

p "Optimizing .pngs in #{dir}"

Dir.glob(dir + "/**/*#{png}").each do |f| 

  d = File.dirname(f)
  n = "#{File.basename(f,File.extname(f))}#{suffix}#{png}"
  o = "#{d}/#{n}"

  if replace
    p "- #{f}"
    `#{optipng} #{f}`
  else
    p "- #{f} > #{o}"
    `#{optipng} #{f} -out #{o}`
  end

end

# Optimize JPGs

p "Optimizing .jpgs in #{dir}"

Dir.glob(dir + "/**/*#{jpg}").each do |f| 

  d = File.dirname(f)
  n = "#{File.basename(f,File.extname(f))}#{suffix}#{jpg}"
  o = "#{d}/#{n}"

  if replace
    p "- #{f}"
    `#{jpegtran} -optimize -copy none #{f}`
  else
    p "- #{f} > #{o}"
    `#{jpegtran} -optimize -outfile #{o} #{f}`
  end
  
end
