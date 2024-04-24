; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129602 () Bool)

(assert start!129602)

(declare-fun b!1519666 () Bool)

(declare-fun res!1038214 () Bool)

(declare-fun e!847978 () Bool)

(assert (=> b!1519666 (=> (not res!1038214) (not e!847978))))

(declare-datatypes ((array!101221 0))(
  ( (array!101222 (arr!48841 (Array (_ BitVec 32) (_ BitVec 64))) (size!49392 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101221)

(declare-datatypes ((List!35311 0))(
  ( (Nil!35308) (Cons!35307 (h!36737 (_ BitVec 64)) (t!49997 List!35311)) )
))
(declare-fun arrayNoDuplicates!0 (array!101221 (_ BitVec 32) List!35311) Bool)

(assert (=> b!1519666 (= res!1038214 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35308))))

(declare-fun b!1519667 () Bool)

(declare-fun res!1038219 () Bool)

(declare-fun e!847979 () Bool)

(assert (=> b!1519667 (=> (not res!1038219) (not e!847979))))

(declare-datatypes ((SeekEntryResult!12905 0))(
  ( (MissingZero!12905 (index!54015 (_ BitVec 32))) (Found!12905 (index!54016 (_ BitVec 32))) (Intermediate!12905 (undefined!13717 Bool) (index!54017 (_ BitVec 32)) (x!135906 (_ BitVec 32))) (Undefined!12905) (MissingVacant!12905 (index!54018 (_ BitVec 32))) )
))
(declare-fun lt!658627 () SeekEntryResult!12905)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101221 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1519667 (= res!1038219 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) lt!658627))))

(declare-fun b!1519668 () Bool)

(declare-fun e!847980 () Bool)

(declare-fun e!847975 () Bool)

(assert (=> b!1519668 (= e!847980 e!847975)))

(declare-fun res!1038210 () Bool)

(assert (=> b!1519668 (=> res!1038210 e!847975)))

(declare-fun lt!658630 () (_ BitVec 32))

(assert (=> b!1519668 (= res!1038210 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658630 #b00000000000000000000000000000000) (bvsge lt!658630 (size!49392 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519668 (= lt!658630 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519669 () Bool)

(declare-fun e!847977 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101221 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1519669 (= e!847977 (= (seekEntry!0 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) (Found!12905 j!70)))))

(declare-fun b!1519670 () Bool)

(assert (=> b!1519670 (= e!847979 (not e!847980))))

(declare-fun res!1038212 () Bool)

(assert (=> b!1519670 (=> res!1038212 e!847980)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1519670 (= res!1038212 (or (not (= (select (arr!48841 a!2804) j!70) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1519670 e!847977))

(declare-fun res!1038221 () Bool)

(assert (=> b!1519670 (=> (not res!1038221) (not e!847977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101221 (_ BitVec 32)) Bool)

(assert (=> b!1519670 (= res!1038221 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50713 0))(
  ( (Unit!50714) )
))
(declare-fun lt!658628 () Unit!50713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50713)

(assert (=> b!1519670 (= lt!658628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519672 () Bool)

(assert (=> b!1519672 (= e!847978 e!847979)))

(declare-fun res!1038213 () Bool)

(assert (=> b!1519672 (=> (not res!1038213) (not e!847979))))

(declare-fun lt!658626 () SeekEntryResult!12905)

(assert (=> b!1519672 (= res!1038213 (= lt!658626 lt!658627))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519672 (= lt!658627 (Intermediate!12905 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519672 (= lt!658626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519673 () Bool)

(declare-fun res!1038217 () Bool)

(assert (=> b!1519673 (=> (not res!1038217) (not e!847978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519673 (= res!1038217 (validKeyInArray!0 (select (arr!48841 a!2804) j!70)))))

(declare-fun b!1519674 () Bool)

(declare-fun res!1038216 () Bool)

(assert (=> b!1519674 (=> (not res!1038216) (not e!847978))))

(assert (=> b!1519674 (= res!1038216 (and (= (size!49392 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49392 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49392 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519675 () Bool)

(declare-fun res!1038211 () Bool)

(assert (=> b!1519675 (=> (not res!1038211) (not e!847978))))

(assert (=> b!1519675 (= res!1038211 (validKeyInArray!0 (select (arr!48841 a!2804) i!961)))))

(declare-fun b!1519676 () Bool)

(assert (=> b!1519676 (= e!847975 true)))

(declare-fun lt!658629 () SeekEntryResult!12905)

(assert (=> b!1519676 (= lt!658629 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658630 (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519677 () Bool)

(declare-fun res!1038209 () Bool)

(assert (=> b!1519677 (=> (not res!1038209) (not e!847979))))

(assert (=> b!1519677 (= res!1038209 (= lt!658626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101222 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49392 a!2804)) mask!2512)))))

(declare-fun b!1519678 () Bool)

(declare-fun res!1038218 () Bool)

(assert (=> b!1519678 (=> (not res!1038218) (not e!847978))))

(assert (=> b!1519678 (= res!1038218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519671 () Bool)

(declare-fun res!1038215 () Bool)

(assert (=> b!1519671 (=> (not res!1038215) (not e!847978))))

(assert (=> b!1519671 (= res!1038215 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49392 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49392 a!2804))))))

(declare-fun res!1038220 () Bool)

(assert (=> start!129602 (=> (not res!1038220) (not e!847978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129602 (= res!1038220 (validMask!0 mask!2512))))

(assert (=> start!129602 e!847978))

(assert (=> start!129602 true))

(declare-fun array_inv!38122 (array!101221) Bool)

(assert (=> start!129602 (array_inv!38122 a!2804)))

(assert (= (and start!129602 res!1038220) b!1519674))

(assert (= (and b!1519674 res!1038216) b!1519675))

(assert (= (and b!1519675 res!1038211) b!1519673))

(assert (= (and b!1519673 res!1038217) b!1519678))

(assert (= (and b!1519678 res!1038218) b!1519666))

(assert (= (and b!1519666 res!1038214) b!1519671))

(assert (= (and b!1519671 res!1038215) b!1519672))

(assert (= (and b!1519672 res!1038213) b!1519667))

(assert (= (and b!1519667 res!1038219) b!1519677))

(assert (= (and b!1519677 res!1038209) b!1519670))

(assert (= (and b!1519670 res!1038221) b!1519669))

(assert (= (and b!1519670 (not res!1038212)) b!1519668))

(assert (= (and b!1519668 (not res!1038210)) b!1519676))

(declare-fun m!1402809 () Bool)

(assert (=> b!1519668 m!1402809))

(declare-fun m!1402811 () Bool)

(assert (=> b!1519675 m!1402811))

(assert (=> b!1519675 m!1402811))

(declare-fun m!1402813 () Bool)

(assert (=> b!1519675 m!1402813))

(declare-fun m!1402815 () Bool)

(assert (=> b!1519669 m!1402815))

(assert (=> b!1519669 m!1402815))

(declare-fun m!1402817 () Bool)

(assert (=> b!1519669 m!1402817))

(declare-fun m!1402819 () Bool)

(assert (=> b!1519677 m!1402819))

(declare-fun m!1402821 () Bool)

(assert (=> b!1519677 m!1402821))

(assert (=> b!1519677 m!1402821))

(declare-fun m!1402823 () Bool)

(assert (=> b!1519677 m!1402823))

(assert (=> b!1519677 m!1402823))

(assert (=> b!1519677 m!1402821))

(declare-fun m!1402825 () Bool)

(assert (=> b!1519677 m!1402825))

(declare-fun m!1402827 () Bool)

(assert (=> b!1519666 m!1402827))

(declare-fun m!1402829 () Bool)

(assert (=> start!129602 m!1402829))

(declare-fun m!1402831 () Bool)

(assert (=> start!129602 m!1402831))

(assert (=> b!1519670 m!1402815))

(declare-fun m!1402833 () Bool)

(assert (=> b!1519670 m!1402833))

(assert (=> b!1519670 m!1402819))

(assert (=> b!1519670 m!1402821))

(declare-fun m!1402835 () Bool)

(assert (=> b!1519670 m!1402835))

(assert (=> b!1519676 m!1402815))

(assert (=> b!1519676 m!1402815))

(declare-fun m!1402837 () Bool)

(assert (=> b!1519676 m!1402837))

(declare-fun m!1402839 () Bool)

(assert (=> b!1519678 m!1402839))

(assert (=> b!1519667 m!1402815))

(assert (=> b!1519667 m!1402815))

(declare-fun m!1402841 () Bool)

(assert (=> b!1519667 m!1402841))

(assert (=> b!1519672 m!1402815))

(assert (=> b!1519672 m!1402815))

(declare-fun m!1402843 () Bool)

(assert (=> b!1519672 m!1402843))

(assert (=> b!1519672 m!1402843))

(assert (=> b!1519672 m!1402815))

(declare-fun m!1402845 () Bool)

(assert (=> b!1519672 m!1402845))

(assert (=> b!1519673 m!1402815))

(assert (=> b!1519673 m!1402815))

(declare-fun m!1402847 () Bool)

(assert (=> b!1519673 m!1402847))

(check-sat (not b!1519672) (not b!1519676) (not b!1519675) (not b!1519678) (not b!1519666) (not b!1519669) (not b!1519667) (not b!1519670) (not b!1519668) (not b!1519673) (not start!129602) (not b!1519677))
(check-sat)
