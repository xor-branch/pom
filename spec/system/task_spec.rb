# bundle exec rspec spec/system/task_spec.rb
require 'rails_helper'
RSpec.describe 'Fonction de gestion des tâches', type: :system do
  before do
    task = FactoryBot.create(:task,
                              task_name: 'task1',
                              description: 'task1_content',
                              start:'2021-08-30',
                              deadline:'2021-08-30',
                              statut:'done',
                              priority: 'medium')
    second_task = FactoryBot.create(:second_task,
                                    task_name: 'task2',
                                    description: 'task2_content2',
                                    start:'2021-08-30',
                                    deadline:'2021-08-31',
                                    statut: 'not_started',
                                    priority: 'low')
  end
  describe 'Nouvelle fonction de création' do
    context 'Lors de la création d\'une nouvelle tâche' do
      it "La tâche créée s\'affiche" do
        visit tasks_path
        expect(page).to have_content 'task1'
        expect(page).to have_content 'task2'
      end
    end
  end
  describe 'Fonction d\'affichage de liste' do
    context "Lors de la transition vers l\'écran de liste" do
      it 'La liste des tâches créées s\'affiche en ordre decroissant' do
        visit tasks_path
        assert Task.all.order(created_at: :DESC)
      end
    end
  end
  describe 'Fonction d\'affichage détaillée' do
     context 'Lors de la transition vers un écran de détails de tâche' do
       it 'Le contenu de la tâche concernée s\'affiche' do
         visit tasks_path
         click_on 'task1'
         expect(page).to have_content 'task1_content'
       end
     end
  end
  describe 'l\'utilisateur fait une recherche' do
    context 'lorsqu\'il cherche par statut' do
      it 'le contenu affiche le statut checké' do
        visit tasks_path
        select 'done', from: 'statut'
        click_button 'search'
        expect(page).to have_content 'task1'
      end
    end
    context 'lorsqu\'il cherche par urgence' do
      it 'le contenu affiche les tasks par deadline decroissant' do
        visit tasks_path
        click_on 'urgence'
        assert Task.all.order(deadline: :DESC)
      end
    end
    context 'lorsqu\'il cherche par priority' do
      it 'le contenu affiche les tasks avec une priorite low' do
        visit tasks_path
        click_on 'low'
        assert Task.all.order(priority: :DESC)
      end
    end
    context 'lorsqu\'il cherche par urgence' do
      it 'le contenu affiche les tasks par deadline decroissant' do
        visit tasks_path
        fill_in 'task_name', with: 'task1'
        expect(page).should have_no_content 'task2'
      end
    end
    context 'lorsqu\'il cherche par urgence' do
      it 'le contenu affiche les tasks par deadline decroissant' do
        visit tasks_path
        fill_in 'task_name', with: 'content2'
        expect(page).should have_no_content 'task1'
      end
    end
  end
end
