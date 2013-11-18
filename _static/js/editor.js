window.defl_str = 'My answer is ...';

function obj(o){
	return document.getElementById(o);
}

function init_editor(){
	var editor = obj('editor');
	editor.innerHTML = defl_str;
	
	editor.onblur = function(){
		if(editor.innerHTML == ''){
			editor.innerHTML = defl_str;
			obj('editor_bar').style.display = 'none';
		}
	};
	editor.onfocus = function(){
		if(editor.innerHTML == defl_str){
			editor.innerHTML = '';
			obj('editor_bar').style.display = 'inline';
		}
	}
	
	init_editor_action();
}

function init_editor_action(){
	ins_pic = obj('insert_pic_btn');
	post_ans = obj('post_answer_btn');
	
	ins_pic.onclick = function(){
		obj('fileupload').click();				
	};
	
	ins_pic.onblur = function(){
		obj('fileupload').style.display='none';
	};
	
	post_ans.onclick = function(){
		var content = obj('editor').innerHTML;
		var is_valid = true;
		if(content == defl_str || content.length == 0){
			is_valid = false;
		}else{
			console.log("send:　" + content.toString());
			//judge...
			obj('editor').innerHTML = defl_str;	
		}		
		
		if(is_valid){
			trigger_('发布成功!');	
		}else{
			trigger_('发布失败，请检查网络!');
		}		  
	};
	
	
}

function trigger_(msg){
	
	if(obj('myModelLabel')){
		console.log('exists');
		obj('myModelLabel').innerHTML = msg;		
	}else{		
		var modal = '<div id="modal-container-912346" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
						'<div class="modal-header">' +						
							'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>' +					
						'</div>' +
						'<div class="modal-body">' +
							'<h4 id="myModalLabel">' +
								msg + 
							'</h4>' +
						'</div>' +
					'</div>';
		obj('btns').innerHTML = modal;
	}		
}





