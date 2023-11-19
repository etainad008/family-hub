<script>
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<main>
	<article class="tasks">
		<h5>Tasks</h5>
		<header>
			<div class="tasks--assigned--to">
				<button><p>assigned to me</p></button>
				<button><p>I assigned</p></button>
			</div>
			<div class="tasks--controls" style="margin-left: auto;">
				<select name="sort-by">
					<option>Name</option>
					<option>Deadline</option>
					<option>Assigner</option>
				</select>
				<label>
					<input type="checkbox">
					done
				</label>
			</div>
		</header>
		<hr>
		<div class="tasks--list">
		</div>
	</article>
</main>

<style>
	main {
		display: flex;
		justify-content: space-between;
		padding-inline: var(--padding-900);
		gap: 8rem;
	}
</style>