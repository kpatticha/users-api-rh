require 'json'

path = File.join(File.dirname(__FILE__), '../data/users.json')
file = File.read(path)
users_hash = JSON.parse(file)
users = users_hash['users']

users.each do |u| 
	name = u['name']
	picture = u['picture']
	location = u['location']
	user = User.create!( :gender => u['gender'], 
				 :title => name['title'],
				 :first_name => name['first'],
				 :last_name => name['last'],
				 :email => u['email'],
				 :username => u['username'],
				 :password => u['password'],
				 :salt => u['salt'],
				 :md5 => u['md5'],
				 :sha1 => u['sha1'],
				 :sha256 => u['sha256'],
				 :registered => u['registered'],
				 :dob => u['dob'],
				 :phone => u['phone'],
				 :cell => u['cell'],
				 :PPS => u['PPS']
	)

	location = Location.create!(:street =>  location['street'], 
				:city =>  location['city'],
				:state =>  location['state'],
				:zip =>  location['zip'],
				:user_id =>  user.id 
	)

	picture = Picture.create!( :user_id => user.id,
				:large => picture['large'],
				:medium => picture['medium'],
				:thumbnail => picture['thumbnail']
	)

end
