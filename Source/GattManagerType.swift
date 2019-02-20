/**
 *  Copyright (c) 2019 Uber Technologies, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CoreBluetooth
import RxSwift

///  Responsible for queueing and handling GattOperations using the underlying GattIO for BLE communication.
public protocol GattManagerType {
    /// May be set multiple times as connection cycles occur.
    var gattIO: GattIO? { get set }
    var isConnected: Observable<Bool> { get }
    
    func queue<O: GattOperation>(operation: O) -> Single<O.Element>
    func receiveNotifications(for characteristic: CBUUID) -> Observable<Data>
}