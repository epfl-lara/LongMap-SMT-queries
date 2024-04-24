; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125622 () Bool)

(assert start!125622)

(declare-fun b!1466533 () Bool)

(declare-fun res!994444 () Bool)

(declare-fun e!824215 () Bool)

(assert (=> b!1466533 (=> (not res!994444) (not e!824215))))

(declare-datatypes ((array!98908 0))(
  ( (array!98909 (arr!47737 (Array (_ BitVec 32) (_ BitVec 64))) (size!48288 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98908)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98908 (_ BitVec 32)) Bool)

(assert (=> b!1466533 (= res!994444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!824218 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641848 () array!98908)

(declare-fun lt!641851 () (_ BitVec 64))

(declare-fun b!1466534 () Bool)

(declare-fun lt!641849 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11886 0))(
  ( (MissingZero!11886 (index!49936 (_ BitVec 32))) (Found!11886 (index!49937 (_ BitVec 32))) (Intermediate!11886 (undefined!12698 Bool) (index!49938 (_ BitVec 32)) (x!131704 (_ BitVec 32))) (Undefined!11886) (MissingVacant!11886 (index!49939 (_ BitVec 32))) )
))
(declare-fun lt!641846 () SeekEntryResult!11886)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98908 (_ BitVec 32)) SeekEntryResult!11886)

(assert (=> b!1466534 (= e!824218 (not (= lt!641846 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641849 lt!641851 lt!641848 mask!2687))))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1466535 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98908 (_ BitVec 32)) SeekEntryResult!11886)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98908 (_ BitVec 32)) SeekEntryResult!11886)

(assert (=> b!1466535 (= e!824218 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641849 intermediateAfterIndex!19 lt!641851 lt!641848 mask!2687) (seekEntryOrOpen!0 lt!641851 lt!641848 mask!2687))))))

(declare-fun res!994447 () Bool)

(assert (=> start!125622 (=> (not res!994447) (not e!824215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125622 (= res!994447 (validMask!0 mask!2687))))

(assert (=> start!125622 e!824215))

(assert (=> start!125622 true))

(declare-fun array_inv!37018 (array!98908) Bool)

(assert (=> start!125622 (array_inv!37018 a!2862)))

(declare-fun b!1466536 () Bool)

(declare-fun e!824216 () Bool)

(assert (=> b!1466536 (= e!824216 true)))

(declare-fun lt!641847 () Bool)

(assert (=> b!1466536 (= lt!641847 e!824218)))

(declare-fun c!135571 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466536 (= c!135571 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466537 () Bool)

(declare-fun e!824214 () Bool)

(assert (=> b!1466537 (= e!824215 e!824214)))

(declare-fun res!994438 () Bool)

(assert (=> b!1466537 (=> (not res!994438) (not e!824214))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466537 (= res!994438 (= (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466537 (= lt!641848 (array!98909 (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48288 a!2862)))))

(declare-fun b!1466538 () Bool)

(declare-fun e!824221 () Bool)

(assert (=> b!1466538 (= e!824214 e!824221)))

(declare-fun res!994442 () Bool)

(assert (=> b!1466538 (=> (not res!994442) (not e!824221))))

(declare-fun lt!641845 () SeekEntryResult!11886)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466538 (= res!994442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47737 a!2862) j!93) mask!2687) (select (arr!47737 a!2862) j!93) a!2862 mask!2687) lt!641845))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466538 (= lt!641845 (Intermediate!11886 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466539 () Bool)

(declare-fun res!994450 () Bool)

(declare-fun e!824223 () Bool)

(assert (=> b!1466539 (=> (not res!994450) (not e!824223))))

(assert (=> b!1466539 (= res!994450 (= (seekEntryOrOpen!0 (select (arr!47737 a!2862) j!93) a!2862 mask!2687) (Found!11886 j!93)))))

(declare-fun b!1466540 () Bool)

(assert (=> b!1466540 (= e!824223 (or (= (select (arr!47737 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47737 a!2862) intermediateBeforeIndex!19) (select (arr!47737 a!2862) j!93))))))

(declare-fun b!1466541 () Bool)

(declare-fun e!824219 () Bool)

(assert (=> b!1466541 (= e!824221 e!824219)))

(declare-fun res!994435 () Bool)

(assert (=> b!1466541 (=> (not res!994435) (not e!824219))))

(assert (=> b!1466541 (= res!994435 (= lt!641846 (Intermediate!11886 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466541 (= lt!641846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641851 mask!2687) lt!641851 lt!641848 mask!2687))))

(assert (=> b!1466541 (= lt!641851 (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466542 () Bool)

(declare-fun res!994441 () Bool)

(assert (=> b!1466542 (=> (not res!994441) (not e!824215))))

(declare-datatypes ((List!34225 0))(
  ( (Nil!34222) (Cons!34221 (h!35585 (_ BitVec 64)) (t!48911 List!34225)) )
))
(declare-fun arrayNoDuplicates!0 (array!98908 (_ BitVec 32) List!34225) Bool)

(assert (=> b!1466542 (= res!994441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34222))))

(declare-fun b!1466543 () Bool)

(declare-fun res!994451 () Bool)

(assert (=> b!1466543 (=> (not res!994451) (not e!824215))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466543 (= res!994451 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48288 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48288 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48288 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466544 () Bool)

(declare-fun e!824220 () Bool)

(assert (=> b!1466544 (= e!824219 (not e!824220))))

(declare-fun res!994445 () Bool)

(assert (=> b!1466544 (=> res!994445 e!824220)))

(assert (=> b!1466544 (= res!994445 (or (and (= (select (arr!47737 a!2862) index!646) (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47737 a!2862) index!646) (select (arr!47737 a!2862) j!93))) (= (select (arr!47737 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466544 e!824223))

(declare-fun res!994434 () Bool)

(assert (=> b!1466544 (=> (not res!994434) (not e!824223))))

(assert (=> b!1466544 (= res!994434 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49301 0))(
  ( (Unit!49302) )
))
(declare-fun lt!641850 () Unit!49301)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49301)

(assert (=> b!1466544 (= lt!641850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466545 () Bool)

(declare-fun e!824222 () Bool)

(assert (=> b!1466545 (= e!824222 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641851 lt!641848 mask!2687) (seekEntryOrOpen!0 lt!641851 lt!641848 mask!2687)))))

(declare-fun b!1466546 () Bool)

(declare-fun res!994436 () Bool)

(assert (=> b!1466546 (=> (not res!994436) (not e!824215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466546 (= res!994436 (validKeyInArray!0 (select (arr!47737 a!2862) i!1006)))))

(declare-fun b!1466547 () Bool)

(declare-fun res!994440 () Bool)

(assert (=> b!1466547 (=> res!994440 e!824216)))

(assert (=> b!1466547 (= res!994440 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641849 (select (arr!47737 a!2862) j!93) a!2862 mask!2687) lt!641845)))))

(declare-fun b!1466548 () Bool)

(assert (=> b!1466548 (= e!824220 e!824216)))

(declare-fun res!994439 () Bool)

(assert (=> b!1466548 (=> res!994439 e!824216)))

(assert (=> b!1466548 (= res!994439 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641849 #b00000000000000000000000000000000) (bvsge lt!641849 (size!48288 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466548 (= lt!641849 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1466549 () Bool)

(declare-fun res!994449 () Bool)

(assert (=> b!1466549 (=> (not res!994449) (not e!824215))))

(assert (=> b!1466549 (= res!994449 (validKeyInArray!0 (select (arr!47737 a!2862) j!93)))))

(declare-fun b!1466550 () Bool)

(declare-fun res!994448 () Bool)

(assert (=> b!1466550 (=> (not res!994448) (not e!824219))))

(assert (=> b!1466550 (= res!994448 e!824222)))

(declare-fun c!135570 () Bool)

(assert (=> b!1466550 (= c!135570 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466551 () Bool)

(declare-fun res!994443 () Bool)

(assert (=> b!1466551 (=> (not res!994443) (not e!824215))))

(assert (=> b!1466551 (= res!994443 (and (= (size!48288 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48288 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48288 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466552 () Bool)

(assert (=> b!1466552 (= e!824222 (= lt!641846 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641851 lt!641848 mask!2687)))))

(declare-fun b!1466553 () Bool)

(declare-fun res!994437 () Bool)

(assert (=> b!1466553 (=> (not res!994437) (not e!824221))))

(assert (=> b!1466553 (= res!994437 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47737 a!2862) j!93) a!2862 mask!2687) lt!641845))))

(declare-fun b!1466554 () Bool)

(declare-fun res!994446 () Bool)

(assert (=> b!1466554 (=> (not res!994446) (not e!824219))))

(assert (=> b!1466554 (= res!994446 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125622 res!994447) b!1466551))

(assert (= (and b!1466551 res!994443) b!1466546))

(assert (= (and b!1466546 res!994436) b!1466549))

(assert (= (and b!1466549 res!994449) b!1466533))

(assert (= (and b!1466533 res!994444) b!1466542))

(assert (= (and b!1466542 res!994441) b!1466543))

(assert (= (and b!1466543 res!994451) b!1466537))

(assert (= (and b!1466537 res!994438) b!1466538))

(assert (= (and b!1466538 res!994442) b!1466553))

(assert (= (and b!1466553 res!994437) b!1466541))

(assert (= (and b!1466541 res!994435) b!1466550))

(assert (= (and b!1466550 c!135570) b!1466552))

(assert (= (and b!1466550 (not c!135570)) b!1466545))

(assert (= (and b!1466550 res!994448) b!1466554))

(assert (= (and b!1466554 res!994446) b!1466544))

(assert (= (and b!1466544 res!994434) b!1466539))

(assert (= (and b!1466539 res!994450) b!1466540))

(assert (= (and b!1466544 (not res!994445)) b!1466548))

(assert (= (and b!1466548 (not res!994439)) b!1466547))

(assert (= (and b!1466547 (not res!994440)) b!1466536))

(assert (= (and b!1466536 c!135571) b!1466534))

(assert (= (and b!1466536 (not c!135571)) b!1466535))

(declare-fun m!1353679 () Bool)

(assert (=> b!1466546 m!1353679))

(assert (=> b!1466546 m!1353679))

(declare-fun m!1353681 () Bool)

(assert (=> b!1466546 m!1353681))

(declare-fun m!1353683 () Bool)

(assert (=> b!1466552 m!1353683))

(declare-fun m!1353685 () Bool)

(assert (=> b!1466541 m!1353685))

(assert (=> b!1466541 m!1353685))

(declare-fun m!1353687 () Bool)

(assert (=> b!1466541 m!1353687))

(declare-fun m!1353689 () Bool)

(assert (=> b!1466541 m!1353689))

(declare-fun m!1353691 () Bool)

(assert (=> b!1466541 m!1353691))

(declare-fun m!1353693 () Bool)

(assert (=> b!1466553 m!1353693))

(assert (=> b!1466553 m!1353693))

(declare-fun m!1353695 () Bool)

(assert (=> b!1466553 m!1353695))

(declare-fun m!1353697 () Bool)

(assert (=> b!1466544 m!1353697))

(assert (=> b!1466544 m!1353689))

(declare-fun m!1353699 () Bool)

(assert (=> b!1466544 m!1353699))

(declare-fun m!1353701 () Bool)

(assert (=> b!1466544 m!1353701))

(declare-fun m!1353703 () Bool)

(assert (=> b!1466544 m!1353703))

(assert (=> b!1466544 m!1353693))

(assert (=> b!1466539 m!1353693))

(assert (=> b!1466539 m!1353693))

(declare-fun m!1353705 () Bool)

(assert (=> b!1466539 m!1353705))

(declare-fun m!1353707 () Bool)

(assert (=> b!1466534 m!1353707))

(declare-fun m!1353709 () Bool)

(assert (=> b!1466545 m!1353709))

(declare-fun m!1353711 () Bool)

(assert (=> b!1466545 m!1353711))

(declare-fun m!1353713 () Bool)

(assert (=> b!1466533 m!1353713))

(declare-fun m!1353715 () Bool)

(assert (=> b!1466535 m!1353715))

(assert (=> b!1466535 m!1353711))

(assert (=> b!1466537 m!1353689))

(declare-fun m!1353717 () Bool)

(assert (=> b!1466537 m!1353717))

(assert (=> b!1466547 m!1353693))

(assert (=> b!1466547 m!1353693))

(declare-fun m!1353719 () Bool)

(assert (=> b!1466547 m!1353719))

(declare-fun m!1353721 () Bool)

(assert (=> start!125622 m!1353721))

(declare-fun m!1353723 () Bool)

(assert (=> start!125622 m!1353723))

(declare-fun m!1353725 () Bool)

(assert (=> b!1466540 m!1353725))

(assert (=> b!1466540 m!1353693))

(assert (=> b!1466538 m!1353693))

(assert (=> b!1466538 m!1353693))

(declare-fun m!1353727 () Bool)

(assert (=> b!1466538 m!1353727))

(assert (=> b!1466538 m!1353727))

(assert (=> b!1466538 m!1353693))

(declare-fun m!1353729 () Bool)

(assert (=> b!1466538 m!1353729))

(declare-fun m!1353731 () Bool)

(assert (=> b!1466542 m!1353731))

(assert (=> b!1466549 m!1353693))

(assert (=> b!1466549 m!1353693))

(declare-fun m!1353733 () Bool)

(assert (=> b!1466549 m!1353733))

(declare-fun m!1353735 () Bool)

(assert (=> b!1466548 m!1353735))

(check-sat (not b!1466549) (not b!1466544) (not b!1466553) (not b!1466533) (not b!1466548) (not b!1466535) (not b!1466547) (not b!1466545) (not b!1466534) (not start!125622) (not b!1466539) (not b!1466546) (not b!1466542) (not b!1466552) (not b!1466538) (not b!1466541))
(check-sat)
