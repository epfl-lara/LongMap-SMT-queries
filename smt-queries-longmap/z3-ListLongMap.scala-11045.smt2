; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129404 () Bool)

(assert start!129404)

(declare-fun b!1516623 () Bool)

(declare-fun e!846482 () Bool)

(declare-fun e!846485 () Bool)

(assert (=> b!1516623 (= e!846482 e!846485)))

(declare-fun res!1035362 () Bool)

(assert (=> b!1516623 (=> res!1035362 e!846485)))

(declare-fun lt!657125 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101074 0))(
  ( (array!101075 (arr!48769 (Array (_ BitVec 32) (_ BitVec 64))) (size!49320 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101074)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516623 (= res!1035362 (or (not (= (select (arr!48769 a!2804) j!70) lt!657125)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48769 a!2804) index!487) (select (arr!48769 a!2804) j!70)) (not (= (select (arr!48769 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516624 () Bool)

(declare-fun res!1035351 () Bool)

(declare-fun e!846483 () Bool)

(assert (=> b!1516624 (=> (not res!1035351) (not e!846483))))

(declare-datatypes ((SeekEntryResult!12833 0))(
  ( (MissingZero!12833 (index!53727 (_ BitVec 32))) (Found!12833 (index!53728 (_ BitVec 32))) (Intermediate!12833 (undefined!13645 Bool) (index!53729 (_ BitVec 32)) (x!135636 (_ BitVec 32))) (Undefined!12833) (MissingVacant!12833 (index!53730 (_ BitVec 32))) )
))
(declare-fun lt!657124 () SeekEntryResult!12833)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1516624 (= res!1035351 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) lt!657124))))

(declare-fun b!1516625 () Bool)

(declare-fun res!1035352 () Bool)

(declare-fun e!846481 () Bool)

(assert (=> b!1516625 (=> (not res!1035352) (not e!846481))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516625 (= res!1035352 (and (= (size!49320 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49320 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49320 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516626 () Bool)

(declare-fun res!1035353 () Bool)

(assert (=> b!1516626 (=> (not res!1035353) (not e!846481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101074 (_ BitVec 32)) Bool)

(assert (=> b!1516626 (= res!1035353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516627 () Bool)

(assert (=> b!1516627 (= e!846481 e!846483)))

(declare-fun res!1035358 () Bool)

(assert (=> b!1516627 (=> (not res!1035358) (not e!846483))))

(declare-fun lt!657127 () SeekEntryResult!12833)

(assert (=> b!1516627 (= res!1035358 (= lt!657127 lt!657124))))

(assert (=> b!1516627 (= lt!657124 (Intermediate!12833 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516627 (= lt!657127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48769 a!2804) j!70) mask!2512) (select (arr!48769 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035359 () Bool)

(assert (=> start!129404 (=> (not res!1035359) (not e!846481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129404 (= res!1035359 (validMask!0 mask!2512))))

(assert (=> start!129404 e!846481))

(assert (=> start!129404 true))

(declare-fun array_inv!38050 (array!101074) Bool)

(assert (=> start!129404 (array_inv!38050 a!2804)))

(declare-fun b!1516628 () Bool)

(declare-fun res!1035361 () Bool)

(assert (=> b!1516628 (=> (not res!1035361) (not e!846481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516628 (= res!1035361 (validKeyInArray!0 (select (arr!48769 a!2804) i!961)))))

(declare-fun b!1516629 () Bool)

(declare-fun res!1035349 () Bool)

(assert (=> b!1516629 (=> (not res!1035349) (not e!846481))))

(declare-datatypes ((List!35239 0))(
  ( (Nil!35236) (Cons!35235 (h!36662 (_ BitVec 64)) (t!49925 List!35239)) )
))
(declare-fun arrayNoDuplicates!0 (array!101074 (_ BitVec 32) List!35239) Bool)

(assert (=> b!1516629 (= res!1035349 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35236))))

(declare-fun b!1516630 () Bool)

(declare-fun res!1035356 () Bool)

(assert (=> b!1516630 (=> (not res!1035356) (not e!846481))))

(assert (=> b!1516630 (= res!1035356 (validKeyInArray!0 (select (arr!48769 a!2804) j!70)))))

(declare-fun e!846480 () Bool)

(declare-fun lt!657123 () array!101074)

(declare-fun b!1516631 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12833)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1516631 (= e!846480 (= (seekEntryOrOpen!0 lt!657125 lt!657123 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657125 lt!657123 mask!2512)))))

(declare-fun b!1516632 () Bool)

(declare-fun e!846486 () Bool)

(assert (=> b!1516632 (= e!846483 e!846486)))

(declare-fun res!1035360 () Bool)

(assert (=> b!1516632 (=> (not res!1035360) (not e!846486))))

(assert (=> b!1516632 (= res!1035360 (= lt!657127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657125 mask!2512) lt!657125 lt!657123 mask!2512)))))

(assert (=> b!1516632 (= lt!657125 (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516632 (= lt!657123 (array!101075 (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49320 a!2804)))))

(declare-fun b!1516633 () Bool)

(assert (=> b!1516633 (= e!846485 e!846480)))

(declare-fun res!1035357 () Bool)

(assert (=> b!1516633 (=> (not res!1035357) (not e!846480))))

(assert (=> b!1516633 (= res!1035357 (= (seekEntryOrOpen!0 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48769 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516634 () Bool)

(declare-fun res!1035354 () Bool)

(assert (=> b!1516634 (=> (not res!1035354) (not e!846481))))

(assert (=> b!1516634 (= res!1035354 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49320 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49320 a!2804))))))

(declare-fun b!1516635 () Bool)

(declare-fun res!1035350 () Bool)

(assert (=> b!1516635 (=> (not res!1035350) (not e!846482))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12833)

(assert (=> b!1516635 (= res!1035350 (= (seekEntry!0 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) (Found!12833 j!70)))))

(declare-fun b!1516636 () Bool)

(assert (=> b!1516636 (= e!846486 (not true))))

(assert (=> b!1516636 e!846482))

(declare-fun res!1035355 () Bool)

(assert (=> b!1516636 (=> (not res!1035355) (not e!846482))))

(assert (=> b!1516636 (= res!1035355 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50569 0))(
  ( (Unit!50570) )
))
(declare-fun lt!657126 () Unit!50569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50569)

(assert (=> b!1516636 (= lt!657126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129404 res!1035359) b!1516625))

(assert (= (and b!1516625 res!1035352) b!1516628))

(assert (= (and b!1516628 res!1035361) b!1516630))

(assert (= (and b!1516630 res!1035356) b!1516626))

(assert (= (and b!1516626 res!1035353) b!1516629))

(assert (= (and b!1516629 res!1035349) b!1516634))

(assert (= (and b!1516634 res!1035354) b!1516627))

(assert (= (and b!1516627 res!1035358) b!1516624))

(assert (= (and b!1516624 res!1035351) b!1516632))

(assert (= (and b!1516632 res!1035360) b!1516636))

(assert (= (and b!1516636 res!1035355) b!1516635))

(assert (= (and b!1516635 res!1035350) b!1516623))

(assert (= (and b!1516623 (not res!1035362)) b!1516633))

(assert (= (and b!1516633 res!1035357) b!1516631))

(declare-fun m!1399575 () Bool)

(assert (=> b!1516636 m!1399575))

(declare-fun m!1399577 () Bool)

(assert (=> b!1516636 m!1399577))

(declare-fun m!1399579 () Bool)

(assert (=> b!1516629 m!1399579))

(declare-fun m!1399581 () Bool)

(assert (=> b!1516628 m!1399581))

(assert (=> b!1516628 m!1399581))

(declare-fun m!1399583 () Bool)

(assert (=> b!1516628 m!1399583))

(declare-fun m!1399585 () Bool)

(assert (=> b!1516626 m!1399585))

(declare-fun m!1399587 () Bool)

(assert (=> b!1516631 m!1399587))

(declare-fun m!1399589 () Bool)

(assert (=> b!1516631 m!1399589))

(declare-fun m!1399591 () Bool)

(assert (=> start!129404 m!1399591))

(declare-fun m!1399593 () Bool)

(assert (=> start!129404 m!1399593))

(declare-fun m!1399595 () Bool)

(assert (=> b!1516632 m!1399595))

(assert (=> b!1516632 m!1399595))

(declare-fun m!1399597 () Bool)

(assert (=> b!1516632 m!1399597))

(declare-fun m!1399599 () Bool)

(assert (=> b!1516632 m!1399599))

(declare-fun m!1399601 () Bool)

(assert (=> b!1516632 m!1399601))

(declare-fun m!1399603 () Bool)

(assert (=> b!1516633 m!1399603))

(assert (=> b!1516633 m!1399603))

(declare-fun m!1399605 () Bool)

(assert (=> b!1516633 m!1399605))

(assert (=> b!1516633 m!1399603))

(declare-fun m!1399607 () Bool)

(assert (=> b!1516633 m!1399607))

(assert (=> b!1516627 m!1399603))

(assert (=> b!1516627 m!1399603))

(declare-fun m!1399609 () Bool)

(assert (=> b!1516627 m!1399609))

(assert (=> b!1516627 m!1399609))

(assert (=> b!1516627 m!1399603))

(declare-fun m!1399611 () Bool)

(assert (=> b!1516627 m!1399611))

(assert (=> b!1516630 m!1399603))

(assert (=> b!1516630 m!1399603))

(declare-fun m!1399613 () Bool)

(assert (=> b!1516630 m!1399613))

(assert (=> b!1516624 m!1399603))

(assert (=> b!1516624 m!1399603))

(declare-fun m!1399615 () Bool)

(assert (=> b!1516624 m!1399615))

(assert (=> b!1516635 m!1399603))

(assert (=> b!1516635 m!1399603))

(declare-fun m!1399617 () Bool)

(assert (=> b!1516635 m!1399617))

(assert (=> b!1516623 m!1399603))

(declare-fun m!1399619 () Bool)

(assert (=> b!1516623 m!1399619))

(check-sat (not b!1516624) (not b!1516629) (not b!1516635) (not b!1516628) (not b!1516630) (not b!1516633) (not b!1516626) (not start!129404) (not b!1516636) (not b!1516631) (not b!1516632) (not b!1516627))
(check-sat)
