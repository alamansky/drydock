/* eslint-env jest */

import React from 'react';
import HelloWorld from './HelloWorld';
import { shallow } from 'enzyme';

const text = 'hello';

describe('<HelloWorld/>', () => {
	it('renders correctly', () => {
		const wrapper: any = shallow(<HelloWorld text={text} />);
		console.log(wrapper.text());
		expect(wrapper.text()).toBe(text);
		expect(wrapper).toMatchSnapshot();
		return;
	});
});
