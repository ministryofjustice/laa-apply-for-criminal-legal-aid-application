require 'rails_helper'

RSpec.describe FileUpload::BaseFileUploader do
  describe '#perform_save' do
    context 'saves file' do
      let(:output) { subject.save(fixture_file_upload('test.json', 'application/json')) }

      it 'throws an expected error' do
        expect { output }.to raise_error(StandardError, 'Implement perform_save in sub class')
      end
    end
  end

  describe '#perform_destroy' do
    context 'development environment' do
      let(:output) { subject.destroy(Rails.root.join('spec/fixtures/files/12345')) }

      it 'throws an expected error' do
        expect { output }.to raise_error(StandardError, 'Implement perform_destroy in sub class')
      end
    end
  end

  describe '#perform_exists?' do
    context 'development environment' do
      let(:output) { subject.exists?('test_path') }

      it 'throws an expected error' do
        expect { output }.to raise_error(StandardError, 'Implement perform_exists? in sub class')
      end
    end
  end
end
