/**
 * Copyright (C) 2008 Darshan Sawardekar.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
package org.puremvc.as3.multicore.utilities.fabrication.components.fabricator {
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.multicore.utilities.fabrication.components.FlexApplication;
	import org.puremvc.as3.multicore.utilities.fabrication.components.FlexApplicationMock;
	import org.puremvc.as3.multicore.utilities.fabrication.patterns.mock.SimpleFabricationCommandMock;
	
	import flexunit.framework.TestSuite;	

	/**
	 * @author Darshan Sawardekar
	 */
	public class FlexApplicationFabricatorTest extends AbstractApplicationFabricatorTest {

		/* *
		static public function suite():TestSuite {
			var suite:TestSuite = new TestSuite();
			suite.addTest(new FlexApplicationFabricatorTest("testFlexApplicationFabricatorUsesCorrectReadyEventName"));
			
			return suite;
		}
		/* */
		
		public function FlexApplicationFabricatorTest(method:String) {
			super(method);
		}

		override public function setUp():void {
			super.setUp();
		}

		override public function tearDown():void {
			super.tearDown();
		}

		override public function initializeFabrication():void {
			fabrication = new FlexApplicationMock();
			initializeFabricationMock();
		}

		override public function initializeFabricator():void {
			fabricator = new FlexApplicationFabricator(fabrication as FlexApplication);
		}

		override public function initializeFabricationMock():void {
			super.initializeFabricationMock();
		}

		public function testFlexApplicationFabricatorHasValidType():void {
			assertType(FlexApplicationFabricator, fabricator);
		}

		public function testFlexApplicationFabricatorUsesCorrectReadyEventName():void {
			initializeFabrication();
			
			fabricationMock.method("addEventListener").withArgs(FlexEvent.CREATION_COMPLETE, Function).atLeast(1);
			
			initializeFabricator();
			
			assertTrue(fabrication.hasEventListener(FlexEvent.CREATION_COMPLETE));
		}
		
		public function testFlexApplicationFabricatorGetsCorrectStartupCommand():void {
			initializeFabrication();
			fabricationMock.method("getStartupCommand").withNoArgs.returns(SimpleFabricationCommandMock);
			initializeFabricator();
			
			verifyMock(fabricationMock);
			assertEquals(SimpleFabricationCommandMock, fabricator.startupCommand);
		}
		
		public function testFlexFabricationFabricatorDoesNotHaveDefaultStartupCommand():void {
			assertNull(fabricator.startupCommand);
		}
		
	}
}
