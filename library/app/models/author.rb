class Author < ActiveResource::Base
	self.site = 'http://localhost:8080/gmulibrary/'
	self.format = :json
	self.headers['Accept'] = 'application/json'
	schema do
		integer 'id'
		string 'name', 'biography', 'dob', 'nationality', 'awards', 'image_url'
	end
end

