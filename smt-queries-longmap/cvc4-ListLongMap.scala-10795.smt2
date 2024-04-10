; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126272 () Bool)

(assert start!126272)

(declare-fun b!1480415 () Bool)

(declare-fun e!830326 () Bool)

(declare-fun e!830325 () Bool)

(assert (=> b!1480415 (= e!830326 e!830325)))

(declare-fun res!1006225 () Bool)

(assert (=> b!1480415 (=> (not res!1006225) (not e!830325))))

(declare-datatypes ((SeekEntryResult!12208 0))(
  ( (MissingZero!12208 (index!51224 (_ BitVec 32))) (Found!12208 (index!51225 (_ BitVec 32))) (Intermediate!12208 (undefined!13020 Bool) (index!51226 (_ BitVec 32)) (x!132799 (_ BitVec 32))) (Undefined!12208) (MissingVacant!12208 (index!51227 (_ BitVec 32))) )
))
(declare-fun lt!646401 () SeekEntryResult!12208)

(declare-datatypes ((array!99378 0))(
  ( (array!99379 (arr!47968 (Array (_ BitVec 32) (_ BitVec 64))) (size!48518 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99378)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99378 (_ BitVec 32)) SeekEntryResult!12208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480415 (= res!1006225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646401))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480415 (= lt!646401 (Intermediate!12208 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480417 () Bool)

(declare-fun res!1006227 () Bool)

(declare-fun e!830328 () Bool)

(assert (=> b!1480417 (=> (not res!1006227) (not e!830328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99378 (_ BitVec 32)) SeekEntryResult!12208)

(assert (=> b!1480417 (= res!1006227 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) (Found!12208 j!93)))))

(declare-fun b!1480418 () Bool)

(declare-fun res!1006220 () Bool)

(assert (=> b!1480418 (=> (not res!1006220) (not e!830325))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1480418 (= res!1006220 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646401))))

(declare-fun b!1480419 () Bool)

(declare-fun res!1006229 () Bool)

(declare-fun e!830330 () Bool)

(assert (=> b!1480419 (=> (not res!1006229) (not e!830330))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480419 (= res!1006229 (and (= (size!48518 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48518 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48518 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480420 () Bool)

(assert (=> b!1480420 (= e!830330 e!830326)))

(declare-fun res!1006228 () Bool)

(assert (=> b!1480420 (=> (not res!1006228) (not e!830326))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480420 (= res!1006228 (= (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646404 () array!99378)

(assert (=> b!1480420 (= lt!646404 (array!99379 (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48518 a!2862)))))

(declare-fun b!1480421 () Bool)

(assert (=> b!1480421 (= e!830328 (or (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47968 a!2862) intermediateBeforeIndex!19) (select (arr!47968 a!2862) j!93))))))

(declare-fun e!830329 () Bool)

(declare-fun b!1480422 () Bool)

(declare-fun lt!646402 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99378 (_ BitVec 32)) SeekEntryResult!12208)

(assert (=> b!1480422 (= e!830329 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646402 lt!646404 mask!2687) (seekEntryOrOpen!0 lt!646402 lt!646404 mask!2687)))))

(declare-fun b!1480423 () Bool)

(declare-fun lt!646400 () SeekEntryResult!12208)

(assert (=> b!1480423 (= e!830329 (= lt!646400 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646402 lt!646404 mask!2687)))))

(declare-fun b!1480424 () Bool)

(declare-fun res!1006232 () Bool)

(declare-fun e!830324 () Bool)

(assert (=> b!1480424 (=> (not res!1006232) (not e!830324))))

(assert (=> b!1480424 (= res!1006232 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1480425 () Bool)

(assert (=> b!1480425 (= e!830324 (not (or (and (= (select (arr!47968 a!2862) index!646) (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47968 a!2862) index!646) (select (arr!47968 a!2862) j!93))) (= (select (arr!47968 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(assert (=> b!1480425 e!830328))

(declare-fun res!1006222 () Bool)

(assert (=> b!1480425 (=> (not res!1006222) (not e!830328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99378 (_ BitVec 32)) Bool)

(assert (=> b!1480425 (= res!1006222 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49756 0))(
  ( (Unit!49757) )
))
(declare-fun lt!646403 () Unit!49756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49756)

(assert (=> b!1480425 (= lt!646403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480426 () Bool)

(declare-fun res!1006223 () Bool)

(assert (=> b!1480426 (=> (not res!1006223) (not e!830324))))

(assert (=> b!1480426 (= res!1006223 e!830329)))

(declare-fun c!136617 () Bool)

(assert (=> b!1480426 (= c!136617 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480427 () Bool)

(declare-fun res!1006221 () Bool)

(assert (=> b!1480427 (=> (not res!1006221) (not e!830330))))

(declare-datatypes ((List!34469 0))(
  ( (Nil!34466) (Cons!34465 (h!35833 (_ BitVec 64)) (t!49163 List!34469)) )
))
(declare-fun arrayNoDuplicates!0 (array!99378 (_ BitVec 32) List!34469) Bool)

(assert (=> b!1480427 (= res!1006221 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34466))))

(declare-fun b!1480428 () Bool)

(declare-fun res!1006233 () Bool)

(assert (=> b!1480428 (=> (not res!1006233) (not e!830330))))

(assert (=> b!1480428 (= res!1006233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480429 () Bool)

(declare-fun res!1006231 () Bool)

(assert (=> b!1480429 (=> (not res!1006231) (not e!830330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480429 (= res!1006231 (validKeyInArray!0 (select (arr!47968 a!2862) j!93)))))

(declare-fun res!1006230 () Bool)

(assert (=> start!126272 (=> (not res!1006230) (not e!830330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126272 (= res!1006230 (validMask!0 mask!2687))))

(assert (=> start!126272 e!830330))

(assert (=> start!126272 true))

(declare-fun array_inv!36996 (array!99378) Bool)

(assert (=> start!126272 (array_inv!36996 a!2862)))

(declare-fun b!1480416 () Bool)

(declare-fun res!1006224 () Bool)

(assert (=> b!1480416 (=> (not res!1006224) (not e!830330))))

(assert (=> b!1480416 (= res!1006224 (validKeyInArray!0 (select (arr!47968 a!2862) i!1006)))))

(declare-fun b!1480430 () Bool)

(assert (=> b!1480430 (= e!830325 e!830324)))

(declare-fun res!1006234 () Bool)

(assert (=> b!1480430 (=> (not res!1006234) (not e!830324))))

(assert (=> b!1480430 (= res!1006234 (= lt!646400 (Intermediate!12208 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480430 (= lt!646400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646402 mask!2687) lt!646402 lt!646404 mask!2687))))

(assert (=> b!1480430 (= lt!646402 (select (store (arr!47968 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480431 () Bool)

(declare-fun res!1006226 () Bool)

(assert (=> b!1480431 (=> (not res!1006226) (not e!830330))))

(assert (=> b!1480431 (= res!1006226 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48518 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48518 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48518 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126272 res!1006230) b!1480419))

(assert (= (and b!1480419 res!1006229) b!1480416))

(assert (= (and b!1480416 res!1006224) b!1480429))

(assert (= (and b!1480429 res!1006231) b!1480428))

(assert (= (and b!1480428 res!1006233) b!1480427))

(assert (= (and b!1480427 res!1006221) b!1480431))

(assert (= (and b!1480431 res!1006226) b!1480420))

(assert (= (and b!1480420 res!1006228) b!1480415))

(assert (= (and b!1480415 res!1006225) b!1480418))

(assert (= (and b!1480418 res!1006220) b!1480430))

(assert (= (and b!1480430 res!1006234) b!1480426))

(assert (= (and b!1480426 c!136617) b!1480423))

(assert (= (and b!1480426 (not c!136617)) b!1480422))

(assert (= (and b!1480426 res!1006223) b!1480424))

(assert (= (and b!1480424 res!1006232) b!1480425))

(assert (= (and b!1480425 res!1006222) b!1480417))

(assert (= (and b!1480417 res!1006227) b!1480421))

(declare-fun m!1366229 () Bool)

(assert (=> start!126272 m!1366229))

(declare-fun m!1366231 () Bool)

(assert (=> start!126272 m!1366231))

(declare-fun m!1366233 () Bool)

(assert (=> b!1480416 m!1366233))

(assert (=> b!1480416 m!1366233))

(declare-fun m!1366235 () Bool)

(assert (=> b!1480416 m!1366235))

(declare-fun m!1366237 () Bool)

(assert (=> b!1480423 m!1366237))

(declare-fun m!1366239 () Bool)

(assert (=> b!1480421 m!1366239))

(declare-fun m!1366241 () Bool)

(assert (=> b!1480421 m!1366241))

(assert (=> b!1480418 m!1366241))

(assert (=> b!1480418 m!1366241))

(declare-fun m!1366243 () Bool)

(assert (=> b!1480418 m!1366243))

(declare-fun m!1366245 () Bool)

(assert (=> b!1480422 m!1366245))

(declare-fun m!1366247 () Bool)

(assert (=> b!1480422 m!1366247))

(declare-fun m!1366249 () Bool)

(assert (=> b!1480427 m!1366249))

(declare-fun m!1366251 () Bool)

(assert (=> b!1480420 m!1366251))

(declare-fun m!1366253 () Bool)

(assert (=> b!1480420 m!1366253))

(declare-fun m!1366255 () Bool)

(assert (=> b!1480425 m!1366255))

(assert (=> b!1480425 m!1366251))

(declare-fun m!1366257 () Bool)

(assert (=> b!1480425 m!1366257))

(declare-fun m!1366259 () Bool)

(assert (=> b!1480425 m!1366259))

(declare-fun m!1366261 () Bool)

(assert (=> b!1480425 m!1366261))

(assert (=> b!1480425 m!1366241))

(assert (=> b!1480415 m!1366241))

(assert (=> b!1480415 m!1366241))

(declare-fun m!1366263 () Bool)

(assert (=> b!1480415 m!1366263))

(assert (=> b!1480415 m!1366263))

(assert (=> b!1480415 m!1366241))

(declare-fun m!1366265 () Bool)

(assert (=> b!1480415 m!1366265))

(assert (=> b!1480429 m!1366241))

(assert (=> b!1480429 m!1366241))

(declare-fun m!1366267 () Bool)

(assert (=> b!1480429 m!1366267))

(declare-fun m!1366269 () Bool)

(assert (=> b!1480430 m!1366269))

(assert (=> b!1480430 m!1366269))

(declare-fun m!1366271 () Bool)

(assert (=> b!1480430 m!1366271))

(assert (=> b!1480430 m!1366251))

(declare-fun m!1366273 () Bool)

(assert (=> b!1480430 m!1366273))

(declare-fun m!1366275 () Bool)

(assert (=> b!1480428 m!1366275))

(assert (=> b!1480417 m!1366241))

(assert (=> b!1480417 m!1366241))

(declare-fun m!1366277 () Bool)

(assert (=> b!1480417 m!1366277))

(push 1)

(assert (not b!1480429))

(assert (not b!1480416))

(assert (not b!1480428))

(assert (not b!1480418))

(assert (not b!1480427))

(assert (not b!1480425))

(assert (not b!1480415))

(assert (not b!1480422))

(assert (not start!126272))

(assert (not b!1480423))

(assert (not b!1480430))

(assert (not b!1480417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1480552 () Bool)

(declare-fun e!830404 () SeekEntryResult!12208)

(assert (=> b!1480552 (= e!830404 Undefined!12208)))

(declare-fun b!1480553 () Bool)

(declare-fun e!830403 () SeekEntryResult!12208)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480553 (= e!830403 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480554 () Bool)

(declare-fun e!830402 () SeekEntryResult!12208)

(assert (=> b!1480554 (= e!830402 (Found!12208 index!646))))

(declare-fun lt!646452 () SeekEntryResult!12208)

(declare-fun d!156061 () Bool)

(assert (=> d!156061 (and (or (is-Undefined!12208 lt!646452) (not (is-Found!12208 lt!646452)) (and (bvsge (index!51225 lt!646452) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646452) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646452) (is-Found!12208 lt!646452) (not (is-MissingVacant!12208 lt!646452)) (not (= (index!51227 lt!646452) intermediateAfterIndex!19)) (and (bvsge (index!51227 lt!646452) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646452) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646452) (ite (is-Found!12208 lt!646452) (= (select (arr!47968 lt!646404) (index!51225 lt!646452)) lt!646402) (and (is-MissingVacant!12208 lt!646452) (= (index!51227 lt!646452) intermediateAfterIndex!19) (= (select (arr!47968 lt!646404) (index!51227 lt!646452)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156061 (= lt!646452 e!830404)))

(declare-fun c!136662 () Bool)

(assert (=> d!156061 (= c!136662 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646453 () (_ BitVec 64))

(assert (=> d!156061 (= lt!646453 (select (arr!47968 lt!646404) index!646))))

(assert (=> d!156061 (validMask!0 mask!2687)))

(assert (=> d!156061 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646402 lt!646404 mask!2687) lt!646452)))

(declare-fun b!1480555 () Bool)

(assert (=> b!1480555 (= e!830403 (MissingVacant!12208 intermediateAfterIndex!19))))

(declare-fun b!1480556 () Bool)

(assert (=> b!1480556 (= e!830404 e!830402)))

(declare-fun c!136660 () Bool)

(assert (=> b!1480556 (= c!136660 (= lt!646453 lt!646402))))

(declare-fun b!1480557 () Bool)

(declare-fun c!136661 () Bool)

(assert (=> b!1480557 (= c!136661 (= lt!646453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480557 (= e!830402 e!830403)))

(assert (= (and d!156061 c!136662) b!1480552))

(assert (= (and d!156061 (not c!136662)) b!1480556))

(assert (= (and b!1480556 c!136660) b!1480554))

(assert (= (and b!1480556 (not c!136660)) b!1480557))

(assert (= (and b!1480557 c!136661) b!1480555))

(assert (= (and b!1480557 (not c!136661)) b!1480553))

(declare-fun m!1366327 () Bool)

(assert (=> b!1480553 m!1366327))

(assert (=> b!1480553 m!1366327))

(declare-fun m!1366329 () Bool)

(assert (=> b!1480553 m!1366329))

(declare-fun m!1366331 () Bool)

(assert (=> d!156061 m!1366331))

(declare-fun m!1366333 () Bool)

(assert (=> d!156061 m!1366333))

(declare-fun m!1366335 () Bool)

(assert (=> d!156061 m!1366335))

(assert (=> d!156061 m!1366229))

(assert (=> b!1480422 d!156061))

(declare-fun b!1480624 () Bool)

(declare-fun e!830444 () SeekEntryResult!12208)

(declare-fun lt!646489 () SeekEntryResult!12208)

(assert (=> b!1480624 (= e!830444 (Found!12208 (index!51226 lt!646489)))))

(declare-fun b!1480625 () Bool)

(declare-fun e!830443 () SeekEntryResult!12208)

(assert (=> b!1480625 (= e!830443 (seekKeyOrZeroReturnVacant!0 (x!132799 lt!646489) (index!51226 lt!646489) (index!51226 lt!646489) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480626 () Bool)

(declare-fun e!830442 () SeekEntryResult!12208)

(assert (=> b!1480626 (= e!830442 e!830444)))

(declare-fun lt!646488 () (_ BitVec 64))

(assert (=> b!1480626 (= lt!646488 (select (arr!47968 lt!646404) (index!51226 lt!646489)))))

(declare-fun c!136690 () Bool)

(assert (=> b!1480626 (= c!136690 (= lt!646488 lt!646402))))

(declare-fun b!1480627 () Bool)

(assert (=> b!1480627 (= e!830443 (MissingZero!12208 (index!51226 lt!646489)))))

(declare-fun b!1480628 () Bool)

(declare-fun c!136691 () Bool)

(assert (=> b!1480628 (= c!136691 (= lt!646488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480628 (= e!830444 e!830443)))

(declare-fun d!156069 () Bool)

(declare-fun lt!646490 () SeekEntryResult!12208)

(assert (=> d!156069 (and (or (is-Undefined!12208 lt!646490) (not (is-Found!12208 lt!646490)) (and (bvsge (index!51225 lt!646490) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646490) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646490) (is-Found!12208 lt!646490) (not (is-MissingZero!12208 lt!646490)) (and (bvsge (index!51224 lt!646490) #b00000000000000000000000000000000) (bvslt (index!51224 lt!646490) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646490) (is-Found!12208 lt!646490) (is-MissingZero!12208 lt!646490) (not (is-MissingVacant!12208 lt!646490)) (and (bvsge (index!51227 lt!646490) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646490) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646490) (ite (is-Found!12208 lt!646490) (= (select (arr!47968 lt!646404) (index!51225 lt!646490)) lt!646402) (ite (is-MissingZero!12208 lt!646490) (= (select (arr!47968 lt!646404) (index!51224 lt!646490)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12208 lt!646490) (= (select (arr!47968 lt!646404) (index!51227 lt!646490)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156069 (= lt!646490 e!830442)))

(declare-fun c!136692 () Bool)

(assert (=> d!156069 (= c!136692 (and (is-Intermediate!12208 lt!646489) (undefined!13020 lt!646489)))))

(assert (=> d!156069 (= lt!646489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646402 mask!2687) lt!646402 lt!646404 mask!2687))))

(assert (=> d!156069 (validMask!0 mask!2687)))

(assert (=> d!156069 (= (seekEntryOrOpen!0 lt!646402 lt!646404 mask!2687) lt!646490)))

(declare-fun b!1480629 () Bool)

(assert (=> b!1480629 (= e!830442 Undefined!12208)))

(assert (= (and d!156069 c!136692) b!1480629))

(assert (= (and d!156069 (not c!136692)) b!1480626))

(assert (= (and b!1480626 c!136690) b!1480624))

(assert (= (and b!1480626 (not c!136690)) b!1480628))

(assert (= (and b!1480628 c!136691) b!1480627))

(assert (= (and b!1480628 (not c!136691)) b!1480625))

(declare-fun m!1366371 () Bool)

(assert (=> b!1480625 m!1366371))

(declare-fun m!1366373 () Bool)

(assert (=> b!1480626 m!1366373))

(declare-fun m!1366377 () Bool)

(assert (=> d!156069 m!1366377))

(assert (=> d!156069 m!1366269))

(declare-fun m!1366379 () Bool)

(assert (=> d!156069 m!1366379))

(declare-fun m!1366381 () Bool)

(assert (=> d!156069 m!1366381))

(assert (=> d!156069 m!1366269))

(assert (=> d!156069 m!1366271))

(assert (=> d!156069 m!1366229))

(assert (=> b!1480422 d!156069))

(declare-fun b!1480642 () Bool)

(declare-fun e!830456 () Bool)

(declare-fun e!830455 () Bool)

(assert (=> b!1480642 (= e!830456 e!830455)))

(declare-fun c!136696 () Bool)

(assert (=> b!1480642 (= c!136696 (validKeyInArray!0 (select (arr!47968 a!2862) j!93)))))

(declare-fun b!1480643 () Bool)

(declare-fun e!830454 () Bool)

(assert (=> b!1480643 (= e!830455 e!830454)))

(declare-fun lt!646504 () (_ BitVec 64))

(assert (=> b!1480643 (= lt!646504 (select (arr!47968 a!2862) j!93))))

(declare-fun lt!646505 () Unit!49756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99378 (_ BitVec 64) (_ BitVec 32)) Unit!49756)

(assert (=> b!1480643 (= lt!646505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646504 j!93))))

(declare-fun arrayContainsKey!0 (array!99378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1480643 (arrayContainsKey!0 a!2862 lt!646504 #b00000000000000000000000000000000)))

(declare-fun lt!646503 () Unit!49756)

(assert (=> b!1480643 (= lt!646503 lt!646505)))

(declare-fun res!1006291 () Bool)

(assert (=> b!1480643 (= res!1006291 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) (Found!12208 j!93)))))

(assert (=> b!1480643 (=> (not res!1006291) (not e!830454))))

(declare-fun d!156087 () Bool)

(declare-fun res!1006292 () Bool)

(assert (=> d!156087 (=> res!1006292 e!830456)))

(assert (=> d!156087 (= res!1006292 (bvsge j!93 (size!48518 a!2862)))))

(assert (=> d!156087 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!830456)))

(declare-fun call!67835 () Bool)

(declare-fun bm!67832 () Bool)

(assert (=> bm!67832 (= call!67835 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480644 () Bool)

(assert (=> b!1480644 (= e!830455 call!67835)))

(declare-fun b!1480645 () Bool)

(assert (=> b!1480645 (= e!830454 call!67835)))

(assert (= (and d!156087 (not res!1006292)) b!1480642))

(assert (= (and b!1480642 c!136696) b!1480643))

(assert (= (and b!1480642 (not c!136696)) b!1480644))

(assert (= (and b!1480643 res!1006291) b!1480645))

(assert (= (or b!1480645 b!1480644) bm!67832))

(assert (=> b!1480642 m!1366241))

(assert (=> b!1480642 m!1366241))

(assert (=> b!1480642 m!1366267))

(assert (=> b!1480643 m!1366241))

(declare-fun m!1366393 () Bool)

(assert (=> b!1480643 m!1366393))

(declare-fun m!1366395 () Bool)

(assert (=> b!1480643 m!1366395))

(assert (=> b!1480643 m!1366241))

(assert (=> b!1480643 m!1366277))

(declare-fun m!1366397 () Bool)

(assert (=> bm!67832 m!1366397))

(assert (=> b!1480425 d!156087))

(declare-fun d!156091 () Bool)

(assert (=> d!156091 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646512 () Unit!49756)

(declare-fun choose!38 (array!99378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49756)

(assert (=> d!156091 (= lt!646512 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156091 (validMask!0 mask!2687)))

(assert (=> d!156091 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!646512)))

(declare-fun bs!42661 () Bool)

(assert (= bs!42661 d!156091))

(assert (=> bs!42661 m!1366261))

(declare-fun m!1366399 () Bool)

(assert (=> bs!42661 m!1366399))

(assert (=> bs!42661 m!1366229))

(assert (=> b!1480425 d!156091))

(declare-fun d!156093 () Bool)

(assert (=> d!156093 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126272 d!156093))

(declare-fun d!156097 () Bool)

(assert (=> d!156097 (= (array_inv!36996 a!2862) (bvsge (size!48518 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126272 d!156097))

(declare-fun b!1480737 () Bool)

(declare-fun e!830508 () Bool)

(declare-fun lt!646543 () SeekEntryResult!12208)

(assert (=> b!1480737 (= e!830508 (bvsge (x!132799 lt!646543) #b01111111111111111111111111111110))))

(declare-fun b!1480738 () Bool)

(assert (=> b!1480738 (and (bvsge (index!51226 lt!646543) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646543) (size!48518 lt!646404)))))

(declare-fun e!830506 () Bool)

(assert (=> b!1480738 (= e!830506 (= (select (arr!47968 lt!646404) (index!51226 lt!646543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480739 () Bool)

(declare-fun e!830507 () Bool)

(assert (=> b!1480739 (= e!830508 e!830507)))

(declare-fun res!1006311 () Bool)

(assert (=> b!1480739 (= res!1006311 (and (is-Intermediate!12208 lt!646543) (not (undefined!13020 lt!646543)) (bvslt (x!132799 lt!646543) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646543) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646543) x!665)))))

(assert (=> b!1480739 (=> (not res!1006311) (not e!830507))))

(declare-fun e!830509 () SeekEntryResult!12208)

(declare-fun b!1480740 () Bool)

(assert (=> b!1480740 (= e!830509 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480741 () Bool)

(assert (=> b!1480741 (and (bvsge (index!51226 lt!646543) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646543) (size!48518 lt!646404)))))

(declare-fun res!1006310 () Bool)

(assert (=> b!1480741 (= res!1006310 (= (select (arr!47968 lt!646404) (index!51226 lt!646543)) lt!646402))))

(assert (=> b!1480741 (=> res!1006310 e!830506)))

(assert (=> b!1480741 (= e!830507 e!830506)))

(declare-fun d!156099 () Bool)

(assert (=> d!156099 e!830508))

(declare-fun c!136736 () Bool)

(assert (=> d!156099 (= c!136736 (and (is-Intermediate!12208 lt!646543) (undefined!13020 lt!646543)))))

(declare-fun e!830510 () SeekEntryResult!12208)

(assert (=> d!156099 (= lt!646543 e!830510)))

(declare-fun c!136734 () Bool)

(assert (=> d!156099 (= c!136734 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646542 () (_ BitVec 64))

(assert (=> d!156099 (= lt!646542 (select (arr!47968 lt!646404) index!646))))

(assert (=> d!156099 (validMask!0 mask!2687)))

(assert (=> d!156099 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646402 lt!646404 mask!2687) lt!646543)))

(declare-fun b!1480742 () Bool)

(assert (=> b!1480742 (= e!830510 e!830509)))

(declare-fun c!136735 () Bool)

(assert (=> b!1480742 (= c!136735 (or (= lt!646542 lt!646402) (= (bvadd lt!646542 lt!646542) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480743 () Bool)

(assert (=> b!1480743 (and (bvsge (index!51226 lt!646543) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646543) (size!48518 lt!646404)))))

(declare-fun res!1006312 () Bool)

(assert (=> b!1480743 (= res!1006312 (= (select (arr!47968 lt!646404) (index!51226 lt!646543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480743 (=> res!1006312 e!830506)))

(declare-fun b!1480744 () Bool)

(assert (=> b!1480744 (= e!830510 (Intermediate!12208 true index!646 x!665))))

(declare-fun b!1480745 () Bool)

(assert (=> b!1480745 (= e!830509 (Intermediate!12208 false index!646 x!665))))

(assert (= (and d!156099 c!136734) b!1480744))

(assert (= (and d!156099 (not c!136734)) b!1480742))

(assert (= (and b!1480742 c!136735) b!1480745))

(assert (= (and b!1480742 (not c!136735)) b!1480740))

(assert (= (and d!156099 c!136736) b!1480737))

(assert (= (and d!156099 (not c!136736)) b!1480739))

(assert (= (and b!1480739 res!1006311) b!1480741))

(assert (= (and b!1480741 (not res!1006310)) b!1480743))

(assert (= (and b!1480743 (not res!1006312)) b!1480738))

(declare-fun m!1366459 () Bool)

(assert (=> b!1480741 m!1366459))

(assert (=> d!156099 m!1366335))

(assert (=> d!156099 m!1366229))

(assert (=> b!1480740 m!1366327))

(assert (=> b!1480740 m!1366327))

(declare-fun m!1366461 () Bool)

(assert (=> b!1480740 m!1366461))

(assert (=> b!1480743 m!1366459))

(assert (=> b!1480738 m!1366459))

(assert (=> b!1480423 d!156099))

(declare-fun b!1480746 () Bool)

(declare-fun e!830513 () SeekEntryResult!12208)

(declare-fun lt!646545 () SeekEntryResult!12208)

(assert (=> b!1480746 (= e!830513 (Found!12208 (index!51226 lt!646545)))))

(declare-fun e!830512 () SeekEntryResult!12208)

(declare-fun b!1480747 () Bool)

(assert (=> b!1480747 (= e!830512 (seekKeyOrZeroReturnVacant!0 (x!132799 lt!646545) (index!51226 lt!646545) (index!51226 lt!646545) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480748 () Bool)

(declare-fun e!830511 () SeekEntryResult!12208)

(assert (=> b!1480748 (= e!830511 e!830513)))

(declare-fun lt!646544 () (_ BitVec 64))

(assert (=> b!1480748 (= lt!646544 (select (arr!47968 a!2862) (index!51226 lt!646545)))))

(declare-fun c!136737 () Bool)

(assert (=> b!1480748 (= c!136737 (= lt!646544 (select (arr!47968 a!2862) j!93)))))

(declare-fun b!1480749 () Bool)

(assert (=> b!1480749 (= e!830512 (MissingZero!12208 (index!51226 lt!646545)))))

(declare-fun b!1480750 () Bool)

(declare-fun c!136738 () Bool)

(assert (=> b!1480750 (= c!136738 (= lt!646544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480750 (= e!830513 e!830512)))

(declare-fun d!156115 () Bool)

(declare-fun lt!646546 () SeekEntryResult!12208)

(assert (=> d!156115 (and (or (is-Undefined!12208 lt!646546) (not (is-Found!12208 lt!646546)) (and (bvsge (index!51225 lt!646546) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646546) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646546) (is-Found!12208 lt!646546) (not (is-MissingZero!12208 lt!646546)) (and (bvsge (index!51224 lt!646546) #b00000000000000000000000000000000) (bvslt (index!51224 lt!646546) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646546) (is-Found!12208 lt!646546) (is-MissingZero!12208 lt!646546) (not (is-MissingVacant!12208 lt!646546)) (and (bvsge (index!51227 lt!646546) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646546) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646546) (ite (is-Found!12208 lt!646546) (= (select (arr!47968 a!2862) (index!51225 lt!646546)) (select (arr!47968 a!2862) j!93)) (ite (is-MissingZero!12208 lt!646546) (= (select (arr!47968 a!2862) (index!51224 lt!646546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12208 lt!646546) (= (select (arr!47968 a!2862) (index!51227 lt!646546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156115 (= lt!646546 e!830511)))

(declare-fun c!136739 () Bool)

(assert (=> d!156115 (= c!136739 (and (is-Intermediate!12208 lt!646545) (undefined!13020 lt!646545)))))

(assert (=> d!156115 (= lt!646545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156115 (validMask!0 mask!2687)))

(assert (=> d!156115 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646546)))

(declare-fun b!1480751 () Bool)

(assert (=> b!1480751 (= e!830511 Undefined!12208)))

(assert (= (and d!156115 c!136739) b!1480751))

(assert (= (and d!156115 (not c!136739)) b!1480748))

(assert (= (and b!1480748 c!136737) b!1480746))

(assert (= (and b!1480748 (not c!136737)) b!1480750))

(assert (= (and b!1480750 c!136738) b!1480749))

(assert (= (and b!1480750 (not c!136738)) b!1480747))

(assert (=> b!1480747 m!1366241))

(declare-fun m!1366463 () Bool)

(assert (=> b!1480747 m!1366463))

(declare-fun m!1366465 () Bool)

(assert (=> b!1480748 m!1366465))

(declare-fun m!1366467 () Bool)

(assert (=> d!156115 m!1366467))

(assert (=> d!156115 m!1366241))

(assert (=> d!156115 m!1366263))

(declare-fun m!1366469 () Bool)

(assert (=> d!156115 m!1366469))

(declare-fun m!1366471 () Bool)

(assert (=> d!156115 m!1366471))

(assert (=> d!156115 m!1366263))

(assert (=> d!156115 m!1366241))

(assert (=> d!156115 m!1366265))

(assert (=> d!156115 m!1366229))

(assert (=> b!1480417 d!156115))

(declare-fun b!1480752 () Bool)

(declare-fun e!830516 () Bool)

(declare-fun e!830515 () Bool)

(assert (=> b!1480752 (= e!830516 e!830515)))

(declare-fun c!136740 () Bool)

(assert (=> b!1480752 (= c!136740 (validKeyInArray!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480753 () Bool)

(declare-fun e!830514 () Bool)

(assert (=> b!1480753 (= e!830515 e!830514)))

(declare-fun lt!646548 () (_ BitVec 64))

(assert (=> b!1480753 (= lt!646548 (select (arr!47968 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!646549 () Unit!49756)

(assert (=> b!1480753 (= lt!646549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646548 #b00000000000000000000000000000000))))

(assert (=> b!1480753 (arrayContainsKey!0 a!2862 lt!646548 #b00000000000000000000000000000000)))

(declare-fun lt!646547 () Unit!49756)

(assert (=> b!1480753 (= lt!646547 lt!646549)))

(declare-fun res!1006313 () Bool)

(assert (=> b!1480753 (= res!1006313 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12208 #b00000000000000000000000000000000)))))

(assert (=> b!1480753 (=> (not res!1006313) (not e!830514))))

(declare-fun d!156117 () Bool)

(declare-fun res!1006314 () Bool)

(assert (=> d!156117 (=> res!1006314 e!830516)))

(assert (=> d!156117 (= res!1006314 (bvsge #b00000000000000000000000000000000 (size!48518 a!2862)))))

(assert (=> d!156117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!830516)))

(declare-fun bm!67834 () Bool)

(declare-fun call!67837 () Bool)

(assert (=> bm!67834 (= call!67837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480754 () Bool)

(assert (=> b!1480754 (= e!830515 call!67837)))

(declare-fun b!1480755 () Bool)

(assert (=> b!1480755 (= e!830514 call!67837)))

(assert (= (and d!156117 (not res!1006314)) b!1480752))

(assert (= (and b!1480752 c!136740) b!1480753))

(assert (= (and b!1480752 (not c!136740)) b!1480754))

(assert (= (and b!1480753 res!1006313) b!1480755))

(assert (= (or b!1480755 b!1480754) bm!67834))

(declare-fun m!1366473 () Bool)

(assert (=> b!1480752 m!1366473))

(assert (=> b!1480752 m!1366473))

(declare-fun m!1366475 () Bool)

(assert (=> b!1480752 m!1366475))

(assert (=> b!1480753 m!1366473))

(declare-fun m!1366477 () Bool)

(assert (=> b!1480753 m!1366477))

(declare-fun m!1366479 () Bool)

(assert (=> b!1480753 m!1366479))

(assert (=> b!1480753 m!1366473))

(declare-fun m!1366481 () Bool)

(assert (=> b!1480753 m!1366481))

(declare-fun m!1366483 () Bool)

(assert (=> bm!67834 m!1366483))

(assert (=> b!1480428 d!156117))

(declare-fun b!1480781 () Bool)

(declare-fun e!830538 () Bool)

(declare-fun e!830539 () Bool)

(assert (=> b!1480781 (= e!830538 e!830539)))

(declare-fun c!136746 () Bool)

(assert (=> b!1480781 (= c!136746 (validKeyInArray!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156119 () Bool)

(declare-fun res!1006332 () Bool)

(declare-fun e!830540 () Bool)

(assert (=> d!156119 (=> res!1006332 e!830540)))

(assert (=> d!156119 (= res!1006332 (bvsge #b00000000000000000000000000000000 (size!48518 a!2862)))))

(assert (=> d!156119 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34466) e!830540)))

(declare-fun bm!67840 () Bool)

(declare-fun call!67843 () Bool)

(assert (=> bm!67840 (= call!67843 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136746 (Cons!34465 (select (arr!47968 a!2862) #b00000000000000000000000000000000) Nil!34466) Nil!34466)))))

(declare-fun b!1480782 () Bool)

(assert (=> b!1480782 (= e!830539 call!67843)))

(declare-fun b!1480783 () Bool)

(assert (=> b!1480783 (= e!830539 call!67843)))

(declare-fun b!1480784 () Bool)

(assert (=> b!1480784 (= e!830540 e!830538)))

(declare-fun res!1006331 () Bool)

(assert (=> b!1480784 (=> (not res!1006331) (not e!830538))))

(declare-fun e!830537 () Bool)

(assert (=> b!1480784 (= res!1006331 (not e!830537))))

(declare-fun res!1006330 () Bool)

(assert (=> b!1480784 (=> (not res!1006330) (not e!830537))))

(assert (=> b!1480784 (= res!1006330 (validKeyInArray!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480785 () Bool)

(declare-fun contains!9911 (List!34469 (_ BitVec 64)) Bool)

(assert (=> b!1480785 (= e!830537 (contains!9911 Nil!34466 (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156119 (not res!1006332)) b!1480784))

(assert (= (and b!1480784 res!1006330) b!1480785))

(assert (= (and b!1480784 res!1006331) b!1480781))

(assert (= (and b!1480781 c!136746) b!1480782))

(assert (= (and b!1480781 (not c!136746)) b!1480783))

(assert (= (or b!1480782 b!1480783) bm!67840))

(assert (=> b!1480781 m!1366473))

(assert (=> b!1480781 m!1366473))

(assert (=> b!1480781 m!1366475))

(assert (=> bm!67840 m!1366473))

(declare-fun m!1366489 () Bool)

(assert (=> bm!67840 m!1366489))

(assert (=> b!1480784 m!1366473))

(assert (=> b!1480784 m!1366473))

(assert (=> b!1480784 m!1366475))

(assert (=> b!1480785 m!1366473))

(assert (=> b!1480785 m!1366473))

(declare-fun m!1366491 () Bool)

(assert (=> b!1480785 m!1366491))

(assert (=> b!1480427 d!156119))

(declare-fun d!156127 () Bool)

(assert (=> d!156127 (= (validKeyInArray!0 (select (arr!47968 a!2862) i!1006)) (and (not (= (select (arr!47968 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47968 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480416 d!156127))

(declare-fun b!1480786 () Bool)

(declare-fun e!830543 () Bool)

(declare-fun lt!646551 () SeekEntryResult!12208)

(assert (=> b!1480786 (= e!830543 (bvsge (x!132799 lt!646551) #b01111111111111111111111111111110))))

(declare-fun b!1480787 () Bool)

(assert (=> b!1480787 (and (bvsge (index!51226 lt!646551) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646551) (size!48518 a!2862)))))

(declare-fun e!830541 () Bool)

(assert (=> b!1480787 (= e!830541 (= (select (arr!47968 a!2862) (index!51226 lt!646551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480788 () Bool)

(declare-fun e!830542 () Bool)

(assert (=> b!1480788 (= e!830543 e!830542)))

(declare-fun res!1006334 () Bool)

(assert (=> b!1480788 (= res!1006334 (and (is-Intermediate!12208 lt!646551) (not (undefined!13020 lt!646551)) (bvslt (x!132799 lt!646551) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646551) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646551) #b00000000000000000000000000000000)))))

(assert (=> b!1480788 (=> (not res!1006334) (not e!830542))))

(declare-fun e!830544 () SeekEntryResult!12208)

(declare-fun b!1480789 () Bool)

(assert (=> b!1480789 (= e!830544 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480790 () Bool)

(assert (=> b!1480790 (and (bvsge (index!51226 lt!646551) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646551) (size!48518 a!2862)))))

(declare-fun res!1006333 () Bool)

(assert (=> b!1480790 (= res!1006333 (= (select (arr!47968 a!2862) (index!51226 lt!646551)) (select (arr!47968 a!2862) j!93)))))

(assert (=> b!1480790 (=> res!1006333 e!830541)))

(assert (=> b!1480790 (= e!830542 e!830541)))

(declare-fun d!156129 () Bool)

(assert (=> d!156129 e!830543))

(declare-fun c!136749 () Bool)

(assert (=> d!156129 (= c!136749 (and (is-Intermediate!12208 lt!646551) (undefined!13020 lt!646551)))))

(declare-fun e!830545 () SeekEntryResult!12208)

(assert (=> d!156129 (= lt!646551 e!830545)))

(declare-fun c!136747 () Bool)

(assert (=> d!156129 (= c!136747 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646550 () (_ BitVec 64))

(assert (=> d!156129 (= lt!646550 (select (arr!47968 a!2862) (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687)))))

(assert (=> d!156129 (validMask!0 mask!2687)))

(assert (=> d!156129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646551)))

(declare-fun b!1480791 () Bool)

(assert (=> b!1480791 (= e!830545 e!830544)))

(declare-fun c!136748 () Bool)

(assert (=> b!1480791 (= c!136748 (or (= lt!646550 (select (arr!47968 a!2862) j!93)) (= (bvadd lt!646550 lt!646550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480792 () Bool)

(assert (=> b!1480792 (and (bvsge (index!51226 lt!646551) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646551) (size!48518 a!2862)))))

(declare-fun res!1006335 () Bool)

(assert (=> b!1480792 (= res!1006335 (= (select (arr!47968 a!2862) (index!51226 lt!646551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480792 (=> res!1006335 e!830541)))

(declare-fun b!1480793 () Bool)

(assert (=> b!1480793 (= e!830545 (Intermediate!12208 true (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480794 () Bool)

(assert (=> b!1480794 (= e!830544 (Intermediate!12208 false (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156129 c!136747) b!1480793))

(assert (= (and d!156129 (not c!136747)) b!1480791))

(assert (= (and b!1480791 c!136748) b!1480794))

(assert (= (and b!1480791 (not c!136748)) b!1480789))

(assert (= (and d!156129 c!136749) b!1480786))

(assert (= (and d!156129 (not c!136749)) b!1480788))

(assert (= (and b!1480788 res!1006334) b!1480790))

(assert (= (and b!1480790 (not res!1006333)) b!1480792))

(assert (= (and b!1480792 (not res!1006335)) b!1480787))

(declare-fun m!1366493 () Bool)

(assert (=> b!1480790 m!1366493))

(assert (=> d!156129 m!1366263))

(declare-fun m!1366495 () Bool)

(assert (=> d!156129 m!1366495))

(assert (=> d!156129 m!1366229))

(assert (=> b!1480789 m!1366263))

(declare-fun m!1366497 () Bool)

(assert (=> b!1480789 m!1366497))

(assert (=> b!1480789 m!1366497))

(assert (=> b!1480789 m!1366241))

(declare-fun m!1366499 () Bool)

(assert (=> b!1480789 m!1366499))

(assert (=> b!1480792 m!1366493))

(assert (=> b!1480787 m!1366493))

(assert (=> b!1480415 d!156129))

(declare-fun d!156131 () Bool)

(declare-fun lt!646557 () (_ BitVec 32))

(declare-fun lt!646556 () (_ BitVec 32))

(assert (=> d!156131 (= lt!646557 (bvmul (bvxor lt!646556 (bvlshr lt!646556 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156131 (= lt!646556 ((_ extract 31 0) (bvand (bvxor (select (arr!47968 a!2862) j!93) (bvlshr (select (arr!47968 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156131 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006336 (let ((h!35836 ((_ extract 31 0) (bvand (bvxor (select (arr!47968 a!2862) j!93) (bvlshr (select (arr!47968 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132808 (bvmul (bvxor h!35836 (bvlshr h!35836 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132808 (bvlshr x!132808 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006336 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006336 #b00000000000000000000000000000000))))))

(assert (=> d!156131 (= (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) (bvand (bvxor lt!646557 (bvlshr lt!646557 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480415 d!156131))

(declare-fun b!1480795 () Bool)

(declare-fun e!830548 () Bool)

(declare-fun lt!646559 () SeekEntryResult!12208)

(assert (=> b!1480795 (= e!830548 (bvsge (x!132799 lt!646559) #b01111111111111111111111111111110))))

(declare-fun b!1480796 () Bool)

(assert (=> b!1480796 (and (bvsge (index!51226 lt!646559) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646559) (size!48518 lt!646404)))))

(declare-fun e!830546 () Bool)

(assert (=> b!1480796 (= e!830546 (= (select (arr!47968 lt!646404) (index!51226 lt!646559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480797 () Bool)

(declare-fun e!830547 () Bool)

(assert (=> b!1480797 (= e!830548 e!830547)))

(declare-fun res!1006338 () Bool)

(assert (=> b!1480797 (= res!1006338 (and (is-Intermediate!12208 lt!646559) (not (undefined!13020 lt!646559)) (bvslt (x!132799 lt!646559) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646559) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646559) #b00000000000000000000000000000000)))))

(assert (=> b!1480797 (=> (not res!1006338) (not e!830547))))

(declare-fun b!1480798 () Bool)

(declare-fun e!830549 () SeekEntryResult!12208)

(assert (=> b!1480798 (= e!830549 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480799 () Bool)

(assert (=> b!1480799 (and (bvsge (index!51226 lt!646559) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646559) (size!48518 lt!646404)))))

(declare-fun res!1006337 () Bool)

(assert (=> b!1480799 (= res!1006337 (= (select (arr!47968 lt!646404) (index!51226 lt!646559)) lt!646402))))

(assert (=> b!1480799 (=> res!1006337 e!830546)))

(assert (=> b!1480799 (= e!830547 e!830546)))

(declare-fun d!156133 () Bool)

(assert (=> d!156133 e!830548))

(declare-fun c!136752 () Bool)

(assert (=> d!156133 (= c!136752 (and (is-Intermediate!12208 lt!646559) (undefined!13020 lt!646559)))))

(declare-fun e!830550 () SeekEntryResult!12208)

(assert (=> d!156133 (= lt!646559 e!830550)))

(declare-fun c!136750 () Bool)

(assert (=> d!156133 (= c!136750 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!646558 () (_ BitVec 64))

(assert (=> d!156133 (= lt!646558 (select (arr!47968 lt!646404) (toIndex!0 lt!646402 mask!2687)))))

(assert (=> d!156133 (validMask!0 mask!2687)))

(assert (=> d!156133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646402 mask!2687) lt!646402 lt!646404 mask!2687) lt!646559)))

(declare-fun b!1480800 () Bool)

(assert (=> b!1480800 (= e!830550 e!830549)))

(declare-fun c!136751 () Bool)

(assert (=> b!1480800 (= c!136751 (or (= lt!646558 lt!646402) (= (bvadd lt!646558 lt!646558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480801 () Bool)

(assert (=> b!1480801 (and (bvsge (index!51226 lt!646559) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646559) (size!48518 lt!646404)))))

(declare-fun res!1006339 () Bool)

(assert (=> b!1480801 (= res!1006339 (= (select (arr!47968 lt!646404) (index!51226 lt!646559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480801 (=> res!1006339 e!830546)))

(declare-fun b!1480802 () Bool)

(assert (=> b!1480802 (= e!830550 (Intermediate!12208 true (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480803 () Bool)

(assert (=> b!1480803 (= e!830549 (Intermediate!12208 false (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156133 c!136750) b!1480802))

(assert (= (and d!156133 (not c!136750)) b!1480800))

(assert (= (and b!1480800 c!136751) b!1480803))

(assert (= (and b!1480800 (not c!136751)) b!1480798))

(assert (= (and d!156133 c!136752) b!1480795))

(assert (= (and d!156133 (not c!136752)) b!1480797))

(assert (= (and b!1480797 res!1006338) b!1480799))

(assert (= (and b!1480799 (not res!1006337)) b!1480801))

(assert (= (and b!1480801 (not res!1006339)) b!1480796))

(declare-fun m!1366501 () Bool)

(assert (=> b!1480799 m!1366501))

(assert (=> d!156133 m!1366269))

(declare-fun m!1366503 () Bool)

(assert (=> d!156133 m!1366503))

(assert (=> d!156133 m!1366229))

(assert (=> b!1480798 m!1366269))

(declare-fun m!1366505 () Bool)

(assert (=> b!1480798 m!1366505))

(assert (=> b!1480798 m!1366505))

(declare-fun m!1366507 () Bool)

(assert (=> b!1480798 m!1366507))

(assert (=> b!1480801 m!1366501))

(assert (=> b!1480796 m!1366501))

(assert (=> b!1480430 d!156133))

(declare-fun d!156137 () Bool)

(declare-fun lt!646561 () (_ BitVec 32))

(declare-fun lt!646560 () (_ BitVec 32))

(assert (=> d!156137 (= lt!646561 (bvmul (bvxor lt!646560 (bvlshr lt!646560 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156137 (= lt!646560 ((_ extract 31 0) (bvand (bvxor lt!646402 (bvlshr lt!646402 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156137 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006336 (let ((h!35836 ((_ extract 31 0) (bvand (bvxor lt!646402 (bvlshr lt!646402 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132808 (bvmul (bvxor h!35836 (bvlshr h!35836 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132808 (bvlshr x!132808 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006336 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006336 #b00000000000000000000000000000000))))))

(assert (=> d!156137 (= (toIndex!0 lt!646402 mask!2687) (bvand (bvxor lt!646561 (bvlshr lt!646561 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480430 d!156137))

(declare-fun d!156139 () Bool)

(assert (=> d!156139 (= (validKeyInArray!0 (select (arr!47968 a!2862) j!93)) (and (not (= (select (arr!47968 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47968 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480429 d!156139))

(declare-fun b!1480804 () Bool)

(declare-fun e!830553 () Bool)

(declare-fun lt!646563 () SeekEntryResult!12208)

(assert (=> b!1480804 (= e!830553 (bvsge (x!132799 lt!646563) #b01111111111111111111111111111110))))

(declare-fun b!1480805 () Bool)

(assert (=> b!1480805 (and (bvsge (index!51226 lt!646563) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646563) (size!48518 a!2862)))))

(declare-fun e!830551 () Bool)

(assert (=> b!1480805 (= e!830551 (= (select (arr!47968 a!2862) (index!51226 lt!646563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480806 () Bool)

(declare-fun e!830552 () Bool)

(assert (=> b!1480806 (= e!830553 e!830552)))

(declare-fun res!1006341 () Bool)

(assert (=> b!1480806 (= res!1006341 (and (is-Intermediate!12208 lt!646563) (not (undefined!13020 lt!646563)) (bvslt (x!132799 lt!646563) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646563) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646563) x!665)))))

(assert (=> b!1480806 (=> (not res!1006341) (not e!830552))))

(declare-fun b!1480807 () Bool)

(declare-fun e!830554 () SeekEntryResult!12208)

(assert (=> b!1480807 (= e!830554 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480808 () Bool)

(assert (=> b!1480808 (and (bvsge (index!51226 lt!646563) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646563) (size!48518 a!2862)))))

(declare-fun res!1006340 () Bool)

(assert (=> b!1480808 (= res!1006340 (= (select (arr!47968 a!2862) (index!51226 lt!646563)) (select (arr!47968 a!2862) j!93)))))

(assert (=> b!1480808 (=> res!1006340 e!830551)))

(assert (=> b!1480808 (= e!830552 e!830551)))

(declare-fun d!156141 () Bool)

(assert (=> d!156141 e!830553))

(declare-fun c!136755 () Bool)

(assert (=> d!156141 (= c!136755 (and (is-Intermediate!12208 lt!646563) (undefined!13020 lt!646563)))))

(declare-fun e!830555 () SeekEntryResult!12208)

(assert (=> d!156141 (= lt!646563 e!830555)))

(declare-fun c!136753 () Bool)

(assert (=> d!156141 (= c!136753 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646562 () (_ BitVec 64))

(assert (=> d!156141 (= lt!646562 (select (arr!47968 a!2862) index!646))))

(assert (=> d!156141 (validMask!0 mask!2687)))

(assert (=> d!156141 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646563)))

(declare-fun b!1480809 () Bool)

(assert (=> b!1480809 (= e!830555 e!830554)))

(declare-fun c!136754 () Bool)

(assert (=> b!1480809 (= c!136754 (or (= lt!646562 (select (arr!47968 a!2862) j!93)) (= (bvadd lt!646562 lt!646562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480810 () Bool)

(assert (=> b!1480810 (and (bvsge (index!51226 lt!646563) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646563) (size!48518 a!2862)))))

(declare-fun res!1006342 () Bool)

(assert (=> b!1480810 (= res!1006342 (= (select (arr!47968 a!2862) (index!51226 lt!646563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480810 (=> res!1006342 e!830551)))

(declare-fun b!1480811 () Bool)

(assert (=> b!1480811 (= e!830555 (Intermediate!12208 true index!646 x!665))))

(declare-fun b!1480812 () Bool)

(assert (=> b!1480812 (= e!830554 (Intermediate!12208 false index!646 x!665))))

(assert (= (and d!156141 c!136753) b!1480811))

(assert (= (and d!156141 (not c!136753)) b!1480809))

(assert (= (and b!1480809 c!136754) b!1480812))

(assert (= (and b!1480809 (not c!136754)) b!1480807))

(assert (= (and d!156141 c!136755) b!1480804))

(assert (= (and d!156141 (not c!136755)) b!1480806))

(assert (= (and b!1480806 res!1006341) b!1480808))

(assert (= (and b!1480808 (not res!1006340)) b!1480810))

(assert (= (and b!1480810 (not res!1006342)) b!1480805))

(declare-fun m!1366509 () Bool)

(assert (=> b!1480808 m!1366509))

(assert (=> d!156141 m!1366259))

(assert (=> d!156141 m!1366229))

(assert (=> b!1480807 m!1366327))

(assert (=> b!1480807 m!1366327))

(assert (=> b!1480807 m!1366241))

(declare-fun m!1366511 () Bool)

(assert (=> b!1480807 m!1366511))

(assert (=> b!1480810 m!1366509))

(assert (=> b!1480805 m!1366509))

(assert (=> b!1480418 d!156141))

(push 1)

(assert (not d!156129))

(assert (not b!1480625))

(assert (not b!1480785))

(assert (not d!156115))

(assert (not d!156061))

(assert (not b!1480789))

(assert (not b!1480553))

(assert (not d!156069))

(assert (not b!1480807))

(assert (not b!1480740))

(assert (not b!1480798))

(assert (not b!1480753))

(assert (not bm!67832))

(assert (not b!1480643))

(assert (not b!1480642))

(assert (not d!156133))

(assert (not bm!67840))

(assert (not b!1480781))

(assert (not d!156141))

(assert (not d!156099))

(assert (not d!156091))

(assert (not bm!67834))

(assert (not b!1480752))

(assert (not b!1480784))

(assert (not b!1480747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!156129 d!156093))

(declare-fun b!1480900 () Bool)

(declare-fun e!830614 () Bool)

(declare-fun lt!646600 () SeekEntryResult!12208)

(assert (=> b!1480900 (= e!830614 (bvsge (x!132799 lt!646600) #b01111111111111111111111111111110))))

(declare-fun b!1480901 () Bool)

(assert (=> b!1480901 (and (bvsge (index!51226 lt!646600) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646600) (size!48518 lt!646404)))))

(declare-fun e!830612 () Bool)

(assert (=> b!1480901 (= e!830612 (= (select (arr!47968 lt!646404) (index!51226 lt!646600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480902 () Bool)

(declare-fun e!830613 () Bool)

(assert (=> b!1480902 (= e!830614 e!830613)))

(declare-fun res!1006377 () Bool)

(assert (=> b!1480902 (= res!1006377 (and (is-Intermediate!12208 lt!646600) (not (undefined!13020 lt!646600)) (bvslt (x!132799 lt!646600) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646600) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646600) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480902 (=> (not res!1006377) (not e!830613))))

(declare-fun b!1480903 () Bool)

(declare-fun e!830615 () SeekEntryResult!12208)

(assert (=> b!1480903 (= e!830615 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480904 () Bool)

(assert (=> b!1480904 (and (bvsge (index!51226 lt!646600) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646600) (size!48518 lt!646404)))))

(declare-fun res!1006376 () Bool)

(assert (=> b!1480904 (= res!1006376 (= (select (arr!47968 lt!646404) (index!51226 lt!646600)) lt!646402))))

(assert (=> b!1480904 (=> res!1006376 e!830612)))

(assert (=> b!1480904 (= e!830613 e!830612)))

(declare-fun d!156185 () Bool)

(assert (=> d!156185 e!830614))

(declare-fun c!136785 () Bool)

(assert (=> d!156185 (= c!136785 (and (is-Intermediate!12208 lt!646600) (undefined!13020 lt!646600)))))

(declare-fun e!830616 () SeekEntryResult!12208)

(assert (=> d!156185 (= lt!646600 e!830616)))

(declare-fun c!136783 () Bool)

(assert (=> d!156185 (= c!136783 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646599 () (_ BitVec 64))

(assert (=> d!156185 (= lt!646599 (select (arr!47968 lt!646404) (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156185 (validMask!0 mask!2687)))

(assert (=> d!156185 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646402 lt!646404 mask!2687) lt!646600)))

(declare-fun b!1480905 () Bool)

(assert (=> b!1480905 (= e!830616 e!830615)))

(declare-fun c!136784 () Bool)

(assert (=> b!1480905 (= c!136784 (or (= lt!646599 lt!646402) (= (bvadd lt!646599 lt!646599) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480906 () Bool)

(assert (=> b!1480906 (and (bvsge (index!51226 lt!646600) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646600) (size!48518 lt!646404)))))

(declare-fun res!1006378 () Bool)

(assert (=> b!1480906 (= res!1006378 (= (select (arr!47968 lt!646404) (index!51226 lt!646600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480906 (=> res!1006378 e!830612)))

(declare-fun b!1480907 () Bool)

(assert (=> b!1480907 (= e!830616 (Intermediate!12208 true (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480908 () Bool)

(assert (=> b!1480908 (= e!830615 (Intermediate!12208 false (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156185 c!136783) b!1480907))

(assert (= (and d!156185 (not c!136783)) b!1480905))

(assert (= (and b!1480905 c!136784) b!1480908))

(assert (= (and b!1480905 (not c!136784)) b!1480903))

(assert (= (and d!156185 c!136785) b!1480900))

(assert (= (and d!156185 (not c!136785)) b!1480902))

(assert (= (and b!1480902 res!1006377) b!1480904))

(assert (= (and b!1480904 (not res!1006376)) b!1480906))

(assert (= (and b!1480906 (not res!1006378)) b!1480901))

(declare-fun m!1366627 () Bool)

(assert (=> b!1480904 m!1366627))

(assert (=> d!156185 m!1366505))

(declare-fun m!1366629 () Bool)

(assert (=> d!156185 m!1366629))

(assert (=> d!156185 m!1366229))

(assert (=> b!1480903 m!1366505))

(declare-fun m!1366631 () Bool)

(assert (=> b!1480903 m!1366631))

(assert (=> b!1480903 m!1366631))

(declare-fun m!1366633 () Bool)

(assert (=> b!1480903 m!1366633))

(assert (=> b!1480906 m!1366627))

(assert (=> b!1480901 m!1366627))

(assert (=> b!1480798 d!156185))

(declare-fun d!156187 () Bool)

(declare-fun lt!646603 () (_ BitVec 32))

(assert (=> d!156187 (and (bvsge lt!646603 #b00000000000000000000000000000000) (bvslt lt!646603 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156187 (= lt!646603 (choose!52 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156187 (validMask!0 mask!2687)))

(assert (=> d!156187 (= (nextIndex!0 (toIndex!0 lt!646402 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646603)))

(declare-fun bs!42668 () Bool)

(assert (= bs!42668 d!156187))

(assert (=> bs!42668 m!1366269))

(declare-fun m!1366635 () Bool)

(assert (=> bs!42668 m!1366635))

(assert (=> bs!42668 m!1366229))

(assert (=> b!1480798 d!156187))

(declare-fun b!1480909 () Bool)

(declare-fun e!830619 () SeekEntryResult!12208)

(assert (=> b!1480909 (= e!830619 Undefined!12208)))

(declare-fun e!830618 () SeekEntryResult!12208)

(declare-fun b!1480910 () Bool)

(assert (=> b!1480910 (= e!830618 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132799 lt!646545) #b00000000000000000000000000000001) (nextIndex!0 (index!51226 lt!646545) (x!132799 lt!646545) mask!2687) (index!51226 lt!646545) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480911 () Bool)

(declare-fun e!830617 () SeekEntryResult!12208)

(assert (=> b!1480911 (= e!830617 (Found!12208 (index!51226 lt!646545)))))

(declare-fun d!156189 () Bool)

(declare-fun lt!646604 () SeekEntryResult!12208)

(assert (=> d!156189 (and (or (is-Undefined!12208 lt!646604) (not (is-Found!12208 lt!646604)) (and (bvsge (index!51225 lt!646604) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646604) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646604) (is-Found!12208 lt!646604) (not (is-MissingVacant!12208 lt!646604)) (not (= (index!51227 lt!646604) (index!51226 lt!646545))) (and (bvsge (index!51227 lt!646604) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646604) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646604) (ite (is-Found!12208 lt!646604) (= (select (arr!47968 a!2862) (index!51225 lt!646604)) (select (arr!47968 a!2862) j!93)) (and (is-MissingVacant!12208 lt!646604) (= (index!51227 lt!646604) (index!51226 lt!646545)) (= (select (arr!47968 a!2862) (index!51227 lt!646604)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156189 (= lt!646604 e!830619)))

(declare-fun c!136788 () Bool)

(assert (=> d!156189 (= c!136788 (bvsge (x!132799 lt!646545) #b01111111111111111111111111111110))))

(declare-fun lt!646605 () (_ BitVec 64))

(assert (=> d!156189 (= lt!646605 (select (arr!47968 a!2862) (index!51226 lt!646545)))))

(assert (=> d!156189 (validMask!0 mask!2687)))

(assert (=> d!156189 (= (seekKeyOrZeroReturnVacant!0 (x!132799 lt!646545) (index!51226 lt!646545) (index!51226 lt!646545) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646604)))

(declare-fun b!1480912 () Bool)

(assert (=> b!1480912 (= e!830618 (MissingVacant!12208 (index!51226 lt!646545)))))

(declare-fun b!1480913 () Bool)

(assert (=> b!1480913 (= e!830619 e!830617)))

(declare-fun c!136786 () Bool)

(assert (=> b!1480913 (= c!136786 (= lt!646605 (select (arr!47968 a!2862) j!93)))))

(declare-fun b!1480914 () Bool)

(declare-fun c!136787 () Bool)

(assert (=> b!1480914 (= c!136787 (= lt!646605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480914 (= e!830617 e!830618)))

(assert (= (and d!156189 c!136788) b!1480909))

(assert (= (and d!156189 (not c!136788)) b!1480913))

(assert (= (and b!1480913 c!136786) b!1480911))

(assert (= (and b!1480913 (not c!136786)) b!1480914))

(assert (= (and b!1480914 c!136787) b!1480912))

(assert (= (and b!1480914 (not c!136787)) b!1480910))

(declare-fun m!1366637 () Bool)

(assert (=> b!1480910 m!1366637))

(assert (=> b!1480910 m!1366637))

(assert (=> b!1480910 m!1366241))

(declare-fun m!1366639 () Bool)

(assert (=> b!1480910 m!1366639))

(declare-fun m!1366641 () Bool)

(assert (=> d!156189 m!1366641))

(declare-fun m!1366643 () Bool)

(assert (=> d!156189 m!1366643))

(assert (=> d!156189 m!1366465))

(assert (=> d!156189 m!1366229))

(assert (=> b!1480747 d!156189))

(assert (=> d!156099 d!156093))

(declare-fun b!1480915 () Bool)

(declare-fun e!830622 () Bool)

(declare-fun lt!646607 () SeekEntryResult!12208)

(assert (=> b!1480915 (= e!830622 (bvsge (x!132799 lt!646607) #b01111111111111111111111111111110))))

(declare-fun b!1480916 () Bool)

(assert (=> b!1480916 (and (bvsge (index!51226 lt!646607) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646607) (size!48518 a!2862)))))

(declare-fun e!830620 () Bool)

(assert (=> b!1480916 (= e!830620 (= (select (arr!47968 a!2862) (index!51226 lt!646607)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480917 () Bool)

(declare-fun e!830621 () Bool)

(assert (=> b!1480917 (= e!830622 e!830621)))

(declare-fun res!1006380 () Bool)

(assert (=> b!1480917 (= res!1006380 (and (is-Intermediate!12208 lt!646607) (not (undefined!13020 lt!646607)) (bvslt (x!132799 lt!646607) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646607) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646607) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480917 (=> (not res!1006380) (not e!830621))))

(declare-fun b!1480918 () Bool)

(declare-fun e!830623 () SeekEntryResult!12208)

(assert (=> b!1480918 (= e!830623 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480919 () Bool)

(assert (=> b!1480919 (and (bvsge (index!51226 lt!646607) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646607) (size!48518 a!2862)))))

(declare-fun res!1006379 () Bool)

(assert (=> b!1480919 (= res!1006379 (= (select (arr!47968 a!2862) (index!51226 lt!646607)) (select (arr!47968 a!2862) j!93)))))

(assert (=> b!1480919 (=> res!1006379 e!830620)))

(assert (=> b!1480919 (= e!830621 e!830620)))

(declare-fun d!156191 () Bool)

(assert (=> d!156191 e!830622))

(declare-fun c!136791 () Bool)

(assert (=> d!156191 (= c!136791 (and (is-Intermediate!12208 lt!646607) (undefined!13020 lt!646607)))))

(declare-fun e!830624 () SeekEntryResult!12208)

(assert (=> d!156191 (= lt!646607 e!830624)))

(declare-fun c!136789 () Bool)

(assert (=> d!156191 (= c!136789 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646606 () (_ BitVec 64))

(assert (=> d!156191 (= lt!646606 (select (arr!47968 a!2862) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156191 (validMask!0 mask!2687)))

(assert (=> d!156191 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646607)))

(declare-fun b!1480920 () Bool)

(assert (=> b!1480920 (= e!830624 e!830623)))

(declare-fun c!136790 () Bool)

(assert (=> b!1480920 (= c!136790 (or (= lt!646606 (select (arr!47968 a!2862) j!93)) (= (bvadd lt!646606 lt!646606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480921 () Bool)

(assert (=> b!1480921 (and (bvsge (index!51226 lt!646607) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646607) (size!48518 a!2862)))))

(declare-fun res!1006381 () Bool)

(assert (=> b!1480921 (= res!1006381 (= (select (arr!47968 a!2862) (index!51226 lt!646607)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480921 (=> res!1006381 e!830620)))

(declare-fun b!1480922 () Bool)

(assert (=> b!1480922 (= e!830624 (Intermediate!12208 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480923 () Bool)

(assert (=> b!1480923 (= e!830623 (Intermediate!12208 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156191 c!136789) b!1480922))

(assert (= (and d!156191 (not c!136789)) b!1480920))

(assert (= (and b!1480920 c!136790) b!1480923))

(assert (= (and b!1480920 (not c!136790)) b!1480918))

(assert (= (and d!156191 c!136791) b!1480915))

(assert (= (and d!156191 (not c!136791)) b!1480917))

(assert (= (and b!1480917 res!1006380) b!1480919))

(assert (= (and b!1480919 (not res!1006379)) b!1480921))

(assert (= (and b!1480921 (not res!1006381)) b!1480916))

(declare-fun m!1366645 () Bool)

(assert (=> b!1480919 m!1366645))

(assert (=> d!156191 m!1366327))

(declare-fun m!1366647 () Bool)

(assert (=> d!156191 m!1366647))

(assert (=> d!156191 m!1366229))

(assert (=> b!1480918 m!1366327))

(declare-fun m!1366649 () Bool)

(assert (=> b!1480918 m!1366649))

(assert (=> b!1480918 m!1366649))

(assert (=> b!1480918 m!1366241))

(declare-fun m!1366651 () Bool)

(assert (=> b!1480918 m!1366651))

(assert (=> b!1480921 m!1366645))

(assert (=> b!1480916 m!1366645))

(assert (=> b!1480807 d!156191))

(declare-fun d!156193 () Bool)

(declare-fun lt!646608 () (_ BitVec 32))

(assert (=> d!156193 (and (bvsge lt!646608 #b00000000000000000000000000000000) (bvslt lt!646608 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156193 (= lt!646608 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156193 (validMask!0 mask!2687)))

(assert (=> d!156193 (= (nextIndex!0 index!646 x!665 mask!2687) lt!646608)))

(declare-fun bs!42669 () Bool)

(assert (= bs!42669 d!156193))

(declare-fun m!1366653 () Bool)

(assert (=> bs!42669 m!1366653))

(assert (=> bs!42669 m!1366229))

(assert (=> b!1480807 d!156193))

(declare-fun b!1480924 () Bool)

(declare-fun e!830626 () Bool)

(declare-fun e!830627 () Bool)

(assert (=> b!1480924 (= e!830626 e!830627)))

(declare-fun c!136792 () Bool)

(assert (=> b!1480924 (= c!136792 (validKeyInArray!0 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!156195 () Bool)

(declare-fun res!1006384 () Bool)

(declare-fun e!830628 () Bool)

(assert (=> d!156195 (=> res!1006384 e!830628)))

(assert (=> d!156195 (= res!1006384 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48518 a!2862)))))

(assert (=> d!156195 (= (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136746 (Cons!34465 (select (arr!47968 a!2862) #b00000000000000000000000000000000) Nil!34466) Nil!34466)) e!830628)))

(declare-fun bm!67844 () Bool)

(declare-fun call!67847 () Bool)

(assert (=> bm!67844 (= call!67847 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!136792 (Cons!34465 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!136746 (Cons!34465 (select (arr!47968 a!2862) #b00000000000000000000000000000000) Nil!34466) Nil!34466)) (ite c!136746 (Cons!34465 (select (arr!47968 a!2862) #b00000000000000000000000000000000) Nil!34466) Nil!34466))))))

(declare-fun b!1480925 () Bool)

(assert (=> b!1480925 (= e!830627 call!67847)))

(declare-fun b!1480926 () Bool)

(assert (=> b!1480926 (= e!830627 call!67847)))

(declare-fun b!1480927 () Bool)

(assert (=> b!1480927 (= e!830628 e!830626)))

(declare-fun res!1006383 () Bool)

(assert (=> b!1480927 (=> (not res!1006383) (not e!830626))))

(declare-fun e!830625 () Bool)

(assert (=> b!1480927 (= res!1006383 (not e!830625))))

(declare-fun res!1006382 () Bool)

(assert (=> b!1480927 (=> (not res!1006382) (not e!830625))))

(assert (=> b!1480927 (= res!1006382 (validKeyInArray!0 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480928 () Bool)

(assert (=> b!1480928 (= e!830625 (contains!9911 (ite c!136746 (Cons!34465 (select (arr!47968 a!2862) #b00000000000000000000000000000000) Nil!34466) Nil!34466) (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!156195 (not res!1006384)) b!1480927))

(assert (= (and b!1480927 res!1006382) b!1480928))

(assert (= (and b!1480927 res!1006383) b!1480924))

(assert (= (and b!1480924 c!136792) b!1480925))

(assert (= (and b!1480924 (not c!136792)) b!1480926))

(assert (= (or b!1480925 b!1480926) bm!67844))

(declare-fun m!1366655 () Bool)

(assert (=> b!1480924 m!1366655))

(assert (=> b!1480924 m!1366655))

(declare-fun m!1366657 () Bool)

(assert (=> b!1480924 m!1366657))

(assert (=> bm!67844 m!1366655))

(declare-fun m!1366659 () Bool)

(assert (=> bm!67844 m!1366659))

(assert (=> b!1480927 m!1366655))

(assert (=> b!1480927 m!1366655))

(assert (=> b!1480927 m!1366657))

(assert (=> b!1480928 m!1366655))

(assert (=> b!1480928 m!1366655))

(declare-fun m!1366661 () Bool)

(assert (=> b!1480928 m!1366661))

(assert (=> bm!67840 d!156195))

(declare-fun d!156197 () Bool)

(assert (=> d!156197 (= (validKeyInArray!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000)) (and (not (= (select (arr!47968 a!2862) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47968 a!2862) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480752 d!156197))

(declare-fun d!156199 () Bool)

(assert (=> d!156199 (arrayContainsKey!0 a!2862 lt!646504 #b00000000000000000000000000000000)))

(declare-fun lt!646611 () Unit!49756)

(declare-fun choose!13 (array!99378 (_ BitVec 64) (_ BitVec 32)) Unit!49756)

(assert (=> d!156199 (= lt!646611 (choose!13 a!2862 lt!646504 j!93))))

(assert (=> d!156199 (bvsge j!93 #b00000000000000000000000000000000)))

(assert (=> d!156199 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646504 j!93) lt!646611)))

(declare-fun bs!42670 () Bool)

(assert (= bs!42670 d!156199))

(assert (=> bs!42670 m!1366395))

(declare-fun m!1366663 () Bool)

(assert (=> bs!42670 m!1366663))

(assert (=> b!1480643 d!156199))

(declare-fun d!156201 () Bool)

(declare-fun res!1006389 () Bool)

(declare-fun e!830633 () Bool)

(assert (=> d!156201 (=> res!1006389 e!830633)))

(assert (=> d!156201 (= res!1006389 (= (select (arr!47968 a!2862) #b00000000000000000000000000000000) lt!646504))))

(assert (=> d!156201 (= (arrayContainsKey!0 a!2862 lt!646504 #b00000000000000000000000000000000) e!830633)))

(declare-fun b!1480933 () Bool)

(declare-fun e!830634 () Bool)

(assert (=> b!1480933 (= e!830633 e!830634)))

(declare-fun res!1006390 () Bool)

(assert (=> b!1480933 (=> (not res!1006390) (not e!830634))))

(assert (=> b!1480933 (= res!1006390 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48518 a!2862)))))

(declare-fun b!1480934 () Bool)

(assert (=> b!1480934 (= e!830634 (arrayContainsKey!0 a!2862 lt!646504 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156201 (not res!1006389)) b!1480933))

(assert (= (and b!1480933 res!1006390) b!1480934))

(assert (=> d!156201 m!1366473))

(declare-fun m!1366665 () Bool)

(assert (=> b!1480934 m!1366665))

(assert (=> b!1480643 d!156201))

(assert (=> b!1480643 d!156115))

(assert (=> b!1480781 d!156197))

(assert (=> d!156133 d!156093))

(assert (=> b!1480642 d!156139))

(declare-fun b!1480935 () Bool)

(declare-fun e!830637 () SeekEntryResult!12208)

(assert (=> b!1480935 (= e!830637 Undefined!12208)))

(declare-fun e!830636 () SeekEntryResult!12208)

(declare-fun b!1480936 () Bool)

(assert (=> b!1480936 (= e!830636 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132799 lt!646489) #b00000000000000000000000000000001) (nextIndex!0 (index!51226 lt!646489) (x!132799 lt!646489) mask!2687) (index!51226 lt!646489) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480937 () Bool)

(declare-fun e!830635 () SeekEntryResult!12208)

(assert (=> b!1480937 (= e!830635 (Found!12208 (index!51226 lt!646489)))))

(declare-fun d!156203 () Bool)

(declare-fun lt!646612 () SeekEntryResult!12208)

(assert (=> d!156203 (and (or (is-Undefined!12208 lt!646612) (not (is-Found!12208 lt!646612)) (and (bvsge (index!51225 lt!646612) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646612) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646612) (is-Found!12208 lt!646612) (not (is-MissingVacant!12208 lt!646612)) (not (= (index!51227 lt!646612) (index!51226 lt!646489))) (and (bvsge (index!51227 lt!646612) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646612) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646612) (ite (is-Found!12208 lt!646612) (= (select (arr!47968 lt!646404) (index!51225 lt!646612)) lt!646402) (and (is-MissingVacant!12208 lt!646612) (= (index!51227 lt!646612) (index!51226 lt!646489)) (= (select (arr!47968 lt!646404) (index!51227 lt!646612)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156203 (= lt!646612 e!830637)))

(declare-fun c!136795 () Bool)

(assert (=> d!156203 (= c!136795 (bvsge (x!132799 lt!646489) #b01111111111111111111111111111110))))

(declare-fun lt!646613 () (_ BitVec 64))

(assert (=> d!156203 (= lt!646613 (select (arr!47968 lt!646404) (index!51226 lt!646489)))))

(assert (=> d!156203 (validMask!0 mask!2687)))

(assert (=> d!156203 (= (seekKeyOrZeroReturnVacant!0 (x!132799 lt!646489) (index!51226 lt!646489) (index!51226 lt!646489) lt!646402 lt!646404 mask!2687) lt!646612)))

(declare-fun b!1480938 () Bool)

(assert (=> b!1480938 (= e!830636 (MissingVacant!12208 (index!51226 lt!646489)))))

(declare-fun b!1480939 () Bool)

(assert (=> b!1480939 (= e!830637 e!830635)))

(declare-fun c!136793 () Bool)

(assert (=> b!1480939 (= c!136793 (= lt!646613 lt!646402))))

(declare-fun b!1480940 () Bool)

(declare-fun c!136794 () Bool)

(assert (=> b!1480940 (= c!136794 (= lt!646613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480940 (= e!830635 e!830636)))

(assert (= (and d!156203 c!136795) b!1480935))

(assert (= (and d!156203 (not c!136795)) b!1480939))

(assert (= (and b!1480939 c!136793) b!1480937))

(assert (= (and b!1480939 (not c!136793)) b!1480940))

(assert (= (and b!1480940 c!136794) b!1480938))

(assert (= (and b!1480940 (not c!136794)) b!1480936))

(declare-fun m!1366667 () Bool)

(assert (=> b!1480936 m!1366667))

(assert (=> b!1480936 m!1366667))

(declare-fun m!1366669 () Bool)

(assert (=> b!1480936 m!1366669))

(declare-fun m!1366671 () Bool)

(assert (=> d!156203 m!1366671))

(declare-fun m!1366673 () Bool)

(assert (=> d!156203 m!1366673))

(assert (=> d!156203 m!1366373))

(assert (=> d!156203 m!1366229))

(assert (=> b!1480625 d!156203))

(declare-fun b!1480941 () Bool)

(declare-fun e!830640 () Bool)

(declare-fun e!830639 () Bool)

(assert (=> b!1480941 (= e!830640 e!830639)))

(declare-fun c!136796 () Bool)

(assert (=> b!1480941 (= c!136796 (validKeyInArray!0 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480942 () Bool)

(declare-fun e!830638 () Bool)

(assert (=> b!1480942 (= e!830639 e!830638)))

(declare-fun lt!646615 () (_ BitVec 64))

(assert (=> b!1480942 (= lt!646615 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!646616 () Unit!49756)

(assert (=> b!1480942 (= lt!646616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1480942 (arrayContainsKey!0 a!2862 lt!646615 #b00000000000000000000000000000000)))

(declare-fun lt!646614 () Unit!49756)

(assert (=> b!1480942 (= lt!646614 lt!646616)))

(declare-fun res!1006391 () Bool)

(assert (=> b!1480942 (= res!1006391 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480942 (=> (not res!1006391) (not e!830638))))

(declare-fun d!156205 () Bool)

(declare-fun res!1006392 () Bool)

(assert (=> d!156205 (=> res!1006392 e!830640)))

(assert (=> d!156205 (= res!1006392 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48518 a!2862)))))

(assert (=> d!156205 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687) e!830640)))

(declare-fun bm!67845 () Bool)

(declare-fun call!67848 () Bool)

(assert (=> bm!67845 (= call!67848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480943 () Bool)

(assert (=> b!1480943 (= e!830639 call!67848)))

(declare-fun b!1480944 () Bool)

(assert (=> b!1480944 (= e!830638 call!67848)))

(assert (= (and d!156205 (not res!1006392)) b!1480941))

(assert (= (and b!1480941 c!136796) b!1480942))

(assert (= (and b!1480941 (not c!136796)) b!1480943))

(assert (= (and b!1480942 res!1006391) b!1480944))

(assert (= (or b!1480944 b!1480943) bm!67845))

(assert (=> b!1480941 m!1366655))

(assert (=> b!1480941 m!1366655))

(assert (=> b!1480941 m!1366657))

(assert (=> b!1480942 m!1366655))

(declare-fun m!1366675 () Bool)

(assert (=> b!1480942 m!1366675))

(declare-fun m!1366677 () Bool)

(assert (=> b!1480942 m!1366677))

(assert (=> b!1480942 m!1366655))

(declare-fun m!1366679 () Bool)

(assert (=> b!1480942 m!1366679))

(declare-fun m!1366681 () Bool)

(assert (=> bm!67845 m!1366681))

(assert (=> bm!67834 d!156205))

(assert (=> b!1480784 d!156197))

(assert (=> d!156069 d!156133))

(assert (=> d!156069 d!156137))

(assert (=> d!156069 d!156093))

(declare-fun b!1480945 () Bool)

(declare-fun e!830643 () Bool)

(declare-fun e!830642 () Bool)

(assert (=> b!1480945 (= e!830643 e!830642)))

(declare-fun c!136797 () Bool)

(assert (=> b!1480945 (= c!136797 (validKeyInArray!0 (select (arr!47968 a!2862) (bvadd j!93 #b00000000000000000000000000000001))))))

(declare-fun b!1480946 () Bool)

(declare-fun e!830641 () Bool)

(assert (=> b!1480946 (= e!830642 e!830641)))

(declare-fun lt!646618 () (_ BitVec 64))

(assert (=> b!1480946 (= lt!646618 (select (arr!47968 a!2862) (bvadd j!93 #b00000000000000000000000000000001)))))

(declare-fun lt!646619 () Unit!49756)

(assert (=> b!1480946 (= lt!646619 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646618 (bvadd j!93 #b00000000000000000000000000000001)))))

(assert (=> b!1480946 (arrayContainsKey!0 a!2862 lt!646618 #b00000000000000000000000000000000)))

(declare-fun lt!646617 () Unit!49756)

(assert (=> b!1480946 (= lt!646617 lt!646619)))

(declare-fun res!1006393 () Bool)

(assert (=> b!1480946 (= res!1006393 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) (bvadd j!93 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12208 (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (=> b!1480946 (=> (not res!1006393) (not e!830641))))

(declare-fun d!156207 () Bool)

(declare-fun res!1006394 () Bool)

(assert (=> d!156207 (=> res!1006394 e!830643)))

(assert (=> d!156207 (= res!1006394 (bvsge (bvadd j!93 #b00000000000000000000000000000001) (size!48518 a!2862)))))

(assert (=> d!156207 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687) e!830643)))

(declare-fun bm!67846 () Bool)

(declare-fun call!67849 () Bool)

(assert (=> bm!67846 (= call!67849 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1480947 () Bool)

(assert (=> b!1480947 (= e!830642 call!67849)))

(declare-fun b!1480948 () Bool)

(assert (=> b!1480948 (= e!830641 call!67849)))

(assert (= (and d!156207 (not res!1006394)) b!1480945))

(assert (= (and b!1480945 c!136797) b!1480946))

(assert (= (and b!1480945 (not c!136797)) b!1480947))

(assert (= (and b!1480946 res!1006393) b!1480948))

(assert (= (or b!1480948 b!1480947) bm!67846))

(declare-fun m!1366683 () Bool)

(assert (=> b!1480945 m!1366683))

(assert (=> b!1480945 m!1366683))

(declare-fun m!1366685 () Bool)

(assert (=> b!1480945 m!1366685))

(assert (=> b!1480946 m!1366683))

(declare-fun m!1366687 () Bool)

(assert (=> b!1480946 m!1366687))

(declare-fun m!1366689 () Bool)

(assert (=> b!1480946 m!1366689))

(assert (=> b!1480946 m!1366683))

(declare-fun m!1366691 () Bool)

(assert (=> b!1480946 m!1366691))

(declare-fun m!1366693 () Bool)

(assert (=> bm!67846 m!1366693))

(assert (=> bm!67832 d!156207))

(assert (=> d!156141 d!156093))

(declare-fun d!156209 () Bool)

(assert (=> d!156209 (arrayContainsKey!0 a!2862 lt!646548 #b00000000000000000000000000000000)))

(declare-fun lt!646620 () Unit!49756)

(assert (=> d!156209 (= lt!646620 (choose!13 a!2862 lt!646548 #b00000000000000000000000000000000))))

(assert (=> d!156209 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!156209 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646548 #b00000000000000000000000000000000) lt!646620)))

(declare-fun bs!42671 () Bool)

(assert (= bs!42671 d!156209))

(assert (=> bs!42671 m!1366479))

(declare-fun m!1366695 () Bool)

(assert (=> bs!42671 m!1366695))

(assert (=> b!1480753 d!156209))

(declare-fun d!156211 () Bool)

(declare-fun res!1006395 () Bool)

(declare-fun e!830644 () Bool)

(assert (=> d!156211 (=> res!1006395 e!830644)))

(assert (=> d!156211 (= res!1006395 (= (select (arr!47968 a!2862) #b00000000000000000000000000000000) lt!646548))))

(assert (=> d!156211 (= (arrayContainsKey!0 a!2862 lt!646548 #b00000000000000000000000000000000) e!830644)))

(declare-fun b!1480949 () Bool)

(declare-fun e!830645 () Bool)

(assert (=> b!1480949 (= e!830644 e!830645)))

(declare-fun res!1006396 () Bool)

(assert (=> b!1480949 (=> (not res!1006396) (not e!830645))))

(assert (=> b!1480949 (= res!1006396 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48518 a!2862)))))

(declare-fun b!1480950 () Bool)

(assert (=> b!1480950 (= e!830645 (arrayContainsKey!0 a!2862 lt!646548 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156211 (not res!1006395)) b!1480949))

(assert (= (and b!1480949 res!1006396) b!1480950))

(assert (=> d!156211 m!1366473))

(declare-fun m!1366697 () Bool)

(assert (=> b!1480950 m!1366697))

(assert (=> b!1480753 d!156211))

(declare-fun b!1480951 () Bool)

(declare-fun e!830648 () SeekEntryResult!12208)

(declare-fun lt!646622 () SeekEntryResult!12208)

(assert (=> b!1480951 (= e!830648 (Found!12208 (index!51226 lt!646622)))))

(declare-fun e!830647 () SeekEntryResult!12208)

(declare-fun b!1480952 () Bool)

(assert (=> b!1480952 (= e!830647 (seekKeyOrZeroReturnVacant!0 (x!132799 lt!646622) (index!51226 lt!646622) (index!51226 lt!646622) (select (arr!47968 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(declare-fun b!1480953 () Bool)

(declare-fun e!830646 () SeekEntryResult!12208)

(assert (=> b!1480953 (= e!830646 e!830648)))

(declare-fun lt!646621 () (_ BitVec 64))

(assert (=> b!1480953 (= lt!646621 (select (arr!47968 a!2862) (index!51226 lt!646622)))))

(declare-fun c!136798 () Bool)

(assert (=> b!1480953 (= c!136798 (= lt!646621 (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480954 () Bool)

(assert (=> b!1480954 (= e!830647 (MissingZero!12208 (index!51226 lt!646622)))))

(declare-fun b!1480955 () Bool)

(declare-fun c!136799 () Bool)

(assert (=> b!1480955 (= c!136799 (= lt!646621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480955 (= e!830648 e!830647)))

(declare-fun d!156213 () Bool)

(declare-fun lt!646623 () SeekEntryResult!12208)

(assert (=> d!156213 (and (or (is-Undefined!12208 lt!646623) (not (is-Found!12208 lt!646623)) (and (bvsge (index!51225 lt!646623) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646623) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646623) (is-Found!12208 lt!646623) (not (is-MissingZero!12208 lt!646623)) (and (bvsge (index!51224 lt!646623) #b00000000000000000000000000000000) (bvslt (index!51224 lt!646623) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646623) (is-Found!12208 lt!646623) (is-MissingZero!12208 lt!646623) (not (is-MissingVacant!12208 lt!646623)) (and (bvsge (index!51227 lt!646623) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646623) (size!48518 a!2862)))) (or (is-Undefined!12208 lt!646623) (ite (is-Found!12208 lt!646623) (= (select (arr!47968 a!2862) (index!51225 lt!646623)) (select (arr!47968 a!2862) #b00000000000000000000000000000000)) (ite (is-MissingZero!12208 lt!646623) (= (select (arr!47968 a!2862) (index!51224 lt!646623)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12208 lt!646623) (= (select (arr!47968 a!2862) (index!51227 lt!646623)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156213 (= lt!646623 e!830646)))

(declare-fun c!136800 () Bool)

(assert (=> d!156213 (= c!136800 (and (is-Intermediate!12208 lt!646622) (undefined!13020 lt!646622)))))

(assert (=> d!156213 (= lt!646622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000) mask!2687) (select (arr!47968 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(assert (=> d!156213 (validMask!0 mask!2687)))

(assert (=> d!156213 (= (seekEntryOrOpen!0 (select (arr!47968 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) lt!646623)))

(declare-fun b!1480956 () Bool)

(assert (=> b!1480956 (= e!830646 Undefined!12208)))

(assert (= (and d!156213 c!136800) b!1480956))

(assert (= (and d!156213 (not c!136800)) b!1480953))

(assert (= (and b!1480953 c!136798) b!1480951))

(assert (= (and b!1480953 (not c!136798)) b!1480955))

(assert (= (and b!1480955 c!136799) b!1480954))

(assert (= (and b!1480955 (not c!136799)) b!1480952))

(assert (=> b!1480952 m!1366473))

(declare-fun m!1366699 () Bool)

(assert (=> b!1480952 m!1366699))

(declare-fun m!1366701 () Bool)

(assert (=> b!1480953 m!1366701))

(declare-fun m!1366703 () Bool)

(assert (=> d!156213 m!1366703))

(assert (=> d!156213 m!1366473))

(declare-fun m!1366705 () Bool)

(assert (=> d!156213 m!1366705))

(declare-fun m!1366707 () Bool)

(assert (=> d!156213 m!1366707))

(declare-fun m!1366709 () Bool)

(assert (=> d!156213 m!1366709))

(assert (=> d!156213 m!1366705))

(assert (=> d!156213 m!1366473))

(declare-fun m!1366711 () Bool)

(assert (=> d!156213 m!1366711))

(assert (=> d!156213 m!1366229))

(assert (=> b!1480753 d!156213))

(assert (=> d!156115 d!156129))

(assert (=> d!156115 d!156131))

(assert (=> d!156115 d!156093))

(declare-fun d!156215 () Bool)

(declare-fun lt!646626 () Bool)

(declare-fun content!780 (List!34469) (Set (_ BitVec 64)))

(assert (=> d!156215 (= lt!646626 (member (select (arr!47968 a!2862) #b00000000000000000000000000000000) (content!780 Nil!34466)))))

(declare-fun e!830654 () Bool)

(assert (=> d!156215 (= lt!646626 e!830654)))

(declare-fun res!1006402 () Bool)

(assert (=> d!156215 (=> (not res!1006402) (not e!830654))))

(assert (=> d!156215 (= res!1006402 (is-Cons!34465 Nil!34466))))

(assert (=> d!156215 (= (contains!9911 Nil!34466 (select (arr!47968 a!2862) #b00000000000000000000000000000000)) lt!646626)))

(declare-fun b!1480961 () Bool)

(declare-fun e!830653 () Bool)

(assert (=> b!1480961 (= e!830654 e!830653)))

(declare-fun res!1006401 () Bool)

(assert (=> b!1480961 (=> res!1006401 e!830653)))

(assert (=> b!1480961 (= res!1006401 (= (h!35833 Nil!34466) (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480962 () Bool)

(assert (=> b!1480962 (= e!830653 (contains!9911 (t!49163 Nil!34466) (select (arr!47968 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156215 res!1006402) b!1480961))

(assert (= (and b!1480961 (not res!1006401)) b!1480962))

(declare-fun m!1366713 () Bool)

(assert (=> d!156215 m!1366713))

(assert (=> d!156215 m!1366473))

(declare-fun m!1366715 () Bool)

(assert (=> d!156215 m!1366715))

(assert (=> b!1480962 m!1366473))

(declare-fun m!1366717 () Bool)

(assert (=> b!1480962 m!1366717))

(assert (=> b!1480785 d!156215))

(assert (=> d!156061 d!156093))

(declare-fun b!1480963 () Bool)

(declare-fun e!830657 () SeekEntryResult!12208)

(assert (=> b!1480963 (= e!830657 Undefined!12208)))

(declare-fun e!830656 () SeekEntryResult!12208)

(declare-fun b!1480964 () Bool)

(assert (=> b!1480964 (= e!830656 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!646402 lt!646404 mask!2687))))

(declare-fun e!830655 () SeekEntryResult!12208)

(declare-fun b!1480965 () Bool)

(assert (=> b!1480965 (= e!830655 (Found!12208 (nextIndex!0 index!646 x!665 mask!2687)))))

(declare-fun d!156217 () Bool)

(declare-fun lt!646627 () SeekEntryResult!12208)

(assert (=> d!156217 (and (or (is-Undefined!12208 lt!646627) (not (is-Found!12208 lt!646627)) (and (bvsge (index!51225 lt!646627) #b00000000000000000000000000000000) (bvslt (index!51225 lt!646627) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646627) (is-Found!12208 lt!646627) (not (is-MissingVacant!12208 lt!646627)) (not (= (index!51227 lt!646627) intermediateAfterIndex!19)) (and (bvsge (index!51227 lt!646627) #b00000000000000000000000000000000) (bvslt (index!51227 lt!646627) (size!48518 lt!646404)))) (or (is-Undefined!12208 lt!646627) (ite (is-Found!12208 lt!646627) (= (select (arr!47968 lt!646404) (index!51225 lt!646627)) lt!646402) (and (is-MissingVacant!12208 lt!646627) (= (index!51227 lt!646627) intermediateAfterIndex!19) (= (select (arr!47968 lt!646404) (index!51227 lt!646627)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156217 (= lt!646627 e!830657)))

(declare-fun c!136803 () Bool)

(assert (=> d!156217 (= c!136803 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646628 () (_ BitVec 64))

(assert (=> d!156217 (= lt!646628 (select (arr!47968 lt!646404) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156217 (validMask!0 mask!2687)))

(assert (=> d!156217 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646402 lt!646404 mask!2687) lt!646627)))

(declare-fun b!1480966 () Bool)

(assert (=> b!1480966 (= e!830656 (MissingVacant!12208 intermediateAfterIndex!19))))

(declare-fun b!1480967 () Bool)

(assert (=> b!1480967 (= e!830657 e!830655)))

(declare-fun c!136801 () Bool)

(assert (=> b!1480967 (= c!136801 (= lt!646628 lt!646402))))

(declare-fun b!1480968 () Bool)

(declare-fun c!136802 () Bool)

(assert (=> b!1480968 (= c!136802 (= lt!646628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480968 (= e!830655 e!830656)))

(assert (= (and d!156217 c!136803) b!1480963))

(assert (= (and d!156217 (not c!136803)) b!1480967))

(assert (= (and b!1480967 c!136801) b!1480965))

(assert (= (and b!1480967 (not c!136801)) b!1480968))

(assert (= (and b!1480968 c!136802) b!1480966))

(assert (= (and b!1480968 (not c!136802)) b!1480964))

(assert (=> b!1480964 m!1366327))

(assert (=> b!1480964 m!1366649))

(assert (=> b!1480964 m!1366649))

(declare-fun m!1366719 () Bool)

(assert (=> b!1480964 m!1366719))

(declare-fun m!1366721 () Bool)

(assert (=> d!156217 m!1366721))

(declare-fun m!1366723 () Bool)

(assert (=> d!156217 m!1366723))

(assert (=> d!156217 m!1366327))

(declare-fun m!1366725 () Bool)

(assert (=> d!156217 m!1366725))

(assert (=> d!156217 m!1366229))

(assert (=> b!1480553 d!156217))

(assert (=> b!1480553 d!156193))

(assert (=> d!156091 d!156087))

(declare-fun d!156219 () Bool)

(assert (=> d!156219 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(assert (=> d!156219 true))

(declare-fun _$72!158 () Unit!49756)

(assert (=> d!156219 (= (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) _$72!158)))

(declare-fun bs!42672 () Bool)

(assert (= bs!42672 d!156219))

(assert (=> bs!42672 m!1366261))

(assert (=> d!156091 d!156219))

(assert (=> d!156091 d!156093))

(declare-fun b!1480969 () Bool)

(declare-fun e!830660 () Bool)

(declare-fun lt!646630 () SeekEntryResult!12208)

(assert (=> b!1480969 (= e!830660 (bvsge (x!132799 lt!646630) #b01111111111111111111111111111110))))

(declare-fun b!1480970 () Bool)

(assert (=> b!1480970 (and (bvsge (index!51226 lt!646630) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646630) (size!48518 a!2862)))))

(declare-fun e!830658 () Bool)

(assert (=> b!1480970 (= e!830658 (= (select (arr!47968 a!2862) (index!51226 lt!646630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480971 () Bool)

(declare-fun e!830659 () Bool)

(assert (=> b!1480971 (= e!830660 e!830659)))

(declare-fun res!1006404 () Bool)

(assert (=> b!1480971 (= res!1006404 (and (is-Intermediate!12208 lt!646630) (not (undefined!13020 lt!646630)) (bvslt (x!132799 lt!646630) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646630) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480971 (=> (not res!1006404) (not e!830659))))

(declare-fun b!1480972 () Bool)

(declare-fun e!830661 () SeekEntryResult!12208)

(assert (=> b!1480972 (= e!830661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480973 () Bool)

(assert (=> b!1480973 (and (bvsge (index!51226 lt!646630) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646630) (size!48518 a!2862)))))

(declare-fun res!1006403 () Bool)

(assert (=> b!1480973 (= res!1006403 (= (select (arr!47968 a!2862) (index!51226 lt!646630)) (select (arr!47968 a!2862) j!93)))))

(assert (=> b!1480973 (=> res!1006403 e!830658)))

(assert (=> b!1480973 (= e!830659 e!830658)))

(declare-fun d!156221 () Bool)

(assert (=> d!156221 e!830660))

(declare-fun c!136806 () Bool)

(assert (=> d!156221 (= c!136806 (and (is-Intermediate!12208 lt!646630) (undefined!13020 lt!646630)))))

(declare-fun e!830662 () SeekEntryResult!12208)

(assert (=> d!156221 (= lt!646630 e!830662)))

(declare-fun c!136804 () Bool)

(assert (=> d!156221 (= c!136804 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646629 () (_ BitVec 64))

(assert (=> d!156221 (= lt!646629 (select (arr!47968 a!2862) (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!156221 (validMask!0 mask!2687)))

(assert (=> d!156221 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47968 a!2862) j!93) a!2862 mask!2687) lt!646630)))

(declare-fun b!1480974 () Bool)

(assert (=> b!1480974 (= e!830662 e!830661)))

(declare-fun c!136805 () Bool)

(assert (=> b!1480974 (= c!136805 (or (= lt!646629 (select (arr!47968 a!2862) j!93)) (= (bvadd lt!646629 lt!646629) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480975 () Bool)

(assert (=> b!1480975 (and (bvsge (index!51226 lt!646630) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646630) (size!48518 a!2862)))))

(declare-fun res!1006405 () Bool)

(assert (=> b!1480975 (= res!1006405 (= (select (arr!47968 a!2862) (index!51226 lt!646630)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480975 (=> res!1006405 e!830658)))

(declare-fun b!1480976 () Bool)

(assert (=> b!1480976 (= e!830662 (Intermediate!12208 true (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480977 () Bool)

(assert (=> b!1480977 (= e!830661 (Intermediate!12208 false (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156221 c!136804) b!1480976))

(assert (= (and d!156221 (not c!136804)) b!1480974))

(assert (= (and b!1480974 c!136805) b!1480977))

(assert (= (and b!1480974 (not c!136805)) b!1480972))

(assert (= (and d!156221 c!136806) b!1480969))

(assert (= (and d!156221 (not c!136806)) b!1480971))

(assert (= (and b!1480971 res!1006404) b!1480973))

(assert (= (and b!1480973 (not res!1006403)) b!1480975))

(assert (= (and b!1480975 (not res!1006405)) b!1480970))

(declare-fun m!1366727 () Bool)

(assert (=> b!1480973 m!1366727))

(assert (=> d!156221 m!1366497))

(declare-fun m!1366729 () Bool)

(assert (=> d!156221 m!1366729))

(assert (=> d!156221 m!1366229))

(assert (=> b!1480972 m!1366497))

(declare-fun m!1366731 () Bool)

(assert (=> b!1480972 m!1366731))

(assert (=> b!1480972 m!1366731))

(assert (=> b!1480972 m!1366241))

(declare-fun m!1366733 () Bool)

(assert (=> b!1480972 m!1366733))

(assert (=> b!1480975 m!1366727))

(assert (=> b!1480970 m!1366727))

(assert (=> b!1480789 d!156221))

(declare-fun d!156223 () Bool)

(declare-fun lt!646631 () (_ BitVec 32))

(assert (=> d!156223 (and (bvsge lt!646631 #b00000000000000000000000000000000) (bvslt lt!646631 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156223 (= lt!646631 (choose!52 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!156223 (validMask!0 mask!2687)))

(assert (=> d!156223 (= (nextIndex!0 (toIndex!0 (select (arr!47968 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646631)))

(declare-fun bs!42673 () Bool)

(assert (= bs!42673 d!156223))

(assert (=> bs!42673 m!1366263))

(declare-fun m!1366735 () Bool)

(assert (=> bs!42673 m!1366735))

(assert (=> bs!42673 m!1366229))

(assert (=> b!1480789 d!156223))

(declare-fun b!1480978 () Bool)

(declare-fun e!830665 () Bool)

(declare-fun lt!646633 () SeekEntryResult!12208)

(assert (=> b!1480978 (= e!830665 (bvsge (x!132799 lt!646633) #b01111111111111111111111111111110))))

(declare-fun b!1480979 () Bool)

(assert (=> b!1480979 (and (bvsge (index!51226 lt!646633) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646633) (size!48518 lt!646404)))))

(declare-fun e!830663 () Bool)

(assert (=> b!1480979 (= e!830663 (= (select (arr!47968 lt!646404) (index!51226 lt!646633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480980 () Bool)

(declare-fun e!830664 () Bool)

(assert (=> b!1480980 (= e!830665 e!830664)))

(declare-fun res!1006407 () Bool)

(assert (=> b!1480980 (= res!1006407 (and (is-Intermediate!12208 lt!646633) (not (undefined!13020 lt!646633)) (bvslt (x!132799 lt!646633) #b01111111111111111111111111111110) (bvsge (x!132799 lt!646633) #b00000000000000000000000000000000) (bvsge (x!132799 lt!646633) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480980 (=> (not res!1006407) (not e!830664))))

(declare-fun e!830666 () SeekEntryResult!12208)

(declare-fun b!1480981 () Bool)

(assert (=> b!1480981 (= e!830666 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!646402 lt!646404 mask!2687))))

(declare-fun b!1480982 () Bool)

(assert (=> b!1480982 (and (bvsge (index!51226 lt!646633) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646633) (size!48518 lt!646404)))))

(declare-fun res!1006406 () Bool)

(assert (=> b!1480982 (= res!1006406 (= (select (arr!47968 lt!646404) (index!51226 lt!646633)) lt!646402))))

(assert (=> b!1480982 (=> res!1006406 e!830663)))

(assert (=> b!1480982 (= e!830664 e!830663)))

(declare-fun d!156225 () Bool)

(assert (=> d!156225 e!830665))

(declare-fun c!136809 () Bool)

(assert (=> d!156225 (= c!136809 (and (is-Intermediate!12208 lt!646633) (undefined!13020 lt!646633)))))

(declare-fun e!830667 () SeekEntryResult!12208)

(assert (=> d!156225 (= lt!646633 e!830667)))

(declare-fun c!136807 () Bool)

(assert (=> d!156225 (= c!136807 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!646632 () (_ BitVec 64))

(assert (=> d!156225 (= lt!646632 (select (arr!47968 lt!646404) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!156225 (validMask!0 mask!2687)))

(assert (=> d!156225 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646402 lt!646404 mask!2687) lt!646633)))

(declare-fun b!1480983 () Bool)

(assert (=> b!1480983 (= e!830667 e!830666)))

(declare-fun c!136808 () Bool)

(assert (=> b!1480983 (= c!136808 (or (= lt!646632 lt!646402) (= (bvadd lt!646632 lt!646632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480984 () Bool)

(assert (=> b!1480984 (and (bvsge (index!51226 lt!646633) #b00000000000000000000000000000000) (bvslt (index!51226 lt!646633) (size!48518 lt!646404)))))

(declare-fun res!1006408 () Bool)

(assert (=> b!1480984 (= res!1006408 (= (select (arr!47968 lt!646404) (index!51226 lt!646633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480984 (=> res!1006408 e!830663)))

(declare-fun b!1480985 () Bool)

(assert (=> b!1480985 (= e!830667 (Intermediate!12208 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480986 () Bool)

(assert (=> b!1480986 (= e!830666 (Intermediate!12208 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(assert (= (and d!156225 c!136807) b!1480985))

(assert (= (and d!156225 (not c!136807)) b!1480983))

(assert (= (and b!1480983 c!136808) b!1480986))

(assert (= (and b!1480983 (not c!136808)) b!1480981))

(assert (= (and d!156225 c!136809) b!1480978))

(assert (= (and d!156225 (not c!136809)) b!1480980))

(assert (= (and b!1480980 res!1006407) b!1480982))

(assert (= (and b!1480982 (not res!1006406)) b!1480984))

(assert (= (and b!1480984 (not res!1006408)) b!1480979))

(declare-fun m!1366737 () Bool)

(assert (=> b!1480982 m!1366737))

(assert (=> d!156225 m!1366327))

(assert (=> d!156225 m!1366725))

(assert (=> d!156225 m!1366229))

(assert (=> b!1480981 m!1366327))

(assert (=> b!1480981 m!1366649))

(assert (=> b!1480981 m!1366649))

(declare-fun m!1366739 () Bool)

(assert (=> b!1480981 m!1366739))

(assert (=> b!1480984 m!1366737))

(assert (=> b!1480979 m!1366737))

(assert (=> b!1480740 d!156225))

(assert (=> b!1480740 d!156193))

(push 1)

(assert (not bm!67846))

(assert (not d!156189))

(assert (not b!1480924))

(assert (not d!156217))

(assert (not d!156213))

(assert (not b!1480946))

(assert (not b!1480962))

(assert (not b!1480950))

(assert (not b!1480981))

(assert (not b!1480910))

(assert (not d!156191))

(assert (not d!156221))

(assert (not b!1480964))

(assert (not bm!67844))

(assert (not d!156193))

(assert (not b!1480972))

(assert (not d!156225))

(assert (not b!1480945))

(assert (not d!156185))

(assert (not d!156215))

(assert (not d!156203))

(assert (not d!156223))

(assert (not b!1480927))

(assert (not b!1480942))

(assert (not b!1480952))

(assert (not d!156209))

(assert (not bm!67845))

(assert (not b!1480941))

(assert (not b!1480934))

(assert (not d!156187))

(assert (not b!1480918))

(assert (not b!1480928))

(assert (not d!156199))

(assert (not b!1480903))

(assert (not b!1480936))

(assert (not d!156219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

