; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124888 () Bool)

(assert start!124888)

(declare-fun b!1451237 () Bool)

(declare-fun res!982599 () Bool)

(declare-fun e!817099 () Bool)

(assert (=> b!1451237 (=> (not res!982599) (not e!817099))))

(declare-datatypes ((array!98314 0))(
  ( (array!98315 (arr!47446 (Array (_ BitVec 32) (_ BitVec 64))) (size!47998 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98314)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451237 (= res!982599 (validKeyInArray!0 (select (arr!47446 a!2862) j!93)))))

(declare-fun b!1451238 () Bool)

(declare-fun res!982597 () Bool)

(assert (=> b!1451238 (=> (not res!982597) (not e!817099))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451238 (= res!982597 (validKeyInArray!0 (select (arr!47446 a!2862) i!1006)))))

(declare-fun b!1451239 () Bool)

(declare-fun res!982592 () Bool)

(assert (=> b!1451239 (=> (not res!982592) (not e!817099))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1451239 (= res!982592 (and (= (size!47998 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47998 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47998 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451240 () Bool)

(declare-fun res!982593 () Bool)

(declare-fun e!817100 () Bool)

(assert (=> b!1451240 (=> (not res!982593) (not e!817100))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11723 0))(
  ( (MissingZero!11723 (index!49284 (_ BitVec 32))) (Found!11723 (index!49285 (_ BitVec 32))) (Intermediate!11723 (undefined!12535 Bool) (index!49286 (_ BitVec 32)) (x!130935 (_ BitVec 32))) (Undefined!11723) (MissingVacant!11723 (index!49287 (_ BitVec 32))) )
))
(declare-fun lt!636419 () SeekEntryResult!11723)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11723)

(assert (=> b!1451240 (= res!982593 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!636419))))

(declare-fun b!1451241 () Bool)

(declare-fun e!817102 () Bool)

(assert (=> b!1451241 (= e!817102 e!817100)))

(declare-fun res!982600 () Bool)

(assert (=> b!1451241 (=> (not res!982600) (not e!817100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451241 (= res!982600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47446 a!2862) j!93) mask!2687) (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!636419))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451241 (= lt!636419 (Intermediate!11723 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!636416 () SeekEntryResult!11723)

(declare-fun lt!636417 () (_ BitVec 64))

(declare-fun lt!636420 () array!98314)

(declare-fun b!1451242 () Bool)

(declare-fun e!817103 () Bool)

(assert (=> b!1451242 (= e!817103 (= lt!636416 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636417 lt!636420 mask!2687)))))

(declare-fun b!1451243 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11723)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98314 (_ BitVec 32)) SeekEntryResult!11723)

(assert (=> b!1451243 (= e!817103 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636417 lt!636420 mask!2687) (seekEntryOrOpen!0 lt!636417 lt!636420 mask!2687)))))

(declare-fun b!1451245 () Bool)

(declare-fun res!982601 () Bool)

(declare-fun e!817101 () Bool)

(assert (=> b!1451245 (=> (not res!982601) (not e!817101))))

(assert (=> b!1451245 (= res!982601 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451246 () Bool)

(declare-fun res!982590 () Bool)

(assert (=> b!1451246 (=> (not res!982590) (not e!817101))))

(assert (=> b!1451246 (= res!982590 e!817103)))

(declare-fun c!133837 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451246 (= c!133837 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451247 () Bool)

(declare-fun e!817104 () Bool)

(assert (=> b!1451247 (= e!817104 (and (or (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) (select (arr!47446 a!2862) j!93))) (or (and (= (select (arr!47446 a!2862) index!646) (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47446 a!2862) index!646) (select (arr!47446 a!2862) j!93))) (= (select (arr!47446 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451248 () Bool)

(assert (=> b!1451248 (= e!817101 (not true))))

(assert (=> b!1451248 e!817104))

(declare-fun res!982591 () Bool)

(assert (=> b!1451248 (=> (not res!982591) (not e!817104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98314 (_ BitVec 32)) Bool)

(assert (=> b!1451248 (= res!982591 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48783 0))(
  ( (Unit!48784) )
))
(declare-fun lt!636418 () Unit!48783)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48783)

(assert (=> b!1451248 (= lt!636418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451249 () Bool)

(declare-fun res!982603 () Bool)

(assert (=> b!1451249 (=> (not res!982603) (not e!817099))))

(declare-datatypes ((List!34025 0))(
  ( (Nil!34022) (Cons!34021 (h!35371 (_ BitVec 64)) (t!48711 List!34025)) )
))
(declare-fun arrayNoDuplicates!0 (array!98314 (_ BitVec 32) List!34025) Bool)

(assert (=> b!1451249 (= res!982603 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34022))))

(declare-fun b!1451250 () Bool)

(assert (=> b!1451250 (= e!817100 e!817101)))

(declare-fun res!982602 () Bool)

(assert (=> b!1451250 (=> (not res!982602) (not e!817101))))

(assert (=> b!1451250 (= res!982602 (= lt!636416 (Intermediate!11723 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451250 (= lt!636416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636417 mask!2687) lt!636417 lt!636420 mask!2687))))

(assert (=> b!1451250 (= lt!636417 (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451251 () Bool)

(declare-fun res!982596 () Bool)

(assert (=> b!1451251 (=> (not res!982596) (not e!817104))))

(assert (=> b!1451251 (= res!982596 (= (seekEntryOrOpen!0 (select (arr!47446 a!2862) j!93) a!2862 mask!2687) (Found!11723 j!93)))))

(declare-fun b!1451252 () Bool)

(assert (=> b!1451252 (= e!817099 e!817102)))

(declare-fun res!982589 () Bool)

(assert (=> b!1451252 (=> (not res!982589) (not e!817102))))

(assert (=> b!1451252 (= res!982589 (= (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451252 (= lt!636420 (array!98315 (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47998 a!2862)))))

(declare-fun b!1451253 () Bool)

(declare-fun res!982598 () Bool)

(assert (=> b!1451253 (=> (not res!982598) (not e!817099))))

(assert (=> b!1451253 (= res!982598 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47998 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47998 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47998 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451244 () Bool)

(declare-fun res!982594 () Bool)

(assert (=> b!1451244 (=> (not res!982594) (not e!817099))))

(assert (=> b!1451244 (= res!982594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!982595 () Bool)

(assert (=> start!124888 (=> (not res!982595) (not e!817099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124888 (= res!982595 (validMask!0 mask!2687))))

(assert (=> start!124888 e!817099))

(assert (=> start!124888 true))

(declare-fun array_inv!36679 (array!98314) Bool)

(assert (=> start!124888 (array_inv!36679 a!2862)))

(assert (= (and start!124888 res!982595) b!1451239))

(assert (= (and b!1451239 res!982592) b!1451238))

(assert (= (and b!1451238 res!982597) b!1451237))

(assert (= (and b!1451237 res!982599) b!1451244))

(assert (= (and b!1451244 res!982594) b!1451249))

(assert (= (and b!1451249 res!982603) b!1451253))

(assert (= (and b!1451253 res!982598) b!1451252))

(assert (= (and b!1451252 res!982589) b!1451241))

(assert (= (and b!1451241 res!982600) b!1451240))

(assert (= (and b!1451240 res!982593) b!1451250))

(assert (= (and b!1451250 res!982602) b!1451246))

(assert (= (and b!1451246 c!133837) b!1451242))

(assert (= (and b!1451246 (not c!133837)) b!1451243))

(assert (= (and b!1451246 res!982590) b!1451245))

(assert (= (and b!1451245 res!982601) b!1451248))

(assert (= (and b!1451248 res!982591) b!1451251))

(assert (= (and b!1451251 res!982596) b!1451247))

(declare-fun m!1339353 () Bool)

(assert (=> b!1451243 m!1339353))

(declare-fun m!1339355 () Bool)

(assert (=> b!1451243 m!1339355))

(declare-fun m!1339357 () Bool)

(assert (=> b!1451240 m!1339357))

(assert (=> b!1451240 m!1339357))

(declare-fun m!1339359 () Bool)

(assert (=> b!1451240 m!1339359))

(declare-fun m!1339361 () Bool)

(assert (=> b!1451248 m!1339361))

(declare-fun m!1339363 () Bool)

(assert (=> b!1451248 m!1339363))

(declare-fun m!1339365 () Bool)

(assert (=> b!1451242 m!1339365))

(declare-fun m!1339367 () Bool)

(assert (=> b!1451250 m!1339367))

(assert (=> b!1451250 m!1339367))

(declare-fun m!1339369 () Bool)

(assert (=> b!1451250 m!1339369))

(declare-fun m!1339371 () Bool)

(assert (=> b!1451250 m!1339371))

(declare-fun m!1339373 () Bool)

(assert (=> b!1451250 m!1339373))

(assert (=> b!1451252 m!1339371))

(declare-fun m!1339375 () Bool)

(assert (=> b!1451252 m!1339375))

(declare-fun m!1339377 () Bool)

(assert (=> start!124888 m!1339377))

(declare-fun m!1339379 () Bool)

(assert (=> start!124888 m!1339379))

(declare-fun m!1339381 () Bool)

(assert (=> b!1451249 m!1339381))

(declare-fun m!1339383 () Bool)

(assert (=> b!1451238 m!1339383))

(assert (=> b!1451238 m!1339383))

(declare-fun m!1339385 () Bool)

(assert (=> b!1451238 m!1339385))

(declare-fun m!1339387 () Bool)

(assert (=> b!1451244 m!1339387))

(assert (=> b!1451251 m!1339357))

(assert (=> b!1451251 m!1339357))

(declare-fun m!1339389 () Bool)

(assert (=> b!1451251 m!1339389))

(assert (=> b!1451237 m!1339357))

(assert (=> b!1451237 m!1339357))

(declare-fun m!1339391 () Bool)

(assert (=> b!1451237 m!1339391))

(assert (=> b!1451247 m!1339371))

(declare-fun m!1339393 () Bool)

(assert (=> b!1451247 m!1339393))

(declare-fun m!1339395 () Bool)

(assert (=> b!1451247 m!1339395))

(declare-fun m!1339397 () Bool)

(assert (=> b!1451247 m!1339397))

(assert (=> b!1451247 m!1339357))

(assert (=> b!1451241 m!1339357))

(assert (=> b!1451241 m!1339357))

(declare-fun m!1339399 () Bool)

(assert (=> b!1451241 m!1339399))

(assert (=> b!1451241 m!1339399))

(assert (=> b!1451241 m!1339357))

(declare-fun m!1339401 () Bool)

(assert (=> b!1451241 m!1339401))

(check-sat (not b!1451244) (not b!1451250) (not b!1451251) (not b!1451242) (not b!1451248) (not b!1451238) (not b!1451249) (not b!1451241) (not b!1451237) (not b!1451243) (not b!1451240) (not start!124888))
(check-sat)
