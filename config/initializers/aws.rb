Aws.config.update({
	region: 'eu-west-1',
	credentials: Aws::Credentials.new(Settings.aws.access_key_id, Settings.aws.secret_access_key)
})
