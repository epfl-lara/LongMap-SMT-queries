; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126848 () Bool)

(assert start!126848)

(declare-fun b!1489596 () Bool)

(declare-fun res!1013026 () Bool)

(declare-fun e!834830 () Bool)

(assert (=> b!1489596 (=> (not res!1013026) (not e!834830))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99621 0))(
  ( (array!99622 (arr!48082 (Array (_ BitVec 32) (_ BitVec 64))) (size!48632 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99621)

(assert (=> b!1489596 (= res!1013026 (and (= (size!48632 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48632 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48632 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489597 () Bool)

(declare-fun res!1013020 () Bool)

(declare-fun e!834828 () Bool)

(assert (=> b!1489597 (=> res!1013020 e!834828)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489597 (= res!1013020 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489598 () Bool)

(declare-fun e!834834 () Bool)

(declare-fun e!834836 () Bool)

(assert (=> b!1489598 (= e!834834 (not e!834836))))

(declare-fun res!1013027 () Bool)

(assert (=> b!1489598 (=> res!1013027 e!834836)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1489598 (= res!1013027 (or (and (= (select (arr!48082 a!2862) index!646) (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48082 a!2862) index!646) (select (arr!48082 a!2862) j!93))) (= (select (arr!48082 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12322 0))(
  ( (MissingZero!12322 (index!51680 (_ BitVec 32))) (Found!12322 (index!51681 (_ BitVec 32))) (Intermediate!12322 (undefined!13134 Bool) (index!51682 (_ BitVec 32)) (x!133274 (_ BitVec 32))) (Undefined!12322) (MissingVacant!12322 (index!51683 (_ BitVec 32))) )
))
(declare-fun lt!649620 () SeekEntryResult!12322)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489598 (and (= lt!649620 (Found!12322 j!93)) (or (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) (select (arr!48082 a!2862) j!93))) (let ((bdg!54726 (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48082 a!2862) index!646) bdg!54726) (= (select (arr!48082 a!2862) index!646) (select (arr!48082 a!2862) j!93))) (= (select (arr!48082 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54726 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99621 (_ BitVec 32)) SeekEntryResult!12322)

(assert (=> b!1489598 (= lt!649620 (seekEntryOrOpen!0 (select (arr!48082 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99621 (_ BitVec 32)) Bool)

(assert (=> b!1489598 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49984 0))(
  ( (Unit!49985) )
))
(declare-fun lt!649616 () Unit!49984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49984)

(assert (=> b!1489598 (= lt!649616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!649621 () array!99621)

(declare-fun e!834835 () Bool)

(declare-fun lt!649615 () (_ BitVec 64))

(declare-fun lt!649622 () SeekEntryResult!12322)

(declare-fun lt!649619 () (_ BitVec 32))

(declare-fun b!1489600 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99621 (_ BitVec 32)) SeekEntryResult!12322)

(assert (=> b!1489600 (= e!834835 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649619 intermediateAfterIndex!19 lt!649615 lt!649621 mask!2687) lt!649622)))))

(declare-fun lt!649623 () SeekEntryResult!12322)

(declare-fun b!1489601 () Bool)

(declare-fun e!834832 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99621 (_ BitVec 32)) SeekEntryResult!12322)

(assert (=> b!1489601 (= e!834832 (= lt!649623 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649615 lt!649621 mask!2687)))))

(declare-fun b!1489602 () Bool)

(assert (=> b!1489602 (= e!834828 true)))

(assert (=> b!1489602 (= lt!649620 lt!649622)))

(declare-fun lt!649617 () Unit!49984)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49984)

(assert (=> b!1489602 (= lt!649617 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649619 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489603 () Bool)

(declare-fun e!834829 () Bool)

(assert (=> b!1489603 (= e!834830 e!834829)))

(declare-fun res!1013022 () Bool)

(assert (=> b!1489603 (=> (not res!1013022) (not e!834829))))

(assert (=> b!1489603 (= res!1013022 (= (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489603 (= lt!649621 (array!99622 (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48632 a!2862)))))

(declare-fun b!1489604 () Bool)

(declare-fun res!1013024 () Bool)

(assert (=> b!1489604 (=> res!1013024 e!834828)))

(declare-fun lt!649618 () SeekEntryResult!12322)

(assert (=> b!1489604 (= res!1013024 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649619 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!649618)))))

(declare-fun b!1489605 () Bool)

(assert (=> b!1489605 (= e!834835 (not (= lt!649623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649619 lt!649615 lt!649621 mask!2687))))))

(declare-fun b!1489606 () Bool)

(declare-fun res!1013023 () Bool)

(assert (=> b!1489606 (=> res!1013023 e!834828)))

(assert (=> b!1489606 (= res!1013023 e!834835)))

(declare-fun c!137820 () Bool)

(assert (=> b!1489606 (= c!137820 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489607 () Bool)

(declare-fun e!834833 () Bool)

(assert (=> b!1489607 (= e!834833 e!834834)))

(declare-fun res!1013017 () Bool)

(assert (=> b!1489607 (=> (not res!1013017) (not e!834834))))

(assert (=> b!1489607 (= res!1013017 (= lt!649623 (Intermediate!12322 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489607 (= lt!649623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649615 mask!2687) lt!649615 lt!649621 mask!2687))))

(assert (=> b!1489607 (= lt!649615 (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489608 () Bool)

(assert (=> b!1489608 (= e!834829 e!834833)))

(declare-fun res!1013012 () Bool)

(assert (=> b!1489608 (=> (not res!1013012) (not e!834833))))

(assert (=> b!1489608 (= res!1013012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48082 a!2862) j!93) mask!2687) (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!649618))))

(assert (=> b!1489608 (= lt!649618 (Intermediate!12322 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489609 () Bool)

(assert (=> b!1489609 (= e!834836 e!834828)))

(declare-fun res!1013025 () Bool)

(assert (=> b!1489609 (=> res!1013025 e!834828)))

(assert (=> b!1489609 (= res!1013025 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649619 #b00000000000000000000000000000000) (bvsge lt!649619 (size!48632 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489609 (= lt!649619 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489609 (= lt!649622 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649615 lt!649621 mask!2687))))

(assert (=> b!1489609 (= lt!649622 (seekEntryOrOpen!0 lt!649615 lt!649621 mask!2687))))

(declare-fun b!1489610 () Bool)

(declare-fun res!1013014 () Bool)

(assert (=> b!1489610 (=> (not res!1013014) (not e!834830))))

(assert (=> b!1489610 (= res!1013014 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48632 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48632 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48632 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1013021 () Bool)

(assert (=> start!126848 (=> (not res!1013021) (not e!834830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126848 (= res!1013021 (validMask!0 mask!2687))))

(assert (=> start!126848 e!834830))

(assert (=> start!126848 true))

(declare-fun array_inv!37110 (array!99621) Bool)

(assert (=> start!126848 (array_inv!37110 a!2862)))

(declare-fun b!1489599 () Bool)

(declare-fun res!1013029 () Bool)

(assert (=> b!1489599 (=> (not res!1013029) (not e!834834))))

(assert (=> b!1489599 (= res!1013029 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489611 () Bool)

(declare-fun res!1013028 () Bool)

(assert (=> b!1489611 (=> (not res!1013028) (not e!834834))))

(assert (=> b!1489611 (= res!1013028 e!834832)))

(declare-fun c!137819 () Bool)

(assert (=> b!1489611 (= c!137819 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489612 () Bool)

(declare-fun res!1013016 () Bool)

(assert (=> b!1489612 (=> (not res!1013016) (not e!834830))))

(declare-datatypes ((List!34583 0))(
  ( (Nil!34580) (Cons!34579 (h!35962 (_ BitVec 64)) (t!49277 List!34583)) )
))
(declare-fun arrayNoDuplicates!0 (array!99621 (_ BitVec 32) List!34583) Bool)

(assert (=> b!1489612 (= res!1013016 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34580))))

(declare-fun b!1489613 () Bool)

(declare-fun res!1013015 () Bool)

(assert (=> b!1489613 (=> (not res!1013015) (not e!834830))))

(assert (=> b!1489613 (= res!1013015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489614 () Bool)

(declare-fun res!1013018 () Bool)

(assert (=> b!1489614 (=> (not res!1013018) (not e!834830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489614 (= res!1013018 (validKeyInArray!0 (select (arr!48082 a!2862) i!1006)))))

(declare-fun b!1489615 () Bool)

(declare-fun res!1013013 () Bool)

(assert (=> b!1489615 (=> (not res!1013013) (not e!834833))))

(assert (=> b!1489615 (= res!1013013 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!649618))))

(declare-fun b!1489616 () Bool)

(declare-fun res!1013019 () Bool)

(assert (=> b!1489616 (=> (not res!1013019) (not e!834830))))

(assert (=> b!1489616 (= res!1013019 (validKeyInArray!0 (select (arr!48082 a!2862) j!93)))))

(declare-fun b!1489617 () Bool)

(assert (=> b!1489617 (= e!834832 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649615 lt!649621 mask!2687) (seekEntryOrOpen!0 lt!649615 lt!649621 mask!2687)))))

(assert (= (and start!126848 res!1013021) b!1489596))

(assert (= (and b!1489596 res!1013026) b!1489614))

(assert (= (and b!1489614 res!1013018) b!1489616))

(assert (= (and b!1489616 res!1013019) b!1489613))

(assert (= (and b!1489613 res!1013015) b!1489612))

(assert (= (and b!1489612 res!1013016) b!1489610))

(assert (= (and b!1489610 res!1013014) b!1489603))

(assert (= (and b!1489603 res!1013022) b!1489608))

(assert (= (and b!1489608 res!1013012) b!1489615))

(assert (= (and b!1489615 res!1013013) b!1489607))

(assert (= (and b!1489607 res!1013017) b!1489611))

(assert (= (and b!1489611 c!137819) b!1489601))

(assert (= (and b!1489611 (not c!137819)) b!1489617))

(assert (= (and b!1489611 res!1013028) b!1489599))

(assert (= (and b!1489599 res!1013029) b!1489598))

(assert (= (and b!1489598 (not res!1013027)) b!1489609))

(assert (= (and b!1489609 (not res!1013025)) b!1489604))

(assert (= (and b!1489604 (not res!1013024)) b!1489606))

(assert (= (and b!1489606 c!137820) b!1489605))

(assert (= (and b!1489606 (not c!137820)) b!1489600))

(assert (= (and b!1489606 (not res!1013023)) b!1489597))

(assert (= (and b!1489597 (not res!1013020)) b!1489602))

(declare-fun m!1373815 () Bool)

(assert (=> b!1489608 m!1373815))

(assert (=> b!1489608 m!1373815))

(declare-fun m!1373817 () Bool)

(assert (=> b!1489608 m!1373817))

(assert (=> b!1489608 m!1373817))

(assert (=> b!1489608 m!1373815))

(declare-fun m!1373819 () Bool)

(assert (=> b!1489608 m!1373819))

(assert (=> b!1489615 m!1373815))

(assert (=> b!1489615 m!1373815))

(declare-fun m!1373821 () Bool)

(assert (=> b!1489615 m!1373821))

(declare-fun m!1373823 () Bool)

(assert (=> b!1489609 m!1373823))

(declare-fun m!1373825 () Bool)

(assert (=> b!1489609 m!1373825))

(declare-fun m!1373827 () Bool)

(assert (=> b!1489609 m!1373827))

(declare-fun m!1373829 () Bool)

(assert (=> b!1489602 m!1373829))

(declare-fun m!1373831 () Bool)

(assert (=> b!1489601 m!1373831))

(declare-fun m!1373833 () Bool)

(assert (=> start!126848 m!1373833))

(declare-fun m!1373835 () Bool)

(assert (=> start!126848 m!1373835))

(declare-fun m!1373837 () Bool)

(assert (=> b!1489612 m!1373837))

(declare-fun m!1373839 () Bool)

(assert (=> b!1489603 m!1373839))

(declare-fun m!1373841 () Bool)

(assert (=> b!1489603 m!1373841))

(declare-fun m!1373843 () Bool)

(assert (=> b!1489600 m!1373843))

(assert (=> b!1489616 m!1373815))

(assert (=> b!1489616 m!1373815))

(declare-fun m!1373845 () Bool)

(assert (=> b!1489616 m!1373845))

(assert (=> b!1489604 m!1373815))

(assert (=> b!1489604 m!1373815))

(declare-fun m!1373847 () Bool)

(assert (=> b!1489604 m!1373847))

(assert (=> b!1489617 m!1373825))

(assert (=> b!1489617 m!1373827))

(declare-fun m!1373849 () Bool)

(assert (=> b!1489598 m!1373849))

(assert (=> b!1489598 m!1373839))

(declare-fun m!1373851 () Bool)

(assert (=> b!1489598 m!1373851))

(declare-fun m!1373853 () Bool)

(assert (=> b!1489598 m!1373853))

(declare-fun m!1373855 () Bool)

(assert (=> b!1489598 m!1373855))

(assert (=> b!1489598 m!1373815))

(declare-fun m!1373857 () Bool)

(assert (=> b!1489598 m!1373857))

(declare-fun m!1373859 () Bool)

(assert (=> b!1489598 m!1373859))

(assert (=> b!1489598 m!1373815))

(declare-fun m!1373861 () Bool)

(assert (=> b!1489607 m!1373861))

(assert (=> b!1489607 m!1373861))

(declare-fun m!1373863 () Bool)

(assert (=> b!1489607 m!1373863))

(assert (=> b!1489607 m!1373839))

(declare-fun m!1373865 () Bool)

(assert (=> b!1489607 m!1373865))

(declare-fun m!1373867 () Bool)

(assert (=> b!1489614 m!1373867))

(assert (=> b!1489614 m!1373867))

(declare-fun m!1373869 () Bool)

(assert (=> b!1489614 m!1373869))

(declare-fun m!1373871 () Bool)

(assert (=> b!1489613 m!1373871))

(declare-fun m!1373873 () Bool)

(assert (=> b!1489605 m!1373873))

(push 1)

