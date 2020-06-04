class SnippetAppsController < ApplicationController
  before_action :set_snippet_app, only: [:show, :edit, :update, :destroy]

  # GET /snippet_apps
  # GET /snippet_apps.json
  def index
    @snippet_apps = SnippetApp.all
  end

  # GET /snippet_apps/1
  # GET /snippet_apps/1.json
  def show
  end

  # GET /snippet_apps/new
  def new
    @snippet_app = SnippetApp.new
  end

  # GET /snippet_apps/1/edit
  def edit
  end

  # POST /snippet_apps
  # POST /snippet_apps.json
  def create
    @snippet_app = SnippetApp.new(snippet_app_params)

    respond_to do |format|
      if @snippet_app.save
        format.html { redirect_to @snippet_app, notice: 'Snippet app was successfully created.' }
        format.json { render :show, status: :created, location: @snippet_app }
      else
        format.html { render :new }
        format.json { render json: @snippet_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippet_apps/1
  # PATCH/PUT /snippet_apps/1.json
  def update
    respond_to do |format|
      if @snippet_app.update(snippet_app_params)
        format.html { redirect_to @snippet_app, notice: 'Snippet app was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet_app }
      else
        format.html { render :edit }
        format.json { render json: @snippet_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippet_apps/1
  # DELETE /snippet_apps/1.json
  def destroy
    @snippet_app.destroy
    respond_to do |format|
      format.html { redirect_to snippet_apps_url, notice: 'Snippet app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet_app
      @snippet_app = SnippetApp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def snippet_app_params
      params.require(:snippet_app).permit(:title, :language, :contents)
    end
end
