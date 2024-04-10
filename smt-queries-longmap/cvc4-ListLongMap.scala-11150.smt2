; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130266 () Bool)

(assert start!130266)

(declare-fun b!1529352 () Bool)

(declare-fun res!1047070 () Bool)

(declare-fun e!852295 () Bool)

(assert (=> b!1529352 (=> (not res!1047070) (not e!852295))))

(declare-datatypes ((array!101616 0))(
  ( (array!101617 (arr!49033 (Array (_ BitVec 32) (_ BitVec 64))) (size!49583 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101616)

(declare-datatypes ((List!35516 0))(
  ( (Nil!35513) (Cons!35512 (h!36948 (_ BitVec 64)) (t!50210 List!35516)) )
))
(declare-fun arrayNoDuplicates!0 (array!101616 (_ BitVec 32) List!35516) Bool)

(assert (=> b!1529352 (= res!1047070 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35513))))

(declare-fun b!1529353 () Bool)

(declare-fun res!1047060 () Bool)

(assert (=> b!1529353 (=> (not res!1047060) (not e!852295))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529353 (= res!1047060 (validKeyInArray!0 (select (arr!49033 a!2804) j!70)))))

(declare-fun res!1047061 () Bool)

(assert (=> start!130266 (=> (not res!1047061) (not e!852295))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130266 (= res!1047061 (validMask!0 mask!2512))))

(assert (=> start!130266 e!852295))

(assert (=> start!130266 true))

(declare-fun array_inv!38061 (array!101616) Bool)

(assert (=> start!130266 (array_inv!38061 a!2804)))

(declare-fun b!1529354 () Bool)

(declare-fun res!1047063 () Bool)

(declare-fun e!852297 () Bool)

(assert (=> b!1529354 (=> (not res!1047063) (not e!852297))))

(declare-datatypes ((SeekEntryResult!13198 0))(
  ( (MissingZero!13198 (index!55187 (_ BitVec 32))) (Found!13198 (index!55188 (_ BitVec 32))) (Intermediate!13198 (undefined!14010 Bool) (index!55189 (_ BitVec 32)) (x!136869 (_ BitVec 32))) (Undefined!13198) (MissingVacant!13198 (index!55190 (_ BitVec 32))) )
))
(declare-fun lt!662405 () SeekEntryResult!13198)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101616 (_ BitVec 32)) SeekEntryResult!13198)

(assert (=> b!1529354 (= res!1047063 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) lt!662405))))

(declare-fun b!1529355 () Bool)

(declare-fun res!1047066 () Bool)

(assert (=> b!1529355 (=> (not res!1047066) (not e!852295))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529355 (= res!1047066 (and (= (size!49583 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49583 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49583 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529356 () Bool)

(declare-fun res!1047067 () Bool)

(assert (=> b!1529356 (=> (not res!1047067) (not e!852295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101616 (_ BitVec 32)) Bool)

(assert (=> b!1529356 (= res!1047067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529357 () Bool)

(declare-fun e!852298 () Bool)

(assert (=> b!1529357 (= e!852297 (not e!852298))))

(declare-fun res!1047069 () Bool)

(assert (=> b!1529357 (=> res!1047069 e!852298)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529357 (= res!1047069 (or (not (= (select (arr!49033 a!2804) j!70) (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852294 () Bool)

(assert (=> b!1529357 e!852294))

(declare-fun res!1047059 () Bool)

(assert (=> b!1529357 (=> (not res!1047059) (not e!852294))))

(assert (=> b!1529357 (= res!1047059 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51180 0))(
  ( (Unit!51181) )
))
(declare-fun lt!662407 () Unit!51180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51180)

(assert (=> b!1529357 (= lt!662407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529358 () Bool)

(assert (=> b!1529358 (= e!852298 true)))

(declare-fun lt!662404 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529358 (= lt!662404 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529359 () Bool)

(declare-fun res!1047068 () Bool)

(assert (=> b!1529359 (=> (not res!1047068) (not e!852295))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529359 (= res!1047068 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49583 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49583 a!2804))))))

(declare-fun b!1529360 () Bool)

(assert (=> b!1529360 (= e!852295 e!852297)))

(declare-fun res!1047064 () Bool)

(assert (=> b!1529360 (=> (not res!1047064) (not e!852297))))

(declare-fun lt!662406 () SeekEntryResult!13198)

(assert (=> b!1529360 (= res!1047064 (= lt!662406 lt!662405))))

(assert (=> b!1529360 (= lt!662405 (Intermediate!13198 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529360 (= lt!662406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49033 a!2804) j!70) mask!2512) (select (arr!49033 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529361 () Bool)

(declare-fun res!1047062 () Bool)

(assert (=> b!1529361 (=> (not res!1047062) (not e!852297))))

(assert (=> b!1529361 (= res!1047062 (= lt!662406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101617 (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49583 a!2804)) mask!2512)))))

(declare-fun b!1529362 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101616 (_ BitVec 32)) SeekEntryResult!13198)

(assert (=> b!1529362 (= e!852294 (= (seekEntry!0 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) (Found!13198 j!70)))))

(declare-fun b!1529363 () Bool)

(declare-fun res!1047065 () Bool)

(assert (=> b!1529363 (=> (not res!1047065) (not e!852295))))

(assert (=> b!1529363 (= res!1047065 (validKeyInArray!0 (select (arr!49033 a!2804) i!961)))))

(assert (= (and start!130266 res!1047061) b!1529355))

(assert (= (and b!1529355 res!1047066) b!1529363))

(assert (= (and b!1529363 res!1047065) b!1529353))

(assert (= (and b!1529353 res!1047060) b!1529356))

(assert (= (and b!1529356 res!1047067) b!1529352))

(assert (= (and b!1529352 res!1047070) b!1529359))

(assert (= (and b!1529359 res!1047068) b!1529360))

(assert (= (and b!1529360 res!1047064) b!1529354))

(assert (= (and b!1529354 res!1047063) b!1529361))

(assert (= (and b!1529361 res!1047062) b!1529357))

(assert (= (and b!1529357 res!1047059) b!1529362))

(assert (= (and b!1529357 (not res!1047069)) b!1529358))

(declare-fun m!1412293 () Bool)

(assert (=> b!1529356 m!1412293))

(declare-fun m!1412295 () Bool)

(assert (=> b!1529352 m!1412295))

(declare-fun m!1412297 () Bool)

(assert (=> b!1529357 m!1412297))

(declare-fun m!1412299 () Bool)

(assert (=> b!1529357 m!1412299))

(declare-fun m!1412301 () Bool)

(assert (=> b!1529357 m!1412301))

(declare-fun m!1412303 () Bool)

(assert (=> b!1529357 m!1412303))

(declare-fun m!1412305 () Bool)

(assert (=> b!1529357 m!1412305))

(assert (=> b!1529362 m!1412297))

(assert (=> b!1529362 m!1412297))

(declare-fun m!1412307 () Bool)

(assert (=> b!1529362 m!1412307))

(assert (=> b!1529361 m!1412301))

(assert (=> b!1529361 m!1412303))

(assert (=> b!1529361 m!1412303))

(declare-fun m!1412309 () Bool)

(assert (=> b!1529361 m!1412309))

(assert (=> b!1529361 m!1412309))

(assert (=> b!1529361 m!1412303))

(declare-fun m!1412311 () Bool)

(assert (=> b!1529361 m!1412311))

(declare-fun m!1412313 () Bool)

(assert (=> b!1529358 m!1412313))

(declare-fun m!1412315 () Bool)

(assert (=> start!130266 m!1412315))

(declare-fun m!1412317 () Bool)

(assert (=> start!130266 m!1412317))

(declare-fun m!1412319 () Bool)

(assert (=> b!1529363 m!1412319))

(assert (=> b!1529363 m!1412319))

(declare-fun m!1412321 () Bool)

(assert (=> b!1529363 m!1412321))

(assert (=> b!1529360 m!1412297))

(assert (=> b!1529360 m!1412297))

(declare-fun m!1412323 () Bool)

(assert (=> b!1529360 m!1412323))

(assert (=> b!1529360 m!1412323))

(assert (=> b!1529360 m!1412297))

(declare-fun m!1412325 () Bool)

(assert (=> b!1529360 m!1412325))

(assert (=> b!1529354 m!1412297))

(assert (=> b!1529354 m!1412297))

(declare-fun m!1412327 () Bool)

(assert (=> b!1529354 m!1412327))

(assert (=> b!1529353 m!1412297))

(assert (=> b!1529353 m!1412297))

(declare-fun m!1412329 () Bool)

(assert (=> b!1529353 m!1412329))

(push 1)

(assert (not b!1529357))

(assert (not b!1529360))

