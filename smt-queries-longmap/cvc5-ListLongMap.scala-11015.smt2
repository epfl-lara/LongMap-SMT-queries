; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128922 () Bool)

(assert start!128922)

(declare-fun b!1511203 () Bool)

(declare-fun res!1031114 () Bool)

(declare-fun e!843738 () Bool)

(assert (=> b!1511203 (=> (not res!1031114) (not e!843738))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100778 0))(
  ( (array!100779 (arr!48626 (Array (_ BitVec 32) (_ BitVec 64))) (size!49176 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100778)

(declare-datatypes ((SeekEntryResult!12797 0))(
  ( (MissingZero!12797 (index!53583 (_ BitVec 32))) (Found!12797 (index!53584 (_ BitVec 32))) (Intermediate!12797 (undefined!13609 Bool) (index!53585 (_ BitVec 32)) (x!135323 (_ BitVec 32))) (Undefined!12797) (MissingVacant!12797 (index!53586 (_ BitVec 32))) )
))
(declare-fun lt!655378 () SeekEntryResult!12797)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100778 (_ BitVec 32)) SeekEntryResult!12797)

(assert (=> b!1511203 (= res!1031114 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48626 a!2804) j!70) a!2804 mask!2512) lt!655378))))

(declare-fun b!1511204 () Bool)

(assert (=> b!1511204 (= e!843738 (not true))))

(declare-fun e!843737 () Bool)

(assert (=> b!1511204 e!843737))

(declare-fun res!1031108 () Bool)

(assert (=> b!1511204 (=> (not res!1031108) (not e!843737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100778 (_ BitVec 32)) Bool)

(assert (=> b!1511204 (= res!1031108 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50462 0))(
  ( (Unit!50463) )
))
(declare-fun lt!655376 () Unit!50462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50462)

(assert (=> b!1511204 (= lt!655376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511205 () Bool)

(declare-fun res!1031111 () Bool)

(declare-fun e!843736 () Bool)

(assert (=> b!1511205 (=> (not res!1031111) (not e!843736))))

(assert (=> b!1511205 (= res!1031111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511206 () Bool)

(declare-fun res!1031110 () Bool)

(assert (=> b!1511206 (=> (not res!1031110) (not e!843738))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655377 () SeekEntryResult!12797)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511206 (= res!1031110 (= lt!655377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48626 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48626 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100779 (store (arr!48626 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49176 a!2804)) mask!2512)))))

(declare-fun b!1511207 () Bool)

(assert (=> b!1511207 (= e!843736 e!843738)))

(declare-fun res!1031116 () Bool)

(assert (=> b!1511207 (=> (not res!1031116) (not e!843738))))

(assert (=> b!1511207 (= res!1031116 (= lt!655377 lt!655378))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511207 (= lt!655378 (Intermediate!12797 false resIndex!21 resX!21))))

(assert (=> b!1511207 (= lt!655377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48626 a!2804) j!70) mask!2512) (select (arr!48626 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511208 () Bool)

(declare-fun res!1031113 () Bool)

(assert (=> b!1511208 (=> (not res!1031113) (not e!843736))))

(assert (=> b!1511208 (= res!1031113 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49176 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49176 a!2804))))))

(declare-fun b!1511209 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100778 (_ BitVec 32)) SeekEntryResult!12797)

(assert (=> b!1511209 (= e!843737 (= (seekEntry!0 (select (arr!48626 a!2804) j!70) a!2804 mask!2512) (Found!12797 j!70)))))

(declare-fun b!1511210 () Bool)

(declare-fun res!1031109 () Bool)

(assert (=> b!1511210 (=> (not res!1031109) (not e!843736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511210 (= res!1031109 (validKeyInArray!0 (select (arr!48626 a!2804) j!70)))))

(declare-fun b!1511211 () Bool)

(declare-fun res!1031115 () Bool)

(assert (=> b!1511211 (=> (not res!1031115) (not e!843736))))

(assert (=> b!1511211 (= res!1031115 (and (= (size!49176 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49176 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49176 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1031106 () Bool)

(assert (=> start!128922 (=> (not res!1031106) (not e!843736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128922 (= res!1031106 (validMask!0 mask!2512))))

(assert (=> start!128922 e!843736))

(assert (=> start!128922 true))

(declare-fun array_inv!37654 (array!100778) Bool)

(assert (=> start!128922 (array_inv!37654 a!2804)))

(declare-fun b!1511212 () Bool)

(declare-fun res!1031112 () Bool)

(assert (=> b!1511212 (=> (not res!1031112) (not e!843736))))

(declare-datatypes ((List!35109 0))(
  ( (Nil!35106) (Cons!35105 (h!36517 (_ BitVec 64)) (t!49803 List!35109)) )
))
(declare-fun arrayNoDuplicates!0 (array!100778 (_ BitVec 32) List!35109) Bool)

(assert (=> b!1511212 (= res!1031112 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35106))))

(declare-fun b!1511213 () Bool)

(declare-fun res!1031107 () Bool)

(assert (=> b!1511213 (=> (not res!1031107) (not e!843736))))

(assert (=> b!1511213 (= res!1031107 (validKeyInArray!0 (select (arr!48626 a!2804) i!961)))))

(assert (= (and start!128922 res!1031106) b!1511211))

(assert (= (and b!1511211 res!1031115) b!1511213))

(assert (= (and b!1511213 res!1031107) b!1511210))

(assert (= (and b!1511210 res!1031109) b!1511205))

(assert (= (and b!1511205 res!1031111) b!1511212))

(assert (= (and b!1511212 res!1031112) b!1511208))

(assert (= (and b!1511208 res!1031113) b!1511207))

(assert (= (and b!1511207 res!1031116) b!1511203))

(assert (= (and b!1511203 res!1031114) b!1511206))

(assert (= (and b!1511206 res!1031110) b!1511204))

(assert (= (and b!1511204 res!1031108) b!1511209))

(declare-fun m!1393879 () Bool)

(assert (=> b!1511212 m!1393879))

(declare-fun m!1393881 () Bool)

(assert (=> b!1511205 m!1393881))

(declare-fun m!1393883 () Bool)

(assert (=> b!1511206 m!1393883))

(declare-fun m!1393885 () Bool)

(assert (=> b!1511206 m!1393885))

(assert (=> b!1511206 m!1393885))

(declare-fun m!1393887 () Bool)

(assert (=> b!1511206 m!1393887))

(assert (=> b!1511206 m!1393887))

(assert (=> b!1511206 m!1393885))

(declare-fun m!1393889 () Bool)

(assert (=> b!1511206 m!1393889))

(declare-fun m!1393891 () Bool)

(assert (=> b!1511213 m!1393891))

(assert (=> b!1511213 m!1393891))

(declare-fun m!1393893 () Bool)

(assert (=> b!1511213 m!1393893))

(declare-fun m!1393895 () Bool)

(assert (=> b!1511204 m!1393895))

(declare-fun m!1393897 () Bool)

(assert (=> b!1511204 m!1393897))

(declare-fun m!1393899 () Bool)

(assert (=> b!1511207 m!1393899))

(assert (=> b!1511207 m!1393899))

(declare-fun m!1393901 () Bool)

(assert (=> b!1511207 m!1393901))

(assert (=> b!1511207 m!1393901))

(assert (=> b!1511207 m!1393899))

(declare-fun m!1393903 () Bool)

(assert (=> b!1511207 m!1393903))

(assert (=> b!1511209 m!1393899))

(assert (=> b!1511209 m!1393899))

(declare-fun m!1393905 () Bool)

(assert (=> b!1511209 m!1393905))

(declare-fun m!1393907 () Bool)

(assert (=> start!128922 m!1393907))

(declare-fun m!1393909 () Bool)

(assert (=> start!128922 m!1393909))

(assert (=> b!1511210 m!1393899))

(assert (=> b!1511210 m!1393899))

(declare-fun m!1393911 () Bool)

(assert (=> b!1511210 m!1393911))

(assert (=> b!1511203 m!1393899))

(assert (=> b!1511203 m!1393899))

(declare-fun m!1393913 () Bool)

(assert (=> b!1511203 m!1393913))

(push 1)

