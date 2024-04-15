; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125020 () Bool)

(assert start!125020)

(declare-fun res!985914 () Bool)

(declare-fun e!818805 () Bool)

(assert (=> start!125020 (=> (not res!985914) (not e!818805))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125020 (= res!985914 (validMask!0 mask!2687))))

(assert (=> start!125020 e!818805))

(assert (=> start!125020 true))

(declare-datatypes ((array!98446 0))(
  ( (array!98447 (arr!47512 (Array (_ BitVec 32) (_ BitVec 64))) (size!48064 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98446)

(declare-fun array_inv!36745 (array!98446) Bool)

(assert (=> start!125020 (array_inv!36745 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455099 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!818798 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455099 (= e!818798 (and (or (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) (select (arr!47512 a!2862) j!93))) (let ((bdg!53143 (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47512 a!2862) index!646) bdg!53143) (= (select (arr!47512 a!2862) index!646) (select (arr!47512 a!2862) j!93))) (= (select (arr!47512 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53143 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455100 () Bool)

(declare-fun e!818802 () Bool)

(declare-fun e!818800 () Bool)

(assert (=> b!1455100 (= e!818802 e!818800)))

(declare-fun res!985921 () Bool)

(assert (=> b!1455100 (=> res!985921 e!818800)))

(declare-fun lt!637670 () (_ BitVec 32))

(assert (=> b!1455100 (= res!985921 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637670 #b00000000000000000000000000000000) (bvsge lt!637670 (size!48064 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455100 (= lt!637670 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637664 () array!98446)

(declare-fun lt!637666 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11789 0))(
  ( (MissingZero!11789 (index!49548 (_ BitVec 32))) (Found!11789 (index!49549 (_ BitVec 32))) (Intermediate!11789 (undefined!12601 Bool) (index!49550 (_ BitVec 32)) (x!131177 (_ BitVec 32))) (Undefined!11789) (MissingVacant!11789 (index!49551 (_ BitVec 32))) )
))
(declare-fun lt!637668 () SeekEntryResult!11789)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11789)

(assert (=> b!1455100 (= lt!637668 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637666 lt!637664 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11789)

(assert (=> b!1455100 (= lt!637668 (seekEntryOrOpen!0 lt!637666 lt!637664 mask!2687))))

(declare-fun b!1455101 () Bool)

(declare-fun e!818799 () Bool)

(assert (=> b!1455101 (= e!818799 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637670 intermediateAfterIndex!19 lt!637666 lt!637664 mask!2687) lt!637668)))))

(declare-fun b!1455102 () Bool)

(declare-fun e!818803 () Bool)

(assert (=> b!1455102 (= e!818805 e!818803)))

(declare-fun res!985923 () Bool)

(assert (=> b!1455102 (=> (not res!985923) (not e!818803))))

(assert (=> b!1455102 (= res!985923 (= (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455102 (= lt!637664 (array!98447 (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48064 a!2862)))))

(declare-fun b!1455103 () Bool)

(declare-fun lt!637667 () SeekEntryResult!11789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98446 (_ BitVec 32)) SeekEntryResult!11789)

(assert (=> b!1455103 (= e!818799 (not (= lt!637667 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637670 lt!637666 lt!637664 mask!2687))))))

(declare-fun b!1455104 () Bool)

(declare-fun e!818797 () Bool)

(assert (=> b!1455104 (= e!818797 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637666 lt!637664 mask!2687) (seekEntryOrOpen!0 lt!637666 lt!637664 mask!2687)))))

(declare-fun b!1455105 () Bool)

(declare-fun e!818804 () Bool)

(declare-fun e!818801 () Bool)

(assert (=> b!1455105 (= e!818804 e!818801)))

(declare-fun res!985920 () Bool)

(assert (=> b!1455105 (=> (not res!985920) (not e!818801))))

(assert (=> b!1455105 (= res!985920 (= lt!637667 (Intermediate!11789 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455105 (= lt!637667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637666 mask!2687) lt!637666 lt!637664 mask!2687))))

(assert (=> b!1455105 (= lt!637666 (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455106 () Bool)

(declare-fun res!985910 () Bool)

(assert (=> b!1455106 (=> (not res!985910) (not e!818805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98446 (_ BitVec 32)) Bool)

(assert (=> b!1455106 (= res!985910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455107 () Bool)

(assert (=> b!1455107 (= e!818797 (= lt!637667 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637666 lt!637664 mask!2687)))))

(declare-fun b!1455108 () Bool)

(assert (=> b!1455108 (= e!818800 true)))

(declare-fun lt!637669 () Bool)

(assert (=> b!1455108 (= lt!637669 e!818799)))

(declare-fun c!134109 () Bool)

(assert (=> b!1455108 (= c!134109 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455109 () Bool)

(declare-fun res!985924 () Bool)

(assert (=> b!1455109 (=> (not res!985924) (not e!818798))))

(assert (=> b!1455109 (= res!985924 (= (seekEntryOrOpen!0 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) (Found!11789 j!93)))))

(declare-fun b!1455110 () Bool)

(declare-fun res!985907 () Bool)

(assert (=> b!1455110 (=> (not res!985907) (not e!818805))))

(assert (=> b!1455110 (= res!985907 (and (= (size!48064 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48064 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48064 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455111 () Bool)

(declare-fun res!985919 () Bool)

(assert (=> b!1455111 (=> (not res!985919) (not e!818804))))

(declare-fun lt!637671 () SeekEntryResult!11789)

(assert (=> b!1455111 (= res!985919 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!637671))))

(declare-fun b!1455112 () Bool)

(declare-fun res!985922 () Bool)

(assert (=> b!1455112 (=> (not res!985922) (not e!818805))))

(declare-datatypes ((List!34091 0))(
  ( (Nil!34088) (Cons!34087 (h!35437 (_ BitVec 64)) (t!48777 List!34091)) )
))
(declare-fun arrayNoDuplicates!0 (array!98446 (_ BitVec 32) List!34091) Bool)

(assert (=> b!1455112 (= res!985922 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34088))))

(declare-fun b!1455113 () Bool)

(declare-fun res!985918 () Bool)

(assert (=> b!1455113 (=> (not res!985918) (not e!818805))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455113 (= res!985918 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48064 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48064 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48064 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455114 () Bool)

(declare-fun res!985915 () Bool)

(assert (=> b!1455114 (=> (not res!985915) (not e!818801))))

(assert (=> b!1455114 (= res!985915 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455115 () Bool)

(assert (=> b!1455115 (= e!818801 (not e!818802))))

(declare-fun res!985917 () Bool)

(assert (=> b!1455115 (=> res!985917 e!818802)))

(assert (=> b!1455115 (= res!985917 (or (and (= (select (arr!47512 a!2862) index!646) (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47512 a!2862) index!646) (select (arr!47512 a!2862) j!93))) (= (select (arr!47512 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455115 e!818798))

(declare-fun res!985911 () Bool)

(assert (=> b!1455115 (=> (not res!985911) (not e!818798))))

(assert (=> b!1455115 (= res!985911 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48915 0))(
  ( (Unit!48916) )
))
(declare-fun lt!637665 () Unit!48915)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48915)

(assert (=> b!1455115 (= lt!637665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455116 () Bool)

(declare-fun res!985916 () Bool)

(assert (=> b!1455116 (=> res!985916 e!818800)))

(assert (=> b!1455116 (= res!985916 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637670 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!637671)))))

(declare-fun b!1455117 () Bool)

(declare-fun res!985908 () Bool)

(assert (=> b!1455117 (=> (not res!985908) (not e!818805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455117 (= res!985908 (validKeyInArray!0 (select (arr!47512 a!2862) j!93)))))

(declare-fun b!1455118 () Bool)

(assert (=> b!1455118 (= e!818803 e!818804)))

(declare-fun res!985909 () Bool)

(assert (=> b!1455118 (=> (not res!985909) (not e!818804))))

(assert (=> b!1455118 (= res!985909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47512 a!2862) j!93) mask!2687) (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!637671))))

(assert (=> b!1455118 (= lt!637671 (Intermediate!11789 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455119 () Bool)

(declare-fun res!985913 () Bool)

(assert (=> b!1455119 (=> (not res!985913) (not e!818805))))

(assert (=> b!1455119 (= res!985913 (validKeyInArray!0 (select (arr!47512 a!2862) i!1006)))))

(declare-fun b!1455120 () Bool)

(declare-fun res!985912 () Bool)

(assert (=> b!1455120 (=> (not res!985912) (not e!818801))))

(assert (=> b!1455120 (= res!985912 e!818797)))

(declare-fun c!134110 () Bool)

(assert (=> b!1455120 (= c!134110 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125020 res!985914) b!1455110))

(assert (= (and b!1455110 res!985907) b!1455119))

(assert (= (and b!1455119 res!985913) b!1455117))

(assert (= (and b!1455117 res!985908) b!1455106))

(assert (= (and b!1455106 res!985910) b!1455112))

(assert (= (and b!1455112 res!985922) b!1455113))

(assert (= (and b!1455113 res!985918) b!1455102))

(assert (= (and b!1455102 res!985923) b!1455118))

(assert (= (and b!1455118 res!985909) b!1455111))

(assert (= (and b!1455111 res!985919) b!1455105))

(assert (= (and b!1455105 res!985920) b!1455120))

(assert (= (and b!1455120 c!134110) b!1455107))

(assert (= (and b!1455120 (not c!134110)) b!1455104))

(assert (= (and b!1455120 res!985912) b!1455114))

(assert (= (and b!1455114 res!985915) b!1455115))

(assert (= (and b!1455115 res!985911) b!1455109))

(assert (= (and b!1455109 res!985924) b!1455099))

(assert (= (and b!1455115 (not res!985917)) b!1455100))

(assert (= (and b!1455100 (not res!985921)) b!1455116))

(assert (= (and b!1455116 (not res!985916)) b!1455108))

(assert (= (and b!1455108 c!134109) b!1455103))

(assert (= (and b!1455108 (not c!134109)) b!1455101))

(declare-fun m!1342857 () Bool)

(assert (=> b!1455101 m!1342857))

(declare-fun m!1342859 () Bool)

(assert (=> b!1455119 m!1342859))

(assert (=> b!1455119 m!1342859))

(declare-fun m!1342861 () Bool)

(assert (=> b!1455119 m!1342861))

(declare-fun m!1342863 () Bool)

(assert (=> b!1455106 m!1342863))

(declare-fun m!1342865 () Bool)

(assert (=> b!1455117 m!1342865))

(assert (=> b!1455117 m!1342865))

(declare-fun m!1342867 () Bool)

(assert (=> b!1455117 m!1342867))

(assert (=> b!1455116 m!1342865))

(assert (=> b!1455116 m!1342865))

(declare-fun m!1342869 () Bool)

(assert (=> b!1455116 m!1342869))

(assert (=> b!1455111 m!1342865))

(assert (=> b!1455111 m!1342865))

(declare-fun m!1342871 () Bool)

(assert (=> b!1455111 m!1342871))

(declare-fun m!1342873 () Bool)

(assert (=> b!1455107 m!1342873))

(declare-fun m!1342875 () Bool)

(assert (=> b!1455102 m!1342875))

(declare-fun m!1342877 () Bool)

(assert (=> b!1455102 m!1342877))

(assert (=> b!1455109 m!1342865))

(assert (=> b!1455109 m!1342865))

(declare-fun m!1342879 () Bool)

(assert (=> b!1455109 m!1342879))

(declare-fun m!1342881 () Bool)

(assert (=> b!1455105 m!1342881))

(assert (=> b!1455105 m!1342881))

(declare-fun m!1342883 () Bool)

(assert (=> b!1455105 m!1342883))

(assert (=> b!1455105 m!1342875))

(declare-fun m!1342885 () Bool)

(assert (=> b!1455105 m!1342885))

(declare-fun m!1342887 () Bool)

(assert (=> b!1455100 m!1342887))

(declare-fun m!1342889 () Bool)

(assert (=> b!1455100 m!1342889))

(declare-fun m!1342891 () Bool)

(assert (=> b!1455100 m!1342891))

(assert (=> b!1455099 m!1342875))

(declare-fun m!1342893 () Bool)

(assert (=> b!1455099 m!1342893))

(declare-fun m!1342895 () Bool)

(assert (=> b!1455099 m!1342895))

(declare-fun m!1342897 () Bool)

(assert (=> b!1455099 m!1342897))

(assert (=> b!1455099 m!1342865))

(declare-fun m!1342899 () Bool)

(assert (=> b!1455115 m!1342899))

(assert (=> b!1455115 m!1342875))

(assert (=> b!1455115 m!1342895))

(assert (=> b!1455115 m!1342897))

(declare-fun m!1342901 () Bool)

(assert (=> b!1455115 m!1342901))

(assert (=> b!1455115 m!1342865))

(declare-fun m!1342903 () Bool)

(assert (=> start!125020 m!1342903))

(declare-fun m!1342905 () Bool)

(assert (=> start!125020 m!1342905))

(declare-fun m!1342907 () Bool)

(assert (=> b!1455103 m!1342907))

(assert (=> b!1455118 m!1342865))

(assert (=> b!1455118 m!1342865))

(declare-fun m!1342909 () Bool)

(assert (=> b!1455118 m!1342909))

(assert (=> b!1455118 m!1342909))

(assert (=> b!1455118 m!1342865))

(declare-fun m!1342911 () Bool)

(assert (=> b!1455118 m!1342911))

(declare-fun m!1342913 () Bool)

(assert (=> b!1455112 m!1342913))

(assert (=> b!1455104 m!1342889))

(assert (=> b!1455104 m!1342891))

(check-sat (not b!1455103) (not b!1455119) (not b!1455112) (not start!125020) (not b!1455117) (not b!1455101) (not b!1455111) (not b!1455115) (not b!1455104) (not b!1455100) (not b!1455105) (not b!1455109) (not b!1455118) (not b!1455106) (not b!1455116) (not b!1455107))
(check-sat)
