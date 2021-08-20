1.
rails new name_of_app (--db:postgresql)

2.
321

3.
rails g model song title year:integer

4.
model file
migration file

5.
rails db:migrate

6.
rails g migration AddCategoryToSongs category

7.
db/migrate/timestamp_add_category_to_songs.rb

8.
rails db.migrate

9.
validates :title, presence: true

10.
song = Song.new
song.valid?
song.save!
Song.create!

11.
3124

12.
url
body
headers
verb

13.
No
Get displays songs at index
Post adds song at index

14.
Get = displays a view returned by
Post = adds to db thru filepath

15.
def search
  @songs = Song.where(title: params[:query])
end


16.
def search
   @songs = Song.where(title: params[:name])
end

17
new
create
index
show
edit
update
delete

18
rails routes


19
rails g controller songs

20
def index
  Song.all
end

def show
  Song.find(params[:id])
end

21
def new
  @song = Song.new
end

def create
  @song = Song.new(song_params)
  @song.save
end

def song_params
  params.required(:song).permit(:title, :year, :category)
end


22
So you cant be hacked
an dnobody messes with your ocntrollers



23
action="/songs"
name="title"
value="Enter title"
placeholder=""


24
action="/songs/18"
name="song[title]"
value="Hey jude"

25
rails g model review content:string song:references

26
rails db:migrate

27
class Song
  has_many :reviews
end

class Review
  belongs_to :song
  validates :content, presence: true
end

28

rails g controller reviews


29
resources :songs do
  resources :reviews, only: [:new, :create]
end

30
def new
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @review.song = @song
  if @review.save
    redirect_to song_path(@song)
  else
    render :new
  end
end


31
<% @song.reviews.each do |review|%>
  <%= review.content %>
<% end %>
