; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125064 () Bool)

(assert start!125064)

(declare-fun b!1450666 () Bool)

(declare-fun res!981302 () Bool)

(declare-fun e!817024 () Bool)

(assert (=> b!1450666 (=> (not res!981302) (not e!817024))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98407 0))(
  ( (array!98408 (arr!47488 (Array (_ BitVec 32) (_ BitVec 64))) (size!48039 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98407)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450666 (= res!981302 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48039 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48039 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48039 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450667 () Bool)

(declare-fun res!981305 () Bool)

(declare-fun e!817029 () Bool)

(assert (=> b!1450667 (=> (not res!981305) (not e!817029))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11637 0))(
  ( (MissingZero!11637 (index!48940 (_ BitVec 32))) (Found!11637 (index!48941 (_ BitVec 32))) (Intermediate!11637 (undefined!12449 Bool) (index!48942 (_ BitVec 32)) (x!130782 (_ BitVec 32))) (Undefined!11637) (MissingVacant!11637 (index!48943 (_ BitVec 32))) )
))
(declare-fun lt!636345 () SeekEntryResult!11637)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98407 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1450667 (= res!981305 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!636345))))

(declare-fun b!1450668 () Bool)

(declare-fun e!817032 () Bool)

(declare-fun e!817030 () Bool)

(assert (=> b!1450668 (= e!817032 e!817030)))

(declare-fun res!981295 () Bool)

(assert (=> b!1450668 (=> res!981295 e!817030)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450668 (= res!981295 (or (and (= (select (arr!47488 a!2862) index!646) (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (not (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450669 () Bool)

(declare-fun e!817027 () Bool)

(declare-fun e!817031 () Bool)

(assert (=> b!1450669 (= e!817027 (not e!817031))))

(declare-fun res!981292 () Bool)

(assert (=> b!1450669 (=> res!981292 e!817031)))

(assert (=> b!1450669 (= res!981292 (or (and (= (select (arr!47488 a!2862) index!646) (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47488 a!2862) index!646) (select (arr!47488 a!2862) j!93))) (not (= (select (arr!47488 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450669 e!817032))

(declare-fun res!981299 () Bool)

(assert (=> b!1450669 (=> (not res!981299) (not e!817032))))

(declare-fun lt!636340 () SeekEntryResult!11637)

(assert (=> b!1450669 (= res!981299 (and (= lt!636340 (Found!11637 j!93)) (or (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47488 a!2862) intermediateBeforeIndex!19) (select (arr!47488 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98407 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1450669 (= lt!636340 (seekEntryOrOpen!0 (select (arr!47488 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98407 (_ BitVec 32)) Bool)

(assert (=> b!1450669 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48803 0))(
  ( (Unit!48804) )
))
(declare-fun lt!636346 () Unit!48803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48803)

(assert (=> b!1450669 (= lt!636346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450670 () Bool)

(declare-fun e!817023 () Bool)

(assert (=> b!1450670 (= e!817024 e!817023)))

(declare-fun res!981308 () Bool)

(assert (=> b!1450670 (=> (not res!981308) (not e!817023))))

(assert (=> b!1450670 (= res!981308 (= (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636341 () array!98407)

(assert (=> b!1450670 (= lt!636341 (array!98408 (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48039 a!2862)))))

(declare-fun e!817026 () Bool)

(declare-fun b!1450671 () Bool)

(assert (=> b!1450671 (= e!817026 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450672 () Bool)

(assert (=> b!1450672 (= e!817030 e!817026)))

(declare-fun res!981306 () Bool)

(assert (=> b!1450672 (=> (not res!981306) (not e!817026))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98407 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1450672 (= res!981306 (= lt!636340 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47488 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450673 () Bool)

(declare-fun res!981298 () Bool)

(assert (=> b!1450673 (=> (not res!981298) (not e!817024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450673 (= res!981298 (validKeyInArray!0 (select (arr!47488 a!2862) i!1006)))))

(declare-fun b!1450674 () Bool)

(assert (=> b!1450674 (= e!817031 true)))

(declare-fun lt!636343 () SeekEntryResult!11637)

(assert (=> b!1450674 (= lt!636343 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47488 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!981296 () Bool)

(assert (=> start!125064 (=> (not res!981296) (not e!817024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125064 (= res!981296 (validMask!0 mask!2687))))

(assert (=> start!125064 e!817024))

(assert (=> start!125064 true))

(declare-fun array_inv!36769 (array!98407) Bool)

(assert (=> start!125064 (array_inv!36769 a!2862)))

(declare-fun b!1450675 () Bool)

(declare-fun res!981304 () Bool)

(assert (=> b!1450675 (=> (not res!981304) (not e!817027))))

(assert (=> b!1450675 (= res!981304 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!817028 () Bool)

(declare-fun lt!636342 () (_ BitVec 64))

(declare-fun b!1450676 () Bool)

(assert (=> b!1450676 (= e!817028 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636342 lt!636341 mask!2687) (seekEntryOrOpen!0 lt!636342 lt!636341 mask!2687)))))

(declare-fun b!1450677 () Bool)

(declare-fun res!981301 () Bool)

(assert (=> b!1450677 (=> (not res!981301) (not e!817027))))

(assert (=> b!1450677 (= res!981301 e!817028)))

(declare-fun c!134206 () Bool)

(assert (=> b!1450677 (= c!134206 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450678 () Bool)

(declare-fun res!981293 () Bool)

(assert (=> b!1450678 (=> (not res!981293) (not e!817024))))

(declare-datatypes ((List!33976 0))(
  ( (Nil!33973) (Cons!33972 (h!35333 (_ BitVec 64)) (t!48662 List!33976)) )
))
(declare-fun arrayNoDuplicates!0 (array!98407 (_ BitVec 32) List!33976) Bool)

(assert (=> b!1450678 (= res!981293 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33973))))

(declare-fun b!1450679 () Bool)

(assert (=> b!1450679 (= e!817029 e!817027)))

(declare-fun res!981307 () Bool)

(assert (=> b!1450679 (=> (not res!981307) (not e!817027))))

(declare-fun lt!636344 () SeekEntryResult!11637)

(assert (=> b!1450679 (= res!981307 (= lt!636344 (Intermediate!11637 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450679 (= lt!636344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636342 mask!2687) lt!636342 lt!636341 mask!2687))))

(assert (=> b!1450679 (= lt!636342 (select (store (arr!47488 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450680 () Bool)

(declare-fun res!981294 () Bool)

(assert (=> b!1450680 (=> (not res!981294) (not e!817024))))

(assert (=> b!1450680 (= res!981294 (validKeyInArray!0 (select (arr!47488 a!2862) j!93)))))

(declare-fun b!1450681 () Bool)

(assert (=> b!1450681 (= e!817023 e!817029)))

(declare-fun res!981303 () Bool)

(assert (=> b!1450681 (=> (not res!981303) (not e!817029))))

(assert (=> b!1450681 (= res!981303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47488 a!2862) j!93) mask!2687) (select (arr!47488 a!2862) j!93) a!2862 mask!2687) lt!636345))))

(assert (=> b!1450681 (= lt!636345 (Intermediate!11637 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450682 () Bool)

(assert (=> b!1450682 (= e!817028 (= lt!636344 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636342 lt!636341 mask!2687)))))

(declare-fun b!1450683 () Bool)

(declare-fun res!981300 () Bool)

(assert (=> b!1450683 (=> (not res!981300) (not e!817024))))

(assert (=> b!1450683 (= res!981300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450684 () Bool)

(declare-fun res!981297 () Bool)

(assert (=> b!1450684 (=> (not res!981297) (not e!817024))))

(assert (=> b!1450684 (= res!981297 (and (= (size!48039 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48039 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48039 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125064 res!981296) b!1450684))

(assert (= (and b!1450684 res!981297) b!1450673))

(assert (= (and b!1450673 res!981298) b!1450680))

(assert (= (and b!1450680 res!981294) b!1450683))

(assert (= (and b!1450683 res!981300) b!1450678))

(assert (= (and b!1450678 res!981293) b!1450666))

(assert (= (and b!1450666 res!981302) b!1450670))

(assert (= (and b!1450670 res!981308) b!1450681))

(assert (= (and b!1450681 res!981303) b!1450667))

(assert (= (and b!1450667 res!981305) b!1450679))

(assert (= (and b!1450679 res!981307) b!1450677))

(assert (= (and b!1450677 c!134206) b!1450682))

(assert (= (and b!1450677 (not c!134206)) b!1450676))

(assert (= (and b!1450677 res!981301) b!1450675))

(assert (= (and b!1450675 res!981304) b!1450669))

(assert (= (and b!1450669 res!981299) b!1450668))

(assert (= (and b!1450668 (not res!981295)) b!1450672))

(assert (= (and b!1450672 res!981306) b!1450671))

(assert (= (and b!1450669 (not res!981292)) b!1450674))

(declare-fun m!1339495 () Bool)

(assert (=> b!1450681 m!1339495))

(assert (=> b!1450681 m!1339495))

(declare-fun m!1339497 () Bool)

(assert (=> b!1450681 m!1339497))

(assert (=> b!1450681 m!1339497))

(assert (=> b!1450681 m!1339495))

(declare-fun m!1339499 () Bool)

(assert (=> b!1450681 m!1339499))

(assert (=> b!1450680 m!1339495))

(assert (=> b!1450680 m!1339495))

(declare-fun m!1339501 () Bool)

(assert (=> b!1450680 m!1339501))

(declare-fun m!1339503 () Bool)

(assert (=> b!1450673 m!1339503))

(assert (=> b!1450673 m!1339503))

(declare-fun m!1339505 () Bool)

(assert (=> b!1450673 m!1339505))

(declare-fun m!1339507 () Bool)

(assert (=> b!1450668 m!1339507))

(declare-fun m!1339509 () Bool)

(assert (=> b!1450668 m!1339509))

(declare-fun m!1339511 () Bool)

(assert (=> b!1450668 m!1339511))

(assert (=> b!1450668 m!1339495))

(assert (=> b!1450670 m!1339509))

(declare-fun m!1339513 () Bool)

(assert (=> b!1450670 m!1339513))

(declare-fun m!1339515 () Bool)

(assert (=> b!1450683 m!1339515))

(declare-fun m!1339517 () Bool)

(assert (=> b!1450676 m!1339517))

(declare-fun m!1339519 () Bool)

(assert (=> b!1450676 m!1339519))

(declare-fun m!1339521 () Bool)

(assert (=> b!1450679 m!1339521))

(assert (=> b!1450679 m!1339521))

(declare-fun m!1339523 () Bool)

(assert (=> b!1450679 m!1339523))

(assert (=> b!1450679 m!1339509))

(declare-fun m!1339525 () Bool)

(assert (=> b!1450679 m!1339525))

(declare-fun m!1339527 () Bool)

(assert (=> b!1450669 m!1339527))

(assert (=> b!1450669 m!1339509))

(declare-fun m!1339529 () Bool)

(assert (=> b!1450669 m!1339529))

(assert (=> b!1450669 m!1339511))

(assert (=> b!1450669 m!1339507))

(assert (=> b!1450669 m!1339495))

(declare-fun m!1339531 () Bool)

(assert (=> b!1450669 m!1339531))

(declare-fun m!1339533 () Bool)

(assert (=> b!1450669 m!1339533))

(assert (=> b!1450669 m!1339495))

(assert (=> b!1450672 m!1339495))

(assert (=> b!1450672 m!1339495))

(declare-fun m!1339535 () Bool)

(assert (=> b!1450672 m!1339535))

(declare-fun m!1339537 () Bool)

(assert (=> b!1450678 m!1339537))

(declare-fun m!1339539 () Bool)

(assert (=> start!125064 m!1339539))

(declare-fun m!1339541 () Bool)

(assert (=> start!125064 m!1339541))

(assert (=> b!1450674 m!1339495))

(assert (=> b!1450674 m!1339495))

(declare-fun m!1339543 () Bool)

(assert (=> b!1450674 m!1339543))

(declare-fun m!1339545 () Bool)

(assert (=> b!1450682 m!1339545))

(assert (=> b!1450667 m!1339495))

(assert (=> b!1450667 m!1339495))

(declare-fun m!1339547 () Bool)

(assert (=> b!1450667 m!1339547))

(check-sat (not b!1450681) (not b!1450682) (not b!1450673) (not b!1450674) (not b!1450669) (not b!1450678) (not start!125064) (not b!1450680) (not b!1450683) (not b!1450667) (not b!1450676) (not b!1450672) (not b!1450679))
(check-sat)
