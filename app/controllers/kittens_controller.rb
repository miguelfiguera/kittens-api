class KittensController < ApplicationController

def index
    @kittens=Kitten.all
end

def show
    @kitten=Kitten.find(params[:id])
end

def new
    @kitten=Kitten.new
end

def create
    @kitten=Kitten.new(kitten_params)

    if @kitten.save!
        redirect_to @kitten
        flash[:notice] = "Post successfully created"
    else
        render :new, status: :unprocessable_entity
    end
end


def edit
    @kitten=Kitten.find(params[:id])
end

def update
    @kitten=Kitten.find(params[:id])

    if @kitten.update(kitten_params)
        redirect_to @kitten
    else
        render :edit, status: :unprocessable_entity
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
