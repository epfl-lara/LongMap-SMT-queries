; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126268 () Bool)

(assert start!126268)

(declare-fun res!1006138 () Bool)

(declare-fun e!830286 () Bool)

(assert (=> start!126268 (=> (not res!1006138) (not e!830286))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126268 (= res!1006138 (validMask!0 mask!2687))))

(assert (=> start!126268 e!830286))

(assert (=> start!126268 true))

(declare-datatypes ((array!99374 0))(
  ( (array!99375 (arr!47966 (Array (_ BitVec 32) (_ BitVec 64))) (size!48516 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99374)

(declare-fun array_inv!36994 (array!99374) Bool)

(assert (=> start!126268 (array_inv!36994 a!2862)))

(declare-fun b!1480313 () Bool)

(declare-fun res!1006144 () Bool)

(assert (=> b!1480313 (=> (not res!1006144) (not e!830286))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480313 (= res!1006144 (validKeyInArray!0 (select (arr!47966 a!2862) j!93)))))

(declare-fun b!1480314 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12206 0))(
  ( (MissingZero!12206 (index!51216 (_ BitVec 32))) (Found!12206 (index!51217 (_ BitVec 32))) (Intermediate!12206 (undefined!13018 Bool) (index!51218 (_ BitVec 32)) (x!132797 (_ BitVec 32))) (Undefined!12206) (MissingVacant!12206 (index!51219 (_ BitVec 32))) )
))
(declare-fun lt!646370 () SeekEntryResult!12206)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646374 () (_ BitVec 64))

(declare-fun e!830287 () Bool)

(declare-fun lt!646371 () array!99374)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99374 (_ BitVec 32)) SeekEntryResult!12206)

(assert (=> b!1480314 (= e!830287 (= lt!646370 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646374 lt!646371 mask!2687)))))

(declare-fun b!1480315 () Bool)

(declare-fun e!830282 () Bool)

(assert (=> b!1480315 (= e!830286 e!830282)))

(declare-fun res!1006141 () Bool)

(assert (=> b!1480315 (=> (not res!1006141) (not e!830282))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480315 (= res!1006141 (= (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480315 (= lt!646371 (array!99375 (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48516 a!2862)))))

(declare-fun b!1480316 () Bool)

(declare-fun e!830285 () Bool)

(assert (=> b!1480316 (= e!830282 e!830285)))

(declare-fun res!1006140 () Bool)

(assert (=> b!1480316 (=> (not res!1006140) (not e!830285))))

(declare-fun lt!646373 () SeekEntryResult!12206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480316 (= res!1006140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646373))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480316 (= lt!646373 (Intermediate!12206 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480317 () Bool)

(declare-fun e!830284 () Bool)

(assert (=> b!1480317 (= e!830285 e!830284)))

(declare-fun res!1006134 () Bool)

(assert (=> b!1480317 (=> (not res!1006134) (not e!830284))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480317 (= res!1006134 (= lt!646370 (Intermediate!12206 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480317 (= lt!646370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646374 mask!2687) lt!646374 lt!646371 mask!2687))))

(assert (=> b!1480317 (= lt!646374 (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480318 () Bool)

(declare-fun res!1006133 () Bool)

(assert (=> b!1480318 (=> (not res!1006133) (not e!830286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99374 (_ BitVec 32)) Bool)

(assert (=> b!1480318 (= res!1006133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480319 () Bool)

(declare-fun res!1006135 () Bool)

(assert (=> b!1480319 (=> (not res!1006135) (not e!830286))))

(assert (=> b!1480319 (= res!1006135 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48516 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48516 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48516 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480320 () Bool)

(declare-fun res!1006142 () Bool)

(assert (=> b!1480320 (=> (not res!1006142) (not e!830286))))

(declare-datatypes ((List!34467 0))(
  ( (Nil!34464) (Cons!34463 (h!35831 (_ BitVec 64)) (t!49161 List!34467)) )
))
(declare-fun arrayNoDuplicates!0 (array!99374 (_ BitVec 32) List!34467) Bool)

(assert (=> b!1480320 (= res!1006142 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34464))))

(declare-fun b!1480321 () Bool)

(declare-fun res!1006139 () Bool)

(assert (=> b!1480321 (=> (not res!1006139) (not e!830285))))

(assert (=> b!1480321 (= res!1006139 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646373))))

(declare-fun b!1480322 () Bool)

(declare-fun res!1006136 () Bool)

(assert (=> b!1480322 (=> (not res!1006136) (not e!830284))))

(assert (=> b!1480322 (= res!1006136 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480323 () Bool)

(declare-fun res!1006132 () Bool)

(assert (=> b!1480323 (=> (not res!1006132) (not e!830284))))

(assert (=> b!1480323 (= res!1006132 e!830287)))

(declare-fun c!136611 () Bool)

(assert (=> b!1480323 (= c!136611 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480324 () Bool)

(declare-fun res!1006130 () Bool)

(assert (=> b!1480324 (=> (not res!1006130) (not e!830286))))

(assert (=> b!1480324 (= res!1006130 (validKeyInArray!0 (select (arr!47966 a!2862) i!1006)))))

(declare-fun b!1480325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99374 (_ BitVec 32)) SeekEntryResult!12206)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99374 (_ BitVec 32)) SeekEntryResult!12206)

(assert (=> b!1480325 (= e!830287 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646374 lt!646371 mask!2687) (seekEntryOrOpen!0 lt!646374 lt!646371 mask!2687)))))

(declare-fun b!1480326 () Bool)

(assert (=> b!1480326 (= e!830284 (not (or (and (= (select (arr!47966 a!2862) index!646) (select (store (arr!47966 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47966 a!2862) index!646) (select (arr!47966 a!2862) j!93))) (= (select (arr!47966 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun e!830283 () Bool)

(assert (=> b!1480326 e!830283))

(declare-fun res!1006137 () Bool)

(assert (=> b!1480326 (=> (not res!1006137) (not e!830283))))

(assert (=> b!1480326 (= res!1006137 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49752 0))(
  ( (Unit!49753) )
))
(declare-fun lt!646372 () Unit!49752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49752)

(assert (=> b!1480326 (= lt!646372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480327 () Bool)

(assert (=> b!1480327 (= e!830283 (or (= (select (arr!47966 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47966 a!2862) intermediateBeforeIndex!19) (select (arr!47966 a!2862) j!93))))))

(declare-fun b!1480328 () Bool)

(declare-fun res!1006143 () Bool)

(assert (=> b!1480328 (=> (not res!1006143) (not e!830283))))

(assert (=> b!1480328 (= res!1006143 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) (Found!12206 j!93)))))

(declare-fun b!1480329 () Bool)

(declare-fun res!1006131 () Bool)

(assert (=> b!1480329 (=> (not res!1006131) (not e!830286))))

(assert (=> b!1480329 (= res!1006131 (and (= (size!48516 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48516 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48516 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126268 res!1006138) b!1480329))

(assert (= (and b!1480329 res!1006131) b!1480324))

(assert (= (and b!1480324 res!1006130) b!1480313))

(assert (= (and b!1480313 res!1006144) b!1480318))

(assert (= (and b!1480318 res!1006133) b!1480320))

(assert (= (and b!1480320 res!1006142) b!1480319))

(assert (= (and b!1480319 res!1006135) b!1480315))

(assert (= (and b!1480315 res!1006141) b!1480316))

(assert (= (and b!1480316 res!1006140) b!1480321))

(assert (= (and b!1480321 res!1006139) b!1480317))

(assert (= (and b!1480317 res!1006134) b!1480323))

(assert (= (and b!1480323 c!136611) b!1480314))

(assert (= (and b!1480323 (not c!136611)) b!1480325))

(assert (= (and b!1480323 res!1006132) b!1480322))

(assert (= (and b!1480322 res!1006136) b!1480326))

(assert (= (and b!1480326 res!1006137) b!1480328))

(assert (= (and b!1480328 res!1006143) b!1480327))

(declare-fun m!1366129 () Bool)

(assert (=> b!1480321 m!1366129))

(assert (=> b!1480321 m!1366129))

(declare-fun m!1366131 () Bool)

(assert (=> b!1480321 m!1366131))

(declare-fun m!1366133 () Bool)

(assert (=> b!1480327 m!1366133))

(assert (=> b!1480327 m!1366129))

(declare-fun m!1366135 () Bool)

(assert (=> start!126268 m!1366135))

(declare-fun m!1366137 () Bool)

(assert (=> start!126268 m!1366137))

(assert (=> b!1480316 m!1366129))

(assert (=> b!1480316 m!1366129))

(declare-fun m!1366139 () Bool)

(assert (=> b!1480316 m!1366139))

(assert (=> b!1480316 m!1366139))

(assert (=> b!1480316 m!1366129))

(declare-fun m!1366141 () Bool)

(assert (=> b!1480316 m!1366141))

(declare-fun m!1366143 () Bool)

(assert (=> b!1480314 m!1366143))

(declare-fun m!1366145 () Bool)

(assert (=> b!1480315 m!1366145))

(declare-fun m!1366147 () Bool)

(assert (=> b!1480315 m!1366147))

(declare-fun m!1366149 () Bool)

(assert (=> b!1480318 m!1366149))

(declare-fun m!1366151 () Bool)

(assert (=> b!1480325 m!1366151))

(declare-fun m!1366153 () Bool)

(assert (=> b!1480325 m!1366153))

(declare-fun m!1366155 () Bool)

(assert (=> b!1480317 m!1366155))

(assert (=> b!1480317 m!1366155))

(declare-fun m!1366157 () Bool)

(assert (=> b!1480317 m!1366157))

(assert (=> b!1480317 m!1366145))

(declare-fun m!1366159 () Bool)

(assert (=> b!1480317 m!1366159))

(declare-fun m!1366161 () Bool)

(assert (=> b!1480324 m!1366161))

(assert (=> b!1480324 m!1366161))

(declare-fun m!1366163 () Bool)

(assert (=> b!1480324 m!1366163))

(assert (=> b!1480313 m!1366129))

(assert (=> b!1480313 m!1366129))

(declare-fun m!1366165 () Bool)

(assert (=> b!1480313 m!1366165))

(declare-fun m!1366167 () Bool)

(assert (=> b!1480326 m!1366167))

(assert (=> b!1480326 m!1366145))

(declare-fun m!1366169 () Bool)

(assert (=> b!1480326 m!1366169))

(declare-fun m!1366171 () Bool)

(assert (=> b!1480326 m!1366171))

(declare-fun m!1366173 () Bool)

(assert (=> b!1480326 m!1366173))

(assert (=> b!1480326 m!1366129))

(declare-fun m!1366175 () Bool)

(assert (=> b!1480320 m!1366175))

(assert (=> b!1480328 m!1366129))

(assert (=> b!1480328 m!1366129))

(declare-fun m!1366177 () Bool)

(assert (=> b!1480328 m!1366177))

(push 1)

(assert (not start!126268))

(assert (not b!1480314))

(assert (not b!1480325))

(assert (not b!1480318))

(assert (not b!1480326))

(assert (not b!1480317))

(assert (not b!1480328))

(assert (not b!1480324))

(assert (not b!1480320))

(assert (not b!1480321))

(assert (not b!1480313))

(assert (not b!1480316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1480558 () Bool)

(declare-fun e!830409 () Bool)

(declare-fun e!830408 () Bool)

(assert (=> b!1480558 (= e!830409 e!830408)))

(declare-fun res!1006272 () Bool)

(declare-fun lt!646454 () SeekEntryResult!12206)

(assert (=> b!1480558 (= res!1006272 (and (is-Intermediate!12206 lt!646454) (not (undefined!13018 lt!646454)) (bvslt (x!132797 lt!646454) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646454) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646454) #b00000000000000000000000000000000)))))

(assert (=> b!1480558 (=> (not res!1006272) (not e!830408))))

(declare-fun b!1480559 () Bool)

(assert (=> b!1480559 (and (bvsge (index!51218 lt!646454) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646454) (size!48516 a!2862)))))

(declare-fun e!830407 () Bool)

(assert (=> b!1480559 (= e!830407 (= (select (arr!47966 a!2862) (index!51218 lt!646454)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830406 () SeekEntryResult!12206)

(declare-fun b!1480560 () Bool)

(assert (=> b!1480560 (= e!830406 (Intermediate!12206 false (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480561 () Bool)

(assert (=> b!1480561 (and (bvsge (index!51218 lt!646454) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646454) (size!48516 a!2862)))))

(declare-fun res!1006273 () Bool)

(assert (=> b!1480561 (= res!1006273 (= (select (arr!47966 a!2862) (index!51218 lt!646454)) (select (arr!47966 a!2862) j!93)))))

(assert (=> b!1480561 (=> res!1006273 e!830407)))

(assert (=> b!1480561 (= e!830408 e!830407)))

(declare-fun d!156059 () Bool)

(assert (=> d!156059 e!830409))

(declare-fun c!136663 () Bool)

(assert (=> d!156059 (= c!136663 (and (is-Intermediate!12206 lt!646454) (undefined!13018 lt!646454)))))

(declare-fun e!830405 () SeekEntryResult!12206)

(assert (=> d!156059 (= lt!646454 e!830405)))

(declare-fun c!136665 () Bool)

(assert (=> d!156059 (= c!136665 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646455 () (_ BitVec 64))

(assert (=> d!156059 (= lt!646455 (select (arr!47966 a!2862) (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687)))))

(assert (=> d!156059 (validMask!0 mask!2687)))

(assert (=> d!156059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646454)))

(declare-fun b!1480562 () Bool)

(assert (=> b!1480562 (and (bvsge (index!51218 lt!646454) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646454) (size!48516 a!2862)))))

(declare-fun res!1006274 () Bool)

(assert (=> b!1480562 (= res!1006274 (= (select (arr!47966 a!2862) (index!51218 lt!646454)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480562 (=> res!1006274 e!830407)))

(declare-fun b!1480563 () Bool)

(assert (=> b!1480563 (= e!830405 e!830406)))

(declare-fun c!136664 () Bool)

(assert (=> b!1480563 (= c!136664 (or (= lt!646455 (select (arr!47966 a!2862) j!93)) (= (bvadd lt!646455 lt!646455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480564 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480564 (= e!830406 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480565 () Bool)

(assert (=> b!1480565 (= e!830409 (bvsge (x!132797 lt!646454) #b01111111111111111111111111111110))))

(declare-fun b!1480566 () Bool)

(assert (=> b!1480566 (= e!830405 (Intermediate!12206 true (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156059 c!136665) b!1480566))

(assert (= (and d!156059 (not c!136665)) b!1480563))

(assert (= (and b!1480563 c!136664) b!1480560))

(assert (= (and b!1480563 (not c!136664)) b!1480564))

(assert (= (and d!156059 c!136663) b!1480565))

(assert (= (and d!156059 (not c!136663)) b!1480558))

(assert (= (and b!1480558 res!1006272) b!1480561))

(assert (= (and b!1480561 (not res!1006273)) b!1480562))

(assert (= (and b!1480562 (not res!1006274)) b!1480559))

(assert (=> b!1480564 m!1366139))

(declare-fun m!1366337 () Bool)

(assert (=> b!1480564 m!1366337))

(assert (=> b!1480564 m!1366337))

(assert (=> b!1480564 m!1366129))

(declare-fun m!1366339 () Bool)

(assert (=> b!1480564 m!1366339))

(declare-fun m!1366341 () Bool)

(assert (=> b!1480559 m!1366341))

(assert (=> d!156059 m!1366139))

(declare-fun m!1366343 () Bool)

(assert (=> d!156059 m!1366343))

(assert (=> d!156059 m!1366135))

(assert (=> b!1480561 m!1366341))

(assert (=> b!1480562 m!1366341))

(assert (=> b!1480316 d!156059))

(declare-fun d!156075 () Bool)

(declare-fun lt!646461 () (_ BitVec 32))

(declare-fun lt!646460 () (_ BitVec 32))

(assert (=> d!156075 (= lt!646461 (bvmul (bvxor lt!646460 (bvlshr lt!646460 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156075 (= lt!646460 ((_ extract 31 0) (bvand (bvxor (select (arr!47966 a!2862) j!93) (bvlshr (select (arr!47966 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156075 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006275 (let ((h!35835 ((_ extract 31 0) (bvand (bvxor (select (arr!47966 a!2862) j!93) (bvlshr (select (arr!47966 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132804 (bvmul (bvxor h!35835 (bvlshr h!35835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132804 (bvlshr x!132804 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006275 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006275 #b00000000000000000000000000000000))))))

(assert (=> d!156075 (= (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) (bvand (bvxor lt!646461 (bvlshr lt!646461 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480316 d!156075))

(declare-fun bm!67828 () Bool)

(declare-fun call!67831 () Bool)

(assert (=> bm!67828 (= call!67831 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156077 () Bool)

(declare-fun res!1006280 () Bool)

(declare-fun e!830430 () Bool)

(assert (=> d!156077 (=> res!1006280 e!830430)))

(assert (=> d!156077 (= res!1006280 (bvsge j!93 (size!48516 a!2862)))))

(assert (=> d!156077 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!830430)))

(declare-fun b!1480599 () Bool)

(declare-fun e!830428 () Bool)

(declare-fun e!830429 () Bool)

(assert (=> b!1480599 (= e!830428 e!830429)))

(declare-fun lt!646479 () (_ BitVec 64))

(assert (=> b!1480599 (= lt!646479 (select (arr!47966 a!2862) j!93))))

(declare-fun lt!646480 () Unit!49752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99374 (_ BitVec 64) (_ BitVec 32)) Unit!49752)

(assert (=> b!1480599 (= lt!646480 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646479 j!93))))

(declare-fun arrayContainsKey!0 (array!99374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1480599 (arrayContainsKey!0 a!2862 lt!646479 #b00000000000000000000000000000000)))

(declare-fun lt!646478 () Unit!49752)

(assert (=> b!1480599 (= lt!646478 lt!646480)))

(declare-fun res!1006281 () Bool)

(assert (=> b!1480599 (= res!1006281 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) (Found!12206 j!93)))))

(assert (=> b!1480599 (=> (not res!1006281) (not e!830429))))

(declare-fun b!1480600 () Bool)

(assert (=> b!1480600 (= e!830429 call!67831)))

(declare-fun b!1480601 () Bool)

(assert (=> b!1480601 (= e!830428 call!67831)))

(declare-fun b!1480602 () Bool)

(assert (=> b!1480602 (= e!830430 e!830428)))

(declare-fun c!136680 () Bool)

(assert (=> b!1480602 (= c!136680 (validKeyInArray!0 (select (arr!47966 a!2862) j!93)))))

(assert (= (and d!156077 (not res!1006280)) b!1480602))

(assert (= (and b!1480602 c!136680) b!1480599))

(assert (= (and b!1480602 (not c!136680)) b!1480601))

(assert (= (and b!1480599 res!1006281) b!1480600))

(assert (= (or b!1480600 b!1480601) bm!67828))

(declare-fun m!1366345 () Bool)

(assert (=> bm!67828 m!1366345))

(assert (=> b!1480599 m!1366129))

(declare-fun m!1366347 () Bool)

(assert (=> b!1480599 m!1366347))

(declare-fun m!1366349 () Bool)

(assert (=> b!1480599 m!1366349))

(assert (=> b!1480599 m!1366129))

(assert (=> b!1480599 m!1366177))

(assert (=> b!1480602 m!1366129))

(assert (=> b!1480602 m!1366129))

(assert (=> b!1480602 m!1366165))

(assert (=> b!1480326 d!156077))

(declare-fun d!156079 () Bool)

(assert (=> d!156079 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646496 () Unit!49752)

(declare-fun choose!38 (array!99374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49752)

(assert (=> d!156079 (= lt!646496 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156079 (validMask!0 mask!2687)))

(assert (=> d!156079 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!646496)))

(declare-fun bs!42660 () Bool)

(assert (= bs!42660 d!156079))

(assert (=> bs!42660 m!1366173))

(declare-fun m!1366391 () Bool)

(assert (=> bs!42660 m!1366391))

(assert (=> bs!42660 m!1366135))

(assert (=> b!1480326 d!156079))

(declare-fun b!1480658 () Bool)

(declare-fun c!136705 () Bool)

(declare-fun lt!646514 () (_ BitVec 64))

(assert (=> b!1480658 (= c!136705 (= lt!646514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830463 () SeekEntryResult!12206)

(declare-fun e!830465 () SeekEntryResult!12206)

(assert (=> b!1480658 (= e!830463 e!830465)))

(declare-fun b!1480659 () Bool)

(assert (=> b!1480659 (= e!830463 (Found!12206 index!646))))

(declare-fun d!156089 () Bool)

(declare-fun lt!646513 () SeekEntryResult!12206)

(assert (=> d!156089 (and (or (is-Undefined!12206 lt!646513) (not (is-Found!12206 lt!646513)) (and (bvsge (index!51217 lt!646513) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646513) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646513) (is-Found!12206 lt!646513) (not (is-MissingVacant!12206 lt!646513)) (not (= (index!51219 lt!646513) intermediateAfterIndex!19)) (and (bvsge (index!51219 lt!646513) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646513) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646513) (ite (is-Found!12206 lt!646513) (= (select (arr!47966 lt!646371) (index!51217 lt!646513)) lt!646374) (and (is-MissingVacant!12206 lt!646513) (= (index!51219 lt!646513) intermediateAfterIndex!19) (= (select (arr!47966 lt!646371) (index!51219 lt!646513)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830464 () SeekEntryResult!12206)

(assert (=> d!156089 (= lt!646513 e!830464)))

(declare-fun c!136703 () Bool)

(assert (=> d!156089 (= c!136703 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156089 (= lt!646514 (select (arr!47966 lt!646371) index!646))))

(assert (=> d!156089 (validMask!0 mask!2687)))

(assert (=> d!156089 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646374 lt!646371 mask!2687) lt!646513)))

(declare-fun b!1480660 () Bool)

(assert (=> b!1480660 (= e!830465 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480661 () Bool)

(assert (=> b!1480661 (= e!830464 e!830463)))

(declare-fun c!136704 () Bool)

(assert (=> b!1480661 (= c!136704 (= lt!646514 lt!646374))))

(declare-fun b!1480662 () Bool)

(assert (=> b!1480662 (= e!830465 (MissingVacant!12206 intermediateAfterIndex!19))))

(declare-fun b!1480663 () Bool)

(assert (=> b!1480663 (= e!830464 Undefined!12206)))

(assert (= (and d!156089 c!136703) b!1480663))

(assert (= (and d!156089 (not c!136703)) b!1480661))

(assert (= (and b!1480661 c!136704) b!1480659))

(assert (= (and b!1480661 (not c!136704)) b!1480658))

(assert (= (and b!1480658 c!136705) b!1480662))

(assert (= (and b!1480658 (not c!136705)) b!1480660))

(declare-fun m!1366401 () Bool)

(assert (=> d!156089 m!1366401))

(declare-fun m!1366403 () Bool)

(assert (=> d!156089 m!1366403))

(declare-fun m!1366405 () Bool)

(assert (=> d!156089 m!1366405))

(assert (=> d!156089 m!1366135))

(declare-fun m!1366407 () Bool)

(assert (=> b!1480660 m!1366407))

(assert (=> b!1480660 m!1366407))

(declare-fun m!1366409 () Bool)

(assert (=> b!1480660 m!1366409))

(assert (=> b!1480325 d!156089))

(declare-fun b!1480676 () Bool)

(declare-fun e!830474 () SeekEntryResult!12206)

(declare-fun lt!646521 () SeekEntryResult!12206)

(assert (=> b!1480676 (= e!830474 (Found!12206 (index!51218 lt!646521)))))

(declare-fun e!830473 () SeekEntryResult!12206)

(declare-fun b!1480677 () Bool)

(assert (=> b!1480677 (= e!830473 (seekKeyOrZeroReturnVacant!0 (x!132797 lt!646521) (index!51218 lt!646521) (index!51218 lt!646521) lt!646374 lt!646371 mask!2687))))

(declare-fun d!156095 () Bool)

(declare-fun lt!646523 () SeekEntryResult!12206)

(assert (=> d!156095 (and (or (is-Undefined!12206 lt!646523) (not (is-Found!12206 lt!646523)) (and (bvsge (index!51217 lt!646523) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646523) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646523) (is-Found!12206 lt!646523) (not (is-MissingZero!12206 lt!646523)) (and (bvsge (index!51216 lt!646523) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646523) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646523) (is-Found!12206 lt!646523) (is-MissingZero!12206 lt!646523) (not (is-MissingVacant!12206 lt!646523)) (and (bvsge (index!51219 lt!646523) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646523) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646523) (ite (is-Found!12206 lt!646523) (= (select (arr!47966 lt!646371) (index!51217 lt!646523)) lt!646374) (ite (is-MissingZero!12206 lt!646523) (= (select (arr!47966 lt!646371) (index!51216 lt!646523)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12206 lt!646523) (= (select (arr!47966 lt!646371) (index!51219 lt!646523)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830472 () SeekEntryResult!12206)

(assert (=> d!156095 (= lt!646523 e!830472)))

(declare-fun c!136714 () Bool)

(assert (=> d!156095 (= c!136714 (and (is-Intermediate!12206 lt!646521) (undefined!13018 lt!646521)))))

(assert (=> d!156095 (= lt!646521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646374 mask!2687) lt!646374 lt!646371 mask!2687))))

(assert (=> d!156095 (validMask!0 mask!2687)))

(assert (=> d!156095 (= (seekEntryOrOpen!0 lt!646374 lt!646371 mask!2687) lt!646523)))

(declare-fun b!1480678 () Bool)

(assert (=> b!1480678 (= e!830472 Undefined!12206)))

(declare-fun b!1480679 () Bool)

(assert (=> b!1480679 (= e!830473 (MissingZero!12206 (index!51218 lt!646521)))))

(declare-fun b!1480680 () Bool)

(declare-fun c!136712 () Bool)

(declare-fun lt!646522 () (_ BitVec 64))

(assert (=> b!1480680 (= c!136712 (= lt!646522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480680 (= e!830474 e!830473)))

(declare-fun b!1480681 () Bool)

(assert (=> b!1480681 (= e!830472 e!830474)))

(assert (=> b!1480681 (= lt!646522 (select (arr!47966 lt!646371) (index!51218 lt!646521)))))

(declare-fun c!136713 () Bool)

(assert (=> b!1480681 (= c!136713 (= lt!646522 lt!646374))))

(assert (= (and d!156095 c!136714) b!1480678))

(assert (= (and d!156095 (not c!136714)) b!1480681))

(assert (= (and b!1480681 c!136713) b!1480676))

(assert (= (and b!1480681 (not c!136713)) b!1480680))

(assert (= (and b!1480680 c!136712) b!1480679))

(assert (= (and b!1480680 (not c!136712)) b!1480677))

(declare-fun m!1366411 () Bool)

(assert (=> b!1480677 m!1366411))

(assert (=> d!156095 m!1366155))

(assert (=> d!156095 m!1366157))

(declare-fun m!1366413 () Bool)

(assert (=> d!156095 m!1366413))

(assert (=> d!156095 m!1366135))

(declare-fun m!1366415 () Bool)

(assert (=> d!156095 m!1366415))

(assert (=> d!156095 m!1366155))

(declare-fun m!1366417 () Bool)

(assert (=> d!156095 m!1366417))

(declare-fun m!1366419 () Bool)

(assert (=> b!1480681 m!1366419))

(assert (=> b!1480325 d!156095))

(declare-fun b!1480686 () Bool)

(declare-fun e!830481 () Bool)

(declare-fun e!830480 () Bool)

(assert (=> b!1480686 (= e!830481 e!830480)))

(declare-fun res!1006293 () Bool)

(declare-fun lt!646528 () SeekEntryResult!12206)

(assert (=> b!1480686 (= res!1006293 (and (is-Intermediate!12206 lt!646528) (not (undefined!13018 lt!646528)) (bvslt (x!132797 lt!646528) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646528) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646528) x!665)))))

(assert (=> b!1480686 (=> (not res!1006293) (not e!830480))))

(declare-fun b!1480687 () Bool)

(assert (=> b!1480687 (and (bvsge (index!51218 lt!646528) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646528) (size!48516 lt!646371)))))

(declare-fun e!830479 () Bool)

(assert (=> b!1480687 (= e!830479 (= (select (arr!47966 lt!646371) (index!51218 lt!646528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480688 () Bool)

(declare-fun e!830478 () SeekEntryResult!12206)

(assert (=> b!1480688 (= e!830478 (Intermediate!12206 false index!646 x!665))))

(declare-fun b!1480689 () Bool)

(assert (=> b!1480689 (and (bvsge (index!51218 lt!646528) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646528) (size!48516 lt!646371)))))

(declare-fun res!1006294 () Bool)

(assert (=> b!1480689 (= res!1006294 (= (select (arr!47966 lt!646371) (index!51218 lt!646528)) lt!646374))))

(assert (=> b!1480689 (=> res!1006294 e!830479)))

(assert (=> b!1480689 (= e!830480 e!830479)))

(declare-fun d!156101 () Bool)

(assert (=> d!156101 e!830481))

(declare-fun c!136717 () Bool)

(assert (=> d!156101 (= c!136717 (and (is-Intermediate!12206 lt!646528) (undefined!13018 lt!646528)))))

(declare-fun e!830477 () SeekEntryResult!12206)

(assert (=> d!156101 (= lt!646528 e!830477)))

(declare-fun c!136719 () Bool)

(assert (=> d!156101 (= c!136719 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646529 () (_ BitVec 64))

(assert (=> d!156101 (= lt!646529 (select (arr!47966 lt!646371) index!646))))

(assert (=> d!156101 (validMask!0 mask!2687)))

(assert (=> d!156101 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646374 lt!646371 mask!2687) lt!646528)))

(declare-fun b!1480690 () Bool)

(assert (=> b!1480690 (and (bvsge (index!51218 lt!646528) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646528) (size!48516 lt!646371)))))

(declare-fun res!1006295 () Bool)

(assert (=> b!1480690 (= res!1006295 (= (select (arr!47966 lt!646371) (index!51218 lt!646528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480690 (=> res!1006295 e!830479)))

(declare-fun b!1480691 () Bool)

(assert (=> b!1480691 (= e!830477 e!830478)))

(declare-fun c!136718 () Bool)

(assert (=> b!1480691 (= c!136718 (or (= lt!646529 lt!646374) (= (bvadd lt!646529 lt!646529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480692 () Bool)

(assert (=> b!1480692 (= e!830478 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480693 () Bool)

(assert (=> b!1480693 (= e!830481 (bvsge (x!132797 lt!646528) #b01111111111111111111111111111110))))

(declare-fun b!1480694 () Bool)

(assert (=> b!1480694 (= e!830477 (Intermediate!12206 true index!646 x!665))))

(assert (= (and d!156101 c!136719) b!1480694))

(assert (= (and d!156101 (not c!136719)) b!1480691))

(assert (= (and b!1480691 c!136718) b!1480688))

(assert (= (and b!1480691 (not c!136718)) b!1480692))

(assert (= (and d!156101 c!136717) b!1480693))

(assert (= (and d!156101 (not c!136717)) b!1480686))

(assert (= (and b!1480686 res!1006293) b!1480689))

(assert (= (and b!1480689 (not res!1006294)) b!1480690))

(assert (= (and b!1480690 (not res!1006295)) b!1480687))

(assert (=> b!1480692 m!1366407))

(assert (=> b!1480692 m!1366407))

(declare-fun m!1366421 () Bool)

(assert (=> b!1480692 m!1366421))

(declare-fun m!1366423 () Bool)

(assert (=> b!1480687 m!1366423))

(assert (=> d!156101 m!1366405))

(assert (=> d!156101 m!1366135))

(assert (=> b!1480689 m!1366423))

(assert (=> b!1480690 m!1366423))

(assert (=> b!1480314 d!156101))

(declare-fun bm!67833 () Bool)

(declare-fun call!67836 () Bool)

(assert (=> bm!67833 (= call!67836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156103 () Bool)

(declare-fun res!1006296 () Bool)

(declare-fun e!830486 () Bool)

(assert (=> d!156103 (=> res!1006296 e!830486)))

(assert (=> d!156103 (= res!1006296 (bvsge #b00000000000000000000000000000000 (size!48516 a!2862)))))

(assert (=> d!156103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!830486)))

(declare-fun b!1480702 () Bool)

(declare-fun e!830484 () Bool)

(declare-fun e!830485 () Bool)

(assert (=> b!1480702 (= e!830484 e!830485)))

(declare-fun lt!646531 () (_ BitVec 64))

(assert (=> b!1480702 (= lt!646531 (select (arr!47966 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!646532 () Unit!49752)

(assert (=> b!1480702 (= lt!646532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646531 #b00000000000000000000000000000000))))

(assert (=> b!1480702 (arrayContainsKey!0 a!2862 lt!646531 #b00000000000000000000000000000000)))

(declare-fun lt!646530 () Unit!49752)

(assert (=> b!1480702 (= lt!646530 lt!646532)))

(declare-fun res!1006297 () Bool)

(assert (=> b!1480702 (= res!1006297 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12206 #b00000000000000000000000000000000)))))

(assert (=> b!1480702 (=> (not res!1006297) (not e!830485))))

(declare-fun b!1480703 () Bool)

(assert (=> b!1480703 (= e!830485 call!67836)))

(declare-fun b!1480704 () Bool)

(assert (=> b!1480704 (= e!830484 call!67836)))

(declare-fun b!1480705 () Bool)

(assert (=> b!1480705 (= e!830486 e!830484)))

(declare-fun c!136722 () Bool)

(assert (=> b!1480705 (= c!136722 (validKeyInArray!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156103 (not res!1006296)) b!1480705))

(assert (= (and b!1480705 c!136722) b!1480702))

(assert (= (and b!1480705 (not c!136722)) b!1480704))

(assert (= (and b!1480702 res!1006297) b!1480703))

(assert (= (or b!1480703 b!1480704) bm!67833))

(declare-fun m!1366425 () Bool)

(assert (=> bm!67833 m!1366425))

(declare-fun m!1366427 () Bool)

(assert (=> b!1480702 m!1366427))

(declare-fun m!1366429 () Bool)

(assert (=> b!1480702 m!1366429))

(declare-fun m!1366431 () Bool)

(assert (=> b!1480702 m!1366431))

(assert (=> b!1480702 m!1366427))

(declare-fun m!1366433 () Bool)

(assert (=> b!1480702 m!1366433))

(assert (=> b!1480705 m!1366427))

(assert (=> b!1480705 m!1366427))

(declare-fun m!1366435 () Bool)

(assert (=> b!1480705 m!1366435))

(assert (=> b!1480318 d!156103))

(declare-fun b!1480713 () Bool)

(declare-fun e!830497 () Bool)

(declare-fun e!830496 () Bool)

(assert (=> b!1480713 (= e!830497 e!830496)))

(declare-fun res!1006304 () Bool)

(declare-fun lt!646533 () SeekEntryResult!12206)

(assert (=> b!1480713 (= res!1006304 (and (is-Intermediate!12206 lt!646533) (not (undefined!13018 lt!646533)) (bvslt (x!132797 lt!646533) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646533) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646533) #b00000000000000000000000000000000)))))

(assert (=> b!1480713 (=> (not res!1006304) (not e!830496))))

(declare-fun b!1480714 () Bool)

(assert (=> b!1480714 (and (bvsge (index!51218 lt!646533) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646533) (size!48516 lt!646371)))))

(declare-fun e!830495 () Bool)

(assert (=> b!1480714 (= e!830495 (= (select (arr!47966 lt!646371) (index!51218 lt!646533)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480715 () Bool)

(declare-fun e!830494 () SeekEntryResult!12206)

(assert (=> b!1480715 (= e!830494 (Intermediate!12206 false (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480716 () Bool)

(assert (=> b!1480716 (and (bvsge (index!51218 lt!646533) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646533) (size!48516 lt!646371)))))

(declare-fun res!1006305 () Bool)

(assert (=> b!1480716 (= res!1006305 (= (select (arr!47966 lt!646371) (index!51218 lt!646533)) lt!646374))))

(assert (=> b!1480716 (=> res!1006305 e!830495)))

(assert (=> b!1480716 (= e!830496 e!830495)))

(declare-fun d!156105 () Bool)

(assert (=> d!156105 e!830497))

(declare-fun c!136725 () Bool)

(assert (=> d!156105 (= c!136725 (and (is-Intermediate!12206 lt!646533) (undefined!13018 lt!646533)))))

(declare-fun e!830493 () SeekEntryResult!12206)

(assert (=> d!156105 (= lt!646533 e!830493)))

(declare-fun c!136727 () Bool)

(assert (=> d!156105 (= c!136727 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646534 () (_ BitVec 64))

(assert (=> d!156105 (= lt!646534 (select (arr!47966 lt!646371) (toIndex!0 lt!646374 mask!2687)))))

(assert (=> d!156105 (validMask!0 mask!2687)))

(assert (=> d!156105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646374 mask!2687) lt!646374 lt!646371 mask!2687) lt!646533)))

(declare-fun b!1480717 () Bool)

(assert (=> b!1480717 (and (bvsge (index!51218 lt!646533) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646533) (size!48516 lt!646371)))))

(declare-fun res!1006306 () Bool)

(assert (=> b!1480717 (= res!1006306 (= (select (arr!47966 lt!646371) (index!51218 lt!646533)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480717 (=> res!1006306 e!830495)))

(declare-fun b!1480718 () Bool)

(assert (=> b!1480718 (= e!830493 e!830494)))

(declare-fun c!136726 () Bool)

(assert (=> b!1480718 (= c!136726 (or (= lt!646534 lt!646374) (= (bvadd lt!646534 lt!646534) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480719 () Bool)

(assert (=> b!1480719 (= e!830494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480720 () Bool)

(assert (=> b!1480720 (= e!830497 (bvsge (x!132797 lt!646533) #b01111111111111111111111111111110))))

(declare-fun b!1480721 () Bool)

(assert (=> b!1480721 (= e!830493 (Intermediate!12206 true (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156105 c!136727) b!1480721))

(assert (= (and d!156105 (not c!136727)) b!1480718))

(assert (= (and b!1480718 c!136726) b!1480715))

(assert (= (and b!1480718 (not c!136726)) b!1480719))

(assert (= (and d!156105 c!136725) b!1480720))

(assert (= (and d!156105 (not c!136725)) b!1480713))

(assert (= (and b!1480713 res!1006304) b!1480716))

(assert (= (and b!1480716 (not res!1006305)) b!1480717))

(assert (= (and b!1480717 (not res!1006306)) b!1480714))

(assert (=> b!1480719 m!1366155))

(declare-fun m!1366437 () Bool)

(assert (=> b!1480719 m!1366437))

(assert (=> b!1480719 m!1366437))

(declare-fun m!1366439 () Bool)

(assert (=> b!1480719 m!1366439))

(declare-fun m!1366441 () Bool)

(assert (=> b!1480714 m!1366441))

(assert (=> d!156105 m!1366155))

(declare-fun m!1366443 () Bool)

(assert (=> d!156105 m!1366443))

(assert (=> d!156105 m!1366135))

(assert (=> b!1480716 m!1366441))

(assert (=> b!1480717 m!1366441))

(assert (=> b!1480317 d!156105))

(declare-fun d!156107 () Bool)

(declare-fun lt!646536 () (_ BitVec 32))

(declare-fun lt!646535 () (_ BitVec 32))

(assert (=> d!156107 (= lt!646536 (bvmul (bvxor lt!646535 (bvlshr lt!646535 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156107 (= lt!646535 ((_ extract 31 0) (bvand (bvxor lt!646374 (bvlshr lt!646374 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156107 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006275 (let ((h!35835 ((_ extract 31 0) (bvand (bvxor lt!646374 (bvlshr lt!646374 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132804 (bvmul (bvxor h!35835 (bvlshr h!35835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132804 (bvlshr x!132804 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006275 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006275 #b00000000000000000000000000000000))))))

(assert (=> d!156107 (= (toIndex!0 lt!646374 mask!2687) (bvand (bvxor lt!646536 (bvlshr lt!646536 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480317 d!156107))

(declare-fun b!1480722 () Bool)

(declare-fun e!830500 () SeekEntryResult!12206)

(declare-fun lt!646537 () SeekEntryResult!12206)

(assert (=> b!1480722 (= e!830500 (Found!12206 (index!51218 lt!646537)))))

(declare-fun b!1480723 () Bool)

(declare-fun e!830499 () SeekEntryResult!12206)

(assert (=> b!1480723 (= e!830499 (seekKeyOrZeroReturnVacant!0 (x!132797 lt!646537) (index!51218 lt!646537) (index!51218 lt!646537) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156109 () Bool)

(declare-fun lt!646539 () SeekEntryResult!12206)

(assert (=> d!156109 (and (or (is-Undefined!12206 lt!646539) (not (is-Found!12206 lt!646539)) (and (bvsge (index!51217 lt!646539) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646539) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646539) (is-Found!12206 lt!646539) (not (is-MissingZero!12206 lt!646539)) (and (bvsge (index!51216 lt!646539) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646539) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646539) (is-Found!12206 lt!646539) (is-MissingZero!12206 lt!646539) (not (is-MissingVacant!12206 lt!646539)) (and (bvsge (index!51219 lt!646539) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646539) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646539) (ite (is-Found!12206 lt!646539) (= (select (arr!47966 a!2862) (index!51217 lt!646539)) (select (arr!47966 a!2862) j!93)) (ite (is-MissingZero!12206 lt!646539) (= (select (arr!47966 a!2862) (index!51216 lt!646539)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12206 lt!646539) (= (select (arr!47966 a!2862) (index!51219 lt!646539)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830498 () SeekEntryResult!12206)

(assert (=> d!156109 (= lt!646539 e!830498)))

(declare-fun c!136730 () Bool)

(assert (=> d!156109 (= c!136730 (and (is-Intermediate!12206 lt!646537) (undefined!13018 lt!646537)))))

(assert (=> d!156109 (= lt!646537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156109 (validMask!0 mask!2687)))

(assert (=> d!156109 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646539)))

(declare-fun b!1480724 () Bool)

(assert (=> b!1480724 (= e!830498 Undefined!12206)))

(declare-fun b!1480725 () Bool)

(assert (=> b!1480725 (= e!830499 (MissingZero!12206 (index!51218 lt!646537)))))

(declare-fun b!1480726 () Bool)

(declare-fun c!136728 () Bool)

(declare-fun lt!646538 () (_ BitVec 64))

(assert (=> b!1480726 (= c!136728 (= lt!646538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480726 (= e!830500 e!830499)))

(declare-fun b!1480727 () Bool)

(assert (=> b!1480727 (= e!830498 e!830500)))

(assert (=> b!1480727 (= lt!646538 (select (arr!47966 a!2862) (index!51218 lt!646537)))))

(declare-fun c!136729 () Bool)

(assert (=> b!1480727 (= c!136729 (= lt!646538 (select (arr!47966 a!2862) j!93)))))

(assert (= (and d!156109 c!136730) b!1480724))

(assert (= (and d!156109 (not c!136730)) b!1480727))

(assert (= (and b!1480727 c!136729) b!1480722))

(assert (= (and b!1480727 (not c!136729)) b!1480726))

(assert (= (and b!1480726 c!136728) b!1480725))

(assert (= (and b!1480726 (not c!136728)) b!1480723))

(assert (=> b!1480723 m!1366129))

(declare-fun m!1366445 () Bool)

(assert (=> b!1480723 m!1366445))

(assert (=> d!156109 m!1366139))

(assert (=> d!156109 m!1366129))

(assert (=> d!156109 m!1366141))

(declare-fun m!1366447 () Bool)

(assert (=> d!156109 m!1366447))

(assert (=> d!156109 m!1366135))

(declare-fun m!1366449 () Bool)

(assert (=> d!156109 m!1366449))

(assert (=> d!156109 m!1366129))

(assert (=> d!156109 m!1366139))

(declare-fun m!1366451 () Bool)

(assert (=> d!156109 m!1366451))

(declare-fun m!1366453 () Bool)

(assert (=> b!1480727 m!1366453))

(assert (=> b!1480328 d!156109))

(declare-fun b!1480728 () Bool)

(declare-fun e!830505 () Bool)

(declare-fun e!830504 () Bool)

(assert (=> b!1480728 (= e!830505 e!830504)))

(declare-fun res!1006307 () Bool)

(declare-fun lt!646540 () SeekEntryResult!12206)

(assert (=> b!1480728 (= res!1006307 (and (is-Intermediate!12206 lt!646540) (not (undefined!13018 lt!646540)) (bvslt (x!132797 lt!646540) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646540) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646540) x!665)))))

(assert (=> b!1480728 (=> (not res!1006307) (not e!830504))))

(declare-fun b!1480729 () Bool)

(assert (=> b!1480729 (and (bvsge (index!51218 lt!646540) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646540) (size!48516 a!2862)))))

(declare-fun e!830503 () Bool)

(assert (=> b!1480729 (= e!830503 (= (select (arr!47966 a!2862) (index!51218 lt!646540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480730 () Bool)

(declare-fun e!830502 () SeekEntryResult!12206)

(assert (=> b!1480730 (= e!830502 (Intermediate!12206 false index!646 x!665))))

(declare-fun b!1480731 () Bool)

(assert (=> b!1480731 (and (bvsge (index!51218 lt!646540) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646540) (size!48516 a!2862)))))

(declare-fun res!1006308 () Bool)

(assert (=> b!1480731 (= res!1006308 (= (select (arr!47966 a!2862) (index!51218 lt!646540)) (select (arr!47966 a!2862) j!93)))))

(assert (=> b!1480731 (=> res!1006308 e!830503)))

(assert (=> b!1480731 (= e!830504 e!830503)))

(declare-fun d!156111 () Bool)

(assert (=> d!156111 e!830505))

(declare-fun c!136731 () Bool)

(assert (=> d!156111 (= c!136731 (and (is-Intermediate!12206 lt!646540) (undefined!13018 lt!646540)))))

(declare-fun e!830501 () SeekEntryResult!12206)

(assert (=> d!156111 (= lt!646540 e!830501)))

(declare-fun c!136733 () Bool)

(assert (=> d!156111 (= c!136733 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646541 () (_ BitVec 64))

(assert (=> d!156111 (= lt!646541 (select (arr!47966 a!2862) index!646))))

(assert (=> d!156111 (validMask!0 mask!2687)))

(assert (=> d!156111 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646540)))

(declare-fun b!1480732 () Bool)

(assert (=> b!1480732 (and (bvsge (index!51218 lt!646540) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646540) (size!48516 a!2862)))))

(declare-fun res!1006309 () Bool)

(assert (=> b!1480732 (= res!1006309 (= (select (arr!47966 a!2862) (index!51218 lt!646540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480732 (=> res!1006309 e!830503)))

(declare-fun b!1480733 () Bool)

(assert (=> b!1480733 (= e!830501 e!830502)))

(declare-fun c!136732 () Bool)

(assert (=> b!1480733 (= c!136732 (or (= lt!646541 (select (arr!47966 a!2862) j!93)) (= (bvadd lt!646541 lt!646541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480734 () Bool)

(assert (=> b!1480734 (= e!830502 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480735 () Bool)

(assert (=> b!1480735 (= e!830505 (bvsge (x!132797 lt!646540) #b01111111111111111111111111111110))))

(declare-fun b!1480736 () Bool)

(assert (=> b!1480736 (= e!830501 (Intermediate!12206 true index!646 x!665))))

(assert (= (and d!156111 c!136733) b!1480736))

(assert (= (and d!156111 (not c!136733)) b!1480733))

(assert (= (and b!1480733 c!136732) b!1480730))

(assert (= (and b!1480733 (not c!136732)) b!1480734))

(assert (= (and d!156111 c!136731) b!1480735))

(assert (= (and d!156111 (not c!136731)) b!1480728))

(assert (= (and b!1480728 res!1006307) b!1480731))

(assert (= (and b!1480731 (not res!1006308)) b!1480732))

(assert (= (and b!1480732 (not res!1006309)) b!1480729))

(assert (=> b!1480734 m!1366407))

(assert (=> b!1480734 m!1366407))

(assert (=> b!1480734 m!1366129))

(declare-fun m!1366455 () Bool)

(assert (=> b!1480734 m!1366455))

(declare-fun m!1366457 () Bool)

(assert (=> b!1480729 m!1366457))

(assert (=> d!156111 m!1366171))

(assert (=> d!156111 m!1366135))

(assert (=> b!1480731 m!1366457))

(assert (=> b!1480732 m!1366457))

(assert (=> b!1480321 d!156111))

(declare-fun b!1480776 () Bool)

(declare-fun e!830534 () Bool)

(declare-fun contains!9912 (List!34467 (_ BitVec 64)) Bool)

(assert (=> b!1480776 (= e!830534 (contains!9912 Nil!34464 (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480777 () Bool)

(declare-fun e!830533 () Bool)

(declare-fun call!67840 () Bool)

(assert (=> b!1480777 (= e!830533 call!67840)))

(declare-fun b!1480778 () Bool)

(assert (=> b!1480778 (= e!830533 call!67840)))

(declare-fun b!1480779 () Bool)

(declare-fun e!830535 () Bool)

(assert (=> b!1480779 (= e!830535 e!830533)))

(declare-fun c!136745 () Bool)

(assert (=> b!1480779 (= c!136745 (validKeyInArray!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480780 () Bool)

(declare-fun e!830536 () Bool)

(assert (=> b!1480780 (= e!830536 e!830535)))

(declare-fun res!1006328 () Bool)

(assert (=> b!1480780 (=> (not res!1006328) (not e!830535))))

(assert (=> b!1480780 (= res!1006328 (not e!830534))))

(declare-fun res!1006329 () Bool)

(assert (=> b!1480780 (=> (not res!1006329) (not e!830534))))

(assert (=> b!1480780 (= res!1006329 (validKeyInArray!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156113 () Bool)

(declare-fun res!1006327 () Bool)

(assert (=> d!156113 (=> res!1006327 e!830536)))

(assert (=> d!156113 (= res!1006327 (bvsge #b00000000000000000000000000000000 (size!48516 a!2862)))))

(assert (=> d!156113 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34464) e!830536)))

(declare-fun bm!67837 () Bool)

(assert (=> bm!67837 (= call!67840 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136745 (Cons!34463 (select (arr!47966 a!2862) #b00000000000000000000000000000000) Nil!34464) Nil!34464)))))

(assert (= (and d!156113 (not res!1006327)) b!1480780))

(assert (= (and b!1480780 res!1006329) b!1480776))

(assert (= (and b!1480780 res!1006328) b!1480779))

(assert (= (and b!1480779 c!136745) b!1480778))

(assert (= (and b!1480779 (not c!136745)) b!1480777))

(assert (= (or b!1480778 b!1480777) bm!67837))

(assert (=> b!1480776 m!1366427))

(assert (=> b!1480776 m!1366427))

(declare-fun m!1366485 () Bool)

(assert (=> b!1480776 m!1366485))

(assert (=> b!1480779 m!1366427))

(assert (=> b!1480779 m!1366427))

(assert (=> b!1480779 m!1366435))

(assert (=> b!1480780 m!1366427))

(assert (=> b!1480780 m!1366427))

(assert (=> b!1480780 m!1366435))

(assert (=> bm!67837 m!1366427))

(declare-fun m!1366487 () Bool)

(assert (=> bm!67837 m!1366487))

(assert (=> b!1480320 d!156113))

(declare-fun d!156121 () Bool)

(assert (=> d!156121 (= (validKeyInArray!0 (select (arr!47966 a!2862) j!93)) (and (not (= (select (arr!47966 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47966 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480313 d!156121))

(declare-fun d!156123 () Bool)

(assert (=> d!156123 (= (validKeyInArray!0 (select (arr!47966 a!2862) i!1006)) (and (not (= (select (arr!47966 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47966 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480324 d!156123))

(declare-fun d!156125 () Bool)

(assert (=> d!156125 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126268 d!156125))

(declare-fun d!156135 () Bool)

(assert (=> d!156135 (= (array_inv!36994 a!2862) (bvsge (size!48516 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126268 d!156135))

(push 1)

(assert (not bm!67828))

(assert (not b!1480702))

(assert (not d!156059))

(assert (not b!1480723))

(assert (not d!156101))

(assert (not b!1480692))

(assert (not b!1480599))

(assert (not b!1480719))

(assert (not b!1480780))

(assert (not b!1480660))

(assert (not d!156105))

(assert (not b!1480779))

(assert (not b!1480564))

(assert (not b!1480705))

(assert (not b!1480602))

(assert (not bm!67833))

(assert (not d!156111))

(assert (not d!156089))

(assert (not b!1480734))

(assert (not d!156109))

(assert (not bm!67837))

(assert (not b!1480677))

(assert (not b!1480776))

(assert (not d!156079))

(assert (not d!156095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!156059 d!156125))

(assert (=> d!156079 d!156077))

(declare-fun d!156143 () Bool)

(assert (=> d!156143 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(assert (=> d!156143 true))

(declare-fun _$72!155 () Unit!49752)

(assert (=> d!156143 (= (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) _$72!155)))

(declare-fun bs!42662 () Bool)

(assert (= bs!42662 d!156143))

(assert (=> bs!42662 m!1366173))

(assert (=> d!156079 d!156143))

(assert (=> d!156079 d!156125))

(assert (=> d!156105 d!156125))

(declare-fun b!1480813 () Bool)

(declare-fun e!830557 () Bool)

(assert (=> b!1480813 (= e!830557 (contains!9912 (ite c!136745 (Cons!34463 (select (arr!47966 a!2862) #b00000000000000000000000000000000) Nil!34464) Nil!34464) (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480814 () Bool)

(declare-fun e!830556 () Bool)

(declare-fun call!67844 () Bool)

(assert (=> b!1480814 (= e!830556 call!67844)))

(declare-fun b!1480815 () Bool)

(assert (=> b!1480815 (= e!830556 call!67844)))

(declare-fun b!1480816 () Bool)

(declare-fun e!830558 () Bool)

(assert (=> b!1480816 (= e!830558 e!830556)))

(declare-fun c!136756 () Bool)

(assert (=> b!1480816 (= c!136756 (validKeyInArray!0 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480817 () Bool)

(declare-fun e!830559 () Bool)

(assert (=> b!1480817 (= e!830559 e!830558)))

(declare-fun res!1006344 () Bool)

(assert (=> b!1480817 (=> (not res!1006344) (not e!830558))))

(assert (=> b!1480817 (= res!1006344 (not e!830557))))

(declare-fun res!1006345 () Bool)

(assert (=> b!1480817 (=> (not res!1006345) (not e!830557))))

(assert (=> b!1480817 (= res!1006345 (validKeyInArray!0 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!156145 () Bool)

(declare-fun res!1006343 () Bool)

(assert (=> d!156145 (=> res!1006343 e!830559)))

(assert (=> d!156145 (= res!1006343 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48516 a!2862)))))

(assert (=> d!156145 (= (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136745 (Cons!34463 (select (arr!47966 a!2862) #b00000000000000000000000000000000) Nil!34464) Nil!34464)) e!830559)))

(declare-fun bm!67841 () Bool)

(assert (=> bm!67841 (= call!67844 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!136756 (Cons!34463 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!136745 (Cons!34463 (select (arr!47966 a!2862) #b00000000000000000000000000000000) Nil!34464) Nil!34464)) (ite c!136745 (Cons!34463 (select (arr!47966 a!2862) #b00000000000000000000000000000000) Nil!34464) Nil!34464))))))

(assert (= (and d!156145 (not res!1006343)) b!1480817))

(assert (= (and b!1480817 res!1006345) b!1480813))

(assert (= (and b!1480817 res!1006344) b!1480816))

(assert (= (and b!1480816 c!136756) b!1480815))

(assert (= (and b!1480816 (not c!136756)) b!1480814))

(assert (= (or b!1480815 b!1480814) bm!67841))

(declare-fun m!1366513 () Bool)

(assert (=> b!1480813 m!1366513))

(assert (=> b!1480813 m!1366513))

(declare-fun m!1366515 () Bool)

(assert (=> b!1480813 m!1366515))

(assert (=> b!1480816 m!1366513))

(assert (=> b!1480816 m!1366513))

(declare-fun m!1366517 () Bool)

(assert (=> b!1480816 m!1366517))

(assert (=> b!1480817 m!1366513))

(assert (=> b!1480817 m!1366513))

(assert (=> b!1480817 m!1366517))

(assert (=> bm!67841 m!1366513))

(declare-fun m!1366519 () Bool)

(assert (=> bm!67841 m!1366519))

(assert (=> bm!67837 d!156145))

(assert (=> d!156089 d!156125))

(declare-fun b!1480818 () Bool)

(declare-fun c!136759 () Bool)

(declare-fun lt!646565 () (_ BitVec 64))

(assert (=> b!1480818 (= c!136759 (= lt!646565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830560 () SeekEntryResult!12206)

(declare-fun e!830562 () SeekEntryResult!12206)

(assert (=> b!1480818 (= e!830560 e!830562)))

(declare-fun b!1480819 () Bool)

(assert (=> b!1480819 (= e!830560 (Found!12206 (index!51218 lt!646537)))))

(declare-fun d!156147 () Bool)

(declare-fun lt!646564 () SeekEntryResult!12206)

(assert (=> d!156147 (and (or (is-Undefined!12206 lt!646564) (not (is-Found!12206 lt!646564)) (and (bvsge (index!51217 lt!646564) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646564) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646564) (is-Found!12206 lt!646564) (not (is-MissingVacant!12206 lt!646564)) (not (= (index!51219 lt!646564) (index!51218 lt!646537))) (and (bvsge (index!51219 lt!646564) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646564) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646564) (ite (is-Found!12206 lt!646564) (= (select (arr!47966 a!2862) (index!51217 lt!646564)) (select (arr!47966 a!2862) j!93)) (and (is-MissingVacant!12206 lt!646564) (= (index!51219 lt!646564) (index!51218 lt!646537)) (= (select (arr!47966 a!2862) (index!51219 lt!646564)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830561 () SeekEntryResult!12206)

(assert (=> d!156147 (= lt!646564 e!830561)))

(declare-fun c!136757 () Bool)

(assert (=> d!156147 (= c!136757 (bvsge (x!132797 lt!646537) #b01111111111111111111111111111110))))

(assert (=> d!156147 (= lt!646565 (select (arr!47966 a!2862) (index!51218 lt!646537)))))

(assert (=> d!156147 (validMask!0 mask!2687)))

(assert (=> d!156147 (= (seekKeyOrZeroReturnVacant!0 (x!132797 lt!646537) (index!51218 lt!646537) (index!51218 lt!646537) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646564)))

(declare-fun b!1480820 () Bool)

(assert (=> b!1480820 (= e!830562 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132797 lt!646537) #b00000000000000000000000000000001) (nextIndex!0 (index!51218 lt!646537) (x!132797 lt!646537) mask!2687) (index!51218 lt!646537) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480821 () Bool)

(assert (=> b!1480821 (= e!830561 e!830560)))

(declare-fun c!136758 () Bool)

(assert (=> b!1480821 (= c!136758 (= lt!646565 (select (arr!47966 a!2862) j!93)))))

(declare-fun b!1480822 () Bool)

(assert (=> b!1480822 (= e!830562 (MissingVacant!12206 (index!51218 lt!646537)))))

(declare-fun b!1480823 () Bool)

(assert (=> b!1480823 (= e!830561 Undefined!12206)))

(assert (= (and d!156147 c!136757) b!1480823))

(assert (= (and d!156147 (not c!136757)) b!1480821))

(assert (= (and b!1480821 c!136758) b!1480819))

(assert (= (and b!1480821 (not c!136758)) b!1480818))

(assert (= (and b!1480818 c!136759) b!1480822))

(assert (= (and b!1480818 (not c!136759)) b!1480820))

(declare-fun m!1366521 () Bool)

(assert (=> d!156147 m!1366521))

(declare-fun m!1366523 () Bool)

(assert (=> d!156147 m!1366523))

(assert (=> d!156147 m!1366453))

(assert (=> d!156147 m!1366135))

(declare-fun m!1366525 () Bool)

(assert (=> b!1480820 m!1366525))

(assert (=> b!1480820 m!1366525))

(assert (=> b!1480820 m!1366129))

(declare-fun m!1366527 () Bool)

(assert (=> b!1480820 m!1366527))

(assert (=> b!1480723 d!156147))

(declare-fun b!1480824 () Bool)

(declare-fun c!136762 () Bool)

(declare-fun lt!646567 () (_ BitVec 64))

(assert (=> b!1480824 (= c!136762 (= lt!646567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830563 () SeekEntryResult!12206)

(declare-fun e!830565 () SeekEntryResult!12206)

(assert (=> b!1480824 (= e!830563 e!830565)))

(declare-fun b!1480825 () Bool)

(assert (=> b!1480825 (= e!830563 (Found!12206 (index!51218 lt!646521)))))

(declare-fun d!156149 () Bool)

(declare-fun lt!646566 () SeekEntryResult!12206)

(assert (=> d!156149 (and (or (is-Undefined!12206 lt!646566) (not (is-Found!12206 lt!646566)) (and (bvsge (index!51217 lt!646566) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646566) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646566) (is-Found!12206 lt!646566) (not (is-MissingVacant!12206 lt!646566)) (not (= (index!51219 lt!646566) (index!51218 lt!646521))) (and (bvsge (index!51219 lt!646566) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646566) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646566) (ite (is-Found!12206 lt!646566) (= (select (arr!47966 lt!646371) (index!51217 lt!646566)) lt!646374) (and (is-MissingVacant!12206 lt!646566) (= (index!51219 lt!646566) (index!51218 lt!646521)) (= (select (arr!47966 lt!646371) (index!51219 lt!646566)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830564 () SeekEntryResult!12206)

(assert (=> d!156149 (= lt!646566 e!830564)))

(declare-fun c!136760 () Bool)

(assert (=> d!156149 (= c!136760 (bvsge (x!132797 lt!646521) #b01111111111111111111111111111110))))

(assert (=> d!156149 (= lt!646567 (select (arr!47966 lt!646371) (index!51218 lt!646521)))))

(assert (=> d!156149 (validMask!0 mask!2687)))

(assert (=> d!156149 (= (seekKeyOrZeroReturnVacant!0 (x!132797 lt!646521) (index!51218 lt!646521) (index!51218 lt!646521) lt!646374 lt!646371 mask!2687) lt!646566)))

(declare-fun b!1480826 () Bool)

(assert (=> b!1480826 (= e!830565 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132797 lt!646521) #b00000000000000000000000000000001) (nextIndex!0 (index!51218 lt!646521) (x!132797 lt!646521) mask!2687) (index!51218 lt!646521) lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480827 () Bool)

(assert (=> b!1480827 (= e!830564 e!830563)))

(declare-fun c!136761 () Bool)

(assert (=> b!1480827 (= c!136761 (= lt!646567 lt!646374))))

(declare-fun b!1480828 () Bool)

(assert (=> b!1480828 (= e!830565 (MissingVacant!12206 (index!51218 lt!646521)))))

(declare-fun b!1480829 () Bool)

(assert (=> b!1480829 (= e!830564 Undefined!12206)))

(assert (= (and d!156149 c!136760) b!1480829))

(assert (= (and d!156149 (not c!136760)) b!1480827))

(assert (= (and b!1480827 c!136761) b!1480825))

(assert (= (and b!1480827 (not c!136761)) b!1480824))

(assert (= (and b!1480824 c!136762) b!1480828))

(assert (= (and b!1480824 (not c!136762)) b!1480826))

(declare-fun m!1366529 () Bool)

(assert (=> d!156149 m!1366529))

(declare-fun m!1366531 () Bool)

(assert (=> d!156149 m!1366531))

(assert (=> d!156149 m!1366419))

(assert (=> d!156149 m!1366135))

(declare-fun m!1366533 () Bool)

(assert (=> b!1480826 m!1366533))

(assert (=> b!1480826 m!1366533))

(declare-fun m!1366535 () Bool)

(assert (=> b!1480826 m!1366535))

(assert (=> b!1480677 d!156149))

(declare-fun d!156151 () Bool)

(assert (=> d!156151 (arrayContainsKey!0 a!2862 lt!646531 #b00000000000000000000000000000000)))

(declare-fun lt!646570 () Unit!49752)

(declare-fun choose!13 (array!99374 (_ BitVec 64) (_ BitVec 32)) Unit!49752)

(assert (=> d!156151 (= lt!646570 (choose!13 a!2862 lt!646531 #b00000000000000000000000000000000))))

(assert (=> d!156151 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!156151 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646531 #b00000000000000000000000000000000) lt!646570)))

(declare-fun bs!42663 () Bool)

(assert (= bs!42663 d!156151))

(assert (=> bs!42663 m!1366431))

(declare-fun m!1366537 () Bool)

(assert (=> bs!42663 m!1366537))

(assert (=> b!1480702 d!156151))

(declare-fun d!156153 () Bool)

(declare-fun res!1006350 () Bool)

(declare-fun e!830570 () Bool)

(assert (=> d!156153 (=> res!1006350 e!830570)))

(assert (=> d!156153 (= res!1006350 (= (select (arr!47966 a!2862) #b00000000000000000000000000000000) lt!646531))))

(assert (=> d!156153 (= (arrayContainsKey!0 a!2862 lt!646531 #b00000000000000000000000000000000) e!830570)))

(declare-fun b!1480834 () Bool)

(declare-fun e!830571 () Bool)

(assert (=> b!1480834 (= e!830570 e!830571)))

(declare-fun res!1006351 () Bool)

(assert (=> b!1480834 (=> (not res!1006351) (not e!830571))))

(assert (=> b!1480834 (= res!1006351 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48516 a!2862)))))

(declare-fun b!1480835 () Bool)

(assert (=> b!1480835 (= e!830571 (arrayContainsKey!0 a!2862 lt!646531 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156153 (not res!1006350)) b!1480834))

(assert (= (and b!1480834 res!1006351) b!1480835))

(assert (=> d!156153 m!1366427))

(declare-fun m!1366539 () Bool)

(assert (=> b!1480835 m!1366539))

(assert (=> b!1480702 d!156153))

(declare-fun b!1480836 () Bool)

(declare-fun e!830574 () SeekEntryResult!12206)

(declare-fun lt!646571 () SeekEntryResult!12206)

(assert (=> b!1480836 (= e!830574 (Found!12206 (index!51218 lt!646571)))))

(declare-fun b!1480837 () Bool)

(declare-fun e!830573 () SeekEntryResult!12206)

(assert (=> b!1480837 (= e!830573 (seekKeyOrZeroReturnVacant!0 (x!132797 lt!646571) (index!51218 lt!646571) (index!51218 lt!646571) (select (arr!47966 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(declare-fun d!156155 () Bool)

(declare-fun lt!646573 () SeekEntryResult!12206)

(assert (=> d!156155 (and (or (is-Undefined!12206 lt!646573) (not (is-Found!12206 lt!646573)) (and (bvsge (index!51217 lt!646573) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646573) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646573) (is-Found!12206 lt!646573) (not (is-MissingZero!12206 lt!646573)) (and (bvsge (index!51216 lt!646573) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646573) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646573) (is-Found!12206 lt!646573) (is-MissingZero!12206 lt!646573) (not (is-MissingVacant!12206 lt!646573)) (and (bvsge (index!51219 lt!646573) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646573) (size!48516 a!2862)))) (or (is-Undefined!12206 lt!646573) (ite (is-Found!12206 lt!646573) (= (select (arr!47966 a!2862) (index!51217 lt!646573)) (select (arr!47966 a!2862) #b00000000000000000000000000000000)) (ite (is-MissingZero!12206 lt!646573) (= (select (arr!47966 a!2862) (index!51216 lt!646573)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12206 lt!646573) (= (select (arr!47966 a!2862) (index!51219 lt!646573)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!830572 () SeekEntryResult!12206)

(assert (=> d!156155 (= lt!646573 e!830572)))

(declare-fun c!136765 () Bool)

(assert (=> d!156155 (= c!136765 (and (is-Intermediate!12206 lt!646571) (undefined!13018 lt!646571)))))

(assert (=> d!156155 (= lt!646571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000) mask!2687) (select (arr!47966 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(assert (=> d!156155 (validMask!0 mask!2687)))

(assert (=> d!156155 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) lt!646573)))

(declare-fun b!1480838 () Bool)

(assert (=> b!1480838 (= e!830572 Undefined!12206)))

(declare-fun b!1480839 () Bool)

(assert (=> b!1480839 (= e!830573 (MissingZero!12206 (index!51218 lt!646571)))))

(declare-fun b!1480840 () Bool)

(declare-fun c!136763 () Bool)

(declare-fun lt!646572 () (_ BitVec 64))

(assert (=> b!1480840 (= c!136763 (= lt!646572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480840 (= e!830574 e!830573)))

(declare-fun b!1480841 () Bool)

(assert (=> b!1480841 (= e!830572 e!830574)))

(assert (=> b!1480841 (= lt!646572 (select (arr!47966 a!2862) (index!51218 lt!646571)))))

(declare-fun c!136764 () Bool)

(assert (=> b!1480841 (= c!136764 (= lt!646572 (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156155 c!136765) b!1480838))

(assert (= (and d!156155 (not c!136765)) b!1480841))

(assert (= (and b!1480841 c!136764) b!1480836))

(assert (= (and b!1480841 (not c!136764)) b!1480840))

(assert (= (and b!1480840 c!136763) b!1480839))

(assert (= (and b!1480840 (not c!136763)) b!1480837))

(assert (=> b!1480837 m!1366427))

(declare-fun m!1366541 () Bool)

(assert (=> b!1480837 m!1366541))

(declare-fun m!1366543 () Bool)

(assert (=> d!156155 m!1366543))

(assert (=> d!156155 m!1366427))

(declare-fun m!1366545 () Bool)

(assert (=> d!156155 m!1366545))

(declare-fun m!1366547 () Bool)

(assert (=> d!156155 m!1366547))

(assert (=> d!156155 m!1366135))

(declare-fun m!1366549 () Bool)

(assert (=> d!156155 m!1366549))

(assert (=> d!156155 m!1366427))

(assert (=> d!156155 m!1366543))

(declare-fun m!1366551 () Bool)

(assert (=> d!156155 m!1366551))

(declare-fun m!1366553 () Bool)

(assert (=> b!1480841 m!1366553))

(assert (=> b!1480702 d!156155))

(declare-fun bm!67842 () Bool)

(declare-fun call!67845 () Bool)

(assert (=> bm!67842 (= call!67845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156157 () Bool)

(declare-fun res!1006352 () Bool)

(declare-fun e!830577 () Bool)

(assert (=> d!156157 (=> res!1006352 e!830577)))

(assert (=> d!156157 (= res!1006352 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48516 a!2862)))))

(assert (=> d!156157 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687) e!830577)))

(declare-fun b!1480842 () Bool)

(declare-fun e!830575 () Bool)

(declare-fun e!830576 () Bool)

(assert (=> b!1480842 (= e!830575 e!830576)))

(declare-fun lt!646575 () (_ BitVec 64))

(assert (=> b!1480842 (= lt!646575 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!646576 () Unit!49752)

(assert (=> b!1480842 (= lt!646576 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1480842 (arrayContainsKey!0 a!2862 lt!646575 #b00000000000000000000000000000000)))

(declare-fun lt!646574 () Unit!49752)

(assert (=> b!1480842 (= lt!646574 lt!646576)))

(declare-fun res!1006353 () Bool)

(assert (=> b!1480842 (= res!1006353 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480842 (=> (not res!1006353) (not e!830576))))

(declare-fun b!1480843 () Bool)

(assert (=> b!1480843 (= e!830576 call!67845)))

(declare-fun b!1480844 () Bool)

(assert (=> b!1480844 (= e!830575 call!67845)))

(declare-fun b!1480845 () Bool)

(assert (=> b!1480845 (= e!830577 e!830575)))

(declare-fun c!136766 () Bool)

(assert (=> b!1480845 (= c!136766 (validKeyInArray!0 (select (arr!47966 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!156157 (not res!1006352)) b!1480845))

(assert (= (and b!1480845 c!136766) b!1480842))

(assert (= (and b!1480845 (not c!136766)) b!1480844))

(assert (= (and b!1480842 res!1006353) b!1480843))

(assert (= (or b!1480843 b!1480844) bm!67842))

(declare-fun m!1366555 () Bool)

(assert (=> bm!67842 m!1366555))

(assert (=> b!1480842 m!1366513))

(declare-fun m!1366557 () Bool)

(assert (=> b!1480842 m!1366557))

(declare-fun m!1366559 () Bool)

(assert (=> b!1480842 m!1366559))

(assert (=> b!1480842 m!1366513))

(declare-fun m!1366561 () Bool)

(assert (=> b!1480842 m!1366561))

(assert (=> b!1480845 m!1366513))

(assert (=> b!1480845 m!1366513))

(assert (=> b!1480845 m!1366517))

(assert (=> bm!67833 d!156157))

(declare-fun d!156159 () Bool)

(assert (=> d!156159 (= (validKeyInArray!0 (select (arr!47966 a!2862) #b00000000000000000000000000000000)) (and (not (= (select (arr!47966 a!2862) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47966 a!2862) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480705 d!156159))

(assert (=> d!156095 d!156105))

(assert (=> d!156095 d!156107))

(assert (=> d!156095 d!156125))

(assert (=> d!156101 d!156125))

(assert (=> d!156109 d!156059))

(assert (=> d!156109 d!156075))

(assert (=> d!156109 d!156125))

(declare-fun b!1480846 () Bool)

(declare-fun c!136769 () Bool)

(declare-fun lt!646578 () (_ BitVec 64))

(assert (=> b!1480846 (= c!136769 (= lt!646578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830578 () SeekEntryResult!12206)

(declare-fun e!830580 () SeekEntryResult!12206)

(assert (=> b!1480846 (= e!830578 e!830580)))

(declare-fun b!1480847 () Bool)

(assert (=> b!1480847 (= e!830578 (Found!12206 (nextIndex!0 index!646 x!665 mask!2687)))))

(declare-fun lt!646577 () SeekEntryResult!12206)

(declare-fun d!156161 () Bool)

(assert (=> d!156161 (and (or (is-Undefined!12206 lt!646577) (not (is-Found!12206 lt!646577)) (and (bvsge (index!51217 lt!646577) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646577) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646577) (is-Found!12206 lt!646577) (not (is-MissingVacant!12206 lt!646577)) (not (= (index!51219 lt!646577) intermediateAfterIndex!19)) (and (bvsge (index!51219 lt!646577) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646577) (size!48516 lt!646371)))) (or (is-Undefined!12206 lt!646577) (ite (is-Found!12206 lt!646577) (= (select (arr!47966 lt!646371) (index!51217 lt!646577)) lt!646374) (and (is-MissingVacant!12206 lt!646577) (= (index!51219 lt!646577) intermediateAfterIndex!19) (= (select (arr!47966 lt!646371) (index!51219 lt!646577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!830579 () SeekEntryResult!12206)

(assert (=> d!156161 (= lt!646577 e!830579)))

(declare-fun c!136767 () Bool)

(assert (=> d!156161 (= c!136767 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!156161 (= lt!646578 (select (arr!47966 lt!646371) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156161 (validMask!0 mask!2687)))

(assert (=> d!156161 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646374 lt!646371 mask!2687) lt!646577)))

(declare-fun b!1480848 () Bool)

(assert (=> b!1480848 (= e!830580 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480849 () Bool)

(assert (=> b!1480849 (= e!830579 e!830578)))

(declare-fun c!136768 () Bool)

(assert (=> b!1480849 (= c!136768 (= lt!646578 lt!646374))))

(declare-fun b!1480850 () Bool)

(assert (=> b!1480850 (= e!830580 (MissingVacant!12206 intermediateAfterIndex!19))))

(declare-fun b!1480851 () Bool)

(assert (=> b!1480851 (= e!830579 Undefined!12206)))

(assert (= (and d!156161 c!136767) b!1480851))

(assert (= (and d!156161 (not c!136767)) b!1480849))

(assert (= (and b!1480849 c!136768) b!1480847))

(assert (= (and b!1480849 (not c!136768)) b!1480846))

(assert (= (and b!1480846 c!136769) b!1480850))

(assert (= (and b!1480846 (not c!136769)) b!1480848))

(declare-fun m!1366563 () Bool)

(assert (=> d!156161 m!1366563))

(declare-fun m!1366565 () Bool)

(assert (=> d!156161 m!1366565))

(assert (=> d!156161 m!1366407))

(declare-fun m!1366567 () Bool)

(assert (=> d!156161 m!1366567))

(assert (=> d!156161 m!1366135))

(assert (=> b!1480848 m!1366407))

(declare-fun m!1366569 () Bool)

(assert (=> b!1480848 m!1366569))

(assert (=> b!1480848 m!1366569))

(declare-fun m!1366571 () Bool)

(assert (=> b!1480848 m!1366571))

(assert (=> b!1480660 d!156161))

(declare-fun d!156163 () Bool)

(declare-fun lt!646581 () (_ BitVec 32))

(assert (=> d!156163 (and (bvsge lt!646581 #b00000000000000000000000000000000) (bvslt lt!646581 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156163 (= lt!646581 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156163 (validMask!0 mask!2687)))

(assert (=> d!156163 (= (nextIndex!0 index!646 x!665 mask!2687) lt!646581)))

(declare-fun bs!42664 () Bool)

(assert (= bs!42664 d!156163))

(declare-fun m!1366573 () Bool)

(assert (=> bs!42664 m!1366573))

(assert (=> bs!42664 m!1366135))

(assert (=> b!1480660 d!156163))

(declare-fun d!156165 () Bool)

(assert (=> d!156165 (arrayContainsKey!0 a!2862 lt!646479 #b00000000000000000000000000000000)))

(declare-fun lt!646582 () Unit!49752)

(assert (=> d!156165 (= lt!646582 (choose!13 a!2862 lt!646479 j!93))))

(assert (=> d!156165 (bvsge j!93 #b00000000000000000000000000000000)))

(assert (=> d!156165 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646479 j!93) lt!646582)))

(declare-fun bs!42665 () Bool)

(assert (= bs!42665 d!156165))

(assert (=> bs!42665 m!1366349))

(declare-fun m!1366575 () Bool)

(assert (=> bs!42665 m!1366575))

(assert (=> b!1480599 d!156165))

(declare-fun d!156167 () Bool)

(declare-fun res!1006354 () Bool)

(declare-fun e!830581 () Bool)

(assert (=> d!156167 (=> res!1006354 e!830581)))

(assert (=> d!156167 (= res!1006354 (= (select (arr!47966 a!2862) #b00000000000000000000000000000000) lt!646479))))

(assert (=> d!156167 (= (arrayContainsKey!0 a!2862 lt!646479 #b00000000000000000000000000000000) e!830581)))

(declare-fun b!1480852 () Bool)

(declare-fun e!830582 () Bool)

(assert (=> b!1480852 (= e!830581 e!830582)))

(declare-fun res!1006355 () Bool)

(assert (=> b!1480852 (=> (not res!1006355) (not e!830582))))

(assert (=> b!1480852 (= res!1006355 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48516 a!2862)))))

(declare-fun b!1480853 () Bool)

(assert (=> b!1480853 (= e!830582 (arrayContainsKey!0 a!2862 lt!646479 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156167 (not res!1006354)) b!1480852))

(assert (= (and b!1480852 res!1006355) b!1480853))

(assert (=> d!156167 m!1366427))

(declare-fun m!1366577 () Bool)

(assert (=> b!1480853 m!1366577))

(assert (=> b!1480599 d!156167))

(assert (=> b!1480599 d!156109))

(declare-fun b!1480854 () Bool)

(declare-fun e!830587 () Bool)

(declare-fun e!830586 () Bool)

(assert (=> b!1480854 (= e!830587 e!830586)))

(declare-fun res!1006356 () Bool)

(declare-fun lt!646583 () SeekEntryResult!12206)

(assert (=> b!1480854 (= res!1006356 (and (is-Intermediate!12206 lt!646583) (not (undefined!13018 lt!646583)) (bvslt (x!132797 lt!646583) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646583) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646583) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480854 (=> (not res!1006356) (not e!830586))))

(declare-fun b!1480855 () Bool)

(assert (=> b!1480855 (and (bvsge (index!51218 lt!646583) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646583) (size!48516 a!2862)))))

(declare-fun e!830585 () Bool)

(assert (=> b!1480855 (= e!830585 (= (select (arr!47966 a!2862) (index!51218 lt!646583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830584 () SeekEntryResult!12206)

(declare-fun b!1480856 () Bool)

(assert (=> b!1480856 (= e!830584 (Intermediate!12206 false (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480857 () Bool)

(assert (=> b!1480857 (and (bvsge (index!51218 lt!646583) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646583) (size!48516 a!2862)))))

(declare-fun res!1006357 () Bool)

(assert (=> b!1480857 (= res!1006357 (= (select (arr!47966 a!2862) (index!51218 lt!646583)) (select (arr!47966 a!2862) j!93)))))

(assert (=> b!1480857 (=> res!1006357 e!830585)))

(assert (=> b!1480857 (= e!830586 e!830585)))

(declare-fun d!156169 () Bool)

(assert (=> d!156169 e!830587))

(declare-fun c!136770 () Bool)

(assert (=> d!156169 (= c!136770 (and (is-Intermediate!12206 lt!646583) (undefined!13018 lt!646583)))))

(declare-fun e!830583 () SeekEntryResult!12206)

(assert (=> d!156169 (= lt!646583 e!830583)))

(declare-fun c!136772 () Bool)

(assert (=> d!156169 (= c!136772 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646584 () (_ BitVec 64))

(assert (=> d!156169 (= lt!646584 (select (arr!47966 a!2862) (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156169 (validMask!0 mask!2687)))

(assert (=> d!156169 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646583)))

(declare-fun b!1480858 () Bool)

(assert (=> b!1480858 (and (bvsge (index!51218 lt!646583) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646583) (size!48516 a!2862)))))

(declare-fun res!1006358 () Bool)

(assert (=> b!1480858 (= res!1006358 (= (select (arr!47966 a!2862) (index!51218 lt!646583)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480858 (=> res!1006358 e!830585)))

(declare-fun b!1480859 () Bool)

(assert (=> b!1480859 (= e!830583 e!830584)))

(declare-fun c!136771 () Bool)

(assert (=> b!1480859 (= c!136771 (or (= lt!646584 (select (arr!47966 a!2862) j!93)) (= (bvadd lt!646584 lt!646584) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480860 () Bool)

(assert (=> b!1480860 (= e!830584 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480861 () Bool)

(assert (=> b!1480861 (= e!830587 (bvsge (x!132797 lt!646583) #b01111111111111111111111111111110))))

(declare-fun b!1480862 () Bool)

(assert (=> b!1480862 (= e!830583 (Intermediate!12206 true (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156169 c!136772) b!1480862))

(assert (= (and d!156169 (not c!136772)) b!1480859))

(assert (= (and b!1480859 c!136771) b!1480856))

(assert (= (and b!1480859 (not c!136771)) b!1480860))

(assert (= (and d!156169 c!136770) b!1480861))

(assert (= (and d!156169 (not c!136770)) b!1480854))

(assert (= (and b!1480854 res!1006356) b!1480857))

(assert (= (and b!1480857 (not res!1006357)) b!1480858))

(assert (= (and b!1480858 (not res!1006358)) b!1480855))

(assert (=> b!1480860 m!1366337))

(declare-fun m!1366579 () Bool)

(assert (=> b!1480860 m!1366579))

(assert (=> b!1480860 m!1366579))

(assert (=> b!1480860 m!1366129))

(declare-fun m!1366581 () Bool)

(assert (=> b!1480860 m!1366581))

(declare-fun m!1366583 () Bool)

(assert (=> b!1480855 m!1366583))

(assert (=> d!156169 m!1366337))

(declare-fun m!1366585 () Bool)

(assert (=> d!156169 m!1366585))

(assert (=> d!156169 m!1366135))

(assert (=> b!1480857 m!1366583))

(assert (=> b!1480858 m!1366583))

(assert (=> b!1480564 d!156169))

(declare-fun d!156171 () Bool)

(declare-fun lt!646585 () (_ BitVec 32))

(assert (=> d!156171 (and (bvsge lt!646585 #b00000000000000000000000000000000) (bvslt lt!646585 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156171 (= lt!646585 (choose!52 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156171 (validMask!0 mask!2687)))

(assert (=> d!156171 (= (nextIndex!0 (toIndex!0 (select (arr!47966 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646585)))

(declare-fun bs!42666 () Bool)

(assert (= bs!42666 d!156171))

(assert (=> bs!42666 m!1366139))

(declare-fun m!1366587 () Bool)

(assert (=> bs!42666 m!1366587))

(assert (=> bs!42666 m!1366135))

(assert (=> b!1480564 d!156171))

(declare-fun b!1480863 () Bool)

(declare-fun e!830592 () Bool)

(declare-fun e!830591 () Bool)

(assert (=> b!1480863 (= e!830592 e!830591)))

(declare-fun res!1006359 () Bool)

(declare-fun lt!646586 () SeekEntryResult!12206)

(assert (=> b!1480863 (= res!1006359 (and (is-Intermediate!12206 lt!646586) (not (undefined!13018 lt!646586)) (bvslt (x!132797 lt!646586) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646586) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646586) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480863 (=> (not res!1006359) (not e!830591))))

(declare-fun b!1480864 () Bool)

(assert (=> b!1480864 (and (bvsge (index!51218 lt!646586) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646586) (size!48516 lt!646371)))))

(declare-fun e!830590 () Bool)

(assert (=> b!1480864 (= e!830590 (= (select (arr!47966 lt!646371) (index!51218 lt!646586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830589 () SeekEntryResult!12206)

(declare-fun b!1480865 () Bool)

(assert (=> b!1480865 (= e!830589 (Intermediate!12206 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480866 () Bool)

(assert (=> b!1480866 (and (bvsge (index!51218 lt!646586) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646586) (size!48516 lt!646371)))))

(declare-fun res!1006360 () Bool)

(assert (=> b!1480866 (= res!1006360 (= (select (arr!47966 lt!646371) (index!51218 lt!646586)) lt!646374))))

(assert (=> b!1480866 (=> res!1006360 e!830590)))

(assert (=> b!1480866 (= e!830591 e!830590)))

(declare-fun d!156173 () Bool)

(assert (=> d!156173 e!830592))

(declare-fun c!136773 () Bool)

(assert (=> d!156173 (= c!136773 (and (is-Intermediate!12206 lt!646586) (undefined!13018 lt!646586)))))

(declare-fun e!830588 () SeekEntryResult!12206)

(assert (=> d!156173 (= lt!646586 e!830588)))

(declare-fun c!136775 () Bool)

(assert (=> d!156173 (= c!136775 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646587 () (_ BitVec 64))

(assert (=> d!156173 (= lt!646587 (select (arr!47966 lt!646371) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156173 (validMask!0 mask!2687)))

(assert (=> d!156173 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646374 lt!646371 mask!2687) lt!646586)))

(declare-fun b!1480867 () Bool)

(assert (=> b!1480867 (and (bvsge (index!51218 lt!646586) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646586) (size!48516 lt!646371)))))

(declare-fun res!1006361 () Bool)

(assert (=> b!1480867 (= res!1006361 (= (select (arr!47966 lt!646371) (index!51218 lt!646586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480867 (=> res!1006361 e!830590)))

(declare-fun b!1480868 () Bool)

(assert (=> b!1480868 (= e!830588 e!830589)))

(declare-fun c!136774 () Bool)

(assert (=> b!1480868 (= c!136774 (or (= lt!646587 lt!646374) (= (bvadd lt!646587 lt!646587) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480869 () Bool)

(assert (=> b!1480869 (= e!830589 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480870 () Bool)

(assert (=> b!1480870 (= e!830592 (bvsge (x!132797 lt!646586) #b01111111111111111111111111111110))))

(declare-fun b!1480871 () Bool)

(assert (=> b!1480871 (= e!830588 (Intermediate!12206 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156173 c!136775) b!1480871))

(assert (= (and d!156173 (not c!136775)) b!1480868))

(assert (= (and b!1480868 c!136774) b!1480865))

(assert (= (and b!1480868 (not c!136774)) b!1480869))

(assert (= (and d!156173 c!136773) b!1480870))

(assert (= (and d!156173 (not c!136773)) b!1480863))

(assert (= (and b!1480863 res!1006359) b!1480866))

(assert (= (and b!1480866 (not res!1006360)) b!1480867))

(assert (= (and b!1480867 (not res!1006361)) b!1480864))

(assert (=> b!1480869 m!1366407))

(assert (=> b!1480869 m!1366569))

(assert (=> b!1480869 m!1366569))

(declare-fun m!1366589 () Bool)

(assert (=> b!1480869 m!1366589))

(declare-fun m!1366591 () Bool)

(assert (=> b!1480864 m!1366591))

(assert (=> d!156173 m!1366407))

(assert (=> d!156173 m!1366567))

(assert (=> d!156173 m!1366135))

(assert (=> b!1480866 m!1366591))

(assert (=> b!1480867 m!1366591))

(assert (=> b!1480692 d!156173))

(assert (=> b!1480692 d!156163))

(declare-fun d!156175 () Bool)

(declare-fun lt!646590 () Bool)

(declare-fun content!778 (List!34467) (Set (_ BitVec 64)))

(assert (=> d!156175 (= lt!646590 (set.member (select (arr!47966 a!2862) #b00000000000000000000000000000000) (content!778 Nil!34464)))))

(declare-fun e!830597 () Bool)

(assert (=> d!156175 (= lt!646590 e!830597)))

(declare-fun res!1006367 () Bool)

(assert (=> d!156175 (=> (not res!1006367) (not e!830597))))

(assert (=> d!156175 (= res!1006367 (is-Cons!34463 Nil!34464))))

(assert (=> d!156175 (= (contains!9912 Nil!34464 (select (arr!47966 a!2862) #b00000000000000000000000000000000)) lt!646590)))

(declare-fun b!1480876 () Bool)

(declare-fun e!830598 () Bool)

(assert (=> b!1480876 (= e!830597 e!830598)))

(declare-fun res!1006366 () Bool)

(assert (=> b!1480876 (=> res!1006366 e!830598)))

(assert (=> b!1480876 (= res!1006366 (= (h!35831 Nil!34464) (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480877 () Bool)

(assert (=> b!1480877 (= e!830598 (contains!9912 (t!49161 Nil!34464) (select (arr!47966 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156175 res!1006367) b!1480876))

(assert (= (and b!1480876 (not res!1006366)) b!1480877))

(declare-fun m!1366593 () Bool)

(assert (=> d!156175 m!1366593))

(assert (=> d!156175 m!1366427))

(declare-fun m!1366595 () Bool)

(assert (=> d!156175 m!1366595))

(assert (=> b!1480877 m!1366427))

(declare-fun m!1366597 () Bool)

(assert (=> b!1480877 m!1366597))

(assert (=> b!1480776 d!156175))

(declare-fun bm!67843 () Bool)

(declare-fun call!67846 () Bool)

(assert (=> bm!67843 (= call!67846 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156177 () Bool)

(declare-fun res!1006368 () Bool)

(declare-fun e!830601 () Bool)

(assert (=> d!156177 (=> res!1006368 e!830601)))

(assert (=> d!156177 (= res!1006368 (bvsge (bvadd j!93 #b00000000000000000000000000000001) (size!48516 a!2862)))))

(assert (=> d!156177 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687) e!830601)))

(declare-fun b!1480878 () Bool)

(declare-fun e!830599 () Bool)

(declare-fun e!830600 () Bool)

(assert (=> b!1480878 (= e!830599 e!830600)))

(declare-fun lt!646592 () (_ BitVec 64))

(assert (=> b!1480878 (= lt!646592 (select (arr!47966 a!2862) (bvadd j!93 #b00000000000000000000000000000001)))))

(declare-fun lt!646593 () Unit!49752)

(assert (=> b!1480878 (= lt!646593 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646592 (bvadd j!93 #b00000000000000000000000000000001)))))

(assert (=> b!1480878 (arrayContainsKey!0 a!2862 lt!646592 #b00000000000000000000000000000000)))

(declare-fun lt!646591 () Unit!49752)

(assert (=> b!1480878 (= lt!646591 lt!646593)))

(declare-fun res!1006369 () Bool)

(assert (=> b!1480878 (= res!1006369 (= (seekEntryOrOpen!0 (select (arr!47966 a!2862) (bvadd j!93 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12206 (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (=> b!1480878 (=> (not res!1006369) (not e!830600))))

(declare-fun b!1480879 () Bool)

(assert (=> b!1480879 (= e!830600 call!67846)))

(declare-fun b!1480880 () Bool)

(assert (=> b!1480880 (= e!830599 call!67846)))

(declare-fun b!1480881 () Bool)

(assert (=> b!1480881 (= e!830601 e!830599)))

(declare-fun c!136776 () Bool)

(assert (=> b!1480881 (= c!136776 (validKeyInArray!0 (select (arr!47966 a!2862) (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (= (and d!156177 (not res!1006368)) b!1480881))

(assert (= (and b!1480881 c!136776) b!1480878))

(assert (= (and b!1480881 (not c!136776)) b!1480880))

(assert (= (and b!1480878 res!1006369) b!1480879))

(assert (= (or b!1480879 b!1480880) bm!67843))

(declare-fun m!1366599 () Bool)

(assert (=> bm!67843 m!1366599))

(declare-fun m!1366601 () Bool)

(assert (=> b!1480878 m!1366601))

(declare-fun m!1366603 () Bool)

(assert (=> b!1480878 m!1366603))

(declare-fun m!1366605 () Bool)

(assert (=> b!1480878 m!1366605))

(assert (=> b!1480878 m!1366601))

(declare-fun m!1366607 () Bool)

(assert (=> b!1480878 m!1366607))

(assert (=> b!1480881 m!1366601))

(assert (=> b!1480881 m!1366601))

(declare-fun m!1366609 () Bool)

(assert (=> b!1480881 m!1366609))

(assert (=> bm!67828 d!156177))

(assert (=> d!156111 d!156125))

(assert (=> b!1480780 d!156159))

(declare-fun b!1480882 () Bool)

(declare-fun e!830606 () Bool)

(declare-fun e!830605 () Bool)

(assert (=> b!1480882 (= e!830606 e!830605)))

(declare-fun res!1006370 () Bool)

(declare-fun lt!646594 () SeekEntryResult!12206)

(assert (=> b!1480882 (= res!1006370 (and (is-Intermediate!12206 lt!646594) (not (undefined!13018 lt!646594)) (bvslt (x!132797 lt!646594) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646594) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646594) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480882 (=> (not res!1006370) (not e!830605))))

(declare-fun b!1480883 () Bool)

(assert (=> b!1480883 (and (bvsge (index!51218 lt!646594) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646594) (size!48516 lt!646371)))))

(declare-fun e!830604 () Bool)

(assert (=> b!1480883 (= e!830604 (= (select (arr!47966 lt!646371) (index!51218 lt!646594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480884 () Bool)

(declare-fun e!830603 () SeekEntryResult!12206)

(assert (=> b!1480884 (= e!830603 (Intermediate!12206 false (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480885 () Bool)

(assert (=> b!1480885 (and (bvsge (index!51218 lt!646594) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646594) (size!48516 lt!646371)))))

(declare-fun res!1006371 () Bool)

(assert (=> b!1480885 (= res!1006371 (= (select (arr!47966 lt!646371) (index!51218 lt!646594)) lt!646374))))

(assert (=> b!1480885 (=> res!1006371 e!830604)))

(assert (=> b!1480885 (= e!830605 e!830604)))

(declare-fun d!156179 () Bool)

(assert (=> d!156179 e!830606))

(declare-fun c!136777 () Bool)

(assert (=> d!156179 (= c!136777 (and (is-Intermediate!12206 lt!646594) (undefined!13018 lt!646594)))))

(declare-fun e!830602 () SeekEntryResult!12206)

(assert (=> d!156179 (= lt!646594 e!830602)))

(declare-fun c!136779 () Bool)

(assert (=> d!156179 (= c!136779 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646595 () (_ BitVec 64))

(assert (=> d!156179 (= lt!646595 (select (arr!47966 lt!646371) (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156179 (validMask!0 mask!2687)))

(assert (=> d!156179 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646374 lt!646371 mask!2687) lt!646594)))

(declare-fun b!1480886 () Bool)

(assert (=> b!1480886 (and (bvsge (index!51218 lt!646594) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646594) (size!48516 lt!646371)))))

(declare-fun res!1006372 () Bool)

(assert (=> b!1480886 (= res!1006372 (= (select (arr!47966 lt!646371) (index!51218 lt!646594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480886 (=> res!1006372 e!830604)))

(declare-fun b!1480887 () Bool)

(assert (=> b!1480887 (= e!830602 e!830603)))

(declare-fun c!136778 () Bool)

(assert (=> b!1480887 (= c!136778 (or (= lt!646595 lt!646374) (= (bvadd lt!646595 lt!646595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480888 () Bool)

(assert (=> b!1480888 (= e!830603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!646374 lt!646371 mask!2687))))

(declare-fun b!1480889 () Bool)

(assert (=> b!1480889 (= e!830606 (bvsge (x!132797 lt!646594) #b01111111111111111111111111111110))))

(declare-fun b!1480890 () Bool)

(assert (=> b!1480890 (= e!830602 (Intermediate!12206 true (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156179 c!136779) b!1480890))

(assert (= (and d!156179 (not c!136779)) b!1480887))

(assert (= (and b!1480887 c!136778) b!1480884))

(assert (= (and b!1480887 (not c!136778)) b!1480888))

(assert (= (and d!156179 c!136777) b!1480889))

(assert (= (and d!156179 (not c!136777)) b!1480882))

(assert (= (and b!1480882 res!1006370) b!1480885))

(assert (= (and b!1480885 (not res!1006371)) b!1480886))

(assert (= (and b!1480886 (not res!1006372)) b!1480883))

(assert (=> b!1480888 m!1366437))

(declare-fun m!1366611 () Bool)

(assert (=> b!1480888 m!1366611))

(assert (=> b!1480888 m!1366611))

(declare-fun m!1366613 () Bool)

(assert (=> b!1480888 m!1366613))

(declare-fun m!1366615 () Bool)

(assert (=> b!1480883 m!1366615))

(assert (=> d!156179 m!1366437))

(declare-fun m!1366617 () Bool)

(assert (=> d!156179 m!1366617))

(assert (=> d!156179 m!1366135))

(assert (=> b!1480885 m!1366615))

(assert (=> b!1480886 m!1366615))

(assert (=> b!1480719 d!156179))

(declare-fun d!156181 () Bool)

(declare-fun lt!646596 () (_ BitVec 32))

(assert (=> d!156181 (and (bvsge lt!646596 #b00000000000000000000000000000000) (bvslt lt!646596 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156181 (= lt!646596 (choose!52 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156181 (validMask!0 mask!2687)))

(assert (=> d!156181 (= (nextIndex!0 (toIndex!0 lt!646374 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646596)))

(declare-fun bs!42667 () Bool)

(assert (= bs!42667 d!156181))

(assert (=> bs!42667 m!1366155))

(declare-fun m!1366619 () Bool)

(assert (=> bs!42667 m!1366619))

(assert (=> bs!42667 m!1366135))

(assert (=> b!1480719 d!156181))

(assert (=> b!1480602 d!156121))

(declare-fun b!1480891 () Bool)

(declare-fun e!830611 () Bool)

(declare-fun e!830610 () Bool)

(assert (=> b!1480891 (= e!830611 e!830610)))

(declare-fun res!1006373 () Bool)

(declare-fun lt!646597 () SeekEntryResult!12206)

(assert (=> b!1480891 (= res!1006373 (and (is-Intermediate!12206 lt!646597) (not (undefined!13018 lt!646597)) (bvslt (x!132797 lt!646597) #b01111111111111111111111111111110) (bvsge (x!132797 lt!646597) #b00000000000000000000000000000000) (bvsge (x!132797 lt!646597) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480891 (=> (not res!1006373) (not e!830610))))

(declare-fun b!1480892 () Bool)

(assert (=> b!1480892 (and (bvsge (index!51218 lt!646597) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646597) (size!48516 a!2862)))))

(declare-fun e!830609 () Bool)

(assert (=> b!1480892 (= e!830609 (= (select (arr!47966 a!2862) (index!51218 lt!646597)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!830608 () SeekEntryResult!12206)

(declare-fun b!1480893 () Bool)

(assert (=> b!1480893 (= e!830608 (Intermediate!12206 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480894 () Bool)

(assert (=> b!1480894 (and (bvsge (index!51218 lt!646597) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646597) (size!48516 a!2862)))))

(declare-fun res!1006374 () Bool)

(assert (=> b!1480894 (= res!1006374 (= (select (arr!47966 a!2862) (index!51218 lt!646597)) (select (arr!47966 a!2862) j!93)))))

(assert (=> b!1480894 (=> res!1006374 e!830609)))

(assert (=> b!1480894 (= e!830610 e!830609)))

(declare-fun d!156183 () Bool)

(assert (=> d!156183 e!830611))

(declare-fun c!136780 () Bool)

(assert (=> d!156183 (= c!136780 (and (is-Intermediate!12206 lt!646597) (undefined!13018 lt!646597)))))

(declare-fun e!830607 () SeekEntryResult!12206)

(assert (=> d!156183 (= lt!646597 e!830607)))

(declare-fun c!136782 () Bool)

(assert (=> d!156183 (= c!136782 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646598 () (_ BitVec 64))

(assert (=> d!156183 (= lt!646598 (select (arr!47966 a!2862) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156183 (validMask!0 mask!2687)))

(assert (=> d!156183 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687) lt!646597)))

(declare-fun b!1480895 () Bool)

(assert (=> b!1480895 (and (bvsge (index!51218 lt!646597) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646597) (size!48516 a!2862)))))

(declare-fun res!1006375 () Bool)

(assert (=> b!1480895 (= res!1006375 (= (select (arr!47966 a!2862) (index!51218 lt!646597)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480895 (=> res!1006375 e!830609)))

(declare-fun b!1480896 () Bool)

(assert (=> b!1480896 (= e!830607 e!830608)))

(declare-fun c!136781 () Bool)

(assert (=> b!1480896 (= c!136781 (or (= lt!646598 (select (arr!47966 a!2862) j!93)) (= (bvadd lt!646598 lt!646598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480897 () Bool)

(assert (=> b!1480897 (= e!830608 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47966 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480898 () Bool)

(assert (=> b!1480898 (= e!830611 (bvsge (x!132797 lt!646597) #b01111111111111111111111111111110))))

(declare-fun b!1480899 () Bool)

(assert (=> b!1480899 (= e!830607 (Intermediate!12206 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156183 c!136782) b!1480899))

(assert (= (and d!156183 (not c!136782)) b!1480896))

(assert (= (and b!1480896 c!136781) b!1480893))

(assert (= (and b!1480896 (not c!136781)) b!1480897))

(assert (= (and d!156183 c!136780) b!1480898))

(assert (= (and d!156183 (not c!136780)) b!1480891))

(assert (= (and b!1480891 res!1006373) b!1480894))

(assert (= (and b!1480894 (not res!1006374)) b!1480895))

(assert (= (and b!1480895 (not res!1006375)) b!1480892))

(assert (=> b!1480897 m!1366407))

(assert (=> b!1480897 m!1366569))

(assert (=> b!1480897 m!1366569))

(assert (=> b!1480897 m!1366129))

(declare-fun m!1366621 () Bool)

(assert (=> b!1480897 m!1366621))

(declare-fun m!1366623 () Bool)

(assert (=> b!1480892 m!1366623))

(assert (=> d!156183 m!1366407))

(declare-fun m!1366625 () Bool)

(assert (=> d!156183 m!1366625))

(assert (=> d!156183 m!1366135))

(assert (=> b!1480894 m!1366623))

(assert (=> b!1480895 m!1366623))

(assert (=> b!1480734 d!156183))

(assert (=> b!1480734 d!156163))

(assert (=> b!1480779 d!156159))

(push 1)

(assert (not b!1480820))

(assert (not d!156161))

(assert (not b!1480817))

(assert (not b!1480845))

(assert (not d!156143))

(assert (not d!156181))

(assert (not d!156165))

(assert (not bm!67842))

(assert (not d!156151))

(assert (not b!1480877))

(assert (not b!1480881))

(assert (not b!1480848))

(assert (not bm!67843))

(assert (not d!156183))

(assert (not d!156179))

(assert (not b!1480860))

(assert (not d!156169))

(assert (not b!1480853))

(assert (not b!1480897))

(assert (not d!156149))

(assert (not b!1480869))

(assert (not d!156163))

(assert (not b!1480813))

(assert (not d!156155))

(assert (not bm!67841))

(assert (not d!156173))

(assert (not b!1480888))

(assert (not d!156175))

(assert (not b!1480826))

(assert (not b!1480816))

(assert (not b!1480878))

(assert (not b!1480842))

(assert (not d!156147))

(assert (not b!1480837))

(assert (not d!156171))

(assert (not b!1480835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

