class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :delete, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @docs = current_user.docs
  end

  def show
  end

  def new
    if current_user
        @doc = current_user.docs.build
    else
      redirect_to new_user_session_path, notice: 'You have to login first!'
    end
  end

  def create
    @doc = current_user.docs.build(secure_params)
    if @doc.save
      redirect_to @doc, notice: "Document was successfully created!"
    else
      render new
    end
  end

  def delete
  end

  def destroy
  end

  def edit
  end

  def update
    if @doc.update(secure_params)
      redirect_to @doc, notice: "Document was successfully updated"
    else
      render edit
    end

  end

  private

  def secure_params
    params.require(:doc).permit(:title, :content)
  end

  def set_doc
    @doc = Doc.find(params[:id])
  end

end
