//INDEX VOTING //
$(function(){
  $(".vote-btn").on("click", function(){
    var $this= $(this)
      , $box = $this.closest(".box")
      , $votenum = $box.find(".votenum")
      , votesCount = parseInt($box.find(".vote-text").data("vote"));
    $votenum.html(votesCount + 1);

  });
});

//SHOW VOTING //

$(function(){
  $(".vote-btn2").on("click", function(){
    var $this= $(this)
      , $panel = $this.closest(".panel")
      , $votenum = $panel.find(".votenum")
      , votesCount = parseInt($panel.find(".vote-text").data("vote"));
    $votenum.html(votesCount + 1);

  });
});
