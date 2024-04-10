; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129082 () Bool)

(assert start!129082)

(declare-fun res!1034276 () Bool)

(declare-fun e!845137 () Bool)

(assert (=> start!129082 (=> (not res!1034276) (not e!845137))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129082 (= res!1034276 (validMask!0 mask!2512))))

(assert (=> start!129082 e!845137))

(assert (=> start!129082 true))

(declare-datatypes ((array!100938 0))(
  ( (array!100939 (arr!48706 (Array (_ BitVec 32) (_ BitVec 64))) (size!49256 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100938)

(declare-fun array_inv!37734 (array!100938) Bool)

(assert (=> start!129082 (array_inv!37734 a!2804)))

(declare-fun b!1514371 () Bool)

(declare-fun res!1034284 () Bool)

(declare-fun e!845138 () Bool)

(assert (=> b!1514371 (=> (not res!1034284) (not e!845138))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12877 0))(
  ( (MissingZero!12877 (index!53903 (_ BitVec 32))) (Found!12877 (index!53904 (_ BitVec 32))) (Intermediate!12877 (undefined!13689 Bool) (index!53905 (_ BitVec 32)) (x!135611 (_ BitVec 32))) (Undefined!12877) (MissingVacant!12877 (index!53906 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100938 (_ BitVec 32)) SeekEntryResult!12877)

(assert (=> b!1514371 (= res!1034284 (= (seekEntry!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) (Found!12877 j!70)))))

(declare-fun b!1514372 () Bool)

(declare-fun e!845134 () Bool)

(assert (=> b!1514372 (= e!845138 e!845134)))

(declare-fun res!1034279 () Bool)

(assert (=> b!1514372 (=> res!1034279 e!845134)))

(declare-fun lt!656314 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514372 (= res!1034279 (or (not (= (select (arr!48706 a!2804) j!70) lt!656314)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48706 a!2804) index!487) (select (arr!48706 a!2804) j!70)) (not (= (select (arr!48706 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!656312 () array!100938)

(declare-fun e!845139 () Bool)

(declare-fun b!1514373 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100938 (_ BitVec 32)) SeekEntryResult!12877)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100938 (_ BitVec 32)) SeekEntryResult!12877)

(assert (=> b!1514373 (= e!845139 (= (seekEntryOrOpen!0 lt!656314 lt!656312 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656314 lt!656312 mask!2512)))))

(declare-fun b!1514374 () Bool)

(assert (=> b!1514374 (= e!845134 e!845139)))

(declare-fun res!1034286 () Bool)

(assert (=> b!1514374 (=> (not res!1034286) (not e!845139))))

(assert (=> b!1514374 (= res!1034286 (= (seekEntryOrOpen!0 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514375 () Bool)

(declare-fun e!845136 () Bool)

(declare-fun e!845135 () Bool)

(assert (=> b!1514375 (= e!845136 e!845135)))

(declare-fun res!1034281 () Bool)

(assert (=> b!1514375 (=> (not res!1034281) (not e!845135))))

(declare-fun lt!656313 () SeekEntryResult!12877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100938 (_ BitVec 32)) SeekEntryResult!12877)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514375 (= res!1034281 (= lt!656313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656314 mask!2512) lt!656314 lt!656312 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514375 (= lt!656314 (select (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514375 (= lt!656312 (array!100939 (store (arr!48706 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49256 a!2804)))))

(declare-fun b!1514376 () Bool)

(declare-fun res!1034287 () Bool)

(assert (=> b!1514376 (=> (not res!1034287) (not e!845137))))

(assert (=> b!1514376 (= res!1034287 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49256 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49256 a!2804))))))

(declare-fun b!1514377 () Bool)

(declare-fun res!1034274 () Bool)

(assert (=> b!1514377 (=> (not res!1034274) (not e!845137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100938 (_ BitVec 32)) Bool)

(assert (=> b!1514377 (= res!1034274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514378 () Bool)

(declare-fun res!1034277 () Bool)

(assert (=> b!1514378 (=> (not res!1034277) (not e!845137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514378 (= res!1034277 (validKeyInArray!0 (select (arr!48706 a!2804) i!961)))))

(declare-fun b!1514379 () Bool)

(declare-fun res!1034280 () Bool)

(assert (=> b!1514379 (=> (not res!1034280) (not e!845137))))

(declare-datatypes ((List!35189 0))(
  ( (Nil!35186) (Cons!35185 (h!36597 (_ BitVec 64)) (t!49883 List!35189)) )
))
(declare-fun arrayNoDuplicates!0 (array!100938 (_ BitVec 32) List!35189) Bool)

(assert (=> b!1514379 (= res!1034280 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35186))))

(declare-fun b!1514380 () Bool)

(declare-fun res!1034278 () Bool)

(assert (=> b!1514380 (=> (not res!1034278) (not e!845136))))

(declare-fun lt!656310 () SeekEntryResult!12877)

(assert (=> b!1514380 (= res!1034278 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48706 a!2804) j!70) a!2804 mask!2512) lt!656310))))

(declare-fun b!1514381 () Bool)

(assert (=> b!1514381 (= e!845137 e!845136)))

(declare-fun res!1034282 () Bool)

(assert (=> b!1514381 (=> (not res!1034282) (not e!845136))))

(assert (=> b!1514381 (= res!1034282 (= lt!656313 lt!656310))))

(assert (=> b!1514381 (= lt!656310 (Intermediate!12877 false resIndex!21 resX!21))))

(assert (=> b!1514381 (= lt!656313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48706 a!2804) j!70) mask!2512) (select (arr!48706 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514382 () Bool)

(declare-fun res!1034285 () Bool)

(assert (=> b!1514382 (=> (not res!1034285) (not e!845137))))

(assert (=> b!1514382 (= res!1034285 (and (= (size!49256 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49256 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49256 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514383 () Bool)

(assert (=> b!1514383 (= e!845135 (not true))))

(assert (=> b!1514383 e!845138))

(declare-fun res!1034275 () Bool)

(assert (=> b!1514383 (=> (not res!1034275) (not e!845138))))

(assert (=> b!1514383 (= res!1034275 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50622 0))(
  ( (Unit!50623) )
))
(declare-fun lt!656311 () Unit!50622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50622)

(assert (=> b!1514383 (= lt!656311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514384 () Bool)

(declare-fun res!1034283 () Bool)

(assert (=> b!1514384 (=> (not res!1034283) (not e!845137))))

(assert (=> b!1514384 (= res!1034283 (validKeyInArray!0 (select (arr!48706 a!2804) j!70)))))

(assert (= (and start!129082 res!1034276) b!1514382))

(assert (= (and b!1514382 res!1034285) b!1514378))

(assert (= (and b!1514378 res!1034277) b!1514384))

(assert (= (and b!1514384 res!1034283) b!1514377))

(assert (= (and b!1514377 res!1034274) b!1514379))

(assert (= (and b!1514379 res!1034280) b!1514376))

(assert (= (and b!1514376 res!1034287) b!1514381))

(assert (= (and b!1514381 res!1034282) b!1514380))

(assert (= (and b!1514380 res!1034278) b!1514375))

(assert (= (and b!1514375 res!1034281) b!1514383))

(assert (= (and b!1514383 res!1034275) b!1514371))

(assert (= (and b!1514371 res!1034284) b!1514372))

(assert (= (and b!1514372 (not res!1034279)) b!1514374))

(assert (= (and b!1514374 res!1034286) b!1514373))

(declare-fun m!1397319 () Bool)

(assert (=> b!1514372 m!1397319))

(declare-fun m!1397321 () Bool)

(assert (=> b!1514372 m!1397321))

(assert (=> b!1514380 m!1397319))

(assert (=> b!1514380 m!1397319))

(declare-fun m!1397323 () Bool)

(assert (=> b!1514380 m!1397323))

(assert (=> b!1514371 m!1397319))

(assert (=> b!1514371 m!1397319))

(declare-fun m!1397325 () Bool)

(assert (=> b!1514371 m!1397325))

(declare-fun m!1397327 () Bool)

(assert (=> b!1514377 m!1397327))

(declare-fun m!1397329 () Bool)

(assert (=> b!1514373 m!1397329))

(declare-fun m!1397331 () Bool)

(assert (=> b!1514373 m!1397331))

(assert (=> b!1514381 m!1397319))

(assert (=> b!1514381 m!1397319))

(declare-fun m!1397333 () Bool)

(assert (=> b!1514381 m!1397333))

(assert (=> b!1514381 m!1397333))

(assert (=> b!1514381 m!1397319))

(declare-fun m!1397335 () Bool)

(assert (=> b!1514381 m!1397335))

(declare-fun m!1397337 () Bool)

(assert (=> b!1514379 m!1397337))

(declare-fun m!1397339 () Bool)

(assert (=> b!1514375 m!1397339))

(assert (=> b!1514375 m!1397339))

(declare-fun m!1397341 () Bool)

(assert (=> b!1514375 m!1397341))

(declare-fun m!1397343 () Bool)

(assert (=> b!1514375 m!1397343))

(declare-fun m!1397345 () Bool)

(assert (=> b!1514375 m!1397345))

(declare-fun m!1397347 () Bool)

(assert (=> b!1514378 m!1397347))

(assert (=> b!1514378 m!1397347))

(declare-fun m!1397349 () Bool)

(assert (=> b!1514378 m!1397349))

(declare-fun m!1397351 () Bool)

(assert (=> start!129082 m!1397351))

(declare-fun m!1397353 () Bool)

(assert (=> start!129082 m!1397353))

(assert (=> b!1514384 m!1397319))

(assert (=> b!1514384 m!1397319))

(declare-fun m!1397355 () Bool)

(assert (=> b!1514384 m!1397355))

(declare-fun m!1397357 () Bool)

(assert (=> b!1514383 m!1397357))

(declare-fun m!1397359 () Bool)

(assert (=> b!1514383 m!1397359))

(assert (=> b!1514374 m!1397319))

(assert (=> b!1514374 m!1397319))

(declare-fun m!1397361 () Bool)

(assert (=> b!1514374 m!1397361))

(assert (=> b!1514374 m!1397319))

(declare-fun m!1397363 () Bool)

(assert (=> b!1514374 m!1397363))

(push 1)

