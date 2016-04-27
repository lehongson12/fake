class ProductDatatable < DatatableBase
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :product_path, :edit_product_path, :content_tag, :image_tag

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(name)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ["Product.name"]
  end

  private

  def data
    records.map do |record|
      {
        name: link_to(record.name, product_path(record)),
        description: record.description,
        price: record.price,
        use_type: record.use_type,
        photo: image_tag(record.photo.url(:thumb))
      }
    end
  end

  def get_raw_records
    Product.all
  end

  def get_actions record
    edit = link_to(edit_product_path(record)) do
      content_tag :i, "", class: "fa fa-pencil"
    end

    delete = link_to(product_path(record), method: :delete,
      data: {confirm: "Are you sure?"}, class: "text-danger") do
      content_tag :i, "", class: "fa fa-times"
    end
    "#{edit} #{delete}"
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
