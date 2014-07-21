$(function(){
  $(".vote-btn").on("click", function(){
    var $this= $(this)
      , $box = $this.closest(".box")
      , $votenum = $box.find(".votenum")
      , votesCount = parseInt($box.find(".vote-text").data("vote"));
    $votenum.html(votesCount + 1);

  });
});
