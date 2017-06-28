class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @docs = Doc.all
  end

  def show
  end

  def new
      @doc = Doc.new
  end

  def create
    @doc = Doc.new(secure_params)
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
  end

  private

  def secure_params
    params.require(:doc).permit(:title, :content)
  end

  def set_doc
    @doc = Doc.find(params[:id])
  end

end
