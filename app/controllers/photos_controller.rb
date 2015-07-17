class PhotosController < ApplicationController

  def index
    photos = Photo.all
    if photos
      render json: photos
    else
      render json: { errors: photos.errors.full_messages }
    end
  end

  def show
    photo = Photo.find(params[:id])
    if photo
      render json: photo
    else
      render json: { errors: photo.errors.full_messages }
    end
  end

  def new
    photo = Photo.new
  end

  def edit
    photo = Photo.find(params[:id])
    if photo
      render json: photo
    else
      render json: { errors: photo.errors.full_messages }
    end
  end

  def create
    photo = Photo.new(article_params)

    if photo
      render json: photo
    else
      render json: { errors: photo.errors.full_messages }
    end
  end

  def update
    photo = Photo.find(params[:id])

    if photo.update(photo_params)
      render json: photos
    else
      render json: { errors: photos.errors.full_messages }
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy

    # redirect_to articles_path
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :text)
    end
end
