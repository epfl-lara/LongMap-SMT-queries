; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130068 () Bool)

(assert start!130068)

(declare-fun b!1527051 () Bool)

(declare-fun res!1045282 () Bool)

(declare-fun e!851096 () Bool)

(assert (=> b!1527051 (=> (not res!1045282) (not e!851096))))

(declare-datatypes ((array!101479 0))(
  ( (array!101480 (arr!48967 (Array (_ BitVec 32) (_ BitVec 64))) (size!49519 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101479)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527051 (= res!1045282 (validKeyInArray!0 (select (arr!48967 a!2804) j!70)))))

(declare-fun b!1527052 () Bool)

(declare-fun res!1045281 () Bool)

(declare-fun e!851098 () Bool)

(assert (=> b!1527052 (=> (not res!1045281) (not e!851098))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13155 0))(
  ( (MissingZero!13155 (index!55015 (_ BitVec 32))) (Found!13155 (index!55016 (_ BitVec 32))) (Intermediate!13155 (undefined!13967 Bool) (index!55017 (_ BitVec 32)) (x!136708 (_ BitVec 32))) (Undefined!13155) (MissingVacant!13155 (index!55018 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13155)

(assert (=> b!1527052 (= res!1045281 (= (seekEntry!0 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) (Found!13155 j!70)))))

(declare-fun b!1527053 () Bool)

(declare-fun e!851101 () Bool)

(declare-fun e!851097 () Bool)

(assert (=> b!1527053 (= e!851101 e!851097)))

(declare-fun res!1045278 () Bool)

(assert (=> b!1527053 (=> (not res!1045278) (not e!851097))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13155)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13155)

(assert (=> b!1527053 (= res!1045278 (= (seekEntryOrOpen!0 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48967 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1045271 () Bool)

(assert (=> start!130068 (=> (not res!1045271) (not e!851096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130068 (= res!1045271 (validMask!0 mask!2512))))

(assert (=> start!130068 e!851096))

(assert (=> start!130068 true))

(declare-fun array_inv!38200 (array!101479) Bool)

(assert (=> start!130068 (array_inv!38200 a!2804)))

(declare-fun b!1527054 () Bool)

(declare-fun res!1045273 () Bool)

(assert (=> b!1527054 (=> (not res!1045273) (not e!851096))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527054 (= res!1045273 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49519 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49519 a!2804))))))

(declare-fun b!1527055 () Bool)

(declare-fun res!1045272 () Bool)

(assert (=> b!1527055 (=> (not res!1045272) (not e!851096))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527055 (= res!1045272 (validKeyInArray!0 (select (arr!48967 a!2804) i!961)))))

(declare-fun b!1527056 () Bool)

(declare-fun res!1045275 () Bool)

(assert (=> b!1527056 (=> (not res!1045275) (not e!851096))))

(declare-datatypes ((List!35528 0))(
  ( (Nil!35525) (Cons!35524 (h!36958 (_ BitVec 64)) (t!50214 List!35528)) )
))
(declare-fun arrayNoDuplicates!0 (array!101479 (_ BitVec 32) List!35528) Bool)

(assert (=> b!1527056 (= res!1045275 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35525))))

(declare-fun b!1527057 () Bool)

(declare-fun e!851099 () Bool)

(assert (=> b!1527057 (= e!851099 (not true))))

(assert (=> b!1527057 e!851098))

(declare-fun res!1045277 () Bool)

(assert (=> b!1527057 (=> (not res!1045277) (not e!851098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101479 (_ BitVec 32)) Bool)

(assert (=> b!1527057 (= res!1045277 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50933 0))(
  ( (Unit!50934) )
))
(declare-fun lt!661118 () Unit!50933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50933)

(assert (=> b!1527057 (= lt!661118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527058 () Bool)

(declare-fun res!1045270 () Bool)

(declare-fun e!851095 () Bool)

(assert (=> b!1527058 (=> (not res!1045270) (not e!851095))))

(declare-fun lt!661122 () SeekEntryResult!13155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13155)

(assert (=> b!1527058 (= res!1045270 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48967 a!2804) j!70) a!2804 mask!2512) lt!661122))))

(declare-fun b!1527059 () Bool)

(assert (=> b!1527059 (= e!851098 e!851101)))

(declare-fun res!1045276 () Bool)

(assert (=> b!1527059 (=> res!1045276 e!851101)))

(declare-fun lt!661119 () (_ BitVec 64))

(assert (=> b!1527059 (= res!1045276 (or (not (= (select (arr!48967 a!2804) j!70) lt!661119)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48967 a!2804) index!487) (select (arr!48967 a!2804) j!70)) (not (= (select (arr!48967 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527060 () Bool)

(assert (=> b!1527060 (= e!851096 e!851095)))

(declare-fun res!1045279 () Bool)

(assert (=> b!1527060 (=> (not res!1045279) (not e!851095))))

(declare-fun lt!661120 () SeekEntryResult!13155)

(assert (=> b!1527060 (= res!1045279 (= lt!661120 lt!661122))))

(assert (=> b!1527060 (= lt!661122 (Intermediate!13155 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527060 (= lt!661120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48967 a!2804) j!70) mask!2512) (select (arr!48967 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527061 () Bool)

(declare-fun res!1045274 () Bool)

(assert (=> b!1527061 (=> (not res!1045274) (not e!851096))))

(assert (=> b!1527061 (= res!1045274 (and (= (size!49519 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49519 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49519 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527062 () Bool)

(declare-fun res!1045269 () Bool)

(assert (=> b!1527062 (=> (not res!1045269) (not e!851096))))

(assert (=> b!1527062 (= res!1045269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun lt!661121 () array!101479)

(declare-fun b!1527063 () Bool)

(assert (=> b!1527063 (= e!851097 (= (seekEntryOrOpen!0 lt!661119 lt!661121 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661119 lt!661121 mask!2512)))))

(declare-fun b!1527064 () Bool)

(assert (=> b!1527064 (= e!851095 e!851099)))

(declare-fun res!1045280 () Bool)

(assert (=> b!1527064 (=> (not res!1045280) (not e!851099))))

(assert (=> b!1527064 (= res!1045280 (= lt!661120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661119 mask!2512) lt!661119 lt!661121 mask!2512)))))

(assert (=> b!1527064 (= lt!661119 (select (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527064 (= lt!661121 (array!101480 (store (arr!48967 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49519 a!2804)))))

(assert (= (and start!130068 res!1045271) b!1527061))

(assert (= (and b!1527061 res!1045274) b!1527055))

(assert (= (and b!1527055 res!1045272) b!1527051))

(assert (= (and b!1527051 res!1045282) b!1527062))

(assert (= (and b!1527062 res!1045269) b!1527056))

(assert (= (and b!1527056 res!1045275) b!1527054))

(assert (= (and b!1527054 res!1045273) b!1527060))

(assert (= (and b!1527060 res!1045279) b!1527058))

(assert (= (and b!1527058 res!1045270) b!1527064))

(assert (= (and b!1527064 res!1045280) b!1527057))

(assert (= (and b!1527057 res!1045277) b!1527052))

(assert (= (and b!1527052 res!1045281) b!1527059))

(assert (= (and b!1527059 (not res!1045276)) b!1527053))

(assert (= (and b!1527053 res!1045278) b!1527063))

(declare-fun m!1409363 () Bool)

(assert (=> b!1527063 m!1409363))

(declare-fun m!1409365 () Bool)

(assert (=> b!1527063 m!1409365))

(declare-fun m!1409367 () Bool)

(assert (=> b!1527057 m!1409367))

(declare-fun m!1409369 () Bool)

(assert (=> b!1527057 m!1409369))

(declare-fun m!1409371 () Bool)

(assert (=> b!1527051 m!1409371))

(assert (=> b!1527051 m!1409371))

(declare-fun m!1409373 () Bool)

(assert (=> b!1527051 m!1409373))

(assert (=> b!1527052 m!1409371))

(assert (=> b!1527052 m!1409371))

(declare-fun m!1409375 () Bool)

(assert (=> b!1527052 m!1409375))

(assert (=> b!1527059 m!1409371))

(declare-fun m!1409377 () Bool)

(assert (=> b!1527059 m!1409377))

(assert (=> b!1527058 m!1409371))

(assert (=> b!1527058 m!1409371))

(declare-fun m!1409379 () Bool)

(assert (=> b!1527058 m!1409379))

(declare-fun m!1409381 () Bool)

(assert (=> start!130068 m!1409381))

(declare-fun m!1409383 () Bool)

(assert (=> start!130068 m!1409383))

(declare-fun m!1409385 () Bool)

(assert (=> b!1527056 m!1409385))

(assert (=> b!1527053 m!1409371))

(assert (=> b!1527053 m!1409371))

(declare-fun m!1409387 () Bool)

(assert (=> b!1527053 m!1409387))

(assert (=> b!1527053 m!1409371))

(declare-fun m!1409389 () Bool)

(assert (=> b!1527053 m!1409389))

(declare-fun m!1409391 () Bool)

(assert (=> b!1527055 m!1409391))

(assert (=> b!1527055 m!1409391))

(declare-fun m!1409393 () Bool)

(assert (=> b!1527055 m!1409393))

(declare-fun m!1409395 () Bool)

(assert (=> b!1527062 m!1409395))

(assert (=> b!1527060 m!1409371))

(assert (=> b!1527060 m!1409371))

(declare-fun m!1409397 () Bool)

(assert (=> b!1527060 m!1409397))

(assert (=> b!1527060 m!1409397))

(assert (=> b!1527060 m!1409371))

(declare-fun m!1409399 () Bool)

(assert (=> b!1527060 m!1409399))

(declare-fun m!1409401 () Bool)

(assert (=> b!1527064 m!1409401))

(assert (=> b!1527064 m!1409401))

(declare-fun m!1409403 () Bool)

(assert (=> b!1527064 m!1409403))

(declare-fun m!1409405 () Bool)

(assert (=> b!1527064 m!1409405))

(declare-fun m!1409407 () Bool)

(assert (=> b!1527064 m!1409407))

(check-sat (not start!130068) (not b!1527055) (not b!1527053) (not b!1527064) (not b!1527063) (not b!1527052) (not b!1527056) (not b!1527057) (not b!1527060) (not b!1527051) (not b!1527062) (not b!1527058))
(check-sat)
