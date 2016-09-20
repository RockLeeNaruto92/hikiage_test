$(function() {

	/* 左メニューのマウスオーバーアクション */
	$(".Left_Menu li").hover(
		function() {
			$(this).children('ul').show();		// プルダウン表示
		},
		function() {
			$(this).children('ul').hide();		// プルダウン非表示
		}
	);
	$(".Left_Menu_Sub li").hover(
		function() {
			// 左位置設定
			var left = parseInt($(this).css('width')) + 10;
			$(this).children('ul').css('left', left + 'px');
			$(this).children('ul').show();		// プルダウン表示
		},
		function() {
			$(this).children('ul').hide();		// プルダウン非表示
		}
	);

	/* 検索フォームに文字を入れておく */
	$("#HD_search").val("キーワードを入力してください").css("color", "#969696");
	$("#HD_search").focus(
			function() {
				$(this).css("background-color", "#f8ffff");
				if (this.value == "キーワードを入力してください") {
					$(this).val("").css("color", "#000000");
				}
			}
	);
	$("#HD_search").blur(
			function() {
				$(this).css("background-color", "#ffffff");
				if (this.value == "") {
					$(this).val("キーワードを入力してください").css("color", "#969696");
				}
				if (this.value != "キーワードを入力してください") {
					$(this).css("color", "#000000");
				}
			}
	);
	$("#HD_search_button").click(
			function() {
				if($("#HD_search").val() == "キーワードを入力してください") {
					$("#HD_search").val("");
				}
			}
	);

});