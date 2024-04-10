; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128976 () Bool)

(assert start!128976)

(declare-fun b!1512197 () Bool)

(declare-fun res!1032108 () Bool)

(declare-fun e!844118 () Bool)

(assert (=> b!1512197 (=> (not res!1032108) (not e!844118))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100832 0))(
  ( (array!100833 (arr!48653 (Array (_ BitVec 32) (_ BitVec 64))) (size!49203 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100832)

(assert (=> b!1512197 (= res!1032108 (and (= (size!49203 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49203 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49203 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512198 () Bool)

(declare-fun res!1032112 () Bool)

(assert (=> b!1512198 (=> (not res!1032112) (not e!844118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100832 (_ BitVec 32)) Bool)

(assert (=> b!1512198 (= res!1032112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun b!1512199 () Bool)

(declare-fun e!844119 () Bool)

(assert (=> b!1512199 (= e!844119 (not (or (not (= (select (arr!48653 a!2804) j!70) (select (store (arr!48653 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48653 a!2804) index!487) (select (arr!48653 a!2804) j!70)) (not (= (select (arr!48653 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!844120 () Bool)

(assert (=> b!1512199 e!844120))

(declare-fun res!1032104 () Bool)

(assert (=> b!1512199 (=> (not res!1032104) (not e!844120))))

(assert (=> b!1512199 (= res!1032104 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50516 0))(
  ( (Unit!50517) )
))
(declare-fun lt!655620 () Unit!50516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50516)

(assert (=> b!1512199 (= lt!655620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512200 () Bool)

(declare-fun res!1032101 () Bool)

(assert (=> b!1512200 (=> (not res!1032101) (not e!844119))))

(declare-datatypes ((SeekEntryResult!12824 0))(
  ( (MissingZero!12824 (index!53691 (_ BitVec 32))) (Found!12824 (index!53692 (_ BitVec 32))) (Intermediate!12824 (undefined!13636 Bool) (index!53693 (_ BitVec 32)) (x!135422 (_ BitVec 32))) (Undefined!12824) (MissingVacant!12824 (index!53694 (_ BitVec 32))) )
))
(declare-fun lt!655621 () SeekEntryResult!12824)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100832 (_ BitVec 32)) SeekEntryResult!12824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512200 (= res!1032101 (= lt!655621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48653 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48653 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100833 (store (arr!48653 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49203 a!2804)) mask!2512)))))

(declare-fun b!1512202 () Bool)

(assert (=> b!1512202 (= e!844118 e!844119)))

(declare-fun res!1032109 () Bool)

(assert (=> b!1512202 (=> (not res!1032109) (not e!844119))))

(declare-fun lt!655619 () SeekEntryResult!12824)

(assert (=> b!1512202 (= res!1032109 (= lt!655621 lt!655619))))

(assert (=> b!1512202 (= lt!655619 (Intermediate!12824 false resIndex!21 resX!21))))

(assert (=> b!1512202 (= lt!655621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48653 a!2804) j!70) mask!2512) (select (arr!48653 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512203 () Bool)

(declare-fun res!1032111 () Bool)

(assert (=> b!1512203 (=> (not res!1032111) (not e!844120))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100832 (_ BitVec 32)) SeekEntryResult!12824)

(assert (=> b!1512203 (= res!1032111 (= (seekEntry!0 (select (arr!48653 a!2804) j!70) a!2804 mask!2512) (Found!12824 j!70)))))

(declare-fun b!1512204 () Bool)

(declare-fun res!1032107 () Bool)

(assert (=> b!1512204 (=> (not res!1032107) (not e!844118))))

(declare-datatypes ((List!35136 0))(
  ( (Nil!35133) (Cons!35132 (h!36544 (_ BitVec 64)) (t!49830 List!35136)) )
))
(declare-fun arrayNoDuplicates!0 (array!100832 (_ BitVec 32) List!35136) Bool)

(assert (=> b!1512204 (= res!1032107 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35133))))

(declare-fun b!1512205 () Bool)

(declare-fun res!1032103 () Bool)

(assert (=> b!1512205 (=> (not res!1032103) (not e!844119))))

(assert (=> b!1512205 (= res!1032103 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48653 a!2804) j!70) a!2804 mask!2512) lt!655619))))

(declare-fun b!1512206 () Bool)

(declare-fun res!1032105 () Bool)

(assert (=> b!1512206 (=> (not res!1032105) (not e!844118))))

(assert (=> b!1512206 (= res!1032105 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49203 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49203 a!2804))))))

(declare-fun b!1512207 () Bool)

(declare-fun res!1032100 () Bool)

(assert (=> b!1512207 (=> (not res!1032100) (not e!844118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512207 (= res!1032100 (validKeyInArray!0 (select (arr!48653 a!2804) i!961)))))

(declare-fun b!1512201 () Bool)

(declare-fun res!1032106 () Bool)

(assert (=> b!1512201 (=> (not res!1032106) (not e!844118))))

(assert (=> b!1512201 (= res!1032106 (validKeyInArray!0 (select (arr!48653 a!2804) j!70)))))

(declare-fun res!1032110 () Bool)

(assert (=> start!128976 (=> (not res!1032110) (not e!844118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128976 (= res!1032110 (validMask!0 mask!2512))))

(assert (=> start!128976 e!844118))

(assert (=> start!128976 true))

(declare-fun array_inv!37681 (array!100832) Bool)

(assert (=> start!128976 (array_inv!37681 a!2804)))

(declare-fun b!1512208 () Bool)

(declare-fun e!844116 () Bool)

(assert (=> b!1512208 (= e!844120 e!844116)))

(declare-fun res!1032102 () Bool)

(assert (=> b!1512208 (=> res!1032102 e!844116)))

(assert (=> b!1512208 (= res!1032102 (or (not (= (select (arr!48653 a!2804) j!70) (select (store (arr!48653 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48653 a!2804) index!487) (select (arr!48653 a!2804) j!70)) (not (= (select (arr!48653 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512209 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100832 (_ BitVec 32)) SeekEntryResult!12824)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100832 (_ BitVec 32)) SeekEntryResult!12824)

(assert (=> b!1512209 (= e!844116 (= (seekEntryOrOpen!0 (select (arr!48653 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48653 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!128976 res!1032110) b!1512197))

(assert (= (and b!1512197 res!1032108) b!1512207))

(assert (= (and b!1512207 res!1032100) b!1512201))

(assert (= (and b!1512201 res!1032106) b!1512198))

(assert (= (and b!1512198 res!1032112) b!1512204))

(assert (= (and b!1512204 res!1032107) b!1512206))

(assert (= (and b!1512206 res!1032105) b!1512202))

(assert (= (and b!1512202 res!1032109) b!1512205))

(assert (= (and b!1512205 res!1032103) b!1512200))

(assert (= (and b!1512200 res!1032101) b!1512199))

(assert (= (and b!1512199 res!1032104) b!1512203))

(assert (= (and b!1512203 res!1032111) b!1512208))

(assert (= (and b!1512208 (not res!1032102)) b!1512209))

(declare-fun m!1394947 () Bool)

(assert (=> b!1512202 m!1394947))

(assert (=> b!1512202 m!1394947))

(declare-fun m!1394949 () Bool)

(assert (=> b!1512202 m!1394949))

(assert (=> b!1512202 m!1394949))

(assert (=> b!1512202 m!1394947))

(declare-fun m!1394951 () Bool)

(assert (=> b!1512202 m!1394951))

(assert (=> b!1512209 m!1394947))

(assert (=> b!1512209 m!1394947))

(declare-fun m!1394953 () Bool)

(assert (=> b!1512209 m!1394953))

(assert (=> b!1512209 m!1394947))

(declare-fun m!1394955 () Bool)

(assert (=> b!1512209 m!1394955))

(declare-fun m!1394957 () Bool)

(assert (=> b!1512200 m!1394957))

(declare-fun m!1394959 () Bool)

(assert (=> b!1512200 m!1394959))

(assert (=> b!1512200 m!1394959))

(declare-fun m!1394961 () Bool)

(assert (=> b!1512200 m!1394961))

(assert (=> b!1512200 m!1394961))

(assert (=> b!1512200 m!1394959))

(declare-fun m!1394963 () Bool)

(assert (=> b!1512200 m!1394963))

(assert (=> b!1512203 m!1394947))

(assert (=> b!1512203 m!1394947))

(declare-fun m!1394965 () Bool)

(assert (=> b!1512203 m!1394965))

(assert (=> b!1512208 m!1394947))

(assert (=> b!1512208 m!1394957))

(assert (=> b!1512208 m!1394959))

(declare-fun m!1394967 () Bool)

(assert (=> b!1512208 m!1394967))

(assert (=> b!1512201 m!1394947))

(assert (=> b!1512201 m!1394947))

(declare-fun m!1394969 () Bool)

(assert (=> b!1512201 m!1394969))

(assert (=> b!1512205 m!1394947))

(assert (=> b!1512205 m!1394947))

(declare-fun m!1394971 () Bool)

(assert (=> b!1512205 m!1394971))

(assert (=> b!1512199 m!1394947))

(declare-fun m!1394973 () Bool)

(assert (=> b!1512199 m!1394973))

(assert (=> b!1512199 m!1394957))

(assert (=> b!1512199 m!1394967))

(assert (=> b!1512199 m!1394959))

(declare-fun m!1394975 () Bool)

(assert (=> b!1512199 m!1394975))

(declare-fun m!1394977 () Bool)

(assert (=> b!1512207 m!1394977))

(assert (=> b!1512207 m!1394977))

(declare-fun m!1394979 () Bool)

(assert (=> b!1512207 m!1394979))

(declare-fun m!1394981 () Bool)

(assert (=> b!1512198 m!1394981))

(declare-fun m!1394983 () Bool)

(assert (=> b!1512204 m!1394983))

(declare-fun m!1394985 () Bool)

(assert (=> start!128976 m!1394985))

(declare-fun m!1394987 () Bool)

(assert (=> start!128976 m!1394987))

(push 1)

