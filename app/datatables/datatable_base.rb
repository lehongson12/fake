class DatatableBase < AjaxDatatablesRails::Base
    attr_reader :view, :options, :sortable_columns, :searchable_columns

    def sortable_columns
      []
    end

    def searchable_columns
      []
    end

    private

    def sort_records records
      records.order("#{sort_column} #{sort_direction}")
    end

    def sort_column
      sortable_columns[params[:order]["0"][:column].to_i]
    end

    def sort_direction
      order = params[:order]["0"][:dir]
      %w(desc asc).include?(order) ? order.upcase : "ASC"
    end

    def edit_button url
      link_to content_tag(:i, "", class: "fa fa-pencil"), url
    end

    def delete_button url
      link_to(url, method: :delete,
        data: {confirm: "Are you sure?"}, class: "text-danger") do
        content_tag :i, "", class: "fa fa-times"
      end
    end
  end