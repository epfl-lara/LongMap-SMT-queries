; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125156 () Bool)

(assert start!125156)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!820500 () Bool)

(declare-datatypes ((array!98604 0))(
  ( (array!98605 (arr!47590 (Array (_ BitVec 32) (_ BitVec 64))) (size!48140 (_ BitVec 32))) )
))
(declare-fun lt!639179 () array!98604)

(declare-fun b!1458792 () Bool)

(declare-datatypes ((SeekEntryResult!11842 0))(
  ( (MissingZero!11842 (index!49760 (_ BitVec 32))) (Found!11842 (index!49761 (_ BitVec 32))) (Intermediate!11842 (undefined!12654 Bool) (index!49762 (_ BitVec 32)) (x!131371 (_ BitVec 32))) (Undefined!11842) (MissingVacant!11842 (index!49763 (_ BitVec 32))) )
))
(declare-fun lt!639185 () SeekEntryResult!11842)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639186 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98604 (_ BitVec 32)) SeekEntryResult!11842)

(assert (=> b!1458792 (= e!820500 (= lt!639185 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639186 lt!639179 mask!2687)))))

(declare-fun b!1458793 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98604 (_ BitVec 32)) SeekEntryResult!11842)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98604 (_ BitVec 32)) SeekEntryResult!11842)

(assert (=> b!1458793 (= e!820500 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639186 lt!639179 mask!2687) (seekEntryOrOpen!0 lt!639186 lt!639179 mask!2687)))))

(declare-fun b!1458794 () Bool)

(declare-fun res!988855 () Bool)

(declare-fun e!820496 () Bool)

(assert (=> b!1458794 (=> (not res!988855) (not e!820496))))

(declare-fun a!2862 () array!98604)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98604 (_ BitVec 32)) Bool)

(assert (=> b!1458794 (= res!988855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!639183 () (_ BitVec 32))

(declare-fun e!820495 () Bool)

(declare-fun b!1458795 () Bool)

(declare-fun lt!639184 () SeekEntryResult!11842)

(assert (=> b!1458795 (= e!820495 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639183 intermediateAfterIndex!19 lt!639186 lt!639179 mask!2687) lt!639184)))))

(declare-fun b!1458796 () Bool)

(declare-fun res!988863 () Bool)

(declare-fun e!820501 () Bool)

(assert (=> b!1458796 (=> (not res!988863) (not e!820501))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458796 (= res!988863 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458797 () Bool)

(declare-fun e!820502 () Bool)

(assert (=> b!1458797 (= e!820496 e!820502)))

(declare-fun res!988852 () Bool)

(assert (=> b!1458797 (=> (not res!988852) (not e!820502))))

(assert (=> b!1458797 (= res!988852 (= (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458797 (= lt!639179 (array!98605 (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48140 a!2862)))))

(declare-fun b!1458798 () Bool)

(declare-fun res!988851 () Bool)

(declare-fun e!820498 () Bool)

(assert (=> b!1458798 (=> res!988851 e!820498)))

(declare-fun lt!639182 () SeekEntryResult!11842)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458798 (= res!988851 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639183 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!639182)))))

(declare-fun b!1458799 () Bool)

(declare-fun res!988859 () Bool)

(assert (=> b!1458799 (=> (not res!988859) (not e!820496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458799 (= res!988859 (validKeyInArray!0 (select (arr!47590 a!2862) j!93)))))

(declare-fun b!1458800 () Bool)

(declare-fun res!988849 () Bool)

(declare-fun e!820494 () Bool)

(assert (=> b!1458800 (=> (not res!988849) (not e!820494))))

(assert (=> b!1458800 (= res!988849 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!639182))))

(declare-fun res!988857 () Bool)

(assert (=> start!125156 (=> (not res!988857) (not e!820496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125156 (= res!988857 (validMask!0 mask!2687))))

(assert (=> start!125156 e!820496))

(assert (=> start!125156 true))

(declare-fun array_inv!36618 (array!98604) Bool)

(assert (=> start!125156 (array_inv!36618 a!2862)))

(declare-fun b!1458801 () Bool)

(declare-fun res!988858 () Bool)

(assert (=> b!1458801 (=> (not res!988858) (not e!820496))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458801 (= res!988858 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48140 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48140 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48140 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458802 () Bool)

(declare-fun res!988848 () Bool)

(assert (=> b!1458802 (=> res!988848 e!820498)))

(assert (=> b!1458802 (= res!988848 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458803 () Bool)

(assert (=> b!1458803 (= e!820494 e!820501)))

(declare-fun res!988861 () Bool)

(assert (=> b!1458803 (=> (not res!988861) (not e!820501))))

(assert (=> b!1458803 (= res!988861 (= lt!639185 (Intermediate!11842 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458803 (= lt!639185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639186 mask!2687) lt!639186 lt!639179 mask!2687))))

(assert (=> b!1458803 (= lt!639186 (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458804 () Bool)

(assert (=> b!1458804 (= e!820502 e!820494)))

(declare-fun res!988850 () Bool)

(assert (=> b!1458804 (=> (not res!988850) (not e!820494))))

(assert (=> b!1458804 (= res!988850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47590 a!2862) j!93) mask!2687) (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!639182))))

(assert (=> b!1458804 (= lt!639182 (Intermediate!11842 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458805 () Bool)

(declare-fun res!988853 () Bool)

(assert (=> b!1458805 (=> (not res!988853) (not e!820496))))

(assert (=> b!1458805 (= res!988853 (validKeyInArray!0 (select (arr!47590 a!2862) i!1006)))))

(declare-fun b!1458806 () Bool)

(assert (=> b!1458806 (= e!820498 true)))

(declare-fun lt!639180 () SeekEntryResult!11842)

(assert (=> b!1458806 (= lt!639180 lt!639184)))

(declare-datatypes ((Unit!49180 0))(
  ( (Unit!49181) )
))
(declare-fun lt!639178 () Unit!49180)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49180)

(assert (=> b!1458806 (= lt!639178 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639183 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458807 () Bool)

(declare-fun res!988860 () Bool)

(assert (=> b!1458807 (=> (not res!988860) (not e!820501))))

(assert (=> b!1458807 (= res!988860 e!820500)))

(declare-fun c!134483 () Bool)

(assert (=> b!1458807 (= c!134483 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458808 () Bool)

(declare-fun res!988847 () Bool)

(assert (=> b!1458808 (=> (not res!988847) (not e!820496))))

(assert (=> b!1458808 (= res!988847 (and (= (size!48140 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48140 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48140 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458809 () Bool)

(assert (=> b!1458809 (= e!820495 (not (= lt!639185 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639183 lt!639186 lt!639179 mask!2687))))))

(declare-fun b!1458810 () Bool)

(declare-fun res!988864 () Bool)

(assert (=> b!1458810 (=> (not res!988864) (not e!820496))))

(declare-datatypes ((List!34091 0))(
  ( (Nil!34088) (Cons!34087 (h!35437 (_ BitVec 64)) (t!48785 List!34091)) )
))
(declare-fun arrayNoDuplicates!0 (array!98604 (_ BitVec 32) List!34091) Bool)

(assert (=> b!1458810 (= res!988864 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34088))))

(declare-fun b!1458811 () Bool)

(declare-fun e!820497 () Bool)

(assert (=> b!1458811 (= e!820501 (not e!820497))))

(declare-fun res!988856 () Bool)

(assert (=> b!1458811 (=> res!988856 e!820497)))

(assert (=> b!1458811 (= res!988856 (or (and (= (select (arr!47590 a!2862) index!646) (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47590 a!2862) index!646) (select (arr!47590 a!2862) j!93))) (= (select (arr!47590 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458811 (and (= lt!639180 (Found!11842 j!93)) (or (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) (select (arr!47590 a!2862) j!93))) (let ((bdg!53453 (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47590 a!2862) index!646) bdg!53453) (= (select (arr!47590 a!2862) index!646) (select (arr!47590 a!2862) j!93))) (= (select (arr!47590 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53453 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458811 (= lt!639180 (seekEntryOrOpen!0 (select (arr!47590 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1458811 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639181 () Unit!49180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49180)

(assert (=> b!1458811 (= lt!639181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458812 () Bool)

(assert (=> b!1458812 (= e!820497 e!820498)))

(declare-fun res!988862 () Bool)

(assert (=> b!1458812 (=> res!988862 e!820498)))

(assert (=> b!1458812 (= res!988862 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639183 #b00000000000000000000000000000000) (bvsge lt!639183 (size!48140 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458812 (= lt!639183 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458812 (= lt!639184 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639186 lt!639179 mask!2687))))

(assert (=> b!1458812 (= lt!639184 (seekEntryOrOpen!0 lt!639186 lt!639179 mask!2687))))

(declare-fun b!1458813 () Bool)

(declare-fun res!988854 () Bool)

(assert (=> b!1458813 (=> res!988854 e!820498)))

(assert (=> b!1458813 (= res!988854 e!820495)))

(declare-fun c!134484 () Bool)

(assert (=> b!1458813 (= c!134484 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125156 res!988857) b!1458808))

(assert (= (and b!1458808 res!988847) b!1458805))

(assert (= (and b!1458805 res!988853) b!1458799))

(assert (= (and b!1458799 res!988859) b!1458794))

(assert (= (and b!1458794 res!988855) b!1458810))

(assert (= (and b!1458810 res!988864) b!1458801))

(assert (= (and b!1458801 res!988858) b!1458797))

(assert (= (and b!1458797 res!988852) b!1458804))

(assert (= (and b!1458804 res!988850) b!1458800))

(assert (= (and b!1458800 res!988849) b!1458803))

(assert (= (and b!1458803 res!988861) b!1458807))

(assert (= (and b!1458807 c!134483) b!1458792))

(assert (= (and b!1458807 (not c!134483)) b!1458793))

(assert (= (and b!1458807 res!988860) b!1458796))

(assert (= (and b!1458796 res!988863) b!1458811))

(assert (= (and b!1458811 (not res!988856)) b!1458812))

(assert (= (and b!1458812 (not res!988862)) b!1458798))

(assert (= (and b!1458798 (not res!988851)) b!1458813))

(assert (= (and b!1458813 c!134484) b!1458809))

(assert (= (and b!1458813 (not c!134484)) b!1458795))

(assert (= (and b!1458813 (not res!988854)) b!1458802))

(assert (= (and b!1458802 (not res!988848)) b!1458806))

(declare-fun m!1346611 () Bool)

(assert (=> b!1458794 m!1346611))

(declare-fun m!1346613 () Bool)

(assert (=> b!1458809 m!1346613))

(declare-fun m!1346615 () Bool)

(assert (=> b!1458792 m!1346615))

(declare-fun m!1346617 () Bool)

(assert (=> b!1458800 m!1346617))

(assert (=> b!1458800 m!1346617))

(declare-fun m!1346619 () Bool)

(assert (=> b!1458800 m!1346619))

(declare-fun m!1346621 () Bool)

(assert (=> b!1458797 m!1346621))

(declare-fun m!1346623 () Bool)

(assert (=> b!1458797 m!1346623))

(assert (=> b!1458799 m!1346617))

(assert (=> b!1458799 m!1346617))

(declare-fun m!1346625 () Bool)

(assert (=> b!1458799 m!1346625))

(declare-fun m!1346627 () Bool)

(assert (=> b!1458812 m!1346627))

(declare-fun m!1346629 () Bool)

(assert (=> b!1458812 m!1346629))

(declare-fun m!1346631 () Bool)

(assert (=> b!1458812 m!1346631))

(assert (=> b!1458804 m!1346617))

(assert (=> b!1458804 m!1346617))

(declare-fun m!1346633 () Bool)

(assert (=> b!1458804 m!1346633))

(assert (=> b!1458804 m!1346633))

(assert (=> b!1458804 m!1346617))

(declare-fun m!1346635 () Bool)

(assert (=> b!1458804 m!1346635))

(assert (=> b!1458793 m!1346629))

(assert (=> b!1458793 m!1346631))

(declare-fun m!1346637 () Bool)

(assert (=> b!1458795 m!1346637))

(assert (=> b!1458798 m!1346617))

(assert (=> b!1458798 m!1346617))

(declare-fun m!1346639 () Bool)

(assert (=> b!1458798 m!1346639))

(declare-fun m!1346641 () Bool)

(assert (=> start!125156 m!1346641))

(declare-fun m!1346643 () Bool)

(assert (=> start!125156 m!1346643))

(declare-fun m!1346645 () Bool)

(assert (=> b!1458811 m!1346645))

(assert (=> b!1458811 m!1346621))

(declare-fun m!1346647 () Bool)

(assert (=> b!1458811 m!1346647))

(declare-fun m!1346649 () Bool)

(assert (=> b!1458811 m!1346649))

(declare-fun m!1346651 () Bool)

(assert (=> b!1458811 m!1346651))

(assert (=> b!1458811 m!1346617))

(declare-fun m!1346653 () Bool)

(assert (=> b!1458811 m!1346653))

(declare-fun m!1346655 () Bool)

(assert (=> b!1458811 m!1346655))

(assert (=> b!1458811 m!1346617))

(declare-fun m!1346657 () Bool)

(assert (=> b!1458806 m!1346657))

(declare-fun m!1346659 () Bool)

(assert (=> b!1458810 m!1346659))

(declare-fun m!1346661 () Bool)

(assert (=> b!1458803 m!1346661))

(assert (=> b!1458803 m!1346661))

(declare-fun m!1346663 () Bool)

(assert (=> b!1458803 m!1346663))

(assert (=> b!1458803 m!1346621))

(declare-fun m!1346665 () Bool)

(assert (=> b!1458803 m!1346665))

(declare-fun m!1346667 () Bool)

(assert (=> b!1458805 m!1346667))

(assert (=> b!1458805 m!1346667))

(declare-fun m!1346669 () Bool)

(assert (=> b!1458805 m!1346669))

(push 1)

(assert (not b!1458810))

(assert (not b!1458805))

(assert (not b!1458792))

(assert (not b!1458800))

(assert (not b!1458812))

(assert (not b!1458799))

(assert (not b!1458804))

(assert (not b!1458811))

(assert (not b!1458793))

(assert (not b!1458795))

(assert (not b!1458794))

(assert (not b!1458803))

(assert (not b!1458806))

(assert (not b!1458798))

(assert (not b!1458809))

(assert (not start!125156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

