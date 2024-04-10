; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125154 () Bool)

(assert start!125154)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11841 0))(
  ( (MissingZero!11841 (index!49756 (_ BitVec 32))) (Found!11841 (index!49757 (_ BitVec 32))) (Intermediate!11841 (undefined!12653 Bool) (index!49758 (_ BitVec 32)) (x!131370 (_ BitVec 32))) (Undefined!11841) (MissingVacant!11841 (index!49759 (_ BitVec 32))) )
))
(declare-fun lt!639156 () SeekEntryResult!11841)

(declare-fun e!820469 () Bool)

(declare-fun lt!639154 () (_ BitVec 32))

(declare-datatypes ((array!98602 0))(
  ( (array!98603 (arr!47589 (Array (_ BitVec 32) (_ BitVec 64))) (size!48139 (_ BitVec 32))) )
))
(declare-fun lt!639151 () array!98602)

(declare-fun b!1458726 () Bool)

(declare-fun lt!639155 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11841)

(assert (=> b!1458726 (= e!820469 (not (= lt!639156 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639154 lt!639155 lt!639151 mask!2687))))))

(declare-fun b!1458727 () Bool)

(declare-fun e!820467 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11841)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11841)

(assert (=> b!1458727 (= e!820467 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639155 lt!639151 mask!2687) (seekEntryOrOpen!0 lt!639155 lt!639151 mask!2687)))))

(declare-fun b!1458728 () Bool)

(assert (=> b!1458728 (= e!820467 (= lt!639156 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639155 lt!639151 mask!2687)))))

(declare-fun b!1458729 () Bool)

(declare-fun res!988809 () Bool)

(declare-fun e!820475 () Bool)

(assert (=> b!1458729 (=> (not res!988809) (not e!820475))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98602)

(assert (=> b!1458729 (= res!988809 (and (= (size!48139 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48139 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48139 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458730 () Bool)

(declare-fun e!820472 () Bool)

(declare-fun e!820471 () Bool)

(assert (=> b!1458730 (= e!820472 e!820471)))

(declare-fun res!988799 () Bool)

(assert (=> b!1458730 (=> (not res!988799) (not e!820471))))

(declare-fun lt!639152 () SeekEntryResult!11841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458730 (= res!988799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47589 a!2862) j!93) mask!2687) (select (arr!47589 a!2862) j!93) a!2862 mask!2687) lt!639152))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458730 (= lt!639152 (Intermediate!11841 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458732 () Bool)

(declare-fun res!988804 () Bool)

(assert (=> b!1458732 (=> (not res!988804) (not e!820475))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458732 (= res!988804 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48139 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48139 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48139 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458733 () Bool)

(declare-fun e!820474 () Bool)

(declare-fun e!820468 () Bool)

(assert (=> b!1458733 (= e!820474 e!820468)))

(declare-fun res!988797 () Bool)

(assert (=> b!1458733 (=> res!988797 e!820468)))

(assert (=> b!1458733 (= res!988797 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639154 #b00000000000000000000000000000000) (bvsge lt!639154 (size!48139 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458733 (= lt!639154 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639153 () SeekEntryResult!11841)

(assert (=> b!1458733 (= lt!639153 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639155 lt!639151 mask!2687))))

(assert (=> b!1458733 (= lt!639153 (seekEntryOrOpen!0 lt!639155 lt!639151 mask!2687))))

(declare-fun b!1458734 () Bool)

(declare-fun e!820470 () Bool)

(assert (=> b!1458734 (= e!820470 (not e!820474))))

(declare-fun res!988795 () Bool)

(assert (=> b!1458734 (=> res!988795 e!820474)))

(assert (=> b!1458734 (= res!988795 (or (and (= (select (arr!47589 a!2862) index!646) (select (store (arr!47589 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47589 a!2862) index!646) (select (arr!47589 a!2862) j!93))) (= (select (arr!47589 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639159 () SeekEntryResult!11841)

(assert (=> b!1458734 (and (= lt!639159 (Found!11841 j!93)) (or (= (select (arr!47589 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47589 a!2862) intermediateBeforeIndex!19) (select (arr!47589 a!2862) j!93))) (let ((bdg!53451 (select (store (arr!47589 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47589 a!2862) index!646) bdg!53451) (= (select (arr!47589 a!2862) index!646) (select (arr!47589 a!2862) j!93))) (= (select (arr!47589 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53451 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458734 (= lt!639159 (seekEntryOrOpen!0 (select (arr!47589 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98602 (_ BitVec 32)) Bool)

(assert (=> b!1458734 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49178 0))(
  ( (Unit!49179) )
))
(declare-fun lt!639157 () Unit!49178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49178)

(assert (=> b!1458734 (= lt!639157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458735 () Bool)

(declare-fun res!988808 () Bool)

(assert (=> b!1458735 (=> res!988808 e!820468)))

(assert (=> b!1458735 (= res!988808 e!820469)))

(declare-fun c!134477 () Bool)

(assert (=> b!1458735 (= c!134477 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458736 () Bool)

(declare-fun res!988803 () Bool)

(assert (=> b!1458736 (=> res!988803 e!820468)))

(assert (=> b!1458736 (= res!988803 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639154 (select (arr!47589 a!2862) j!93) a!2862 mask!2687) lt!639152)))))

(declare-fun b!1458737 () Bool)

(declare-fun res!988796 () Bool)

(assert (=> b!1458737 (=> (not res!988796) (not e!820475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458737 (= res!988796 (validKeyInArray!0 (select (arr!47589 a!2862) i!1006)))))

(declare-fun b!1458738 () Bool)

(assert (=> b!1458738 (= e!820469 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639154 intermediateAfterIndex!19 lt!639155 lt!639151 mask!2687) lt!639153)))))

(declare-fun b!1458739 () Bool)

(assert (=> b!1458739 (= e!820468 true)))

(assert (=> b!1458739 (= lt!639159 lt!639153)))

(declare-fun lt!639158 () Unit!49178)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49178)

(assert (=> b!1458739 (= lt!639158 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639154 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458740 () Bool)

(declare-fun res!988807 () Bool)

(assert (=> b!1458740 (=> (not res!988807) (not e!820475))))

(assert (=> b!1458740 (= res!988807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458741 () Bool)

(assert (=> b!1458741 (= e!820471 e!820470)))

(declare-fun res!988794 () Bool)

(assert (=> b!1458741 (=> (not res!988794) (not e!820470))))

(assert (=> b!1458741 (= res!988794 (= lt!639156 (Intermediate!11841 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458741 (= lt!639156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639155 mask!2687) lt!639155 lt!639151 mask!2687))))

(assert (=> b!1458741 (= lt!639155 (select (store (arr!47589 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458742 () Bool)

(declare-fun res!988802 () Bool)

(assert (=> b!1458742 (=> (not res!988802) (not e!820470))))

(assert (=> b!1458742 (= res!988802 e!820467)))

(declare-fun c!134478 () Bool)

(assert (=> b!1458742 (= c!134478 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458743 () Bool)

(assert (=> b!1458743 (= e!820475 e!820472)))

(declare-fun res!988798 () Bool)

(assert (=> b!1458743 (=> (not res!988798) (not e!820472))))

(assert (=> b!1458743 (= res!988798 (= (select (store (arr!47589 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458743 (= lt!639151 (array!98603 (store (arr!47589 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48139 a!2862)))))

(declare-fun res!988810 () Bool)

(assert (=> start!125154 (=> (not res!988810) (not e!820475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125154 (= res!988810 (validMask!0 mask!2687))))

(assert (=> start!125154 e!820475))

(assert (=> start!125154 true))

(declare-fun array_inv!36617 (array!98602) Bool)

(assert (=> start!125154 (array_inv!36617 a!2862)))

(declare-fun b!1458731 () Bool)

(declare-fun res!988806 () Bool)

(assert (=> b!1458731 (=> res!988806 e!820468)))

(assert (=> b!1458731 (= res!988806 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458744 () Bool)

(declare-fun res!988793 () Bool)

(assert (=> b!1458744 (=> (not res!988793) (not e!820471))))

(assert (=> b!1458744 (= res!988793 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47589 a!2862) j!93) a!2862 mask!2687) lt!639152))))

(declare-fun b!1458745 () Bool)

(declare-fun res!988800 () Bool)

(assert (=> b!1458745 (=> (not res!988800) (not e!820475))))

(assert (=> b!1458745 (= res!988800 (validKeyInArray!0 (select (arr!47589 a!2862) j!93)))))

(declare-fun b!1458746 () Bool)

(declare-fun res!988801 () Bool)

(assert (=> b!1458746 (=> (not res!988801) (not e!820470))))

(assert (=> b!1458746 (= res!988801 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458747 () Bool)

(declare-fun res!988805 () Bool)

(assert (=> b!1458747 (=> (not res!988805) (not e!820475))))

(declare-datatypes ((List!34090 0))(
  ( (Nil!34087) (Cons!34086 (h!35436 (_ BitVec 64)) (t!48784 List!34090)) )
))
(declare-fun arrayNoDuplicates!0 (array!98602 (_ BitVec 32) List!34090) Bool)

(assert (=> b!1458747 (= res!988805 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34087))))

(assert (= (and start!125154 res!988810) b!1458729))

(assert (= (and b!1458729 res!988809) b!1458737))

(assert (= (and b!1458737 res!988796) b!1458745))

(assert (= (and b!1458745 res!988800) b!1458740))

(assert (= (and b!1458740 res!988807) b!1458747))

(assert (= (and b!1458747 res!988805) b!1458732))

(assert (= (and b!1458732 res!988804) b!1458743))

(assert (= (and b!1458743 res!988798) b!1458730))

(assert (= (and b!1458730 res!988799) b!1458744))

(assert (= (and b!1458744 res!988793) b!1458741))

(assert (= (and b!1458741 res!988794) b!1458742))

(assert (= (and b!1458742 c!134478) b!1458728))

(assert (= (and b!1458742 (not c!134478)) b!1458727))

(assert (= (and b!1458742 res!988802) b!1458746))

(assert (= (and b!1458746 res!988801) b!1458734))

(assert (= (and b!1458734 (not res!988795)) b!1458733))

(assert (= (and b!1458733 (not res!988797)) b!1458736))

(assert (= (and b!1458736 (not res!988803)) b!1458735))

(assert (= (and b!1458735 c!134477) b!1458726))

(assert (= (and b!1458735 (not c!134477)) b!1458738))

(assert (= (and b!1458735 (not res!988808)) b!1458731))

(assert (= (and b!1458731 (not res!988806)) b!1458739))

(declare-fun m!1346551 () Bool)

(assert (=> b!1458743 m!1346551))

(declare-fun m!1346553 () Bool)

(assert (=> b!1458743 m!1346553))

(declare-fun m!1346555 () Bool)

(assert (=> b!1458738 m!1346555))

(declare-fun m!1346557 () Bool)

(assert (=> b!1458740 m!1346557))

(declare-fun m!1346559 () Bool)

(assert (=> b!1458741 m!1346559))

(assert (=> b!1458741 m!1346559))

(declare-fun m!1346561 () Bool)

(assert (=> b!1458741 m!1346561))

(assert (=> b!1458741 m!1346551))

(declare-fun m!1346563 () Bool)

(assert (=> b!1458741 m!1346563))

(declare-fun m!1346565 () Bool)

(assert (=> b!1458727 m!1346565))

(declare-fun m!1346567 () Bool)

(assert (=> b!1458727 m!1346567))

(declare-fun m!1346569 () Bool)

(assert (=> b!1458736 m!1346569))

(assert (=> b!1458736 m!1346569))

(declare-fun m!1346571 () Bool)

(assert (=> b!1458736 m!1346571))

(declare-fun m!1346573 () Bool)

(assert (=> b!1458734 m!1346573))

(assert (=> b!1458734 m!1346551))

(declare-fun m!1346575 () Bool)

(assert (=> b!1458734 m!1346575))

(declare-fun m!1346577 () Bool)

(assert (=> b!1458734 m!1346577))

(declare-fun m!1346579 () Bool)

(assert (=> b!1458734 m!1346579))

(assert (=> b!1458734 m!1346569))

(declare-fun m!1346581 () Bool)

(assert (=> b!1458734 m!1346581))

(declare-fun m!1346583 () Bool)

(assert (=> b!1458734 m!1346583))

(assert (=> b!1458734 m!1346569))

(declare-fun m!1346585 () Bool)

(assert (=> b!1458747 m!1346585))

(declare-fun m!1346587 () Bool)

(assert (=> b!1458728 m!1346587))

(declare-fun m!1346589 () Bool)

(assert (=> b!1458737 m!1346589))

(assert (=> b!1458737 m!1346589))

(declare-fun m!1346591 () Bool)

(assert (=> b!1458737 m!1346591))

(declare-fun m!1346593 () Bool)

(assert (=> b!1458739 m!1346593))

(assert (=> b!1458745 m!1346569))

(assert (=> b!1458745 m!1346569))

(declare-fun m!1346595 () Bool)

(assert (=> b!1458745 m!1346595))

(declare-fun m!1346597 () Bool)

(assert (=> start!125154 m!1346597))

(declare-fun m!1346599 () Bool)

(assert (=> start!125154 m!1346599))

(declare-fun m!1346601 () Bool)

(assert (=> b!1458726 m!1346601))

(assert (=> b!1458744 m!1346569))

(assert (=> b!1458744 m!1346569))

(declare-fun m!1346603 () Bool)

(assert (=> b!1458744 m!1346603))

(declare-fun m!1346605 () Bool)

(assert (=> b!1458733 m!1346605))

(assert (=> b!1458733 m!1346565))

(assert (=> b!1458733 m!1346567))

(assert (=> b!1458730 m!1346569))

(assert (=> b!1458730 m!1346569))

(declare-fun m!1346607 () Bool)

(assert (=> b!1458730 m!1346607))

(assert (=> b!1458730 m!1346607))

(assert (=> b!1458730 m!1346569))

(declare-fun m!1346609 () Bool)

(assert (=> b!1458730 m!1346609))

(check-sat (not b!1458739) (not start!125154) (not b!1458736) (not b!1458726) (not b!1458747) (not b!1458727) (not b!1458745) (not b!1458733) (not b!1458728) (not b!1458740) (not b!1458744) (not b!1458737) (not b!1458738) (not b!1458730) (not b!1458734) (not b!1458741))
