; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127158 () Bool)

(assert start!127158)

(declare-fun b!1492280 () Bool)

(declare-fun e!836306 () Bool)

(declare-fun e!836308 () Bool)

(assert (=> b!1492280 (= e!836306 e!836308)))

(declare-fun res!1014456 () Bool)

(assert (=> b!1492280 (=> (not res!1014456) (not e!836308))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99769 0))(
  ( (array!99770 (arr!48151 (Array (_ BitVec 32) (_ BitVec 64))) (size!48702 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99769)

(assert (=> b!1492280 (= res!1014456 (= (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650625 () array!99769)

(assert (=> b!1492280 (= lt!650625 (array!99770 (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48702 a!2862)))))

(declare-fun res!1014447 () Bool)

(assert (=> start!127158 (=> (not res!1014447) (not e!836306))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127158 (= res!1014447 (validMask!0 mask!2687))))

(assert (=> start!127158 e!836306))

(assert (=> start!127158 true))

(declare-fun array_inv!37432 (array!99769) Bool)

(assert (=> start!127158 (array_inv!37432 a!2862)))

(declare-fun b!1492281 () Bool)

(declare-fun res!1014451 () Bool)

(declare-fun e!836305 () Bool)

(assert (=> b!1492281 (=> (not res!1014451) (not e!836305))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12288 0))(
  ( (MissingZero!12288 (index!51544 (_ BitVec 32))) (Found!12288 (index!51545 (_ BitVec 32))) (Intermediate!12288 (undefined!13100 Bool) (index!51546 (_ BitVec 32)) (x!133321 (_ BitVec 32))) (Undefined!12288) (MissingVacant!12288 (index!51547 (_ BitVec 32))) )
))
(declare-fun lt!650624 () SeekEntryResult!12288)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12288)

(assert (=> b!1492281 (= res!1014451 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!650624))))

(declare-fun e!836310 () Bool)

(declare-fun lt!650629 () (_ BitVec 64))

(declare-fun b!1492282 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12288)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12288)

(assert (=> b!1492282 (= e!836310 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650629 lt!650625 mask!2687) (seekEntryOrOpen!0 lt!650629 lt!650625 mask!2687)))))

(declare-fun b!1492283 () Bool)

(declare-fun res!1014453 () Bool)

(assert (=> b!1492283 (=> (not res!1014453) (not e!836306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99769 (_ BitVec 32)) Bool)

(assert (=> b!1492283 (= res!1014453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492284 () Bool)

(declare-fun e!836303 () Bool)

(declare-fun e!836307 () Bool)

(assert (=> b!1492284 (= e!836303 (not e!836307))))

(declare-fun res!1014459 () Bool)

(assert (=> b!1492284 (=> res!1014459 e!836307)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492284 (= res!1014459 (or (and (= (select (arr!48151 a!2862) index!646) (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48151 a!2862) index!646) (select (arr!48151 a!2862) j!93))) (= (select (arr!48151 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836309 () Bool)

(assert (=> b!1492284 e!836309))

(declare-fun res!1014452 () Bool)

(assert (=> b!1492284 (=> (not res!1014452) (not e!836309))))

(assert (=> b!1492284 (= res!1014452 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49949 0))(
  ( (Unit!49950) )
))
(declare-fun lt!650627 () Unit!49949)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49949)

(assert (=> b!1492284 (= lt!650627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492285 () Bool)

(declare-fun res!1014458 () Bool)

(assert (=> b!1492285 (=> (not res!1014458) (not e!836309))))

(assert (=> b!1492285 (= res!1014458 (= (seekEntryOrOpen!0 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) (Found!12288 j!93)))))

(declare-fun b!1492286 () Bool)

(declare-fun res!1014461 () Bool)

(assert (=> b!1492286 (=> (not res!1014461) (not e!836306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492286 (= res!1014461 (validKeyInArray!0 (select (arr!48151 a!2862) i!1006)))))

(declare-fun b!1492287 () Bool)

(assert (=> b!1492287 (= e!836308 e!836305)))

(declare-fun res!1014450 () Bool)

(assert (=> b!1492287 (=> (not res!1014450) (not e!836305))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492287 (= res!1014450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48151 a!2862) j!93) mask!2687) (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!650624))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492287 (= lt!650624 (Intermediate!12288 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492288 () Bool)

(declare-fun res!1014448 () Bool)

(assert (=> b!1492288 (=> (not res!1014448) (not e!836306))))

(assert (=> b!1492288 (= res!1014448 (validKeyInArray!0 (select (arr!48151 a!2862) j!93)))))

(declare-fun b!1492289 () Bool)

(declare-fun res!1014460 () Bool)

(assert (=> b!1492289 (=> (not res!1014460) (not e!836306))))

(declare-datatypes ((List!34639 0))(
  ( (Nil!34636) (Cons!34635 (h!36032 (_ BitVec 64)) (t!49325 List!34639)) )
))
(declare-fun arrayNoDuplicates!0 (array!99769 (_ BitVec 32) List!34639) Bool)

(assert (=> b!1492289 (= res!1014460 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34636))))

(declare-fun b!1492290 () Bool)

(declare-fun res!1014454 () Bool)

(assert (=> b!1492290 (=> (not res!1014454) (not e!836306))))

(assert (=> b!1492290 (= res!1014454 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48702 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48702 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48702 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492291 () Bool)

(assert (=> b!1492291 (= e!836305 e!836303)))

(declare-fun res!1014449 () Bool)

(assert (=> b!1492291 (=> (not res!1014449) (not e!836303))))

(declare-fun lt!650626 () SeekEntryResult!12288)

(assert (=> b!1492291 (= res!1014449 (= lt!650626 (Intermediate!12288 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1492291 (= lt!650626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650629 mask!2687) lt!650629 lt!650625 mask!2687))))

(assert (=> b!1492291 (= lt!650629 (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492292 () Bool)

(assert (=> b!1492292 (= e!836307 true)))

(declare-fun lt!650628 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492292 (= lt!650628 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1492293 () Bool)

(assert (=> b!1492293 (= e!836309 (or (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) (select (arr!48151 a!2862) j!93))))))

(declare-fun b!1492294 () Bool)

(declare-fun res!1014455 () Bool)

(assert (=> b!1492294 (=> (not res!1014455) (not e!836306))))

(assert (=> b!1492294 (= res!1014455 (and (= (size!48702 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48702 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48702 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492295 () Bool)

(declare-fun res!1014457 () Bool)

(assert (=> b!1492295 (=> (not res!1014457) (not e!836303))))

(assert (=> b!1492295 (= res!1014457 e!836310)))

(declare-fun c!138454 () Bool)

(assert (=> b!1492295 (= c!138454 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492296 () Bool)

(assert (=> b!1492296 (= e!836310 (= lt!650626 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650629 lt!650625 mask!2687)))))

(declare-fun b!1492297 () Bool)

(declare-fun res!1014446 () Bool)

(assert (=> b!1492297 (=> (not res!1014446) (not e!836303))))

(assert (=> b!1492297 (= res!1014446 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127158 res!1014447) b!1492294))

(assert (= (and b!1492294 res!1014455) b!1492286))

(assert (= (and b!1492286 res!1014461) b!1492288))

(assert (= (and b!1492288 res!1014448) b!1492283))

(assert (= (and b!1492283 res!1014453) b!1492289))

(assert (= (and b!1492289 res!1014460) b!1492290))

(assert (= (and b!1492290 res!1014454) b!1492280))

(assert (= (and b!1492280 res!1014456) b!1492287))

(assert (= (and b!1492287 res!1014450) b!1492281))

(assert (= (and b!1492281 res!1014451) b!1492291))

(assert (= (and b!1492291 res!1014449) b!1492295))

(assert (= (and b!1492295 c!138454) b!1492296))

(assert (= (and b!1492295 (not c!138454)) b!1492282))

(assert (= (and b!1492295 res!1014457) b!1492297))

(assert (= (and b!1492297 res!1014446) b!1492284))

(assert (= (and b!1492284 res!1014452) b!1492285))

(assert (= (and b!1492285 res!1014458) b!1492293))

(assert (= (and b!1492284 (not res!1014459)) b!1492292))

(declare-fun m!1376431 () Bool)

(assert (=> b!1492281 m!1376431))

(assert (=> b!1492281 m!1376431))

(declare-fun m!1376433 () Bool)

(assert (=> b!1492281 m!1376433))

(declare-fun m!1376435 () Bool)

(assert (=> start!127158 m!1376435))

(declare-fun m!1376437 () Bool)

(assert (=> start!127158 m!1376437))

(declare-fun m!1376439 () Bool)

(assert (=> b!1492280 m!1376439))

(declare-fun m!1376441 () Bool)

(assert (=> b!1492280 m!1376441))

(declare-fun m!1376443 () Bool)

(assert (=> b!1492293 m!1376443))

(assert (=> b!1492293 m!1376431))

(declare-fun m!1376445 () Bool)

(assert (=> b!1492284 m!1376445))

(assert (=> b!1492284 m!1376439))

(declare-fun m!1376447 () Bool)

(assert (=> b!1492284 m!1376447))

(declare-fun m!1376449 () Bool)

(assert (=> b!1492284 m!1376449))

(declare-fun m!1376451 () Bool)

(assert (=> b!1492284 m!1376451))

(assert (=> b!1492284 m!1376431))

(assert (=> b!1492285 m!1376431))

(assert (=> b!1492285 m!1376431))

(declare-fun m!1376453 () Bool)

(assert (=> b!1492285 m!1376453))

(declare-fun m!1376455 () Bool)

(assert (=> b!1492291 m!1376455))

(assert (=> b!1492291 m!1376455))

(declare-fun m!1376457 () Bool)

(assert (=> b!1492291 m!1376457))

(assert (=> b!1492291 m!1376439))

(declare-fun m!1376459 () Bool)

(assert (=> b!1492291 m!1376459))

(declare-fun m!1376461 () Bool)

(assert (=> b!1492286 m!1376461))

(assert (=> b!1492286 m!1376461))

(declare-fun m!1376463 () Bool)

(assert (=> b!1492286 m!1376463))

(declare-fun m!1376465 () Bool)

(assert (=> b!1492292 m!1376465))

(assert (=> b!1492288 m!1376431))

(assert (=> b!1492288 m!1376431))

(declare-fun m!1376467 () Bool)

(assert (=> b!1492288 m!1376467))

(declare-fun m!1376469 () Bool)

(assert (=> b!1492296 m!1376469))

(declare-fun m!1376471 () Bool)

(assert (=> b!1492289 m!1376471))

(assert (=> b!1492287 m!1376431))

(assert (=> b!1492287 m!1376431))

(declare-fun m!1376473 () Bool)

(assert (=> b!1492287 m!1376473))

(assert (=> b!1492287 m!1376473))

(assert (=> b!1492287 m!1376431))

(declare-fun m!1376475 () Bool)

(assert (=> b!1492287 m!1376475))

(declare-fun m!1376477 () Bool)

(assert (=> b!1492283 m!1376477))

(declare-fun m!1376479 () Bool)

(assert (=> b!1492282 m!1376479))

(declare-fun m!1376481 () Bool)

(assert (=> b!1492282 m!1376481))

(check-sat (not b!1492289) (not b!1492292) (not b!1492286) (not b!1492287) (not b!1492283) (not b!1492284) (not b!1492296) (not start!127158) (not b!1492285) (not b!1492281) (not b!1492288) (not b!1492291) (not b!1492282))
(check-sat)
