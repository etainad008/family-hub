/** @type {import('./$types').PageServerLoad} */
export async function load() {
	return {};
}

export const actions = {
	setStatus: async ({ request }) => {
		const data = await request.formData();
	}
}