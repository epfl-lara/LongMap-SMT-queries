; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130268 () Bool)

(assert start!130268)

(declare-fun b!1529388 () Bool)

(declare-fun res!1047098 () Bool)

(declare-fun e!852311 () Bool)

(assert (=> b!1529388 (=> (not res!1047098) (not e!852311))))

(declare-datatypes ((SeekEntryResult!13199 0))(
  ( (MissingZero!13199 (index!55191 (_ BitVec 32))) (Found!13199 (index!55192 (_ BitVec 32))) (Intermediate!13199 (undefined!14011 Bool) (index!55193 (_ BitVec 32)) (x!136878 (_ BitVec 32))) (Undefined!13199) (MissingVacant!13199 (index!55194 (_ BitVec 32))) )
))
(declare-fun lt!662418 () SeekEntryResult!13199)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101618 0))(
  ( (array!101619 (arr!49034 (Array (_ BitVec 32) (_ BitVec 64))) (size!49584 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101618)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101618 (_ BitVec 32)) SeekEntryResult!13199)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529388 (= res!1047098 (= lt!662418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49034 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49034 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101619 (store (arr!49034 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49584 a!2804)) mask!2512)))))

(declare-fun b!1529390 () Bool)

(declare-fun e!852310 () Bool)

(assert (=> b!1529390 (= e!852311 (not e!852310))))

(declare-fun res!1047097 () Bool)

(assert (=> b!1529390 (=> res!1047097 e!852310)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529390 (= res!1047097 (or (not (= (select (arr!49034 a!2804) j!70) (select (store (arr!49034 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852309 () Bool)

(assert (=> b!1529390 e!852309))

(declare-fun res!1047105 () Bool)

(assert (=> b!1529390 (=> (not res!1047105) (not e!852309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101618 (_ BitVec 32)) Bool)

(assert (=> b!1529390 (= res!1047105 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51182 0))(
  ( (Unit!51183) )
))
(declare-fun lt!662416 () Unit!51182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51182)

(assert (=> b!1529390 (= lt!662416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529391 () Bool)

(declare-fun res!1047100 () Bool)

(declare-fun e!852313 () Bool)

(assert (=> b!1529391 (=> (not res!1047100) (not e!852313))))

(assert (=> b!1529391 (= res!1047100 (and (= (size!49584 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49584 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49584 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529392 () Bool)

(declare-fun res!1047106 () Bool)

(assert (=> b!1529392 (=> (not res!1047106) (not e!852313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529392 (= res!1047106 (validKeyInArray!0 (select (arr!49034 a!2804) j!70)))))

(declare-fun b!1529393 () Bool)

(assert (=> b!1529393 (= e!852313 e!852311)))

(declare-fun res!1047104 () Bool)

(assert (=> b!1529393 (=> (not res!1047104) (not e!852311))))

(declare-fun lt!662417 () SeekEntryResult!13199)

(assert (=> b!1529393 (= res!1047104 (= lt!662418 lt!662417))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529393 (= lt!662417 (Intermediate!13199 false resIndex!21 resX!21))))

(assert (=> b!1529393 (= lt!662418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49034 a!2804) j!70) mask!2512) (select (arr!49034 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529389 () Bool)

(declare-fun res!1047101 () Bool)

(assert (=> b!1529389 (=> (not res!1047101) (not e!852313))))

(declare-datatypes ((List!35517 0))(
  ( (Nil!35514) (Cons!35513 (h!36949 (_ BitVec 64)) (t!50211 List!35517)) )
))
(declare-fun arrayNoDuplicates!0 (array!101618 (_ BitVec 32) List!35517) Bool)

(assert (=> b!1529389 (= res!1047101 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35514))))

(declare-fun res!1047095 () Bool)

(assert (=> start!130268 (=> (not res!1047095) (not e!852313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130268 (= res!1047095 (validMask!0 mask!2512))))

(assert (=> start!130268 e!852313))

(assert (=> start!130268 true))

(declare-fun array_inv!38062 (array!101618) Bool)

(assert (=> start!130268 (array_inv!38062 a!2804)))

(declare-fun b!1529394 () Bool)

(declare-fun res!1047102 () Bool)

(assert (=> b!1529394 (=> (not res!1047102) (not e!852313))))

(assert (=> b!1529394 (= res!1047102 (validKeyInArray!0 (select (arr!49034 a!2804) i!961)))))

(declare-fun b!1529395 () Bool)

(declare-fun res!1047099 () Bool)

(assert (=> b!1529395 (=> (not res!1047099) (not e!852311))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1529395 (= res!1047099 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49034 a!2804) j!70) a!2804 mask!2512) lt!662417))))

(declare-fun b!1529396 () Bool)

(declare-fun res!1047103 () Bool)

(assert (=> b!1529396 (=> (not res!1047103) (not e!852313))))

(assert (=> b!1529396 (= res!1047103 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49584 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49584 a!2804))))))

(declare-fun b!1529397 () Bool)

(assert (=> b!1529397 (= e!852310 true)))

(declare-fun lt!662419 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529397 (= lt!662419 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529398 () Bool)

(declare-fun res!1047096 () Bool)

(assert (=> b!1529398 (=> (not res!1047096) (not e!852313))))

(assert (=> b!1529398 (= res!1047096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529399 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101618 (_ BitVec 32)) SeekEntryResult!13199)

(assert (=> b!1529399 (= e!852309 (= (seekEntry!0 (select (arr!49034 a!2804) j!70) a!2804 mask!2512) (Found!13199 j!70)))))

(assert (= (and start!130268 res!1047095) b!1529391))

(assert (= (and b!1529391 res!1047100) b!1529394))

(assert (= (and b!1529394 res!1047102) b!1529392))

(assert (= (and b!1529392 res!1047106) b!1529398))

(assert (= (and b!1529398 res!1047096) b!1529389))

(assert (= (and b!1529389 res!1047101) b!1529396))

(assert (= (and b!1529396 res!1047103) b!1529393))

(assert (= (and b!1529393 res!1047104) b!1529395))

(assert (= (and b!1529395 res!1047099) b!1529388))

(assert (= (and b!1529388 res!1047098) b!1529390))

(assert (= (and b!1529390 res!1047105) b!1529399))

(assert (= (and b!1529390 (not res!1047097)) b!1529397))

(declare-fun m!1412331 () Bool)

(assert (=> start!130268 m!1412331))

(declare-fun m!1412333 () Bool)

(assert (=> start!130268 m!1412333))

(declare-fun m!1412335 () Bool)

(assert (=> b!1529392 m!1412335))

(assert (=> b!1529392 m!1412335))

(declare-fun m!1412337 () Bool)

(assert (=> b!1529392 m!1412337))

(declare-fun m!1412339 () Bool)

(assert (=> b!1529389 m!1412339))

(assert (=> b!1529395 m!1412335))

(assert (=> b!1529395 m!1412335))

(declare-fun m!1412341 () Bool)

(assert (=> b!1529395 m!1412341))

(assert (=> b!1529399 m!1412335))

(assert (=> b!1529399 m!1412335))

(declare-fun m!1412343 () Bool)

(assert (=> b!1529399 m!1412343))

(declare-fun m!1412345 () Bool)

(assert (=> b!1529388 m!1412345))

(declare-fun m!1412347 () Bool)

(assert (=> b!1529388 m!1412347))

(assert (=> b!1529388 m!1412347))

(declare-fun m!1412349 () Bool)

(assert (=> b!1529388 m!1412349))

(assert (=> b!1529388 m!1412349))

(assert (=> b!1529388 m!1412347))

(declare-fun m!1412351 () Bool)

(assert (=> b!1529388 m!1412351))

(assert (=> b!1529390 m!1412335))

(declare-fun m!1412353 () Bool)

(assert (=> b!1529390 m!1412353))

(assert (=> b!1529390 m!1412345))

(assert (=> b!1529390 m!1412347))

(declare-fun m!1412355 () Bool)

(assert (=> b!1529390 m!1412355))

(assert (=> b!1529393 m!1412335))

(assert (=> b!1529393 m!1412335))

(declare-fun m!1412357 () Bool)

(assert (=> b!1529393 m!1412357))

(assert (=> b!1529393 m!1412357))

(assert (=> b!1529393 m!1412335))

(declare-fun m!1412359 () Bool)

(assert (=> b!1529393 m!1412359))

(declare-fun m!1412361 () Bool)

(assert (=> b!1529397 m!1412361))

(declare-fun m!1412363 () Bool)

(assert (=> b!1529398 m!1412363))

(declare-fun m!1412365 () Bool)

(assert (=> b!1529394 m!1412365))

(assert (=> b!1529394 m!1412365))

(declare-fun m!1412367 () Bool)

(assert (=> b!1529394 m!1412367))

(push 1)

