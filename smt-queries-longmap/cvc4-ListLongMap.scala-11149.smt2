; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130260 () Bool)

(assert start!130260)

(declare-fun b!1529244 () Bool)

(declare-fun res!1046953 () Bool)

(declare-fun e!852253 () Bool)

(assert (=> b!1529244 (=> (not res!1046953) (not e!852253))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101610 0))(
  ( (array!101611 (arr!49030 (Array (_ BitVec 32) (_ BitVec 64))) (size!49580 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101610)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13195 0))(
  ( (MissingZero!13195 (index!55175 (_ BitVec 32))) (Found!13195 (index!55176 (_ BitVec 32))) (Intermediate!13195 (undefined!14007 Bool) (index!55177 (_ BitVec 32)) (x!136858 (_ BitVec 32))) (Undefined!13195) (MissingVacant!13195 (index!55178 (_ BitVec 32))) )
))
(declare-fun lt!662369 () SeekEntryResult!13195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101610 (_ BitVec 32)) SeekEntryResult!13195)

(assert (=> b!1529244 (= res!1046953 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) lt!662369))))

(declare-fun b!1529245 () Bool)

(declare-fun res!1046956 () Bool)

(declare-fun e!852252 () Bool)

(assert (=> b!1529245 (=> (not res!1046956) (not e!852252))))

(declare-datatypes ((List!35513 0))(
  ( (Nil!35510) (Cons!35509 (h!36945 (_ BitVec 64)) (t!50207 List!35513)) )
))
(declare-fun arrayNoDuplicates!0 (array!101610 (_ BitVec 32) List!35513) Bool)

(assert (=> b!1529245 (= res!1046956 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35510))))

(declare-fun b!1529246 () Bool)

(declare-fun res!1046958 () Bool)

(assert (=> b!1529246 (=> (not res!1046958) (not e!852252))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529246 (= res!1046958 (and (= (size!49580 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49580 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49580 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529247 () Bool)

(declare-fun res!1046954 () Bool)

(assert (=> b!1529247 (=> (not res!1046954) (not e!852252))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529247 (= res!1046954 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49580 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49580 a!2804))))))

(declare-fun b!1529248 () Bool)

(declare-fun res!1046951 () Bool)

(assert (=> b!1529248 (=> (not res!1046951) (not e!852252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101610 (_ BitVec 32)) Bool)

(assert (=> b!1529248 (= res!1046951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529249 () Bool)

(declare-fun res!1046962 () Bool)

(assert (=> b!1529249 (=> (not res!1046962) (not e!852252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529249 (= res!1046962 (validKeyInArray!0 (select (arr!49030 a!2804) j!70)))))

(declare-fun b!1529250 () Bool)

(declare-fun res!1046952 () Bool)

(assert (=> b!1529250 (=> (not res!1046952) (not e!852253))))

(declare-fun lt!662371 () SeekEntryResult!13195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529250 (= res!1046952 (= lt!662371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101611 (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49580 a!2804)) mask!2512)))))

(declare-fun b!1529251 () Bool)

(declare-fun e!852250 () Bool)

(assert (=> b!1529251 (= e!852250 true)))

(declare-fun lt!662370 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529251 (= lt!662370 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529252 () Bool)

(declare-fun res!1046959 () Bool)

(assert (=> b!1529252 (=> (not res!1046959) (not e!852252))))

(assert (=> b!1529252 (= res!1046959 (validKeyInArray!0 (select (arr!49030 a!2804) i!961)))))

(declare-fun b!1529254 () Bool)

(assert (=> b!1529254 (= e!852252 e!852253)))

(declare-fun res!1046961 () Bool)

(assert (=> b!1529254 (=> (not res!1046961) (not e!852253))))

(assert (=> b!1529254 (= res!1046961 (= lt!662371 lt!662369))))

(assert (=> b!1529254 (= lt!662369 (Intermediate!13195 false resIndex!21 resX!21))))

(assert (=> b!1529254 (= lt!662371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49030 a!2804) j!70) mask!2512) (select (arr!49030 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!852249 () Bool)

(declare-fun b!1529255 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101610 (_ BitVec 32)) SeekEntryResult!13195)

(assert (=> b!1529255 (= e!852249 (= (seekEntry!0 (select (arr!49030 a!2804) j!70) a!2804 mask!2512) (Found!13195 j!70)))))

(declare-fun b!1529253 () Bool)

(assert (=> b!1529253 (= e!852253 (not e!852250))))

(declare-fun res!1046955 () Bool)

(assert (=> b!1529253 (=> res!1046955 e!852250)))

(assert (=> b!1529253 (= res!1046955 (or (not (= (select (arr!49030 a!2804) j!70) (select (store (arr!49030 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529253 e!852249))

(declare-fun res!1046960 () Bool)

(assert (=> b!1529253 (=> (not res!1046960) (not e!852249))))

(assert (=> b!1529253 (= res!1046960 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51174 0))(
  ( (Unit!51175) )
))
(declare-fun lt!662368 () Unit!51174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51174)

(assert (=> b!1529253 (= lt!662368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1046957 () Bool)

(assert (=> start!130260 (=> (not res!1046957) (not e!852252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130260 (= res!1046957 (validMask!0 mask!2512))))

(assert (=> start!130260 e!852252))

(assert (=> start!130260 true))

(declare-fun array_inv!38058 (array!101610) Bool)

(assert (=> start!130260 (array_inv!38058 a!2804)))

(assert (= (and start!130260 res!1046957) b!1529246))

(assert (= (and b!1529246 res!1046958) b!1529252))

(assert (= (and b!1529252 res!1046959) b!1529249))

(assert (= (and b!1529249 res!1046962) b!1529248))

(assert (= (and b!1529248 res!1046951) b!1529245))

(assert (= (and b!1529245 res!1046956) b!1529247))

(assert (= (and b!1529247 res!1046954) b!1529254))

(assert (= (and b!1529254 res!1046961) b!1529244))

(assert (= (and b!1529244 res!1046953) b!1529250))

(assert (= (and b!1529250 res!1046952) b!1529253))

(assert (= (and b!1529253 res!1046960) b!1529255))

(assert (= (and b!1529253 (not res!1046955)) b!1529251))

(declare-fun m!1412179 () Bool)

(assert (=> b!1529252 m!1412179))

(assert (=> b!1529252 m!1412179))

(declare-fun m!1412181 () Bool)

(assert (=> b!1529252 m!1412181))

(declare-fun m!1412183 () Bool)

(assert (=> b!1529249 m!1412183))

(assert (=> b!1529249 m!1412183))

(declare-fun m!1412185 () Bool)

(assert (=> b!1529249 m!1412185))

(declare-fun m!1412187 () Bool)

(assert (=> b!1529245 m!1412187))

(assert (=> b!1529255 m!1412183))

(assert (=> b!1529255 m!1412183))

(declare-fun m!1412189 () Bool)

(assert (=> b!1529255 m!1412189))

(assert (=> b!1529244 m!1412183))

(assert (=> b!1529244 m!1412183))

(declare-fun m!1412191 () Bool)

(assert (=> b!1529244 m!1412191))

(declare-fun m!1412193 () Bool)

(assert (=> b!1529248 m!1412193))

(declare-fun m!1412195 () Bool)

(assert (=> start!130260 m!1412195))

(declare-fun m!1412197 () Bool)

(assert (=> start!130260 m!1412197))

(declare-fun m!1412199 () Bool)

(assert (=> b!1529250 m!1412199))

(declare-fun m!1412201 () Bool)

(assert (=> b!1529250 m!1412201))

(assert (=> b!1529250 m!1412201))

(declare-fun m!1412203 () Bool)

(assert (=> b!1529250 m!1412203))

(assert (=> b!1529250 m!1412203))

(assert (=> b!1529250 m!1412201))

(declare-fun m!1412205 () Bool)

(assert (=> b!1529250 m!1412205))

(assert (=> b!1529253 m!1412183))

(declare-fun m!1412207 () Bool)

(assert (=> b!1529253 m!1412207))

(assert (=> b!1529253 m!1412199))

(assert (=> b!1529253 m!1412201))

(declare-fun m!1412209 () Bool)

(assert (=> b!1529253 m!1412209))

(assert (=> b!1529254 m!1412183))

(assert (=> b!1529254 m!1412183))

(declare-fun m!1412211 () Bool)

(assert (=> b!1529254 m!1412211))

(assert (=> b!1529254 m!1412211))

(assert (=> b!1529254 m!1412183))

(declare-fun m!1412213 () Bool)

(assert (=> b!1529254 m!1412213))

(declare-fun m!1412215 () Bool)

(assert (=> b!1529251 m!1412215))

(push 1)

