//login form change function shoud be in html
window.addEventListener('load', function(e){
	var rec_btn;
	var forms
	if(rec_btn = __('form-action')){
		for (i in rec_btn ){
			rec_btn[i].onclick = function(e){
				e.preventDefault();
				var loginForm = _('login-form');
				var recFrom = _('recovery-form');
				loginForm.classList.toggle('active');
				recFrom.classList.toggle('active');
			}
		}
		
	}
	if(forms = __('form')){
		for( i in forms){
			var that = forms[i]
			that.onsubmit = function(e){
				if (!this.parentNode.classList.contains('active')) {
					e.preventDefault();
					alert('Sorry, action not permitted. The form is not activated!');
				}
			}
		}
	}
});