; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124632 () Bool)

(assert start!124632)

(declare-fun b!1443527 () Bool)

(declare-fun res!975632 () Bool)

(declare-fun e!813443 () Bool)

(assert (=> b!1443527 (=> (not res!975632) (not e!813443))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98080 0))(
  ( (array!98081 (arr!47328 (Array (_ BitVec 32) (_ BitVec 64))) (size!47878 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98080)

(assert (=> b!1443527 (= res!975632 (and (= (size!47878 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47878 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47878 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1443528 () Bool)

(declare-fun lt!633890 () array!98080)

(declare-fun lt!633894 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11580 0))(
  ( (MissingZero!11580 (index!48712 (_ BitVec 32))) (Found!11580 (index!48713 (_ BitVec 32))) (Intermediate!11580 (undefined!12392 Bool) (index!48714 (_ BitVec 32)) (x!130413 (_ BitVec 32))) (Undefined!11580) (MissingVacant!11580 (index!48715 (_ BitVec 32))) )
))
(declare-fun lt!633891 () SeekEntryResult!11580)

(declare-fun e!813440 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11580)

(assert (=> b!1443528 (= e!813440 (= lt!633891 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633894 lt!633890 mask!2687)))))

(declare-fun b!1443529 () Bool)

(declare-fun res!975626 () Bool)

(declare-fun e!813438 () Bool)

(assert (=> b!1443529 (=> res!975626 e!813438)))

(declare-fun lt!633889 () SeekEntryResult!11580)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11580)

(assert (=> b!1443529 (= res!975626 (not (= lt!633889 (seekEntryOrOpen!0 lt!633894 lt!633890 mask!2687))))))

(declare-fun b!1443530 () Bool)

(declare-fun res!975634 () Bool)

(assert (=> b!1443530 (=> (not res!975634) (not e!813443))))

(declare-datatypes ((List!33829 0))(
  ( (Nil!33826) (Cons!33825 (h!35175 (_ BitVec 64)) (t!48523 List!33829)) )
))
(declare-fun arrayNoDuplicates!0 (array!98080 (_ BitVec 32) List!33829) Bool)

(assert (=> b!1443530 (= res!975634 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33826))))

(declare-fun b!1443531 () Bool)

(declare-fun res!975620 () Bool)

(declare-fun e!813437 () Bool)

(assert (=> b!1443531 (=> (not res!975620) (not e!813437))))

(declare-fun lt!633893 () SeekEntryResult!11580)

(assert (=> b!1443531 (= res!975620 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47328 a!2862) j!93) a!2862 mask!2687) lt!633893))))

(declare-fun b!1443532 () Bool)

(declare-fun res!975622 () Bool)

(assert (=> b!1443532 (=> (not res!975622) (not e!813443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443532 (= res!975622 (validKeyInArray!0 (select (arr!47328 a!2862) j!93)))))

(declare-fun b!1443533 () Bool)

(declare-fun res!975625 () Bool)

(assert (=> b!1443533 (=> (not res!975625) (not e!813443))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443533 (= res!975625 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47878 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47878 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47878 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443534 () Bool)

(declare-fun res!975621 () Bool)

(assert (=> b!1443534 (=> (not res!975621) (not e!813443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98080 (_ BitVec 32)) Bool)

(assert (=> b!1443534 (= res!975621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443535 () Bool)

(declare-fun e!813441 () Bool)

(assert (=> b!1443535 (= e!813443 e!813441)))

(declare-fun res!975629 () Bool)

(assert (=> b!1443535 (=> (not res!975629) (not e!813441))))

(assert (=> b!1443535 (= res!975629 (= (select (store (arr!47328 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443535 (= lt!633890 (array!98081 (store (arr!47328 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47878 a!2862)))))

(declare-fun b!1443536 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11580)

(assert (=> b!1443536 (= e!813440 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633894 lt!633890 mask!2687) (seekEntryOrOpen!0 lt!633894 lt!633890 mask!2687)))))

(declare-fun b!1443538 () Bool)

(assert (=> b!1443538 (= e!813438 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1443539 () Bool)

(assert (=> b!1443539 (= e!813441 e!813437)))

(declare-fun res!975633 () Bool)

(assert (=> b!1443539 (=> (not res!975633) (not e!813437))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443539 (= res!975633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47328 a!2862) j!93) mask!2687) (select (arr!47328 a!2862) j!93) a!2862 mask!2687) lt!633893))))

(assert (=> b!1443539 (= lt!633893 (Intermediate!11580 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443540 () Bool)

(declare-fun e!813442 () Bool)

(assert (=> b!1443540 (= e!813437 e!813442)))

(declare-fun res!975623 () Bool)

(assert (=> b!1443540 (=> (not res!975623) (not e!813442))))

(assert (=> b!1443540 (= res!975623 (= lt!633891 (Intermediate!11580 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443540 (= lt!633891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633894 mask!2687) lt!633894 lt!633890 mask!2687))))

(assert (=> b!1443540 (= lt!633894 (select (store (arr!47328 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443541 () Bool)

(declare-fun res!975631 () Bool)

(assert (=> b!1443541 (=> (not res!975631) (not e!813442))))

(assert (=> b!1443541 (= res!975631 e!813440)))

(declare-fun c!133464 () Bool)

(assert (=> b!1443541 (= c!133464 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443542 () Bool)

(declare-fun res!975630 () Bool)

(assert (=> b!1443542 (=> (not res!975630) (not e!813443))))

(assert (=> b!1443542 (= res!975630 (validKeyInArray!0 (select (arr!47328 a!2862) i!1006)))))

(declare-fun b!1443543 () Bool)

(declare-fun res!975624 () Bool)

(assert (=> b!1443543 (=> (not res!975624) (not e!813442))))

(assert (=> b!1443543 (= res!975624 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!975627 () Bool)

(assert (=> start!124632 (=> (not res!975627) (not e!813443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124632 (= res!975627 (validMask!0 mask!2687))))

(assert (=> start!124632 e!813443))

(assert (=> start!124632 true))

(declare-fun array_inv!36356 (array!98080) Bool)

(assert (=> start!124632 (array_inv!36356 a!2862)))

(declare-fun b!1443537 () Bool)

(assert (=> b!1443537 (= e!813442 (not e!813438))))

(declare-fun res!975628 () Bool)

(assert (=> b!1443537 (=> res!975628 e!813438)))

(assert (=> b!1443537 (= res!975628 (or (not (= (select (arr!47328 a!2862) index!646) (select (store (arr!47328 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47328 a!2862) index!646) (select (arr!47328 a!2862) j!93)))))))

(assert (=> b!1443537 (and (= lt!633889 (Found!11580 j!93)) (or (= (select (arr!47328 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47328 a!2862) intermediateBeforeIndex!19) (select (arr!47328 a!2862) j!93))))))

(assert (=> b!1443537 (= lt!633889 (seekEntryOrOpen!0 (select (arr!47328 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1443537 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48656 0))(
  ( (Unit!48657) )
))
(declare-fun lt!633892 () Unit!48656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48656)

(assert (=> b!1443537 (= lt!633892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124632 res!975627) b!1443527))

(assert (= (and b!1443527 res!975632) b!1443542))

(assert (= (and b!1443542 res!975630) b!1443532))

(assert (= (and b!1443532 res!975622) b!1443534))

(assert (= (and b!1443534 res!975621) b!1443530))

(assert (= (and b!1443530 res!975634) b!1443533))

(assert (= (and b!1443533 res!975625) b!1443535))

(assert (= (and b!1443535 res!975629) b!1443539))

(assert (= (and b!1443539 res!975633) b!1443531))

(assert (= (and b!1443531 res!975620) b!1443540))

(assert (= (and b!1443540 res!975623) b!1443541))

(assert (= (and b!1443541 c!133464) b!1443528))

(assert (= (and b!1443541 (not c!133464)) b!1443536))

(assert (= (and b!1443541 res!975631) b!1443543))

(assert (= (and b!1443543 res!975624) b!1443537))

(assert (= (and b!1443537 (not res!975628)) b!1443529))

(assert (= (and b!1443529 (not res!975626)) b!1443538))

(declare-fun m!1332603 () Bool)

(assert (=> b!1443528 m!1332603))

(declare-fun m!1332605 () Bool)

(assert (=> b!1443540 m!1332605))

(assert (=> b!1443540 m!1332605))

(declare-fun m!1332607 () Bool)

(assert (=> b!1443540 m!1332607))

(declare-fun m!1332609 () Bool)

(assert (=> b!1443540 m!1332609))

(declare-fun m!1332611 () Bool)

(assert (=> b!1443540 m!1332611))

(declare-fun m!1332613 () Bool)

(assert (=> b!1443531 m!1332613))

(assert (=> b!1443531 m!1332613))

(declare-fun m!1332615 () Bool)

(assert (=> b!1443531 m!1332615))

(assert (=> b!1443539 m!1332613))

(assert (=> b!1443539 m!1332613))

(declare-fun m!1332617 () Bool)

(assert (=> b!1443539 m!1332617))

(assert (=> b!1443539 m!1332617))

(assert (=> b!1443539 m!1332613))

(declare-fun m!1332619 () Bool)

(assert (=> b!1443539 m!1332619))

(declare-fun m!1332621 () Bool)

(assert (=> b!1443534 m!1332621))

(declare-fun m!1332623 () Bool)

(assert (=> b!1443530 m!1332623))

(declare-fun m!1332625 () Bool)

(assert (=> b!1443542 m!1332625))

(assert (=> b!1443542 m!1332625))

(declare-fun m!1332627 () Bool)

(assert (=> b!1443542 m!1332627))

(declare-fun m!1332629 () Bool)

(assert (=> b!1443536 m!1332629))

(declare-fun m!1332631 () Bool)

(assert (=> b!1443536 m!1332631))

(assert (=> b!1443532 m!1332613))

(assert (=> b!1443532 m!1332613))

(declare-fun m!1332633 () Bool)

(assert (=> b!1443532 m!1332633))

(declare-fun m!1332635 () Bool)

(assert (=> start!124632 m!1332635))

(declare-fun m!1332637 () Bool)

(assert (=> start!124632 m!1332637))

(assert (=> b!1443529 m!1332631))

(declare-fun m!1332639 () Bool)

(assert (=> b!1443537 m!1332639))

(assert (=> b!1443537 m!1332609))

(declare-fun m!1332641 () Bool)

(assert (=> b!1443537 m!1332641))

(declare-fun m!1332643 () Bool)

(assert (=> b!1443537 m!1332643))

(declare-fun m!1332645 () Bool)

(assert (=> b!1443537 m!1332645))

(assert (=> b!1443537 m!1332613))

(declare-fun m!1332647 () Bool)

(assert (=> b!1443537 m!1332647))

(declare-fun m!1332649 () Bool)

(assert (=> b!1443537 m!1332649))

(assert (=> b!1443537 m!1332613))

(assert (=> b!1443535 m!1332609))

(declare-fun m!1332651 () Bool)

(assert (=> b!1443535 m!1332651))

(check-sat (not b!1443542) (not b!1443528) (not b!1443537) (not b!1443530) (not b!1443532) (not start!124632) (not b!1443540) (not b!1443536) (not b!1443534) (not b!1443539) (not b!1443529) (not b!1443531))
(check-sat)
