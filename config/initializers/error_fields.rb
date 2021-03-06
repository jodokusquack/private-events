ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    class_attr_index = html_tag.index('class="')
    first_tag_end_index = html_tag.index('>')

    # Just to inspect variables in the console
    # puts '😎 ' * 50
    # pp(html_tag)
    # pp(class_attr_index)
    # pp(first_tag_end_index)

    if class_attr_index.nil? || class_attr_index > first_tag_end_index
        html_tag.insert(first_tag_end_index, ' class="is-invalid"')
    else
        html_tag.insert(class_attr_index + 7, 'is-invalid ')
    end

    # Just to see resulting tag in the console
    # pp(html_tag)
end
