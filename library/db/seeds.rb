# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
############# Users Model
User.where(name:'Eric').first_or_create!(name:'Eric', user_id:'eoboite', password:'boozallen1', admin:false)
User.where(name:'Paige').first_or_create!(name:'Paige', user_id:'pmurph', password:'boozallen2', admin:true)
User.where(name:'Rich').first_or_create!(name:'Rich', user_id:'rcoleman', password:'boozallen3', admin:true)

########### Book Model
Book.where(title:'Game of My Life').first_or_create!(isbn:'1613213301', title:'Game of My Life', author:'Tom Mackie', author_id:1 , genre:'Football', abstract:'Several prominent players who have worn the legendary Redskins’ helmet share their fondest single-game experience and memories.', pages:272, image_cover_url:'http://img1.imagesbn.com/p/9781613213308_p0_v4_s260x420.JPG', published_on:'August 1, 2013', total_in_library:4)
Book.where(title:'The Winner Within').first_or_create!(isbn:'0425141756', title:'The Winner Within', author:'Pat Riley', author_id:3 , genre:'Basketball', abstract:'Not only is Pat Riley one of pro basketball\'s winningest coaches, but his speeches before hundreds of corporations, from ARCO to AT&T to Toyota, have earned him the title of America\'s Greatest Motivational Speaker. The Winner Within is his formula for success.', pages:272, image_cover_url:'http://images.betterworldbooks.com/042/The-Winner-Within-Riley-Pat-9780425141755.jpg', published_on:'October 1, 1994', total_in_library:3)
Book.where(title:'Show Time: Inside the Lakers\' Breakthrough Season').first_or_create!(isbn:'0446514276', title:'Show Time: Inside the Lakers\' Breakthrough Season', author:'Pat Riley', author_id:3 , genre:'Basketball', abstract:'This book is largely a recap of games during the Lakers\'s 1987 championship season, with some interesting paragraphs on their rivalry with the Celtics.', pages:259, image_cover_url:'', published_on:'July 1, 1990', total_in_library:1)
Book.where(title:'They Call Me Assassin').first_or_create!(isbn:'0896960609', title:'They Call Me Assassin', author:'Jack Tatum', author_id:2 , genre:'Football', abstract:'In the violent world of professional football no one plays the game with more vigor...and violence...than Jack Tatum and the Oakland Raiders.', pages:251, image_cover_url:'http://ecx.images-amazon.com/images/I/51vCFHhew-L._SY344_BO1,204,203,200_.jpg', published_on:'January 1, 1980', total_in_library:2)

