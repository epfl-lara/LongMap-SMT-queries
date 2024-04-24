; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128816 () Bool)

(assert start!128816)

(declare-fun b!1508738 () Bool)

(declare-fun res!1027890 () Bool)

(declare-fun e!843173 () Bool)

(assert (=> b!1508738 (=> (not res!1027890) (not e!843173))))

(declare-datatypes ((array!100642 0))(
  ( (array!100643 (arr!48559 (Array (_ BitVec 32) (_ BitVec 64))) (size!49110 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100642)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100642 (_ BitVec 32)) Bool)

(assert (=> b!1508738 (= res!1027890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508739 () Bool)

(declare-fun res!1027892 () Bool)

(assert (=> b!1508739 (=> (not res!1027892) (not e!843173))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508739 (= res!1027892 (validKeyInArray!0 (select (arr!48559 a!2804) i!961)))))

(declare-fun b!1508740 () Bool)

(declare-fun res!1027888 () Bool)

(assert (=> b!1508740 (=> (not res!1027888) (not e!843173))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508740 (= res!1027888 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49110 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49110 a!2804))))))

(declare-fun b!1508742 () Bool)

(declare-fun e!843172 () Bool)

(assert (=> b!1508742 (= e!843172 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1508743 () Bool)

(declare-fun res!1027891 () Bool)

(assert (=> b!1508743 (=> (not res!1027891) (not e!843172))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12623 0))(
  ( (MissingZero!12623 (index!52887 (_ BitVec 32))) (Found!12623 (index!52888 (_ BitVec 32))) (Intermediate!12623 (undefined!13435 Bool) (index!52889 (_ BitVec 32)) (x!134842 (_ BitVec 32))) (Undefined!12623) (MissingVacant!12623 (index!52890 (_ BitVec 32))) )
))
(declare-fun lt!654943 () SeekEntryResult!12623)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100642 (_ BitVec 32)) SeekEntryResult!12623)

(assert (=> b!1508743 (= res!1027891 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48559 a!2804) j!70) a!2804 mask!2512) lt!654943))))

(declare-fun b!1508744 () Bool)

(declare-fun res!1027884 () Bool)

(assert (=> b!1508744 (=> (not res!1027884) (not e!843173))))

(declare-datatypes ((List!35029 0))(
  ( (Nil!35026) (Cons!35025 (h!36440 (_ BitVec 64)) (t!49715 List!35029)) )
))
(declare-fun arrayNoDuplicates!0 (array!100642 (_ BitVec 32) List!35029) Bool)

(assert (=> b!1508744 (= res!1027884 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35026))))

(declare-fun b!1508745 () Bool)

(declare-fun res!1027887 () Bool)

(assert (=> b!1508745 (=> (not res!1027887) (not e!843173))))

(assert (=> b!1508745 (= res!1027887 (and (= (size!49110 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49110 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49110 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508746 () Bool)

(declare-fun res!1027886 () Bool)

(assert (=> b!1508746 (=> (not res!1027886) (not e!843173))))

(assert (=> b!1508746 (= res!1027886 (validKeyInArray!0 (select (arr!48559 a!2804) j!70)))))

(declare-fun b!1508741 () Bool)

(assert (=> b!1508741 (= e!843173 e!843172)))

(declare-fun res!1027889 () Bool)

(assert (=> b!1508741 (=> (not res!1027889) (not e!843172))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508741 (= res!1027889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48559 a!2804) j!70) mask!2512) (select (arr!48559 a!2804) j!70) a!2804 mask!2512) lt!654943))))

(assert (=> b!1508741 (= lt!654943 (Intermediate!12623 false resIndex!21 resX!21))))

(declare-fun res!1027885 () Bool)

(assert (=> start!128816 (=> (not res!1027885) (not e!843173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128816 (= res!1027885 (validMask!0 mask!2512))))

(assert (=> start!128816 e!843173))

(assert (=> start!128816 true))

(declare-fun array_inv!37840 (array!100642) Bool)

(assert (=> start!128816 (array_inv!37840 a!2804)))

(assert (= (and start!128816 res!1027885) b!1508745))

(assert (= (and b!1508745 res!1027887) b!1508739))

(assert (= (and b!1508739 res!1027892) b!1508746))

(assert (= (and b!1508746 res!1027886) b!1508738))

(assert (= (and b!1508738 res!1027890) b!1508744))

(assert (= (and b!1508744 res!1027884) b!1508740))

(assert (= (and b!1508740 res!1027888) b!1508741))

(assert (= (and b!1508741 res!1027889) b!1508743))

(assert (= (and b!1508743 res!1027891) b!1508742))

(declare-fun m!1391595 () Bool)

(assert (=> b!1508744 m!1391595))

(declare-fun m!1391597 () Bool)

(assert (=> b!1508746 m!1391597))

(assert (=> b!1508746 m!1391597))

(declare-fun m!1391599 () Bool)

(assert (=> b!1508746 m!1391599))

(assert (=> b!1508741 m!1391597))

(assert (=> b!1508741 m!1391597))

(declare-fun m!1391601 () Bool)

(assert (=> b!1508741 m!1391601))

(assert (=> b!1508741 m!1391601))

(assert (=> b!1508741 m!1391597))

(declare-fun m!1391603 () Bool)

(assert (=> b!1508741 m!1391603))

(declare-fun m!1391605 () Bool)

(assert (=> start!128816 m!1391605))

(declare-fun m!1391607 () Bool)

(assert (=> start!128816 m!1391607))

(assert (=> b!1508743 m!1391597))

(assert (=> b!1508743 m!1391597))

(declare-fun m!1391609 () Bool)

(assert (=> b!1508743 m!1391609))

(declare-fun m!1391611 () Bool)

(assert (=> b!1508739 m!1391611))

(assert (=> b!1508739 m!1391611))

(declare-fun m!1391613 () Bool)

(assert (=> b!1508739 m!1391613))

(declare-fun m!1391615 () Bool)

(assert (=> b!1508738 m!1391615))

(check-sat (not b!1508746) (not start!128816) (not b!1508739) (not b!1508744) (not b!1508743) (not b!1508741) (not b!1508738))
(check-sat)
