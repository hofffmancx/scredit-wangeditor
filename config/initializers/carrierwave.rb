CarrierWave.configure do |config|


      config.storage = :qiniu
      config.qiniu_access_key     = 'WHZpF03XPx0HFd-uRGz2HdAQVZmqiryB488Cxs68'
      config.qiniu_secret_key     = 'BATsHfpNAAk-KUcPUmLpbnVFHuuKj9OwpOXAw9-r'
      config.qiniu_bucket         = 'duzilong'
      config.qiniu_bucket_domain  = 'oud39o8jh.bkt.clouddn.com'
      config.qiniu_block_size     = 4 * 1024 * 1024
      config.qiniu_protocol       = 'http'

end
