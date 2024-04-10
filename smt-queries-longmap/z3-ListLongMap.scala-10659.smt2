; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125094 () Bool)

(assert start!125094)

(declare-fun b!1456746 () Bool)

(declare-fun res!987178 () Bool)

(declare-fun e!819576 () Bool)

(assert (=> b!1456746 (=> (not res!987178) (not e!819576))))

(declare-fun e!819577 () Bool)

(assert (=> b!1456746 (= res!987178 e!819577)))

(declare-fun c!134297 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456746 (= c!134297 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456747 () Bool)

(declare-fun res!987187 () Bool)

(declare-fun e!819575 () Bool)

(assert (=> b!1456747 (=> (not res!987187) (not e!819575))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98542 0))(
  ( (array!98543 (arr!47559 (Array (_ BitVec 32) (_ BitVec 64))) (size!48109 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98542)

(assert (=> b!1456747 (= res!987187 (and (= (size!48109 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48109 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48109 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456748 () Bool)

(declare-fun e!819580 () Bool)

(assert (=> b!1456748 (= e!819576 (not e!819580))))

(declare-fun res!987183 () Bool)

(assert (=> b!1456748 (=> res!987183 e!819580)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1456748 (= res!987183 (or (and (= (select (arr!47559 a!2862) index!646) (select (store (arr!47559 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47559 a!2862) index!646) (select (arr!47559 a!2862) j!93))) (= (select (arr!47559 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819578 () Bool)

(assert (=> b!1456748 e!819578))

(declare-fun res!987189 () Bool)

(assert (=> b!1456748 (=> (not res!987189) (not e!819578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98542 (_ BitVec 32)) Bool)

(assert (=> b!1456748 (= res!987189 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49118 0))(
  ( (Unit!49119) )
))
(declare-fun lt!638426 () Unit!49118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49118)

(assert (=> b!1456748 (= lt!638426 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456749 () Bool)

(declare-fun res!987182 () Bool)

(declare-fun e!819572 () Bool)

(assert (=> b!1456749 (=> res!987182 e!819572)))

(declare-datatypes ((SeekEntryResult!11811 0))(
  ( (MissingZero!11811 (index!49636 (_ BitVec 32))) (Found!11811 (index!49637 (_ BitVec 32))) (Intermediate!11811 (undefined!12623 Bool) (index!49638 (_ BitVec 32)) (x!131260 (_ BitVec 32))) (Undefined!11811) (MissingVacant!11811 (index!49639 (_ BitVec 32))) )
))
(declare-fun lt!638427 () SeekEntryResult!11811)

(declare-fun lt!638433 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11811)

(assert (=> b!1456749 (= res!987182 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638433 (select (arr!47559 a!2862) j!93) a!2862 mask!2687) lt!638427)))))

(declare-fun b!1456750 () Bool)

(declare-fun e!819581 () Bool)

(assert (=> b!1456750 (= e!819575 e!819581)))

(declare-fun res!987179 () Bool)

(assert (=> b!1456750 (=> (not res!987179) (not e!819581))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1456750 (= res!987179 (= (select (store (arr!47559 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638428 () array!98542)

(assert (=> b!1456750 (= lt!638428 (array!98543 (store (arr!47559 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48109 a!2862)))))

(declare-fun b!1456751 () Bool)

(declare-fun lt!638432 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11811)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98542 (_ BitVec 32)) SeekEntryResult!11811)

(assert (=> b!1456751 (= e!819577 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638432 lt!638428 mask!2687) (seekEntryOrOpen!0 lt!638432 lt!638428 mask!2687)))))

(declare-fun b!1456752 () Bool)

(assert (=> b!1456752 (= e!819572 true)))

(declare-fun lt!638430 () Bool)

(declare-fun e!819573 () Bool)

(assert (=> b!1456752 (= lt!638430 e!819573)))

(declare-fun c!134298 () Bool)

(assert (=> b!1456752 (= c!134298 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1456753 () Bool)

(assert (=> b!1456753 (= e!819578 (and (or (= (select (arr!47559 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47559 a!2862) intermediateBeforeIndex!19) (select (arr!47559 a!2862) j!93))) (let ((bdg!53272 (select (store (arr!47559 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47559 a!2862) index!646) bdg!53272) (= (select (arr!47559 a!2862) index!646) (select (arr!47559 a!2862) j!93))) (= (select (arr!47559 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53272 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456754 () Bool)

(declare-fun res!987180 () Bool)

(assert (=> b!1456754 (=> (not res!987180) (not e!819575))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456754 (= res!987180 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48109 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48109 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48109 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456755 () Bool)

(declare-fun res!987173 () Bool)

(assert (=> b!1456755 (=> (not res!987173) (not e!819576))))

(assert (=> b!1456755 (= res!987173 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456756 () Bool)

(declare-fun res!987177 () Bool)

(assert (=> b!1456756 (=> (not res!987177) (not e!819575))))

(assert (=> b!1456756 (= res!987177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456757 () Bool)

(declare-fun res!987174 () Bool)

(assert (=> b!1456757 (=> (not res!987174) (not e!819578))))

(assert (=> b!1456757 (= res!987174 (= (seekEntryOrOpen!0 (select (arr!47559 a!2862) j!93) a!2862 mask!2687) (Found!11811 j!93)))))

(declare-fun b!1456759 () Bool)

(declare-fun res!987176 () Bool)

(assert (=> b!1456759 (=> (not res!987176) (not e!819575))))

(declare-datatypes ((List!34060 0))(
  ( (Nil!34057) (Cons!34056 (h!35406 (_ BitVec 64)) (t!48754 List!34060)) )
))
(declare-fun arrayNoDuplicates!0 (array!98542 (_ BitVec 32) List!34060) Bool)

(assert (=> b!1456759 (= res!987176 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34057))))

(declare-fun b!1456760 () Bool)

(declare-fun e!819579 () Bool)

(assert (=> b!1456760 (= e!819579 e!819576)))

(declare-fun res!987190 () Bool)

(assert (=> b!1456760 (=> (not res!987190) (not e!819576))))

(declare-fun lt!638431 () SeekEntryResult!11811)

(assert (=> b!1456760 (= res!987190 (= lt!638431 (Intermediate!11811 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456760 (= lt!638431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638432 mask!2687) lt!638432 lt!638428 mask!2687))))

(assert (=> b!1456760 (= lt!638432 (select (store (arr!47559 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456761 () Bool)

(assert (=> b!1456761 (= e!819577 (= lt!638431 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638432 lt!638428 mask!2687)))))

(declare-fun b!1456762 () Bool)

(assert (=> b!1456762 (= e!819580 e!819572)))

(declare-fun res!987181 () Bool)

(assert (=> b!1456762 (=> res!987181 e!819572)))

(assert (=> b!1456762 (= res!987181 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638433 #b00000000000000000000000000000000) (bvsge lt!638433 (size!48109 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456762 (= lt!638433 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638429 () SeekEntryResult!11811)

(assert (=> b!1456762 (= lt!638429 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638432 lt!638428 mask!2687))))

(assert (=> b!1456762 (= lt!638429 (seekEntryOrOpen!0 lt!638432 lt!638428 mask!2687))))

(declare-fun b!1456763 () Bool)

(declare-fun res!987186 () Bool)

(assert (=> b!1456763 (=> (not res!987186) (not e!819575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456763 (= res!987186 (validKeyInArray!0 (select (arr!47559 a!2862) i!1006)))))

(declare-fun b!1456764 () Bool)

(assert (=> b!1456764 (= e!819573 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638433 intermediateAfterIndex!19 lt!638432 lt!638428 mask!2687) lt!638429)))))

(declare-fun res!987188 () Bool)

(assert (=> start!125094 (=> (not res!987188) (not e!819575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125094 (= res!987188 (validMask!0 mask!2687))))

(assert (=> start!125094 e!819575))

(assert (=> start!125094 true))

(declare-fun array_inv!36587 (array!98542) Bool)

(assert (=> start!125094 (array_inv!36587 a!2862)))

(declare-fun b!1456758 () Bool)

(assert (=> b!1456758 (= e!819573 (not (= lt!638431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638433 lt!638432 lt!638428 mask!2687))))))

(declare-fun b!1456765 () Bool)

(declare-fun res!987184 () Bool)

(assert (=> b!1456765 (=> (not res!987184) (not e!819579))))

(assert (=> b!1456765 (= res!987184 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47559 a!2862) j!93) a!2862 mask!2687) lt!638427))))

(declare-fun b!1456766 () Bool)

(assert (=> b!1456766 (= e!819581 e!819579)))

(declare-fun res!987185 () Bool)

(assert (=> b!1456766 (=> (not res!987185) (not e!819579))))

(assert (=> b!1456766 (= res!987185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47559 a!2862) j!93) mask!2687) (select (arr!47559 a!2862) j!93) a!2862 mask!2687) lt!638427))))

(assert (=> b!1456766 (= lt!638427 (Intermediate!11811 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456767 () Bool)

(declare-fun res!987175 () Bool)

(assert (=> b!1456767 (=> (not res!987175) (not e!819575))))

(assert (=> b!1456767 (= res!987175 (validKeyInArray!0 (select (arr!47559 a!2862) j!93)))))

(assert (= (and start!125094 res!987188) b!1456747))

(assert (= (and b!1456747 res!987187) b!1456763))

(assert (= (and b!1456763 res!987186) b!1456767))

(assert (= (and b!1456767 res!987175) b!1456756))

(assert (= (and b!1456756 res!987177) b!1456759))

(assert (= (and b!1456759 res!987176) b!1456754))

(assert (= (and b!1456754 res!987180) b!1456750))

(assert (= (and b!1456750 res!987179) b!1456766))

(assert (= (and b!1456766 res!987185) b!1456765))

(assert (= (and b!1456765 res!987184) b!1456760))

(assert (= (and b!1456760 res!987190) b!1456746))

(assert (= (and b!1456746 c!134297) b!1456761))

(assert (= (and b!1456746 (not c!134297)) b!1456751))

(assert (= (and b!1456746 res!987178) b!1456755))

(assert (= (and b!1456755 res!987173) b!1456748))

(assert (= (and b!1456748 res!987189) b!1456757))

(assert (= (and b!1456757 res!987174) b!1456753))

(assert (= (and b!1456748 (not res!987183)) b!1456762))

(assert (= (and b!1456762 (not res!987181)) b!1456749))

(assert (= (and b!1456749 (not res!987182)) b!1456752))

(assert (= (and b!1456752 c!134298) b!1456758))

(assert (= (and b!1456752 (not c!134298)) b!1456764))

(declare-fun m!1344809 () Bool)

(assert (=> b!1456751 m!1344809))

(declare-fun m!1344811 () Bool)

(assert (=> b!1456751 m!1344811))

(declare-fun m!1344813 () Bool)

(assert (=> b!1456759 m!1344813))

(declare-fun m!1344815 () Bool)

(assert (=> b!1456757 m!1344815))

(assert (=> b!1456757 m!1344815))

(declare-fun m!1344817 () Bool)

(assert (=> b!1456757 m!1344817))

(assert (=> b!1456767 m!1344815))

(assert (=> b!1456767 m!1344815))

(declare-fun m!1344819 () Bool)

(assert (=> b!1456767 m!1344819))

(declare-fun m!1344821 () Bool)

(assert (=> b!1456764 m!1344821))

(declare-fun m!1344823 () Bool)

(assert (=> b!1456748 m!1344823))

(declare-fun m!1344825 () Bool)

(assert (=> b!1456748 m!1344825))

(declare-fun m!1344827 () Bool)

(assert (=> b!1456748 m!1344827))

(declare-fun m!1344829 () Bool)

(assert (=> b!1456748 m!1344829))

(declare-fun m!1344831 () Bool)

(assert (=> b!1456748 m!1344831))

(assert (=> b!1456748 m!1344815))

(declare-fun m!1344833 () Bool)

(assert (=> b!1456758 m!1344833))

(declare-fun m!1344835 () Bool)

(assert (=> b!1456760 m!1344835))

(assert (=> b!1456760 m!1344835))

(declare-fun m!1344837 () Bool)

(assert (=> b!1456760 m!1344837))

(assert (=> b!1456760 m!1344825))

(declare-fun m!1344839 () Bool)

(assert (=> b!1456760 m!1344839))

(assert (=> b!1456766 m!1344815))

(assert (=> b!1456766 m!1344815))

(declare-fun m!1344841 () Bool)

(assert (=> b!1456766 m!1344841))

(assert (=> b!1456766 m!1344841))

(assert (=> b!1456766 m!1344815))

(declare-fun m!1344843 () Bool)

(assert (=> b!1456766 m!1344843))

(declare-fun m!1344845 () Bool)

(assert (=> b!1456763 m!1344845))

(assert (=> b!1456763 m!1344845))

(declare-fun m!1344847 () Bool)

(assert (=> b!1456763 m!1344847))

(declare-fun m!1344849 () Bool)

(assert (=> b!1456756 m!1344849))

(assert (=> b!1456765 m!1344815))

(assert (=> b!1456765 m!1344815))

(declare-fun m!1344851 () Bool)

(assert (=> b!1456765 m!1344851))

(assert (=> b!1456750 m!1344825))

(declare-fun m!1344853 () Bool)

(assert (=> b!1456750 m!1344853))

(declare-fun m!1344855 () Bool)

(assert (=> b!1456761 m!1344855))

(assert (=> b!1456749 m!1344815))

(assert (=> b!1456749 m!1344815))

(declare-fun m!1344857 () Bool)

(assert (=> b!1456749 m!1344857))

(assert (=> b!1456753 m!1344825))

(declare-fun m!1344859 () Bool)

(assert (=> b!1456753 m!1344859))

(assert (=> b!1456753 m!1344827))

(assert (=> b!1456753 m!1344829))

(assert (=> b!1456753 m!1344815))

(declare-fun m!1344861 () Bool)

(assert (=> b!1456762 m!1344861))

(assert (=> b!1456762 m!1344809))

(assert (=> b!1456762 m!1344811))

(declare-fun m!1344863 () Bool)

(assert (=> start!125094 m!1344863))

(declare-fun m!1344865 () Bool)

(assert (=> start!125094 m!1344865))

(check-sat (not b!1456762) (not b!1456756) (not b!1456765) (not b!1456759) (not b!1456761) (not b!1456757) (not start!125094) (not b!1456763) (not b!1456751) (not b!1456766) (not b!1456748) (not b!1456767) (not b!1456764) (not b!1456760) (not b!1456749) (not b!1456758))
(check-sat)
