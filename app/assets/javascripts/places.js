$(document).ready(function() {
    $('#places_table').dataTable({
        'ajax': {
            url: $('#places_table tbody').data('href'),
            type: "POST",
            dataSrc: function ( data ) {
                return data.data;
            },       
        },
       'columns': [
            { 
                "data": "name",                   
                "render": function ( data, type, row ) {
                    return "<a id='"+row.id+"' href=''>"+data+"</a>";
                }
            },
            { 
                "data": "longitude",                   
                "render": function ( data, type, row ) {
                    return "<a id='"+row.id+"'>"+data+"</a>";
                }
            },
            { 
                "data": "latitude",                   
                "render": function ( data, type, row ) {
                    return "<a id='"+row.id+"'>"+data+"</a>";
                }
            },
            { 
                "data": "actions",                    
                "render": function ( data, type, row ) {
                    return "<a href=" + data + "> edit </a>";
                }
            }   
        ],
        stateSave: true,
        responsive: true,
        createdRow: function ( row, data, index ) {
            row.setAttribute( 'id', data.id );       
        },
        "processing": true,
        "serverSide": true,
        aLengthMenu: [
            [25, 50, -1],
            [25, 50, "All"]
        ],
        iDisplayLength: -1
    });
});