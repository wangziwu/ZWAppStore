Pod::Spec.new do |s|
	s.name		= 'ZWAppStore'
	s.version	= '0.0.3'
	s.summary	= 'iOS 应用APP检测更新、提醒应用评价、前往App Store给予好评功能封装。请求评论视图出现逻辑：限制每日最多出现次数、限制每次出现概率、限制最大出现次数避免用户反感。'
	s.homepage 	= 'https://github.com/wangziwu/ZWAppStore'
	s.license	= 'MIT'
	s.authors	= {'wangziwu'	=>	'wang_ziwu@126.com'}
	s.platform	= :ios,'8.0'
	s.ios.deployment_target = '8.0'
	s.source	= {:git => 'https://github.com/wangziwu/ZWAppStore.git',:tag => s.version }
	s.requires_arc	= true

	s.source_files	= 'ZWAppStore/ZWAppStore.h'
	s.resources    	= 'ZWAppStore/Resources/Asset.xcassets'

	s.subspec 'ZWCheckVersion' do |ss|
		ss.source_files = 'ZWAppStore/ZWCheckVersion/*.{h,m}'
		ss.resources    = 'ZWAppStore/ZWCheckVersion/*.xib'
	end

	s.subspec 'ZWActionReview' do |ss|
		ss.source_files = 'ZWAppStore/ZWActionReview/*.{h,m}'
		ss.resources    = 'ZWAppStore/ZWActionReview/*.xib'
		ss.dependency 	'ZWAppStore/ZWCheckVersion'

	end
	s.frameworks = 'UIKit'
end	
