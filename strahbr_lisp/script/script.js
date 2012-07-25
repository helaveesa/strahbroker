/*HEAD*/

/*btn-slide*/
      $(document).ready(function(){
      $(".btn-slide").click(function(){
      $("#panel").slideToggle("slow");
      $(this).toggleClass("active"); return false;
      });
      });

/*pane*/
  $(document).ready(function(){
  $(".pane .delete").click(function(){
  $(this).parents(".pane").animate({ opacity: "hide" }, "slow");
  });
  });

/*1accordion h3 p*/
$(document).ready(function(){

    $(".accordion2 h3").eq(2).addClass("active");
    $(".accordion2 p").eq(2).show();

    $(".accordion2 h3").click(function(){
        $(this).next("p").slideToggle("slow")
        .siblings("p:visible").slideUp("slow");
        $(this).toggleClass("active");
        $(this).siblings("h3").removeClass("active");
    });

});

/*h2 largeImg*/
$(document).ready(function(){

	$("h2").append('<em></em>')

	$(".thumbs a").click(function(){

		var largePath = $(this).attr("href");
		var largeAlt = $(this).attr("title");

		$("#largeImg").attr({ src: largePath, alt: largeAlt });

		$("h2 em").html(" (" + largeAlt + ")"); return false;
	});

});

/*box*/


$(document).ready(function(){

	$(".run").click(function(){

		$("#box").animate({opacity: "0.1", left: "+=400"}, 1200)
		.animate({opacity: "0.4", top: "+=160", height: "20", width: "20"}, "slow")
		.animate({opacity: "1", left: "0", height: "100", width: "100"}, "slow")
		.animate({top: "0"}, "fast")
		.slideUp()
		.slideDown("slow")
		return false;

	});

});

/*2accordion h3 p*/

$(document).ready(function(){

	$(".accordion h3:first").addClass("active");
	$(".accordion p:not(:first)").hide();

	$(".accordion h3").click(function(){
		$(this).next("p").slideToggle("slow")
		.siblings("p:visible").slideUp("slow");
		$(this).toggleClass("active");
		$(this).siblings("h3").removeClass("active");
	});

});

/*btn1 panel btn2*/
            $(document).ready(function(){

                $("#btn1").click(function(){
                	$('.panel').fadeOut()
							   .fadeIn();
                    return false;
                });

                $("#btn2").click(function(){
                	$('.panel').animate({opacity:0})
							   .animate({opacity:1});
                    return false;
                });
            });
 /*BODY*/




