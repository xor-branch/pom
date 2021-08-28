# bundle exec rspec spec/system/task_spec.rb
require 'rails_helper'
RSpec.describe 'Fonction de gestion des tâches', type: :system do
  before do
    FactoryBot.create(:task, task_name: 'task1', description: 'task1_content', start:'2021-08-30', deadline:'2021-08-31')
    FactoryBot.create(:second_task, task_name: 'task2', description: 'task2_content', start:'2021-08-30', deadline:'2021-08-31')
  end
  describe 'Nouvelle fonction de création' do
    context 'Lors de la création d\'une nouvelle tâche' do
      it "La tâche créée s\'affiche" do
        visit tasks_path
        expect(page).to have_content 'task1'
        expect(page).to have_content 'task2_content'
      end
    end
  end
  describe 'Fonction d\'affichage de liste' do
    context "Lors de la transition vers l\'écran de liste" do
      it 'La liste des tâches créées s\'affiche' do
      end
    end
  end
  describe 'Fonction d\'affichage détaillée' do
     context 'Lors de la transition vers un écran de détails de tâche' do
       it 'Le contenu de la tâche concernée s\'affiche' do
       end
     end
  end
end
