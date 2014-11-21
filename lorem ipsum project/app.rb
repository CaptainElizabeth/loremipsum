require 'sinatra'
require 'dinosaurus'


Dinosaurus.configure do |config|
  config.api_key = 'foo'
end








get '/ipsum' do
redirect 'home.html'
end

post '/topic' do

  @topic = params['topicword']
  num = params['num_sentences'].to_i
  pnum = params['num_paragraph'].to_i
  results = Dinosaurus.synonyms_of(@topic)
  newresults = results.sample
  results2 = Dinosaurus.synonyms_of(newresults)

  @all_content = []

  pnum.times do
      a_paragraph = []
      num.times do
        a_sentence = []
        6.times do
          a_sentence << results.sample + results2.sample
        end
        a_paragraph << a_sentence
      end
    @all_content << a_paragraph
  end

erb :ipsum
end



