require 'rails_helper'

describe 'Articles Index' do 
    describe 'a user visits /articles' do 
        let! (:article_1) {Article.create!(title: "Title 1", body: "Body 1")}
        let! (:article_2) {Article.create!(title: "Title 2", body: "Body 2")}

        before :each do 
            visit "/articles"
        end 

        it 'displays all articles' do 
            expect(page).to have_link(article_1.title)
            expect(page).to have_link(article_2.title)
        end

        it 'has a link to create a new article' do 
            expect(page).to have_link("Create a New Article")
        end
    end
end
