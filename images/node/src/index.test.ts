/* eslint-env jest */
import { helloWorld } from './index';

describe('helloWorld', () => {
	it('returns text', () => {
		expect(helloWorld('hello world')).toBe('hello world');
		return;
	});
});
