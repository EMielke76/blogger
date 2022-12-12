require 'rails_helper'

describe 'user sees all articles' do 
    describe 'they visit /articles' do 
        let! (:article_1) {Article.create!(title: "Title 1", body: "Body 1")}
        let! (:article_2) {Article.create!(title: "Title 2", body: "Body 2")}

        before :each do 
            visit "/articles"
        end 
        it 'displays all articles' do 
            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_2.title)
        end
    end
end
