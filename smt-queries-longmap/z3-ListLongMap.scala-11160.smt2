; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130392 () Bool)

(assert start!130392)

(declare-fun b!1530611 () Bool)

(declare-fun res!1048145 () Bool)

(declare-fun e!852865 () Bool)

(assert (=> b!1530611 (=> (not res!1048145) (not e!852865))))

(declare-datatypes ((array!101626 0))(
  ( (array!101627 (arr!49036 (Array (_ BitVec 32) (_ BitVec 64))) (size!49588 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101626)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530611 (= res!1048145 (validKeyInArray!0 (select (arr!49036 a!2804) i!961)))))

(declare-fun b!1530612 () Bool)

(declare-fun res!1048141 () Bool)

(assert (=> b!1530612 (=> (not res!1048141) (not e!852865))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530612 (= res!1048141 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49588 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49588 a!2804))))))

(declare-fun b!1530613 () Bool)

(declare-fun e!852868 () Bool)

(assert (=> b!1530613 (= e!852865 e!852868)))

(declare-fun res!1048142 () Bool)

(assert (=> b!1530613 (=> (not res!1048142) (not e!852868))))

(declare-datatypes ((SeekEntryResult!13224 0))(
  ( (MissingZero!13224 (index!55291 (_ BitVec 32))) (Found!13224 (index!55292 (_ BitVec 32))) (Intermediate!13224 (undefined!14036 Bool) (index!55293 (_ BitVec 32)) (x!136988 (_ BitVec 32))) (Undefined!13224) (MissingVacant!13224 (index!55294 (_ BitVec 32))) )
))
(declare-fun lt!662744 () SeekEntryResult!13224)

(declare-fun lt!662742 () SeekEntryResult!13224)

(assert (=> b!1530613 (= res!1048142 (= lt!662744 lt!662742))))

(assert (=> b!1530613 (= lt!662742 (Intermediate!13224 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530613 (= lt!662744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49036 a!2804) j!70) mask!2512) (select (arr!49036 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530614 () Bool)

(declare-fun e!852866 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13224)

(assert (=> b!1530614 (= e!852866 (= (seekEntry!0 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) (Found!13224 j!70)))))

(declare-fun b!1530615 () Bool)

(declare-fun res!1048146 () Bool)

(assert (=> b!1530615 (=> (not res!1048146) (not e!852865))))

(assert (=> b!1530615 (= res!1048146 (and (= (size!49588 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49588 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49588 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530616 () Bool)

(declare-fun res!1048147 () Bool)

(assert (=> b!1530616 (=> (not res!1048147) (not e!852868))))

(assert (=> b!1530616 (= res!1048147 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) lt!662742))))

(declare-fun b!1530617 () Bool)

(declare-fun res!1048144 () Bool)

(assert (=> b!1530617 (=> (not res!1048144) (not e!852865))))

(assert (=> b!1530617 (= res!1048144 (validKeyInArray!0 (select (arr!49036 a!2804) j!70)))))

(declare-fun b!1530618 () Bool)

(declare-fun e!852867 () Bool)

(assert (=> b!1530618 (= e!852868 (not e!852867))))

(declare-fun res!1048137 () Bool)

(assert (=> b!1530618 (=> res!1048137 e!852867)))

(assert (=> b!1530618 (= res!1048137 (or (not (= (select (arr!49036 a!2804) j!70) (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530618 e!852866))

(declare-fun res!1048140 () Bool)

(assert (=> b!1530618 (=> (not res!1048140) (not e!852866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101626 (_ BitVec 32)) Bool)

(assert (=> b!1530618 (= res!1048140 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51071 0))(
  ( (Unit!51072) )
))
(declare-fun lt!662745 () Unit!51071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51071)

(assert (=> b!1530618 (= lt!662745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530620 () Bool)

(declare-fun res!1048139 () Bool)

(assert (=> b!1530620 (=> (not res!1048139) (not e!852865))))

(declare-datatypes ((List!35597 0))(
  ( (Nil!35594) (Cons!35593 (h!37036 (_ BitVec 64)) (t!50283 List!35597)) )
))
(declare-fun arrayNoDuplicates!0 (array!101626 (_ BitVec 32) List!35597) Bool)

(assert (=> b!1530620 (= res!1048139 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35594))))

(declare-fun b!1530621 () Bool)

(declare-fun res!1048138 () Bool)

(assert (=> b!1530621 (=> (not res!1048138) (not e!852868))))

(assert (=> b!1530621 (= res!1048138 (= lt!662744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101627 (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49588 a!2804)) mask!2512)))))

(declare-fun b!1530622 () Bool)

(declare-fun res!1048143 () Bool)

(assert (=> b!1530622 (=> (not res!1048143) (not e!852865))))

(assert (=> b!1530622 (= res!1048143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1048136 () Bool)

(assert (=> start!130392 (=> (not res!1048136) (not e!852865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130392 (= res!1048136 (validMask!0 mask!2512))))

(assert (=> start!130392 e!852865))

(assert (=> start!130392 true))

(declare-fun array_inv!38269 (array!101626) Bool)

(assert (=> start!130392 (array_inv!38269 a!2804)))

(declare-fun b!1530619 () Bool)

(assert (=> b!1530619 (= e!852867 true)))

(declare-fun lt!662743 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530619 (= lt!662743 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130392 res!1048136) b!1530615))

(assert (= (and b!1530615 res!1048146) b!1530611))

(assert (= (and b!1530611 res!1048145) b!1530617))

(assert (= (and b!1530617 res!1048144) b!1530622))

(assert (= (and b!1530622 res!1048143) b!1530620))

(assert (= (and b!1530620 res!1048139) b!1530612))

(assert (= (and b!1530612 res!1048141) b!1530613))

(assert (= (and b!1530613 res!1048142) b!1530616))

(assert (= (and b!1530616 res!1048147) b!1530621))

(assert (= (and b!1530621 res!1048138) b!1530618))

(assert (= (and b!1530618 res!1048140) b!1530614))

(assert (= (and b!1530618 (not res!1048137)) b!1530619))

(declare-fun m!1412801 () Bool)

(assert (=> b!1530619 m!1412801))

(declare-fun m!1412803 () Bool)

(assert (=> b!1530611 m!1412803))

(assert (=> b!1530611 m!1412803))

(declare-fun m!1412805 () Bool)

(assert (=> b!1530611 m!1412805))

(declare-fun m!1412807 () Bool)

(assert (=> b!1530617 m!1412807))

(assert (=> b!1530617 m!1412807))

(declare-fun m!1412809 () Bool)

(assert (=> b!1530617 m!1412809))

(declare-fun m!1412811 () Bool)

(assert (=> b!1530622 m!1412811))

(declare-fun m!1412813 () Bool)

(assert (=> b!1530620 m!1412813))

(declare-fun m!1412815 () Bool)

(assert (=> b!1530621 m!1412815))

(declare-fun m!1412817 () Bool)

(assert (=> b!1530621 m!1412817))

(assert (=> b!1530621 m!1412817))

(declare-fun m!1412819 () Bool)

(assert (=> b!1530621 m!1412819))

(assert (=> b!1530621 m!1412819))

(assert (=> b!1530621 m!1412817))

(declare-fun m!1412821 () Bool)

(assert (=> b!1530621 m!1412821))

(assert (=> b!1530614 m!1412807))

(assert (=> b!1530614 m!1412807))

(declare-fun m!1412823 () Bool)

(assert (=> b!1530614 m!1412823))

(assert (=> b!1530618 m!1412807))

(declare-fun m!1412825 () Bool)

(assert (=> b!1530618 m!1412825))

(assert (=> b!1530618 m!1412815))

(assert (=> b!1530618 m!1412817))

(declare-fun m!1412827 () Bool)

(assert (=> b!1530618 m!1412827))

(assert (=> b!1530616 m!1412807))

(assert (=> b!1530616 m!1412807))

(declare-fun m!1412829 () Bool)

(assert (=> b!1530616 m!1412829))

(declare-fun m!1412831 () Bool)

(assert (=> start!130392 m!1412831))

(declare-fun m!1412833 () Bool)

(assert (=> start!130392 m!1412833))

(assert (=> b!1530613 m!1412807))

(assert (=> b!1530613 m!1412807))

(declare-fun m!1412835 () Bool)

(assert (=> b!1530613 m!1412835))

(assert (=> b!1530613 m!1412835))

(assert (=> b!1530613 m!1412807))

(declare-fun m!1412837 () Bool)

(assert (=> b!1530613 m!1412837))

(check-sat (not b!1530611) (not b!1530614) (not start!130392) (not b!1530620) (not b!1530617) (not b!1530616) (not b!1530618) (not b!1530621) (not b!1530619) (not b!1530613) (not b!1530622))
(check-sat)
