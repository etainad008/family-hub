/** @type {import('./$types').LayoutServerLoad} */
export async function load({ cookies }) {
    const theme = cookies.get('theme');

	return {
		theme: theme
	};
}
