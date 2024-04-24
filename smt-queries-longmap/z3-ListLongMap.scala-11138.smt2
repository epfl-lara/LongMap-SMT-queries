; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130506 () Bool)

(assert start!130506)

(declare-fun b!1529782 () Bool)

(declare-fun res!1046337 () Bool)

(declare-fun e!852780 () Bool)

(assert (=> b!1529782 (=> (not res!1046337) (not e!852780))))

(declare-datatypes ((SeekEntryResult!13106 0))(
  ( (MissingZero!13106 (index!54819 (_ BitVec 32))) (Found!13106 (index!54820 (_ BitVec 32))) (Intermediate!13106 (undefined!13918 Bool) (index!54821 (_ BitVec 32)) (x!136719 (_ BitVec 32))) (Undefined!13106) (MissingVacant!13106 (index!54822 (_ BitVec 32))) )
))
(declare-fun lt!662326 () SeekEntryResult!13106)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101656 0))(
  ( (array!101657 (arr!49048 (Array (_ BitVec 32) (_ BitVec 64))) (size!49599 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101656)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101656 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1529782 (= res!1046337 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) lt!662326))))

(declare-fun b!1529783 () Bool)

(declare-fun res!1046341 () Bool)

(declare-fun e!852779 () Bool)

(assert (=> b!1529783 (=> (not res!1046341) (not e!852779))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529783 (= res!1046341 (validKeyInArray!0 (select (arr!49048 a!2804) i!961)))))

(declare-fun b!1529784 () Bool)

(declare-fun res!1046342 () Bool)

(declare-fun e!852775 () Bool)

(assert (=> b!1529784 (=> (not res!1046342) (not e!852775))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101656 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1529784 (= res!1046342 (= (seekEntry!0 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) (Found!13106 j!70)))))

(declare-fun b!1529785 () Bool)

(declare-fun res!1046343 () Bool)

(assert (=> b!1529785 (=> (not res!1046343) (not e!852779))))

(assert (=> b!1529785 (= res!1046343 (validKeyInArray!0 (select (arr!49048 a!2804) j!70)))))

(declare-fun b!1529786 () Bool)

(declare-fun res!1046332 () Bool)

(assert (=> b!1529786 (=> (not res!1046332) (not e!852779))))

(declare-datatypes ((List!35518 0))(
  ( (Nil!35515) (Cons!35514 (h!36965 (_ BitVec 64)) (t!50204 List!35518)) )
))
(declare-fun arrayNoDuplicates!0 (array!101656 (_ BitVec 32) List!35518) Bool)

(assert (=> b!1529786 (= res!1046332 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35515))))

(declare-fun b!1529787 () Bool)

(declare-fun res!1046335 () Bool)

(assert (=> b!1529787 (=> (not res!1046335) (not e!852779))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529787 (= res!1046335 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49599 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49599 a!2804))))))

(declare-fun b!1529788 () Bool)

(declare-fun res!1046334 () Bool)

(assert (=> b!1529788 (=> (not res!1046334) (not e!852779))))

(assert (=> b!1529788 (= res!1046334 (and (= (size!49599 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49599 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49599 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529789 () Bool)

(declare-fun e!852776 () Bool)

(assert (=> b!1529789 (= e!852775 e!852776)))

(declare-fun res!1046336 () Bool)

(assert (=> b!1529789 (=> res!1046336 e!852776)))

(declare-fun lt!662325 () (_ BitVec 64))

(assert (=> b!1529789 (= res!1046336 (or (not (= (select (arr!49048 a!2804) j!70) lt!662325)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49048 a!2804) index!487) (select (arr!49048 a!2804) j!70)) (not (= (select (arr!49048 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529790 () Bool)

(declare-fun e!852781 () Bool)

(assert (=> b!1529790 (= e!852780 e!852781)))

(declare-fun res!1046331 () Bool)

(assert (=> b!1529790 (=> (not res!1046331) (not e!852781))))

(declare-fun lt!662328 () SeekEntryResult!13106)

(declare-fun lt!662327 () array!101656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529790 (= res!1046331 (= lt!662328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662325 mask!2512) lt!662325 lt!662327 mask!2512)))))

(assert (=> b!1529790 (= lt!662325 (select (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529790 (= lt!662327 (array!101657 (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)))))

(declare-fun b!1529791 () Bool)

(declare-fun e!852778 () Bool)

(assert (=> b!1529791 (= e!852776 e!852778)))

(declare-fun res!1046340 () Bool)

(assert (=> b!1529791 (=> (not res!1046340) (not e!852778))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101656 (_ BitVec 32)) SeekEntryResult!13106)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101656 (_ BitVec 32)) SeekEntryResult!13106)

(assert (=> b!1529791 (= res!1046340 (= (seekEntryOrOpen!0 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49048 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529792 () Bool)

(assert (=> b!1529792 (= e!852778 (= (seekEntryOrOpen!0 lt!662325 lt!662327 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662325 lt!662327 mask!2512)))))

(declare-fun res!1046338 () Bool)

(assert (=> start!130506 (=> (not res!1046338) (not e!852779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130506 (= res!1046338 (validMask!0 mask!2512))))

(assert (=> start!130506 e!852779))

(assert (=> start!130506 true))

(declare-fun array_inv!38329 (array!101656) Bool)

(assert (=> start!130506 (array_inv!38329 a!2804)))

(declare-fun b!1529793 () Bool)

(declare-fun res!1046330 () Bool)

(assert (=> b!1529793 (=> (not res!1046330) (not e!852779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101656 (_ BitVec 32)) Bool)

(assert (=> b!1529793 (= res!1046330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529794 () Bool)

(assert (=> b!1529794 (= e!852779 e!852780)))

(declare-fun res!1046339 () Bool)

(assert (=> b!1529794 (=> (not res!1046339) (not e!852780))))

(assert (=> b!1529794 (= res!1046339 (= lt!662328 lt!662326))))

(assert (=> b!1529794 (= lt!662326 (Intermediate!13106 false resIndex!21 resX!21))))

(assert (=> b!1529794 (= lt!662328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49048 a!2804) j!70) mask!2512) (select (arr!49048 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529795 () Bool)

(assert (=> b!1529795 (= e!852781 (not true))))

(assert (=> b!1529795 e!852775))

(declare-fun res!1046333 () Bool)

(assert (=> b!1529795 (=> (not res!1046333) (not e!852775))))

(assert (=> b!1529795 (= res!1046333 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51031 0))(
  ( (Unit!51032) )
))
(declare-fun lt!662324 () Unit!51031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51031)

(assert (=> b!1529795 (= lt!662324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130506 res!1046338) b!1529788))

(assert (= (and b!1529788 res!1046334) b!1529783))

(assert (= (and b!1529783 res!1046341) b!1529785))

(assert (= (and b!1529785 res!1046343) b!1529793))

(assert (= (and b!1529793 res!1046330) b!1529786))

(assert (= (and b!1529786 res!1046332) b!1529787))

(assert (= (and b!1529787 res!1046335) b!1529794))

(assert (= (and b!1529794 res!1046339) b!1529782))

(assert (= (and b!1529782 res!1046337) b!1529790))

(assert (= (and b!1529790 res!1046331) b!1529795))

(assert (= (and b!1529795 res!1046333) b!1529784))

(assert (= (and b!1529784 res!1046342) b!1529789))

(assert (= (and b!1529789 (not res!1046336)) b!1529791))

(assert (= (and b!1529791 res!1046340) b!1529792))

(declare-fun m!1412533 () Bool)

(assert (=> b!1529782 m!1412533))

(assert (=> b!1529782 m!1412533))

(declare-fun m!1412535 () Bool)

(assert (=> b!1529782 m!1412535))

(declare-fun m!1412537 () Bool)

(assert (=> start!130506 m!1412537))

(declare-fun m!1412539 () Bool)

(assert (=> start!130506 m!1412539))

(declare-fun m!1412541 () Bool)

(assert (=> b!1529793 m!1412541))

(declare-fun m!1412543 () Bool)

(assert (=> b!1529792 m!1412543))

(declare-fun m!1412545 () Bool)

(assert (=> b!1529792 m!1412545))

(assert (=> b!1529784 m!1412533))

(assert (=> b!1529784 m!1412533))

(declare-fun m!1412547 () Bool)

(assert (=> b!1529784 m!1412547))

(declare-fun m!1412549 () Bool)

(assert (=> b!1529795 m!1412549))

(declare-fun m!1412551 () Bool)

(assert (=> b!1529795 m!1412551))

(assert (=> b!1529794 m!1412533))

(assert (=> b!1529794 m!1412533))

(declare-fun m!1412553 () Bool)

(assert (=> b!1529794 m!1412553))

(assert (=> b!1529794 m!1412553))

(assert (=> b!1529794 m!1412533))

(declare-fun m!1412555 () Bool)

(assert (=> b!1529794 m!1412555))

(declare-fun m!1412557 () Bool)

(assert (=> b!1529786 m!1412557))

(declare-fun m!1412559 () Bool)

(assert (=> b!1529783 m!1412559))

(assert (=> b!1529783 m!1412559))

(declare-fun m!1412561 () Bool)

(assert (=> b!1529783 m!1412561))

(assert (=> b!1529785 m!1412533))

(assert (=> b!1529785 m!1412533))

(declare-fun m!1412563 () Bool)

(assert (=> b!1529785 m!1412563))

(assert (=> b!1529791 m!1412533))

(assert (=> b!1529791 m!1412533))

(declare-fun m!1412565 () Bool)

(assert (=> b!1529791 m!1412565))

(assert (=> b!1529791 m!1412533))

(declare-fun m!1412567 () Bool)

(assert (=> b!1529791 m!1412567))

(assert (=> b!1529789 m!1412533))

(declare-fun m!1412569 () Bool)

(assert (=> b!1529789 m!1412569))

(declare-fun m!1412571 () Bool)

(assert (=> b!1529790 m!1412571))

(assert (=> b!1529790 m!1412571))

(declare-fun m!1412573 () Bool)

(assert (=> b!1529790 m!1412573))

(declare-fun m!1412575 () Bool)

(assert (=> b!1529790 m!1412575))

(declare-fun m!1412577 () Bool)

(assert (=> b!1529790 m!1412577))

(check-sat (not start!130506) (not b!1529790) (not b!1529793) (not b!1529794) (not b!1529783) (not b!1529782) (not b!1529784) (not b!1529792) (not b!1529791) (not b!1529795) (not b!1529786) (not b!1529785))
(check-sat)
