class KittensController < ApplicationController

def index
    @kittens=Kitten.all

    respond_to do |format|
        format.html
        format.json {render :json =>@kittens}
        format.xml {render :xml=>@kittens}
    end
end

def show
    @kitten=Kitten.find(params[:id])

    respond_to do |format|
        format.html
        format.json {render :json =>@kitten}
        format.xml {render :xml=>@kitten}
    end
end

def new
    @kitten=Kitten.new
end

def create
    @kitten=Kitten.new(kitten_params)

    if @kitten.save!
        redirect_to @kitten, notice: 'Kitty Succefully Created'
    else
        render :new, status: :unprocessable_entity, alert: 'Your Cat NO PASS!'
    end
end


def edit
    @kitten=Kitten.find(params[:id])
end

def update
    @kitten=Kitten.find(params[:id])

    if @kitten.update(kitten_params)
        redirect_to @kitten, notice: 'Your kitty has been updated.'
    else
        render :edit, status: :unprocessable_entity, alert: 'Your Kitty has NOT been saved... SAVE THE KITTY PLEASE!'
    end
end

def delete
    @kitten=kitten.find(params[:id])
    @kitten.delete

    redirect_to root_path, status: :see_other
end

private

def kitten_params
    params.require(:kitten).permit(:name,:age,:softness,:cuteness,:id)
end

end
