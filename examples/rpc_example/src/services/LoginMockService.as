/**
 * Copyright (C) 2010 Rafał Szemraj.
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

package services {
    import mx.rpc.AsyncToken;

    import org.puremvc.as3.multicore.utilities.fabrication.services.FabricationMockService;

    public class LoginMockService extends FabricationMockService implements ILoginService {


        private var logins:Array = [ { login:"eric", pass:"cartman" }, { login:"stan", pass:"marsh" }];


        public function LoginMockService()
        {
        }

        public function getLogins():AsyncToken
        {
            return createMockResult(logins, 2000);
        }
    }
}