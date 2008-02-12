require 'RMagick'

module Airbrush
  module Processors
    module Image
      class Rmagick < ImageProcessor
        def resize(image, width, height)
          img = create_image(image)
          img.change_geometry("#{width}x#{height}") { |cols, rows, image| img.resize!(cols, rows) }
          img.to_blob
        end
        
        private
        
          def create_image(image)
            Magick::Image.from_blob(preprocess(image)).first
          end
      end
    end
  end
end
