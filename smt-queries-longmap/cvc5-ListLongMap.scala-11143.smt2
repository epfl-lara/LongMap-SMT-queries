; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130220 () Bool)

(assert start!130220)

(declare-fun b!1528508 () Bool)

(declare-fun res!1046216 () Bool)

(declare-fun e!851920 () Bool)

(assert (=> b!1528508 (=> (not res!1046216) (not e!851920))))

(declare-datatypes ((array!101570 0))(
  ( (array!101571 (arr!49010 (Array (_ BitVec 32) (_ BitVec 64))) (size!49560 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101570)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528508 (= res!1046216 (validKeyInArray!0 (select (arr!49010 a!2804) j!70)))))

(declare-fun b!1528509 () Bool)

(declare-fun res!1046220 () Bool)

(assert (=> b!1528509 (=> (not res!1046220) (not e!851920))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101570 (_ BitVec 32)) Bool)

(assert (=> b!1528509 (= res!1046220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528510 () Bool)

(declare-fun res!1046227 () Bool)

(assert (=> b!1528510 (=> (not res!1046227) (not e!851920))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528510 (= res!1046227 (and (= (size!49560 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49560 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49560 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528511 () Bool)

(declare-fun e!851923 () Bool)

(declare-fun e!851918 () Bool)

(assert (=> b!1528511 (= e!851923 e!851918)))

(declare-fun res!1046221 () Bool)

(assert (=> b!1528511 (=> res!1046221 e!851918)))

(declare-datatypes ((SeekEntryResult!13175 0))(
  ( (MissingZero!13175 (index!55095 (_ BitVec 32))) (Found!13175 (index!55096 (_ BitVec 32))) (Intermediate!13175 (undefined!13987 Bool) (index!55097 (_ BitVec 32)) (x!136790 (_ BitVec 32))) (Undefined!13175) (MissingVacant!13175 (index!55098 (_ BitVec 32))) )
))
(declare-fun lt!662038 () SeekEntryResult!13175)

(assert (=> b!1528511 (= res!1046221 (not (= lt!662038 (Found!13175 j!70))))))

(declare-fun lt!662041 () SeekEntryResult!13175)

(declare-fun lt!662037 () SeekEntryResult!13175)

(assert (=> b!1528511 (= lt!662041 lt!662037)))

(declare-fun lt!662035 () array!101570)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662039 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101570 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1528511 (= lt!662037 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662039 lt!662035 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101570 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1528511 (= lt!662041 (seekEntryOrOpen!0 lt!662039 lt!662035 mask!2512))))

(declare-fun lt!662034 () SeekEntryResult!13175)

(assert (=> b!1528511 (= lt!662034 lt!662038)))

(assert (=> b!1528511 (= lt!662038 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49010 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528511 (= lt!662034 (seekEntryOrOpen!0 (select (arr!49010 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528512 () Bool)

(declare-fun e!851921 () Bool)

(declare-fun e!851922 () Bool)

(assert (=> b!1528512 (= e!851921 e!851922)))

(declare-fun res!1046223 () Bool)

(assert (=> b!1528512 (=> (not res!1046223) (not e!851922))))

(declare-fun lt!662036 () SeekEntryResult!13175)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101570 (_ BitVec 32)) SeekEntryResult!13175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528512 (= res!1046223 (= lt!662036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662039 mask!2512) lt!662039 lt!662035 mask!2512)))))

(assert (=> b!1528512 (= lt!662039 (select (store (arr!49010 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528512 (= lt!662035 (array!101571 (store (arr!49010 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49560 a!2804)))))

(declare-fun b!1528513 () Bool)

(declare-fun res!1046217 () Bool)

(assert (=> b!1528513 (=> (not res!1046217) (not e!851920))))

(declare-datatypes ((List!35493 0))(
  ( (Nil!35490) (Cons!35489 (h!36925 (_ BitVec 64)) (t!50187 List!35493)) )
))
(declare-fun arrayNoDuplicates!0 (array!101570 (_ BitVec 32) List!35493) Bool)

(assert (=> b!1528513 (= res!1046217 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35490))))

(declare-fun b!1528514 () Bool)

(declare-fun res!1046218 () Bool)

(assert (=> b!1528514 (=> (not res!1046218) (not e!851920))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528514 (= res!1046218 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49560 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49560 a!2804))))))

(declare-fun res!1046224 () Bool)

(assert (=> start!130220 (=> (not res!1046224) (not e!851920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130220 (= res!1046224 (validMask!0 mask!2512))))

(assert (=> start!130220 e!851920))

(assert (=> start!130220 true))

(declare-fun array_inv!38038 (array!101570) Bool)

(assert (=> start!130220 (array_inv!38038 a!2804)))

(declare-fun b!1528515 () Bool)

(declare-fun res!1046222 () Bool)

(assert (=> b!1528515 (=> (not res!1046222) (not e!851920))))

(assert (=> b!1528515 (= res!1046222 (validKeyInArray!0 (select (arr!49010 a!2804) i!961)))))

(declare-fun b!1528516 () Bool)

(assert (=> b!1528516 (= e!851918 true)))

(assert (=> b!1528516 (= lt!662037 lt!662038)))

(declare-datatypes ((Unit!51134 0))(
  ( (Unit!51135) )
))
(declare-fun lt!662032 () Unit!51134)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51134)

(assert (=> b!1528516 (= lt!662032 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528517 () Bool)

(declare-fun res!1046219 () Bool)

(assert (=> b!1528517 (=> (not res!1046219) (not e!851921))))

(declare-fun lt!662040 () SeekEntryResult!13175)

(assert (=> b!1528517 (= res!1046219 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49010 a!2804) j!70) a!2804 mask!2512) lt!662040))))

(declare-fun b!1528518 () Bool)

(assert (=> b!1528518 (= e!851922 (not e!851923))))

(declare-fun res!1046226 () Bool)

(assert (=> b!1528518 (=> res!1046226 e!851923)))

(assert (=> b!1528518 (= res!1046226 (or (not (= (select (arr!49010 a!2804) j!70) lt!662039)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49010 a!2804) index!487) (select (arr!49010 a!2804) j!70)) (not (= (select (arr!49010 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851919 () Bool)

(assert (=> b!1528518 e!851919))

(declare-fun res!1046225 () Bool)

(assert (=> b!1528518 (=> (not res!1046225) (not e!851919))))

(assert (=> b!1528518 (= res!1046225 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!662033 () Unit!51134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51134)

(assert (=> b!1528518 (= lt!662033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528519 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101570 (_ BitVec 32)) SeekEntryResult!13175)

(assert (=> b!1528519 (= e!851919 (= (seekEntry!0 (select (arr!49010 a!2804) j!70) a!2804 mask!2512) (Found!13175 j!70)))))

(declare-fun b!1528520 () Bool)

(assert (=> b!1528520 (= e!851920 e!851921)))

(declare-fun res!1046215 () Bool)

(assert (=> b!1528520 (=> (not res!1046215) (not e!851921))))

(assert (=> b!1528520 (= res!1046215 (= lt!662036 lt!662040))))

(assert (=> b!1528520 (= lt!662040 (Intermediate!13175 false resIndex!21 resX!21))))

(assert (=> b!1528520 (= lt!662036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49010 a!2804) j!70) mask!2512) (select (arr!49010 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130220 res!1046224) b!1528510))

(assert (= (and b!1528510 res!1046227) b!1528515))

(assert (= (and b!1528515 res!1046222) b!1528508))

(assert (= (and b!1528508 res!1046216) b!1528509))

(assert (= (and b!1528509 res!1046220) b!1528513))

(assert (= (and b!1528513 res!1046217) b!1528514))

(assert (= (and b!1528514 res!1046218) b!1528520))

(assert (= (and b!1528520 res!1046215) b!1528517))

(assert (= (and b!1528517 res!1046219) b!1528512))

(assert (= (and b!1528512 res!1046223) b!1528518))

(assert (= (and b!1528518 res!1046225) b!1528519))

(assert (= (and b!1528518 (not res!1046226)) b!1528511))

(assert (= (and b!1528511 (not res!1046221)) b!1528516))

(declare-fun m!1411359 () Bool)

(assert (=> start!130220 m!1411359))

(declare-fun m!1411361 () Bool)

(assert (=> start!130220 m!1411361))

(declare-fun m!1411363 () Bool)

(assert (=> b!1528511 m!1411363))

(declare-fun m!1411365 () Bool)

(assert (=> b!1528511 m!1411365))

(assert (=> b!1528511 m!1411363))

(declare-fun m!1411367 () Bool)

(assert (=> b!1528511 m!1411367))

(assert (=> b!1528511 m!1411363))

(declare-fun m!1411369 () Bool)

(assert (=> b!1528511 m!1411369))

(declare-fun m!1411371 () Bool)

(assert (=> b!1528511 m!1411371))

(assert (=> b!1528519 m!1411363))

(assert (=> b!1528519 m!1411363))

(declare-fun m!1411373 () Bool)

(assert (=> b!1528519 m!1411373))

(assert (=> b!1528508 m!1411363))

(assert (=> b!1528508 m!1411363))

(declare-fun m!1411375 () Bool)

(assert (=> b!1528508 m!1411375))

(assert (=> b!1528520 m!1411363))

(assert (=> b!1528520 m!1411363))

(declare-fun m!1411377 () Bool)

(assert (=> b!1528520 m!1411377))

(assert (=> b!1528520 m!1411377))

(assert (=> b!1528520 m!1411363))

(declare-fun m!1411379 () Bool)

(assert (=> b!1528520 m!1411379))

(declare-fun m!1411381 () Bool)

(assert (=> b!1528509 m!1411381))

(declare-fun m!1411383 () Bool)

(assert (=> b!1528512 m!1411383))

(assert (=> b!1528512 m!1411383))

(declare-fun m!1411385 () Bool)

(assert (=> b!1528512 m!1411385))

(declare-fun m!1411387 () Bool)

(assert (=> b!1528512 m!1411387))

(declare-fun m!1411389 () Bool)

(assert (=> b!1528512 m!1411389))

(assert (=> b!1528518 m!1411363))

(declare-fun m!1411391 () Bool)

(assert (=> b!1528518 m!1411391))

(declare-fun m!1411393 () Bool)

(assert (=> b!1528518 m!1411393))

(declare-fun m!1411395 () Bool)

(assert (=> b!1528518 m!1411395))

(declare-fun m!1411397 () Bool)

(assert (=> b!1528513 m!1411397))

(assert (=> b!1528517 m!1411363))

(assert (=> b!1528517 m!1411363))

(declare-fun m!1411399 () Bool)

(assert (=> b!1528517 m!1411399))

(declare-fun m!1411401 () Bool)

(assert (=> b!1528516 m!1411401))

(declare-fun m!1411403 () Bool)

(assert (=> b!1528515 m!1411403))

(assert (=> b!1528515 m!1411403))

(declare-fun m!1411405 () Bool)

(assert (=> b!1528515 m!1411405))

(push 1)

