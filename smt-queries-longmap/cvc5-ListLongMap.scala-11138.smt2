; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130124 () Bool)

(assert start!130124)

(declare-fun b!1527490 () Bool)

(declare-fun e!851356 () Bool)

(declare-fun e!851360 () Bool)

(assert (=> b!1527490 (= e!851356 e!851360)))

(declare-fun res!1045537 () Bool)

(assert (=> b!1527490 (=> (not res!1045537) (not e!851360))))

(declare-datatypes ((SeekEntryResult!13160 0))(
  ( (MissingZero!13160 (index!55035 (_ BitVec 32))) (Found!13160 (index!55036 (_ BitVec 32))) (Intermediate!13160 (undefined!13972 Bool) (index!55037 (_ BitVec 32)) (x!136726 (_ BitVec 32))) (Undefined!13160) (MissingVacant!13160 (index!55038 (_ BitVec 32))) )
))
(declare-fun lt!661449 () SeekEntryResult!13160)

(declare-fun lt!661451 () SeekEntryResult!13160)

(assert (=> b!1527490 (= res!1045537 (= lt!661449 lt!661451))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527490 (= lt!661451 (Intermediate!13160 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101537 0))(
  ( (array!101538 (arr!48995 (Array (_ BitVec 32) (_ BitVec 64))) (size!49545 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101537 (_ BitVec 32)) SeekEntryResult!13160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527490 (= lt!661449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48995 a!2804) j!70) mask!2512) (select (arr!48995 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527491 () Bool)

(declare-fun res!1045526 () Bool)

(assert (=> b!1527491 (=> (not res!1045526) (not e!851356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101537 (_ BitVec 32)) Bool)

(assert (=> b!1527491 (= res!1045526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527492 () Bool)

(declare-fun res!1045525 () Bool)

(assert (=> b!1527492 (=> (not res!1045525) (not e!851356))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527492 (= res!1045525 (and (= (size!49545 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49545 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49545 a!2804)) (not (= i!961 j!70))))))

(declare-fun lt!661453 () (_ BitVec 64))

(declare-fun lt!661450 () array!101537)

(declare-fun b!1527493 () Bool)

(declare-fun e!851361 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101537 (_ BitVec 32)) SeekEntryResult!13160)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101537 (_ BitVec 32)) SeekEntryResult!13160)

(assert (=> b!1527493 (= e!851361 (= (seekEntryOrOpen!0 lt!661453 lt!661450 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661453 lt!661450 mask!2512)))))

(declare-fun b!1527494 () Bool)

(declare-fun res!1045530 () Bool)

(assert (=> b!1527494 (=> (not res!1045530) (not e!851360))))

(assert (=> b!1527494 (= res!1045530 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48995 a!2804) j!70) a!2804 mask!2512) lt!661451))))

(declare-fun b!1527495 () Bool)

(declare-fun res!1045524 () Bool)

(declare-fun e!851357 () Bool)

(assert (=> b!1527495 (=> (not res!1045524) (not e!851357))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101537 (_ BitVec 32)) SeekEntryResult!13160)

(assert (=> b!1527495 (= res!1045524 (= (seekEntry!0 (select (arr!48995 a!2804) j!70) a!2804 mask!2512) (Found!13160 j!70)))))

(declare-fun b!1527496 () Bool)

(declare-fun res!1045532 () Bool)

(assert (=> b!1527496 (=> (not res!1045532) (not e!851356))))

(declare-datatypes ((List!35478 0))(
  ( (Nil!35475) (Cons!35474 (h!36907 (_ BitVec 64)) (t!50172 List!35478)) )
))
(declare-fun arrayNoDuplicates!0 (array!101537 (_ BitVec 32) List!35478) Bool)

(assert (=> b!1527496 (= res!1045532 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35475))))

(declare-fun b!1527497 () Bool)

(declare-fun e!851358 () Bool)

(assert (=> b!1527497 (= e!851358 e!851361)))

(declare-fun res!1045533 () Bool)

(assert (=> b!1527497 (=> (not res!1045533) (not e!851361))))

(assert (=> b!1527497 (= res!1045533 (= (seekEntryOrOpen!0 (select (arr!48995 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48995 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527498 () Bool)

(declare-fun res!1045531 () Bool)

(assert (=> b!1527498 (=> (not res!1045531) (not e!851356))))

(assert (=> b!1527498 (= res!1045531 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49545 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49545 a!2804))))))

(declare-fun b!1527499 () Bool)

(declare-fun e!851359 () Bool)

(assert (=> b!1527499 (= e!851359 (not true))))

(assert (=> b!1527499 e!851357))

(declare-fun res!1045527 () Bool)

(assert (=> b!1527499 (=> (not res!1045527) (not e!851357))))

(assert (=> b!1527499 (= res!1045527 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51104 0))(
  ( (Unit!51105) )
))
(declare-fun lt!661452 () Unit!51104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51104)

(assert (=> b!1527499 (= lt!661452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527500 () Bool)

(declare-fun res!1045528 () Bool)

(assert (=> b!1527500 (=> (not res!1045528) (not e!851356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527500 (= res!1045528 (validKeyInArray!0 (select (arr!48995 a!2804) j!70)))))

(declare-fun b!1527501 () Bool)

(declare-fun res!1045529 () Bool)

(assert (=> b!1527501 (=> (not res!1045529) (not e!851356))))

(assert (=> b!1527501 (= res!1045529 (validKeyInArray!0 (select (arr!48995 a!2804) i!961)))))

(declare-fun res!1045536 () Bool)

(assert (=> start!130124 (=> (not res!1045536) (not e!851356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130124 (= res!1045536 (validMask!0 mask!2512))))

(assert (=> start!130124 e!851356))

(assert (=> start!130124 true))

(declare-fun array_inv!38023 (array!101537) Bool)

(assert (=> start!130124 (array_inv!38023 a!2804)))

(declare-fun b!1527502 () Bool)

(assert (=> b!1527502 (= e!851357 e!851358)))

(declare-fun res!1045534 () Bool)

(assert (=> b!1527502 (=> res!1045534 e!851358)))

(assert (=> b!1527502 (= res!1045534 (or (not (= (select (arr!48995 a!2804) j!70) lt!661453)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48995 a!2804) index!487) (select (arr!48995 a!2804) j!70)) (not (= (select (arr!48995 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527503 () Bool)

(assert (=> b!1527503 (= e!851360 e!851359)))

(declare-fun res!1045535 () Bool)

(assert (=> b!1527503 (=> (not res!1045535) (not e!851359))))

(assert (=> b!1527503 (= res!1045535 (= lt!661449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661453 mask!2512) lt!661453 lt!661450 mask!2512)))))

(assert (=> b!1527503 (= lt!661453 (select (store (arr!48995 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527503 (= lt!661450 (array!101538 (store (arr!48995 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)))))

(assert (= (and start!130124 res!1045536) b!1527492))

(assert (= (and b!1527492 res!1045525) b!1527501))

(assert (= (and b!1527501 res!1045529) b!1527500))

(assert (= (and b!1527500 res!1045528) b!1527491))

(assert (= (and b!1527491 res!1045526) b!1527496))

(assert (= (and b!1527496 res!1045532) b!1527498))

(assert (= (and b!1527498 res!1045531) b!1527490))

(assert (= (and b!1527490 res!1045537) b!1527494))

(assert (= (and b!1527494 res!1045530) b!1527503))

(assert (= (and b!1527503 res!1045535) b!1527499))

(assert (= (and b!1527499 res!1045527) b!1527495))

(assert (= (and b!1527495 res!1045524) b!1527502))

(assert (= (and b!1527502 (not res!1045534)) b!1527497))

(assert (= (and b!1527497 res!1045533) b!1527493))

(declare-fun m!1410393 () Bool)

(assert (=> b!1527495 m!1410393))

(assert (=> b!1527495 m!1410393))

(declare-fun m!1410395 () Bool)

(assert (=> b!1527495 m!1410395))

(declare-fun m!1410397 () Bool)

(assert (=> b!1527499 m!1410397))

(declare-fun m!1410399 () Bool)

(assert (=> b!1527499 m!1410399))

(assert (=> b!1527494 m!1410393))

(assert (=> b!1527494 m!1410393))

(declare-fun m!1410401 () Bool)

(assert (=> b!1527494 m!1410401))

(assert (=> b!1527502 m!1410393))

(declare-fun m!1410403 () Bool)

(assert (=> b!1527502 m!1410403))

(declare-fun m!1410405 () Bool)

(assert (=> b!1527496 m!1410405))

(declare-fun m!1410407 () Bool)

(assert (=> start!130124 m!1410407))

(declare-fun m!1410409 () Bool)

(assert (=> start!130124 m!1410409))

(assert (=> b!1527497 m!1410393))

(assert (=> b!1527497 m!1410393))

(declare-fun m!1410411 () Bool)

(assert (=> b!1527497 m!1410411))

(assert (=> b!1527497 m!1410393))

(declare-fun m!1410413 () Bool)

(assert (=> b!1527497 m!1410413))

(assert (=> b!1527500 m!1410393))

(assert (=> b!1527500 m!1410393))

(declare-fun m!1410415 () Bool)

(assert (=> b!1527500 m!1410415))

(declare-fun m!1410417 () Bool)

(assert (=> b!1527493 m!1410417))

(declare-fun m!1410419 () Bool)

(assert (=> b!1527493 m!1410419))

(declare-fun m!1410421 () Bool)

(assert (=> b!1527491 m!1410421))

(declare-fun m!1410423 () Bool)

(assert (=> b!1527501 m!1410423))

(assert (=> b!1527501 m!1410423))

(declare-fun m!1410425 () Bool)

(assert (=> b!1527501 m!1410425))

(assert (=> b!1527490 m!1410393))

(assert (=> b!1527490 m!1410393))

(declare-fun m!1410427 () Bool)

(assert (=> b!1527490 m!1410427))

(assert (=> b!1527490 m!1410427))

(assert (=> b!1527490 m!1410393))

(declare-fun m!1410429 () Bool)

(assert (=> b!1527490 m!1410429))

(declare-fun m!1410431 () Bool)

(assert (=> b!1527503 m!1410431))

(assert (=> b!1527503 m!1410431))

(declare-fun m!1410433 () Bool)

(assert (=> b!1527503 m!1410433))

(declare-fun m!1410435 () Bool)

(assert (=> b!1527503 m!1410435))

(declare-fun m!1410437 () Bool)

(assert (=> b!1527503 m!1410437))

(push 1)

