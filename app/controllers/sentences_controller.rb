class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
  @sentence = Sentence.new(sentence_params)
    if @sentence.save
      flash[:info] = "Sentence Added!"
      redirect_to new_sentence_url
    else
      flash[:info] = "Didn't create sentence"
      redirect_to new_sentence_url
    end
  end

  def index
    @sentences = Sentence.all
  end

  def destroy
    Sentence.destroy(params[:id])
    flash[:info] = "Sentence Deleted!"
    redirect_to :back
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
  end

  def home
    @sentences = Sentence.order("RANDOM()").limit(100).pluck(:content)
    fill_it_up
    @sentences.shuffle!
  end

  private

  def fill_it_up
    while @sentences.count.between?(1,99) do
      @sentences += @sentences
    end
  end

    def sentence_params
      params.require(:sentence).permit(:content)
    end
end
