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

package controller {
    import model.LoginProxy;

    import notifictions.LOGIN;

    import org.puremvc.as3.multicore.utilities.fabrication.patterns.command.SimpleFabricationCommand;

    import org.puremvc.as3.multicore.interfaces.INotification;

    import view.ApplicationMediator;

    public class DependenciesProviderExampleStartupCommand extends SimpleFabricationCommand {

        override public function execute(notification:INotification):void
        {
            super.execute(notification);

            // add dependencies provider
            addDependenciesProvider( Dependencies );
            
            registerCommand( LOGIN, LoginCommand );

            registerProxy( new LoginProxy() );
            registerMediator( new ApplicationMediator( notification.getBody() as DependenciesProviderExample ));



            
        }
    }
}