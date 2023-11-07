/** @type {import('./$types').PageServerLoad} */
export async function load({ cookies }) {
	const theme = cookies.get('theme');

	return {
		theme: theme
	};
}

export const actions = {
	changetheme: async ({ request, cookies }) => {
		const data = await request.formData();
		let theme = data.get('switch-theme');
		theme = theme == 'dark' ? 'light' : 'dark';
		cookies.set('theme', theme, { path: '/' });
	}
};
