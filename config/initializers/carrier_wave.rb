CarrierWave.configure do |config|
	config.storage = :aws
	config.aws_bucket = Settings.aws.s3.bucket
	config.aws_acl = 'public-read'
	#config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }
  config.aws_credentials = {
    access_key_id: Settings.aws.access_key_id,
    secret_access_key: Settings.aws.secret_access_key,
    region: 'eu-west-1'
  }
end
