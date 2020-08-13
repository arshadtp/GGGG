Pod::Spec.new do |s|

# 1
s.platform = :osx
s.osx.deployment_target = "10.10"
s.name = "FAIHASDSH"
s.summary = "RWPickFlavor lets a user select an ice cream flavor."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Keegan Rush" => "keeganrush@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/TheCodedSelf/RWPickFlavor"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "git@github.com:arshadtp/GGGG.git",
             :tag => "#{s.version}" }

# 7
s.framework = "Foundation"
# s.framework = "UIKit"
# s.dependency 'Alamofire', '~> 4.7'
# s.dependency 'MBProgressHUD', '~> 1.1.0'

# 8
s.source_files = "FAIHASDSH/**/*.{swift}"

# 9
# s.resources = "RWPickFlavor/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "4.2"

s.script_phase = {
  :name => 'Hello World',
  :script => '
    writeToFile()
    {
        commandToWrite=$1
        frameworkPodFile=$2
        echo "== $frameworkPodFile"

        if grep -q "$commandToWrite" "$frameworkPodFile"; then
            echo "already contains"
        else
            echo "$commandToWrite" | cat - "$frameworkPodFile" > temp && mv temp "$frameworkPodFile"
        fi

    }

     SCRIPT_PATH=$(find . -type f -name "*-frameworks.sh")
     echo "$SCRIPT_PATH"

     while read -r line; do
         echo "*** ==== $line"
         path="$line"
         path=${path:2}
         echo "*** $path"
         writeToFile "export EXPANDED_PROVISIONING_PROFILE=\"\"" "$path"
         writeToFile "export EXPANDED_CODE_SIGN_IDENTITY_NAME=\"\"" "$path"
         writeToFile "export EXPANDED_CODE_SIGN_IDENTITY=\"\"" "$path"
         chmod a+x "$path"
     done <<< "$SCRIPT_PATH"
              ',
  :execution_position => :before_compile
}

#s.prepare_command = <<-CMD
#     writeToFile()
#     {
#         commandToWrite=$1
#         frameworkPodFile=$2
#         echo "== $frameworkPodFile"
#
#         if grep -q "$commandToWrite" "$frameworkPodFile"; then
#             echo "already contains"
#         else
#             echo "$commandToWrite" | cat - "$frameworkPodFile" > temp && mv temp "$frameworkPodFile"
#         fi
#
#     }
#
#      SCRIPT_PATH=$(find . -type f -name "*-frameworks.sh")
#      echo "$SCRIPT_PATH"
#
#      while read -r line; do
#          echo "*** ==== $line"
#          path="$line"
#          path=${path:2}
#          echo "*** $path"
#          writeToFile "export EXPANDED_PROVISIONING_PROFILE=\"\"" "$path"
#          writeToFile "export EXPANDED_CODE_SIGN_IDENTITY_NAME=\"\"" "$path"
#          writeToFile "export EXPANDED_CODE_SIGN_IDENTITY=\"\"" "$path"
#
#      done <<< "$SCRIPT_PATH"
#CMD
#pods_root = 'Love'
#
## Directory where the generated files will be placed.
#dir = "#{pods_root}/#{s.name}"
#
#s.prepare_command = <<-CMD
#  mkdir #{pods_root}
#  echo "asa"
#CMD
#s.pod_target_xcconfig = {
#  'EXPANDED_CODE_SIGN_IDENTITY' => '',
#  'EXPANDED_CODE_SIGN_IDENTITY_NAME' => '',
#  'EXPANDED_PROVISIONING_PROFILE' => '',
#}
end
