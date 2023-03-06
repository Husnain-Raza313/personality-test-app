addAnswer = (question_id, option_id, length, page_no) => {
  // document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
  // document.cookie = question_id+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
  // document.cookie = question_id+"="+option_id;
  // document.cookie = "username="+option_id;
  document.cookie = "question_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
  document.cookie = "answer_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
  document.cookie = "answer_id="+option_id;
  document.cookie = "question_id="+question_id;
  let x = document.cookie
  if (length == 3 && page_no == 4){
    $(`#submitButton`).removeClass("d-none")
  }
  else if(length == 4){
    $(`#submitButton`).removeClass("d-none")
  }
}

