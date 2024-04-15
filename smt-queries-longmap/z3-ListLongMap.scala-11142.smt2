; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130164 () Bool)

(assert start!130164)

(declare-fun b!1528078 () Bool)

(declare-fun res!1045969 () Bool)

(declare-fun e!851662 () Bool)

(assert (=> b!1528078 (=> (not res!1045969) (not e!851662))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101512 0))(
  ( (array!101513 (arr!48982 (Array (_ BitVec 32) (_ BitVec 64))) (size!49534 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101512)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13170 0))(
  ( (MissingZero!13170 (index!55075 (_ BitVec 32))) (Found!13170 (index!55076 (_ BitVec 32))) (Intermediate!13170 (undefined!13982 Bool) (index!55077 (_ BitVec 32)) (x!136772 (_ BitVec 32))) (Undefined!13170) (MissingVacant!13170 (index!55078 (_ BitVec 32))) )
))
(declare-fun lt!661662 () SeekEntryResult!13170)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101512 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528078 (= res!1045969 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!661662))))

(declare-fun b!1528079 () Bool)

(declare-fun res!1045979 () Bool)

(declare-fun e!851661 () Bool)

(assert (=> b!1528079 (=> (not res!1045979) (not e!851661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101512 (_ BitVec 32)) Bool)

(assert (=> b!1528079 (= res!1045979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528080 () Bool)

(declare-fun e!851660 () Bool)

(assert (=> b!1528080 (= e!851660 true)))

(declare-fun lt!661661 () SeekEntryResult!13170)

(declare-fun lt!661656 () SeekEntryResult!13170)

(assert (=> b!1528080 (= lt!661661 lt!661656)))

(declare-datatypes ((Unit!50963 0))(
  ( (Unit!50964) )
))
(declare-fun lt!661658 () Unit!50963)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50963)

(assert (=> b!1528080 (= lt!661658 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528081 () Bool)

(declare-fun res!1045970 () Bool)

(assert (=> b!1528081 (=> (not res!1045970) (not e!851661))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528081 (= res!1045970 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49534 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49534 a!2804))))))

(declare-fun e!851656 () Bool)

(declare-fun b!1528082 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101512 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528082 (= e!851656 (= (seekEntry!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (Found!13170 j!70)))))

(declare-fun res!1045975 () Bool)

(assert (=> start!130164 (=> (not res!1045975) (not e!851661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130164 (= res!1045975 (validMask!0 mask!2512))))

(assert (=> start!130164 e!851661))

(assert (=> start!130164 true))

(declare-fun array_inv!38215 (array!101512) Bool)

(assert (=> start!130164 (array_inv!38215 a!2804)))

(declare-fun b!1528083 () Bool)

(declare-fun res!1045973 () Bool)

(assert (=> b!1528083 (=> (not res!1045973) (not e!851661))))

(assert (=> b!1528083 (= res!1045973 (and (= (size!49534 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49534 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49534 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528084 () Bool)

(declare-fun e!851659 () Bool)

(assert (=> b!1528084 (= e!851659 e!851660)))

(declare-fun res!1045971 () Bool)

(assert (=> b!1528084 (=> res!1045971 e!851660)))

(assert (=> b!1528084 (= res!1045971 (not (= lt!661656 (Found!13170 j!70))))))

(declare-fun lt!661663 () SeekEntryResult!13170)

(assert (=> b!1528084 (= lt!661663 lt!661661)))

(declare-fun lt!661659 () array!101512)

(declare-fun lt!661665 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101512 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528084 (= lt!661661 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661665 lt!661659 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101512 (_ BitVec 32)) SeekEntryResult!13170)

(assert (=> b!1528084 (= lt!661663 (seekEntryOrOpen!0 lt!661665 lt!661659 mask!2512))))

(declare-fun lt!661657 () SeekEntryResult!13170)

(assert (=> b!1528084 (= lt!661657 lt!661656)))

(assert (=> b!1528084 (= lt!661656 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528084 (= lt!661657 (seekEntryOrOpen!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528085 () Bool)

(declare-fun e!851657 () Bool)

(assert (=> b!1528085 (= e!851657 (not e!851659))))

(declare-fun res!1045977 () Bool)

(assert (=> b!1528085 (=> res!1045977 e!851659)))

(assert (=> b!1528085 (= res!1045977 (or (not (= (select (arr!48982 a!2804) j!70) lt!661665)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48982 a!2804) index!487) (select (arr!48982 a!2804) j!70)) (not (= (select (arr!48982 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528085 e!851656))

(declare-fun res!1045972 () Bool)

(assert (=> b!1528085 (=> (not res!1045972) (not e!851656))))

(assert (=> b!1528085 (= res!1045972 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!661660 () Unit!50963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50963)

(assert (=> b!1528085 (= lt!661660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528086 () Bool)

(declare-fun res!1045976 () Bool)

(assert (=> b!1528086 (=> (not res!1045976) (not e!851661))))

(declare-datatypes ((List!35543 0))(
  ( (Nil!35540) (Cons!35539 (h!36976 (_ BitVec 64)) (t!50229 List!35543)) )
))
(declare-fun arrayNoDuplicates!0 (array!101512 (_ BitVec 32) List!35543) Bool)

(assert (=> b!1528086 (= res!1045976 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35540))))

(declare-fun b!1528087 () Bool)

(assert (=> b!1528087 (= e!851662 e!851657)))

(declare-fun res!1045974 () Bool)

(assert (=> b!1528087 (=> (not res!1045974) (not e!851657))))

(declare-fun lt!661664 () SeekEntryResult!13170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528087 (= res!1045974 (= lt!661664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661665 mask!2512) lt!661665 lt!661659 mask!2512)))))

(assert (=> b!1528087 (= lt!661665 (select (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528087 (= lt!661659 (array!101513 (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49534 a!2804)))))

(declare-fun b!1528088 () Bool)

(declare-fun res!1045981 () Bool)

(assert (=> b!1528088 (=> (not res!1045981) (not e!851661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528088 (= res!1045981 (validKeyInArray!0 (select (arr!48982 a!2804) i!961)))))

(declare-fun b!1528089 () Bool)

(declare-fun res!1045978 () Bool)

(assert (=> b!1528089 (=> (not res!1045978) (not e!851661))))

(assert (=> b!1528089 (= res!1045978 (validKeyInArray!0 (select (arr!48982 a!2804) j!70)))))

(declare-fun b!1528090 () Bool)

(assert (=> b!1528090 (= e!851661 e!851662)))

(declare-fun res!1045980 () Bool)

(assert (=> b!1528090 (=> (not res!1045980) (not e!851662))))

(assert (=> b!1528090 (= res!1045980 (= lt!661664 lt!661662))))

(assert (=> b!1528090 (= lt!661662 (Intermediate!13170 false resIndex!21 resX!21))))

(assert (=> b!1528090 (= lt!661664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130164 res!1045975) b!1528083))

(assert (= (and b!1528083 res!1045973) b!1528088))

(assert (= (and b!1528088 res!1045981) b!1528089))

(assert (= (and b!1528089 res!1045978) b!1528079))

(assert (= (and b!1528079 res!1045979) b!1528086))

(assert (= (and b!1528086 res!1045976) b!1528081))

(assert (= (and b!1528081 res!1045970) b!1528090))

(assert (= (and b!1528090 res!1045980) b!1528078))

(assert (= (and b!1528078 res!1045969) b!1528087))

(assert (= (and b!1528087 res!1045974) b!1528085))

(assert (= (and b!1528085 res!1045972) b!1528082))

(assert (= (and b!1528085 (not res!1045977)) b!1528084))

(assert (= (and b!1528084 (not res!1045971)) b!1528080))

(declare-fun m!1410323 () Bool)

(assert (=> b!1528089 m!1410323))

(assert (=> b!1528089 m!1410323))

(declare-fun m!1410325 () Bool)

(assert (=> b!1528089 m!1410325))

(declare-fun m!1410327 () Bool)

(assert (=> start!130164 m!1410327))

(declare-fun m!1410329 () Bool)

(assert (=> start!130164 m!1410329))

(declare-fun m!1410331 () Bool)

(assert (=> b!1528080 m!1410331))

(declare-fun m!1410333 () Bool)

(assert (=> b!1528086 m!1410333))

(declare-fun m!1410335 () Bool)

(assert (=> b!1528087 m!1410335))

(assert (=> b!1528087 m!1410335))

(declare-fun m!1410337 () Bool)

(assert (=> b!1528087 m!1410337))

(declare-fun m!1410339 () Bool)

(assert (=> b!1528087 m!1410339))

(declare-fun m!1410341 () Bool)

(assert (=> b!1528087 m!1410341))

(declare-fun m!1410343 () Bool)

(assert (=> b!1528088 m!1410343))

(assert (=> b!1528088 m!1410343))

(declare-fun m!1410345 () Bool)

(assert (=> b!1528088 m!1410345))

(assert (=> b!1528090 m!1410323))

(assert (=> b!1528090 m!1410323))

(declare-fun m!1410347 () Bool)

(assert (=> b!1528090 m!1410347))

(assert (=> b!1528090 m!1410347))

(assert (=> b!1528090 m!1410323))

(declare-fun m!1410349 () Bool)

(assert (=> b!1528090 m!1410349))

(assert (=> b!1528082 m!1410323))

(assert (=> b!1528082 m!1410323))

(declare-fun m!1410351 () Bool)

(assert (=> b!1528082 m!1410351))

(declare-fun m!1410353 () Bool)

(assert (=> b!1528079 m!1410353))

(assert (=> b!1528078 m!1410323))

(assert (=> b!1528078 m!1410323))

(declare-fun m!1410355 () Bool)

(assert (=> b!1528078 m!1410355))

(assert (=> b!1528084 m!1410323))

(declare-fun m!1410357 () Bool)

(assert (=> b!1528084 m!1410357))

(assert (=> b!1528084 m!1410323))

(declare-fun m!1410359 () Bool)

(assert (=> b!1528084 m!1410359))

(declare-fun m!1410361 () Bool)

(assert (=> b!1528084 m!1410361))

(assert (=> b!1528084 m!1410323))

(declare-fun m!1410363 () Bool)

(assert (=> b!1528084 m!1410363))

(assert (=> b!1528085 m!1410323))

(declare-fun m!1410365 () Bool)

(assert (=> b!1528085 m!1410365))

(declare-fun m!1410367 () Bool)

(assert (=> b!1528085 m!1410367))

(declare-fun m!1410369 () Bool)

(assert (=> b!1528085 m!1410369))

(check-sat (not b!1528084) (not start!130164) (not b!1528082) (not b!1528086) (not b!1528080) (not b!1528088) (not b!1528079) (not b!1528090) (not b!1528087) (not b!1528078) (not b!1528085) (not b!1528089))
(check-sat)
