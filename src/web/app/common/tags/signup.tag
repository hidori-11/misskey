<mk-signup>
	<form onsubmit={ onsubmit } autocomplete="off">
		<label class="username">
			<p class="caption"><i class="fa fa-at"></i>ユーザー名</p>
			<input ref="username" type="text" pattern="^[a-zA-Z0-9-]{3,20}$" placeholder="a~z、A~Z、0~9、-" autocomplete="off" required="required" onkeyup={ onChangeUsername }/>
			<p class="profile-page-url-preview" if={ refs.username.value != '' && username-state != 'invalidFormat' && username-state != 'minRange' && username-state != 'maxRange' }>{ CONFIG.url + '/' + refs.username.value }</p>
			<p class="info" if={ usernameState == 'wait' } style="color:#999"><i class="fa fa-fw fa-spinner fa-pulse"></i>確認しています...</p>
			<p class="info" if={ usernameState == 'ok' } style="color:#3CB7B5"><i class="fa fa-fw fa-check"></i>利用できます</p>
			<p class="info" if={ usernameState == 'unavailable' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>既に利用されています</p>
			<p class="info" if={ usernameState == 'error' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>通信エラー</p>
			<p class="info" if={ usernameState == 'invalid-format' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>a~z、A~Z、0~9、-(ハイフン)が使えます</p>
			<p class="info" if={ usernameState == 'min-range' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>3文字以上でお願いします！</p>
			<p class="info" if={ usernameState == 'max-range' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>20文字以内でお願いします</p>
		</label>
		<label class="password">
			<p class="caption"><i class="fa fa-lock"></i>パスワード</p>
			<input ref="password" type="password" placeholder="8文字以上を推奨します" autocomplete="off" required="required" onkeyup={ onChangePassword }/>
			<div class="meter" if={ passwordStrength != '' } data-strength={ passwordStrength }>
				<div class="value" ref="passwordMetar"></div>
			</div>
			<p class="info" if={ passwordStrength == 'low' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>弱いパスワード</p>
			<p class="info" if={ passwordStrength == 'medium' } style="color:#3CB7B5"><i class="fa fa-fw fa-check"></i>まあまあのパスワード</p>
			<p class="info" if={ passwordStrength == 'high' } style="color:#3CB7B5"><i class="fa fa-fw fa-check"></i>強いパスワード</p>
		</label>
		<label class="retype-password">
			<p class="caption"><i class="fa fa-lock"></i>パスワード(再入力)</p>
			<input ref="passwordRetype" type="password" placeholder="確認のため再入力してください" autocomplete="off" required="required" onkeyup={ onChangePasswordRetype }/>
			<p class="info" if={ passwordRetypeState == 'match' } style="color:#3CB7B5"><i class="fa fa-fw fa-check"></i>確認されました</p>
			<p class="info" if={ passwordRetypeState == 'not-match' } style="color:#FF1161"><i class="fa fa-fw fa-exclamation-triangle"></i>一致していません</p>
		</label>
		<label class="recaptcha">
			<p class="caption"><i class="fa fa-toggle-on" if={ recaptchaed }></i><i class="fa fa-toggle-off" if={ !recaptchaed }></i>認証</p>
			<div class="g-recaptcha" data-callback="onRecaptchaed" data-expired-callback="onRecaptchaExpired" data-sitekey={ CONFIG.recaptcha.siteKey }></div>
		</label>
		<label class="agree-tou">
			<input name="agree-tou" type="checkbox" autocomplete="off" required="required"/>
			<p><a href={ CONFIG.aboutUrl + '/tou' } target="_blank">利用規約</a>に同意する</p>
		</label>
		<button onclick={ onsubmit }>アカウント作成</button>
	</form>
	<style>
		:scope
			display block
			min-width 302px
			overflow hidden

			> form

				label
					display block
					margin 16px 0

					> .caption
						margin 0 0 4px 0
						color #828888
						font-size 0.95em

						> i
							margin-right 0.25em
							color #96adac

					> .info
						display block
						margin 4px 0
						font-size 0.8em

						> i
							margin-right 0.3em

					&.username
						.profile-page-url-preview
							display block
							margin 4px 8px 0 4px
							font-size 0.8em
							color #888

							&:empty
								display none

							&:not(:empty) + .info
								margin-top 0

					&.password
						.meter
							display block
							margin-top 8px
							width 100%
							height 8px

							&[data-strength='']
								display none

							&[data-strength='low']
								> .value
									background #d73612

							&[data-strength='medium']
								> .value
									background #d7ca12

							&[data-strength='high']
								> .value
									background #61bb22

							> .value
								display block
								width 0%
								height 100%
								background transparent
								border-radius 4px
								transition all 0.1s ease

				[type=text], [type=password]
					user-select text
					display inline-block
					cursor auto
					padding 0 12px
					margin 0
					width 100%
					line-height 44px
					font-size 1em
					color #333 !important
					background #fff !important
					outline none
					border solid 1px rgba(0, 0, 0, 0.1)
					border-radius 4px
					box-shadow 0 0 0 114514px #fff inset
					transition all .3s ease

					&:hover
						border-color rgba(0, 0, 0, 0.2)
						transition all .1s ease

					&:focus
						color $theme-color !important
						border-color $theme-color
						box-shadow 0 0 0 1024px #fff inset, 0 0 0 4px rgba($theme-color, 10%)
						transition all 0s ease

					&:disabled
						opacity 0.5

				.agree-tou
					padding 4px
					border-radius 4px

					&:hover
						background #f4f4f4

					&:active
						background #eee

					&, *
						cursor pointer

					p
						display inline
						color #555

				button
					margin 0 0 32px 0
					padding 16px
					width 100%
					font-size 1em
					color #fff
					background $theme-color
					border-radius 3px

					&:hover
						background lighten($theme-color, 5%)

					&:active
						background darken($theme-color, 5%)

	</style>
	<script>
		this.mixin('api');
		this.mixin('get-password-strength');

		this.usernameState = null;
		this.passwordStrength = '';
		this.passwordRetypeState = null;
		this.recaptchaed = false;

		window.onEecaptchaed = () => {
			this.recaptchaed = true;
			this.update();
		}

		window.onRecaptchaExpired = () => {
			this.recaptchaed = false;
			this.update();
		}

		this.on('mount', () => {
			const head = (document.getElementsByTagName('head'))[0];
			script = document.createElement 'script' 
				..setAttribute 'src' \https://www.google.com/recaptcha/api.js
			head.appendChild script
		});

		on-change-username() {
			username = this.refs.username.value

			if username == ''
				this.username-state = null
				this.update();
				return

			err = switch
				| not username.match /^[a-zA-Z0-9\-]+$/ => 'invalid-format' 
				| username.length < 3chars              => 'min-range' 
				| username.length > 20chars             => 'max-range' 
				| _                                     => null

			if err?
				this.username-state = err
				this.update();
			else
				this.username-state = 'wait' 
				this.update();

				this.api 'username/available' do
					username: username
				.then (result) =>
					if result.available
						this.username-state = 'ok' 
					else
						this.username-state = 'unavailable' 
					this.update();
				.catch (err) =>
					this.username-state = 'error' 
					this.update();

		on-change-password() {
			password = this.refs.password.value

			if password == ''
				this.password-strength = ''
				return

			strength = @get-password-strength password

			if strength > 0.3
				this.password-strength = 'medium' 
				if strength > 0.7
					this.password-strength = 'high' 
			else
				this.password-strength = 'low' 

			this.update();

			this.refs.password-metar.style.width = (strength * 100) + '%' 

		on-change-password-retype() {
			password = this.refs.password.value
			retyped-password = this.refs.password-retype.value

			if retyped-password == ''
				this.password-retype-state = null
				return

			if password == retyped-password
				this.password-retype-state = 'match' 
			else
				this.password-retype-state = 'not-match' 

		onsubmit(e) {
			e.preventDefault();

			username = this.refs.username.value
			password = this.refs.password.value

			locker = document.body.appendChild document.createElement 'mk-locker' 

			this.api 'signup' do
				username: username
				password: password
				'g-recaptcha-response': grecaptcha.get-response!
			.then =>
				this.api 'signin' do
					username: username
					password: password
				.then =>
					location.href = CONFIG.url
			.catch =>
				alert '何らかの原因によりアカウントの作成に失敗しました。再度お試しください。'

				grecaptcha.reset!
				this.recaptchaed = false

				locker.parentNode.removeChild locker

			false
	</script>
</mk-signup>
