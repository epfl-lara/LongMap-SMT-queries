; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124944 () Bool)

(assert start!124944)

(declare-fun b!1447296 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!815298 () Bool)

(declare-datatypes ((array!98287 0))(
  ( (array!98288 (arr!47428 (Array (_ BitVec 32) (_ BitVec 64))) (size!47979 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98287)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447296 (= e!815298 (or (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47428 a!2862) intermediateBeforeIndex!19) (select (arr!47428 a!2862) j!93))))))

(declare-fun b!1447297 () Bool)

(declare-fun e!815300 () Bool)

(declare-fun e!815303 () Bool)

(assert (=> b!1447297 (= e!815300 e!815303)))

(declare-fun res!978290 () Bool)

(assert (=> b!1447297 (=> (not res!978290) (not e!815303))))

(declare-datatypes ((SeekEntryResult!11577 0))(
  ( (MissingZero!11577 (index!48700 (_ BitVec 32))) (Found!11577 (index!48701 (_ BitVec 32))) (Intermediate!11577 (undefined!12389 Bool) (index!48702 (_ BitVec 32)) (x!130562 (_ BitVec 32))) (Undefined!11577) (MissingVacant!11577 (index!48703 (_ BitVec 32))) )
))
(declare-fun lt!635134 () SeekEntryResult!11577)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447297 (= res!978290 (= lt!635134 (Intermediate!11577 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635131 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635133 () array!98287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98287 (_ BitVec 32)) SeekEntryResult!11577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447297 (= lt!635134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635131 mask!2687) lt!635131 lt!635133 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447297 (= lt!635131 (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447298 () Bool)

(assert (=> b!1447298 (= e!815303 (not true))))

(assert (=> b!1447298 e!815298))

(declare-fun res!978282 () Bool)

(assert (=> b!1447298 (=> (not res!978282) (not e!815298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98287 (_ BitVec 32)) Bool)

(assert (=> b!1447298 (= res!978282 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48683 0))(
  ( (Unit!48684) )
))
(declare-fun lt!635132 () Unit!48683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48683)

(assert (=> b!1447298 (= lt!635132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447299 () Bool)

(declare-fun res!978285 () Bool)

(declare-fun e!815301 () Bool)

(assert (=> b!1447299 (=> (not res!978285) (not e!815301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447299 (= res!978285 (validKeyInArray!0 (select (arr!47428 a!2862) i!1006)))))

(declare-fun b!1447300 () Bool)

(declare-fun res!978288 () Bool)

(assert (=> b!1447300 (=> (not res!978288) (not e!815301))))

(assert (=> b!1447300 (= res!978288 (and (= (size!47979 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47979 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47979 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!978287 () Bool)

(assert (=> start!124944 (=> (not res!978287) (not e!815301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124944 (= res!978287 (validMask!0 mask!2687))))

(assert (=> start!124944 e!815301))

(assert (=> start!124944 true))

(declare-fun array_inv!36709 (array!98287) Bool)

(assert (=> start!124944 (array_inv!36709 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1447301 () Bool)

(declare-fun e!815299 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98287 (_ BitVec 32)) SeekEntryResult!11577)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98287 (_ BitVec 32)) SeekEntryResult!11577)

(assert (=> b!1447301 (= e!815299 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635131 lt!635133 mask!2687) (seekEntryOrOpen!0 lt!635131 lt!635133 mask!2687)))))

(declare-fun b!1447302 () Bool)

(declare-fun e!815302 () Bool)

(assert (=> b!1447302 (= e!815302 e!815300)))

(declare-fun res!978284 () Bool)

(assert (=> b!1447302 (=> (not res!978284) (not e!815300))))

(declare-fun lt!635130 () SeekEntryResult!11577)

(assert (=> b!1447302 (= res!978284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47428 a!2862) j!93) mask!2687) (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!635130))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447302 (= lt!635130 (Intermediate!11577 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447303 () Bool)

(declare-fun res!978296 () Bool)

(assert (=> b!1447303 (=> (not res!978296) (not e!815303))))

(assert (=> b!1447303 (= res!978296 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447304 () Bool)

(declare-fun res!978291 () Bool)

(assert (=> b!1447304 (=> (not res!978291) (not e!815301))))

(declare-datatypes ((List!33916 0))(
  ( (Nil!33913) (Cons!33912 (h!35273 (_ BitVec 64)) (t!48602 List!33916)) )
))
(declare-fun arrayNoDuplicates!0 (array!98287 (_ BitVec 32) List!33916) Bool)

(assert (=> b!1447304 (= res!978291 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33913))))

(declare-fun b!1447305 () Bool)

(declare-fun res!978283 () Bool)

(assert (=> b!1447305 (=> (not res!978283) (not e!815301))))

(assert (=> b!1447305 (= res!978283 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47979 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47979 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47979 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447306 () Bool)

(declare-fun res!978286 () Bool)

(assert (=> b!1447306 (=> (not res!978286) (not e!815300))))

(assert (=> b!1447306 (= res!978286 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47428 a!2862) j!93) a!2862 mask!2687) lt!635130))))

(declare-fun b!1447307 () Bool)

(declare-fun res!978295 () Bool)

(assert (=> b!1447307 (=> (not res!978295) (not e!815301))))

(assert (=> b!1447307 (= res!978295 (validKeyInArray!0 (select (arr!47428 a!2862) j!93)))))

(declare-fun b!1447308 () Bool)

(assert (=> b!1447308 (= e!815301 e!815302)))

(declare-fun res!978289 () Bool)

(assert (=> b!1447308 (=> (not res!978289) (not e!815302))))

(assert (=> b!1447308 (= res!978289 (= (select (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447308 (= lt!635133 (array!98288 (store (arr!47428 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47979 a!2862)))))

(declare-fun b!1447309 () Bool)

(declare-fun res!978292 () Bool)

(assert (=> b!1447309 (=> (not res!978292) (not e!815298))))

(assert (=> b!1447309 (= res!978292 (= (seekEntryOrOpen!0 (select (arr!47428 a!2862) j!93) a!2862 mask!2687) (Found!11577 j!93)))))

(declare-fun b!1447310 () Bool)

(declare-fun res!978293 () Bool)

(assert (=> b!1447310 (=> (not res!978293) (not e!815301))))

(assert (=> b!1447310 (= res!978293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447311 () Bool)

(declare-fun res!978294 () Bool)

(assert (=> b!1447311 (=> (not res!978294) (not e!815303))))

(assert (=> b!1447311 (= res!978294 e!815299)))

(declare-fun c!134026 () Bool)

(assert (=> b!1447311 (= c!134026 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447312 () Bool)

(assert (=> b!1447312 (= e!815299 (= lt!635134 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635131 lt!635133 mask!2687)))))

(assert (= (and start!124944 res!978287) b!1447300))

(assert (= (and b!1447300 res!978288) b!1447299))

(assert (= (and b!1447299 res!978285) b!1447307))

(assert (= (and b!1447307 res!978295) b!1447310))

(assert (= (and b!1447310 res!978293) b!1447304))

(assert (= (and b!1447304 res!978291) b!1447305))

(assert (= (and b!1447305 res!978283) b!1447308))

(assert (= (and b!1447308 res!978289) b!1447302))

(assert (= (and b!1447302 res!978284) b!1447306))

(assert (= (and b!1447306 res!978286) b!1447297))

(assert (= (and b!1447297 res!978290) b!1447311))

(assert (= (and b!1447311 c!134026) b!1447312))

(assert (= (and b!1447311 (not c!134026)) b!1447301))

(assert (= (and b!1447311 res!978294) b!1447303))

(assert (= (and b!1447303 res!978296) b!1447298))

(assert (= (and b!1447298 res!978282) b!1447309))

(assert (= (and b!1447309 res!978292) b!1447296))

(declare-fun m!1336327 () Bool)

(assert (=> b!1447309 m!1336327))

(assert (=> b!1447309 m!1336327))

(declare-fun m!1336329 () Bool)

(assert (=> b!1447309 m!1336329))

(assert (=> b!1447307 m!1336327))

(assert (=> b!1447307 m!1336327))

(declare-fun m!1336331 () Bool)

(assert (=> b!1447307 m!1336331))

(declare-fun m!1336333 () Bool)

(assert (=> b!1447298 m!1336333))

(declare-fun m!1336335 () Bool)

(assert (=> b!1447298 m!1336335))

(declare-fun m!1336337 () Bool)

(assert (=> b!1447308 m!1336337))

(declare-fun m!1336339 () Bool)

(assert (=> b!1447308 m!1336339))

(declare-fun m!1336341 () Bool)

(assert (=> b!1447296 m!1336341))

(assert (=> b!1447296 m!1336327))

(assert (=> b!1447302 m!1336327))

(assert (=> b!1447302 m!1336327))

(declare-fun m!1336343 () Bool)

(assert (=> b!1447302 m!1336343))

(assert (=> b!1447302 m!1336343))

(assert (=> b!1447302 m!1336327))

(declare-fun m!1336345 () Bool)

(assert (=> b!1447302 m!1336345))

(declare-fun m!1336347 () Bool)

(assert (=> b!1447310 m!1336347))

(assert (=> b!1447306 m!1336327))

(assert (=> b!1447306 m!1336327))

(declare-fun m!1336349 () Bool)

(assert (=> b!1447306 m!1336349))

(declare-fun m!1336351 () Bool)

(assert (=> b!1447312 m!1336351))

(declare-fun m!1336353 () Bool)

(assert (=> b!1447301 m!1336353))

(declare-fun m!1336355 () Bool)

(assert (=> b!1447301 m!1336355))

(declare-fun m!1336357 () Bool)

(assert (=> b!1447297 m!1336357))

(assert (=> b!1447297 m!1336357))

(declare-fun m!1336359 () Bool)

(assert (=> b!1447297 m!1336359))

(assert (=> b!1447297 m!1336337))

(declare-fun m!1336361 () Bool)

(assert (=> b!1447297 m!1336361))

(declare-fun m!1336363 () Bool)

(assert (=> b!1447299 m!1336363))

(assert (=> b!1447299 m!1336363))

(declare-fun m!1336365 () Bool)

(assert (=> b!1447299 m!1336365))

(declare-fun m!1336367 () Bool)

(assert (=> b!1447304 m!1336367))

(declare-fun m!1336369 () Bool)

(assert (=> start!124944 m!1336369))

(declare-fun m!1336371 () Bool)

(assert (=> start!124944 m!1336371))

(check-sat (not b!1447309) (not b!1447302) (not b!1447312) (not b!1447310) (not start!124944) (not b!1447299) (not b!1447298) (not b!1447297) (not b!1447301) (not b!1447304) (not b!1447307) (not b!1447306))
(check-sat)
