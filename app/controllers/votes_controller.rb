class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  def get_user_votes
    @votes.each do |vote|
      if vote.userID == current_user.id
        @userVotes += vote
      end
    end
  end

  def voteHistory
  end

  def stats
    @votes = Vote.all
    @restaurant = Restaurant.find(Integer(params[:Restaurant]))
    @upVotes = 0
    @downVotes = 0
    @votes.each do |vote|
      if vote.restaurantID == @restaurant.id
        if vote.voteCast == 'up'
          @upVotes += 1
        else
          @downVotes += 1
        end
      end
    end
  end

  def submitVoteUp
    @vote = Vote.new
    @vote.userID = current_user.id
    @vote.restaurantID = Integer(params[:id])
    @vote.voteCast = 'up'
    if @vote.save
      redirect_to restaurants_path
    else
      format.html { render :new }
      format.json { render json: @vote.errors, status: :unprocessable_entity }
    end
  end

  def submitVoteDown
    @vote = Vote.new
    @vote.userID = current_user.id
    @vote.restaurantID = Integer(params[:id])
    @vote.voteCast = 'down'
    if @vote.save
      redirect_to restaurants_path
    else
      format.html { render :new }
      format.json { render json: @vote.errors, status: :unprocessable_entity }
    end
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit

  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:userID, :restaurantID, :voteCast)
    end
end
