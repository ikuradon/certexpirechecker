class FetchCertificateWorker
  include Sidekiq::Worker

  def perform(instance_id)
    # Do something
    instance = Instance.find(instance_id)
    begin
      valid, error, cert = SSLTest.test "https://#{instance.domain}"

      instance.note = error.present? ? error : "-"
      instance.not_before = cert.present? ? cert.not_before : DateTime.new
      instance.not_after = cert.present? ? cert.not_after : DateTime.new

      instance.save
    end
  end
end
