class AbuseReport < ActiveRecord::Base
  validates_presence_of :comment
  validates_presence_of :url
  validates_email_veracity_of :email, :message => t('invalid_email', :default => 'appears to be invalid. Please use a different address or leave blank.'), :allow_blank => true
  
  app_url_regex = Regexp.new('^' + ArchiveConfig.APP_URL, true)
  validates_format_of :url, :with => app_url_regex, :message => t('invalid_url', :default => 'does not appear to be on this site.')
  
  # id numbers for categories on 16bugs
  BUGS_COPPA = 11468
  BUGS_FAIRUSE = 11469
  BUGS_NONFANWORK = 11471
  BUGS_PLAGIARISM = 11470
  BUGS_OPENDOORS = 11516
  BUGS_HARASSMENT = 11473
  BUGS_NEXTKIN = 11514
  BUGS_OUTING = 11472
  BUGS_SPAM = 11515
  BUGS_RATING = 11475
  BUGS_WARNING = 11476
  
  # Category names for form
  BUGS_COPPA_NAME = "Children's Online Privacy and Protection Act"
  BUGS_FAIRUSE_NAME = "Reproduction of copyrighted or trademarked material (unfair use)"
  BUGS_NONFANWORK_NAME = "Illegal or non-fanwork content"
  BUGS_PLAGIARISM_NAME = "Plagiarism"
  BUGS_OPENDOORS_NAME = "Open Doors"
  BUGS_HARASSMENT_NAME = "Harassment"
  BUGS_NEXTKIN_NAME = "Next-of-kin claim"
  BUGS_OUTING_NAME = "Personal information (outing)"
  BUGS_SPAM_NAME = "Spam or commercial promotion"
  BUGS_RATING_NAME = "Inappropriate content rating"
  BUGS_WARNING_NAME = "Insufficient content warning"

end
