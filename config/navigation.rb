SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.item :book, I18n.t('page_title.books.index'), root_path do |book|
      if @book && @book.persisted?
        book.item :edit, I18n.t('page_title.books.edit', :title => @book), edit_book_path(@book)

        book.item :show, @book.title, book_path(@book) do |chapter|
          if @chapter && @chapter.persisted?
            chapter.item :edit, I18n.t('page_title.chapters.edit', :title => @chapter), edit_book_chapter_path(@book, @chapter)

            chapter.item :show, @chapter.title, book_chapter_path(@book, @chapter) do |section|
              if @section && @section.persisted?
                section.item :edit, I18n.t('page_title.sections.edit', :title => @section), edit_book_chapter_section_path(@book, @chapter, @section)
              end

              section.item :new, I18n.t('page_title.sections.new'), new_book_chapter_section_path(@book, @chapter)
            end
          end

          chapter.item :new, I18n.t('page_title.chapters.new'), new_book_chapter_path(@book)
        end
      end

      book.item :new, I18n.t('page_title.books.new'), new_book_path
    end
  end
end
