/** @type {import('./$types').LayoutServerLoad} */
export async function load({ cookies }) {
	let theme = cookies.get('theme');

	if(!theme) {
		theme = "dark";
	}

	return {
		theme: theme
	};
}
