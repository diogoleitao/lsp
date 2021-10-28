# frozen_string_literal: true

describe 'Line Server', type: :request do
  def app
    LineServer
  end

  describe 'GET /lines/:index' do
    context 'when index is less than total lines' do
      it 'returns line and 200 code' do
        get '/lines/1'

        expect(last_response.status).to be 200
        expect(last_response.body).to(
          eql 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus elementum ex id nunc'\
              ' laoreet, sit amet aliquet felis lobortis. In ex enim, tincidunt ac rhoncus nec, eleifend'\
              ' finibus massa. Curabitur dapibus egestas lorem id gravida. Sed dapibus, odio non ornare'\
              ' vehicula, libero augue convallis nisl, eget fermentum odio risus quis felis. In dapibus'\
              ' tortor eget nibh scelerisque, ut lacinia lacus euismod. Nunc id vehicula arcu, at'\
              ' pellentesque dui. In viverra auctor elit vel luctus. Donec vestibulum eros diam. Morbi'\
              ' lobortis purus in arcu accumsan pretium. Praesent posuere convallis magna, ac vestibulum'\
              " nulla pharetra eu. Aenean a fringilla quam.\n"
        )
      end
    end

    context 'when index is greater than total lines' do
      it 'returns empty body and 413 code' do
        get '/lines/0'

        expect(last_response.status).to be 413
        expect(last_response.body).to be_empty
      end
    end
  end
end
