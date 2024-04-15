; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128828 () Bool)

(assert start!128828)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100684 0))(
  ( (array!100685 (arr!48580 (Array (_ BitVec 32) (_ BitVec 64))) (size!49132 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100684)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun b!1510170 () Bool)

(declare-fun e!843273 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510170 (= e!843273 (not (or (not (= (select (arr!48580 a!2804) j!70) (select (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48580 a!2804) index!487) (select (arr!48580 a!2804) j!70)) (not (= (select (arr!48580 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843271 () Bool)

(assert (=> b!1510170 e!843271))

(declare-fun res!1030286 () Bool)

(assert (=> b!1510170 (=> (not res!1030286) (not e!843271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100684 (_ BitVec 32)) Bool)

(assert (=> b!1510170 (= res!1030286 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50255 0))(
  ( (Unit!50256) )
))
(declare-fun lt!654894 () Unit!50255)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50255)

(assert (=> b!1510170 (= lt!654894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510171 () Bool)

(declare-fun res!1030282 () Bool)

(declare-fun e!843270 () Bool)

(assert (=> b!1510171 (=> (not res!1030282) (not e!843270))))

(assert (=> b!1510171 (= res!1030282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510172 () Bool)

(declare-datatypes ((SeekEntryResult!12774 0))(
  ( (MissingZero!12774 (index!53491 (_ BitVec 32))) (Found!12774 (index!53492 (_ BitVec 32))) (Intermediate!12774 (undefined!13586 Bool) (index!53493 (_ BitVec 32)) (x!135238 (_ BitVec 32))) (Undefined!12774) (MissingVacant!12774 (index!53494 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100684 (_ BitVec 32)) SeekEntryResult!12774)

(assert (=> b!1510172 (= e!843271 (= (seekEntry!0 (select (arr!48580 a!2804) j!70) a!2804 mask!2512) (Found!12774 j!70)))))

(declare-fun b!1510173 () Bool)

(declare-fun res!1030281 () Bool)

(assert (=> b!1510173 (=> (not res!1030281) (not e!843270))))

(assert (=> b!1510173 (= res!1030281 (and (= (size!49132 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49132 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49132 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510174 () Bool)

(declare-fun res!1030285 () Bool)

(assert (=> b!1510174 (=> (not res!1030285) (not e!843270))))

(assert (=> b!1510174 (= res!1030285 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49132 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49132 a!2804))))))

(declare-fun b!1510175 () Bool)

(assert (=> b!1510175 (= e!843270 e!843273)))

(declare-fun res!1030279 () Bool)

(assert (=> b!1510175 (=> (not res!1030279) (not e!843273))))

(declare-fun lt!654892 () SeekEntryResult!12774)

(declare-fun lt!654893 () SeekEntryResult!12774)

(assert (=> b!1510175 (= res!1030279 (= lt!654892 lt!654893))))

(assert (=> b!1510175 (= lt!654893 (Intermediate!12774 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100684 (_ BitVec 32)) SeekEntryResult!12774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510175 (= lt!654892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48580 a!2804) j!70) mask!2512) (select (arr!48580 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510176 () Bool)

(declare-fun res!1030288 () Bool)

(assert (=> b!1510176 (=> (not res!1030288) (not e!843270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510176 (= res!1030288 (validKeyInArray!0 (select (arr!48580 a!2804) i!961)))))

(declare-fun b!1510178 () Bool)

(declare-fun res!1030287 () Bool)

(assert (=> b!1510178 (=> (not res!1030287) (not e!843270))))

(declare-datatypes ((List!35141 0))(
  ( (Nil!35138) (Cons!35137 (h!36550 (_ BitVec 64)) (t!49827 List!35141)) )
))
(declare-fun arrayNoDuplicates!0 (array!100684 (_ BitVec 32) List!35141) Bool)

(assert (=> b!1510178 (= res!1030287 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35138))))

(declare-fun b!1510179 () Bool)

(declare-fun res!1030289 () Bool)

(assert (=> b!1510179 (=> (not res!1030289) (not e!843273))))

(assert (=> b!1510179 (= res!1030289 (= lt!654892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100685 (store (arr!48580 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49132 a!2804)) mask!2512)))))

(declare-fun b!1510180 () Bool)

(declare-fun res!1030283 () Bool)

(assert (=> b!1510180 (=> (not res!1030283) (not e!843270))))

(assert (=> b!1510180 (= res!1030283 (validKeyInArray!0 (select (arr!48580 a!2804) j!70)))))

(declare-fun res!1030284 () Bool)

(assert (=> start!128828 (=> (not res!1030284) (not e!843270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128828 (= res!1030284 (validMask!0 mask!2512))))

(assert (=> start!128828 e!843270))

(assert (=> start!128828 true))

(declare-fun array_inv!37813 (array!100684) Bool)

(assert (=> start!128828 (array_inv!37813 a!2804)))

(declare-fun b!1510177 () Bool)

(declare-fun res!1030280 () Bool)

(assert (=> b!1510177 (=> (not res!1030280) (not e!843273))))

(assert (=> b!1510177 (= res!1030280 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48580 a!2804) j!70) a!2804 mask!2512) lt!654893))))

(assert (= (and start!128828 res!1030284) b!1510173))

(assert (= (and b!1510173 res!1030281) b!1510176))

(assert (= (and b!1510176 res!1030288) b!1510180))

(assert (= (and b!1510180 res!1030283) b!1510171))

(assert (= (and b!1510171 res!1030282) b!1510178))

(assert (= (and b!1510178 res!1030287) b!1510174))

(assert (= (and b!1510174 res!1030285) b!1510175))

(assert (= (and b!1510175 res!1030279) b!1510177))

(assert (= (and b!1510177 res!1030280) b!1510179))

(assert (= (and b!1510179 res!1030289) b!1510170))

(assert (= (and b!1510170 res!1030286) b!1510172))

(declare-fun m!1392197 () Bool)

(assert (=> b!1510179 m!1392197))

(declare-fun m!1392199 () Bool)

(assert (=> b!1510179 m!1392199))

(assert (=> b!1510179 m!1392199))

(declare-fun m!1392201 () Bool)

(assert (=> b!1510179 m!1392201))

(assert (=> b!1510179 m!1392201))

(assert (=> b!1510179 m!1392199))

(declare-fun m!1392203 () Bool)

(assert (=> b!1510179 m!1392203))

(declare-fun m!1392205 () Bool)

(assert (=> start!128828 m!1392205))

(declare-fun m!1392207 () Bool)

(assert (=> start!128828 m!1392207))

(declare-fun m!1392209 () Bool)

(assert (=> b!1510175 m!1392209))

(assert (=> b!1510175 m!1392209))

(declare-fun m!1392211 () Bool)

(assert (=> b!1510175 m!1392211))

(assert (=> b!1510175 m!1392211))

(assert (=> b!1510175 m!1392209))

(declare-fun m!1392213 () Bool)

(assert (=> b!1510175 m!1392213))

(assert (=> b!1510180 m!1392209))

(assert (=> b!1510180 m!1392209))

(declare-fun m!1392215 () Bool)

(assert (=> b!1510180 m!1392215))

(declare-fun m!1392217 () Bool)

(assert (=> b!1510178 m!1392217))

(assert (=> b!1510172 m!1392209))

(assert (=> b!1510172 m!1392209))

(declare-fun m!1392219 () Bool)

(assert (=> b!1510172 m!1392219))

(assert (=> b!1510177 m!1392209))

(assert (=> b!1510177 m!1392209))

(declare-fun m!1392221 () Bool)

(assert (=> b!1510177 m!1392221))

(declare-fun m!1392223 () Bool)

(assert (=> b!1510176 m!1392223))

(assert (=> b!1510176 m!1392223))

(declare-fun m!1392225 () Bool)

(assert (=> b!1510176 m!1392225))

(declare-fun m!1392227 () Bool)

(assert (=> b!1510171 m!1392227))

(assert (=> b!1510170 m!1392209))

(declare-fun m!1392229 () Bool)

(assert (=> b!1510170 m!1392229))

(assert (=> b!1510170 m!1392197))

(declare-fun m!1392231 () Bool)

(assert (=> b!1510170 m!1392231))

(assert (=> b!1510170 m!1392199))

(declare-fun m!1392233 () Bool)

(assert (=> b!1510170 m!1392233))

(check-sat (not b!1510177) (not b!1510178) (not b!1510179) (not b!1510170) (not b!1510180) (not b!1510172) (not b!1510175) (not b!1510176) (not b!1510171) (not start!128828))
(check-sat)
