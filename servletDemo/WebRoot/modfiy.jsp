<div id="light" class="white_content">
	This is the lightbox content.
	<a href="javascript:void(0)" id="close">Close</a>

	<form action="/servletDemo/test?method=modify" method="post">
		<table>
			<tr>
				<td></td>
				<td>
					<input name="id" value="" type="hidden">
				</td>
			</tr>
			<tr>
				<td>
					name:
				</td>
				<td>
					<input name="name" value="">
				</td>
			</tr>
			<tr>
				<td>
					age:
				</td>
				<td>
					<input name="age" value="">
				</td>
			</tr>
			<tr>
				<td>
					sex:
				</td>
				<td>
					<label>
						M
					</label>
					<input type="radio" name="sex" value="M" checked="checked" />
					<label>
						W
					</label>
					<input type="radio" name="sex" value="Ů" />
				</td>
			</tr>
			<tr>
				<td>
					hobby:
				</td>
				<td>
					<input name="hobby" value="">
				</td>
			</tr>
			<tr>
				<td>
					info:
				</td>
				<td>
					<input name="info" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" id="modfiy" value="send">
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="fade" class="black_overlay">
</div>