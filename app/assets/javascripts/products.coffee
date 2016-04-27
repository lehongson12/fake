$ ->
  $("#products").dataTable
    processing: true
    serverSide: true
    ajax: $("#products").data("source")
    pagingType: "simple_numbers"
    columns: [
      {data: "name",bSortable: false, bSearchable: false},
      {data: "description", bSortable: false, bSearchable:false},
      {data: "price", bSortable: false, bSearchable:false},
      {data: "use_type", bSortable: false, bSearchable:false},
      {data: "photo", bSortable: false, bSearchable:false}
    ]
