; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128756 () Bool)

(assert start!128756)

(declare-fun b!1508998 () Bool)

(declare-fun res!1029107 () Bool)

(declare-fun e!842854 () Bool)

(assert (=> b!1508998 (=> (not res!1029107) (not e!842854))))

(declare-datatypes ((array!100612 0))(
  ( (array!100613 (arr!48544 (Array (_ BitVec 32) (_ BitVec 64))) (size!49096 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100612)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100612 (_ BitVec 32)) Bool)

(assert (=> b!1508998 (= res!1029107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508999 () Bool)

(declare-fun res!1029110 () Bool)

(assert (=> b!1508999 (=> (not res!1029110) (not e!842854))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508999 (= res!1029110 (and (= (size!49096 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49096 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49096 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509000 () Bool)

(declare-fun e!842856 () Bool)

(assert (=> b!1509000 (= e!842856 (not true))))

(assert (=> b!1509000 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50183 0))(
  ( (Unit!50184) )
))
(declare-fun lt!654570 () Unit!50183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50183)

(assert (=> b!1509000 (= lt!654570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509001 () Bool)

(declare-fun res!1029109 () Bool)

(assert (=> b!1509001 (=> (not res!1029109) (not e!842856))))

(declare-datatypes ((SeekEntryResult!12738 0))(
  ( (MissingZero!12738 (index!53347 (_ BitVec 32))) (Found!12738 (index!53348 (_ BitVec 32))) (Intermediate!12738 (undefined!13550 Bool) (index!53349 (_ BitVec 32)) (x!135106 (_ BitVec 32))) (Undefined!12738) (MissingVacant!12738 (index!53350 (_ BitVec 32))) )
))
(declare-fun lt!654568 () SeekEntryResult!12738)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100612 (_ BitVec 32)) SeekEntryResult!12738)

(assert (=> b!1509001 (= res!1029109 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48544 a!2804) j!70) a!2804 mask!2512) lt!654568))))

(declare-fun b!1509002 () Bool)

(assert (=> b!1509002 (= e!842854 e!842856)))

(declare-fun res!1029112 () Bool)

(assert (=> b!1509002 (=> (not res!1029112) (not e!842856))))

(declare-fun lt!654569 () SeekEntryResult!12738)

(assert (=> b!1509002 (= res!1029112 (= lt!654569 lt!654568))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509002 (= lt!654568 (Intermediate!12738 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509002 (= lt!654569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48544 a!2804) j!70) mask!2512) (select (arr!48544 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509003 () Bool)

(declare-fun res!1029115 () Bool)

(assert (=> b!1509003 (=> (not res!1029115) (not e!842856))))

(assert (=> b!1509003 (= res!1029115 (= lt!654569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48544 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48544 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100613 (store (arr!48544 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49096 a!2804)) mask!2512)))))

(declare-fun b!1509005 () Bool)

(declare-fun res!1029113 () Bool)

(assert (=> b!1509005 (=> (not res!1029113) (not e!842854))))

(declare-datatypes ((List!35105 0))(
  ( (Nil!35102) (Cons!35101 (h!36514 (_ BitVec 64)) (t!49791 List!35105)) )
))
(declare-fun arrayNoDuplicates!0 (array!100612 (_ BitVec 32) List!35105) Bool)

(assert (=> b!1509005 (= res!1029113 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35102))))

(declare-fun b!1509004 () Bool)

(declare-fun res!1029116 () Bool)

(assert (=> b!1509004 (=> (not res!1029116) (not e!842854))))

(assert (=> b!1509004 (= res!1029116 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49096 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49096 a!2804))))))

(declare-fun res!1029114 () Bool)

(assert (=> start!128756 (=> (not res!1029114) (not e!842854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128756 (= res!1029114 (validMask!0 mask!2512))))

(assert (=> start!128756 e!842854))

(assert (=> start!128756 true))

(declare-fun array_inv!37777 (array!100612) Bool)

(assert (=> start!128756 (array_inv!37777 a!2804)))

(declare-fun b!1509006 () Bool)

(declare-fun res!1029111 () Bool)

(assert (=> b!1509006 (=> (not res!1029111) (not e!842854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509006 (= res!1029111 (validKeyInArray!0 (select (arr!48544 a!2804) i!961)))))

(declare-fun b!1509007 () Bool)

(declare-fun res!1029108 () Bool)

(assert (=> b!1509007 (=> (not res!1029108) (not e!842854))))

(assert (=> b!1509007 (= res!1029108 (validKeyInArray!0 (select (arr!48544 a!2804) j!70)))))

(assert (= (and start!128756 res!1029114) b!1508999))

(assert (= (and b!1508999 res!1029110) b!1509006))

(assert (= (and b!1509006 res!1029111) b!1509007))

(assert (= (and b!1509007 res!1029108) b!1508998))

(assert (= (and b!1508998 res!1029107) b!1509005))

(assert (= (and b!1509005 res!1029113) b!1509004))

(assert (= (and b!1509004 res!1029116) b!1509002))

(assert (= (and b!1509002 res!1029112) b!1509001))

(assert (= (and b!1509001 res!1029109) b!1509003))

(assert (= (and b!1509003 res!1029115) b!1509000))

(declare-fun m!1390895 () Bool)

(assert (=> start!128756 m!1390895))

(declare-fun m!1390897 () Bool)

(assert (=> start!128756 m!1390897))

(declare-fun m!1390899 () Bool)

(assert (=> b!1508998 m!1390899))

(declare-fun m!1390901 () Bool)

(assert (=> b!1509001 m!1390901))

(assert (=> b!1509001 m!1390901))

(declare-fun m!1390903 () Bool)

(assert (=> b!1509001 m!1390903))

(assert (=> b!1509002 m!1390901))

(assert (=> b!1509002 m!1390901))

(declare-fun m!1390905 () Bool)

(assert (=> b!1509002 m!1390905))

(assert (=> b!1509002 m!1390905))

(assert (=> b!1509002 m!1390901))

(declare-fun m!1390907 () Bool)

(assert (=> b!1509002 m!1390907))

(declare-fun m!1390909 () Bool)

(assert (=> b!1509000 m!1390909))

(declare-fun m!1390911 () Bool)

(assert (=> b!1509000 m!1390911))

(declare-fun m!1390913 () Bool)

(assert (=> b!1509003 m!1390913))

(declare-fun m!1390915 () Bool)

(assert (=> b!1509003 m!1390915))

(assert (=> b!1509003 m!1390915))

(declare-fun m!1390917 () Bool)

(assert (=> b!1509003 m!1390917))

(assert (=> b!1509003 m!1390917))

(assert (=> b!1509003 m!1390915))

(declare-fun m!1390919 () Bool)

(assert (=> b!1509003 m!1390919))

(declare-fun m!1390921 () Bool)

(assert (=> b!1509005 m!1390921))

(assert (=> b!1509007 m!1390901))

(assert (=> b!1509007 m!1390901))

(declare-fun m!1390923 () Bool)

(assert (=> b!1509007 m!1390923))

(declare-fun m!1390925 () Bool)

(assert (=> b!1509006 m!1390925))

(assert (=> b!1509006 m!1390925))

(declare-fun m!1390927 () Bool)

(assert (=> b!1509006 m!1390927))

(check-sat (not b!1509006) (not b!1508998) (not b!1509003) (not b!1509007) (not b!1509005) (not start!128756) (not b!1509002) (not b!1509001) (not b!1509000))
(check-sat)
