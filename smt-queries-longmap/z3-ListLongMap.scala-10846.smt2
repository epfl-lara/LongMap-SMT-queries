; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127200 () Bool)

(assert start!127200)

(declare-fun res!1015469 () Bool)

(declare-fun e!836809 () Bool)

(assert (=> start!127200 (=> (not res!1015469) (not e!836809))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127200 (= res!1015469 (validMask!0 mask!2687))))

(assert (=> start!127200 e!836809))

(assert (=> start!127200 true))

(declare-datatypes ((array!99811 0))(
  ( (array!99812 (arr!48172 (Array (_ BitVec 32) (_ BitVec 64))) (size!48723 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99811)

(declare-fun array_inv!37453 (array!99811) Bool)

(assert (=> start!127200 (array_inv!37453 a!2862)))

(declare-fun b!1493414 () Bool)

(declare-fun res!1015459 () Bool)

(declare-fun e!836814 () Bool)

(assert (=> b!1493414 (=> (not res!1015459) (not e!836814))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12309 0))(
  ( (MissingZero!12309 (index!51628 (_ BitVec 32))) (Found!12309 (index!51629 (_ BitVec 32))) (Intermediate!12309 (undefined!13121 Bool) (index!51630 (_ BitVec 32)) (x!133398 (_ BitVec 32))) (Undefined!12309) (MissingVacant!12309 (index!51631 (_ BitVec 32))) )
))
(declare-fun lt!651007 () SeekEntryResult!12309)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99811 (_ BitVec 32)) SeekEntryResult!12309)

(assert (=> b!1493414 (= res!1015459 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48172 a!2862) j!93) a!2862 mask!2687) lt!651007))))

(declare-fun b!1493415 () Bool)

(declare-fun res!1015454 () Bool)

(assert (=> b!1493415 (=> (not res!1015454) (not e!836809))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493415 (= res!1015454 (validKeyInArray!0 (select (arr!48172 a!2862) i!1006)))))

(declare-fun e!836812 () Bool)

(declare-fun lt!651005 () (_ BitVec 64))

(declare-fun b!1493416 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!651003 () array!99811)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99811 (_ BitVec 32)) SeekEntryResult!12309)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99811 (_ BitVec 32)) SeekEntryResult!12309)

(assert (=> b!1493416 (= e!836812 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651005 lt!651003 mask!2687) (seekEntryOrOpen!0 lt!651005 lt!651003 mask!2687)))))

(declare-fun b!1493417 () Bool)

(declare-fun res!1015462 () Bool)

(assert (=> b!1493417 (=> (not res!1015462) (not e!836809))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493417 (= res!1015462 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48723 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48723 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48723 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493418 () Bool)

(declare-fun e!836810 () Bool)

(assert (=> b!1493418 (= e!836810 e!836814)))

(declare-fun res!1015467 () Bool)

(assert (=> b!1493418 (=> (not res!1015467) (not e!836814))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493418 (= res!1015467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48172 a!2862) j!93) mask!2687) (select (arr!48172 a!2862) j!93) a!2862 mask!2687) lt!651007))))

(assert (=> b!1493418 (= lt!651007 (Intermediate!12309 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493419 () Bool)

(declare-fun lt!651002 () SeekEntryResult!12309)

(assert (=> b!1493419 (= e!836812 (= lt!651002 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651005 lt!651003 mask!2687)))))

(declare-fun b!1493420 () Bool)

(declare-fun e!836813 () Bool)

(assert (=> b!1493420 (= e!836813 true)))

(declare-fun lt!651004 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493420 (= lt!651004 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1493421 () Bool)

(declare-fun res!1015461 () Bool)

(assert (=> b!1493421 (=> (not res!1015461) (not e!836809))))

(assert (=> b!1493421 (= res!1015461 (validKeyInArray!0 (select (arr!48172 a!2862) j!93)))))

(declare-fun b!1493422 () Bool)

(declare-fun res!1015463 () Bool)

(declare-fun e!836808 () Bool)

(assert (=> b!1493422 (=> (not res!1015463) (not e!836808))))

(assert (=> b!1493422 (= res!1015463 (= (seekEntryOrOpen!0 (select (arr!48172 a!2862) j!93) a!2862 mask!2687) (Found!12309 j!93)))))

(declare-fun b!1493423 () Bool)

(declare-fun res!1015456 () Bool)

(assert (=> b!1493423 (=> (not res!1015456) (not e!836809))))

(assert (=> b!1493423 (= res!1015456 (and (= (size!48723 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48723 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48723 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493424 () Bool)

(declare-fun e!836811 () Bool)

(assert (=> b!1493424 (= e!836814 e!836811)))

(declare-fun res!1015465 () Bool)

(assert (=> b!1493424 (=> (not res!1015465) (not e!836811))))

(assert (=> b!1493424 (= res!1015465 (= lt!651002 (Intermediate!12309 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493424 (= lt!651002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651005 mask!2687) lt!651005 lt!651003 mask!2687))))

(assert (=> b!1493424 (= lt!651005 (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493425 () Bool)

(assert (=> b!1493425 (= e!836809 e!836810)))

(declare-fun res!1015468 () Bool)

(assert (=> b!1493425 (=> (not res!1015468) (not e!836810))))

(assert (=> b!1493425 (= res!1015468 (= (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493425 (= lt!651003 (array!99812 (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48723 a!2862)))))

(declare-fun b!1493426 () Bool)

(declare-fun res!1015464 () Bool)

(assert (=> b!1493426 (=> (not res!1015464) (not e!836811))))

(assert (=> b!1493426 (= res!1015464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493427 () Bool)

(declare-fun res!1015457 () Bool)

(assert (=> b!1493427 (=> (not res!1015457) (not e!836811))))

(assert (=> b!1493427 (= res!1015457 e!836812)))

(declare-fun c!138517 () Bool)

(assert (=> b!1493427 (= c!138517 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493428 () Bool)

(declare-fun res!1015466 () Bool)

(assert (=> b!1493428 (=> (not res!1015466) (not e!836809))))

(declare-datatypes ((List!34660 0))(
  ( (Nil!34657) (Cons!34656 (h!36053 (_ BitVec 64)) (t!49346 List!34660)) )
))
(declare-fun arrayNoDuplicates!0 (array!99811 (_ BitVec 32) List!34660) Bool)

(assert (=> b!1493428 (= res!1015466 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34657))))

(declare-fun b!1493429 () Bool)

(assert (=> b!1493429 (= e!836808 (or (= (select (arr!48172 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48172 a!2862) intermediateBeforeIndex!19) (select (arr!48172 a!2862) j!93))))))

(declare-fun b!1493430 () Bool)

(declare-fun res!1015458 () Bool)

(assert (=> b!1493430 (=> (not res!1015458) (not e!836809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99811 (_ BitVec 32)) Bool)

(assert (=> b!1493430 (= res!1015458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493431 () Bool)

(assert (=> b!1493431 (= e!836811 (not e!836813))))

(declare-fun res!1015455 () Bool)

(assert (=> b!1493431 (=> res!1015455 e!836813)))

(assert (=> b!1493431 (= res!1015455 (or (and (= (select (arr!48172 a!2862) index!646) (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48172 a!2862) index!646) (select (arr!48172 a!2862) j!93))) (= (select (arr!48172 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493431 e!836808))

(declare-fun res!1015460 () Bool)

(assert (=> b!1493431 (=> (not res!1015460) (not e!836808))))

(assert (=> b!1493431 (= res!1015460 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49991 0))(
  ( (Unit!49992) )
))
(declare-fun lt!651006 () Unit!49991)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49991)

(assert (=> b!1493431 (= lt!651006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127200 res!1015469) b!1493423))

(assert (= (and b!1493423 res!1015456) b!1493415))

(assert (= (and b!1493415 res!1015454) b!1493421))

(assert (= (and b!1493421 res!1015461) b!1493430))

(assert (= (and b!1493430 res!1015458) b!1493428))

(assert (= (and b!1493428 res!1015466) b!1493417))

(assert (= (and b!1493417 res!1015462) b!1493425))

(assert (= (and b!1493425 res!1015468) b!1493418))

(assert (= (and b!1493418 res!1015467) b!1493414))

(assert (= (and b!1493414 res!1015459) b!1493424))

(assert (= (and b!1493424 res!1015465) b!1493427))

(assert (= (and b!1493427 c!138517) b!1493419))

(assert (= (and b!1493427 (not c!138517)) b!1493416))

(assert (= (and b!1493427 res!1015457) b!1493426))

(assert (= (and b!1493426 res!1015464) b!1493431))

(assert (= (and b!1493431 res!1015460) b!1493422))

(assert (= (and b!1493422 res!1015463) b!1493429))

(assert (= (and b!1493431 (not res!1015455)) b!1493420))

(declare-fun m!1377523 () Bool)

(assert (=> b!1493416 m!1377523))

(declare-fun m!1377525 () Bool)

(assert (=> b!1493416 m!1377525))

(declare-fun m!1377527 () Bool)

(assert (=> b!1493418 m!1377527))

(assert (=> b!1493418 m!1377527))

(declare-fun m!1377529 () Bool)

(assert (=> b!1493418 m!1377529))

(assert (=> b!1493418 m!1377529))

(assert (=> b!1493418 m!1377527))

(declare-fun m!1377531 () Bool)

(assert (=> b!1493418 m!1377531))

(declare-fun m!1377533 () Bool)

(assert (=> b!1493430 m!1377533))

(declare-fun m!1377535 () Bool)

(assert (=> b!1493419 m!1377535))

(declare-fun m!1377537 () Bool)

(assert (=> b!1493415 m!1377537))

(assert (=> b!1493415 m!1377537))

(declare-fun m!1377539 () Bool)

(assert (=> b!1493415 m!1377539))

(assert (=> b!1493414 m!1377527))

(assert (=> b!1493414 m!1377527))

(declare-fun m!1377541 () Bool)

(assert (=> b!1493414 m!1377541))

(declare-fun m!1377543 () Bool)

(assert (=> b!1493429 m!1377543))

(assert (=> b!1493429 m!1377527))

(declare-fun m!1377545 () Bool)

(assert (=> b!1493420 m!1377545))

(declare-fun m!1377547 () Bool)

(assert (=> b!1493431 m!1377547))

(declare-fun m!1377549 () Bool)

(assert (=> b!1493431 m!1377549))

(declare-fun m!1377551 () Bool)

(assert (=> b!1493431 m!1377551))

(declare-fun m!1377553 () Bool)

(assert (=> b!1493431 m!1377553))

(declare-fun m!1377555 () Bool)

(assert (=> b!1493431 m!1377555))

(assert (=> b!1493431 m!1377527))

(assert (=> b!1493425 m!1377549))

(declare-fun m!1377557 () Bool)

(assert (=> b!1493425 m!1377557))

(assert (=> b!1493421 m!1377527))

(assert (=> b!1493421 m!1377527))

(declare-fun m!1377559 () Bool)

(assert (=> b!1493421 m!1377559))

(declare-fun m!1377561 () Bool)

(assert (=> b!1493424 m!1377561))

(assert (=> b!1493424 m!1377561))

(declare-fun m!1377563 () Bool)

(assert (=> b!1493424 m!1377563))

(assert (=> b!1493424 m!1377549))

(declare-fun m!1377565 () Bool)

(assert (=> b!1493424 m!1377565))

(declare-fun m!1377567 () Bool)

(assert (=> b!1493428 m!1377567))

(declare-fun m!1377569 () Bool)

(assert (=> start!127200 m!1377569))

(declare-fun m!1377571 () Bool)

(assert (=> start!127200 m!1377571))

(assert (=> b!1493422 m!1377527))

(assert (=> b!1493422 m!1377527))

(declare-fun m!1377573 () Bool)

(assert (=> b!1493422 m!1377573))

(check-sat (not b!1493419) (not b!1493431) (not start!127200) (not b!1493421) (not b!1493415) (not b!1493428) (not b!1493422) (not b!1493424) (not b!1493418) (not b!1493420) (not b!1493430) (not b!1493414) (not b!1493416))
(check-sat)
