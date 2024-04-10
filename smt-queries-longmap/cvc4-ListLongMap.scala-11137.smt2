; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130122 () Bool)

(assert start!130122)

(declare-fun b!1527448 () Bool)

(declare-fun res!1045487 () Bool)

(declare-fun e!851341 () Bool)

(assert (=> b!1527448 (=> (not res!1045487) (not e!851341))))

(declare-datatypes ((array!101535 0))(
  ( (array!101536 (arr!48994 (Array (_ BitVec 32) (_ BitVec 64))) (size!49544 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101535)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527448 (= res!1045487 (validKeyInArray!0 (select (arr!48994 a!2804) i!961)))))

(declare-fun b!1527449 () Bool)

(declare-fun res!1045485 () Bool)

(assert (=> b!1527449 (=> (not res!1045485) (not e!851341))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527449 (= res!1045485 (validKeyInArray!0 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1527450 () Bool)

(declare-fun res!1045493 () Bool)

(assert (=> b!1527450 (=> (not res!1045493) (not e!851341))))

(declare-datatypes ((List!35477 0))(
  ( (Nil!35474) (Cons!35473 (h!36906 (_ BitVec 64)) (t!50171 List!35477)) )
))
(declare-fun arrayNoDuplicates!0 (array!101535 (_ BitVec 32) List!35477) Bool)

(assert (=> b!1527450 (= res!1045493 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35474))))

(declare-fun res!1045488 () Bool)

(assert (=> start!130122 (=> (not res!1045488) (not e!851341))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130122 (= res!1045488 (validMask!0 mask!2512))))

(assert (=> start!130122 e!851341))

(assert (=> start!130122 true))

(declare-fun array_inv!38022 (array!101535) Bool)

(assert (=> start!130122 (array_inv!38022 a!2804)))

(declare-fun b!1527451 () Bool)

(declare-fun e!851339 () Bool)

(assert (=> b!1527451 (= e!851339 (not true))))

(declare-fun e!851335 () Bool)

(assert (=> b!1527451 e!851335))

(declare-fun res!1045489 () Bool)

(assert (=> b!1527451 (=> (not res!1045489) (not e!851335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101535 (_ BitVec 32)) Bool)

(assert (=> b!1527451 (= res!1045489 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51102 0))(
  ( (Unit!51103) )
))
(declare-fun lt!661434 () Unit!51102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51102)

(assert (=> b!1527451 (= lt!661434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527452 () Bool)

(declare-fun e!851336 () Bool)

(assert (=> b!1527452 (= e!851335 e!851336)))

(declare-fun res!1045491 () Bool)

(assert (=> b!1527452 (=> res!1045491 e!851336)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!661438 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1527452 (= res!1045491 (or (not (= (select (arr!48994 a!2804) j!70) lt!661438)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48994 a!2804) index!487) (select (arr!48994 a!2804) j!70)) (not (= (select (arr!48994 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527453 () Bool)

(declare-fun e!851337 () Bool)

(assert (=> b!1527453 (= e!851337 e!851339)))

(declare-fun res!1045495 () Bool)

(assert (=> b!1527453 (=> (not res!1045495) (not e!851339))))

(declare-datatypes ((SeekEntryResult!13159 0))(
  ( (MissingZero!13159 (index!55031 (_ BitVec 32))) (Found!13159 (index!55032 (_ BitVec 32))) (Intermediate!13159 (undefined!13971 Bool) (index!55033 (_ BitVec 32)) (x!136717 (_ BitVec 32))) (Undefined!13159) (MissingVacant!13159 (index!55034 (_ BitVec 32))) )
))
(declare-fun lt!661436 () SeekEntryResult!13159)

(declare-fun lt!661437 () array!101535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101535 (_ BitVec 32)) SeekEntryResult!13159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527453 (= res!1045495 (= lt!661436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661438 mask!2512) lt!661438 lt!661437 mask!2512)))))

(assert (=> b!1527453 (= lt!661438 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527453 (= lt!661437 (array!101536 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49544 a!2804)))))

(declare-fun b!1527454 () Bool)

(declare-fun e!851338 () Bool)

(assert (=> b!1527454 (= e!851336 e!851338)))

(declare-fun res!1045490 () Bool)

(assert (=> b!1527454 (=> (not res!1045490) (not e!851338))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101535 (_ BitVec 32)) SeekEntryResult!13159)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101535 (_ BitVec 32)) SeekEntryResult!13159)

(assert (=> b!1527454 (= res!1045490 (= (seekEntryOrOpen!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527455 () Bool)

(declare-fun res!1045486 () Bool)

(assert (=> b!1527455 (=> (not res!1045486) (not e!851341))))

(assert (=> b!1527455 (= res!1045486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527456 () Bool)

(assert (=> b!1527456 (= e!851341 e!851337)))

(declare-fun res!1045483 () Bool)

(assert (=> b!1527456 (=> (not res!1045483) (not e!851337))))

(declare-fun lt!661435 () SeekEntryResult!13159)

(assert (=> b!1527456 (= res!1045483 (= lt!661436 lt!661435))))

(assert (=> b!1527456 (= lt!661435 (Intermediate!13159 false resIndex!21 resX!21))))

(assert (=> b!1527456 (= lt!661436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527457 () Bool)

(declare-fun res!1045492 () Bool)

(assert (=> b!1527457 (=> (not res!1045492) (not e!851341))))

(assert (=> b!1527457 (= res!1045492 (and (= (size!49544 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49544 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49544 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527458 () Bool)

(declare-fun res!1045482 () Bool)

(assert (=> b!1527458 (=> (not res!1045482) (not e!851337))))

(assert (=> b!1527458 (= res!1045482 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661435))))

(declare-fun b!1527459 () Bool)

(assert (=> b!1527459 (= e!851338 (= (seekEntryOrOpen!0 lt!661438 lt!661437 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661438 lt!661437 mask!2512)))))

(declare-fun b!1527460 () Bool)

(declare-fun res!1045484 () Bool)

(assert (=> b!1527460 (=> (not res!1045484) (not e!851335))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101535 (_ BitVec 32)) SeekEntryResult!13159)

(assert (=> b!1527460 (= res!1045484 (= (seekEntry!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (Found!13159 j!70)))))

(declare-fun b!1527461 () Bool)

(declare-fun res!1045494 () Bool)

(assert (=> b!1527461 (=> (not res!1045494) (not e!851341))))

(assert (=> b!1527461 (= res!1045494 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49544 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49544 a!2804))))))

(assert (= (and start!130122 res!1045488) b!1527457))

(assert (= (and b!1527457 res!1045492) b!1527448))

(assert (= (and b!1527448 res!1045487) b!1527449))

(assert (= (and b!1527449 res!1045485) b!1527455))

(assert (= (and b!1527455 res!1045486) b!1527450))

(assert (= (and b!1527450 res!1045493) b!1527461))

(assert (= (and b!1527461 res!1045494) b!1527456))

(assert (= (and b!1527456 res!1045483) b!1527458))

(assert (= (and b!1527458 res!1045482) b!1527453))

(assert (= (and b!1527453 res!1045495) b!1527451))

(assert (= (and b!1527451 res!1045489) b!1527460))

(assert (= (and b!1527460 res!1045484) b!1527452))

(assert (= (and b!1527452 (not res!1045491)) b!1527454))

(assert (= (and b!1527454 res!1045490) b!1527459))

(declare-fun m!1410347 () Bool)

(assert (=> b!1527460 m!1410347))

(assert (=> b!1527460 m!1410347))

(declare-fun m!1410349 () Bool)

(assert (=> b!1527460 m!1410349))

(declare-fun m!1410351 () Bool)

(assert (=> b!1527450 m!1410351))

(assert (=> b!1527452 m!1410347))

(declare-fun m!1410353 () Bool)

(assert (=> b!1527452 m!1410353))

(declare-fun m!1410355 () Bool)

(assert (=> b!1527455 m!1410355))

(declare-fun m!1410357 () Bool)

(assert (=> b!1527453 m!1410357))

(assert (=> b!1527453 m!1410357))

(declare-fun m!1410359 () Bool)

(assert (=> b!1527453 m!1410359))

(declare-fun m!1410361 () Bool)

(assert (=> b!1527453 m!1410361))

(declare-fun m!1410363 () Bool)

(assert (=> b!1527453 m!1410363))

(declare-fun m!1410365 () Bool)

(assert (=> b!1527459 m!1410365))

(declare-fun m!1410367 () Bool)

(assert (=> b!1527459 m!1410367))

(declare-fun m!1410369 () Bool)

(assert (=> b!1527451 m!1410369))

(declare-fun m!1410371 () Bool)

(assert (=> b!1527451 m!1410371))

(declare-fun m!1410373 () Bool)

(assert (=> b!1527448 m!1410373))

(assert (=> b!1527448 m!1410373))

(declare-fun m!1410375 () Bool)

(assert (=> b!1527448 m!1410375))

(assert (=> b!1527454 m!1410347))

(assert (=> b!1527454 m!1410347))

(declare-fun m!1410377 () Bool)

(assert (=> b!1527454 m!1410377))

(assert (=> b!1527454 m!1410347))

(declare-fun m!1410379 () Bool)

(assert (=> b!1527454 m!1410379))

(assert (=> b!1527458 m!1410347))

(assert (=> b!1527458 m!1410347))

(declare-fun m!1410381 () Bool)

(assert (=> b!1527458 m!1410381))

(declare-fun m!1410383 () Bool)

(assert (=> start!130122 m!1410383))

(declare-fun m!1410385 () Bool)

(assert (=> start!130122 m!1410385))

(assert (=> b!1527456 m!1410347))

(assert (=> b!1527456 m!1410347))

(declare-fun m!1410387 () Bool)

(assert (=> b!1527456 m!1410387))

(assert (=> b!1527456 m!1410387))

(assert (=> b!1527456 m!1410347))

(declare-fun m!1410389 () Bool)

(assert (=> b!1527456 m!1410389))

(assert (=> b!1527449 m!1410347))

(assert (=> b!1527449 m!1410347))

(declare-fun m!1410391 () Bool)

(assert (=> b!1527449 m!1410391))

(push 1)

