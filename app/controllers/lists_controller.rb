class ListsController < ApplicationController
    def index
        @lists = List.all
    end

    def create
        @list = List.new(list_params)
        @list.save
        redirect_to @list
    end

    def edit
        @list = List.edit
    end

    def show
        @list = List.show
    end

    def update
        @list = List.update(lists_params)
        redirect_to list_path(@list)
    end

    def destroy
        @list.destroy
        redirect_to list_path
    end

end