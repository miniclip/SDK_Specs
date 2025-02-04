def update_skad_networks(installer)
  require 'open-uri'
  require 'xcodeproj'

  skad_url = "https://sdk.eng.miniclip.com/adtech/SKAdNetworkItems.txt"

  begin
    skad_networks = URI.open(skad_url).read.lines.map(&:strip).reject(&:empty?)
    puts "Retrieved #{skad_networks.size} SKAdNetwork IDs."
  rescue => e
    puts "Failed to fetch SKAdNetwork IDs: #{e.message}"
    exit 1
  end

  plist_paths = installer.aggregate_targets.flat_map do |target|
    target.user_project.native_targets.flat_map do |native_target|
      native_target.build_configurations.map do |config|
        plist_path = config.build_settings["INFOPLIST_FILE"]
        plist_path ? File.expand_path(plist_path.gsub("${SRCROOT}/", ""), target.user_project.path.parent.to_s) : nil
      end
    end
  end.compact.uniq

  if plist_paths.empty?
    puts "No valid Info.plist found. Check project structure."
    return
  end

  plist_paths.each do |plist_path|
    puts "Updating #{plist_path}..."
    plist = Xcodeproj::Plist.read_from_path(plist_path) || {}
    plist["SKAdNetworkItems"] = skad_networks.map { |id| { "SKAdNetworkIdentifier" => id } }
    Xcodeproj::Plist.write_to_path(plist, plist_path)
    puts "Updated #{plist_path}."
  rescue => e
    puts "Error updating #{plist_path}: #{e.message}"
  end
end
