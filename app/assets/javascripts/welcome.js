$(document).ready(function () {
    $("#request-type .link").on("click", function () {
        $("#request-type .request-type-options").toggleClass("visible");
    });

    $("#request-type-options li").on("click", function () {
        var selected = $(this).html();
        if ($(this).attr("parent") != '') {
            selected += " (" + $("#request-type-option-" + $(this).attr("parent")).html() + ")";
        }

        $("#request-type .link span").html(selected);
        $("#request-type .request-type-options").toggleClass("visible");
    });

});


