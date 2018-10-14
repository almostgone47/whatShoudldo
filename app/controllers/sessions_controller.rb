class SessionsController < Clearance::SessionsController

    private
    def url_after_destroy
        "/"
    end
    
    def url_after_create
        redirect_to events_path
    end

end