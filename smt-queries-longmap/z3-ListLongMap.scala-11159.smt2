; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130818 () Bool)

(assert start!130818)

(declare-fun b!1533108 () Bool)

(declare-fun res!1048972 () Bool)

(declare-fun e!854440 () Bool)

(assert (=> b!1533108 (=> (not res!1048972) (not e!854440))))

(declare-datatypes ((SeekEntryResult!13169 0))(
  ( (MissingZero!13169 (index!55071 (_ BitVec 32))) (Found!13169 (index!55072 (_ BitVec 32))) (Intermediate!13169 (undefined!13981 Bool) (index!55073 (_ BitVec 32)) (x!136977 (_ BitVec 32))) (Undefined!13169) (MissingVacant!13169 (index!55074 (_ BitVec 32))) )
))
(declare-fun lt!663870 () SeekEntryResult!13169)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101791 0))(
  ( (array!101792 (arr!49111 (Array (_ BitVec 32) (_ BitVec 64))) (size!49662 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101791 (_ BitVec 32)) SeekEntryResult!13169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533108 (= res!1048972 (= lt!663870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49111 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49111 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101792 (store (arr!49111 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49662 a!2804)) mask!2512)))))

(declare-fun b!1533109 () Bool)

(declare-fun e!854439 () Bool)

(assert (=> b!1533109 (= e!854439 e!854440)))

(declare-fun res!1048974 () Bool)

(assert (=> b!1533109 (=> (not res!1048974) (not e!854440))))

(declare-fun lt!663868 () SeekEntryResult!13169)

(assert (=> b!1533109 (= res!1048974 (= lt!663870 lt!663868))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1533109 (= lt!663868 (Intermediate!13169 false resIndex!21 resX!21))))

(assert (=> b!1533109 (= lt!663870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49111 a!2804) j!70) mask!2512) (select (arr!49111 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533110 () Bool)

(declare-fun res!1048963 () Bool)

(assert (=> b!1533110 (=> (not res!1048963) (not e!854439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533110 (= res!1048963 (validKeyInArray!0 (select (arr!49111 a!2804) j!70)))))

(declare-fun b!1533111 () Bool)

(declare-fun res!1048965 () Bool)

(assert (=> b!1533111 (=> (not res!1048965) (not e!854439))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1533111 (= res!1048965 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49662 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49662 a!2804))))))

(declare-fun b!1533112 () Bool)

(declare-fun res!1048968 () Bool)

(assert (=> b!1533112 (=> (not res!1048968) (not e!854439))))

(assert (=> b!1533112 (= res!1048968 (and (= (size!49662 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49662 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49662 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1533113 () Bool)

(declare-fun res!1048969 () Bool)

(assert (=> b!1533113 (=> (not res!1048969) (not e!854440))))

(assert (=> b!1533113 (= res!1048969 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49111 a!2804) j!70) a!2804 mask!2512) lt!663868))))

(declare-fun b!1533114 () Bool)

(declare-fun e!854436 () Bool)

(assert (=> b!1533114 (= e!854440 (not e!854436))))

(declare-fun res!1048970 () Bool)

(assert (=> b!1533114 (=> res!1048970 e!854436)))

(assert (=> b!1533114 (= res!1048970 (or (not (= (select (arr!49111 a!2804) j!70) (select (store (arr!49111 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!854438 () Bool)

(assert (=> b!1533114 e!854438))

(declare-fun res!1048966 () Bool)

(assert (=> b!1533114 (=> (not res!1048966) (not e!854438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101791 (_ BitVec 32)) Bool)

(assert (=> b!1533114 (= res!1048966 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51157 0))(
  ( (Unit!51158) )
))
(declare-fun lt!663867 () Unit!51157)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51157)

(assert (=> b!1533114 (= lt!663867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1533115 () Bool)

(assert (=> b!1533115 (= e!854436 true)))

(declare-fun lt!663869 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533115 (= lt!663869 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1048964 () Bool)

(assert (=> start!130818 (=> (not res!1048964) (not e!854439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130818 (= res!1048964 (validMask!0 mask!2512))))

(assert (=> start!130818 e!854439))

(assert (=> start!130818 true))

(declare-fun array_inv!38392 (array!101791) Bool)

(assert (=> start!130818 (array_inv!38392 a!2804)))

(declare-fun b!1533116 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101791 (_ BitVec 32)) SeekEntryResult!13169)

(assert (=> b!1533116 (= e!854438 (= (seekEntry!0 (select (arr!49111 a!2804) j!70) a!2804 mask!2512) (Found!13169 j!70)))))

(declare-fun b!1533117 () Bool)

(declare-fun res!1048967 () Bool)

(assert (=> b!1533117 (=> (not res!1048967) (not e!854439))))

(assert (=> b!1533117 (= res!1048967 (validKeyInArray!0 (select (arr!49111 a!2804) i!961)))))

(declare-fun b!1533118 () Bool)

(declare-fun res!1048971 () Bool)

(assert (=> b!1533118 (=> (not res!1048971) (not e!854439))))

(declare-datatypes ((List!35581 0))(
  ( (Nil!35578) (Cons!35577 (h!37037 (_ BitVec 64)) (t!50267 List!35581)) )
))
(declare-fun arrayNoDuplicates!0 (array!101791 (_ BitVec 32) List!35581) Bool)

(assert (=> b!1533118 (= res!1048971 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35578))))

(declare-fun b!1533119 () Bool)

(declare-fun res!1048973 () Bool)

(assert (=> b!1533119 (=> (not res!1048973) (not e!854439))))

(assert (=> b!1533119 (= res!1048973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130818 res!1048964) b!1533112))

(assert (= (and b!1533112 res!1048968) b!1533117))

(assert (= (and b!1533117 res!1048967) b!1533110))

(assert (= (and b!1533110 res!1048963) b!1533119))

(assert (= (and b!1533119 res!1048973) b!1533118))

(assert (= (and b!1533118 res!1048971) b!1533111))

(assert (= (and b!1533111 res!1048965) b!1533109))

(assert (= (and b!1533109 res!1048974) b!1533113))

(assert (= (and b!1533113 res!1048969) b!1533108))

(assert (= (and b!1533108 res!1048972) b!1533114))

(assert (= (and b!1533114 res!1048966) b!1533116))

(assert (= (and b!1533114 (not res!1048970)) b!1533115))

(declare-fun m!1415731 () Bool)

(assert (=> b!1533108 m!1415731))

(declare-fun m!1415733 () Bool)

(assert (=> b!1533108 m!1415733))

(assert (=> b!1533108 m!1415733))

(declare-fun m!1415735 () Bool)

(assert (=> b!1533108 m!1415735))

(assert (=> b!1533108 m!1415735))

(assert (=> b!1533108 m!1415733))

(declare-fun m!1415737 () Bool)

(assert (=> b!1533108 m!1415737))

(declare-fun m!1415739 () Bool)

(assert (=> b!1533109 m!1415739))

(assert (=> b!1533109 m!1415739))

(declare-fun m!1415741 () Bool)

(assert (=> b!1533109 m!1415741))

(assert (=> b!1533109 m!1415741))

(assert (=> b!1533109 m!1415739))

(declare-fun m!1415743 () Bool)

(assert (=> b!1533109 m!1415743))

(declare-fun m!1415745 () Bool)

(assert (=> b!1533117 m!1415745))

(assert (=> b!1533117 m!1415745))

(declare-fun m!1415747 () Bool)

(assert (=> b!1533117 m!1415747))

(assert (=> b!1533114 m!1415739))

(declare-fun m!1415749 () Bool)

(assert (=> b!1533114 m!1415749))

(assert (=> b!1533114 m!1415731))

(assert (=> b!1533114 m!1415733))

(declare-fun m!1415751 () Bool)

(assert (=> b!1533114 m!1415751))

(assert (=> b!1533113 m!1415739))

(assert (=> b!1533113 m!1415739))

(declare-fun m!1415753 () Bool)

(assert (=> b!1533113 m!1415753))

(declare-fun m!1415755 () Bool)

(assert (=> b!1533118 m!1415755))

(assert (=> b!1533116 m!1415739))

(assert (=> b!1533116 m!1415739))

(declare-fun m!1415757 () Bool)

(assert (=> b!1533116 m!1415757))

(assert (=> b!1533110 m!1415739))

(assert (=> b!1533110 m!1415739))

(declare-fun m!1415759 () Bool)

(assert (=> b!1533110 m!1415759))

(declare-fun m!1415761 () Bool)

(assert (=> b!1533119 m!1415761))

(declare-fun m!1415763 () Bool)

(assert (=> b!1533115 m!1415763))

(declare-fun m!1415765 () Bool)

(assert (=> start!130818 m!1415765))

(declare-fun m!1415767 () Bool)

(assert (=> start!130818 m!1415767))

(check-sat (not b!1533119) (not b!1533110) (not b!1533116) (not b!1533117) (not start!130818) (not b!1533109) (not b!1533108) (not b!1533118) (not b!1533113) (not b!1533114) (not b!1533115))
(check-sat)
