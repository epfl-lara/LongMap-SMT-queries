; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129392 () Bool)

(assert start!129392)

(declare-fun b!1516371 () Bool)

(declare-fun res!1035110 () Bool)

(declare-fun e!846358 () Bool)

(assert (=> b!1516371 (=> (not res!1035110) (not e!846358))))

(declare-datatypes ((array!101062 0))(
  ( (array!101063 (arr!48763 (Array (_ BitVec 32) (_ BitVec 64))) (size!49314 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101062)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516371 (= res!1035110 (validKeyInArray!0 (select (arr!48763 a!2804) i!961)))))

(declare-fun b!1516372 () Bool)

(declare-fun res!1035101 () Bool)

(assert (=> b!1516372 (=> (not res!1035101) (not e!846358))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1516372 (= res!1035101 (validKeyInArray!0 (select (arr!48763 a!2804) j!70)))))

(declare-fun b!1516373 () Bool)

(declare-fun res!1035099 () Bool)

(declare-fun e!846360 () Bool)

(assert (=> b!1516373 (=> (not res!1035099) (not e!846360))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12827 0))(
  ( (MissingZero!12827 (index!53703 (_ BitVec 32))) (Found!12827 (index!53704 (_ BitVec 32))) (Intermediate!12827 (undefined!13639 Bool) (index!53705 (_ BitVec 32)) (x!135614 (_ BitVec 32))) (Undefined!12827) (MissingVacant!12827 (index!53706 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12827)

(assert (=> b!1516373 (= res!1035099 (= (seekEntry!0 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) (Found!12827 j!70)))))

(declare-fun b!1516374 () Bool)

(declare-fun res!1035104 () Bool)

(assert (=> b!1516374 (=> (not res!1035104) (not e!846358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101062 (_ BitVec 32)) Bool)

(assert (=> b!1516374 (= res!1035104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun lt!657033 () array!101062)

(declare-fun b!1516375 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657035 () (_ BitVec 64))

(declare-fun e!846359 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12827)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12827)

(assert (=> b!1516375 (= e!846359 (= (seekEntryOrOpen!0 lt!657035 lt!657033 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657035 lt!657033 mask!2512)))))

(declare-fun b!1516376 () Bool)

(declare-fun res!1035102 () Bool)

(assert (=> b!1516376 (=> (not res!1035102) (not e!846358))))

(assert (=> b!1516376 (= res!1035102 (and (= (size!49314 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49314 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49314 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516377 () Bool)

(declare-fun res!1035106 () Bool)

(assert (=> b!1516377 (=> (not res!1035106) (not e!846358))))

(declare-datatypes ((List!35233 0))(
  ( (Nil!35230) (Cons!35229 (h!36656 (_ BitVec 64)) (t!49919 List!35233)) )
))
(declare-fun arrayNoDuplicates!0 (array!101062 (_ BitVec 32) List!35233) Bool)

(assert (=> b!1516377 (= res!1035106 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35230))))

(declare-fun res!1035105 () Bool)

(assert (=> start!129392 (=> (not res!1035105) (not e!846358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129392 (= res!1035105 (validMask!0 mask!2512))))

(assert (=> start!129392 e!846358))

(assert (=> start!129392 true))

(declare-fun array_inv!38044 (array!101062) Bool)

(assert (=> start!129392 (array_inv!38044 a!2804)))

(declare-fun b!1516378 () Bool)

(declare-fun res!1035107 () Bool)

(declare-fun e!846356 () Bool)

(assert (=> b!1516378 (=> (not res!1035107) (not e!846356))))

(declare-fun lt!657036 () SeekEntryResult!12827)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12827)

(assert (=> b!1516378 (= res!1035107 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) lt!657036))))

(declare-fun b!1516379 () Bool)

(declare-fun e!846354 () Bool)

(assert (=> b!1516379 (= e!846354 (not true))))

(assert (=> b!1516379 e!846360))

(declare-fun res!1035109 () Bool)

(assert (=> b!1516379 (=> (not res!1035109) (not e!846360))))

(assert (=> b!1516379 (= res!1035109 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50557 0))(
  ( (Unit!50558) )
))
(declare-fun lt!657037 () Unit!50557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50557)

(assert (=> b!1516379 (= lt!657037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516380 () Bool)

(assert (=> b!1516380 (= e!846358 e!846356)))

(declare-fun res!1035108 () Bool)

(assert (=> b!1516380 (=> (not res!1035108) (not e!846356))))

(declare-fun lt!657034 () SeekEntryResult!12827)

(assert (=> b!1516380 (= res!1035108 (= lt!657034 lt!657036))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516380 (= lt!657036 (Intermediate!12827 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516380 (= lt!657034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48763 a!2804) j!70) mask!2512) (select (arr!48763 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516381 () Bool)

(declare-fun e!846355 () Bool)

(assert (=> b!1516381 (= e!846355 e!846359)))

(declare-fun res!1035100 () Bool)

(assert (=> b!1516381 (=> (not res!1035100) (not e!846359))))

(assert (=> b!1516381 (= res!1035100 (= (seekEntryOrOpen!0 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48763 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516382 () Bool)

(assert (=> b!1516382 (= e!846356 e!846354)))

(declare-fun res!1035103 () Bool)

(assert (=> b!1516382 (=> (not res!1035103) (not e!846354))))

(assert (=> b!1516382 (= res!1035103 (= lt!657034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657035 mask!2512) lt!657035 lt!657033 mask!2512)))))

(assert (=> b!1516382 (= lt!657035 (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516382 (= lt!657033 (array!101063 (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49314 a!2804)))))

(declare-fun b!1516383 () Bool)

(assert (=> b!1516383 (= e!846360 e!846355)))

(declare-fun res!1035098 () Bool)

(assert (=> b!1516383 (=> res!1035098 e!846355)))

(assert (=> b!1516383 (= res!1035098 (or (not (= (select (arr!48763 a!2804) j!70) lt!657035)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48763 a!2804) index!487) (select (arr!48763 a!2804) j!70)) (not (= (select (arr!48763 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516384 () Bool)

(declare-fun res!1035097 () Bool)

(assert (=> b!1516384 (=> (not res!1035097) (not e!846358))))

(assert (=> b!1516384 (= res!1035097 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49314 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49314 a!2804))))))

(assert (= (and start!129392 res!1035105) b!1516376))

(assert (= (and b!1516376 res!1035102) b!1516371))

(assert (= (and b!1516371 res!1035110) b!1516372))

(assert (= (and b!1516372 res!1035101) b!1516374))

(assert (= (and b!1516374 res!1035104) b!1516377))

(assert (= (and b!1516377 res!1035106) b!1516384))

(assert (= (and b!1516384 res!1035097) b!1516380))

(assert (= (and b!1516380 res!1035108) b!1516378))

(assert (= (and b!1516378 res!1035107) b!1516382))

(assert (= (and b!1516382 res!1035103) b!1516379))

(assert (= (and b!1516379 res!1035109) b!1516373))

(assert (= (and b!1516373 res!1035099) b!1516383))

(assert (= (and b!1516383 (not res!1035098)) b!1516381))

(assert (= (and b!1516381 res!1035100) b!1516375))

(declare-fun m!1399299 () Bool)

(assert (=> b!1516380 m!1399299))

(assert (=> b!1516380 m!1399299))

(declare-fun m!1399301 () Bool)

(assert (=> b!1516380 m!1399301))

(assert (=> b!1516380 m!1399301))

(assert (=> b!1516380 m!1399299))

(declare-fun m!1399303 () Bool)

(assert (=> b!1516380 m!1399303))

(declare-fun m!1399305 () Bool)

(assert (=> start!129392 m!1399305))

(declare-fun m!1399307 () Bool)

(assert (=> start!129392 m!1399307))

(assert (=> b!1516381 m!1399299))

(assert (=> b!1516381 m!1399299))

(declare-fun m!1399309 () Bool)

(assert (=> b!1516381 m!1399309))

(assert (=> b!1516381 m!1399299))

(declare-fun m!1399311 () Bool)

(assert (=> b!1516381 m!1399311))

(assert (=> b!1516372 m!1399299))

(assert (=> b!1516372 m!1399299))

(declare-fun m!1399313 () Bool)

(assert (=> b!1516372 m!1399313))

(declare-fun m!1399315 () Bool)

(assert (=> b!1516382 m!1399315))

(assert (=> b!1516382 m!1399315))

(declare-fun m!1399317 () Bool)

(assert (=> b!1516382 m!1399317))

(declare-fun m!1399319 () Bool)

(assert (=> b!1516382 m!1399319))

(declare-fun m!1399321 () Bool)

(assert (=> b!1516382 m!1399321))

(assert (=> b!1516373 m!1399299))

(assert (=> b!1516373 m!1399299))

(declare-fun m!1399323 () Bool)

(assert (=> b!1516373 m!1399323))

(declare-fun m!1399325 () Bool)

(assert (=> b!1516377 m!1399325))

(declare-fun m!1399327 () Bool)

(assert (=> b!1516375 m!1399327))

(declare-fun m!1399329 () Bool)

(assert (=> b!1516375 m!1399329))

(declare-fun m!1399331 () Bool)

(assert (=> b!1516374 m!1399331))

(declare-fun m!1399333 () Bool)

(assert (=> b!1516371 m!1399333))

(assert (=> b!1516371 m!1399333))

(declare-fun m!1399335 () Bool)

(assert (=> b!1516371 m!1399335))

(assert (=> b!1516378 m!1399299))

(assert (=> b!1516378 m!1399299))

(declare-fun m!1399337 () Bool)

(assert (=> b!1516378 m!1399337))

(assert (=> b!1516383 m!1399299))

(declare-fun m!1399339 () Bool)

(assert (=> b!1516383 m!1399339))

(declare-fun m!1399341 () Bool)

(assert (=> b!1516379 m!1399341))

(declare-fun m!1399343 () Bool)

(assert (=> b!1516379 m!1399343))

(check-sat (not b!1516380) (not start!129392) (not b!1516374) (not b!1516382) (not b!1516372) (not b!1516377) (not b!1516375) (not b!1516379) (not b!1516381) (not b!1516371) (not b!1516378) (not b!1516373))
(check-sat)
