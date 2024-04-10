; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128992 () Bool)

(assert start!128992)

(declare-fun res!1032421 () Bool)

(declare-fun e!844239 () Bool)

(assert (=> start!128992 (=> (not res!1032421) (not e!844239))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128992 (= res!1032421 (validMask!0 mask!2512))))

(assert (=> start!128992 e!844239))

(assert (=> start!128992 true))

(declare-datatypes ((array!100848 0))(
  ( (array!100849 (arr!48661 (Array (_ BitVec 32) (_ BitVec 64))) (size!49211 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100848)

(declare-fun array_inv!37689 (array!100848) Bool)

(assert (=> start!128992 (array_inv!37689 a!2804)))

(declare-fun e!844238 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1512509 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512509 (= e!844238 (not (or (not (= (select (arr!48661 a!2804) j!70) (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48661 a!2804) index!487) (select (arr!48661 a!2804) j!70)) (not (= (select (arr!48661 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!844240 () Bool)

(assert (=> b!1512509 e!844240))

(declare-fun res!1032418 () Bool)

(assert (=> b!1512509 (=> (not res!1032418) (not e!844240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100848 (_ BitVec 32)) Bool)

(assert (=> b!1512509 (= res!1032418 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50532 0))(
  ( (Unit!50533) )
))
(declare-fun lt!655693 () Unit!50532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50532)

(assert (=> b!1512509 (= lt!655693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512510 () Bool)

(declare-fun res!1032415 () Bool)

(assert (=> b!1512510 (=> (not res!1032415) (not e!844239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512510 (= res!1032415 (validKeyInArray!0 (select (arr!48661 a!2804) j!70)))))

(declare-fun b!1512511 () Bool)

(declare-fun res!1032416 () Bool)

(assert (=> b!1512511 (=> (not res!1032416) (not e!844238))))

(declare-datatypes ((SeekEntryResult!12832 0))(
  ( (MissingZero!12832 (index!53723 (_ BitVec 32))) (Found!12832 (index!53724 (_ BitVec 32))) (Intermediate!12832 (undefined!13644 Bool) (index!53725 (_ BitVec 32)) (x!135446 (_ BitVec 32))) (Undefined!12832) (MissingVacant!12832 (index!53726 (_ BitVec 32))) )
))
(declare-fun lt!655691 () SeekEntryResult!12832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100848 (_ BitVec 32)) SeekEntryResult!12832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512511 (= res!1032416 (= lt!655691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100849 (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49211 a!2804)) mask!2512)))))

(declare-fun b!1512512 () Bool)

(assert (=> b!1512512 (= e!844239 e!844238)))

(declare-fun res!1032420 () Bool)

(assert (=> b!1512512 (=> (not res!1032420) (not e!844238))))

(declare-fun lt!655692 () SeekEntryResult!12832)

(assert (=> b!1512512 (= res!1032420 (= lt!655691 lt!655692))))

(assert (=> b!1512512 (= lt!655692 (Intermediate!12832 false resIndex!21 resX!21))))

(assert (=> b!1512512 (= lt!655691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48661 a!2804) j!70) mask!2512) (select (arr!48661 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512513 () Bool)

(declare-fun res!1032413 () Bool)

(assert (=> b!1512513 (=> (not res!1032413) (not e!844239))))

(assert (=> b!1512513 (= res!1032413 (and (= (size!49211 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49211 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49211 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512514 () Bool)

(declare-fun e!844236 () Bool)

(assert (=> b!1512514 (= e!844240 e!844236)))

(declare-fun res!1032412 () Bool)

(assert (=> b!1512514 (=> res!1032412 e!844236)))

(assert (=> b!1512514 (= res!1032412 (or (not (= (select (arr!48661 a!2804) j!70) (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48661 a!2804) index!487) (select (arr!48661 a!2804) j!70)) (not (= (select (arr!48661 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512515 () Bool)

(declare-fun res!1032419 () Bool)

(assert (=> b!1512515 (=> (not res!1032419) (not e!844239))))

(assert (=> b!1512515 (= res!1032419 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49211 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49211 a!2804))))))

(declare-fun b!1512516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100848 (_ BitVec 32)) SeekEntryResult!12832)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100848 (_ BitVec 32)) SeekEntryResult!12832)

(assert (=> b!1512516 (= e!844236 (= (seekEntryOrOpen!0 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48661 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512517 () Bool)

(declare-fun res!1032422 () Bool)

(assert (=> b!1512517 (=> (not res!1032422) (not e!844239))))

(declare-datatypes ((List!35144 0))(
  ( (Nil!35141) (Cons!35140 (h!36552 (_ BitVec 64)) (t!49838 List!35144)) )
))
(declare-fun arrayNoDuplicates!0 (array!100848 (_ BitVec 32) List!35144) Bool)

(assert (=> b!1512517 (= res!1032422 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35141))))

(declare-fun b!1512518 () Bool)

(declare-fun res!1032414 () Bool)

(assert (=> b!1512518 (=> (not res!1032414) (not e!844239))))

(assert (=> b!1512518 (= res!1032414 (validKeyInArray!0 (select (arr!48661 a!2804) i!961)))))

(declare-fun b!1512519 () Bool)

(declare-fun res!1032423 () Bool)

(assert (=> b!1512519 (=> (not res!1032423) (not e!844239))))

(assert (=> b!1512519 (= res!1032423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512520 () Bool)

(declare-fun res!1032424 () Bool)

(assert (=> b!1512520 (=> (not res!1032424) (not e!844240))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100848 (_ BitVec 32)) SeekEntryResult!12832)

(assert (=> b!1512520 (= res!1032424 (= (seekEntry!0 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) (Found!12832 j!70)))))

(declare-fun b!1512521 () Bool)

(declare-fun res!1032417 () Bool)

(assert (=> b!1512521 (=> (not res!1032417) (not e!844238))))

(assert (=> b!1512521 (= res!1032417 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) lt!655692))))

(assert (= (and start!128992 res!1032421) b!1512513))

(assert (= (and b!1512513 res!1032413) b!1512518))

(assert (= (and b!1512518 res!1032414) b!1512510))

(assert (= (and b!1512510 res!1032415) b!1512519))

(assert (= (and b!1512519 res!1032423) b!1512517))

(assert (= (and b!1512517 res!1032422) b!1512515))

(assert (= (and b!1512515 res!1032419) b!1512512))

(assert (= (and b!1512512 res!1032420) b!1512521))

(assert (= (and b!1512521 res!1032417) b!1512511))

(assert (= (and b!1512511 res!1032416) b!1512509))

(assert (= (and b!1512509 res!1032418) b!1512520))

(assert (= (and b!1512520 res!1032424) b!1512514))

(assert (= (and b!1512514 (not res!1032412)) b!1512516))

(declare-fun m!1395283 () Bool)

(assert (=> b!1512509 m!1395283))

(declare-fun m!1395285 () Bool)

(assert (=> b!1512509 m!1395285))

(declare-fun m!1395287 () Bool)

(assert (=> b!1512509 m!1395287))

(declare-fun m!1395289 () Bool)

(assert (=> b!1512509 m!1395289))

(declare-fun m!1395291 () Bool)

(assert (=> b!1512509 m!1395291))

(declare-fun m!1395293 () Bool)

(assert (=> b!1512509 m!1395293))

(assert (=> b!1512520 m!1395283))

(assert (=> b!1512520 m!1395283))

(declare-fun m!1395295 () Bool)

(assert (=> b!1512520 m!1395295))

(assert (=> b!1512516 m!1395283))

(assert (=> b!1512516 m!1395283))

(declare-fun m!1395297 () Bool)

(assert (=> b!1512516 m!1395297))

(assert (=> b!1512516 m!1395283))

(declare-fun m!1395299 () Bool)

(assert (=> b!1512516 m!1395299))

(assert (=> b!1512514 m!1395283))

(assert (=> b!1512514 m!1395287))

(assert (=> b!1512514 m!1395291))

(assert (=> b!1512514 m!1395289))

(declare-fun m!1395301 () Bool)

(assert (=> b!1512518 m!1395301))

(assert (=> b!1512518 m!1395301))

(declare-fun m!1395303 () Bool)

(assert (=> b!1512518 m!1395303))

(assert (=> b!1512510 m!1395283))

(assert (=> b!1512510 m!1395283))

(declare-fun m!1395305 () Bool)

(assert (=> b!1512510 m!1395305))

(assert (=> b!1512512 m!1395283))

(assert (=> b!1512512 m!1395283))

(declare-fun m!1395307 () Bool)

(assert (=> b!1512512 m!1395307))

(assert (=> b!1512512 m!1395307))

(assert (=> b!1512512 m!1395283))

(declare-fun m!1395309 () Bool)

(assert (=> b!1512512 m!1395309))

(declare-fun m!1395311 () Bool)

(assert (=> b!1512519 m!1395311))

(assert (=> b!1512511 m!1395287))

(assert (=> b!1512511 m!1395291))

(assert (=> b!1512511 m!1395291))

(declare-fun m!1395313 () Bool)

(assert (=> b!1512511 m!1395313))

(assert (=> b!1512511 m!1395313))

(assert (=> b!1512511 m!1395291))

(declare-fun m!1395315 () Bool)

(assert (=> b!1512511 m!1395315))

(declare-fun m!1395317 () Bool)

(assert (=> b!1512517 m!1395317))

(declare-fun m!1395319 () Bool)

(assert (=> start!128992 m!1395319))

(declare-fun m!1395321 () Bool)

(assert (=> start!128992 m!1395321))

(assert (=> b!1512521 m!1395283))

(assert (=> b!1512521 m!1395283))

(declare-fun m!1395323 () Bool)

(assert (=> b!1512521 m!1395323))

(push 1)

(assert (not b!1512512))

(assert (not b!1512521))

(assert (not b!1512518))

(assert (not b!1512516))

(assert (not b!1512520))

(assert (not b!1512517))

(assert (not b!1512519))

(assert (not b!1512509))

(assert (not b!1512510))

(assert (not start!128992))

(assert (not b!1512511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

