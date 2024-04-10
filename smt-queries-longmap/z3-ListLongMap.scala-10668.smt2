; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125148 () Bool)

(assert start!125148)

(declare-fun b!1458528 () Bool)

(declare-fun res!988631 () Bool)

(declare-fun e!820383 () Bool)

(assert (=> b!1458528 (=> res!988631 e!820383)))

(declare-datatypes ((array!98596 0))(
  ( (array!98597 (arr!47586 (Array (_ BitVec 32) (_ BitVec 64))) (size!48136 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98596)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11838 0))(
  ( (MissingZero!11838 (index!49744 (_ BitVec 32))) (Found!11838 (index!49745 (_ BitVec 32))) (Intermediate!11838 (undefined!12650 Bool) (index!49746 (_ BitVec 32)) (x!131359 (_ BitVec 32))) (Undefined!11838) (MissingVacant!11838 (index!49747 (_ BitVec 32))) )
))
(declare-fun lt!639076 () SeekEntryResult!11838)

(declare-fun lt!639081 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11838)

(assert (=> b!1458528 (= res!988631 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639081 (select (arr!47586 a!2862) j!93) a!2862 mask!2687) lt!639076)))))

(declare-fun b!1458529 () Bool)

(declare-fun res!988646 () Bool)

(declare-fun e!820382 () Bool)

(assert (=> b!1458529 (=> (not res!988646) (not e!820382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98596 (_ BitVec 32)) Bool)

(assert (=> b!1458529 (= res!988646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458530 () Bool)

(declare-fun e!820388 () Bool)

(declare-fun lt!639080 () array!98596)

(declare-fun lt!639077 () SeekEntryResult!11838)

(declare-fun lt!639078 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11838)

(assert (=> b!1458530 (= e!820388 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639081 intermediateAfterIndex!19 lt!639078 lt!639080 mask!2687) lt!639077)))))

(declare-fun e!820384 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1458531 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11838)

(assert (=> b!1458531 (= e!820384 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639078 lt!639080 mask!2687) (seekEntryOrOpen!0 lt!639078 lt!639080 mask!2687)))))

(declare-fun b!1458532 () Bool)

(declare-fun res!988641 () Bool)

(declare-fun e!820386 () Bool)

(assert (=> b!1458532 (=> (not res!988641) (not e!820386))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458532 (= res!988641 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458533 () Bool)

(declare-fun res!988643 () Bool)

(declare-fun e!820389 () Bool)

(assert (=> b!1458533 (=> (not res!988643) (not e!820389))))

(assert (=> b!1458533 (= res!988643 (= (seekEntryOrOpen!0 (select (arr!47586 a!2862) j!93) a!2862 mask!2687) (Found!11838 j!93)))))

(declare-fun lt!639079 () SeekEntryResult!11838)

(declare-fun b!1458534 () Bool)

(assert (=> b!1458534 (= e!820388 (not (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639081 lt!639078 lt!639080 mask!2687))))))

(declare-fun b!1458535 () Bool)

(declare-fun res!988648 () Bool)

(assert (=> b!1458535 (=> (not res!988648) (not e!820382))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458535 (= res!988648 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48136 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48136 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48136 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458536 () Bool)

(declare-fun res!988639 () Bool)

(assert (=> b!1458536 (=> (not res!988639) (not e!820382))))

(assert (=> b!1458536 (= res!988639 (and (= (size!48136 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48136 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48136 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!988632 () Bool)

(assert (=> start!125148 (=> (not res!988632) (not e!820382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125148 (= res!988632 (validMask!0 mask!2687))))

(assert (=> start!125148 e!820382))

(assert (=> start!125148 true))

(declare-fun array_inv!36614 (array!98596) Bool)

(assert (=> start!125148 (array_inv!36614 a!2862)))

(declare-fun b!1458537 () Bool)

(declare-fun e!820387 () Bool)

(assert (=> b!1458537 (= e!820387 e!820386)))

(declare-fun res!988635 () Bool)

(assert (=> b!1458537 (=> (not res!988635) (not e!820386))))

(assert (=> b!1458537 (= res!988635 (= lt!639079 (Intermediate!11838 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458537 (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639078 mask!2687) lt!639078 lt!639080 mask!2687))))

(assert (=> b!1458537 (= lt!639078 (select (store (arr!47586 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458538 () Bool)

(declare-fun res!988633 () Bool)

(assert (=> b!1458538 (=> (not res!988633) (not e!820382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458538 (= res!988633 (validKeyInArray!0 (select (arr!47586 a!2862) i!1006)))))

(declare-fun b!1458539 () Bool)

(declare-fun res!988645 () Bool)

(assert (=> b!1458539 (=> (not res!988645) (not e!820386))))

(assert (=> b!1458539 (= res!988645 e!820384)))

(declare-fun c!134460 () Bool)

(assert (=> b!1458539 (= c!134460 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458540 () Bool)

(declare-fun e!820385 () Bool)

(assert (=> b!1458540 (= e!820385 e!820387)))

(declare-fun res!988640 () Bool)

(assert (=> b!1458540 (=> (not res!988640) (not e!820387))))

(assert (=> b!1458540 (= res!988640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47586 a!2862) j!93) mask!2687) (select (arr!47586 a!2862) j!93) a!2862 mask!2687) lt!639076))))

(assert (=> b!1458540 (= lt!639076 (Intermediate!11838 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458541 () Bool)

(declare-fun res!988638 () Bool)

(assert (=> b!1458541 (=> (not res!988638) (not e!820382))))

(assert (=> b!1458541 (= res!988638 (validKeyInArray!0 (select (arr!47586 a!2862) j!93)))))

(declare-fun b!1458542 () Bool)

(assert (=> b!1458542 (= e!820389 (and (or (= (select (arr!47586 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47586 a!2862) intermediateBeforeIndex!19) (select (arr!47586 a!2862) j!93))) (let ((bdg!53434 (select (store (arr!47586 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47586 a!2862) index!646) bdg!53434) (= (select (arr!47586 a!2862) index!646) (select (arr!47586 a!2862) j!93))) (= (select (arr!47586 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53434 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458543 () Bool)

(declare-fun e!820390 () Bool)

(assert (=> b!1458543 (= e!820390 e!820383)))

(declare-fun res!988647 () Bool)

(assert (=> b!1458543 (=> res!988647 e!820383)))

(assert (=> b!1458543 (= res!988647 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639081 #b00000000000000000000000000000000) (bvsge lt!639081 (size!48136 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458543 (= lt!639081 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458543 (= lt!639077 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639078 lt!639080 mask!2687))))

(assert (=> b!1458543 (= lt!639077 (seekEntryOrOpen!0 lt!639078 lt!639080 mask!2687))))

(declare-fun b!1458544 () Bool)

(declare-fun res!988636 () Bool)

(assert (=> b!1458544 (=> (not res!988636) (not e!820382))))

(declare-datatypes ((List!34087 0))(
  ( (Nil!34084) (Cons!34083 (h!35433 (_ BitVec 64)) (t!48781 List!34087)) )
))
(declare-fun arrayNoDuplicates!0 (array!98596 (_ BitVec 32) List!34087) Bool)

(assert (=> b!1458544 (= res!988636 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34084))))

(declare-fun b!1458545 () Bool)

(assert (=> b!1458545 (= e!820382 e!820385)))

(declare-fun res!988637 () Bool)

(assert (=> b!1458545 (=> (not res!988637) (not e!820385))))

(assert (=> b!1458545 (= res!988637 (= (select (store (arr!47586 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458545 (= lt!639080 (array!98597 (store (arr!47586 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48136 a!2862)))))

(declare-fun b!1458546 () Bool)

(declare-fun res!988634 () Bool)

(assert (=> b!1458546 (=> (not res!988634) (not e!820387))))

(assert (=> b!1458546 (= res!988634 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47586 a!2862) j!93) a!2862 mask!2687) lt!639076))))

(declare-fun b!1458547 () Bool)

(assert (=> b!1458547 (= e!820383 true)))

(declare-fun lt!639075 () Bool)

(assert (=> b!1458547 (= lt!639075 e!820388)))

(declare-fun c!134459 () Bool)

(assert (=> b!1458547 (= c!134459 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458548 () Bool)

(assert (=> b!1458548 (= e!820384 (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639078 lt!639080 mask!2687)))))

(declare-fun b!1458549 () Bool)

(assert (=> b!1458549 (= e!820386 (not e!820390))))

(declare-fun res!988642 () Bool)

(assert (=> b!1458549 (=> res!988642 e!820390)))

(assert (=> b!1458549 (= res!988642 (or (and (= (select (arr!47586 a!2862) index!646) (select (store (arr!47586 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47586 a!2862) index!646) (select (arr!47586 a!2862) j!93))) (= (select (arr!47586 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458549 e!820389))

(declare-fun res!988644 () Bool)

(assert (=> b!1458549 (=> (not res!988644) (not e!820389))))

(assert (=> b!1458549 (= res!988644 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49172 0))(
  ( (Unit!49173) )
))
(declare-fun lt!639074 () Unit!49172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49172)

(assert (=> b!1458549 (= lt!639074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125148 res!988632) b!1458536))

(assert (= (and b!1458536 res!988639) b!1458538))

(assert (= (and b!1458538 res!988633) b!1458541))

(assert (= (and b!1458541 res!988638) b!1458529))

(assert (= (and b!1458529 res!988646) b!1458544))

(assert (= (and b!1458544 res!988636) b!1458535))

(assert (= (and b!1458535 res!988648) b!1458545))

(assert (= (and b!1458545 res!988637) b!1458540))

(assert (= (and b!1458540 res!988640) b!1458546))

(assert (= (and b!1458546 res!988634) b!1458537))

(assert (= (and b!1458537 res!988635) b!1458539))

(assert (= (and b!1458539 c!134460) b!1458548))

(assert (= (and b!1458539 (not c!134460)) b!1458531))

(assert (= (and b!1458539 res!988645) b!1458532))

(assert (= (and b!1458532 res!988641) b!1458549))

(assert (= (and b!1458549 res!988644) b!1458533))

(assert (= (and b!1458533 res!988643) b!1458542))

(assert (= (and b!1458549 (not res!988642)) b!1458543))

(assert (= (and b!1458543 (not res!988647)) b!1458528))

(assert (= (and b!1458528 (not res!988631)) b!1458547))

(assert (= (and b!1458547 c!134459) b!1458534))

(assert (= (and b!1458547 (not c!134459)) b!1458530))

(declare-fun m!1346375 () Bool)

(assert (=> b!1458534 m!1346375))

(declare-fun m!1346377 () Bool)

(assert (=> b!1458529 m!1346377))

(declare-fun m!1346379 () Bool)

(assert (=> b!1458548 m!1346379))

(declare-fun m!1346381 () Bool)

(assert (=> b!1458531 m!1346381))

(declare-fun m!1346383 () Bool)

(assert (=> b!1458531 m!1346383))

(declare-fun m!1346385 () Bool)

(assert (=> b!1458543 m!1346385))

(assert (=> b!1458543 m!1346381))

(assert (=> b!1458543 m!1346383))

(declare-fun m!1346387 () Bool)

(assert (=> b!1458533 m!1346387))

(assert (=> b!1458533 m!1346387))

(declare-fun m!1346389 () Bool)

(assert (=> b!1458533 m!1346389))

(assert (=> b!1458541 m!1346387))

(assert (=> b!1458541 m!1346387))

(declare-fun m!1346391 () Bool)

(assert (=> b!1458541 m!1346391))

(assert (=> b!1458540 m!1346387))

(assert (=> b!1458540 m!1346387))

(declare-fun m!1346393 () Bool)

(assert (=> b!1458540 m!1346393))

(assert (=> b!1458540 m!1346393))

(assert (=> b!1458540 m!1346387))

(declare-fun m!1346395 () Bool)

(assert (=> b!1458540 m!1346395))

(declare-fun m!1346397 () Bool)

(assert (=> b!1458545 m!1346397))

(declare-fun m!1346399 () Bool)

(assert (=> b!1458545 m!1346399))

(declare-fun m!1346401 () Bool)

(assert (=> b!1458544 m!1346401))

(declare-fun m!1346403 () Bool)

(assert (=> b!1458549 m!1346403))

(assert (=> b!1458549 m!1346397))

(declare-fun m!1346405 () Bool)

(assert (=> b!1458549 m!1346405))

(declare-fun m!1346407 () Bool)

(assert (=> b!1458549 m!1346407))

(declare-fun m!1346409 () Bool)

(assert (=> b!1458549 m!1346409))

(assert (=> b!1458549 m!1346387))

(declare-fun m!1346411 () Bool)

(assert (=> b!1458530 m!1346411))

(declare-fun m!1346413 () Bool)

(assert (=> b!1458537 m!1346413))

(assert (=> b!1458537 m!1346413))

(declare-fun m!1346415 () Bool)

(assert (=> b!1458537 m!1346415))

(assert (=> b!1458537 m!1346397))

(declare-fun m!1346417 () Bool)

(assert (=> b!1458537 m!1346417))

(assert (=> b!1458546 m!1346387))

(assert (=> b!1458546 m!1346387))

(declare-fun m!1346419 () Bool)

(assert (=> b!1458546 m!1346419))

(declare-fun m!1346421 () Bool)

(assert (=> b!1458538 m!1346421))

(assert (=> b!1458538 m!1346421))

(declare-fun m!1346423 () Bool)

(assert (=> b!1458538 m!1346423))

(assert (=> b!1458528 m!1346387))

(assert (=> b!1458528 m!1346387))

(declare-fun m!1346425 () Bool)

(assert (=> b!1458528 m!1346425))

(declare-fun m!1346427 () Bool)

(assert (=> start!125148 m!1346427))

(declare-fun m!1346429 () Bool)

(assert (=> start!125148 m!1346429))

(assert (=> b!1458542 m!1346397))

(declare-fun m!1346431 () Bool)

(assert (=> b!1458542 m!1346431))

(assert (=> b!1458542 m!1346405))

(assert (=> b!1458542 m!1346407))

(assert (=> b!1458542 m!1346387))

(check-sat (not b!1458549) (not b!1458534) (not b!1458544) (not b!1458533) (not b!1458546) (not b!1458548) (not b!1458528) (not b!1458541) (not b!1458540) (not start!125148) (not b!1458543) (not b!1458530) (not b!1458531) (not b!1458538) (not b!1458537) (not b!1458529))
(check-sat)
