; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126912 () Bool)

(assert start!126912)

(declare-fun res!1014606 () Bool)

(declare-fun e!835626 () Bool)

(assert (=> start!126912 (=> (not res!1014606) (not e!835626))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126912 (= res!1014606 (validMask!0 mask!2687))))

(assert (=> start!126912 e!835626))

(assert (=> start!126912 true))

(declare-datatypes ((array!99685 0))(
  ( (array!99686 (arr!48114 (Array (_ BitVec 32) (_ BitVec 64))) (size!48664 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99685)

(declare-fun array_inv!37142 (array!99685) Bool)

(assert (=> start!126912 (array_inv!37142 a!2862)))

(declare-fun b!1491436 () Bool)

(declare-fun res!1014609 () Bool)

(declare-fun e!835624 () Bool)

(assert (=> b!1491436 (=> (not res!1014609) (not e!835624))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12354 0))(
  ( (MissingZero!12354 (index!51808 (_ BitVec 32))) (Found!12354 (index!51809 (_ BitVec 32))) (Intermediate!12354 (undefined!13166 Bool) (index!51810 (_ BitVec 32)) (x!133394 (_ BitVec 32))) (Undefined!12354) (MissingVacant!12354 (index!51811 (_ BitVec 32))) )
))
(declare-fun lt!650277 () SeekEntryResult!12354)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12354)

(assert (=> b!1491436 (= res!1014609 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48114 a!2862) j!93) a!2862 mask!2687) lt!650277))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1491437 () Bool)

(declare-fun e!835630 () Bool)

(assert (=> b!1491437 (= e!835630 (or (= (select (arr!48114 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48114 a!2862) intermediateBeforeIndex!19) (select (arr!48114 a!2862) j!93))))))

(declare-fun b!1491438 () Bool)

(declare-fun e!835627 () Bool)

(assert (=> b!1491438 (= e!835626 e!835627)))

(declare-fun res!1014619 () Bool)

(assert (=> b!1491438 (=> (not res!1014619) (not e!835627))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491438 (= res!1014619 (= (select (store (arr!48114 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650279 () array!99685)

(assert (=> b!1491438 (= lt!650279 (array!99686 (store (arr!48114 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48664 a!2862)))))

(declare-fun b!1491439 () Bool)

(declare-fun res!1014612 () Bool)

(assert (=> b!1491439 (=> (not res!1014612) (not e!835626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491439 (= res!1014612 (validKeyInArray!0 (select (arr!48114 a!2862) j!93)))))

(declare-fun b!1491440 () Bool)

(declare-fun res!1014615 () Bool)

(assert (=> b!1491440 (=> (not res!1014615) (not e!835626))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491440 (= res!1014615 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48664 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48664 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48664 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491441 () Bool)

(declare-fun res!1014607 () Bool)

(assert (=> b!1491441 (=> (not res!1014607) (not e!835626))))

(declare-datatypes ((List!34615 0))(
  ( (Nil!34612) (Cons!34611 (h!35994 (_ BitVec 64)) (t!49309 List!34615)) )
))
(declare-fun arrayNoDuplicates!0 (array!99685 (_ BitVec 32) List!34615) Bool)

(assert (=> b!1491441 (= res!1014607 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34612))))

(declare-fun b!1491442 () Bool)

(declare-fun e!835625 () Bool)

(declare-fun e!835628 () Bool)

(assert (=> b!1491442 (= e!835625 (not e!835628))))

(declare-fun res!1014617 () Bool)

(assert (=> b!1491442 (=> res!1014617 e!835628)))

(assert (=> b!1491442 (= res!1014617 (or (and (= (select (arr!48114 a!2862) index!646) (select (store (arr!48114 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48114 a!2862) index!646) (select (arr!48114 a!2862) j!93))) (= (select (arr!48114 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491442 e!835630))

(declare-fun res!1014614 () Bool)

(assert (=> b!1491442 (=> (not res!1014614) (not e!835630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99685 (_ BitVec 32)) Bool)

(assert (=> b!1491442 (= res!1014614 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50048 0))(
  ( (Unit!50049) )
))
(declare-fun lt!650280 () Unit!50048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50048)

(assert (=> b!1491442 (= lt!650280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491443 () Bool)

(declare-fun res!1014610 () Bool)

(assert (=> b!1491443 (=> (not res!1014610) (not e!835626))))

(assert (=> b!1491443 (= res!1014610 (validKeyInArray!0 (select (arr!48114 a!2862) i!1006)))))

(declare-fun b!1491444 () Bool)

(declare-fun lt!650275 () (_ BitVec 64))

(declare-fun e!835629 () Bool)

(declare-fun lt!650278 () SeekEntryResult!12354)

(assert (=> b!1491444 (= e!835629 (= lt!650278 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650275 lt!650279 mask!2687)))))

(declare-fun b!1491445 () Bool)

(assert (=> b!1491445 (= e!835628 true)))

(declare-fun lt!650276 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491445 (= lt!650276 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491446 () Bool)

(declare-fun res!1014611 () Bool)

(assert (=> b!1491446 (=> (not res!1014611) (not e!835630))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12354)

(assert (=> b!1491446 (= res!1014611 (= (seekEntryOrOpen!0 (select (arr!48114 a!2862) j!93) a!2862 mask!2687) (Found!12354 j!93)))))

(declare-fun b!1491447 () Bool)

(assert (=> b!1491447 (= e!835627 e!835624)))

(declare-fun res!1014605 () Bool)

(assert (=> b!1491447 (=> (not res!1014605) (not e!835624))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491447 (= res!1014605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48114 a!2862) j!93) mask!2687) (select (arr!48114 a!2862) j!93) a!2862 mask!2687) lt!650277))))

(assert (=> b!1491447 (= lt!650277 (Intermediate!12354 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491448 () Bool)

(declare-fun res!1014618 () Bool)

(assert (=> b!1491448 (=> (not res!1014618) (not e!835625))))

(assert (=> b!1491448 (= res!1014618 e!835629)))

(declare-fun c!137943 () Bool)

(assert (=> b!1491448 (= c!137943 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491449 () Bool)

(declare-fun res!1014616 () Bool)

(assert (=> b!1491449 (=> (not res!1014616) (not e!835626))))

(assert (=> b!1491449 (= res!1014616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491450 () Bool)

(assert (=> b!1491450 (= e!835624 e!835625)))

(declare-fun res!1014604 () Bool)

(assert (=> b!1491450 (=> (not res!1014604) (not e!835625))))

(assert (=> b!1491450 (= res!1014604 (= lt!650278 (Intermediate!12354 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491450 (= lt!650278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650275 mask!2687) lt!650275 lt!650279 mask!2687))))

(assert (=> b!1491450 (= lt!650275 (select (store (arr!48114 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491451 () Bool)

(declare-fun res!1014613 () Bool)

(assert (=> b!1491451 (=> (not res!1014613) (not e!835625))))

(assert (=> b!1491451 (= res!1014613 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12354)

(assert (=> b!1491452 (= e!835629 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650275 lt!650279 mask!2687) (seekEntryOrOpen!0 lt!650275 lt!650279 mask!2687)))))

(declare-fun b!1491453 () Bool)

(declare-fun res!1014608 () Bool)

(assert (=> b!1491453 (=> (not res!1014608) (not e!835626))))

(assert (=> b!1491453 (= res!1014608 (and (= (size!48664 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48664 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48664 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126912 res!1014606) b!1491453))

(assert (= (and b!1491453 res!1014608) b!1491443))

(assert (= (and b!1491443 res!1014610) b!1491439))

(assert (= (and b!1491439 res!1014612) b!1491449))

(assert (= (and b!1491449 res!1014616) b!1491441))

(assert (= (and b!1491441 res!1014607) b!1491440))

(assert (= (and b!1491440 res!1014615) b!1491438))

(assert (= (and b!1491438 res!1014619) b!1491447))

(assert (= (and b!1491447 res!1014605) b!1491436))

(assert (= (and b!1491436 res!1014609) b!1491450))

(assert (= (and b!1491450 res!1014604) b!1491448))

(assert (= (and b!1491448 c!137943) b!1491444))

(assert (= (and b!1491448 (not c!137943)) b!1491452))

(assert (= (and b!1491448 res!1014618) b!1491451))

(assert (= (and b!1491451 res!1014613) b!1491442))

(assert (= (and b!1491442 res!1014614) b!1491446))

(assert (= (and b!1491446 res!1014611) b!1491437))

(assert (= (and b!1491442 (not res!1014617)) b!1491445))

(declare-fun m!1375559 () Bool)

(assert (=> b!1491446 m!1375559))

(assert (=> b!1491446 m!1375559))

(declare-fun m!1375561 () Bool)

(assert (=> b!1491446 m!1375561))

(declare-fun m!1375563 () Bool)

(assert (=> b!1491449 m!1375563))

(assert (=> b!1491447 m!1375559))

(assert (=> b!1491447 m!1375559))

(declare-fun m!1375565 () Bool)

(assert (=> b!1491447 m!1375565))

(assert (=> b!1491447 m!1375565))

(assert (=> b!1491447 m!1375559))

(declare-fun m!1375567 () Bool)

(assert (=> b!1491447 m!1375567))

(declare-fun m!1375569 () Bool)

(assert (=> b!1491445 m!1375569))

(assert (=> b!1491439 m!1375559))

(assert (=> b!1491439 m!1375559))

(declare-fun m!1375571 () Bool)

(assert (=> b!1491439 m!1375571))

(assert (=> b!1491436 m!1375559))

(assert (=> b!1491436 m!1375559))

(declare-fun m!1375573 () Bool)

(assert (=> b!1491436 m!1375573))

(declare-fun m!1375575 () Bool)

(assert (=> b!1491437 m!1375575))

(assert (=> b!1491437 m!1375559))

(declare-fun m!1375577 () Bool)

(assert (=> b!1491450 m!1375577))

(assert (=> b!1491450 m!1375577))

(declare-fun m!1375579 () Bool)

(assert (=> b!1491450 m!1375579))

(declare-fun m!1375581 () Bool)

(assert (=> b!1491450 m!1375581))

(declare-fun m!1375583 () Bool)

(assert (=> b!1491450 m!1375583))

(declare-fun m!1375585 () Bool)

(assert (=> start!126912 m!1375585))

(declare-fun m!1375587 () Bool)

(assert (=> start!126912 m!1375587))

(declare-fun m!1375589 () Bool)

(assert (=> b!1491443 m!1375589))

(assert (=> b!1491443 m!1375589))

(declare-fun m!1375591 () Bool)

(assert (=> b!1491443 m!1375591))

(declare-fun m!1375593 () Bool)

(assert (=> b!1491442 m!1375593))

(assert (=> b!1491442 m!1375581))

(declare-fun m!1375595 () Bool)

(assert (=> b!1491442 m!1375595))

(declare-fun m!1375597 () Bool)

(assert (=> b!1491442 m!1375597))

(declare-fun m!1375599 () Bool)

(assert (=> b!1491442 m!1375599))

(assert (=> b!1491442 m!1375559))

(declare-fun m!1375601 () Bool)

(assert (=> b!1491452 m!1375601))

(declare-fun m!1375603 () Bool)

(assert (=> b!1491452 m!1375603))

(assert (=> b!1491438 m!1375581))

(declare-fun m!1375605 () Bool)

(assert (=> b!1491438 m!1375605))

(declare-fun m!1375607 () Bool)

(assert (=> b!1491441 m!1375607))

(declare-fun m!1375609 () Bool)

(assert (=> b!1491444 m!1375609))

(check-sat (not b!1491436) (not b!1491445) (not b!1491439) (not b!1491449) (not b!1491444) (not b!1491450) (not b!1491447) (not b!1491442) (not start!126912) (not b!1491452) (not b!1491443) (not b!1491446) (not b!1491441))
(check-sat)
