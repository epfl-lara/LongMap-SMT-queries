; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125592 () Bool)

(assert start!125592)

(declare-fun b!1465543 () Bool)

(declare-fun e!823767 () Bool)

(assert (=> b!1465543 (= e!823767 true)))

(declare-fun lt!641535 () Bool)

(declare-fun e!823764 () Bool)

(assert (=> b!1465543 (= lt!641535 e!823764)))

(declare-fun c!135481 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465543 (= c!135481 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465544 () Bool)

(declare-fun e!823768 () Bool)

(declare-fun e!823771 () Bool)

(assert (=> b!1465544 (= e!823768 (not e!823771))))

(declare-fun res!993633 () Bool)

(assert (=> b!1465544 (=> res!993633 e!823771)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98878 0))(
  ( (array!98879 (arr!47722 (Array (_ BitVec 32) (_ BitVec 64))) (size!48273 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98878)

(assert (=> b!1465544 (= res!993633 (or (and (= (select (arr!47722 a!2862) index!646) (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47722 a!2862) index!646) (select (arr!47722 a!2862) j!93))) (= (select (arr!47722 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823772 () Bool)

(assert (=> b!1465544 e!823772))

(declare-fun res!993640 () Bool)

(assert (=> b!1465544 (=> (not res!993640) (not e!823772))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98878 (_ BitVec 32)) Bool)

(assert (=> b!1465544 (= res!993640 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49271 0))(
  ( (Unit!49272) )
))
(declare-fun lt!641536 () Unit!49271)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49271)

(assert (=> b!1465544 (= lt!641536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465545 () Bool)

(declare-fun res!993634 () Bool)

(declare-fun e!823766 () Bool)

(assert (=> b!1465545 (=> (not res!993634) (not e!823766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465545 (= res!993634 (validKeyInArray!0 (select (arr!47722 a!2862) j!93)))))

(declare-fun b!1465546 () Bool)

(declare-fun res!993639 () Bool)

(assert (=> b!1465546 (=> (not res!993639) (not e!823768))))

(declare-fun e!823769 () Bool)

(assert (=> b!1465546 (= res!993639 e!823769)))

(declare-fun c!135480 () Bool)

(assert (=> b!1465546 (= c!135480 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465547 () Bool)

(declare-fun res!993632 () Bool)

(assert (=> b!1465547 (=> (not res!993632) (not e!823768))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465547 (= res!993632 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1465549 () Bool)

(assert (=> b!1465549 (= e!823772 (or (= (select (arr!47722 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47722 a!2862) intermediateBeforeIndex!19) (select (arr!47722 a!2862) j!93))))))

(declare-fun b!1465550 () Bool)

(assert (=> b!1465550 (= e!823771 e!823767)))

(declare-fun res!993624 () Bool)

(assert (=> b!1465550 (=> res!993624 e!823767)))

(declare-fun lt!641532 () (_ BitVec 32))

(assert (=> b!1465550 (= res!993624 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641532 #b00000000000000000000000000000000) (bvsge lt!641532 (size!48273 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465550 (= lt!641532 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1465551 () Bool)

(declare-fun res!993635 () Bool)

(assert (=> b!1465551 (=> (not res!993635) (not e!823766))))

(assert (=> b!1465551 (= res!993635 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48273 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48273 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48273 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465552 () Bool)

(declare-fun res!993637 () Bool)

(assert (=> b!1465552 (=> (not res!993637) (not e!823766))))

(assert (=> b!1465552 (= res!993637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465553 () Bool)

(declare-fun res!993625 () Bool)

(assert (=> b!1465553 (=> (not res!993625) (not e!823766))))

(assert (=> b!1465553 (= res!993625 (validKeyInArray!0 (select (arr!47722 a!2862) i!1006)))))

(declare-fun lt!641533 () array!98878)

(declare-fun lt!641530 () (_ BitVec 64))

(declare-fun b!1465554 () Bool)

(declare-datatypes ((SeekEntryResult!11871 0))(
  ( (MissingZero!11871 (index!49876 (_ BitVec 32))) (Found!11871 (index!49877 (_ BitVec 32))) (Intermediate!11871 (undefined!12683 Bool) (index!49878 (_ BitVec 32)) (x!131649 (_ BitVec 32))) (Undefined!11871) (MissingVacant!11871 (index!49879 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98878 (_ BitVec 32)) SeekEntryResult!11871)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98878 (_ BitVec 32)) SeekEntryResult!11871)

(assert (=> b!1465554 (= e!823769 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641530 lt!641533 mask!2687) (seekEntryOrOpen!0 lt!641530 lt!641533 mask!2687)))))

(declare-fun b!1465555 () Bool)

(declare-fun res!993641 () Bool)

(assert (=> b!1465555 (=> (not res!993641) (not e!823766))))

(declare-datatypes ((List!34210 0))(
  ( (Nil!34207) (Cons!34206 (h!35570 (_ BitVec 64)) (t!48896 List!34210)) )
))
(declare-fun arrayNoDuplicates!0 (array!98878 (_ BitVec 32) List!34210) Bool)

(assert (=> b!1465555 (= res!993641 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34207))))

(declare-fun b!1465556 () Bool)

(declare-fun e!823770 () Bool)

(declare-fun e!823773 () Bool)

(assert (=> b!1465556 (= e!823770 e!823773)))

(declare-fun res!993631 () Bool)

(assert (=> b!1465556 (=> (not res!993631) (not e!823773))))

(declare-fun lt!641531 () SeekEntryResult!11871)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98878 (_ BitVec 32)) SeekEntryResult!11871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465556 (= res!993631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47722 a!2862) j!93) mask!2687) (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!641531))))

(assert (=> b!1465556 (= lt!641531 (Intermediate!11871 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465557 () Bool)

(assert (=> b!1465557 (= e!823773 e!823768)))

(declare-fun res!993629 () Bool)

(assert (=> b!1465557 (=> (not res!993629) (not e!823768))))

(declare-fun lt!641534 () SeekEntryResult!11871)

(assert (=> b!1465557 (= res!993629 (= lt!641534 (Intermediate!11871 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465557 (= lt!641534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641530 mask!2687) lt!641530 lt!641533 mask!2687))))

(assert (=> b!1465557 (= lt!641530 (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465558 () Bool)

(declare-fun res!993628 () Bool)

(assert (=> b!1465558 (=> (not res!993628) (not e!823766))))

(assert (=> b!1465558 (= res!993628 (and (= (size!48273 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48273 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48273 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465559 () Bool)

(assert (=> b!1465559 (= e!823769 (= lt!641534 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641530 lt!641533 mask!2687)))))

(declare-fun b!1465560 () Bool)

(declare-fun res!993638 () Bool)

(assert (=> b!1465560 (=> res!993638 e!823767)))

(assert (=> b!1465560 (= res!993638 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641532 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!641531)))))

(declare-fun res!993626 () Bool)

(assert (=> start!125592 (=> (not res!993626) (not e!823766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125592 (= res!993626 (validMask!0 mask!2687))))

(assert (=> start!125592 e!823766))

(assert (=> start!125592 true))

(declare-fun array_inv!37003 (array!98878) Bool)

(assert (=> start!125592 (array_inv!37003 a!2862)))

(declare-fun b!1465548 () Bool)

(assert (=> b!1465548 (= e!823766 e!823770)))

(declare-fun res!993627 () Bool)

(assert (=> b!1465548 (=> (not res!993627) (not e!823770))))

(assert (=> b!1465548 (= res!993627 (= (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465548 (= lt!641533 (array!98879 (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48273 a!2862)))))

(declare-fun b!1465561 () Bool)

(assert (=> b!1465561 (= e!823764 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641532 intermediateAfterIndex!19 lt!641530 lt!641533 mask!2687) (seekEntryOrOpen!0 lt!641530 lt!641533 mask!2687))))))

(declare-fun b!1465562 () Bool)

(declare-fun res!993636 () Bool)

(assert (=> b!1465562 (=> (not res!993636) (not e!823772))))

(assert (=> b!1465562 (= res!993636 (= (seekEntryOrOpen!0 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) (Found!11871 j!93)))))

(declare-fun b!1465563 () Bool)

(declare-fun res!993630 () Bool)

(assert (=> b!1465563 (=> (not res!993630) (not e!823773))))

(assert (=> b!1465563 (= res!993630 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!641531))))

(declare-fun b!1465564 () Bool)

(assert (=> b!1465564 (= e!823764 (not (= lt!641534 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641532 lt!641530 lt!641533 mask!2687))))))

(assert (= (and start!125592 res!993626) b!1465558))

(assert (= (and b!1465558 res!993628) b!1465553))

(assert (= (and b!1465553 res!993625) b!1465545))

(assert (= (and b!1465545 res!993634) b!1465552))

(assert (= (and b!1465552 res!993637) b!1465555))

(assert (= (and b!1465555 res!993641) b!1465551))

(assert (= (and b!1465551 res!993635) b!1465548))

(assert (= (and b!1465548 res!993627) b!1465556))

(assert (= (and b!1465556 res!993631) b!1465563))

(assert (= (and b!1465563 res!993630) b!1465557))

(assert (= (and b!1465557 res!993629) b!1465546))

(assert (= (and b!1465546 c!135480) b!1465559))

(assert (= (and b!1465546 (not c!135480)) b!1465554))

(assert (= (and b!1465546 res!993639) b!1465547))

(assert (= (and b!1465547 res!993632) b!1465544))

(assert (= (and b!1465544 res!993640) b!1465562))

(assert (= (and b!1465562 res!993636) b!1465549))

(assert (= (and b!1465544 (not res!993633)) b!1465550))

(assert (= (and b!1465550 (not res!993624)) b!1465560))

(assert (= (and b!1465560 (not res!993638)) b!1465543))

(assert (= (and b!1465543 c!135481) b!1465564))

(assert (= (and b!1465543 (not c!135481)) b!1465561))

(declare-fun m!1352809 () Bool)

(assert (=> b!1465563 m!1352809))

(assert (=> b!1465563 m!1352809))

(declare-fun m!1352811 () Bool)

(assert (=> b!1465563 m!1352811))

(assert (=> b!1465556 m!1352809))

(assert (=> b!1465556 m!1352809))

(declare-fun m!1352813 () Bool)

(assert (=> b!1465556 m!1352813))

(assert (=> b!1465556 m!1352813))

(assert (=> b!1465556 m!1352809))

(declare-fun m!1352815 () Bool)

(assert (=> b!1465556 m!1352815))

(declare-fun m!1352817 () Bool)

(assert (=> start!125592 m!1352817))

(declare-fun m!1352819 () Bool)

(assert (=> start!125592 m!1352819))

(declare-fun m!1352821 () Bool)

(assert (=> b!1465553 m!1352821))

(assert (=> b!1465553 m!1352821))

(declare-fun m!1352823 () Bool)

(assert (=> b!1465553 m!1352823))

(assert (=> b!1465545 m!1352809))

(assert (=> b!1465545 m!1352809))

(declare-fun m!1352825 () Bool)

(assert (=> b!1465545 m!1352825))

(declare-fun m!1352827 () Bool)

(assert (=> b!1465561 m!1352827))

(declare-fun m!1352829 () Bool)

(assert (=> b!1465561 m!1352829))

(declare-fun m!1352831 () Bool)

(assert (=> b!1465559 m!1352831))

(declare-fun m!1352833 () Bool)

(assert (=> b!1465550 m!1352833))

(declare-fun m!1352835 () Bool)

(assert (=> b!1465552 m!1352835))

(declare-fun m!1352837 () Bool)

(assert (=> b!1465564 m!1352837))

(declare-fun m!1352839 () Bool)

(assert (=> b!1465555 m!1352839))

(declare-fun m!1352841 () Bool)

(assert (=> b!1465557 m!1352841))

(assert (=> b!1465557 m!1352841))

(declare-fun m!1352843 () Bool)

(assert (=> b!1465557 m!1352843))

(declare-fun m!1352845 () Bool)

(assert (=> b!1465557 m!1352845))

(declare-fun m!1352847 () Bool)

(assert (=> b!1465557 m!1352847))

(assert (=> b!1465560 m!1352809))

(assert (=> b!1465560 m!1352809))

(declare-fun m!1352849 () Bool)

(assert (=> b!1465560 m!1352849))

(declare-fun m!1352851 () Bool)

(assert (=> b!1465554 m!1352851))

(assert (=> b!1465554 m!1352829))

(declare-fun m!1352853 () Bool)

(assert (=> b!1465549 m!1352853))

(assert (=> b!1465549 m!1352809))

(declare-fun m!1352855 () Bool)

(assert (=> b!1465544 m!1352855))

(assert (=> b!1465544 m!1352845))

(declare-fun m!1352857 () Bool)

(assert (=> b!1465544 m!1352857))

(declare-fun m!1352859 () Bool)

(assert (=> b!1465544 m!1352859))

(declare-fun m!1352861 () Bool)

(assert (=> b!1465544 m!1352861))

(assert (=> b!1465544 m!1352809))

(assert (=> b!1465548 m!1352845))

(declare-fun m!1352863 () Bool)

(assert (=> b!1465548 m!1352863))

(assert (=> b!1465562 m!1352809))

(assert (=> b!1465562 m!1352809))

(declare-fun m!1352865 () Bool)

(assert (=> b!1465562 m!1352865))

(check-sat (not b!1465556) (not b!1465550) (not b!1465555) (not b!1465544) (not b!1465562) (not b!1465564) (not b!1465557) (not b!1465563) (not b!1465560) (not b!1465545) (not b!1465552) (not b!1465553) (not b!1465554) (not b!1465561) (not b!1465559) (not start!125592))
(check-sat)
