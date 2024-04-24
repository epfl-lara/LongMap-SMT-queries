; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129344 () Bool)

(assert start!129344)

(declare-fun res!1034094 () Bool)

(declare-fun e!845854 () Bool)

(assert (=> start!129344 (=> (not res!1034094) (not e!845854))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129344 (= res!1034094 (validMask!0 mask!2512))))

(assert (=> start!129344 e!845854))

(assert (=> start!129344 true))

(declare-datatypes ((array!101014 0))(
  ( (array!101015 (arr!48739 (Array (_ BitVec 32) (_ BitVec 64))) (size!49290 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101014)

(declare-fun array_inv!38020 (array!101014) Bool)

(assert (=> start!129344 (array_inv!38020 a!2804)))

(declare-fun b!1515363 () Bool)

(declare-fun res!1034100 () Bool)

(assert (=> b!1515363 (=> (not res!1034100) (not e!845854))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515363 (= res!1034100 (validKeyInArray!0 (select (arr!48739 a!2804) i!961)))))

(declare-fun b!1515364 () Bool)

(declare-fun res!1034089 () Bool)

(assert (=> b!1515364 (=> (not res!1034089) (not e!845854))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515364 (= res!1034089 (validKeyInArray!0 (select (arr!48739 a!2804) j!70)))))

(declare-fun b!1515365 () Bool)

(declare-fun e!845855 () Bool)

(declare-fun e!845851 () Bool)

(assert (=> b!1515365 (= e!845855 e!845851)))

(declare-fun res!1034092 () Bool)

(assert (=> b!1515365 (=> (not res!1034092) (not e!845851))))

(declare-fun lt!656673 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12803 0))(
  ( (MissingZero!12803 (index!53607 (_ BitVec 32))) (Found!12803 (index!53608 (_ BitVec 32))) (Intermediate!12803 (undefined!13615 Bool) (index!53609 (_ BitVec 32)) (x!135526 (_ BitVec 32))) (Undefined!12803) (MissingVacant!12803 (index!53610 (_ BitVec 32))) )
))
(declare-fun lt!656677 () SeekEntryResult!12803)

(declare-fun lt!656676 () array!101014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12803)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515365 (= res!1034092 (= lt!656677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656673 mask!2512) lt!656673 lt!656676 mask!2512)))))

(assert (=> b!1515365 (= lt!656673 (select (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515365 (= lt!656676 (array!101015 (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49290 a!2804)))))

(declare-fun b!1515366 () Bool)

(declare-fun res!1034091 () Bool)

(assert (=> b!1515366 (=> (not res!1034091) (not e!845854))))

(assert (=> b!1515366 (= res!1034091 (and (= (size!49290 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49290 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49290 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515367 () Bool)

(assert (=> b!1515367 (= e!845854 e!845855)))

(declare-fun res!1034090 () Bool)

(assert (=> b!1515367 (=> (not res!1034090) (not e!845855))))

(declare-fun lt!656675 () SeekEntryResult!12803)

(assert (=> b!1515367 (= res!1034090 (= lt!656677 lt!656675))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515367 (= lt!656675 (Intermediate!12803 false resIndex!21 resX!21))))

(assert (=> b!1515367 (= lt!656677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48739 a!2804) j!70) mask!2512) (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515368 () Bool)

(declare-fun res!1034098 () Bool)

(assert (=> b!1515368 (=> (not res!1034098) (not e!845854))))

(declare-datatypes ((List!35209 0))(
  ( (Nil!35206) (Cons!35205 (h!36632 (_ BitVec 64)) (t!49895 List!35209)) )
))
(declare-fun arrayNoDuplicates!0 (array!101014 (_ BitVec 32) List!35209) Bool)

(assert (=> b!1515368 (= res!1034098 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35206))))

(declare-fun b!1515369 () Bool)

(declare-fun e!845856 () Bool)

(declare-fun e!845850 () Bool)

(assert (=> b!1515369 (= e!845856 e!845850)))

(declare-fun res!1034095 () Bool)

(assert (=> b!1515369 (=> (not res!1034095) (not e!845850))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12803)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12803)

(assert (=> b!1515369 (= res!1034095 (= (seekEntryOrOpen!0 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48739 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1515370 () Bool)

(assert (=> b!1515370 (= e!845851 (not true))))

(declare-fun e!845852 () Bool)

(assert (=> b!1515370 e!845852))

(declare-fun res!1034093 () Bool)

(assert (=> b!1515370 (=> (not res!1034093) (not e!845852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101014 (_ BitVec 32)) Bool)

(assert (=> b!1515370 (= res!1034093 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50509 0))(
  ( (Unit!50510) )
))
(declare-fun lt!656674 () Unit!50509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50509)

(assert (=> b!1515370 (= lt!656674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515371 () Bool)

(declare-fun res!1034097 () Bool)

(assert (=> b!1515371 (=> (not res!1034097) (not e!845852))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12803)

(assert (=> b!1515371 (= res!1034097 (= (seekEntry!0 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) (Found!12803 j!70)))))

(declare-fun b!1515372 () Bool)

(assert (=> b!1515372 (= e!845852 e!845856)))

(declare-fun res!1034102 () Bool)

(assert (=> b!1515372 (=> res!1034102 e!845856)))

(assert (=> b!1515372 (= res!1034102 (or (not (= (select (arr!48739 a!2804) j!70) lt!656673)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48739 a!2804) index!487) (select (arr!48739 a!2804) j!70)) (not (= (select (arr!48739 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515373 () Bool)

(declare-fun res!1034099 () Bool)

(assert (=> b!1515373 (=> (not res!1034099) (not e!845854))))

(assert (=> b!1515373 (= res!1034099 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49290 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49290 a!2804))))))

(declare-fun b!1515374 () Bool)

(declare-fun res!1034096 () Bool)

(assert (=> b!1515374 (=> (not res!1034096) (not e!845855))))

(assert (=> b!1515374 (= res!1034096 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) lt!656675))))

(declare-fun b!1515375 () Bool)

(assert (=> b!1515375 (= e!845850 (= (seekEntryOrOpen!0 lt!656673 lt!656676 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656673 lt!656676 mask!2512)))))

(declare-fun b!1515376 () Bool)

(declare-fun res!1034101 () Bool)

(assert (=> b!1515376 (=> (not res!1034101) (not e!845854))))

(assert (=> b!1515376 (= res!1034101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129344 res!1034094) b!1515366))

(assert (= (and b!1515366 res!1034091) b!1515363))

(assert (= (and b!1515363 res!1034100) b!1515364))

(assert (= (and b!1515364 res!1034089) b!1515376))

(assert (= (and b!1515376 res!1034101) b!1515368))

(assert (= (and b!1515368 res!1034098) b!1515373))

(assert (= (and b!1515373 res!1034099) b!1515367))

(assert (= (and b!1515367 res!1034090) b!1515374))

(assert (= (and b!1515374 res!1034096) b!1515365))

(assert (= (and b!1515365 res!1034092) b!1515370))

(assert (= (and b!1515370 res!1034093) b!1515371))

(assert (= (and b!1515371 res!1034097) b!1515372))

(assert (= (and b!1515372 (not res!1034102)) b!1515369))

(assert (= (and b!1515369 res!1034095) b!1515375))

(declare-fun m!1398195 () Bool)

(assert (=> b!1515363 m!1398195))

(assert (=> b!1515363 m!1398195))

(declare-fun m!1398197 () Bool)

(assert (=> b!1515363 m!1398197))

(declare-fun m!1398199 () Bool)

(assert (=> b!1515372 m!1398199))

(declare-fun m!1398201 () Bool)

(assert (=> b!1515372 m!1398201))

(declare-fun m!1398203 () Bool)

(assert (=> b!1515376 m!1398203))

(assert (=> b!1515364 m!1398199))

(assert (=> b!1515364 m!1398199))

(declare-fun m!1398205 () Bool)

(assert (=> b!1515364 m!1398205))

(assert (=> b!1515374 m!1398199))

(assert (=> b!1515374 m!1398199))

(declare-fun m!1398207 () Bool)

(assert (=> b!1515374 m!1398207))

(assert (=> b!1515367 m!1398199))

(assert (=> b!1515367 m!1398199))

(declare-fun m!1398209 () Bool)

(assert (=> b!1515367 m!1398209))

(assert (=> b!1515367 m!1398209))

(assert (=> b!1515367 m!1398199))

(declare-fun m!1398211 () Bool)

(assert (=> b!1515367 m!1398211))

(assert (=> b!1515371 m!1398199))

(assert (=> b!1515371 m!1398199))

(declare-fun m!1398213 () Bool)

(assert (=> b!1515371 m!1398213))

(declare-fun m!1398215 () Bool)

(assert (=> b!1515365 m!1398215))

(assert (=> b!1515365 m!1398215))

(declare-fun m!1398217 () Bool)

(assert (=> b!1515365 m!1398217))

(declare-fun m!1398219 () Bool)

(assert (=> b!1515365 m!1398219))

(declare-fun m!1398221 () Bool)

(assert (=> b!1515365 m!1398221))

(declare-fun m!1398223 () Bool)

(assert (=> b!1515368 m!1398223))

(assert (=> b!1515369 m!1398199))

(assert (=> b!1515369 m!1398199))

(declare-fun m!1398225 () Bool)

(assert (=> b!1515369 m!1398225))

(assert (=> b!1515369 m!1398199))

(declare-fun m!1398227 () Bool)

(assert (=> b!1515369 m!1398227))

(declare-fun m!1398229 () Bool)

(assert (=> b!1515370 m!1398229))

(declare-fun m!1398231 () Bool)

(assert (=> b!1515370 m!1398231))

(declare-fun m!1398233 () Bool)

(assert (=> b!1515375 m!1398233))

(declare-fun m!1398235 () Bool)

(assert (=> b!1515375 m!1398235))

(declare-fun m!1398237 () Bool)

(assert (=> start!129344 m!1398237))

(declare-fun m!1398239 () Bool)

(assert (=> start!129344 m!1398239))

(check-sat (not b!1515365) (not b!1515370) (not b!1515371) (not b!1515369) (not b!1515363) (not b!1515367) (not b!1515375) (not start!129344) (not b!1515376) (not b!1515374) (not b!1515364) (not b!1515368))
(check-sat)
