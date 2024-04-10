; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126270 () Bool)

(assert start!126270)

(declare-fun b!1480364 () Bool)

(declare-fun res!1006178 () Bool)

(declare-fun e!830308 () Bool)

(assert (=> b!1480364 (=> (not res!1006178) (not e!830308))))

(declare-fun e!830307 () Bool)

(assert (=> b!1480364 (= res!1006178 e!830307)))

(declare-fun c!136614 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480364 (= c!136614 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480365 () Bool)

(declare-fun e!830303 () Bool)

(declare-fun e!830306 () Bool)

(assert (=> b!1480365 (= e!830303 e!830306)))

(declare-fun res!1006183 () Bool)

(assert (=> b!1480365 (=> (not res!1006183) (not e!830306))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99376 0))(
  ( (array!99377 (arr!47967 (Array (_ BitVec 32) (_ BitVec 64))) (size!48517 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99376)

(assert (=> b!1480365 (= res!1006183 (= (select (store (arr!47967 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646388 () array!99376)

(assert (=> b!1480365 (= lt!646388 (array!99377 (store (arr!47967 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48517 a!2862)))))

(declare-fun res!1006186 () Bool)

(assert (=> start!126270 (=> (not res!1006186) (not e!830303))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126270 (= res!1006186 (validMask!0 mask!2687))))

(assert (=> start!126270 e!830303))

(assert (=> start!126270 true))

(declare-fun array_inv!36995 (array!99376) Bool)

(assert (=> start!126270 (array_inv!36995 a!2862)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646389 () (_ BitVec 64))

(declare-fun b!1480366 () Bool)

(declare-datatypes ((SeekEntryResult!12207 0))(
  ( (MissingZero!12207 (index!51220 (_ BitVec 32))) (Found!12207 (index!51221 (_ BitVec 32))) (Intermediate!12207 (undefined!13019 Bool) (index!51222 (_ BitVec 32)) (x!132798 (_ BitVec 32))) (Undefined!12207) (MissingVacant!12207 (index!51223 (_ BitVec 32))) )
))
(declare-fun lt!646387 () SeekEntryResult!12207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12207)

(assert (=> b!1480366 (= e!830307 (= lt!646387 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646389 lt!646388 mask!2687)))))

(declare-fun b!1480367 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!830304 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1480367 (= e!830304 (or (= (select (arr!47967 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47967 a!2862) intermediateBeforeIndex!19) (select (arr!47967 a!2862) j!93))))))

(declare-fun b!1480368 () Bool)

(declare-fun res!1006180 () Bool)

(assert (=> b!1480368 (=> (not res!1006180) (not e!830303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480368 (= res!1006180 (validKeyInArray!0 (select (arr!47967 a!2862) j!93)))))

(declare-fun b!1480369 () Bool)

(declare-fun res!1006179 () Bool)

(assert (=> b!1480369 (=> (not res!1006179) (not e!830303))))

(assert (=> b!1480369 (= res!1006179 (validKeyInArray!0 (select (arr!47967 a!2862) i!1006)))))

(declare-fun b!1480370 () Bool)

(declare-fun res!1006177 () Bool)

(assert (=> b!1480370 (=> (not res!1006177) (not e!830303))))

(declare-datatypes ((List!34468 0))(
  ( (Nil!34465) (Cons!34464 (h!35832 (_ BitVec 64)) (t!49162 List!34468)) )
))
(declare-fun arrayNoDuplicates!0 (array!99376 (_ BitVec 32) List!34468) Bool)

(assert (=> b!1480370 (= res!1006177 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34465))))

(declare-fun b!1480371 () Bool)

(assert (=> b!1480371 (= e!830308 (not (or (and (= (select (arr!47967 a!2862) index!646) (select (store (arr!47967 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47967 a!2862) index!646) (select (arr!47967 a!2862) j!93))) (= (select (arr!47967 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(assert (=> b!1480371 e!830304))

(declare-fun res!1006188 () Bool)

(assert (=> b!1480371 (=> (not res!1006188) (not e!830304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99376 (_ BitVec 32)) Bool)

(assert (=> b!1480371 (= res!1006188 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49754 0))(
  ( (Unit!49755) )
))
(declare-fun lt!646386 () Unit!49754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49754)

(assert (=> b!1480371 (= lt!646386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480372 () Bool)

(declare-fun e!830305 () Bool)

(assert (=> b!1480372 (= e!830306 e!830305)))

(declare-fun res!1006176 () Bool)

(assert (=> b!1480372 (=> (not res!1006176) (not e!830305))))

(declare-fun lt!646385 () SeekEntryResult!12207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480372 (= res!1006176 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646385))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480372 (= lt!646385 (Intermediate!12207 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480373 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12207)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12207)

(assert (=> b!1480373 (= e!830307 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646389 lt!646388 mask!2687) (seekEntryOrOpen!0 lt!646389 lt!646388 mask!2687)))))

(declare-fun b!1480374 () Bool)

(declare-fun res!1006185 () Bool)

(assert (=> b!1480374 (=> (not res!1006185) (not e!830305))))

(assert (=> b!1480374 (= res!1006185 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646385))))

(declare-fun b!1480375 () Bool)

(declare-fun res!1006182 () Bool)

(assert (=> b!1480375 (=> (not res!1006182) (not e!830303))))

(assert (=> b!1480375 (= res!1006182 (and (= (size!48517 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48517 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48517 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480376 () Bool)

(declare-fun res!1006189 () Bool)

(assert (=> b!1480376 (=> (not res!1006189) (not e!830303))))

(assert (=> b!1480376 (= res!1006189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480377 () Bool)

(declare-fun res!1006175 () Bool)

(assert (=> b!1480377 (=> (not res!1006175) (not e!830303))))

(assert (=> b!1480377 (= res!1006175 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48517 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48517 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48517 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480378 () Bool)

(declare-fun res!1006187 () Bool)

(assert (=> b!1480378 (=> (not res!1006187) (not e!830308))))

(assert (=> b!1480378 (= res!1006187 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480379 () Bool)

(declare-fun res!1006184 () Bool)

(assert (=> b!1480379 (=> (not res!1006184) (not e!830304))))

(assert (=> b!1480379 (= res!1006184 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) j!93) a!2862 mask!2687) (Found!12207 j!93)))))

(declare-fun b!1480380 () Bool)

(assert (=> b!1480380 (= e!830305 e!830308)))

(declare-fun res!1006181 () Bool)

(assert (=> b!1480380 (=> (not res!1006181) (not e!830308))))

(assert (=> b!1480380 (= res!1006181 (= lt!646387 (Intermediate!12207 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480380 (= lt!646387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646389 mask!2687) lt!646389 lt!646388 mask!2687))))

(assert (=> b!1480380 (= lt!646389 (select (store (arr!47967 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126270 res!1006186) b!1480375))

(assert (= (and b!1480375 res!1006182) b!1480369))

(assert (= (and b!1480369 res!1006179) b!1480368))

(assert (= (and b!1480368 res!1006180) b!1480376))

(assert (= (and b!1480376 res!1006189) b!1480370))

(assert (= (and b!1480370 res!1006177) b!1480377))

(assert (= (and b!1480377 res!1006175) b!1480365))

(assert (= (and b!1480365 res!1006183) b!1480372))

(assert (= (and b!1480372 res!1006176) b!1480374))

(assert (= (and b!1480374 res!1006185) b!1480380))

(assert (= (and b!1480380 res!1006181) b!1480364))

(assert (= (and b!1480364 c!136614) b!1480366))

(assert (= (and b!1480364 (not c!136614)) b!1480373))

(assert (= (and b!1480364 res!1006178) b!1480378))

(assert (= (and b!1480378 res!1006187) b!1480371))

(assert (= (and b!1480371 res!1006188) b!1480379))

(assert (= (and b!1480379 res!1006184) b!1480367))

(declare-fun m!1366179 () Bool)

(assert (=> b!1480372 m!1366179))

(assert (=> b!1480372 m!1366179))

(declare-fun m!1366181 () Bool)

(assert (=> b!1480372 m!1366181))

(assert (=> b!1480372 m!1366181))

(assert (=> b!1480372 m!1366179))

(declare-fun m!1366183 () Bool)

(assert (=> b!1480372 m!1366183))

(declare-fun m!1366185 () Bool)

(assert (=> b!1480370 m!1366185))

(declare-fun m!1366187 () Bool)

(assert (=> b!1480365 m!1366187))

(declare-fun m!1366189 () Bool)

(assert (=> b!1480365 m!1366189))

(assert (=> b!1480374 m!1366179))

(assert (=> b!1480374 m!1366179))

(declare-fun m!1366191 () Bool)

(assert (=> b!1480374 m!1366191))

(declare-fun m!1366193 () Bool)

(assert (=> start!126270 m!1366193))

(declare-fun m!1366195 () Bool)

(assert (=> start!126270 m!1366195))

(declare-fun m!1366197 () Bool)

(assert (=> b!1480367 m!1366197))

(assert (=> b!1480367 m!1366179))

(assert (=> b!1480368 m!1366179))

(assert (=> b!1480368 m!1366179))

(declare-fun m!1366199 () Bool)

(assert (=> b!1480368 m!1366199))

(declare-fun m!1366201 () Bool)

(assert (=> b!1480369 m!1366201))

(assert (=> b!1480369 m!1366201))

(declare-fun m!1366203 () Bool)

(assert (=> b!1480369 m!1366203))

(declare-fun m!1366205 () Bool)

(assert (=> b!1480371 m!1366205))

(assert (=> b!1480371 m!1366187))

(declare-fun m!1366207 () Bool)

(assert (=> b!1480371 m!1366207))

(declare-fun m!1366209 () Bool)

(assert (=> b!1480371 m!1366209))

(declare-fun m!1366211 () Bool)

(assert (=> b!1480371 m!1366211))

(assert (=> b!1480371 m!1366179))

(declare-fun m!1366213 () Bool)

(assert (=> b!1480380 m!1366213))

(assert (=> b!1480380 m!1366213))

(declare-fun m!1366215 () Bool)

(assert (=> b!1480380 m!1366215))

(assert (=> b!1480380 m!1366187))

(declare-fun m!1366217 () Bool)

(assert (=> b!1480380 m!1366217))

(declare-fun m!1366219 () Bool)

(assert (=> b!1480376 m!1366219))

(assert (=> b!1480379 m!1366179))

(assert (=> b!1480379 m!1366179))

(declare-fun m!1366221 () Bool)

(assert (=> b!1480379 m!1366221))

(declare-fun m!1366223 () Bool)

(assert (=> b!1480366 m!1366223))

(declare-fun m!1366225 () Bool)

(assert (=> b!1480373 m!1366225))

(declare-fun m!1366227 () Bool)

(assert (=> b!1480373 m!1366227))

(check-sat (not b!1480380) (not b!1480373) (not b!1480372) (not start!126270) (not b!1480371) (not b!1480376) (not b!1480370) (not b!1480366) (not b!1480374) (not b!1480368) (not b!1480369) (not b!1480379))
(check-sat)
(get-model)

(declare-fun d!156041 () Bool)

(assert (=> d!156041 (= (validKeyInArray!0 (select (arr!47967 a!2862) i!1006)) (and (not (= (select (arr!47967 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47967 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480369 d!156041))

(declare-fun b!1480450 () Bool)

(declare-fun lt!646409 () SeekEntryResult!12207)

(assert (=> b!1480450 (and (bvsge (index!51222 lt!646409) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646409) (size!48517 lt!646388)))))

(declare-fun res!1006241 () Bool)

(assert (=> b!1480450 (= res!1006241 (= (select (arr!47967 lt!646388) (index!51222 lt!646409)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830341 () Bool)

(assert (=> b!1480450 (=> res!1006241 e!830341)))

(declare-fun b!1480451 () Bool)

(assert (=> b!1480451 (and (bvsge (index!51222 lt!646409) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646409) (size!48517 lt!646388)))))

(declare-fun res!1006242 () Bool)

(assert (=> b!1480451 (= res!1006242 (= (select (arr!47967 lt!646388) (index!51222 lt!646409)) lt!646389))))

(assert (=> b!1480451 (=> res!1006242 e!830341)))

(declare-fun e!830343 () Bool)

(assert (=> b!1480451 (= e!830343 e!830341)))

(declare-fun d!156043 () Bool)

(declare-fun e!830344 () Bool)

(assert (=> d!156043 e!830344))

(declare-fun c!136625 () Bool)

(get-info :version)

(assert (=> d!156043 (= c!136625 (and ((_ is Intermediate!12207) lt!646409) (undefined!13019 lt!646409)))))

(declare-fun e!830342 () SeekEntryResult!12207)

(assert (=> d!156043 (= lt!646409 e!830342)))

(declare-fun c!136626 () Bool)

(assert (=> d!156043 (= c!136626 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646410 () (_ BitVec 64))

(assert (=> d!156043 (= lt!646410 (select (arr!47967 lt!646388) (toIndex!0 lt!646389 mask!2687)))))

(assert (=> d!156043 (validMask!0 mask!2687)))

(assert (=> d!156043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646389 mask!2687) lt!646389 lt!646388 mask!2687) lt!646409)))

(declare-fun b!1480452 () Bool)

(declare-fun e!830345 () SeekEntryResult!12207)

(assert (=> b!1480452 (= e!830345 (Intermediate!12207 false (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480453 () Bool)

(assert (=> b!1480453 (= e!830342 e!830345)))

(declare-fun c!136624 () Bool)

(assert (=> b!1480453 (= c!136624 (or (= lt!646410 lt!646389) (= (bvadd lt!646410 lt!646410) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480454 () Bool)

(assert (=> b!1480454 (= e!830344 (bvsge (x!132798 lt!646409) #b01111111111111111111111111111110))))

(declare-fun b!1480455 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480455 (= e!830345 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480456 () Bool)

(assert (=> b!1480456 (and (bvsge (index!51222 lt!646409) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646409) (size!48517 lt!646388)))))

(assert (=> b!1480456 (= e!830341 (= (select (arr!47967 lt!646388) (index!51222 lt!646409)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480457 () Bool)

(assert (=> b!1480457 (= e!830344 e!830343)))

(declare-fun res!1006243 () Bool)

(assert (=> b!1480457 (= res!1006243 (and ((_ is Intermediate!12207) lt!646409) (not (undefined!13019 lt!646409)) (bvslt (x!132798 lt!646409) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646409) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646409) #b00000000000000000000000000000000)))))

(assert (=> b!1480457 (=> (not res!1006243) (not e!830343))))

(declare-fun b!1480458 () Bool)

(assert (=> b!1480458 (= e!830342 (Intermediate!12207 true (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156043 c!136626) b!1480458))

(assert (= (and d!156043 (not c!136626)) b!1480453))

(assert (= (and b!1480453 c!136624) b!1480452))

(assert (= (and b!1480453 (not c!136624)) b!1480455))

(assert (= (and d!156043 c!136625) b!1480454))

(assert (= (and d!156043 (not c!136625)) b!1480457))

(assert (= (and b!1480457 res!1006243) b!1480451))

(assert (= (and b!1480451 (not res!1006242)) b!1480450))

(assert (= (and b!1480450 (not res!1006241)) b!1480456))

(assert (=> d!156043 m!1366213))

(declare-fun m!1366279 () Bool)

(assert (=> d!156043 m!1366279))

(assert (=> d!156043 m!1366193))

(declare-fun m!1366281 () Bool)

(assert (=> b!1480451 m!1366281))

(assert (=> b!1480455 m!1366213))

(declare-fun m!1366283 () Bool)

(assert (=> b!1480455 m!1366283))

(assert (=> b!1480455 m!1366283))

(declare-fun m!1366285 () Bool)

(assert (=> b!1480455 m!1366285))

(assert (=> b!1480450 m!1366281))

(assert (=> b!1480456 m!1366281))

(assert (=> b!1480380 d!156043))

(declare-fun d!156045 () Bool)

(declare-fun lt!646416 () (_ BitVec 32))

(declare-fun lt!646415 () (_ BitVec 32))

(assert (=> d!156045 (= lt!646416 (bvmul (bvxor lt!646415 (bvlshr lt!646415 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156045 (= lt!646415 ((_ extract 31 0) (bvand (bvxor lt!646389 (bvlshr lt!646389 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156045 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006244 (let ((h!35834 ((_ extract 31 0) (bvand (bvxor lt!646389 (bvlshr lt!646389 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132801 (bvmul (bvxor h!35834 (bvlshr h!35834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132801 (bvlshr x!132801 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006244 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006244 #b00000000000000000000000000000000))))))

(assert (=> d!156045 (= (toIndex!0 lt!646389 mask!2687) (bvand (bvxor lt!646416 (bvlshr lt!646416 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480380 d!156045))

(declare-fun d!156047 () Bool)

(declare-fun lt!646425 () SeekEntryResult!12207)

(assert (=> d!156047 (and (or ((_ is Undefined!12207) lt!646425) (not ((_ is Found!12207) lt!646425)) (and (bvsge (index!51221 lt!646425) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646425) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646425) ((_ is Found!12207) lt!646425) (not ((_ is MissingZero!12207) lt!646425)) (and (bvsge (index!51220 lt!646425) #b00000000000000000000000000000000) (bvslt (index!51220 lt!646425) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646425) ((_ is Found!12207) lt!646425) ((_ is MissingZero!12207) lt!646425) (not ((_ is MissingVacant!12207) lt!646425)) (and (bvsge (index!51223 lt!646425) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646425) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646425) (ite ((_ is Found!12207) lt!646425) (= (select (arr!47967 a!2862) (index!51221 lt!646425)) (select (arr!47967 a!2862) j!93)) (ite ((_ is MissingZero!12207) lt!646425) (= (select (arr!47967 a!2862) (index!51220 lt!646425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12207) lt!646425) (= (select (arr!47967 a!2862) (index!51223 lt!646425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830354 () SeekEntryResult!12207)

(assert (=> d!156047 (= lt!646425 e!830354)))

(declare-fun c!136633 () Bool)

(declare-fun lt!646424 () SeekEntryResult!12207)

(assert (=> d!156047 (= c!136633 (and ((_ is Intermediate!12207) lt!646424) (undefined!13019 lt!646424)))))

(assert (=> d!156047 (= lt!646424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156047 (validMask!0 mask!2687)))

(assert (=> d!156047 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646425)))

(declare-fun b!1480471 () Bool)

(assert (=> b!1480471 (= e!830354 Undefined!12207)))

(declare-fun b!1480472 () Bool)

(declare-fun c!136634 () Bool)

(declare-fun lt!646423 () (_ BitVec 64))

(assert (=> b!1480472 (= c!136634 (= lt!646423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830352 () SeekEntryResult!12207)

(declare-fun e!830353 () SeekEntryResult!12207)

(assert (=> b!1480472 (= e!830352 e!830353)))

(declare-fun b!1480473 () Bool)

(assert (=> b!1480473 (= e!830354 e!830352)))

(assert (=> b!1480473 (= lt!646423 (select (arr!47967 a!2862) (index!51222 lt!646424)))))

(declare-fun c!136635 () Bool)

(assert (=> b!1480473 (= c!136635 (= lt!646423 (select (arr!47967 a!2862) j!93)))))

(declare-fun b!1480474 () Bool)

(assert (=> b!1480474 (= e!830353 (seekKeyOrZeroReturnVacant!0 (x!132798 lt!646424) (index!51222 lt!646424) (index!51222 lt!646424) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480475 () Bool)

(assert (=> b!1480475 (= e!830352 (Found!12207 (index!51222 lt!646424)))))

(declare-fun b!1480476 () Bool)

(assert (=> b!1480476 (= e!830353 (MissingZero!12207 (index!51222 lt!646424)))))

(assert (= (and d!156047 c!136633) b!1480471))

(assert (= (and d!156047 (not c!136633)) b!1480473))

(assert (= (and b!1480473 c!136635) b!1480475))

(assert (= (and b!1480473 (not c!136635)) b!1480472))

(assert (= (and b!1480472 c!136634) b!1480476))

(assert (= (and b!1480472 (not c!136634)) b!1480474))

(assert (=> d!156047 m!1366181))

(assert (=> d!156047 m!1366179))

(assert (=> d!156047 m!1366183))

(assert (=> d!156047 m!1366179))

(assert (=> d!156047 m!1366181))

(declare-fun m!1366287 () Bool)

(assert (=> d!156047 m!1366287))

(assert (=> d!156047 m!1366193))

(declare-fun m!1366289 () Bool)

(assert (=> d!156047 m!1366289))

(declare-fun m!1366291 () Bool)

(assert (=> d!156047 m!1366291))

(declare-fun m!1366293 () Bool)

(assert (=> b!1480473 m!1366293))

(assert (=> b!1480474 m!1366179))

(declare-fun m!1366295 () Bool)

(assert (=> b!1480474 m!1366295))

(assert (=> b!1480379 d!156047))

(declare-fun d!156049 () Bool)

(assert (=> d!156049 (= (validKeyInArray!0 (select (arr!47967 a!2862) j!93)) (and (not (= (select (arr!47967 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47967 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480368 d!156049))

(declare-fun b!1480477 () Bool)

(declare-fun lt!646426 () SeekEntryResult!12207)

(assert (=> b!1480477 (and (bvsge (index!51222 lt!646426) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646426) (size!48517 a!2862)))))

(declare-fun res!1006245 () Bool)

(assert (=> b!1480477 (= res!1006245 (= (select (arr!47967 a!2862) (index!51222 lt!646426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830355 () Bool)

(assert (=> b!1480477 (=> res!1006245 e!830355)))

(declare-fun b!1480478 () Bool)

(assert (=> b!1480478 (and (bvsge (index!51222 lt!646426) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646426) (size!48517 a!2862)))))

(declare-fun res!1006246 () Bool)

(assert (=> b!1480478 (= res!1006246 (= (select (arr!47967 a!2862) (index!51222 lt!646426)) (select (arr!47967 a!2862) j!93)))))

(assert (=> b!1480478 (=> res!1006246 e!830355)))

(declare-fun e!830357 () Bool)

(assert (=> b!1480478 (= e!830357 e!830355)))

(declare-fun d!156051 () Bool)

(declare-fun e!830358 () Bool)

(assert (=> d!156051 e!830358))

(declare-fun c!136637 () Bool)

(assert (=> d!156051 (= c!136637 (and ((_ is Intermediate!12207) lt!646426) (undefined!13019 lt!646426)))))

(declare-fun e!830356 () SeekEntryResult!12207)

(assert (=> d!156051 (= lt!646426 e!830356)))

(declare-fun c!136638 () Bool)

(assert (=> d!156051 (= c!136638 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646427 () (_ BitVec 64))

(assert (=> d!156051 (= lt!646427 (select (arr!47967 a!2862) (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687)))))

(assert (=> d!156051 (validMask!0 mask!2687)))

(assert (=> d!156051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646426)))

(declare-fun e!830359 () SeekEntryResult!12207)

(declare-fun b!1480479 () Bool)

(assert (=> b!1480479 (= e!830359 (Intermediate!12207 false (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480480 () Bool)

(assert (=> b!1480480 (= e!830356 e!830359)))

(declare-fun c!136636 () Bool)

(assert (=> b!1480480 (= c!136636 (or (= lt!646427 (select (arr!47967 a!2862) j!93)) (= (bvadd lt!646427 lt!646427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480481 () Bool)

(assert (=> b!1480481 (= e!830358 (bvsge (x!132798 lt!646426) #b01111111111111111111111111111110))))

(declare-fun b!1480482 () Bool)

(assert (=> b!1480482 (= e!830359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480483 () Bool)

(assert (=> b!1480483 (and (bvsge (index!51222 lt!646426) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646426) (size!48517 a!2862)))))

(assert (=> b!1480483 (= e!830355 (= (select (arr!47967 a!2862) (index!51222 lt!646426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480484 () Bool)

(assert (=> b!1480484 (= e!830358 e!830357)))

(declare-fun res!1006247 () Bool)

(assert (=> b!1480484 (= res!1006247 (and ((_ is Intermediate!12207) lt!646426) (not (undefined!13019 lt!646426)) (bvslt (x!132798 lt!646426) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646426) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646426) #b00000000000000000000000000000000)))))

(assert (=> b!1480484 (=> (not res!1006247) (not e!830357))))

(declare-fun b!1480485 () Bool)

(assert (=> b!1480485 (= e!830356 (Intermediate!12207 true (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156051 c!136638) b!1480485))

(assert (= (and d!156051 (not c!136638)) b!1480480))

(assert (= (and b!1480480 c!136636) b!1480479))

(assert (= (and b!1480480 (not c!136636)) b!1480482))

(assert (= (and d!156051 c!136637) b!1480481))

(assert (= (and d!156051 (not c!136637)) b!1480484))

(assert (= (and b!1480484 res!1006247) b!1480478))

(assert (= (and b!1480478 (not res!1006246)) b!1480477))

(assert (= (and b!1480477 (not res!1006245)) b!1480483))

(assert (=> d!156051 m!1366181))

(declare-fun m!1366297 () Bool)

(assert (=> d!156051 m!1366297))

(assert (=> d!156051 m!1366193))

(declare-fun m!1366299 () Bool)

(assert (=> b!1480478 m!1366299))

(assert (=> b!1480482 m!1366181))

(declare-fun m!1366301 () Bool)

(assert (=> b!1480482 m!1366301))

(assert (=> b!1480482 m!1366301))

(assert (=> b!1480482 m!1366179))

(declare-fun m!1366303 () Bool)

(assert (=> b!1480482 m!1366303))

(assert (=> b!1480477 m!1366299))

(assert (=> b!1480483 m!1366299))

(assert (=> b!1480372 d!156051))

(declare-fun d!156053 () Bool)

(declare-fun lt!646429 () (_ BitVec 32))

(declare-fun lt!646428 () (_ BitVec 32))

(assert (=> d!156053 (= lt!646429 (bvmul (bvxor lt!646428 (bvlshr lt!646428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156053 (= lt!646428 ((_ extract 31 0) (bvand (bvxor (select (arr!47967 a!2862) j!93) (bvlshr (select (arr!47967 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156053 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006244 (let ((h!35834 ((_ extract 31 0) (bvand (bvxor (select (arr!47967 a!2862) j!93) (bvlshr (select (arr!47967 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132801 (bvmul (bvxor h!35834 (bvlshr h!35834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132801 (bvlshr x!132801 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006244 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006244 #b00000000000000000000000000000000))))))

(assert (=> d!156053 (= (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) (bvand (bvxor lt!646429 (bvlshr lt!646429 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480372 d!156053))

(declare-fun call!67825 () Bool)

(declare-fun bm!67822 () Bool)

(assert (=> bm!67822 (= call!67825 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480494 () Bool)

(declare-fun e!830367 () Bool)

(assert (=> b!1480494 (= e!830367 call!67825)))

(declare-fun b!1480495 () Bool)

(declare-fun e!830368 () Bool)

(assert (=> b!1480495 (= e!830368 call!67825)))

(declare-fun b!1480496 () Bool)

(assert (=> b!1480496 (= e!830368 e!830367)))

(declare-fun lt!646438 () (_ BitVec 64))

(assert (=> b!1480496 (= lt!646438 (select (arr!47967 a!2862) j!93))))

(declare-fun lt!646436 () Unit!49754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99376 (_ BitVec 64) (_ BitVec 32)) Unit!49754)

(assert (=> b!1480496 (= lt!646436 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646438 j!93))))

(declare-fun arrayContainsKey!0 (array!99376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1480496 (arrayContainsKey!0 a!2862 lt!646438 #b00000000000000000000000000000000)))

(declare-fun lt!646437 () Unit!49754)

(assert (=> b!1480496 (= lt!646437 lt!646436)))

(declare-fun res!1006252 () Bool)

(assert (=> b!1480496 (= res!1006252 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) j!93) a!2862 mask!2687) (Found!12207 j!93)))))

(assert (=> b!1480496 (=> (not res!1006252) (not e!830367))))

(declare-fun b!1480497 () Bool)

(declare-fun e!830366 () Bool)

(assert (=> b!1480497 (= e!830366 e!830368)))

(declare-fun c!136641 () Bool)

(assert (=> b!1480497 (= c!136641 (validKeyInArray!0 (select (arr!47967 a!2862) j!93)))))

(declare-fun d!156055 () Bool)

(declare-fun res!1006253 () Bool)

(assert (=> d!156055 (=> res!1006253 e!830366)))

(assert (=> d!156055 (= res!1006253 (bvsge j!93 (size!48517 a!2862)))))

(assert (=> d!156055 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!830366)))

(assert (= (and d!156055 (not res!1006253)) b!1480497))

(assert (= (and b!1480497 c!136641) b!1480496))

(assert (= (and b!1480497 (not c!136641)) b!1480495))

(assert (= (and b!1480496 res!1006252) b!1480494))

(assert (= (or b!1480494 b!1480495) bm!67822))

(declare-fun m!1366305 () Bool)

(assert (=> bm!67822 m!1366305))

(assert (=> b!1480496 m!1366179))

(declare-fun m!1366307 () Bool)

(assert (=> b!1480496 m!1366307))

(declare-fun m!1366309 () Bool)

(assert (=> b!1480496 m!1366309))

(assert (=> b!1480496 m!1366179))

(assert (=> b!1480496 m!1366221))

(assert (=> b!1480497 m!1366179))

(assert (=> b!1480497 m!1366179))

(assert (=> b!1480497 m!1366199))

(assert (=> b!1480371 d!156055))

(declare-fun d!156057 () Bool)

(assert (=> d!156057 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646441 () Unit!49754)

(declare-fun choose!38 (array!99376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49754)

(assert (=> d!156057 (= lt!646441 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156057 (validMask!0 mask!2687)))

(assert (=> d!156057 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!646441)))

(declare-fun bs!42659 () Bool)

(assert (= bs!42659 d!156057))

(assert (=> bs!42659 m!1366211))

(declare-fun m!1366311 () Bool)

(assert (=> bs!42659 m!1366311))

(assert (=> bs!42659 m!1366193))

(assert (=> b!1480371 d!156057))

(declare-fun b!1480508 () Bool)

(declare-fun e!830380 () Bool)

(declare-fun e!830379 () Bool)

(assert (=> b!1480508 (= e!830380 e!830379)))

(declare-fun c!136644 () Bool)

(assert (=> b!1480508 (= c!136644 (validKeyInArray!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480509 () Bool)

(declare-fun e!830378 () Bool)

(assert (=> b!1480509 (= e!830378 e!830380)))

(declare-fun res!1006260 () Bool)

(assert (=> b!1480509 (=> (not res!1006260) (not e!830380))))

(declare-fun e!830377 () Bool)

(assert (=> b!1480509 (= res!1006260 (not e!830377))))

(declare-fun res!1006261 () Bool)

(assert (=> b!1480509 (=> (not res!1006261) (not e!830377))))

(assert (=> b!1480509 (= res!1006261 (validKeyInArray!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480510 () Bool)

(declare-fun contains!9910 (List!34468 (_ BitVec 64)) Bool)

(assert (=> b!1480510 (= e!830377 (contains!9910 Nil!34465 (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480511 () Bool)

(declare-fun call!67828 () Bool)

(assert (=> b!1480511 (= e!830379 call!67828)))

(declare-fun d!156063 () Bool)

(declare-fun res!1006262 () Bool)

(assert (=> d!156063 (=> res!1006262 e!830378)))

(assert (=> d!156063 (= res!1006262 (bvsge #b00000000000000000000000000000000 (size!48517 a!2862)))))

(assert (=> d!156063 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34465) e!830378)))

(declare-fun b!1480512 () Bool)

(assert (=> b!1480512 (= e!830379 call!67828)))

(declare-fun bm!67825 () Bool)

(assert (=> bm!67825 (= call!67828 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136644 (Cons!34464 (select (arr!47967 a!2862) #b00000000000000000000000000000000) Nil!34465) Nil!34465)))))

(assert (= (and d!156063 (not res!1006262)) b!1480509))

(assert (= (and b!1480509 res!1006261) b!1480510))

(assert (= (and b!1480509 res!1006260) b!1480508))

(assert (= (and b!1480508 c!136644) b!1480511))

(assert (= (and b!1480508 (not c!136644)) b!1480512))

(assert (= (or b!1480511 b!1480512) bm!67825))

(declare-fun m!1366313 () Bool)

(assert (=> b!1480508 m!1366313))

(assert (=> b!1480508 m!1366313))

(declare-fun m!1366315 () Bool)

(assert (=> b!1480508 m!1366315))

(assert (=> b!1480509 m!1366313))

(assert (=> b!1480509 m!1366313))

(assert (=> b!1480509 m!1366315))

(assert (=> b!1480510 m!1366313))

(assert (=> b!1480510 m!1366313))

(declare-fun m!1366317 () Bool)

(assert (=> b!1480510 m!1366317))

(assert (=> bm!67825 m!1366313))

(declare-fun m!1366319 () Bool)

(assert (=> bm!67825 m!1366319))

(assert (=> b!1480370 d!156063))

(declare-fun b!1480513 () Bool)

(declare-fun lt!646442 () SeekEntryResult!12207)

(assert (=> b!1480513 (and (bvsge (index!51222 lt!646442) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646442) (size!48517 a!2862)))))

(declare-fun res!1006263 () Bool)

(assert (=> b!1480513 (= res!1006263 (= (select (arr!47967 a!2862) (index!51222 lt!646442)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830381 () Bool)

(assert (=> b!1480513 (=> res!1006263 e!830381)))

(declare-fun b!1480514 () Bool)

(assert (=> b!1480514 (and (bvsge (index!51222 lt!646442) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646442) (size!48517 a!2862)))))

(declare-fun res!1006264 () Bool)

(assert (=> b!1480514 (= res!1006264 (= (select (arr!47967 a!2862) (index!51222 lt!646442)) (select (arr!47967 a!2862) j!93)))))

(assert (=> b!1480514 (=> res!1006264 e!830381)))

(declare-fun e!830383 () Bool)

(assert (=> b!1480514 (= e!830383 e!830381)))

(declare-fun d!156065 () Bool)

(declare-fun e!830384 () Bool)

(assert (=> d!156065 e!830384))

(declare-fun c!136646 () Bool)

(assert (=> d!156065 (= c!136646 (and ((_ is Intermediate!12207) lt!646442) (undefined!13019 lt!646442)))))

(declare-fun e!830382 () SeekEntryResult!12207)

(assert (=> d!156065 (= lt!646442 e!830382)))

(declare-fun c!136647 () Bool)

(assert (=> d!156065 (= c!136647 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646443 () (_ BitVec 64))

(assert (=> d!156065 (= lt!646443 (select (arr!47967 a!2862) index!646))))

(assert (=> d!156065 (validMask!0 mask!2687)))

(assert (=> d!156065 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646442)))

(declare-fun b!1480515 () Bool)

(declare-fun e!830385 () SeekEntryResult!12207)

(assert (=> b!1480515 (= e!830385 (Intermediate!12207 false index!646 x!665))))

(declare-fun b!1480516 () Bool)

(assert (=> b!1480516 (= e!830382 e!830385)))

(declare-fun c!136645 () Bool)

(assert (=> b!1480516 (= c!136645 (or (= lt!646443 (select (arr!47967 a!2862) j!93)) (= (bvadd lt!646443 lt!646443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480517 () Bool)

(assert (=> b!1480517 (= e!830384 (bvsge (x!132798 lt!646442) #b01111111111111111111111111111110))))

(declare-fun b!1480518 () Bool)

(assert (=> b!1480518 (= e!830385 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480519 () Bool)

(assert (=> b!1480519 (and (bvsge (index!51222 lt!646442) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646442) (size!48517 a!2862)))))

(assert (=> b!1480519 (= e!830381 (= (select (arr!47967 a!2862) (index!51222 lt!646442)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480520 () Bool)

(assert (=> b!1480520 (= e!830384 e!830383)))

(declare-fun res!1006265 () Bool)

(assert (=> b!1480520 (= res!1006265 (and ((_ is Intermediate!12207) lt!646442) (not (undefined!13019 lt!646442)) (bvslt (x!132798 lt!646442) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646442) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646442) x!665)))))

(assert (=> b!1480520 (=> (not res!1006265) (not e!830383))))

(declare-fun b!1480521 () Bool)

(assert (=> b!1480521 (= e!830382 (Intermediate!12207 true index!646 x!665))))

(assert (= (and d!156065 c!136647) b!1480521))

(assert (= (and d!156065 (not c!136647)) b!1480516))

(assert (= (and b!1480516 c!136645) b!1480515))

(assert (= (and b!1480516 (not c!136645)) b!1480518))

(assert (= (and d!156065 c!136646) b!1480517))

(assert (= (and d!156065 (not c!136646)) b!1480520))

(assert (= (and b!1480520 res!1006265) b!1480514))

(assert (= (and b!1480514 (not res!1006264)) b!1480513))

(assert (= (and b!1480513 (not res!1006263)) b!1480519))

(assert (=> d!156065 m!1366209))

(assert (=> d!156065 m!1366193))

(declare-fun m!1366321 () Bool)

(assert (=> b!1480514 m!1366321))

(declare-fun m!1366323 () Bool)

(assert (=> b!1480518 m!1366323))

(assert (=> b!1480518 m!1366323))

(assert (=> b!1480518 m!1366179))

(declare-fun m!1366325 () Bool)

(assert (=> b!1480518 m!1366325))

(assert (=> b!1480513 m!1366321))

(assert (=> b!1480519 m!1366321))

(assert (=> b!1480374 d!156065))

(declare-fun d!156067 () Bool)

(assert (=> d!156067 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126270 d!156067))

(declare-fun d!156071 () Bool)

(assert (=> d!156071 (= (array_inv!36995 a!2862) (bvsge (size!48517 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126270 d!156071))

(declare-fun d!156073 () Bool)

(declare-fun lt!646482 () SeekEntryResult!12207)

(assert (=> d!156073 (and (or ((_ is Undefined!12207) lt!646482) (not ((_ is Found!12207) lt!646482)) (and (bvsge (index!51221 lt!646482) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646482) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646482) ((_ is Found!12207) lt!646482) (not ((_ is MissingVacant!12207) lt!646482)) (not (= (index!51223 lt!646482) intermediateAfterIndex!19)) (and (bvsge (index!51223 lt!646482) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646482) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646482) (ite ((_ is Found!12207) lt!646482) (= (select (arr!47967 lt!646388) (index!51221 lt!646482)) lt!646389) (and ((_ is MissingVacant!12207) lt!646482) (= (index!51223 lt!646482) intermediateAfterIndex!19) (= (select (arr!47967 lt!646388) (index!51223 lt!646482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830433 () SeekEntryResult!12207)

(assert (=> d!156073 (= lt!646482 e!830433)))

(declare-fun c!136683 () Bool)

(assert (=> d!156073 (= c!136683 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646481 () (_ BitVec 64))

(assert (=> d!156073 (= lt!646481 (select (arr!47967 lt!646388) index!646))))

(assert (=> d!156073 (validMask!0 mask!2687)))

(assert (=> d!156073 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646389 lt!646388 mask!2687) lt!646482)))

(declare-fun b!1480603 () Bool)

(assert (=> b!1480603 (= e!830433 Undefined!12207)))

(declare-fun b!1480604 () Bool)

(declare-fun e!830431 () SeekEntryResult!12207)

(assert (=> b!1480604 (= e!830431 (Found!12207 index!646))))

(declare-fun b!1480605 () Bool)

(assert (=> b!1480605 (= e!830433 e!830431)))

(declare-fun c!136681 () Bool)

(assert (=> b!1480605 (= c!136681 (= lt!646481 lt!646389))))

(declare-fun e!830432 () SeekEntryResult!12207)

(declare-fun b!1480606 () Bool)

(assert (=> b!1480606 (= e!830432 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480607 () Bool)

(declare-fun c!136682 () Bool)

(assert (=> b!1480607 (= c!136682 (= lt!646481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480607 (= e!830431 e!830432)))

(declare-fun b!1480608 () Bool)

(assert (=> b!1480608 (= e!830432 (MissingVacant!12207 intermediateAfterIndex!19))))

(assert (= (and d!156073 c!136683) b!1480603))

(assert (= (and d!156073 (not c!136683)) b!1480605))

(assert (= (and b!1480605 c!136681) b!1480604))

(assert (= (and b!1480605 (not c!136681)) b!1480607))

(assert (= (and b!1480607 c!136682) b!1480608))

(assert (= (and b!1480607 (not c!136682)) b!1480606))

(declare-fun m!1366351 () Bool)

(assert (=> d!156073 m!1366351))

(declare-fun m!1366353 () Bool)

(assert (=> d!156073 m!1366353))

(declare-fun m!1366355 () Bool)

(assert (=> d!156073 m!1366355))

(assert (=> d!156073 m!1366193))

(assert (=> b!1480606 m!1366323))

(assert (=> b!1480606 m!1366323))

(declare-fun m!1366357 () Bool)

(assert (=> b!1480606 m!1366357))

(assert (=> b!1480373 d!156073))

(declare-fun d!156081 () Bool)

(declare-fun lt!646485 () SeekEntryResult!12207)

(assert (=> d!156081 (and (or ((_ is Undefined!12207) lt!646485) (not ((_ is Found!12207) lt!646485)) (and (bvsge (index!51221 lt!646485) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646485) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646485) ((_ is Found!12207) lt!646485) (not ((_ is MissingZero!12207) lt!646485)) (and (bvsge (index!51220 lt!646485) #b00000000000000000000000000000000) (bvslt (index!51220 lt!646485) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646485) ((_ is Found!12207) lt!646485) ((_ is MissingZero!12207) lt!646485) (not ((_ is MissingVacant!12207) lt!646485)) (and (bvsge (index!51223 lt!646485) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646485) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646485) (ite ((_ is Found!12207) lt!646485) (= (select (arr!47967 lt!646388) (index!51221 lt!646485)) lt!646389) (ite ((_ is MissingZero!12207) lt!646485) (= (select (arr!47967 lt!646388) (index!51220 lt!646485)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12207) lt!646485) (= (select (arr!47967 lt!646388) (index!51223 lt!646485)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830436 () SeekEntryResult!12207)

(assert (=> d!156081 (= lt!646485 e!830436)))

(declare-fun c!136684 () Bool)

(declare-fun lt!646484 () SeekEntryResult!12207)

(assert (=> d!156081 (= c!136684 (and ((_ is Intermediate!12207) lt!646484) (undefined!13019 lt!646484)))))

(assert (=> d!156081 (= lt!646484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646389 mask!2687) lt!646389 lt!646388 mask!2687))))

(assert (=> d!156081 (validMask!0 mask!2687)))

(assert (=> d!156081 (= (seekEntryOrOpen!0 lt!646389 lt!646388 mask!2687) lt!646485)))

(declare-fun b!1480609 () Bool)

(assert (=> b!1480609 (= e!830436 Undefined!12207)))

(declare-fun b!1480610 () Bool)

(declare-fun c!136685 () Bool)

(declare-fun lt!646483 () (_ BitVec 64))

(assert (=> b!1480610 (= c!136685 (= lt!646483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830434 () SeekEntryResult!12207)

(declare-fun e!830435 () SeekEntryResult!12207)

(assert (=> b!1480610 (= e!830434 e!830435)))

(declare-fun b!1480611 () Bool)

(assert (=> b!1480611 (= e!830436 e!830434)))

(assert (=> b!1480611 (= lt!646483 (select (arr!47967 lt!646388) (index!51222 lt!646484)))))

(declare-fun c!136686 () Bool)

(assert (=> b!1480611 (= c!136686 (= lt!646483 lt!646389))))

(declare-fun b!1480612 () Bool)

(assert (=> b!1480612 (= e!830435 (seekKeyOrZeroReturnVacant!0 (x!132798 lt!646484) (index!51222 lt!646484) (index!51222 lt!646484) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480613 () Bool)

(assert (=> b!1480613 (= e!830434 (Found!12207 (index!51222 lt!646484)))))

(declare-fun b!1480614 () Bool)

(assert (=> b!1480614 (= e!830435 (MissingZero!12207 (index!51222 lt!646484)))))

(assert (= (and d!156081 c!136684) b!1480609))

(assert (= (and d!156081 (not c!136684)) b!1480611))

(assert (= (and b!1480611 c!136686) b!1480613))

(assert (= (and b!1480611 (not c!136686)) b!1480610))

(assert (= (and b!1480610 c!136685) b!1480614))

(assert (= (and b!1480610 (not c!136685)) b!1480612))

(assert (=> d!156081 m!1366213))

(assert (=> d!156081 m!1366215))

(assert (=> d!156081 m!1366213))

(declare-fun m!1366359 () Bool)

(assert (=> d!156081 m!1366359))

(assert (=> d!156081 m!1366193))

(declare-fun m!1366361 () Bool)

(assert (=> d!156081 m!1366361))

(declare-fun m!1366363 () Bool)

(assert (=> d!156081 m!1366363))

(declare-fun m!1366365 () Bool)

(assert (=> b!1480611 m!1366365))

(declare-fun m!1366367 () Bool)

(assert (=> b!1480612 m!1366367))

(assert (=> b!1480373 d!156081))

(declare-fun b!1480615 () Bool)

(declare-fun lt!646486 () SeekEntryResult!12207)

(assert (=> b!1480615 (and (bvsge (index!51222 lt!646486) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646486) (size!48517 lt!646388)))))

(declare-fun res!1006282 () Bool)

(assert (=> b!1480615 (= res!1006282 (= (select (arr!47967 lt!646388) (index!51222 lt!646486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830437 () Bool)

(assert (=> b!1480615 (=> res!1006282 e!830437)))

(declare-fun b!1480616 () Bool)

(assert (=> b!1480616 (and (bvsge (index!51222 lt!646486) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646486) (size!48517 lt!646388)))))

(declare-fun res!1006283 () Bool)

(assert (=> b!1480616 (= res!1006283 (= (select (arr!47967 lt!646388) (index!51222 lt!646486)) lt!646389))))

(assert (=> b!1480616 (=> res!1006283 e!830437)))

(declare-fun e!830439 () Bool)

(assert (=> b!1480616 (= e!830439 e!830437)))

(declare-fun d!156083 () Bool)

(declare-fun e!830440 () Bool)

(assert (=> d!156083 e!830440))

(declare-fun c!136688 () Bool)

(assert (=> d!156083 (= c!136688 (and ((_ is Intermediate!12207) lt!646486) (undefined!13019 lt!646486)))))

(declare-fun e!830438 () SeekEntryResult!12207)

(assert (=> d!156083 (= lt!646486 e!830438)))

(declare-fun c!136689 () Bool)

(assert (=> d!156083 (= c!136689 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646487 () (_ BitVec 64))

(assert (=> d!156083 (= lt!646487 (select (arr!47967 lt!646388) index!646))))

(assert (=> d!156083 (validMask!0 mask!2687)))

(assert (=> d!156083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646389 lt!646388 mask!2687) lt!646486)))

(declare-fun b!1480617 () Bool)

(declare-fun e!830441 () SeekEntryResult!12207)

(assert (=> b!1480617 (= e!830441 (Intermediate!12207 false index!646 x!665))))

(declare-fun b!1480618 () Bool)

(assert (=> b!1480618 (= e!830438 e!830441)))

(declare-fun c!136687 () Bool)

(assert (=> b!1480618 (= c!136687 (or (= lt!646487 lt!646389) (= (bvadd lt!646487 lt!646487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480619 () Bool)

(assert (=> b!1480619 (= e!830440 (bvsge (x!132798 lt!646486) #b01111111111111111111111111111110))))

(declare-fun b!1480620 () Bool)

(assert (=> b!1480620 (= e!830441 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480621 () Bool)

(assert (=> b!1480621 (and (bvsge (index!51222 lt!646486) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646486) (size!48517 lt!646388)))))

(assert (=> b!1480621 (= e!830437 (= (select (arr!47967 lt!646388) (index!51222 lt!646486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480622 () Bool)

(assert (=> b!1480622 (= e!830440 e!830439)))

(declare-fun res!1006284 () Bool)

(assert (=> b!1480622 (= res!1006284 (and ((_ is Intermediate!12207) lt!646486) (not (undefined!13019 lt!646486)) (bvslt (x!132798 lt!646486) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646486) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646486) x!665)))))

(assert (=> b!1480622 (=> (not res!1006284) (not e!830439))))

(declare-fun b!1480623 () Bool)

(assert (=> b!1480623 (= e!830438 (Intermediate!12207 true index!646 x!665))))

(assert (= (and d!156083 c!136689) b!1480623))

(assert (= (and d!156083 (not c!136689)) b!1480618))

(assert (= (and b!1480618 c!136687) b!1480617))

(assert (= (and b!1480618 (not c!136687)) b!1480620))

(assert (= (and d!156083 c!136688) b!1480619))

(assert (= (and d!156083 (not c!136688)) b!1480622))

(assert (= (and b!1480622 res!1006284) b!1480616))

(assert (= (and b!1480616 (not res!1006283)) b!1480615))

(assert (= (and b!1480615 (not res!1006282)) b!1480621))

(assert (=> d!156083 m!1366355))

(assert (=> d!156083 m!1366193))

(declare-fun m!1366369 () Bool)

(assert (=> b!1480616 m!1366369))

(assert (=> b!1480620 m!1366323))

(assert (=> b!1480620 m!1366323))

(declare-fun m!1366375 () Bool)

(assert (=> b!1480620 m!1366375))

(assert (=> b!1480615 m!1366369))

(assert (=> b!1480621 m!1366369))

(assert (=> b!1480366 d!156083))

(declare-fun bm!67829 () Bool)

(declare-fun call!67832 () Bool)

(assert (=> bm!67829 (= call!67832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480630 () Bool)

(declare-fun e!830446 () Bool)

(assert (=> b!1480630 (= e!830446 call!67832)))

(declare-fun b!1480631 () Bool)

(declare-fun e!830447 () Bool)

(assert (=> b!1480631 (= e!830447 call!67832)))

(declare-fun b!1480632 () Bool)

(assert (=> b!1480632 (= e!830447 e!830446)))

(declare-fun lt!646493 () (_ BitVec 64))

(assert (=> b!1480632 (= lt!646493 (select (arr!47967 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!646491 () Unit!49754)

(assert (=> b!1480632 (= lt!646491 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646493 #b00000000000000000000000000000000))))

(assert (=> b!1480632 (arrayContainsKey!0 a!2862 lt!646493 #b00000000000000000000000000000000)))

(declare-fun lt!646492 () Unit!49754)

(assert (=> b!1480632 (= lt!646492 lt!646491)))

(declare-fun res!1006285 () Bool)

(assert (=> b!1480632 (= res!1006285 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12207 #b00000000000000000000000000000000)))))

(assert (=> b!1480632 (=> (not res!1006285) (not e!830446))))

(declare-fun b!1480633 () Bool)

(declare-fun e!830445 () Bool)

(assert (=> b!1480633 (= e!830445 e!830447)))

(declare-fun c!136693 () Bool)

(assert (=> b!1480633 (= c!136693 (validKeyInArray!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156085 () Bool)

(declare-fun res!1006286 () Bool)

(assert (=> d!156085 (=> res!1006286 e!830445)))

(assert (=> d!156085 (= res!1006286 (bvsge #b00000000000000000000000000000000 (size!48517 a!2862)))))

(assert (=> d!156085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!830445)))

(assert (= (and d!156085 (not res!1006286)) b!1480633))

(assert (= (and b!1480633 c!136693) b!1480632))

(assert (= (and b!1480633 (not c!136693)) b!1480631))

(assert (= (and b!1480632 res!1006285) b!1480630))

(assert (= (or b!1480630 b!1480631) bm!67829))

(declare-fun m!1366383 () Bool)

(assert (=> bm!67829 m!1366383))

(assert (=> b!1480632 m!1366313))

(declare-fun m!1366385 () Bool)

(assert (=> b!1480632 m!1366385))

(declare-fun m!1366387 () Bool)

(assert (=> b!1480632 m!1366387))

(assert (=> b!1480632 m!1366313))

(declare-fun m!1366389 () Bool)

(assert (=> b!1480632 m!1366389))

(assert (=> b!1480633 m!1366313))

(assert (=> b!1480633 m!1366313))

(assert (=> b!1480633 m!1366315))

(assert (=> b!1480376 d!156085))

(check-sat (not d!156057) (not b!1480509) (not b!1480620) (not d!156043) (not d!156047) (not b!1480496) (not d!156081) (not b!1480606) (not bm!67829) (not b!1480510) (not b!1480633) (not b!1480518) (not bm!67822) (not d!156065) (not b!1480474) (not b!1480482) (not b!1480612) (not b!1480497) (not b!1480508) (not d!156051) (not d!156083) (not bm!67825) (not b!1480455) (not d!156073) (not b!1480632))
(check-sat)
(get-model)

(declare-fun d!156227 () Bool)

(declare-fun lt!646635 () SeekEntryResult!12207)

(assert (=> d!156227 (and (or ((_ is Undefined!12207) lt!646635) (not ((_ is Found!12207) lt!646635)) (and (bvsge (index!51221 lt!646635) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646635) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646635) ((_ is Found!12207) lt!646635) (not ((_ is MissingVacant!12207) lt!646635)) (not (= (index!51223 lt!646635) (index!51222 lt!646484))) (and (bvsge (index!51223 lt!646635) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646635) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646635) (ite ((_ is Found!12207) lt!646635) (= (select (arr!47967 lt!646388) (index!51221 lt!646635)) lt!646389) (and ((_ is MissingVacant!12207) lt!646635) (= (index!51223 lt!646635) (index!51222 lt!646484)) (= (select (arr!47967 lt!646388) (index!51223 lt!646635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830670 () SeekEntryResult!12207)

(assert (=> d!156227 (= lt!646635 e!830670)))

(declare-fun c!136812 () Bool)

(assert (=> d!156227 (= c!136812 (bvsge (x!132798 lt!646484) #b01111111111111111111111111111110))))

(declare-fun lt!646634 () (_ BitVec 64))

(assert (=> d!156227 (= lt!646634 (select (arr!47967 lt!646388) (index!51222 lt!646484)))))

(assert (=> d!156227 (validMask!0 mask!2687)))

(assert (=> d!156227 (= (seekKeyOrZeroReturnVacant!0 (x!132798 lt!646484) (index!51222 lt!646484) (index!51222 lt!646484) lt!646389 lt!646388 mask!2687) lt!646635)))

(declare-fun b!1480987 () Bool)

(assert (=> b!1480987 (= e!830670 Undefined!12207)))

(declare-fun b!1480988 () Bool)

(declare-fun e!830668 () SeekEntryResult!12207)

(assert (=> b!1480988 (= e!830668 (Found!12207 (index!51222 lt!646484)))))

(declare-fun b!1480989 () Bool)

(assert (=> b!1480989 (= e!830670 e!830668)))

(declare-fun c!136810 () Bool)

(assert (=> b!1480989 (= c!136810 (= lt!646634 lt!646389))))

(declare-fun b!1480990 () Bool)

(declare-fun e!830669 () SeekEntryResult!12207)

(assert (=> b!1480990 (= e!830669 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132798 lt!646484) #b00000000000000000000000000000001) (nextIndex!0 (index!51222 lt!646484) (x!132798 lt!646484) mask!2687) (index!51222 lt!646484) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480991 () Bool)

(declare-fun c!136811 () Bool)

(assert (=> b!1480991 (= c!136811 (= lt!646634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480991 (= e!830668 e!830669)))

(declare-fun b!1480992 () Bool)

(assert (=> b!1480992 (= e!830669 (MissingVacant!12207 (index!51222 lt!646484)))))

(assert (= (and d!156227 c!136812) b!1480987))

(assert (= (and d!156227 (not c!136812)) b!1480989))

(assert (= (and b!1480989 c!136810) b!1480988))

(assert (= (and b!1480989 (not c!136810)) b!1480991))

(assert (= (and b!1480991 c!136811) b!1480992))

(assert (= (and b!1480991 (not c!136811)) b!1480990))

(declare-fun m!1366741 () Bool)

(assert (=> d!156227 m!1366741))

(declare-fun m!1366743 () Bool)

(assert (=> d!156227 m!1366743))

(assert (=> d!156227 m!1366365))

(assert (=> d!156227 m!1366193))

(declare-fun m!1366745 () Bool)

(assert (=> b!1480990 m!1366745))

(assert (=> b!1480990 m!1366745))

(declare-fun m!1366747 () Bool)

(assert (=> b!1480990 m!1366747))

(assert (=> b!1480612 d!156227))

(declare-fun b!1480993 () Bool)

(declare-fun lt!646636 () SeekEntryResult!12207)

(assert (=> b!1480993 (and (bvsge (index!51222 lt!646636) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646636) (size!48517 lt!646388)))))

(declare-fun res!1006409 () Bool)

(assert (=> b!1480993 (= res!1006409 (= (select (arr!47967 lt!646388) (index!51222 lt!646636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830671 () Bool)

(assert (=> b!1480993 (=> res!1006409 e!830671)))

(declare-fun b!1480994 () Bool)

(assert (=> b!1480994 (and (bvsge (index!51222 lt!646636) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646636) (size!48517 lt!646388)))))

(declare-fun res!1006410 () Bool)

(assert (=> b!1480994 (= res!1006410 (= (select (arr!47967 lt!646388) (index!51222 lt!646636)) lt!646389))))

(assert (=> b!1480994 (=> res!1006410 e!830671)))

(declare-fun e!830673 () Bool)

(assert (=> b!1480994 (= e!830673 e!830671)))

(declare-fun d!156229 () Bool)

(declare-fun e!830674 () Bool)

(assert (=> d!156229 e!830674))

(declare-fun c!136814 () Bool)

(assert (=> d!156229 (= c!136814 (and ((_ is Intermediate!12207) lt!646636) (undefined!13019 lt!646636)))))

(declare-fun e!830672 () SeekEntryResult!12207)

(assert (=> d!156229 (= lt!646636 e!830672)))

(declare-fun c!136815 () Bool)

(assert (=> d!156229 (= c!136815 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646637 () (_ BitVec 64))

(assert (=> d!156229 (= lt!646637 (select (arr!47967 lt!646388) (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156229 (validMask!0 mask!2687)))

(assert (=> d!156229 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646389 lt!646388 mask!2687) lt!646636)))

(declare-fun b!1480995 () Bool)

(declare-fun e!830675 () SeekEntryResult!12207)

(assert (=> b!1480995 (= e!830675 (Intermediate!12207 false (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480996 () Bool)

(assert (=> b!1480996 (= e!830672 e!830675)))

(declare-fun c!136813 () Bool)

(assert (=> b!1480996 (= c!136813 (or (= lt!646637 lt!646389) (= (bvadd lt!646637 lt!646637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480997 () Bool)

(assert (=> b!1480997 (= e!830674 (bvsge (x!132798 lt!646636) #b01111111111111111111111111111110))))

(declare-fun b!1480998 () Bool)

(assert (=> b!1480998 (= e!830675 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1480999 () Bool)

(assert (=> b!1480999 (and (bvsge (index!51222 lt!646636) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646636) (size!48517 lt!646388)))))

(assert (=> b!1480999 (= e!830671 (= (select (arr!47967 lt!646388) (index!51222 lt!646636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1481000 () Bool)

(assert (=> b!1481000 (= e!830674 e!830673)))

(declare-fun res!1006411 () Bool)

(assert (=> b!1481000 (= res!1006411 (and ((_ is Intermediate!12207) lt!646636) (not (undefined!13019 lt!646636)) (bvslt (x!132798 lt!646636) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646636) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646636) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1481000 (=> (not res!1006411) (not e!830673))))

(declare-fun b!1481001 () Bool)

(assert (=> b!1481001 (= e!830672 (Intermediate!12207 true (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156229 c!136815) b!1481001))

(assert (= (and d!156229 (not c!136815)) b!1480996))

(assert (= (and b!1480996 c!136813) b!1480995))

(assert (= (and b!1480996 (not c!136813)) b!1480998))

(assert (= (and d!156229 c!136814) b!1480997))

(assert (= (and d!156229 (not c!136814)) b!1481000))

(assert (= (and b!1481000 res!1006411) b!1480994))

(assert (= (and b!1480994 (not res!1006410)) b!1480993))

(assert (= (and b!1480993 (not res!1006409)) b!1480999))

(assert (=> d!156229 m!1366283))

(declare-fun m!1366749 () Bool)

(assert (=> d!156229 m!1366749))

(assert (=> d!156229 m!1366193))

(declare-fun m!1366751 () Bool)

(assert (=> b!1480994 m!1366751))

(assert (=> b!1480998 m!1366283))

(declare-fun m!1366753 () Bool)

(assert (=> b!1480998 m!1366753))

(assert (=> b!1480998 m!1366753))

(declare-fun m!1366755 () Bool)

(assert (=> b!1480998 m!1366755))

(assert (=> b!1480993 m!1366751))

(assert (=> b!1480999 m!1366751))

(assert (=> b!1480455 d!156229))

(declare-fun d!156231 () Bool)

(declare-fun lt!646640 () (_ BitVec 32))

(assert (=> d!156231 (and (bvsge lt!646640 #b00000000000000000000000000000000) (bvslt lt!646640 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156231 (= lt!646640 (choose!52 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156231 (validMask!0 mask!2687)))

(assert (=> d!156231 (= (nextIndex!0 (toIndex!0 lt!646389 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646640)))

(declare-fun bs!42674 () Bool)

(assert (= bs!42674 d!156231))

(assert (=> bs!42674 m!1366213))

(declare-fun m!1366757 () Bool)

(assert (=> bs!42674 m!1366757))

(assert (=> bs!42674 m!1366193))

(assert (=> b!1480455 d!156231))

(declare-fun d!156233 () Bool)

(declare-fun lt!646643 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!779 (List!34468) (InoxSet (_ BitVec 64)))

(assert (=> d!156233 (= lt!646643 (select (content!779 Nil!34465) (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun e!830681 () Bool)

(assert (=> d!156233 (= lt!646643 e!830681)))

(declare-fun res!1006417 () Bool)

(assert (=> d!156233 (=> (not res!1006417) (not e!830681))))

(assert (=> d!156233 (= res!1006417 ((_ is Cons!34464) Nil!34465))))

(assert (=> d!156233 (= (contains!9910 Nil!34465 (select (arr!47967 a!2862) #b00000000000000000000000000000000)) lt!646643)))

(declare-fun b!1481006 () Bool)

(declare-fun e!830680 () Bool)

(assert (=> b!1481006 (= e!830681 e!830680)))

(declare-fun res!1006416 () Bool)

(assert (=> b!1481006 (=> res!1006416 e!830680)))

(assert (=> b!1481006 (= res!1006416 (= (h!35832 Nil!34465) (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1481007 () Bool)

(assert (=> b!1481007 (= e!830680 (contains!9910 (t!49162 Nil!34465) (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156233 res!1006417) b!1481006))

(assert (= (and b!1481006 (not res!1006416)) b!1481007))

(declare-fun m!1366759 () Bool)

(assert (=> d!156233 m!1366759))

(assert (=> d!156233 m!1366313))

(declare-fun m!1366761 () Bool)

(assert (=> d!156233 m!1366761))

(assert (=> b!1481007 m!1366313))

(declare-fun m!1366763 () Bool)

(assert (=> b!1481007 m!1366763))

(assert (=> b!1480510 d!156233))

(declare-fun d!156235 () Bool)

(assert (=> d!156235 (= (validKeyInArray!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000)) (and (not (= (select (arr!47967 a!2862) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47967 a!2862) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480509 d!156235))

(assert (=> d!156073 d!156067))

(declare-fun b!1481008 () Bool)

(declare-fun e!830685 () Bool)

(declare-fun e!830684 () Bool)

(assert (=> b!1481008 (= e!830685 e!830684)))

(declare-fun c!136816 () Bool)

(assert (=> b!1481008 (= c!136816 (validKeyInArray!0 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1481009 () Bool)

(declare-fun e!830683 () Bool)

(assert (=> b!1481009 (= e!830683 e!830685)))

(declare-fun res!1006418 () Bool)

(assert (=> b!1481009 (=> (not res!1006418) (not e!830685))))

(declare-fun e!830682 () Bool)

(assert (=> b!1481009 (= res!1006418 (not e!830682))))

(declare-fun res!1006419 () Bool)

(assert (=> b!1481009 (=> (not res!1006419) (not e!830682))))

(assert (=> b!1481009 (= res!1006419 (validKeyInArray!0 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1481010 () Bool)

(assert (=> b!1481010 (= e!830682 (contains!9910 (ite c!136644 (Cons!34464 (select (arr!47967 a!2862) #b00000000000000000000000000000000) Nil!34465) Nil!34465) (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1481011 () Bool)

(declare-fun call!67850 () Bool)

(assert (=> b!1481011 (= e!830684 call!67850)))

(declare-fun d!156237 () Bool)

(declare-fun res!1006420 () Bool)

(assert (=> d!156237 (=> res!1006420 e!830683)))

(assert (=> d!156237 (= res!1006420 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48517 a!2862)))))

(assert (=> d!156237 (= (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136644 (Cons!34464 (select (arr!47967 a!2862) #b00000000000000000000000000000000) Nil!34465) Nil!34465)) e!830683)))

(declare-fun b!1481012 () Bool)

(assert (=> b!1481012 (= e!830684 call!67850)))

(declare-fun bm!67847 () Bool)

(assert (=> bm!67847 (= call!67850 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!136816 (Cons!34464 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!136644 (Cons!34464 (select (arr!47967 a!2862) #b00000000000000000000000000000000) Nil!34465) Nil!34465)) (ite c!136644 (Cons!34464 (select (arr!47967 a!2862) #b00000000000000000000000000000000) Nil!34465) Nil!34465))))))

(assert (= (and d!156237 (not res!1006420)) b!1481009))

(assert (= (and b!1481009 res!1006419) b!1481010))

(assert (= (and b!1481009 res!1006418) b!1481008))

(assert (= (and b!1481008 c!136816) b!1481011))

(assert (= (and b!1481008 (not c!136816)) b!1481012))

(assert (= (or b!1481011 b!1481012) bm!67847))

(declare-fun m!1366765 () Bool)

(assert (=> b!1481008 m!1366765))

(assert (=> b!1481008 m!1366765))

(declare-fun m!1366767 () Bool)

(assert (=> b!1481008 m!1366767))

(assert (=> b!1481009 m!1366765))

(assert (=> b!1481009 m!1366765))

(assert (=> b!1481009 m!1366767))

(assert (=> b!1481010 m!1366765))

(assert (=> b!1481010 m!1366765))

(declare-fun m!1366769 () Bool)

(assert (=> b!1481010 m!1366769))

(assert (=> bm!67847 m!1366765))

(declare-fun m!1366771 () Bool)

(assert (=> bm!67847 m!1366771))

(assert (=> bm!67825 d!156237))

(assert (=> d!156081 d!156043))

(assert (=> d!156081 d!156045))

(assert (=> d!156081 d!156067))

(declare-fun b!1481013 () Bool)

(declare-fun lt!646644 () SeekEntryResult!12207)

(assert (=> b!1481013 (and (bvsge (index!51222 lt!646644) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646644) (size!48517 a!2862)))))

(declare-fun res!1006421 () Bool)

(assert (=> b!1481013 (= res!1006421 (= (select (arr!47967 a!2862) (index!51222 lt!646644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830686 () Bool)

(assert (=> b!1481013 (=> res!1006421 e!830686)))

(declare-fun b!1481014 () Bool)

(assert (=> b!1481014 (and (bvsge (index!51222 lt!646644) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646644) (size!48517 a!2862)))))

(declare-fun res!1006422 () Bool)

(assert (=> b!1481014 (= res!1006422 (= (select (arr!47967 a!2862) (index!51222 lt!646644)) (select (arr!47967 a!2862) j!93)))))

(assert (=> b!1481014 (=> res!1006422 e!830686)))

(declare-fun e!830688 () Bool)

(assert (=> b!1481014 (= e!830688 e!830686)))

(declare-fun d!156239 () Bool)

(declare-fun e!830689 () Bool)

(assert (=> d!156239 e!830689))

(declare-fun c!136818 () Bool)

(assert (=> d!156239 (= c!136818 (and ((_ is Intermediate!12207) lt!646644) (undefined!13019 lt!646644)))))

(declare-fun e!830687 () SeekEntryResult!12207)

(assert (=> d!156239 (= lt!646644 e!830687)))

(declare-fun c!136819 () Bool)

(assert (=> d!156239 (= c!136819 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646645 () (_ BitVec 64))

(assert (=> d!156239 (= lt!646645 (select (arr!47967 a!2862) (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156239 (validMask!0 mask!2687)))

(assert (=> d!156239 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646644)))

(declare-fun e!830690 () SeekEntryResult!12207)

(declare-fun b!1481015 () Bool)

(assert (=> b!1481015 (= e!830690 (Intermediate!12207 false (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1481016 () Bool)

(assert (=> b!1481016 (= e!830687 e!830690)))

(declare-fun c!136817 () Bool)

(assert (=> b!1481016 (= c!136817 (or (= lt!646645 (select (arr!47967 a!2862) j!93)) (= (bvadd lt!646645 lt!646645) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1481017 () Bool)

(assert (=> b!1481017 (= e!830689 (bvsge (x!132798 lt!646644) #b01111111111111111111111111111110))))

(declare-fun b!1481018 () Bool)

(assert (=> b!1481018 (= e!830690 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1481019 () Bool)

(assert (=> b!1481019 (and (bvsge (index!51222 lt!646644) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646644) (size!48517 a!2862)))))

(assert (=> b!1481019 (= e!830686 (= (select (arr!47967 a!2862) (index!51222 lt!646644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1481020 () Bool)

(assert (=> b!1481020 (= e!830689 e!830688)))

(declare-fun res!1006423 () Bool)

(assert (=> b!1481020 (= res!1006423 (and ((_ is Intermediate!12207) lt!646644) (not (undefined!13019 lt!646644)) (bvslt (x!132798 lt!646644) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646644) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646644) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1481020 (=> (not res!1006423) (not e!830688))))

(declare-fun b!1481021 () Bool)

(assert (=> b!1481021 (= e!830687 (Intermediate!12207 true (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156239 c!136819) b!1481021))

(assert (= (and d!156239 (not c!136819)) b!1481016))

(assert (= (and b!1481016 c!136817) b!1481015))

(assert (= (and b!1481016 (not c!136817)) b!1481018))

(assert (= (and d!156239 c!136818) b!1481017))

(assert (= (and d!156239 (not c!136818)) b!1481020))

(assert (= (and b!1481020 res!1006423) b!1481014))

(assert (= (and b!1481014 (not res!1006422)) b!1481013))

(assert (= (and b!1481013 (not res!1006421)) b!1481019))

(assert (=> d!156239 m!1366301))

(declare-fun m!1366773 () Bool)

(assert (=> d!156239 m!1366773))

(assert (=> d!156239 m!1366193))

(declare-fun m!1366775 () Bool)

(assert (=> b!1481014 m!1366775))

(assert (=> b!1481018 m!1366301))

(declare-fun m!1366777 () Bool)

(assert (=> b!1481018 m!1366777))

(assert (=> b!1481018 m!1366777))

(assert (=> b!1481018 m!1366179))

(declare-fun m!1366779 () Bool)

(assert (=> b!1481018 m!1366779))

(assert (=> b!1481013 m!1366775))

(assert (=> b!1481019 m!1366775))

(assert (=> b!1480482 d!156239))

(declare-fun d!156241 () Bool)

(declare-fun lt!646646 () (_ BitVec 32))

(assert (=> d!156241 (and (bvsge lt!646646 #b00000000000000000000000000000000) (bvslt lt!646646 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156241 (= lt!646646 (choose!52 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156241 (validMask!0 mask!2687)))

(assert (=> d!156241 (= (nextIndex!0 (toIndex!0 (select (arr!47967 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646646)))

(declare-fun bs!42675 () Bool)

(assert (= bs!42675 d!156241))

(assert (=> bs!42675 m!1366181))

(declare-fun m!1366781 () Bool)

(assert (=> bs!42675 m!1366781))

(assert (=> bs!42675 m!1366193))

(assert (=> b!1480482 d!156241))

(declare-fun call!67851 () Bool)

(declare-fun bm!67848 () Bool)

(assert (=> bm!67848 (= call!67851 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1481022 () Bool)

(declare-fun e!830692 () Bool)

(assert (=> b!1481022 (= e!830692 call!67851)))

(declare-fun b!1481023 () Bool)

(declare-fun e!830693 () Bool)

(assert (=> b!1481023 (= e!830693 call!67851)))

(declare-fun b!1481024 () Bool)

(assert (=> b!1481024 (= e!830693 e!830692)))

(declare-fun lt!646649 () (_ BitVec 64))

(assert (=> b!1481024 (= lt!646649 (select (arr!47967 a!2862) (bvadd j!93 #b00000000000000000000000000000001)))))

(declare-fun lt!646647 () Unit!49754)

(assert (=> b!1481024 (= lt!646647 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646649 (bvadd j!93 #b00000000000000000000000000000001)))))

(assert (=> b!1481024 (arrayContainsKey!0 a!2862 lt!646649 #b00000000000000000000000000000000)))

(declare-fun lt!646648 () Unit!49754)

(assert (=> b!1481024 (= lt!646648 lt!646647)))

(declare-fun res!1006424 () Bool)

(assert (=> b!1481024 (= res!1006424 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) (bvadd j!93 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12207 (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (=> b!1481024 (=> (not res!1006424) (not e!830692))))

(declare-fun b!1481025 () Bool)

(declare-fun e!830691 () Bool)

(assert (=> b!1481025 (= e!830691 e!830693)))

(declare-fun c!136820 () Bool)

(assert (=> b!1481025 (= c!136820 (validKeyInArray!0 (select (arr!47967 a!2862) (bvadd j!93 #b00000000000000000000000000000001))))))

(declare-fun d!156243 () Bool)

(declare-fun res!1006425 () Bool)

(assert (=> d!156243 (=> res!1006425 e!830691)))

(assert (=> d!156243 (= res!1006425 (bvsge (bvadd j!93 #b00000000000000000000000000000001) (size!48517 a!2862)))))

(assert (=> d!156243 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687) e!830691)))

(assert (= (and d!156243 (not res!1006425)) b!1481025))

(assert (= (and b!1481025 c!136820) b!1481024))

(assert (= (and b!1481025 (not c!136820)) b!1481023))

(assert (= (and b!1481024 res!1006424) b!1481022))

(assert (= (or b!1481022 b!1481023) bm!67848))

(declare-fun m!1366783 () Bool)

(assert (=> bm!67848 m!1366783))

(declare-fun m!1366785 () Bool)

(assert (=> b!1481024 m!1366785))

(declare-fun m!1366787 () Bool)

(assert (=> b!1481024 m!1366787))

(declare-fun m!1366789 () Bool)

(assert (=> b!1481024 m!1366789))

(assert (=> b!1481024 m!1366785))

(declare-fun m!1366791 () Bool)

(assert (=> b!1481024 m!1366791))

(assert (=> b!1481025 m!1366785))

(assert (=> b!1481025 m!1366785))

(declare-fun m!1366793 () Bool)

(assert (=> b!1481025 m!1366793))

(assert (=> bm!67822 d!156243))

(assert (=> d!156047 d!156051))

(assert (=> d!156047 d!156053))

(assert (=> d!156047 d!156067))

(assert (=> b!1480497 d!156049))

(declare-fun b!1481026 () Bool)

(declare-fun lt!646650 () SeekEntryResult!12207)

(assert (=> b!1481026 (and (bvsge (index!51222 lt!646650) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646650) (size!48517 a!2862)))))

(declare-fun res!1006426 () Bool)

(assert (=> b!1481026 (= res!1006426 (= (select (arr!47967 a!2862) (index!51222 lt!646650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830694 () Bool)

(assert (=> b!1481026 (=> res!1006426 e!830694)))

(declare-fun b!1481027 () Bool)

(assert (=> b!1481027 (and (bvsge (index!51222 lt!646650) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646650) (size!48517 a!2862)))))

(declare-fun res!1006427 () Bool)

(assert (=> b!1481027 (= res!1006427 (= (select (arr!47967 a!2862) (index!51222 lt!646650)) (select (arr!47967 a!2862) j!93)))))

(assert (=> b!1481027 (=> res!1006427 e!830694)))

(declare-fun e!830696 () Bool)

(assert (=> b!1481027 (= e!830696 e!830694)))

(declare-fun d!156245 () Bool)

(declare-fun e!830697 () Bool)

(assert (=> d!156245 e!830697))

(declare-fun c!136822 () Bool)

(assert (=> d!156245 (= c!136822 (and ((_ is Intermediate!12207) lt!646650) (undefined!13019 lt!646650)))))

(declare-fun e!830695 () SeekEntryResult!12207)

(assert (=> d!156245 (= lt!646650 e!830695)))

(declare-fun c!136823 () Bool)

(assert (=> d!156245 (= c!136823 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646651 () (_ BitVec 64))

(assert (=> d!156245 (= lt!646651 (select (arr!47967 a!2862) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156245 (validMask!0 mask!2687)))

(assert (=> d!156245 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646650)))

(declare-fun e!830698 () SeekEntryResult!12207)

(declare-fun b!1481028 () Bool)

(assert (=> b!1481028 (= e!830698 (Intermediate!12207 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1481029 () Bool)

(assert (=> b!1481029 (= e!830695 e!830698)))

(declare-fun c!136821 () Bool)

(assert (=> b!1481029 (= c!136821 (or (= lt!646651 (select (arr!47967 a!2862) j!93)) (= (bvadd lt!646651 lt!646651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1481030 () Bool)

(assert (=> b!1481030 (= e!830697 (bvsge (x!132798 lt!646650) #b01111111111111111111111111111110))))

(declare-fun b!1481031 () Bool)

(assert (=> b!1481031 (= e!830698 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1481032 () Bool)

(assert (=> b!1481032 (and (bvsge (index!51222 lt!646650) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646650) (size!48517 a!2862)))))

(assert (=> b!1481032 (= e!830694 (= (select (arr!47967 a!2862) (index!51222 lt!646650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1481033 () Bool)

(assert (=> b!1481033 (= e!830697 e!830696)))

(declare-fun res!1006428 () Bool)

(assert (=> b!1481033 (= res!1006428 (and ((_ is Intermediate!12207) lt!646650) (not (undefined!13019 lt!646650)) (bvslt (x!132798 lt!646650) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646650) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646650) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1481033 (=> (not res!1006428) (not e!830696))))

(declare-fun b!1481034 () Bool)

(assert (=> b!1481034 (= e!830695 (Intermediate!12207 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156245 c!136823) b!1481034))

(assert (= (and d!156245 (not c!136823)) b!1481029))

(assert (= (and b!1481029 c!136821) b!1481028))

(assert (= (and b!1481029 (not c!136821)) b!1481031))

(assert (= (and d!156245 c!136822) b!1481030))

(assert (= (and d!156245 (not c!136822)) b!1481033))

(assert (= (and b!1481033 res!1006428) b!1481027))

(assert (= (and b!1481027 (not res!1006427)) b!1481026))

(assert (= (and b!1481026 (not res!1006426)) b!1481032))

(assert (=> d!156245 m!1366323))

(declare-fun m!1366795 () Bool)

(assert (=> d!156245 m!1366795))

(assert (=> d!156245 m!1366193))

(declare-fun m!1366797 () Bool)

(assert (=> b!1481027 m!1366797))

(assert (=> b!1481031 m!1366323))

(declare-fun m!1366799 () Bool)

(assert (=> b!1481031 m!1366799))

(assert (=> b!1481031 m!1366799))

(assert (=> b!1481031 m!1366179))

(declare-fun m!1366801 () Bool)

(assert (=> b!1481031 m!1366801))

(assert (=> b!1481026 m!1366797))

(assert (=> b!1481032 m!1366797))

(assert (=> b!1480518 d!156245))

(declare-fun d!156247 () Bool)

(declare-fun lt!646652 () (_ BitVec 32))

(assert (=> d!156247 (and (bvsge lt!646652 #b00000000000000000000000000000000) (bvslt lt!646652 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156247 (= lt!646652 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156247 (validMask!0 mask!2687)))

(assert (=> d!156247 (= (nextIndex!0 index!646 x!665 mask!2687) lt!646652)))

(declare-fun bs!42676 () Bool)

(assert (= bs!42676 d!156247))

(declare-fun m!1366803 () Bool)

(assert (=> bs!42676 m!1366803))

(assert (=> bs!42676 m!1366193))

(assert (=> b!1480518 d!156247))

(assert (=> d!156051 d!156067))

(declare-fun d!156249 () Bool)

(assert (=> d!156249 (arrayContainsKey!0 a!2862 lt!646438 #b00000000000000000000000000000000)))

(declare-fun lt!646655 () Unit!49754)

(declare-fun choose!13 (array!99376 (_ BitVec 64) (_ BitVec 32)) Unit!49754)

(assert (=> d!156249 (= lt!646655 (choose!13 a!2862 lt!646438 j!93))))

(assert (=> d!156249 (bvsge j!93 #b00000000000000000000000000000000)))

(assert (=> d!156249 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646438 j!93) lt!646655)))

(declare-fun bs!42677 () Bool)

(assert (= bs!42677 d!156249))

(assert (=> bs!42677 m!1366309))

(declare-fun m!1366805 () Bool)

(assert (=> bs!42677 m!1366805))

(assert (=> b!1480496 d!156249))

(declare-fun d!156251 () Bool)

(declare-fun res!1006433 () Bool)

(declare-fun e!830703 () Bool)

(assert (=> d!156251 (=> res!1006433 e!830703)))

(assert (=> d!156251 (= res!1006433 (= (select (arr!47967 a!2862) #b00000000000000000000000000000000) lt!646438))))

(assert (=> d!156251 (= (arrayContainsKey!0 a!2862 lt!646438 #b00000000000000000000000000000000) e!830703)))

(declare-fun b!1481039 () Bool)

(declare-fun e!830704 () Bool)

(assert (=> b!1481039 (= e!830703 e!830704)))

(declare-fun res!1006434 () Bool)

(assert (=> b!1481039 (=> (not res!1006434) (not e!830704))))

(assert (=> b!1481039 (= res!1006434 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48517 a!2862)))))

(declare-fun b!1481040 () Bool)

(assert (=> b!1481040 (= e!830704 (arrayContainsKey!0 a!2862 lt!646438 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156251 (not res!1006433)) b!1481039))

(assert (= (and b!1481039 res!1006434) b!1481040))

(assert (=> d!156251 m!1366313))

(declare-fun m!1366807 () Bool)

(assert (=> b!1481040 m!1366807))

(assert (=> b!1480496 d!156251))

(assert (=> b!1480496 d!156047))

(declare-fun lt!646657 () SeekEntryResult!12207)

(declare-fun d!156253 () Bool)

(assert (=> d!156253 (and (or ((_ is Undefined!12207) lt!646657) (not ((_ is Found!12207) lt!646657)) (and (bvsge (index!51221 lt!646657) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646657) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646657) ((_ is Found!12207) lt!646657) (not ((_ is MissingVacant!12207) lt!646657)) (not (= (index!51223 lt!646657) intermediateAfterIndex!19)) (and (bvsge (index!51223 lt!646657) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646657) (size!48517 lt!646388)))) (or ((_ is Undefined!12207) lt!646657) (ite ((_ is Found!12207) lt!646657) (= (select (arr!47967 lt!646388) (index!51221 lt!646657)) lt!646389) (and ((_ is MissingVacant!12207) lt!646657) (= (index!51223 lt!646657) intermediateAfterIndex!19) (= (select (arr!47967 lt!646388) (index!51223 lt!646657)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830707 () SeekEntryResult!12207)

(assert (=> d!156253 (= lt!646657 e!830707)))

(declare-fun c!136826 () Bool)

(assert (=> d!156253 (= c!136826 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646656 () (_ BitVec 64))

(assert (=> d!156253 (= lt!646656 (select (arr!47967 lt!646388) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156253 (validMask!0 mask!2687)))

(assert (=> d!156253 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646389 lt!646388 mask!2687) lt!646657)))

(declare-fun b!1481041 () Bool)

(assert (=> b!1481041 (= e!830707 Undefined!12207)))

(declare-fun b!1481042 () Bool)

(declare-fun e!830705 () SeekEntryResult!12207)

(assert (=> b!1481042 (= e!830705 (Found!12207 (nextIndex!0 index!646 x!665 mask!2687)))))

(declare-fun b!1481043 () Bool)

(assert (=> b!1481043 (= e!830707 e!830705)))

(declare-fun c!136824 () Bool)

(assert (=> b!1481043 (= c!136824 (= lt!646656 lt!646389))))

(declare-fun b!1481044 () Bool)

(declare-fun e!830706 () SeekEntryResult!12207)

(assert (=> b!1481044 (= e!830706 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!646389 lt!646388 mask!2687))))

(declare-fun b!1481045 () Bool)

(declare-fun c!136825 () Bool)

(assert (=> b!1481045 (= c!136825 (= lt!646656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481045 (= e!830705 e!830706)))

(declare-fun b!1481046 () Bool)

(assert (=> b!1481046 (= e!830706 (MissingVacant!12207 intermediateAfterIndex!19))))

(assert (= (and d!156253 c!136826) b!1481041))

(assert (= (and d!156253 (not c!136826)) b!1481043))

(assert (= (and b!1481043 c!136824) b!1481042))

(assert (= (and b!1481043 (not c!136824)) b!1481045))

(assert (= (and b!1481045 c!136825) b!1481046))

(assert (= (and b!1481045 (not c!136825)) b!1481044))

(declare-fun m!1366809 () Bool)

(assert (=> d!156253 m!1366809))

(declare-fun m!1366811 () Bool)

(assert (=> d!156253 m!1366811))

(assert (=> d!156253 m!1366323))

(declare-fun m!1366813 () Bool)

(assert (=> d!156253 m!1366813))

(assert (=> d!156253 m!1366193))

(assert (=> b!1481044 m!1366323))

(assert (=> b!1481044 m!1366799))

(assert (=> b!1481044 m!1366799))

(declare-fun m!1366815 () Bool)

(assert (=> b!1481044 m!1366815))

(assert (=> b!1480606 d!156253))

(assert (=> b!1480606 d!156247))

(assert (=> d!156065 d!156067))

(assert (=> d!156083 d!156067))

(declare-fun bm!67849 () Bool)

(declare-fun call!67852 () Bool)

(assert (=> bm!67849 (= call!67852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1481047 () Bool)

(declare-fun e!830709 () Bool)

(assert (=> b!1481047 (= e!830709 call!67852)))

(declare-fun b!1481048 () Bool)

(declare-fun e!830710 () Bool)

(assert (=> b!1481048 (= e!830710 call!67852)))

(declare-fun b!1481049 () Bool)

(assert (=> b!1481049 (= e!830710 e!830709)))

(declare-fun lt!646660 () (_ BitVec 64))

(assert (=> b!1481049 (= lt!646660 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!646658 () Unit!49754)

(assert (=> b!1481049 (= lt!646658 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646660 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1481049 (arrayContainsKey!0 a!2862 lt!646660 #b00000000000000000000000000000000)))

(declare-fun lt!646659 () Unit!49754)

(assert (=> b!1481049 (= lt!646659 lt!646658)))

(declare-fun res!1006435 () Bool)

(assert (=> b!1481049 (= res!1006435 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12207 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1481049 (=> (not res!1006435) (not e!830709))))

(declare-fun b!1481050 () Bool)

(declare-fun e!830708 () Bool)

(assert (=> b!1481050 (= e!830708 e!830710)))

(declare-fun c!136827 () Bool)

(assert (=> b!1481050 (= c!136827 (validKeyInArray!0 (select (arr!47967 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!156255 () Bool)

(declare-fun res!1006436 () Bool)

(assert (=> d!156255 (=> res!1006436 e!830708)))

(assert (=> d!156255 (= res!1006436 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48517 a!2862)))))

(assert (=> d!156255 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687) e!830708)))

(assert (= (and d!156255 (not res!1006436)) b!1481050))

(assert (= (and b!1481050 c!136827) b!1481049))

(assert (= (and b!1481050 (not c!136827)) b!1481048))

(assert (= (and b!1481049 res!1006435) b!1481047))

(assert (= (or b!1481047 b!1481048) bm!67849))

(declare-fun m!1366817 () Bool)

(assert (=> bm!67849 m!1366817))

(assert (=> b!1481049 m!1366765))

(declare-fun m!1366819 () Bool)

(assert (=> b!1481049 m!1366819))

(declare-fun m!1366821 () Bool)

(assert (=> b!1481049 m!1366821))

(assert (=> b!1481049 m!1366765))

(declare-fun m!1366823 () Bool)

(assert (=> b!1481049 m!1366823))

(assert (=> b!1481050 m!1366765))

(assert (=> b!1481050 m!1366765))

(assert (=> b!1481050 m!1366767))

(assert (=> bm!67829 d!156255))

(declare-fun b!1481051 () Bool)

(declare-fun lt!646661 () SeekEntryResult!12207)

(assert (=> b!1481051 (and (bvsge (index!51222 lt!646661) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646661) (size!48517 lt!646388)))))

(declare-fun res!1006437 () Bool)

(assert (=> b!1481051 (= res!1006437 (= (select (arr!47967 lt!646388) (index!51222 lt!646661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830711 () Bool)

(assert (=> b!1481051 (=> res!1006437 e!830711)))

(declare-fun b!1481052 () Bool)

(assert (=> b!1481052 (and (bvsge (index!51222 lt!646661) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646661) (size!48517 lt!646388)))))

(declare-fun res!1006438 () Bool)

(assert (=> b!1481052 (= res!1006438 (= (select (arr!47967 lt!646388) (index!51222 lt!646661)) lt!646389))))

(assert (=> b!1481052 (=> res!1006438 e!830711)))

(declare-fun e!830713 () Bool)

(assert (=> b!1481052 (= e!830713 e!830711)))

(declare-fun d!156257 () Bool)

(declare-fun e!830714 () Bool)

(assert (=> d!156257 e!830714))

(declare-fun c!136829 () Bool)

(assert (=> d!156257 (= c!136829 (and ((_ is Intermediate!12207) lt!646661) (undefined!13019 lt!646661)))))

(declare-fun e!830712 () SeekEntryResult!12207)

(assert (=> d!156257 (= lt!646661 e!830712)))

(declare-fun c!136830 () Bool)

(assert (=> d!156257 (= c!136830 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646662 () (_ BitVec 64))

(assert (=> d!156257 (= lt!646662 (select (arr!47967 lt!646388) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156257 (validMask!0 mask!2687)))

(assert (=> d!156257 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646389 lt!646388 mask!2687) lt!646661)))

(declare-fun e!830715 () SeekEntryResult!12207)

(declare-fun b!1481053 () Bool)

(assert (=> b!1481053 (= e!830715 (Intermediate!12207 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1481054 () Bool)

(assert (=> b!1481054 (= e!830712 e!830715)))

(declare-fun c!136828 () Bool)

(assert (=> b!1481054 (= c!136828 (or (= lt!646662 lt!646389) (= (bvadd lt!646662 lt!646662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1481055 () Bool)

(assert (=> b!1481055 (= e!830714 (bvsge (x!132798 lt!646661) #b01111111111111111111111111111110))))

(declare-fun b!1481056 () Bool)

(assert (=> b!1481056 (= e!830715 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!646389 lt!646388 mask!2687))))

(declare-fun b!1481057 () Bool)

(assert (=> b!1481057 (and (bvsge (index!51222 lt!646661) #b00000000000000000000000000000000) (bvslt (index!51222 lt!646661) (size!48517 lt!646388)))))

(assert (=> b!1481057 (= e!830711 (= (select (arr!47967 lt!646388) (index!51222 lt!646661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1481058 () Bool)

(assert (=> b!1481058 (= e!830714 e!830713)))

(declare-fun res!1006439 () Bool)

(assert (=> b!1481058 (= res!1006439 (and ((_ is Intermediate!12207) lt!646661) (not (undefined!13019 lt!646661)) (bvslt (x!132798 lt!646661) #b01111111111111111111111111111110) (bvsge (x!132798 lt!646661) #b00000000000000000000000000000000) (bvsge (x!132798 lt!646661) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1481058 (=> (not res!1006439) (not e!830713))))

(declare-fun b!1481059 () Bool)

(assert (=> b!1481059 (= e!830712 (Intermediate!12207 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156257 c!136830) b!1481059))

(assert (= (and d!156257 (not c!136830)) b!1481054))

(assert (= (and b!1481054 c!136828) b!1481053))

(assert (= (and b!1481054 (not c!136828)) b!1481056))

(assert (= (and d!156257 c!136829) b!1481055))

(assert (= (and d!156257 (not c!136829)) b!1481058))

(assert (= (and b!1481058 res!1006439) b!1481052))

(assert (= (and b!1481052 (not res!1006438)) b!1481051))

(assert (= (and b!1481051 (not res!1006437)) b!1481057))

(assert (=> d!156257 m!1366323))

(assert (=> d!156257 m!1366813))

(assert (=> d!156257 m!1366193))

(declare-fun m!1366825 () Bool)

(assert (=> b!1481052 m!1366825))

(assert (=> b!1481056 m!1366323))

(assert (=> b!1481056 m!1366799))

(assert (=> b!1481056 m!1366799))

(declare-fun m!1366827 () Bool)

(assert (=> b!1481056 m!1366827))

(assert (=> b!1481051 m!1366825))

(assert (=> b!1481057 m!1366825))

(assert (=> b!1480620 d!156257))

(assert (=> b!1480620 d!156247))

(declare-fun d!156259 () Bool)

(declare-fun lt!646664 () SeekEntryResult!12207)

(assert (=> d!156259 (and (or ((_ is Undefined!12207) lt!646664) (not ((_ is Found!12207) lt!646664)) (and (bvsge (index!51221 lt!646664) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646664) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646664) ((_ is Found!12207) lt!646664) (not ((_ is MissingVacant!12207) lt!646664)) (not (= (index!51223 lt!646664) (index!51222 lt!646424))) (and (bvsge (index!51223 lt!646664) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646664) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646664) (ite ((_ is Found!12207) lt!646664) (= (select (arr!47967 a!2862) (index!51221 lt!646664)) (select (arr!47967 a!2862) j!93)) (and ((_ is MissingVacant!12207) lt!646664) (= (index!51223 lt!646664) (index!51222 lt!646424)) (= (select (arr!47967 a!2862) (index!51223 lt!646664)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830718 () SeekEntryResult!12207)

(assert (=> d!156259 (= lt!646664 e!830718)))

(declare-fun c!136833 () Bool)

(assert (=> d!156259 (= c!136833 (bvsge (x!132798 lt!646424) #b01111111111111111111111111111110))))

(declare-fun lt!646663 () (_ BitVec 64))

(assert (=> d!156259 (= lt!646663 (select (arr!47967 a!2862) (index!51222 lt!646424)))))

(assert (=> d!156259 (validMask!0 mask!2687)))

(assert (=> d!156259 (= (seekKeyOrZeroReturnVacant!0 (x!132798 lt!646424) (index!51222 lt!646424) (index!51222 lt!646424) (select (arr!47967 a!2862) j!93) a!2862 mask!2687) lt!646664)))

(declare-fun b!1481060 () Bool)

(assert (=> b!1481060 (= e!830718 Undefined!12207)))

(declare-fun b!1481061 () Bool)

(declare-fun e!830716 () SeekEntryResult!12207)

(assert (=> b!1481061 (= e!830716 (Found!12207 (index!51222 lt!646424)))))

(declare-fun b!1481062 () Bool)

(assert (=> b!1481062 (= e!830718 e!830716)))

(declare-fun c!136831 () Bool)

(assert (=> b!1481062 (= c!136831 (= lt!646663 (select (arr!47967 a!2862) j!93)))))

(declare-fun e!830717 () SeekEntryResult!12207)

(declare-fun b!1481063 () Bool)

(assert (=> b!1481063 (= e!830717 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132798 lt!646424) #b00000000000000000000000000000001) (nextIndex!0 (index!51222 lt!646424) (x!132798 lt!646424) mask!2687) (index!51222 lt!646424) (select (arr!47967 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1481064 () Bool)

(declare-fun c!136832 () Bool)

(assert (=> b!1481064 (= c!136832 (= lt!646663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481064 (= e!830716 e!830717)))

(declare-fun b!1481065 () Bool)

(assert (=> b!1481065 (= e!830717 (MissingVacant!12207 (index!51222 lt!646424)))))

(assert (= (and d!156259 c!136833) b!1481060))

(assert (= (and d!156259 (not c!136833)) b!1481062))

(assert (= (and b!1481062 c!136831) b!1481061))

(assert (= (and b!1481062 (not c!136831)) b!1481064))

(assert (= (and b!1481064 c!136832) b!1481065))

(assert (= (and b!1481064 (not c!136832)) b!1481063))

(declare-fun m!1366829 () Bool)

(assert (=> d!156259 m!1366829))

(declare-fun m!1366831 () Bool)

(assert (=> d!156259 m!1366831))

(assert (=> d!156259 m!1366293))

(assert (=> d!156259 m!1366193))

(declare-fun m!1366833 () Bool)

(assert (=> b!1481063 m!1366833))

(assert (=> b!1481063 m!1366833))

(assert (=> b!1481063 m!1366179))

(declare-fun m!1366835 () Bool)

(assert (=> b!1481063 m!1366835))

(assert (=> b!1480474 d!156259))

(assert (=> d!156043 d!156067))

(assert (=> b!1480508 d!156235))

(assert (=> d!156057 d!156055))

(declare-fun d!156261 () Bool)

(assert (=> d!156261 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(assert (=> d!156261 true))

(declare-fun _$72!161 () Unit!49754)

(assert (=> d!156261 (= (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) _$72!161)))

(declare-fun bs!42678 () Bool)

(assert (= bs!42678 d!156261))

(assert (=> bs!42678 m!1366211))

(assert (=> d!156057 d!156261))

(assert (=> d!156057 d!156067))

(declare-fun d!156263 () Bool)

(assert (=> d!156263 (arrayContainsKey!0 a!2862 lt!646493 #b00000000000000000000000000000000)))

(declare-fun lt!646665 () Unit!49754)

(assert (=> d!156263 (= lt!646665 (choose!13 a!2862 lt!646493 #b00000000000000000000000000000000))))

(assert (=> d!156263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!156263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646493 #b00000000000000000000000000000000) lt!646665)))

(declare-fun bs!42679 () Bool)

(assert (= bs!42679 d!156263))

(assert (=> bs!42679 m!1366387))

(declare-fun m!1366837 () Bool)

(assert (=> bs!42679 m!1366837))

(assert (=> b!1480632 d!156263))

(declare-fun d!156265 () Bool)

(declare-fun res!1006440 () Bool)

(declare-fun e!830719 () Bool)

(assert (=> d!156265 (=> res!1006440 e!830719)))

(assert (=> d!156265 (= res!1006440 (= (select (arr!47967 a!2862) #b00000000000000000000000000000000) lt!646493))))

(assert (=> d!156265 (= (arrayContainsKey!0 a!2862 lt!646493 #b00000000000000000000000000000000) e!830719)))

(declare-fun b!1481066 () Bool)

(declare-fun e!830720 () Bool)

(assert (=> b!1481066 (= e!830719 e!830720)))

(declare-fun res!1006441 () Bool)

(assert (=> b!1481066 (=> (not res!1006441) (not e!830720))))

(assert (=> b!1481066 (= res!1006441 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48517 a!2862)))))

(declare-fun b!1481067 () Bool)

(assert (=> b!1481067 (= e!830720 (arrayContainsKey!0 a!2862 lt!646493 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156265 (not res!1006440)) b!1481066))

(assert (= (and b!1481066 res!1006441) b!1481067))

(assert (=> d!156265 m!1366313))

(declare-fun m!1366839 () Bool)

(assert (=> b!1481067 m!1366839))

(assert (=> b!1480632 d!156265))

(declare-fun d!156267 () Bool)

(declare-fun lt!646668 () SeekEntryResult!12207)

(assert (=> d!156267 (and (or ((_ is Undefined!12207) lt!646668) (not ((_ is Found!12207) lt!646668)) (and (bvsge (index!51221 lt!646668) #b00000000000000000000000000000000) (bvslt (index!51221 lt!646668) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646668) ((_ is Found!12207) lt!646668) (not ((_ is MissingZero!12207) lt!646668)) (and (bvsge (index!51220 lt!646668) #b00000000000000000000000000000000) (bvslt (index!51220 lt!646668) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646668) ((_ is Found!12207) lt!646668) ((_ is MissingZero!12207) lt!646668) (not ((_ is MissingVacant!12207) lt!646668)) (and (bvsge (index!51223 lt!646668) #b00000000000000000000000000000000) (bvslt (index!51223 lt!646668) (size!48517 a!2862)))) (or ((_ is Undefined!12207) lt!646668) (ite ((_ is Found!12207) lt!646668) (= (select (arr!47967 a!2862) (index!51221 lt!646668)) (select (arr!47967 a!2862) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!12207) lt!646668) (= (select (arr!47967 a!2862) (index!51220 lt!646668)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12207) lt!646668) (= (select (arr!47967 a!2862) (index!51223 lt!646668)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830723 () SeekEntryResult!12207)

(assert (=> d!156267 (= lt!646668 e!830723)))

(declare-fun c!136834 () Bool)

(declare-fun lt!646667 () SeekEntryResult!12207)

(assert (=> d!156267 (= c!136834 (and ((_ is Intermediate!12207) lt!646667) (undefined!13019 lt!646667)))))

(assert (=> d!156267 (= lt!646667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000) mask!2687) (select (arr!47967 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(assert (=> d!156267 (validMask!0 mask!2687)))

(assert (=> d!156267 (= (seekEntryOrOpen!0 (select (arr!47967 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) lt!646668)))

(declare-fun b!1481068 () Bool)

(assert (=> b!1481068 (= e!830723 Undefined!12207)))

(declare-fun b!1481069 () Bool)

(declare-fun c!136835 () Bool)

(declare-fun lt!646666 () (_ BitVec 64))

(assert (=> b!1481069 (= c!136835 (= lt!646666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830721 () SeekEntryResult!12207)

(declare-fun e!830722 () SeekEntryResult!12207)

(assert (=> b!1481069 (= e!830721 e!830722)))

(declare-fun b!1481070 () Bool)

(assert (=> b!1481070 (= e!830723 e!830721)))

(assert (=> b!1481070 (= lt!646666 (select (arr!47967 a!2862) (index!51222 lt!646667)))))

(declare-fun c!136836 () Bool)

(assert (=> b!1481070 (= c!136836 (= lt!646666 (select (arr!47967 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1481071 () Bool)

(assert (=> b!1481071 (= e!830722 (seekKeyOrZeroReturnVacant!0 (x!132798 lt!646667) (index!51222 lt!646667) (index!51222 lt!646667) (select (arr!47967 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(declare-fun b!1481072 () Bool)

(assert (=> b!1481072 (= e!830721 (Found!12207 (index!51222 lt!646667)))))

(declare-fun b!1481073 () Bool)

(assert (=> b!1481073 (= e!830722 (MissingZero!12207 (index!51222 lt!646667)))))

(assert (= (and d!156267 c!136834) b!1481068))

(assert (= (and d!156267 (not c!136834)) b!1481070))

(assert (= (and b!1481070 c!136836) b!1481072))

(assert (= (and b!1481070 (not c!136836)) b!1481069))

(assert (= (and b!1481069 c!136835) b!1481073))

(assert (= (and b!1481069 (not c!136835)) b!1481071))

(declare-fun m!1366841 () Bool)

(assert (=> d!156267 m!1366841))

(assert (=> d!156267 m!1366313))

(declare-fun m!1366843 () Bool)

(assert (=> d!156267 m!1366843))

(assert (=> d!156267 m!1366313))

(assert (=> d!156267 m!1366841))

(declare-fun m!1366845 () Bool)

(assert (=> d!156267 m!1366845))

(assert (=> d!156267 m!1366193))

(declare-fun m!1366847 () Bool)

(assert (=> d!156267 m!1366847))

(declare-fun m!1366849 () Bool)

(assert (=> d!156267 m!1366849))

(declare-fun m!1366851 () Bool)

(assert (=> b!1481070 m!1366851))

(assert (=> b!1481071 m!1366313))

(declare-fun m!1366853 () Bool)

(assert (=> b!1481071 m!1366853))

(assert (=> b!1480632 d!156267))

(assert (=> b!1480633 d!156235))

(check-sat (not b!1481067) (not d!156257) (not d!156253) (not d!156263) (not d!156227) (not d!156259) (not b!1481050) (not bm!67848) (not b!1481056) (not b!1481018) (not b!1481049) (not d!156247) (not b!1481007) (not d!156229) (not b!1481009) (not b!1481044) (not b!1480998) (not b!1481063) (not d!156241) (not b!1481040) (not b!1481031) (not b!1481024) (not d!156231) (not b!1481071) (not b!1480990) (not b!1481025) (not d!156233) (not d!156261) (not d!156245) (not d!156267) (not b!1481010) (not d!156249) (not b!1481008) (not bm!67849) (not bm!67847) (not d!156239))
(check-sat)
