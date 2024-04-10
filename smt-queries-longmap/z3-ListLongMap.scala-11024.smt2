; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128978 () Bool)

(assert start!128978)

(declare-fun b!1512236 () Bool)

(declare-fun res!1032149 () Bool)

(declare-fun e!844134 () Bool)

(assert (=> b!1512236 (=> (not res!1032149) (not e!844134))))

(declare-datatypes ((array!100834 0))(
  ( (array!100835 (arr!48654 (Array (_ BitVec 32) (_ BitVec 64))) (size!49204 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100834)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100834 (_ BitVec 32)) Bool)

(assert (=> b!1512236 (= res!1032149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512237 () Bool)

(declare-fun res!1032150 () Bool)

(assert (=> b!1512237 (=> (not res!1032150) (not e!844134))))

(declare-datatypes ((List!35137 0))(
  ( (Nil!35134) (Cons!35133 (h!36545 (_ BitVec 64)) (t!49831 List!35137)) )
))
(declare-fun arrayNoDuplicates!0 (array!100834 (_ BitVec 32) List!35137) Bool)

(assert (=> b!1512237 (= res!1032150 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35134))))

(declare-fun b!1512238 () Bool)

(declare-fun res!1032146 () Bool)

(assert (=> b!1512238 (=> (not res!1032146) (not e!844134))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512238 (= res!1032146 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49204 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49204 a!2804))))))

(declare-fun b!1512239 () Bool)

(declare-fun res!1032143 () Bool)

(assert (=> b!1512239 (=> (not res!1032143) (not e!844134))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512239 (= res!1032143 (and (= (size!49204 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49204 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49204 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512240 () Bool)

(declare-fun e!844131 () Bool)

(declare-datatypes ((SeekEntryResult!12825 0))(
  ( (MissingZero!12825 (index!53695 (_ BitVec 32))) (Found!12825 (index!53696 (_ BitVec 32))) (Intermediate!12825 (undefined!13637 Bool) (index!53697 (_ BitVec 32)) (x!135423 (_ BitVec 32))) (Undefined!12825) (MissingVacant!12825 (index!53698 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12825)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1512240 (= e!844131 (= (seekEntryOrOpen!0 (select (arr!48654 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48654 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1032147 () Bool)

(assert (=> start!128978 (=> (not res!1032147) (not e!844134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128978 (= res!1032147 (validMask!0 mask!2512))))

(assert (=> start!128978 e!844134))

(assert (=> start!128978 true))

(declare-fun array_inv!37682 (array!100834) Bool)

(assert (=> start!128978 (array_inv!37682 a!2804)))

(declare-fun b!1512241 () Bool)

(declare-fun e!844132 () Bool)

(assert (=> b!1512241 (= e!844132 (not (or (not (= (select (arr!48654 a!2804) j!70) (select (store (arr!48654 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48654 a!2804) index!487) (select (arr!48654 a!2804) j!70)) (not (= (select (arr!48654 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!844135 () Bool)

(assert (=> b!1512241 e!844135))

(declare-fun res!1032142 () Bool)

(assert (=> b!1512241 (=> (not res!1032142) (not e!844135))))

(assert (=> b!1512241 (= res!1032142 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50518 0))(
  ( (Unit!50519) )
))
(declare-fun lt!655629 () Unit!50518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50518)

(assert (=> b!1512241 (= lt!655629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512242 () Bool)

(declare-fun res!1032139 () Bool)

(assert (=> b!1512242 (=> (not res!1032139) (not e!844134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512242 (= res!1032139 (validKeyInArray!0 (select (arr!48654 a!2804) i!961)))))

(declare-fun b!1512243 () Bool)

(declare-fun res!1032141 () Bool)

(assert (=> b!1512243 (=> (not res!1032141) (not e!844132))))

(declare-fun lt!655630 () SeekEntryResult!12825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1512243 (= res!1032141 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48654 a!2804) j!70) a!2804 mask!2512) lt!655630))))

(declare-fun b!1512244 () Bool)

(declare-fun res!1032151 () Bool)

(assert (=> b!1512244 (=> (not res!1032151) (not e!844132))))

(declare-fun lt!655628 () SeekEntryResult!12825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512244 (= res!1032151 (= lt!655628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48654 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48654 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100835 (store (arr!48654 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49204 a!2804)) mask!2512)))))

(declare-fun b!1512245 () Bool)

(declare-fun res!1032140 () Bool)

(assert (=> b!1512245 (=> (not res!1032140) (not e!844134))))

(assert (=> b!1512245 (= res!1032140 (validKeyInArray!0 (select (arr!48654 a!2804) j!70)))))

(declare-fun b!1512246 () Bool)

(assert (=> b!1512246 (= e!844135 e!844131)))

(declare-fun res!1032145 () Bool)

(assert (=> b!1512246 (=> res!1032145 e!844131)))

(assert (=> b!1512246 (= res!1032145 (or (not (= (select (arr!48654 a!2804) j!70) (select (store (arr!48654 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48654 a!2804) index!487) (select (arr!48654 a!2804) j!70)) (not (= (select (arr!48654 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512247 () Bool)

(declare-fun res!1032148 () Bool)

(assert (=> b!1512247 (=> (not res!1032148) (not e!844135))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1512247 (= res!1032148 (= (seekEntry!0 (select (arr!48654 a!2804) j!70) a!2804 mask!2512) (Found!12825 j!70)))))

(declare-fun b!1512248 () Bool)

(assert (=> b!1512248 (= e!844134 e!844132)))

(declare-fun res!1032144 () Bool)

(assert (=> b!1512248 (=> (not res!1032144) (not e!844132))))

(assert (=> b!1512248 (= res!1032144 (= lt!655628 lt!655630))))

(assert (=> b!1512248 (= lt!655630 (Intermediate!12825 false resIndex!21 resX!21))))

(assert (=> b!1512248 (= lt!655628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48654 a!2804) j!70) mask!2512) (select (arr!48654 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128978 res!1032147) b!1512239))

(assert (= (and b!1512239 res!1032143) b!1512242))

(assert (= (and b!1512242 res!1032139) b!1512245))

(assert (= (and b!1512245 res!1032140) b!1512236))

(assert (= (and b!1512236 res!1032149) b!1512237))

(assert (= (and b!1512237 res!1032150) b!1512238))

(assert (= (and b!1512238 res!1032146) b!1512248))

(assert (= (and b!1512248 res!1032144) b!1512243))

(assert (= (and b!1512243 res!1032141) b!1512244))

(assert (= (and b!1512244 res!1032151) b!1512241))

(assert (= (and b!1512241 res!1032142) b!1512247))

(assert (= (and b!1512247 res!1032148) b!1512246))

(assert (= (and b!1512246 (not res!1032145)) b!1512240))

(declare-fun m!1394989 () Bool)

(assert (=> b!1512243 m!1394989))

(assert (=> b!1512243 m!1394989))

(declare-fun m!1394991 () Bool)

(assert (=> b!1512243 m!1394991))

(assert (=> b!1512245 m!1394989))

(assert (=> b!1512245 m!1394989))

(declare-fun m!1394993 () Bool)

(assert (=> b!1512245 m!1394993))

(assert (=> b!1512241 m!1394989))

(declare-fun m!1394995 () Bool)

(assert (=> b!1512241 m!1394995))

(declare-fun m!1394997 () Bool)

(assert (=> b!1512241 m!1394997))

(declare-fun m!1394999 () Bool)

(assert (=> b!1512241 m!1394999))

(declare-fun m!1395001 () Bool)

(assert (=> b!1512241 m!1395001))

(declare-fun m!1395003 () Bool)

(assert (=> b!1512241 m!1395003))

(declare-fun m!1395005 () Bool)

(assert (=> start!128978 m!1395005))

(declare-fun m!1395007 () Bool)

(assert (=> start!128978 m!1395007))

(assert (=> b!1512240 m!1394989))

(assert (=> b!1512240 m!1394989))

(declare-fun m!1395009 () Bool)

(assert (=> b!1512240 m!1395009))

(assert (=> b!1512240 m!1394989))

(declare-fun m!1395011 () Bool)

(assert (=> b!1512240 m!1395011))

(assert (=> b!1512244 m!1394997))

(assert (=> b!1512244 m!1395001))

(assert (=> b!1512244 m!1395001))

(declare-fun m!1395013 () Bool)

(assert (=> b!1512244 m!1395013))

(assert (=> b!1512244 m!1395013))

(assert (=> b!1512244 m!1395001))

(declare-fun m!1395015 () Bool)

(assert (=> b!1512244 m!1395015))

(declare-fun m!1395017 () Bool)

(assert (=> b!1512237 m!1395017))

(assert (=> b!1512248 m!1394989))

(assert (=> b!1512248 m!1394989))

(declare-fun m!1395019 () Bool)

(assert (=> b!1512248 m!1395019))

(assert (=> b!1512248 m!1395019))

(assert (=> b!1512248 m!1394989))

(declare-fun m!1395021 () Bool)

(assert (=> b!1512248 m!1395021))

(assert (=> b!1512247 m!1394989))

(assert (=> b!1512247 m!1394989))

(declare-fun m!1395023 () Bool)

(assert (=> b!1512247 m!1395023))

(assert (=> b!1512246 m!1394989))

(assert (=> b!1512246 m!1394997))

(assert (=> b!1512246 m!1395001))

(assert (=> b!1512246 m!1394999))

(declare-fun m!1395025 () Bool)

(assert (=> b!1512242 m!1395025))

(assert (=> b!1512242 m!1395025))

(declare-fun m!1395027 () Bool)

(assert (=> b!1512242 m!1395027))

(declare-fun m!1395029 () Bool)

(assert (=> b!1512236 m!1395029))

(check-sat (not b!1512236) (not b!1512241) (not b!1512243) (not start!128978) (not b!1512244) (not b!1512237) (not b!1512247) (not b!1512248) (not b!1512245) (not b!1512242) (not b!1512240))
(check-sat)
