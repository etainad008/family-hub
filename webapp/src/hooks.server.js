/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
	let theme = event.cookies.get('theme');

	if(!theme) {
		theme = "dark";
		event.cookies.set("theme", "dark", { path: "/" });
	}

	if (theme) {
		return await resolve(event, {
			transformPageChunk: ({ html }) => html.replace('data-theme=""', `data-theme="${theme}"`)
		});
	}
	const response = await resolve(event);
	return response;
}
