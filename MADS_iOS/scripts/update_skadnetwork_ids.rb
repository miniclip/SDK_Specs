post_install do |installer|
  require 'open-uri'
  require 'xcodeproj'

  skad_url = "https://sdk.eng.miniclip.com/adtech/SKAdNetworkItems.txt"

  begin
    skad_networks = URI.open(skad_url).read.lines.map(&:strip).reject(&:empty?)
    puts "✅ Retrieved #{skad_networks.size} SKAdNetwork IDs."
  rescue => e
    puts "❌ Failed to fetch SKAdNetwork IDs: #{e.message}"
    exit 1
  end

  plist_paths = installer.aggregate_targets.flat_map do |target|
    target.user_project.native_targets.flat_map do |native_target|
      native_target.build_configurations.map do |config|
        plist_path = config.build_settings["INFOPLIST_FILE"]
        
        # Fix incorrect paths by normalizing
        if plist_path
          full_path = File.expand_path(plist_path.gsub("${SRCROOT}/", ""), target.user_project.path.parent)
          
          # Double-check if it's one directory deeper than expected
          unless File.exist?(full_path) && File.extname(full_path) == ".plist"
            deeper_path = File.join(File.dirname(full_path), File.basename(full_path, ".plist"), "Info.plist")
            full_path = deeper_path if File.exist?(deeper_path)
          end
          
          full_path
        end
      end
    end
  end.compact.uniq

  if plist_paths.empty?
    puts "❌ No valid Info.plist paths found."
    exit 1
  end

  puts "📂 Corrected Info.plist paths: #{plist_paths.join(', ')}"

  plist_paths.each do |plist_path|
    puts "📂 Checking Info.plist exists? #{File.exist?(plist_path) ? '✅ Yes' : '❌ No'}"
    puts "🔍 Checking path details: #{`ls -l #{plist_path}` rescue '❌ Cannot access file'}"

    next unless File.exist?(plist_path)

    puts "📝 Updating #{plist_path}..."

    begin
      plist = Xcodeproj::Plist.read_from_path(plist_path) || {}

      skad_items = skad_networks.map { |id| { "SKAdNetworkIdentifier" => id } }
      plist["SKAdNetworkItems"] = skad_items

      Xcodeproj::Plist.write_to_path(plist, plist_path)
      puts "✅ Updated #{plist_path} with #{skad_networks.size} SKAdNetwork entries."
    rescue => e
      puts "❌ Error updating #{plist_path}: #{e.message}"
    end
  end
end
