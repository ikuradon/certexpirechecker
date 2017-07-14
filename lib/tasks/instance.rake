# frozen_string_literal: true
namespace :instance do
    desc 'Import instances.list'
    task import: :environment do
        File.open("instances.list") do |file|
            file.read.split("\n").each do |domain|
                Instance.new({domain: "#{domain}"}).save!
            end
        end
    end

    desc 'Export instances list'
    task export: :environment do
        instances = Instance.all.order("not_after")
        instances.each do |instance|
            puts "#{instance.not_after.strftime("%Y-%m-%d")}: #{instance.domain}"
        end
    end
end
