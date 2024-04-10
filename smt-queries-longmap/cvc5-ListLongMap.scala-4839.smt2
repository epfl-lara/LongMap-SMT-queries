; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66578 () Bool)

(assert start!66578)

(declare-fun b!767389 () Bool)

(declare-fun res!519172 () Bool)

(declare-fun e!427323 () Bool)

(assert (=> b!767389 (=> (not res!519172) (not e!427323))))

(declare-datatypes ((array!42288 0))(
  ( (array!42289 (arr!20247 (Array (_ BitVec 32) (_ BitVec 64))) (size!20668 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42288)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42288 (_ BitVec 32)) Bool)

(assert (=> b!767389 (= res!519172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767390 () Bool)

(declare-fun res!519157 () Bool)

(assert (=> b!767390 (=> (not res!519157) (not e!427323))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767390 (= res!519157 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20668 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20668 a!3186))))))

(declare-fun b!767391 () Bool)

(declare-fun e!427330 () Bool)

(declare-fun e!427329 () Bool)

(assert (=> b!767391 (= e!427330 e!427329)))

(declare-fun res!519166 () Bool)

(assert (=> b!767391 (=> res!519166 e!427329)))

(assert (=> b!767391 (= res!519166 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341374 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767391 (= lt!341374 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767392 () Bool)

(declare-fun res!519156 () Bool)

(declare-fun e!427331 () Bool)

(assert (=> b!767392 (=> (not res!519156) (not e!427331))))

(declare-fun e!427327 () Bool)

(assert (=> b!767392 (= res!519156 e!427327)))

(declare-fun c!84508 () Bool)

(assert (=> b!767392 (= c!84508 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767393 () Bool)

(declare-fun res!519171 () Bool)

(assert (=> b!767393 (=> (not res!519171) (not e!427323))))

(declare-datatypes ((List!14249 0))(
  ( (Nil!14246) (Cons!14245 (h!15338 (_ BitVec 64)) (t!20564 List!14249)) )
))
(declare-fun arrayNoDuplicates!0 (array!42288 (_ BitVec 32) List!14249) Bool)

(assert (=> b!767393 (= res!519171 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14246))))

(declare-fun b!767394 () Bool)

(declare-fun e!427325 () Bool)

(assert (=> b!767394 (= e!427325 (not e!427330))))

(declare-fun res!519168 () Bool)

(assert (=> b!767394 (=> res!519168 e!427330)))

(declare-datatypes ((SeekEntryResult!7847 0))(
  ( (MissingZero!7847 (index!33756 (_ BitVec 32))) (Found!7847 (index!33757 (_ BitVec 32))) (Intermediate!7847 (undefined!8659 Bool) (index!33758 (_ BitVec 32)) (x!64673 (_ BitVec 32))) (Undefined!7847) (MissingVacant!7847 (index!33759 (_ BitVec 32))) )
))
(declare-fun lt!341379 () SeekEntryResult!7847)

(assert (=> b!767394 (= res!519168 (or (not (is-Intermediate!7847 lt!341379)) (bvsge x!1131 (x!64673 lt!341379))))))

(declare-fun lt!341375 () SeekEntryResult!7847)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!767394 (= lt!341375 (Found!7847 j!159))))

(declare-fun e!427326 () Bool)

(assert (=> b!767394 e!427326))

(declare-fun res!519162 () Bool)

(assert (=> b!767394 (=> (not res!519162) (not e!427326))))

(assert (=> b!767394 (= res!519162 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26420 0))(
  ( (Unit!26421) )
))
(declare-fun lt!341376 () Unit!26420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26420)

(assert (=> b!767394 (= lt!341376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767395 () Bool)

(assert (=> b!767395 (= e!427323 e!427331)))

(declare-fun res!519158 () Bool)

(assert (=> b!767395 (=> (not res!519158) (not e!427331))))

(declare-fun lt!341377 () SeekEntryResult!7847)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42288 (_ BitVec 32)) SeekEntryResult!7847)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767395 (= res!519158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341377))))

(assert (=> b!767395 (= lt!341377 (Intermediate!7847 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767396 () Bool)

(declare-fun res!519164 () Bool)

(assert (=> b!767396 (=> (not res!519164) (not e!427331))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767396 (= res!519164 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20247 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767397 () Bool)

(declare-fun e!427324 () Bool)

(declare-fun lt!341378 () SeekEntryResult!7847)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42288 (_ BitVec 32)) SeekEntryResult!7847)

(assert (=> b!767397 (= e!427324 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341378))))

(declare-fun b!767398 () Bool)

(declare-fun res!519167 () Bool)

(declare-fun e!427328 () Bool)

(assert (=> b!767398 (=> (not res!519167) (not e!427328))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767398 (= res!519167 (validKeyInArray!0 k!2102))))

(declare-fun b!767399 () Bool)

(assert (=> b!767399 (= e!427331 e!427325)))

(declare-fun res!519165 () Bool)

(assert (=> b!767399 (=> (not res!519165) (not e!427325))))

(declare-fun lt!341373 () SeekEntryResult!7847)

(assert (=> b!767399 (= res!519165 (= lt!341373 lt!341379))))

(declare-fun lt!341372 () (_ BitVec 64))

(declare-fun lt!341380 () array!42288)

(assert (=> b!767399 (= lt!341379 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341372 lt!341380 mask!3328))))

(assert (=> b!767399 (= lt!341373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341372 mask!3328) lt!341372 lt!341380 mask!3328))))

(assert (=> b!767399 (= lt!341372 (select (store (arr!20247 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767399 (= lt!341380 (array!42289 (store (arr!20247 a!3186) i!1173 k!2102) (size!20668 a!3186)))))

(declare-fun b!767400 () Bool)

(declare-fun res!519161 () Bool)

(assert (=> b!767400 (=> (not res!519161) (not e!427328))))

(assert (=> b!767400 (= res!519161 (and (= (size!20668 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20668 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20668 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767402 () Bool)

(assert (=> b!767402 (= e!427326 e!427324)))

(declare-fun res!519163 () Bool)

(assert (=> b!767402 (=> (not res!519163) (not e!427324))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42288 (_ BitVec 32)) SeekEntryResult!7847)

(assert (=> b!767402 (= res!519163 (= (seekEntryOrOpen!0 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341378))))

(assert (=> b!767402 (= lt!341378 (Found!7847 j!159))))

(declare-fun b!767403 () Bool)

(assert (=> b!767403 (= e!427328 e!427323)))

(declare-fun res!519155 () Bool)

(assert (=> b!767403 (=> (not res!519155) (not e!427323))))

(declare-fun lt!341381 () SeekEntryResult!7847)

(assert (=> b!767403 (= res!519155 (or (= lt!341381 (MissingZero!7847 i!1173)) (= lt!341381 (MissingVacant!7847 i!1173))))))

(assert (=> b!767403 (= lt!341381 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!767404 () Bool)

(declare-fun res!519170 () Bool)

(assert (=> b!767404 (=> (not res!519170) (not e!427328))))

(assert (=> b!767404 (= res!519170 (validKeyInArray!0 (select (arr!20247 a!3186) j!159)))))

(declare-fun b!767405 () Bool)

(declare-fun res!519159 () Bool)

(assert (=> b!767405 (=> res!519159 e!427329)))

(assert (=> b!767405 (= res!519159 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341375)))))

(declare-fun b!767406 () Bool)

(assert (=> b!767406 (= e!427327 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341377))))

(declare-fun b!767407 () Bool)

(declare-fun res!519160 () Bool)

(assert (=> b!767407 (=> (not res!519160) (not e!427328))))

(declare-fun arrayContainsKey!0 (array!42288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767407 (= res!519160 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767408 () Bool)

(assert (=> b!767408 (= e!427327 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) (Found!7847 j!159)))))

(declare-fun b!767401 () Bool)

(assert (=> b!767401 (= e!427329 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341374 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341375))))

(declare-fun res!519169 () Bool)

(assert (=> start!66578 (=> (not res!519169) (not e!427328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66578 (= res!519169 (validMask!0 mask!3328))))

(assert (=> start!66578 e!427328))

(assert (=> start!66578 true))

(declare-fun array_inv!16043 (array!42288) Bool)

(assert (=> start!66578 (array_inv!16043 a!3186)))

(assert (= (and start!66578 res!519169) b!767400))

(assert (= (and b!767400 res!519161) b!767404))

(assert (= (and b!767404 res!519170) b!767398))

(assert (= (and b!767398 res!519167) b!767407))

(assert (= (and b!767407 res!519160) b!767403))

(assert (= (and b!767403 res!519155) b!767389))

(assert (= (and b!767389 res!519172) b!767393))

(assert (= (and b!767393 res!519171) b!767390))

(assert (= (and b!767390 res!519157) b!767395))

(assert (= (and b!767395 res!519158) b!767396))

(assert (= (and b!767396 res!519164) b!767392))

(assert (= (and b!767392 c!84508) b!767406))

(assert (= (and b!767392 (not c!84508)) b!767408))

(assert (= (and b!767392 res!519156) b!767399))

(assert (= (and b!767399 res!519165) b!767394))

(assert (= (and b!767394 res!519162) b!767402))

(assert (= (and b!767402 res!519163) b!767397))

(assert (= (and b!767394 (not res!519168)) b!767391))

(assert (= (and b!767391 (not res!519166)) b!767405))

(assert (= (and b!767405 (not res!519159)) b!767401))

(declare-fun m!713169 () Bool)

(assert (=> b!767408 m!713169))

(assert (=> b!767408 m!713169))

(declare-fun m!713171 () Bool)

(assert (=> b!767408 m!713171))

(assert (=> b!767404 m!713169))

(assert (=> b!767404 m!713169))

(declare-fun m!713173 () Bool)

(assert (=> b!767404 m!713173))

(declare-fun m!713175 () Bool)

(assert (=> b!767403 m!713175))

(assert (=> b!767406 m!713169))

(assert (=> b!767406 m!713169))

(declare-fun m!713177 () Bool)

(assert (=> b!767406 m!713177))

(assert (=> b!767401 m!713169))

(assert (=> b!767401 m!713169))

(declare-fun m!713179 () Bool)

(assert (=> b!767401 m!713179))

(assert (=> b!767397 m!713169))

(assert (=> b!767397 m!713169))

(declare-fun m!713181 () Bool)

(assert (=> b!767397 m!713181))

(assert (=> b!767402 m!713169))

(assert (=> b!767402 m!713169))

(declare-fun m!713183 () Bool)

(assert (=> b!767402 m!713183))

(declare-fun m!713185 () Bool)

(assert (=> b!767393 m!713185))

(assert (=> b!767405 m!713169))

(assert (=> b!767405 m!713169))

(assert (=> b!767405 m!713171))

(declare-fun m!713187 () Bool)

(assert (=> b!767396 m!713187))

(declare-fun m!713189 () Bool)

(assert (=> b!767389 m!713189))

(assert (=> b!767395 m!713169))

(assert (=> b!767395 m!713169))

(declare-fun m!713191 () Bool)

(assert (=> b!767395 m!713191))

(assert (=> b!767395 m!713191))

(assert (=> b!767395 m!713169))

(declare-fun m!713193 () Bool)

(assert (=> b!767395 m!713193))

(declare-fun m!713195 () Bool)

(assert (=> b!767394 m!713195))

(declare-fun m!713197 () Bool)

(assert (=> b!767394 m!713197))

(declare-fun m!713199 () Bool)

(assert (=> b!767391 m!713199))

(declare-fun m!713201 () Bool)

(assert (=> b!767398 m!713201))

(declare-fun m!713203 () Bool)

(assert (=> b!767407 m!713203))

(declare-fun m!713205 () Bool)

(assert (=> b!767399 m!713205))

(declare-fun m!713207 () Bool)

(assert (=> b!767399 m!713207))

(declare-fun m!713209 () Bool)

(assert (=> b!767399 m!713209))

(declare-fun m!713211 () Bool)

(assert (=> b!767399 m!713211))

(assert (=> b!767399 m!713211))

(declare-fun m!713213 () Bool)

(assert (=> b!767399 m!713213))

(declare-fun m!713215 () Bool)

(assert (=> start!66578 m!713215))

(declare-fun m!713217 () Bool)

(assert (=> start!66578 m!713217))

(push 1)

(assert (not b!767394))

(assert (not b!767398))

(assert (not b!767405))

(assert (not b!767408))

(assert (not start!66578))

(assert (not b!767389))

(assert (not b!767393))

(assert (not b!767402))

(assert (not b!767391))

(assert (not b!767407))

(assert (not b!767406))

(assert (not b!767399))

(assert (not b!767404))

(assert (not b!767397))

(assert (not b!767401))

(assert (not b!767395))

(assert (not b!767403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!767610 () Bool)

(declare-fun e!427446 () Bool)

(declare-fun lt!341471 () SeekEntryResult!7847)

(assert (=> b!767610 (= e!427446 (bvsge (x!64673 lt!341471) #b01111111111111111111111111111110))))

(declare-fun b!767611 () Bool)

(declare-fun e!427443 () SeekEntryResult!7847)

(assert (=> b!767611 (= e!427443 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341372 lt!341380 mask!3328))))

(declare-fun b!767612 () Bool)

(assert (=> b!767612 (and (bvsge (index!33758 lt!341471) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341471) (size!20668 lt!341380)))))

(declare-fun res!519303 () Bool)

(assert (=> b!767612 (= res!519303 (= (select (arr!20247 lt!341380) (index!33758 lt!341471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427444 () Bool)

(assert (=> b!767612 (=> res!519303 e!427444)))

(declare-fun b!767613 () Bool)

(declare-fun e!427445 () Bool)

(assert (=> b!767613 (= e!427446 e!427445)))

(declare-fun res!519302 () Bool)

(assert (=> b!767613 (= res!519302 (and (is-Intermediate!7847 lt!341471) (not (undefined!8659 lt!341471)) (bvslt (x!64673 lt!341471) #b01111111111111111111111111111110) (bvsge (x!64673 lt!341471) #b00000000000000000000000000000000) (bvsge (x!64673 lt!341471) x!1131)))))

(assert (=> b!767613 (=> (not res!519302) (not e!427445))))

(declare-fun d!101359 () Bool)

(assert (=> d!101359 e!427446))

(declare-fun c!84546 () Bool)

(assert (=> d!101359 (= c!84546 (and (is-Intermediate!7847 lt!341471) (undefined!8659 lt!341471)))))

(declare-fun e!427442 () SeekEntryResult!7847)

(assert (=> d!101359 (= lt!341471 e!427442)))

(declare-fun c!84547 () Bool)

(assert (=> d!101359 (= c!84547 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341470 () (_ BitVec 64))

(assert (=> d!101359 (= lt!341470 (select (arr!20247 lt!341380) index!1321))))

(assert (=> d!101359 (validMask!0 mask!3328)))

(assert (=> d!101359 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341372 lt!341380 mask!3328) lt!341471)))

(declare-fun b!767614 () Bool)

(assert (=> b!767614 (and (bvsge (index!33758 lt!341471) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341471) (size!20668 lt!341380)))))

(declare-fun res!519304 () Bool)

(assert (=> b!767614 (= res!519304 (= (select (arr!20247 lt!341380) (index!33758 lt!341471)) lt!341372))))

(assert (=> b!767614 (=> res!519304 e!427444)))

(assert (=> b!767614 (= e!427445 e!427444)))

(declare-fun b!767615 () Bool)

(assert (=> b!767615 (= e!427442 (Intermediate!7847 true index!1321 x!1131))))

(declare-fun b!767616 () Bool)

(assert (=> b!767616 (= e!427443 (Intermediate!7847 false index!1321 x!1131))))

(declare-fun b!767617 () Bool)

(assert (=> b!767617 (and (bvsge (index!33758 lt!341471) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341471) (size!20668 lt!341380)))))

(assert (=> b!767617 (= e!427444 (= (select (arr!20247 lt!341380) (index!33758 lt!341471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767618 () Bool)

(assert (=> b!767618 (= e!427442 e!427443)))

(declare-fun c!84545 () Bool)

(assert (=> b!767618 (= c!84545 (or (= lt!341470 lt!341372) (= (bvadd lt!341470 lt!341470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101359 c!84547) b!767615))

(assert (= (and d!101359 (not c!84547)) b!767618))

(assert (= (and b!767618 c!84545) b!767616))

(assert (= (and b!767618 (not c!84545)) b!767611))

(assert (= (and d!101359 c!84546) b!767610))

(assert (= (and d!101359 (not c!84546)) b!767613))

(assert (= (and b!767613 res!519302) b!767614))

(assert (= (and b!767614 (not res!519304)) b!767612))

(assert (= (and b!767612 (not res!519303)) b!767617))

(declare-fun m!713353 () Bool)

(assert (=> b!767614 m!713353))

(assert (=> b!767612 m!713353))

(declare-fun m!713355 () Bool)

(assert (=> d!101359 m!713355))

(assert (=> d!101359 m!713215))

(assert (=> b!767617 m!713353))

(assert (=> b!767611 m!713199))

(assert (=> b!767611 m!713199))

(declare-fun m!713357 () Bool)

(assert (=> b!767611 m!713357))

(assert (=> b!767399 d!101359))

(declare-fun b!767619 () Bool)

(declare-fun e!427451 () Bool)

(declare-fun lt!341473 () SeekEntryResult!7847)

(assert (=> b!767619 (= e!427451 (bvsge (x!64673 lt!341473) #b01111111111111111111111111111110))))

(declare-fun b!767620 () Bool)

(declare-fun e!427448 () SeekEntryResult!7847)

(assert (=> b!767620 (= e!427448 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341372 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341372 lt!341380 mask!3328))))

(declare-fun b!767621 () Bool)

(assert (=> b!767621 (and (bvsge (index!33758 lt!341473) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341473) (size!20668 lt!341380)))))

(declare-fun res!519306 () Bool)

(assert (=> b!767621 (= res!519306 (= (select (arr!20247 lt!341380) (index!33758 lt!341473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427449 () Bool)

(assert (=> b!767621 (=> res!519306 e!427449)))

(declare-fun b!767622 () Bool)

(declare-fun e!427450 () Bool)

(assert (=> b!767622 (= e!427451 e!427450)))

(declare-fun res!519305 () Bool)

(assert (=> b!767622 (= res!519305 (and (is-Intermediate!7847 lt!341473) (not (undefined!8659 lt!341473)) (bvslt (x!64673 lt!341473) #b01111111111111111111111111111110) (bvsge (x!64673 lt!341473) #b00000000000000000000000000000000) (bvsge (x!64673 lt!341473) #b00000000000000000000000000000000)))))

(assert (=> b!767622 (=> (not res!519305) (not e!427450))))

(declare-fun d!101369 () Bool)

(assert (=> d!101369 e!427451))

(declare-fun c!84549 () Bool)

(assert (=> d!101369 (= c!84549 (and (is-Intermediate!7847 lt!341473) (undefined!8659 lt!341473)))))

(declare-fun e!427447 () SeekEntryResult!7847)

(assert (=> d!101369 (= lt!341473 e!427447)))

(declare-fun c!84550 () Bool)

(assert (=> d!101369 (= c!84550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341472 () (_ BitVec 64))

(assert (=> d!101369 (= lt!341472 (select (arr!20247 lt!341380) (toIndex!0 lt!341372 mask!3328)))))

(assert (=> d!101369 (validMask!0 mask!3328)))

(assert (=> d!101369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341372 mask!3328) lt!341372 lt!341380 mask!3328) lt!341473)))

(declare-fun b!767623 () Bool)

(assert (=> b!767623 (and (bvsge (index!33758 lt!341473) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341473) (size!20668 lt!341380)))))

(declare-fun res!519307 () Bool)

(assert (=> b!767623 (= res!519307 (= (select (arr!20247 lt!341380) (index!33758 lt!341473)) lt!341372))))

(assert (=> b!767623 (=> res!519307 e!427449)))

(assert (=> b!767623 (= e!427450 e!427449)))

(declare-fun b!767624 () Bool)

(assert (=> b!767624 (= e!427447 (Intermediate!7847 true (toIndex!0 lt!341372 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767625 () Bool)

(assert (=> b!767625 (= e!427448 (Intermediate!7847 false (toIndex!0 lt!341372 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767626 () Bool)

(assert (=> b!767626 (and (bvsge (index!33758 lt!341473) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341473) (size!20668 lt!341380)))))

(assert (=> b!767626 (= e!427449 (= (select (arr!20247 lt!341380) (index!33758 lt!341473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767627 () Bool)

(assert (=> b!767627 (= e!427447 e!427448)))

(declare-fun c!84548 () Bool)

(assert (=> b!767627 (= c!84548 (or (= lt!341472 lt!341372) (= (bvadd lt!341472 lt!341472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101369 c!84550) b!767624))

(assert (= (and d!101369 (not c!84550)) b!767627))

(assert (= (and b!767627 c!84548) b!767625))

(assert (= (and b!767627 (not c!84548)) b!767620))

(assert (= (and d!101369 c!84549) b!767619))

(assert (= (and d!101369 (not c!84549)) b!767622))

(assert (= (and b!767622 res!519305) b!767623))

(assert (= (and b!767623 (not res!519307)) b!767621))

(assert (= (and b!767621 (not res!519306)) b!767626))

(declare-fun m!713359 () Bool)

(assert (=> b!767623 m!713359))

(assert (=> b!767621 m!713359))

(assert (=> d!101369 m!713211))

(declare-fun m!713361 () Bool)

(assert (=> d!101369 m!713361))

(assert (=> d!101369 m!713215))

(assert (=> b!767626 m!713359))

(assert (=> b!767620 m!713211))

(declare-fun m!713363 () Bool)

(assert (=> b!767620 m!713363))

(assert (=> b!767620 m!713363))

(declare-fun m!713365 () Bool)

(assert (=> b!767620 m!713365))

(assert (=> b!767399 d!101369))

(declare-fun d!101371 () Bool)

(declare-fun lt!341483 () (_ BitVec 32))

(declare-fun lt!341482 () (_ BitVec 32))

(assert (=> d!101371 (= lt!341483 (bvmul (bvxor lt!341482 (bvlshr lt!341482 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101371 (= lt!341482 ((_ extract 31 0) (bvand (bvxor lt!341372 (bvlshr lt!341372 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101371 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519308 (let ((h!15341 ((_ extract 31 0) (bvand (bvxor lt!341372 (bvlshr lt!341372 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64678 (bvmul (bvxor h!15341 (bvlshr h!15341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64678 (bvlshr x!64678 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519308 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519308 #b00000000000000000000000000000000))))))

(assert (=> d!101371 (= (toIndex!0 lt!341372 mask!3328) (bvand (bvxor lt!341483 (bvlshr lt!341483 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767399 d!101371))

(declare-fun d!101373 () Bool)

(assert (=> d!101373 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767398 d!101373))

(declare-fun b!767700 () Bool)

(declare-fun e!427494 () SeekEntryResult!7847)

(assert (=> b!767700 (= e!427494 Undefined!7847)))

(declare-fun b!767701 () Bool)

(declare-fun c!84579 () Bool)

(declare-fun lt!341510 () (_ BitVec 64))

(assert (=> b!767701 (= c!84579 (= lt!341510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427495 () SeekEntryResult!7847)

(declare-fun e!427493 () SeekEntryResult!7847)

(assert (=> b!767701 (= e!427495 e!427493)))

(declare-fun b!767702 () Bool)

(assert (=> b!767702 (= e!427495 (Found!7847 resIntermediateIndex!5))))

(declare-fun b!767703 () Bool)

(assert (=> b!767703 (= e!427493 (MissingVacant!7847 resIntermediateIndex!5))))

(declare-fun b!767704 () Bool)

(assert (=> b!767704 (= e!427493 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767705 () Bool)

(assert (=> b!767705 (= e!427494 e!427495)))

(declare-fun c!84580 () Bool)

(assert (=> b!767705 (= c!84580 (= lt!341510 (select (arr!20247 a!3186) j!159)))))

(declare-fun d!101375 () Bool)

(declare-fun lt!341511 () SeekEntryResult!7847)

(assert (=> d!101375 (and (or (is-Undefined!7847 lt!341511) (not (is-Found!7847 lt!341511)) (and (bvsge (index!33757 lt!341511) #b00000000000000000000000000000000) (bvslt (index!33757 lt!341511) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341511) (is-Found!7847 lt!341511) (not (is-MissingVacant!7847 lt!341511)) (not (= (index!33759 lt!341511) resIntermediateIndex!5)) (and (bvsge (index!33759 lt!341511) #b00000000000000000000000000000000) (bvslt (index!33759 lt!341511) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341511) (ite (is-Found!7847 lt!341511) (= (select (arr!20247 a!3186) (index!33757 lt!341511)) (select (arr!20247 a!3186) j!159)) (and (is-MissingVacant!7847 lt!341511) (= (index!33759 lt!341511) resIntermediateIndex!5) (= (select (arr!20247 a!3186) (index!33759 lt!341511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101375 (= lt!341511 e!427494)))

(declare-fun c!84578 () Bool)

(assert (=> d!101375 (= c!84578 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101375 (= lt!341510 (select (arr!20247 a!3186) resIntermediateIndex!5))))

(assert (=> d!101375 (validMask!0 mask!3328)))

(assert (=> d!101375 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341511)))

(assert (= (and d!101375 c!84578) b!767700))

(assert (= (and d!101375 (not c!84578)) b!767705))

(assert (= (and b!767705 c!84580) b!767702))

(assert (= (and b!767705 (not c!84580)) b!767701))

(assert (= (and b!767701 c!84579) b!767703))

(assert (= (and b!767701 (not c!84579)) b!767704))

(declare-fun m!713399 () Bool)

(assert (=> b!767704 m!713399))

(assert (=> b!767704 m!713399))

(assert (=> b!767704 m!713169))

(declare-fun m!713401 () Bool)

(assert (=> b!767704 m!713401))

(declare-fun m!713403 () Bool)

(assert (=> d!101375 m!713403))

(declare-fun m!713405 () Bool)

(assert (=> d!101375 m!713405))

(assert (=> d!101375 m!713187))

(assert (=> d!101375 m!713215))

(assert (=> b!767397 d!101375))

(declare-fun b!767715 () Bool)

(declare-fun e!427502 () SeekEntryResult!7847)

(assert (=> b!767715 (= e!427502 Undefined!7847)))

(declare-fun b!767716 () Bool)

(declare-fun c!84585 () Bool)

(declare-fun lt!341514 () (_ BitVec 64))

(assert (=> b!767716 (= c!84585 (= lt!341514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427503 () SeekEntryResult!7847)

(declare-fun e!427501 () SeekEntryResult!7847)

(assert (=> b!767716 (= e!427503 e!427501)))

(declare-fun b!767717 () Bool)

(assert (=> b!767717 (= e!427503 (Found!7847 index!1321))))

(declare-fun b!767718 () Bool)

(assert (=> b!767718 (= e!427501 (MissingVacant!7847 resIntermediateIndex!5))))

(declare-fun b!767719 () Bool)

(assert (=> b!767719 (= e!427501 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767720 () Bool)

(assert (=> b!767720 (= e!427502 e!427503)))

(declare-fun c!84586 () Bool)

(assert (=> b!767720 (= c!84586 (= lt!341514 (select (arr!20247 a!3186) j!159)))))

(declare-fun d!101391 () Bool)

(declare-fun lt!341515 () SeekEntryResult!7847)

(assert (=> d!101391 (and (or (is-Undefined!7847 lt!341515) (not (is-Found!7847 lt!341515)) (and (bvsge (index!33757 lt!341515) #b00000000000000000000000000000000) (bvslt (index!33757 lt!341515) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341515) (is-Found!7847 lt!341515) (not (is-MissingVacant!7847 lt!341515)) (not (= (index!33759 lt!341515) resIntermediateIndex!5)) (and (bvsge (index!33759 lt!341515) #b00000000000000000000000000000000) (bvslt (index!33759 lt!341515) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341515) (ite (is-Found!7847 lt!341515) (= (select (arr!20247 a!3186) (index!33757 lt!341515)) (select (arr!20247 a!3186) j!159)) (and (is-MissingVacant!7847 lt!341515) (= (index!33759 lt!341515) resIntermediateIndex!5) (= (select (arr!20247 a!3186) (index!33759 lt!341515)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101391 (= lt!341515 e!427502)))

(declare-fun c!84584 () Bool)

(assert (=> d!101391 (= c!84584 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101391 (= lt!341514 (select (arr!20247 a!3186) index!1321))))

(assert (=> d!101391 (validMask!0 mask!3328)))

(assert (=> d!101391 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341515)))

(assert (= (and d!101391 c!84584) b!767715))

(assert (= (and d!101391 (not c!84584)) b!767720))

(assert (= (and b!767720 c!84586) b!767717))

(assert (= (and b!767720 (not c!84586)) b!767716))

(assert (= (and b!767716 c!84585) b!767718))

(assert (= (and b!767716 (not c!84585)) b!767719))

(assert (=> b!767719 m!713199))

(assert (=> b!767719 m!713199))

(assert (=> b!767719 m!713169))

(declare-fun m!713415 () Bool)

(assert (=> b!767719 m!713415))

(declare-fun m!713417 () Bool)

(assert (=> d!101391 m!713417))

(declare-fun m!713419 () Bool)

(assert (=> d!101391 m!713419))

(declare-fun m!713421 () Bool)

(assert (=> d!101391 m!713421))

(assert (=> d!101391 m!713215))

(assert (=> b!767408 d!101391))

(declare-fun d!101395 () Bool)

(declare-fun lt!341520 () (_ BitVec 32))

(assert (=> d!101395 (and (bvsge lt!341520 #b00000000000000000000000000000000) (bvslt lt!341520 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101395 (= lt!341520 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101395 (validMask!0 mask!3328)))

(assert (=> d!101395 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341520)))

(declare-fun bs!21523 () Bool)

(assert (= bs!21523 d!101395))

(declare-fun m!713423 () Bool)

(assert (=> bs!21523 m!713423))

(assert (=> bs!21523 m!713215))

(assert (=> b!767391 d!101395))

(declare-fun b!767803 () Bool)

(declare-fun e!427550 () SeekEntryResult!7847)

(declare-fun lt!341555 () SeekEntryResult!7847)

(assert (=> b!767803 (= e!427550 (Found!7847 (index!33758 lt!341555)))))

(declare-fun e!427548 () SeekEntryResult!7847)

(declare-fun b!767804 () Bool)

(assert (=> b!767804 (= e!427548 (seekKeyOrZeroReturnVacant!0 (x!64673 lt!341555) (index!33758 lt!341555) (index!33758 lt!341555) (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101399 () Bool)

(declare-fun lt!341557 () SeekEntryResult!7847)

(assert (=> d!101399 (and (or (is-Undefined!7847 lt!341557) (not (is-Found!7847 lt!341557)) (and (bvsge (index!33757 lt!341557) #b00000000000000000000000000000000) (bvslt (index!33757 lt!341557) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341557) (is-Found!7847 lt!341557) (not (is-MissingZero!7847 lt!341557)) (and (bvsge (index!33756 lt!341557) #b00000000000000000000000000000000) (bvslt (index!33756 lt!341557) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341557) (is-Found!7847 lt!341557) (is-MissingZero!7847 lt!341557) (not (is-MissingVacant!7847 lt!341557)) (and (bvsge (index!33759 lt!341557) #b00000000000000000000000000000000) (bvslt (index!33759 lt!341557) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341557) (ite (is-Found!7847 lt!341557) (= (select (arr!20247 a!3186) (index!33757 lt!341557)) (select (arr!20247 a!3186) j!159)) (ite (is-MissingZero!7847 lt!341557) (= (select (arr!20247 a!3186) (index!33756 lt!341557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7847 lt!341557) (= (select (arr!20247 a!3186) (index!33759 lt!341557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427549 () SeekEntryResult!7847)

(assert (=> d!101399 (= lt!341557 e!427549)))

(declare-fun c!84622 () Bool)

(assert (=> d!101399 (= c!84622 (and (is-Intermediate!7847 lt!341555) (undefined!8659 lt!341555)))))

(assert (=> d!101399 (= lt!341555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101399 (validMask!0 mask!3328)))

(assert (=> d!101399 (= (seekEntryOrOpen!0 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341557)))

(declare-fun b!767805 () Bool)

(declare-fun c!84623 () Bool)

(declare-fun lt!341556 () (_ BitVec 64))

(assert (=> b!767805 (= c!84623 (= lt!341556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767805 (= e!427550 e!427548)))

(declare-fun b!767806 () Bool)

(assert (=> b!767806 (= e!427549 Undefined!7847)))

(declare-fun b!767807 () Bool)

(assert (=> b!767807 (= e!427549 e!427550)))

(assert (=> b!767807 (= lt!341556 (select (arr!20247 a!3186) (index!33758 lt!341555)))))

(declare-fun c!84621 () Bool)

(assert (=> b!767807 (= c!84621 (= lt!341556 (select (arr!20247 a!3186) j!159)))))

(declare-fun b!767808 () Bool)

(assert (=> b!767808 (= e!427548 (MissingZero!7847 (index!33758 lt!341555)))))

(assert (= (and d!101399 c!84622) b!767806))

(assert (= (and d!101399 (not c!84622)) b!767807))

(assert (= (and b!767807 c!84621) b!767803))

(assert (= (and b!767807 (not c!84621)) b!767805))

(assert (= (and b!767805 c!84623) b!767808))

(assert (= (and b!767805 (not c!84623)) b!767804))

(assert (=> b!767804 m!713169))

(declare-fun m!713473 () Bool)

(assert (=> b!767804 m!713473))

(assert (=> d!101399 m!713191))

(assert (=> d!101399 m!713169))

(assert (=> d!101399 m!713193))

(assert (=> d!101399 m!713215))

(declare-fun m!713475 () Bool)

(assert (=> d!101399 m!713475))

(assert (=> d!101399 m!713169))

(assert (=> d!101399 m!713191))

(declare-fun m!713477 () Bool)

(assert (=> d!101399 m!713477))

(declare-fun m!713481 () Bool)

(assert (=> d!101399 m!713481))

(declare-fun m!713483 () Bool)

(assert (=> b!767807 m!713483))

(assert (=> b!767402 d!101399))

(declare-fun b!767818 () Bool)

(declare-fun e!427557 () SeekEntryResult!7847)

(assert (=> b!767818 (= e!427557 Undefined!7847)))

(declare-fun b!767819 () Bool)

(declare-fun c!84628 () Bool)

(declare-fun lt!341563 () (_ BitVec 64))

(assert (=> b!767819 (= c!84628 (= lt!341563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427558 () SeekEntryResult!7847)

(declare-fun e!427556 () SeekEntryResult!7847)

(assert (=> b!767819 (= e!427558 e!427556)))

(declare-fun b!767820 () Bool)

(assert (=> b!767820 (= e!427558 (Found!7847 lt!341374))))

(declare-fun b!767821 () Bool)

(assert (=> b!767821 (= e!427556 (MissingVacant!7847 resIntermediateIndex!5))))

(declare-fun b!767822 () Bool)

(assert (=> b!767822 (= e!427556 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341374 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767823 () Bool)

(assert (=> b!767823 (= e!427557 e!427558)))

(declare-fun c!84629 () Bool)

(assert (=> b!767823 (= c!84629 (= lt!341563 (select (arr!20247 a!3186) j!159)))))

(declare-fun lt!341564 () SeekEntryResult!7847)

(declare-fun d!101417 () Bool)

(assert (=> d!101417 (and (or (is-Undefined!7847 lt!341564) (not (is-Found!7847 lt!341564)) (and (bvsge (index!33757 lt!341564) #b00000000000000000000000000000000) (bvslt (index!33757 lt!341564) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341564) (is-Found!7847 lt!341564) (not (is-MissingVacant!7847 lt!341564)) (not (= (index!33759 lt!341564) resIntermediateIndex!5)) (and (bvsge (index!33759 lt!341564) #b00000000000000000000000000000000) (bvslt (index!33759 lt!341564) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341564) (ite (is-Found!7847 lt!341564) (= (select (arr!20247 a!3186) (index!33757 lt!341564)) (select (arr!20247 a!3186) j!159)) (and (is-MissingVacant!7847 lt!341564) (= (index!33759 lt!341564) resIntermediateIndex!5) (= (select (arr!20247 a!3186) (index!33759 lt!341564)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101417 (= lt!341564 e!427557)))

(declare-fun c!84627 () Bool)

(assert (=> d!101417 (= c!84627 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101417 (= lt!341563 (select (arr!20247 a!3186) lt!341374))))

(assert (=> d!101417 (validMask!0 mask!3328)))

(assert (=> d!101417 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341374 resIntermediateIndex!5 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341564)))

(assert (= (and d!101417 c!84627) b!767818))

(assert (= (and d!101417 (not c!84627)) b!767823))

(assert (= (and b!767823 c!84629) b!767820))

(assert (= (and b!767823 (not c!84629)) b!767819))

(assert (= (and b!767819 c!84628) b!767821))

(assert (= (and b!767819 (not c!84628)) b!767822))

(declare-fun m!713485 () Bool)

(assert (=> b!767822 m!713485))

(assert (=> b!767822 m!713485))

(assert (=> b!767822 m!713169))

(declare-fun m!713487 () Bool)

(assert (=> b!767822 m!713487))

(declare-fun m!713489 () Bool)

(assert (=> d!101417 m!713489))

(declare-fun m!713491 () Bool)

(assert (=> d!101417 m!713491))

(declare-fun m!713495 () Bool)

(assert (=> d!101417 m!713495))

(assert (=> d!101417 m!713215))

(assert (=> b!767401 d!101417))

(declare-fun d!101419 () Bool)

(assert (=> d!101419 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66578 d!101419))

(declare-fun d!101427 () Bool)

(assert (=> d!101427 (= (array_inv!16043 a!3186) (bvsge (size!20668 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66578 d!101427))

(declare-fun b!767871 () Bool)

(declare-fun e!427594 () Bool)

(declare-fun call!35080 () Bool)

(assert (=> b!767871 (= e!427594 call!35080)))

(declare-fun b!767872 () Bool)

(declare-fun e!427593 () Bool)

(assert (=> b!767872 (= e!427594 e!427593)))

(declare-fun lt!341587 () (_ BitVec 64))

(assert (=> b!767872 (= lt!341587 (select (arr!20247 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341589 () Unit!26420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42288 (_ BitVec 64) (_ BitVec 32)) Unit!26420)

(assert (=> b!767872 (= lt!341589 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341587 #b00000000000000000000000000000000))))

(assert (=> b!767872 (arrayContainsKey!0 a!3186 lt!341587 #b00000000000000000000000000000000)))

(declare-fun lt!341588 () Unit!26420)

(assert (=> b!767872 (= lt!341588 lt!341589)))

(declare-fun res!519368 () Bool)

(assert (=> b!767872 (= res!519368 (= (seekEntryOrOpen!0 (select (arr!20247 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7847 #b00000000000000000000000000000000)))))

(assert (=> b!767872 (=> (not res!519368) (not e!427593))))

(declare-fun b!767873 () Bool)

(declare-fun e!427592 () Bool)

(assert (=> b!767873 (= e!427592 e!427594)))

(declare-fun c!84644 () Bool)

(assert (=> b!767873 (= c!84644 (validKeyInArray!0 (select (arr!20247 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767874 () Bool)

(assert (=> b!767874 (= e!427593 call!35080)))

(declare-fun bm!35077 () Bool)

(assert (=> bm!35077 (= call!35080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101429 () Bool)

(declare-fun res!519369 () Bool)

(assert (=> d!101429 (=> res!519369 e!427592)))

(assert (=> d!101429 (= res!519369 (bvsge #b00000000000000000000000000000000 (size!20668 a!3186)))))

(assert (=> d!101429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427592)))

(assert (= (and d!101429 (not res!519369)) b!767873))

(assert (= (and b!767873 c!84644) b!767872))

(assert (= (and b!767873 (not c!84644)) b!767871))

(assert (= (and b!767872 res!519368) b!767874))

(assert (= (or b!767874 b!767871) bm!35077))

(declare-fun m!713533 () Bool)

(assert (=> b!767872 m!713533))

(declare-fun m!713535 () Bool)

(assert (=> b!767872 m!713535))

(declare-fun m!713537 () Bool)

(assert (=> b!767872 m!713537))

(assert (=> b!767872 m!713533))

(declare-fun m!713539 () Bool)

(assert (=> b!767872 m!713539))

(assert (=> b!767873 m!713533))

(assert (=> b!767873 m!713533))

(declare-fun m!713545 () Bool)

(assert (=> b!767873 m!713545))

(declare-fun m!713549 () Bool)

(assert (=> bm!35077 m!713549))

(assert (=> b!767389 d!101429))

(declare-fun b!767881 () Bool)

(declare-fun e!427600 () Bool)

(declare-fun call!35081 () Bool)

(assert (=> b!767881 (= e!427600 call!35081)))

(declare-fun b!767882 () Bool)

(declare-fun e!427599 () Bool)

(assert (=> b!767882 (= e!427600 e!427599)))

(declare-fun lt!341592 () (_ BitVec 64))

(assert (=> b!767882 (= lt!341592 (select (arr!20247 a!3186) j!159))))

(declare-fun lt!341594 () Unit!26420)

(assert (=> b!767882 (= lt!341594 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341592 j!159))))

(assert (=> b!767882 (arrayContainsKey!0 a!3186 lt!341592 #b00000000000000000000000000000000)))

(declare-fun lt!341593 () Unit!26420)

(assert (=> b!767882 (= lt!341593 lt!341594)))

(declare-fun res!519370 () Bool)

(assert (=> b!767882 (= res!519370 (= (seekEntryOrOpen!0 (select (arr!20247 a!3186) j!159) a!3186 mask!3328) (Found!7847 j!159)))))

(assert (=> b!767882 (=> (not res!519370) (not e!427599))))

(declare-fun b!767883 () Bool)

(declare-fun e!427598 () Bool)

(assert (=> b!767883 (= e!427598 e!427600)))

(declare-fun c!84648 () Bool)

(assert (=> b!767883 (= c!84648 (validKeyInArray!0 (select (arr!20247 a!3186) j!159)))))

(declare-fun b!767884 () Bool)

(assert (=> b!767884 (= e!427599 call!35081)))

(declare-fun bm!35078 () Bool)

(assert (=> bm!35078 (= call!35081 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101437 () Bool)

(declare-fun res!519371 () Bool)

(assert (=> d!101437 (=> res!519371 e!427598)))

(assert (=> d!101437 (= res!519371 (bvsge j!159 (size!20668 a!3186)))))

(assert (=> d!101437 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427598)))

(assert (= (and d!101437 (not res!519371)) b!767883))

(assert (= (and b!767883 c!84648) b!767882))

(assert (= (and b!767883 (not c!84648)) b!767881))

(assert (= (and b!767882 res!519370) b!767884))

(assert (= (or b!767884 b!767881) bm!35078))

(assert (=> b!767882 m!713169))

(declare-fun m!713555 () Bool)

(assert (=> b!767882 m!713555))

(declare-fun m!713557 () Bool)

(assert (=> b!767882 m!713557))

(assert (=> b!767882 m!713169))

(assert (=> b!767882 m!713183))

(assert (=> b!767883 m!713169))

(assert (=> b!767883 m!713169))

(assert (=> b!767883 m!713173))

(declare-fun m!713559 () Bool)

(assert (=> bm!35078 m!713559))

(assert (=> b!767394 d!101437))

(declare-fun d!101441 () Bool)

(assert (=> d!101441 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341602 () Unit!26420)

(declare-fun choose!38 (array!42288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26420)

(assert (=> d!101441 (= lt!341602 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101441 (validMask!0 mask!3328)))

(assert (=> d!101441 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341602)))

(declare-fun bs!21526 () Bool)

(assert (= bs!21526 d!101441))

(assert (=> bs!21526 m!713195))

(declare-fun m!713577 () Bool)

(assert (=> bs!21526 m!713577))

(assert (=> bs!21526 m!713215))

(assert (=> b!767394 d!101441))

(declare-fun b!767929 () Bool)

(declare-fun e!427631 () Bool)

(declare-fun call!35085 () Bool)

(assert (=> b!767929 (= e!427631 call!35085)))

(declare-fun b!767930 () Bool)

(declare-fun e!427632 () Bool)

(declare-fun e!427633 () Bool)

(assert (=> b!767930 (= e!427632 e!427633)))

(declare-fun res!519393 () Bool)

(assert (=> b!767930 (=> (not res!519393) (not e!427633))))

(declare-fun e!427634 () Bool)

(assert (=> b!767930 (= res!519393 (not e!427634))))

(declare-fun res!519392 () Bool)

(assert (=> b!767930 (=> (not res!519392) (not e!427634))))

(assert (=> b!767930 (= res!519392 (validKeyInArray!0 (select (arr!20247 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767931 () Bool)

(assert (=> b!767931 (= e!427633 e!427631)))

(declare-fun c!84661 () Bool)

(assert (=> b!767931 (= c!84661 (validKeyInArray!0 (select (arr!20247 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35082 () Bool)

(assert (=> bm!35082 (= call!35085 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84661 (Cons!14245 (select (arr!20247 a!3186) #b00000000000000000000000000000000) Nil!14246) Nil!14246)))))

(declare-fun b!767932 () Bool)

(assert (=> b!767932 (= e!427631 call!35085)))

(declare-fun b!767933 () Bool)

(declare-fun contains!4085 (List!14249 (_ BitVec 64)) Bool)

(assert (=> b!767933 (= e!427634 (contains!4085 Nil!14246 (select (arr!20247 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101449 () Bool)

(declare-fun res!519394 () Bool)

(assert (=> d!101449 (=> res!519394 e!427632)))

(assert (=> d!101449 (= res!519394 (bvsge #b00000000000000000000000000000000 (size!20668 a!3186)))))

(assert (=> d!101449 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14246) e!427632)))

(assert (= (and d!101449 (not res!519394)) b!767930))

(assert (= (and b!767930 res!519392) b!767933))

(assert (= (and b!767930 res!519393) b!767931))

(assert (= (and b!767931 c!84661) b!767932))

(assert (= (and b!767931 (not c!84661)) b!767929))

(assert (= (or b!767932 b!767929) bm!35082))

(assert (=> b!767930 m!713533))

(assert (=> b!767930 m!713533))

(assert (=> b!767930 m!713545))

(assert (=> b!767931 m!713533))

(assert (=> b!767931 m!713533))

(assert (=> b!767931 m!713545))

(assert (=> bm!35082 m!713533))

(declare-fun m!713597 () Bool)

(assert (=> bm!35082 m!713597))

(assert (=> b!767933 m!713533))

(assert (=> b!767933 m!713533))

(declare-fun m!713599 () Bool)

(assert (=> b!767933 m!713599))

(assert (=> b!767393 d!101449))

(declare-fun d!101459 () Bool)

(assert (=> d!101459 (= (validKeyInArray!0 (select (arr!20247 a!3186) j!159)) (and (not (= (select (arr!20247 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20247 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767404 d!101459))

(declare-fun b!767934 () Bool)

(declare-fun e!427637 () SeekEntryResult!7847)

(declare-fun lt!341610 () SeekEntryResult!7847)

(assert (=> b!767934 (= e!427637 (Found!7847 (index!33758 lt!341610)))))

(declare-fun e!427635 () SeekEntryResult!7847)

(declare-fun b!767935 () Bool)

(assert (=> b!767935 (= e!427635 (seekKeyOrZeroReturnVacant!0 (x!64673 lt!341610) (index!33758 lt!341610) (index!33758 lt!341610) k!2102 a!3186 mask!3328))))

(declare-fun d!101461 () Bool)

(declare-fun lt!341612 () SeekEntryResult!7847)

(assert (=> d!101461 (and (or (is-Undefined!7847 lt!341612) (not (is-Found!7847 lt!341612)) (and (bvsge (index!33757 lt!341612) #b00000000000000000000000000000000) (bvslt (index!33757 lt!341612) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341612) (is-Found!7847 lt!341612) (not (is-MissingZero!7847 lt!341612)) (and (bvsge (index!33756 lt!341612) #b00000000000000000000000000000000) (bvslt (index!33756 lt!341612) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341612) (is-Found!7847 lt!341612) (is-MissingZero!7847 lt!341612) (not (is-MissingVacant!7847 lt!341612)) (and (bvsge (index!33759 lt!341612) #b00000000000000000000000000000000) (bvslt (index!33759 lt!341612) (size!20668 a!3186)))) (or (is-Undefined!7847 lt!341612) (ite (is-Found!7847 lt!341612) (= (select (arr!20247 a!3186) (index!33757 lt!341612)) k!2102) (ite (is-MissingZero!7847 lt!341612) (= (select (arr!20247 a!3186) (index!33756 lt!341612)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7847 lt!341612) (= (select (arr!20247 a!3186) (index!33759 lt!341612)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427636 () SeekEntryResult!7847)

(assert (=> d!101461 (= lt!341612 e!427636)))

(declare-fun c!84663 () Bool)

(assert (=> d!101461 (= c!84663 (and (is-Intermediate!7847 lt!341610) (undefined!8659 lt!341610)))))

(assert (=> d!101461 (= lt!341610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101461 (validMask!0 mask!3328)))

(assert (=> d!101461 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341612)))

(declare-fun b!767936 () Bool)

(declare-fun c!84664 () Bool)

(declare-fun lt!341611 () (_ BitVec 64))

(assert (=> b!767936 (= c!84664 (= lt!341611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767936 (= e!427637 e!427635)))

(declare-fun b!767937 () Bool)

(assert (=> b!767937 (= e!427636 Undefined!7847)))

(declare-fun b!767938 () Bool)

(assert (=> b!767938 (= e!427636 e!427637)))

(assert (=> b!767938 (= lt!341611 (select (arr!20247 a!3186) (index!33758 lt!341610)))))

(declare-fun c!84662 () Bool)

(assert (=> b!767938 (= c!84662 (= lt!341611 k!2102))))

(declare-fun b!767939 () Bool)

(assert (=> b!767939 (= e!427635 (MissingZero!7847 (index!33758 lt!341610)))))

(assert (= (and d!101461 c!84663) b!767937))

(assert (= (and d!101461 (not c!84663)) b!767938))

(assert (= (and b!767938 c!84662) b!767934))

(assert (= (and b!767938 (not c!84662)) b!767936))

(assert (= (and b!767936 c!84664) b!767939))

(assert (= (and b!767936 (not c!84664)) b!767935))

(declare-fun m!713601 () Bool)

(assert (=> b!767935 m!713601))

(declare-fun m!713603 () Bool)

(assert (=> d!101461 m!713603))

(declare-fun m!713605 () Bool)

(assert (=> d!101461 m!713605))

(assert (=> d!101461 m!713215))

(declare-fun m!713607 () Bool)

(assert (=> d!101461 m!713607))

(assert (=> d!101461 m!713603))

(declare-fun m!713609 () Bool)

(assert (=> d!101461 m!713609))

(declare-fun m!713611 () Bool)

(assert (=> d!101461 m!713611))

(declare-fun m!713613 () Bool)

(assert (=> b!767938 m!713613))

(assert (=> b!767403 d!101461))

(declare-fun d!101463 () Bool)

(declare-fun res!519399 () Bool)

(declare-fun e!427642 () Bool)

(assert (=> d!101463 (=> res!519399 e!427642)))

(assert (=> d!101463 (= res!519399 (= (select (arr!20247 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101463 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!427642)))

(declare-fun b!767944 () Bool)

(declare-fun e!427643 () Bool)

(assert (=> b!767944 (= e!427642 e!427643)))

(declare-fun res!519400 () Bool)

(assert (=> b!767944 (=> (not res!519400) (not e!427643))))

(assert (=> b!767944 (= res!519400 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20668 a!3186)))))

(declare-fun b!767945 () Bool)

(assert (=> b!767945 (= e!427643 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101463 (not res!519399)) b!767944))

(assert (= (and b!767944 res!519400) b!767945))

(assert (=> d!101463 m!713533))

(declare-fun m!713615 () Bool)

(assert (=> b!767945 m!713615))

(assert (=> b!767407 d!101463))

(declare-fun b!767946 () Bool)

(declare-fun e!427648 () Bool)

(declare-fun lt!341614 () SeekEntryResult!7847)

(assert (=> b!767946 (= e!427648 (bvsge (x!64673 lt!341614) #b01111111111111111111111111111110))))

(declare-fun e!427645 () SeekEntryResult!7847)

(declare-fun b!767947 () Bool)

(assert (=> b!767947 (= e!427645 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767948 () Bool)

(assert (=> b!767948 (and (bvsge (index!33758 lt!341614) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341614) (size!20668 a!3186)))))

(declare-fun res!519402 () Bool)

(assert (=> b!767948 (= res!519402 (= (select (arr!20247 a!3186) (index!33758 lt!341614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427646 () Bool)

(assert (=> b!767948 (=> res!519402 e!427646)))

(declare-fun b!767949 () Bool)

(declare-fun e!427647 () Bool)

(assert (=> b!767949 (= e!427648 e!427647)))

(declare-fun res!519401 () Bool)

(assert (=> b!767949 (= res!519401 (and (is-Intermediate!7847 lt!341614) (not (undefined!8659 lt!341614)) (bvslt (x!64673 lt!341614) #b01111111111111111111111111111110) (bvsge (x!64673 lt!341614) #b00000000000000000000000000000000) (bvsge (x!64673 lt!341614) #b00000000000000000000000000000000)))))

(assert (=> b!767949 (=> (not res!519401) (not e!427647))))

(declare-fun d!101465 () Bool)

(assert (=> d!101465 e!427648))

(declare-fun c!84666 () Bool)

(assert (=> d!101465 (= c!84666 (and (is-Intermediate!7847 lt!341614) (undefined!8659 lt!341614)))))

(declare-fun e!427644 () SeekEntryResult!7847)

(assert (=> d!101465 (= lt!341614 e!427644)))

(declare-fun c!84667 () Bool)

(assert (=> d!101465 (= c!84667 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341613 () (_ BitVec 64))

(assert (=> d!101465 (= lt!341613 (select (arr!20247 a!3186) (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328)))))

(assert (=> d!101465 (validMask!0 mask!3328)))

(assert (=> d!101465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) (select (arr!20247 a!3186) j!159) a!3186 mask!3328) lt!341614)))

(declare-fun b!767950 () Bool)

(assert (=> b!767950 (and (bvsge (index!33758 lt!341614) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341614) (size!20668 a!3186)))))

(declare-fun res!519403 () Bool)

(assert (=> b!767950 (= res!519403 (= (select (arr!20247 a!3186) (index!33758 lt!341614)) (select (arr!20247 a!3186) j!159)))))

(assert (=> b!767950 (=> res!519403 e!427646)))

(assert (=> b!767950 (= e!427647 e!427646)))

(declare-fun b!767951 () Bool)

(assert (=> b!767951 (= e!427644 (Intermediate!7847 true (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767952 () Bool)

(assert (=> b!767952 (= e!427645 (Intermediate!7847 false (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767953 () Bool)

(assert (=> b!767953 (and (bvsge (index!33758 lt!341614) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341614) (size!20668 a!3186)))))

(assert (=> b!767953 (= e!427646 (= (select (arr!20247 a!3186) (index!33758 lt!341614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767954 () Bool)

(assert (=> b!767954 (= e!427644 e!427645)))

(declare-fun c!84665 () Bool)

(assert (=> b!767954 (= c!84665 (or (= lt!341613 (select (arr!20247 a!3186) j!159)) (= (bvadd lt!341613 lt!341613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101465 c!84667) b!767951))

(assert (= (and d!101465 (not c!84667)) b!767954))

(assert (= (and b!767954 c!84665) b!767952))

(assert (= (and b!767954 (not c!84665)) b!767947))

(assert (= (and d!101465 c!84666) b!767946))

(assert (= (and d!101465 (not c!84666)) b!767949))

(assert (= (and b!767949 res!519401) b!767950))

(assert (= (and b!767950 (not res!519403)) b!767948))

(assert (= (and b!767948 (not res!519402)) b!767953))

(declare-fun m!713617 () Bool)

(assert (=> b!767950 m!713617))

(assert (=> b!767948 m!713617))

(assert (=> d!101465 m!713191))

(declare-fun m!713619 () Bool)

(assert (=> d!101465 m!713619))

(assert (=> d!101465 m!713215))

(assert (=> b!767953 m!713617))

(assert (=> b!767947 m!713191))

(declare-fun m!713621 () Bool)

(assert (=> b!767947 m!713621))

(assert (=> b!767947 m!713621))

(assert (=> b!767947 m!713169))

(declare-fun m!713623 () Bool)

(assert (=> b!767947 m!713623))

(assert (=> b!767395 d!101465))

(declare-fun d!101467 () Bool)

(declare-fun lt!341616 () (_ BitVec 32))

(declare-fun lt!341615 () (_ BitVec 32))

(assert (=> d!101467 (= lt!341616 (bvmul (bvxor lt!341615 (bvlshr lt!341615 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101467 (= lt!341615 ((_ extract 31 0) (bvand (bvxor (select (arr!20247 a!3186) j!159) (bvlshr (select (arr!20247 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101467 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519308 (let ((h!15341 ((_ extract 31 0) (bvand (bvxor (select (arr!20247 a!3186) j!159) (bvlshr (select (arr!20247 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64678 (bvmul (bvxor h!15341 (bvlshr h!15341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64678 (bvlshr x!64678 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519308 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519308 #b00000000000000000000000000000000))))))

(assert (=> d!101467 (= (toIndex!0 (select (arr!20247 a!3186) j!159) mask!3328) (bvand (bvxor lt!341616 (bvlshr lt!341616 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767395 d!101467))

(declare-fun b!767955 () Bool)

(declare-fun e!427653 () Bool)

(declare-fun lt!341618 () SeekEntryResult!7847)

(assert (=> b!767955 (= e!427653 (bvsge (x!64673 lt!341618) #b01111111111111111111111111111110))))

(declare-fun b!767956 () Bool)

(declare-fun e!427650 () SeekEntryResult!7847)

(assert (=> b!767956 (= e!427650 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20247 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767957 () Bool)

(assert (=> b!767957 (and (bvsge (index!33758 lt!341618) #b00000000000000000000000000000000) (bvslt (index!33758 lt!341618) (size!20668 a!3186)))))

(declare-fun res!519405 () Bool)

(assert (=> b!767957 (= res!519405 (= (select (arr!20247 a!3186) (index!33758 lt!341618)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427651 () Bool)

(assert (=> b!767957 (=> res!519405 e!427651)))

(declare-fun b!767958 () Bool)

(declare-fun e!427652 () Bool)

(assert (=> b!767958 (= e!427653 e!427652)))

(declare-fun res!519404 () Bool)

(assert (=> b!767958 (= res!519404 (and (is-Intermediate!7847 lt!341618) (not (undefined!8659 lt!341618)) (bvslt (x!64673 lt!341618) #b01111111111111111111111111111110) (bvsge (x!64673 lt!341618) #b00000000000000000000000000000000) (bvsge (x!64673 lt!341618) x!1131)))))

(assert (=> b!767958 (=> (not res!519404) (not e!427652))))

(declare-fun d!101471 () Bool)

(assert (=> d!101471 e!427653))

(declare-fun c!84669 () Bool)

(assert (=> d!101471 (= c!84669 (and (is-Intermediate!7847 lt!341618) (undefined!8659 lt!341618)))))

(declare-fun e!427649 () SeekEntryResult!7847)

(assert (=> d!101471 (= lt!341618 e!427649)))

(declare-fun c!84670 () Bool)

(assert (=> d!101471 (= c!84670 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341617 () (_ BitVec 64))

(assert (=> d!101471 (= lt!341617 (select (arr!20247 a!3186) index!1321))))

(assert (=> d!101471 (validMask!0 mask!3328)))

