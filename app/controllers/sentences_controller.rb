class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
  @sentence = Sentence.new(sentence_params)
    if @sentence.save
      flash[:info] = "Sentence Added!"
      redirect_to root_url
    else
      flash[:info] = "Didn't create sentence"
      redirect_to new_sentence_url
    end
  end

  def index
    @sentences = Sentence.all
  end

  private

    def sentence_params
      params.require(:sentence).permit(:content)
    end
end
