; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128864 () Bool)

(assert start!128864)

(declare-fun b!1510237 () Bool)

(declare-fun res!1030141 () Bool)

(declare-fun e!843381 () Bool)

(assert (=> b!1510237 (=> (not res!1030141) (not e!843381))))

(declare-datatypes ((array!100720 0))(
  ( (array!100721 (arr!48597 (Array (_ BitVec 32) (_ BitVec 64))) (size!49147 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100720)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100720 (_ BitVec 32)) Bool)

(assert (=> b!1510237 (= res!1030141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510238 () Bool)

(declare-fun e!843382 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12768 0))(
  ( (MissingZero!12768 (index!53467 (_ BitVec 32))) (Found!12768 (index!53468 (_ BitVec 32))) (Intermediate!12768 (undefined!13580 Bool) (index!53469 (_ BitVec 32)) (x!135214 (_ BitVec 32))) (Undefined!12768) (MissingVacant!12768 (index!53470 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100720 (_ BitVec 32)) SeekEntryResult!12768)

(assert (=> b!1510238 (= e!843382 (= (seekEntry!0 (select (arr!48597 a!2804) j!70) a!2804 mask!2512) (Found!12768 j!70)))))

(declare-fun b!1510239 () Bool)

(declare-fun res!1030147 () Bool)

(declare-fun e!843380 () Bool)

(assert (=> b!1510239 (=> (not res!1030147) (not e!843380))))

(declare-fun lt!655116 () SeekEntryResult!12768)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100720 (_ BitVec 32)) SeekEntryResult!12768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510239 (= res!1030147 (= lt!655116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48597 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48597 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100721 (store (arr!48597 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49147 a!2804)) mask!2512)))))

(declare-fun b!1510240 () Bool)

(declare-fun res!1030149 () Bool)

(assert (=> b!1510240 (=> (not res!1030149) (not e!843381))))

(assert (=> b!1510240 (= res!1030149 (and (= (size!49147 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49147 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49147 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510241 () Bool)

(declare-fun res!1030144 () Bool)

(assert (=> b!1510241 (=> (not res!1030144) (not e!843381))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510241 (= res!1030144 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49147 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49147 a!2804))))))

(declare-fun b!1510242 () Bool)

(declare-fun res!1030142 () Bool)

(assert (=> b!1510242 (=> (not res!1030142) (not e!843381))))

(declare-datatypes ((List!35080 0))(
  ( (Nil!35077) (Cons!35076 (h!36488 (_ BitVec 64)) (t!49774 List!35080)) )
))
(declare-fun arrayNoDuplicates!0 (array!100720 (_ BitVec 32) List!35080) Bool)

(assert (=> b!1510242 (= res!1030142 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35077))))

(declare-fun b!1510243 () Bool)

(assert (=> b!1510243 (= e!843381 e!843380)))

(declare-fun res!1030150 () Bool)

(assert (=> b!1510243 (=> (not res!1030150) (not e!843380))))

(declare-fun lt!655117 () SeekEntryResult!12768)

(assert (=> b!1510243 (= res!1030150 (= lt!655116 lt!655117))))

(assert (=> b!1510243 (= lt!655117 (Intermediate!12768 false resIndex!21 resX!21))))

(assert (=> b!1510243 (= lt!655116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48597 a!2804) j!70) mask!2512) (select (arr!48597 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510244 () Bool)

(declare-fun res!1030148 () Bool)

(assert (=> b!1510244 (=> (not res!1030148) (not e!843381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510244 (= res!1030148 (validKeyInArray!0 (select (arr!48597 a!2804) j!70)))))

(declare-fun res!1030143 () Bool)

(assert (=> start!128864 (=> (not res!1030143) (not e!843381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128864 (= res!1030143 (validMask!0 mask!2512))))

(assert (=> start!128864 e!843381))

(assert (=> start!128864 true))

(declare-fun array_inv!37625 (array!100720) Bool)

(assert (=> start!128864 (array_inv!37625 a!2804)))

(declare-fun b!1510245 () Bool)

(declare-fun res!1030145 () Bool)

(assert (=> b!1510245 (=> (not res!1030145) (not e!843381))))

(assert (=> b!1510245 (= res!1030145 (validKeyInArray!0 (select (arr!48597 a!2804) i!961)))))

(declare-fun b!1510246 () Bool)

(assert (=> b!1510246 (= e!843380 (not true))))

(assert (=> b!1510246 e!843382))

(declare-fun res!1030140 () Bool)

(assert (=> b!1510246 (=> (not res!1030140) (not e!843382))))

(assert (=> b!1510246 (= res!1030140 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50404 0))(
  ( (Unit!50405) )
))
(declare-fun lt!655115 () Unit!50404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50404)

(assert (=> b!1510246 (= lt!655115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510247 () Bool)

(declare-fun res!1030146 () Bool)

(assert (=> b!1510247 (=> (not res!1030146) (not e!843380))))

(assert (=> b!1510247 (= res!1030146 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48597 a!2804) j!70) a!2804 mask!2512) lt!655117))))

(assert (= (and start!128864 res!1030143) b!1510240))

(assert (= (and b!1510240 res!1030149) b!1510245))

(assert (= (and b!1510245 res!1030145) b!1510244))

(assert (= (and b!1510244 res!1030148) b!1510237))

(assert (= (and b!1510237 res!1030141) b!1510242))

(assert (= (and b!1510242 res!1030142) b!1510241))

(assert (= (and b!1510241 res!1030144) b!1510243))

(assert (= (and b!1510243 res!1030150) b!1510247))

(assert (= (and b!1510247 res!1030146) b!1510239))

(assert (= (and b!1510239 res!1030147) b!1510246))

(assert (= (and b!1510246 res!1030140) b!1510238))

(declare-fun m!1392805 () Bool)

(assert (=> b!1510242 m!1392805))

(declare-fun m!1392807 () Bool)

(assert (=> b!1510243 m!1392807))

(assert (=> b!1510243 m!1392807))

(declare-fun m!1392809 () Bool)

(assert (=> b!1510243 m!1392809))

(assert (=> b!1510243 m!1392809))

(assert (=> b!1510243 m!1392807))

(declare-fun m!1392811 () Bool)

(assert (=> b!1510243 m!1392811))

(declare-fun m!1392813 () Bool)

(assert (=> b!1510246 m!1392813))

(declare-fun m!1392815 () Bool)

(assert (=> b!1510246 m!1392815))

(assert (=> b!1510238 m!1392807))

(assert (=> b!1510238 m!1392807))

(declare-fun m!1392817 () Bool)

(assert (=> b!1510238 m!1392817))

(declare-fun m!1392819 () Bool)

(assert (=> b!1510245 m!1392819))

(assert (=> b!1510245 m!1392819))

(declare-fun m!1392821 () Bool)

(assert (=> b!1510245 m!1392821))

(declare-fun m!1392823 () Bool)

(assert (=> b!1510239 m!1392823))

(declare-fun m!1392825 () Bool)

(assert (=> b!1510239 m!1392825))

(assert (=> b!1510239 m!1392825))

(declare-fun m!1392827 () Bool)

(assert (=> b!1510239 m!1392827))

(assert (=> b!1510239 m!1392827))

(assert (=> b!1510239 m!1392825))

(declare-fun m!1392829 () Bool)

(assert (=> b!1510239 m!1392829))

(assert (=> b!1510247 m!1392807))

(assert (=> b!1510247 m!1392807))

(declare-fun m!1392831 () Bool)

(assert (=> b!1510247 m!1392831))

(declare-fun m!1392833 () Bool)

(assert (=> b!1510237 m!1392833))

(declare-fun m!1392835 () Bool)

(assert (=> start!128864 m!1392835))

(declare-fun m!1392837 () Bool)

(assert (=> start!128864 m!1392837))

(assert (=> b!1510244 m!1392807))

(assert (=> b!1510244 m!1392807))

(declare-fun m!1392839 () Bool)

(assert (=> b!1510244 m!1392839))

(check-sat (not b!1510245) (not b!1510239) (not b!1510238) (not b!1510246) (not b!1510242) (not b!1510244) (not b!1510247) (not b!1510237) (not start!128864) (not b!1510243))
(check-sat)
