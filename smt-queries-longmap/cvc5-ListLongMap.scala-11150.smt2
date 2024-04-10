; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130262 () Bool)

(assert start!130262)

(declare-fun b!1529280 () Bool)

(declare-fun e!852265 () Bool)

(declare-fun e!852268 () Bool)

(assert (=> b!1529280 (= e!852265 (not e!852268))))

(declare-fun res!1046997 () Bool)

(assert (=> b!1529280 (=> res!1046997 e!852268)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101612 0))(
  ( (array!101613 (arr!49031 (Array (_ BitVec 32) (_ BitVec 64))) (size!49581 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101612)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529280 (= res!1046997 (or (not (= (select (arr!49031 a!2804) j!70) (select (store (arr!49031 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852266 () Bool)

(assert (=> b!1529280 e!852266))

(declare-fun res!1046992 () Bool)

(assert (=> b!1529280 (=> (not res!1046992) (not e!852266))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101612 (_ BitVec 32)) Bool)

(assert (=> b!1529280 (= res!1046992 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51176 0))(
  ( (Unit!51177) )
))
(declare-fun lt!662383 () Unit!51176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51176)

(assert (=> b!1529280 (= lt!662383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529281 () Bool)

(declare-fun res!1046995 () Bool)

(declare-fun e!852264 () Bool)

(assert (=> b!1529281 (=> (not res!1046995) (not e!852264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529281 (= res!1046995 (validKeyInArray!0 (select (arr!49031 a!2804) j!70)))))

(declare-fun res!1046990 () Bool)

(assert (=> start!130262 (=> (not res!1046990) (not e!852264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130262 (= res!1046990 (validMask!0 mask!2512))))

(assert (=> start!130262 e!852264))

(assert (=> start!130262 true))

(declare-fun array_inv!38059 (array!101612) Bool)

(assert (=> start!130262 (array_inv!38059 a!2804)))

(declare-fun b!1529282 () Bool)

(declare-fun res!1046993 () Bool)

(assert (=> b!1529282 (=> (not res!1046993) (not e!852265))))

(declare-datatypes ((SeekEntryResult!13196 0))(
  ( (MissingZero!13196 (index!55179 (_ BitVec 32))) (Found!13196 (index!55180 (_ BitVec 32))) (Intermediate!13196 (undefined!14008 Bool) (index!55181 (_ BitVec 32)) (x!136867 (_ BitVec 32))) (Undefined!13196) (MissingVacant!13196 (index!55182 (_ BitVec 32))) )
))
(declare-fun lt!662380 () SeekEntryResult!13196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101612 (_ BitVec 32)) SeekEntryResult!13196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529282 (= res!1046993 (= lt!662380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49031 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49031 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101613 (store (arr!49031 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49581 a!2804)) mask!2512)))))

(declare-fun b!1529283 () Bool)

(declare-fun res!1046988 () Bool)

(assert (=> b!1529283 (=> (not res!1046988) (not e!852264))))

(assert (=> b!1529283 (= res!1046988 (validKeyInArray!0 (select (arr!49031 a!2804) i!961)))))

(declare-fun b!1529284 () Bool)

(declare-fun res!1046991 () Bool)

(assert (=> b!1529284 (=> (not res!1046991) (not e!852264))))

(assert (=> b!1529284 (= res!1046991 (and (= (size!49581 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49581 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49581 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529285 () Bool)

(declare-fun res!1046994 () Bool)

(assert (=> b!1529285 (=> (not res!1046994) (not e!852264))))

(declare-datatypes ((List!35514 0))(
  ( (Nil!35511) (Cons!35510 (h!36946 (_ BitVec 64)) (t!50208 List!35514)) )
))
(declare-fun arrayNoDuplicates!0 (array!101612 (_ BitVec 32) List!35514) Bool)

(assert (=> b!1529285 (= res!1046994 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35511))))

(declare-fun b!1529286 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101612 (_ BitVec 32)) SeekEntryResult!13196)

(assert (=> b!1529286 (= e!852266 (= (seekEntry!0 (select (arr!49031 a!2804) j!70) a!2804 mask!2512) (Found!13196 j!70)))))

(declare-fun b!1529287 () Bool)

(assert (=> b!1529287 (= e!852264 e!852265)))

(declare-fun res!1046987 () Bool)

(assert (=> b!1529287 (=> (not res!1046987) (not e!852265))))

(declare-fun lt!662381 () SeekEntryResult!13196)

(assert (=> b!1529287 (= res!1046987 (= lt!662380 lt!662381))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529287 (= lt!662381 (Intermediate!13196 false resIndex!21 resX!21))))

(assert (=> b!1529287 (= lt!662380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49031 a!2804) j!70) mask!2512) (select (arr!49031 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529288 () Bool)

(declare-fun res!1046989 () Bool)

(assert (=> b!1529288 (=> (not res!1046989) (not e!852264))))

(assert (=> b!1529288 (= res!1046989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529289 () Bool)

(declare-fun res!1046998 () Bool)

(assert (=> b!1529289 (=> (not res!1046998) (not e!852264))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1529289 (= res!1046998 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49581 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49581 a!2804))))))

(declare-fun b!1529290 () Bool)

(declare-fun res!1046996 () Bool)

(assert (=> b!1529290 (=> (not res!1046996) (not e!852265))))

(assert (=> b!1529290 (= res!1046996 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49031 a!2804) j!70) a!2804 mask!2512) lt!662381))))

(declare-fun b!1529291 () Bool)

(assert (=> b!1529291 (= e!852268 true)))

(declare-fun lt!662382 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529291 (= lt!662382 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130262 res!1046990) b!1529284))

(assert (= (and b!1529284 res!1046991) b!1529283))

(assert (= (and b!1529283 res!1046988) b!1529281))

(assert (= (and b!1529281 res!1046995) b!1529288))

(assert (= (and b!1529288 res!1046989) b!1529285))

(assert (= (and b!1529285 res!1046994) b!1529289))

(assert (= (and b!1529289 res!1046998) b!1529287))

(assert (= (and b!1529287 res!1046987) b!1529290))

(assert (= (and b!1529290 res!1046996) b!1529282))

(assert (= (and b!1529282 res!1046993) b!1529280))

(assert (= (and b!1529280 res!1046992) b!1529286))

(assert (= (and b!1529280 (not res!1046997)) b!1529291))

(declare-fun m!1412217 () Bool)

(assert (=> b!1529291 m!1412217))

(declare-fun m!1412219 () Bool)

(assert (=> b!1529285 m!1412219))

(declare-fun m!1412221 () Bool)

(assert (=> b!1529281 m!1412221))

(assert (=> b!1529281 m!1412221))

(declare-fun m!1412223 () Bool)

(assert (=> b!1529281 m!1412223))

(assert (=> b!1529286 m!1412221))

(assert (=> b!1529286 m!1412221))

(declare-fun m!1412225 () Bool)

(assert (=> b!1529286 m!1412225))

(assert (=> b!1529280 m!1412221))

(declare-fun m!1412227 () Bool)

(assert (=> b!1529280 m!1412227))

(declare-fun m!1412229 () Bool)

(assert (=> b!1529280 m!1412229))

(declare-fun m!1412231 () Bool)

(assert (=> b!1529280 m!1412231))

(declare-fun m!1412233 () Bool)

(assert (=> b!1529280 m!1412233))

(declare-fun m!1412235 () Bool)

(assert (=> b!1529283 m!1412235))

(assert (=> b!1529283 m!1412235))

(declare-fun m!1412237 () Bool)

(assert (=> b!1529283 m!1412237))

(assert (=> b!1529282 m!1412229))

(assert (=> b!1529282 m!1412231))

(assert (=> b!1529282 m!1412231))

(declare-fun m!1412239 () Bool)

(assert (=> b!1529282 m!1412239))

(assert (=> b!1529282 m!1412239))

(assert (=> b!1529282 m!1412231))

(declare-fun m!1412241 () Bool)

(assert (=> b!1529282 m!1412241))

(assert (=> b!1529290 m!1412221))

(assert (=> b!1529290 m!1412221))

(declare-fun m!1412243 () Bool)

(assert (=> b!1529290 m!1412243))

(declare-fun m!1412245 () Bool)

(assert (=> b!1529288 m!1412245))

(assert (=> b!1529287 m!1412221))

(assert (=> b!1529287 m!1412221))

(declare-fun m!1412247 () Bool)

(assert (=> b!1529287 m!1412247))

(assert (=> b!1529287 m!1412247))

(assert (=> b!1529287 m!1412221))

(declare-fun m!1412249 () Bool)

(assert (=> b!1529287 m!1412249))

(declare-fun m!1412251 () Bool)

(assert (=> start!130262 m!1412251))

(declare-fun m!1412253 () Bool)

(assert (=> start!130262 m!1412253))

(push 1)

