require 'rails_helper'

describe 'Article Show page' do 
    let! (:article_1) {Article.create!(title: "Title 1", body: "Body 1")}
    let! (:article_2) {Article.create!(title: "Title 2", body: "Body 2")}

    describe 'linking from index page' do 
        it 'links to a page for a single article' do 
            visit "/articles"

            expect(page).to have_link(article_1.title)
            expect(page).to have_link(article_2.title)
            
            click_on "Title 1"

            expect(current_path).to eq("/articles/#{article_1.id}")
            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_1.body)
            expect(page).to_not have_content(article_2.title)
            expect(page).to_not have_content(article_2.body)
        end 
    end 

    describe 'visiting a show page' do 
        it 'displays a single articles information' do 
            visit "/articles/#{article_1.id}"

            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_1.body)
            expect(page).to_not have_content(article_2.title)
            expect(page).to_not have_content(article_2.body)

            visit "/articles/#{article_2.id}"
            expect(page).to have_content(article_2.title)
            expect(page).to have_content(article_2.body)
            expect(page).to_not have_content(article_1.title)
            expect(page).to_not have_content(article_1.body)
        end

        it "links back to the Articles Index" do 
            visit "articles/#{article_1.id}"
            
            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_1.body)
            
            expect(page).to_not have_content(article_2.title)
            
            expect(page).to have_link("<< Back to Articles List")

            click_on("<< Back to Articles List")
            expect(current_path).to eq("/articles")
            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_2.title)
        end 
    end
end