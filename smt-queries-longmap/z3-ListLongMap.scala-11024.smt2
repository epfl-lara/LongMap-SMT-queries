; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129278 () Bool)

(assert start!129278)

(declare-fun b!1514029 () Bool)

(declare-fun res!1032757 () Bool)

(declare-fun e!845253 () Bool)

(assert (=> b!1514029 (=> (not res!1032757) (not e!845253))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100948 0))(
  ( (array!100949 (arr!48706 (Array (_ BitVec 32) (_ BitVec 64))) (size!49257 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100948)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12770 0))(
  ( (MissingZero!12770 (index!53475 (_ BitVec 32))) (Found!12770 (index!53476 (_ BitVec 32))) (Intermediate!12770 (undefined!13582 Bool) (index!53477 (_ BitVec 32)) (x!135405 (_ BitVec 32))) (Undefined!12770) (MissingVacant!12770 (index!53478 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12770)

(assert (=> b!1514029 (= res!1032757 (= (seekEntry!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) (Found!12770 j!70)))))

(declare-fun res!1032763 () Bool)

(declare-fun e!845255 () Bool)

(assert (=> start!129278 (=> (not res!1032763) (not e!845255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129278 (= res!1032763 (validMask!0 mask!2512))))

(assert (=> start!129278 e!845255))

(assert (=> start!129278 true))

(declare-fun array_inv!37987 (array!100948) Bool)

(assert (=> start!129278 (array_inv!37987 a!2804)))

(declare-fun b!1514030 () Bool)

(declare-fun res!1032761 () Bool)

(declare-fun e!845252 () Bool)

(assert (=> b!1514030 (=> (not res!1032761) (not e!845252))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!656284 () SeekEntryResult!12770)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12770)

(assert (=> b!1514030 (= res!1032761 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) lt!656284))))

(declare-fun b!1514031 () Bool)

(declare-fun res!1032758 () Bool)

(assert (=> b!1514031 (=> (not res!1032758) (not e!845255))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514031 (= res!1032758 (and (= (size!49257 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49257 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49257 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514032 () Bool)

(declare-fun res!1032759 () Bool)

(assert (=> b!1514032 (=> (not res!1032759) (not e!845255))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514032 (= res!1032759 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49257 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49257 a!2804))))))

(declare-fun b!1514033 () Bool)

(declare-fun res!1032756 () Bool)

(assert (=> b!1514033 (=> (not res!1032756) (not e!845255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514033 (= res!1032756 (validKeyInArray!0 (select (arr!48706 a!2804) j!70)))))

(declare-fun b!1514034 () Bool)

(declare-fun e!845254 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12770)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100948 (_ BitVec 32)) SeekEntryResult!12770)

(assert (=> b!1514034 (= e!845254 (= (seekEntryOrOpen!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514035 () Bool)

(declare-fun res!1032760 () Bool)

(assert (=> b!1514035 (=> (not res!1032760) (not e!845255))))

(declare-datatypes ((List!35176 0))(
  ( (Nil!35173) (Cons!35172 (h!36599 (_ BitVec 64)) (t!49862 List!35176)) )
))
(declare-fun arrayNoDuplicates!0 (array!100948 (_ BitVec 32) List!35176) Bool)

(assert (=> b!1514035 (= res!1032760 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35173))))

(declare-fun b!1514036 () Bool)

(assert (=> b!1514036 (= e!845255 e!845252)))

(declare-fun res!1032764 () Bool)

(assert (=> b!1514036 (=> (not res!1032764) (not e!845252))))

(declare-fun lt!656283 () SeekEntryResult!12770)

(assert (=> b!1514036 (= res!1032764 (= lt!656283 lt!656284))))

(assert (=> b!1514036 (= lt!656284 (Intermediate!12770 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514036 (= lt!656283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48706 a!2804) j!70) mask!2512) (select (arr!48706 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514037 () Bool)

(declare-fun res!1032765 () Bool)

(assert (=> b!1514037 (=> (not res!1032765) (not e!845255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100948 (_ BitVec 32)) Bool)

(assert (=> b!1514037 (= res!1032765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514038 () Bool)

(declare-fun res!1032766 () Bool)

(assert (=> b!1514038 (=> (not res!1032766) (not e!845252))))

(assert (=> b!1514038 (= res!1032766 (= lt!656283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100949 (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49257 a!2804)) mask!2512)))))

(declare-fun b!1514039 () Bool)

(declare-fun res!1032762 () Bool)

(assert (=> b!1514039 (=> (not res!1032762) (not e!845255))))

(assert (=> b!1514039 (= res!1032762 (validKeyInArray!0 (select (arr!48706 a!2804) i!961)))))

(declare-fun b!1514040 () Bool)

(assert (=> b!1514040 (= e!845252 (not (or (not (= (select (arr!48706 a!2804) j!70) (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48706 a!2804) index!487) (select (arr!48706 a!2804) j!70)) (not (= (select (arr!48706 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1514040 e!845253))

(declare-fun res!1032755 () Bool)

(assert (=> b!1514040 (=> (not res!1032755) (not e!845253))))

(assert (=> b!1514040 (= res!1032755 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50443 0))(
  ( (Unit!50444) )
))
(declare-fun lt!656282 () Unit!50443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50443)

(assert (=> b!1514040 (= lt!656282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514041 () Bool)

(assert (=> b!1514041 (= e!845253 e!845254)))

(declare-fun res!1032767 () Bool)

(assert (=> b!1514041 (=> res!1032767 e!845254)))

(assert (=> b!1514041 (= res!1032767 (or (not (= (select (arr!48706 a!2804) j!70) (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48706 a!2804) index!487) (select (arr!48706 a!2804) j!70)) (not (= (select (arr!48706 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129278 res!1032763) b!1514031))

(assert (= (and b!1514031 res!1032758) b!1514039))

(assert (= (and b!1514039 res!1032762) b!1514033))

(assert (= (and b!1514033 res!1032756) b!1514037))

(assert (= (and b!1514037 res!1032765) b!1514035))

(assert (= (and b!1514035 res!1032760) b!1514032))

(assert (= (and b!1514032 res!1032759) b!1514036))

(assert (= (and b!1514036 res!1032764) b!1514030))

(assert (= (and b!1514030 res!1032761) b!1514038))

(assert (= (and b!1514038 res!1032766) b!1514040))

(assert (= (and b!1514040 res!1032755) b!1514029))

(assert (= (and b!1514029 res!1032757) b!1514041))

(assert (= (and b!1514041 (not res!1032767)) b!1514034))

(declare-fun m!1396743 () Bool)

(assert (=> b!1514036 m!1396743))

(assert (=> b!1514036 m!1396743))

(declare-fun m!1396745 () Bool)

(assert (=> b!1514036 m!1396745))

(assert (=> b!1514036 m!1396745))

(assert (=> b!1514036 m!1396743))

(declare-fun m!1396747 () Bool)

(assert (=> b!1514036 m!1396747))

(assert (=> b!1514034 m!1396743))

(assert (=> b!1514034 m!1396743))

(declare-fun m!1396749 () Bool)

(assert (=> b!1514034 m!1396749))

(assert (=> b!1514034 m!1396743))

(declare-fun m!1396751 () Bool)

(assert (=> b!1514034 m!1396751))

(declare-fun m!1396753 () Bool)

(assert (=> b!1514037 m!1396753))

(declare-fun m!1396755 () Bool)

(assert (=> b!1514039 m!1396755))

(assert (=> b!1514039 m!1396755))

(declare-fun m!1396757 () Bool)

(assert (=> b!1514039 m!1396757))

(assert (=> b!1514040 m!1396743))

(declare-fun m!1396759 () Bool)

(assert (=> b!1514040 m!1396759))

(declare-fun m!1396761 () Bool)

(assert (=> b!1514040 m!1396761))

(declare-fun m!1396763 () Bool)

(assert (=> b!1514040 m!1396763))

(declare-fun m!1396765 () Bool)

(assert (=> b!1514040 m!1396765))

(declare-fun m!1396767 () Bool)

(assert (=> b!1514040 m!1396767))

(assert (=> b!1514029 m!1396743))

(assert (=> b!1514029 m!1396743))

(declare-fun m!1396769 () Bool)

(assert (=> b!1514029 m!1396769))

(declare-fun m!1396771 () Bool)

(assert (=> b!1514035 m!1396771))

(assert (=> b!1514030 m!1396743))

(assert (=> b!1514030 m!1396743))

(declare-fun m!1396773 () Bool)

(assert (=> b!1514030 m!1396773))

(declare-fun m!1396775 () Bool)

(assert (=> start!129278 m!1396775))

(declare-fun m!1396777 () Bool)

(assert (=> start!129278 m!1396777))

(assert (=> b!1514033 m!1396743))

(assert (=> b!1514033 m!1396743))

(declare-fun m!1396779 () Bool)

(assert (=> b!1514033 m!1396779))

(assert (=> b!1514038 m!1396761))

(assert (=> b!1514038 m!1396765))

(assert (=> b!1514038 m!1396765))

(declare-fun m!1396781 () Bool)

(assert (=> b!1514038 m!1396781))

(assert (=> b!1514038 m!1396781))

(assert (=> b!1514038 m!1396765))

(declare-fun m!1396783 () Bool)

(assert (=> b!1514038 m!1396783))

(assert (=> b!1514041 m!1396743))

(assert (=> b!1514041 m!1396761))

(assert (=> b!1514041 m!1396765))

(assert (=> b!1514041 m!1396763))

(check-sat (not start!129278) (not b!1514038) (not b!1514036) (not b!1514034) (not b!1514039) (not b!1514030) (not b!1514035) (not b!1514029) (not b!1514033) (not b!1514037) (not b!1514040))
(check-sat)
