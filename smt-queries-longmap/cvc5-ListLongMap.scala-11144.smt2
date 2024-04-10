; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130226 () Bool)

(assert start!130226)

(declare-fun b!1528625 () Bool)

(declare-fun res!1046341 () Bool)

(declare-fun e!851985 () Bool)

(assert (=> b!1528625 (=> (not res!1046341) (not e!851985))))

(declare-datatypes ((array!101576 0))(
  ( (array!101577 (arr!49013 (Array (_ BitVec 32) (_ BitVec 64))) (size!49563 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101576)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528625 (= res!1046341 (validKeyInArray!0 (select (arr!49013 a!2804) j!70)))))

(declare-fun b!1528626 () Bool)

(declare-fun e!851986 () Bool)

(assert (=> b!1528626 (= e!851985 e!851986)))

(declare-fun res!1046342 () Bool)

(assert (=> b!1528626 (=> (not res!1046342) (not e!851986))))

(declare-datatypes ((SeekEntryResult!13178 0))(
  ( (MissingZero!13178 (index!55107 (_ BitVec 32))) (Found!13178 (index!55108 (_ BitVec 32))) (Intermediate!13178 (undefined!13990 Bool) (index!55109 (_ BitVec 32)) (x!136801 (_ BitVec 32))) (Undefined!13178) (MissingVacant!13178 (index!55110 (_ BitVec 32))) )
))
(declare-fun lt!662128 () SeekEntryResult!13178)

(declare-fun lt!662131 () SeekEntryResult!13178)

(assert (=> b!1528626 (= res!1046342 (= lt!662128 lt!662131))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528626 (= lt!662131 (Intermediate!13178 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101576 (_ BitVec 32)) SeekEntryResult!13178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528626 (= lt!662128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49013 a!2804) j!70) mask!2512) (select (arr!49013 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1046344 () Bool)

(assert (=> start!130226 (=> (not res!1046344) (not e!851985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130226 (= res!1046344 (validMask!0 mask!2512))))

(assert (=> start!130226 e!851985))

(assert (=> start!130226 true))

(declare-fun array_inv!38041 (array!101576) Bool)

(assert (=> start!130226 (array_inv!38041 a!2804)))

(declare-fun b!1528627 () Bool)

(declare-fun res!1046332 () Bool)

(assert (=> b!1528627 (=> (not res!1046332) (not e!851985))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528627 (= res!1046332 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49563 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49563 a!2804))))))

(declare-fun b!1528628 () Bool)

(declare-fun res!1046334 () Bool)

(assert (=> b!1528628 (=> (not res!1046334) (not e!851985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101576 (_ BitVec 32)) Bool)

(assert (=> b!1528628 (= res!1046334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528629 () Bool)

(declare-fun res!1046337 () Bool)

(assert (=> b!1528629 (=> (not res!1046337) (not e!851985))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528629 (= res!1046337 (validKeyInArray!0 (select (arr!49013 a!2804) i!961)))))

(declare-fun b!1528630 () Bool)

(declare-fun e!851982 () Bool)

(declare-fun e!851983 () Bool)

(assert (=> b!1528630 (= e!851982 e!851983)))

(declare-fun res!1046336 () Bool)

(assert (=> b!1528630 (=> res!1046336 e!851983)))

(declare-fun lt!662124 () SeekEntryResult!13178)

(assert (=> b!1528630 (= res!1046336 (not (= lt!662124 (Found!13178 j!70))))))

(declare-fun lt!662129 () SeekEntryResult!13178)

(declare-fun lt!662123 () SeekEntryResult!13178)

(assert (=> b!1528630 (= lt!662129 lt!662123)))

(declare-fun lt!662126 () array!101576)

(declare-fun lt!662125 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101576 (_ BitVec 32)) SeekEntryResult!13178)

(assert (=> b!1528630 (= lt!662123 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662125 lt!662126 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101576 (_ BitVec 32)) SeekEntryResult!13178)

(assert (=> b!1528630 (= lt!662129 (seekEntryOrOpen!0 lt!662125 lt!662126 mask!2512))))

(declare-fun lt!662130 () SeekEntryResult!13178)

(assert (=> b!1528630 (= lt!662130 lt!662124)))

(assert (=> b!1528630 (= lt!662124 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49013 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528630 (= lt!662130 (seekEntryOrOpen!0 (select (arr!49013 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528631 () Bool)

(declare-fun res!1046340 () Bool)

(assert (=> b!1528631 (=> (not res!1046340) (not e!851985))))

(assert (=> b!1528631 (= res!1046340 (and (= (size!49563 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49563 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49563 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528632 () Bool)

(declare-fun e!851981 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101576 (_ BitVec 32)) SeekEntryResult!13178)

(assert (=> b!1528632 (= e!851981 (= (seekEntry!0 (select (arr!49013 a!2804) j!70) a!2804 mask!2512) (Found!13178 j!70)))))

(declare-fun b!1528633 () Bool)

(declare-fun e!851980 () Bool)

(assert (=> b!1528633 (= e!851986 e!851980)))

(declare-fun res!1046338 () Bool)

(assert (=> b!1528633 (=> (not res!1046338) (not e!851980))))

(assert (=> b!1528633 (= res!1046338 (= lt!662128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662125 mask!2512) lt!662125 lt!662126 mask!2512)))))

(assert (=> b!1528633 (= lt!662125 (select (store (arr!49013 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528633 (= lt!662126 (array!101577 (store (arr!49013 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49563 a!2804)))))

(declare-fun b!1528634 () Bool)

(declare-fun res!1046339 () Bool)

(assert (=> b!1528634 (=> (not res!1046339) (not e!851985))))

(declare-datatypes ((List!35496 0))(
  ( (Nil!35493) (Cons!35492 (h!36928 (_ BitVec 64)) (t!50190 List!35496)) )
))
(declare-fun arrayNoDuplicates!0 (array!101576 (_ BitVec 32) List!35496) Bool)

(assert (=> b!1528634 (= res!1046339 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35493))))

(declare-fun b!1528635 () Bool)

(assert (=> b!1528635 (= e!851980 (not e!851982))))

(declare-fun res!1046343 () Bool)

(assert (=> b!1528635 (=> res!1046343 e!851982)))

(assert (=> b!1528635 (= res!1046343 (or (not (= (select (arr!49013 a!2804) j!70) lt!662125)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49013 a!2804) index!487) (select (arr!49013 a!2804) j!70)) (not (= (select (arr!49013 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528635 e!851981))

(declare-fun res!1046335 () Bool)

(assert (=> b!1528635 (=> (not res!1046335) (not e!851981))))

(assert (=> b!1528635 (= res!1046335 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51140 0))(
  ( (Unit!51141) )
))
(declare-fun lt!662122 () Unit!51140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51140)

(assert (=> b!1528635 (= lt!662122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528636 () Bool)

(assert (=> b!1528636 (= e!851983 (= lt!662130 lt!662129))))

(assert (=> b!1528636 (= lt!662123 lt!662124)))

(declare-fun lt!662127 () Unit!51140)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51140)

(assert (=> b!1528636 (= lt!662127 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528637 () Bool)

(declare-fun res!1046333 () Bool)

(assert (=> b!1528637 (=> (not res!1046333) (not e!851986))))

(assert (=> b!1528637 (= res!1046333 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49013 a!2804) j!70) a!2804 mask!2512) lt!662131))))

(assert (= (and start!130226 res!1046344) b!1528631))

(assert (= (and b!1528631 res!1046340) b!1528629))

(assert (= (and b!1528629 res!1046337) b!1528625))

(assert (= (and b!1528625 res!1046341) b!1528628))

(assert (= (and b!1528628 res!1046334) b!1528634))

(assert (= (and b!1528634 res!1046339) b!1528627))

(assert (= (and b!1528627 res!1046332) b!1528626))

(assert (= (and b!1528626 res!1046342) b!1528637))

(assert (= (and b!1528637 res!1046333) b!1528633))

(assert (= (and b!1528633 res!1046338) b!1528635))

(assert (= (and b!1528635 res!1046335) b!1528632))

(assert (= (and b!1528635 (not res!1046343)) b!1528630))

(assert (= (and b!1528630 (not res!1046336)) b!1528636))

(declare-fun m!1411503 () Bool)

(assert (=> b!1528632 m!1411503))

(assert (=> b!1528632 m!1411503))

(declare-fun m!1411505 () Bool)

(assert (=> b!1528632 m!1411505))

(declare-fun m!1411507 () Bool)

(assert (=> b!1528629 m!1411507))

(assert (=> b!1528629 m!1411507))

(declare-fun m!1411509 () Bool)

(assert (=> b!1528629 m!1411509))

(declare-fun m!1411511 () Bool)

(assert (=> start!130226 m!1411511))

(declare-fun m!1411513 () Bool)

(assert (=> start!130226 m!1411513))

(assert (=> b!1528637 m!1411503))

(assert (=> b!1528637 m!1411503))

(declare-fun m!1411515 () Bool)

(assert (=> b!1528637 m!1411515))

(assert (=> b!1528626 m!1411503))

(assert (=> b!1528626 m!1411503))

(declare-fun m!1411517 () Bool)

(assert (=> b!1528626 m!1411517))

(assert (=> b!1528626 m!1411517))

(assert (=> b!1528626 m!1411503))

(declare-fun m!1411519 () Bool)

(assert (=> b!1528626 m!1411519))

(declare-fun m!1411521 () Bool)

(assert (=> b!1528636 m!1411521))

(declare-fun m!1411523 () Bool)

(assert (=> b!1528634 m!1411523))

(assert (=> b!1528625 m!1411503))

(assert (=> b!1528625 m!1411503))

(declare-fun m!1411525 () Bool)

(assert (=> b!1528625 m!1411525))

(assert (=> b!1528630 m!1411503))

(declare-fun m!1411527 () Bool)

(assert (=> b!1528630 m!1411527))

(assert (=> b!1528630 m!1411503))

(declare-fun m!1411529 () Bool)

(assert (=> b!1528630 m!1411529))

(assert (=> b!1528630 m!1411503))

(declare-fun m!1411531 () Bool)

(assert (=> b!1528630 m!1411531))

(declare-fun m!1411533 () Bool)

(assert (=> b!1528630 m!1411533))

(declare-fun m!1411535 () Bool)

(assert (=> b!1528628 m!1411535))

(assert (=> b!1528635 m!1411503))

(declare-fun m!1411537 () Bool)

(assert (=> b!1528635 m!1411537))

(declare-fun m!1411539 () Bool)

(assert (=> b!1528635 m!1411539))

(declare-fun m!1411541 () Bool)

(assert (=> b!1528635 m!1411541))

(declare-fun m!1411543 () Bool)

(assert (=> b!1528633 m!1411543))

(assert (=> b!1528633 m!1411543))

(declare-fun m!1411545 () Bool)

(assert (=> b!1528633 m!1411545))

(declare-fun m!1411547 () Bool)

(assert (=> b!1528633 m!1411547))

(declare-fun m!1411549 () Bool)

(assert (=> b!1528633 m!1411549))

(push 1)

