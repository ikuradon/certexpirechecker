# frozen_string_literal: true

require 'sidekiq-scheduler'
require 'sidekiq-bulk'

class Scheduler::CertificateScheduler
  include Sidekiq::Worker

  def perform
    FetchCertificateWorker.push_bulk(Instance.all.pluck(:id))
  end
end
