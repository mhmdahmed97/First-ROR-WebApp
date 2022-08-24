class RootController < ApplicationController
    #These functions are for the routes defined in routes.rb
    #These function respond to requests made to the rails server
    #Responses can be of 2 types
    #--> 1 -- to return a JSON response (API)
    #--> 2 -- to render an html page
    # to return an html page there must be a file inside the 'views/root' directory with the name about.html.erb or contact.html.erb

    #This method is returning an HTML page instead of a json response
    def aboutmethod
        puts "---------------------------"
        puts "About in server"
        render "about"    #-->this is the name of the html page that is rendered when this path is hit
    end
    #This method is returning an HTML page instead of a json response
    def contactmethod
        #redirect_to('/about')
        render "contact"
    end

    def indexmethod
        @posts= Post.all
        render "index" #--> If these lines are commented out, rails has a functoinality to detect the same one itself. if we want to render another page in this method then we can use render. And its best practice to call render function
        #cannot render more than one render in here, thats why when we wanted to render the header in index, we used render in the index.html.erb
        #Plus if we need partial rendering (rendering one in another) we need to create the html file starting with an '_' or else it wont work.
        #Example: if _header.html.erb is created without the underscore then it will give an error
    end

    def api
        @response = {
            :status => 200,
            :message => "Hello world from API"
        }
        render json: @response
        #instead of json we can have html, js, body, xml, plain, text
    end

    def api2
        @response2 = {
            :status => 300,
            :message => "Hello world from API 2"
        }
        render json: @response2
    end

    def user
        render json: params[:name] #writing [:name] is optional, this just returns the object inside the square brackets on the browser screen. Cannot give more than one object in the square brackets
    end

    def addmethod
        @post=Post.new
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save
        @response2 = {
            :status => 300,
            :message => "Data saved successfully"
        }
        #render json: @response2
        @posts= Post.all #but because we are rendering post.all right before rendering index, we need to write this line in the indexmethod right above render index as well
        render "index"
    end

end
