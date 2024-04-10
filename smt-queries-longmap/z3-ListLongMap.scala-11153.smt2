; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130282 () Bool)

(assert start!130282)

(declare-fun b!1529640 () Bool)

(declare-fun res!1047349 () Bool)

(declare-fun e!852417 () Bool)

(assert (=> b!1529640 (=> (not res!1047349) (not e!852417))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101632 0))(
  ( (array!101633 (arr!49041 (Array (_ BitVec 32) (_ BitVec 64))) (size!49591 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101632)

(assert (=> b!1529640 (= res!1047349 (and (= (size!49591 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49591 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49591 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529641 () Bool)

(declare-fun e!852415 () Bool)

(declare-fun e!852418 () Bool)

(assert (=> b!1529641 (= e!852415 (not e!852418))))

(declare-fun res!1047358 () Bool)

(assert (=> b!1529641 (=> res!1047358 e!852418)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529641 (= res!1047358 (or (not (= (select (arr!49041 a!2804) j!70) (select (store (arr!49041 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852414 () Bool)

(assert (=> b!1529641 e!852414))

(declare-fun res!1047355 () Bool)

(assert (=> b!1529641 (=> (not res!1047355) (not e!852414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101632 (_ BitVec 32)) Bool)

(assert (=> b!1529641 (= res!1047355 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51196 0))(
  ( (Unit!51197) )
))
(declare-fun lt!662502 () Unit!51196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51196)

(assert (=> b!1529641 (= lt!662502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529642 () Bool)

(declare-fun res!1047352 () Bool)

(assert (=> b!1529642 (=> (not res!1047352) (not e!852417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529642 (= res!1047352 (validKeyInArray!0 (select (arr!49041 a!2804) i!961)))))

(declare-fun b!1529643 () Bool)

(assert (=> b!1529643 (= e!852418 true)))

(declare-fun lt!662503 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529643 (= lt!662503 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529644 () Bool)

(assert (=> b!1529644 (= e!852417 e!852415)))

(declare-fun res!1047353 () Bool)

(assert (=> b!1529644 (=> (not res!1047353) (not e!852415))))

(declare-datatypes ((SeekEntryResult!13206 0))(
  ( (MissingZero!13206 (index!55219 (_ BitVec 32))) (Found!13206 (index!55220 (_ BitVec 32))) (Intermediate!13206 (undefined!14018 Bool) (index!55221 (_ BitVec 32)) (x!136901 (_ BitVec 32))) (Undefined!13206) (MissingVacant!13206 (index!55222 (_ BitVec 32))) )
))
(declare-fun lt!662501 () SeekEntryResult!13206)

(declare-fun lt!662500 () SeekEntryResult!13206)

(assert (=> b!1529644 (= res!1047353 (= lt!662501 lt!662500))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529644 (= lt!662500 (Intermediate!13206 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529644 (= lt!662501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49041 a!2804) j!70) mask!2512) (select (arr!49041 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529645 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101632 (_ BitVec 32)) SeekEntryResult!13206)

(assert (=> b!1529645 (= e!852414 (= (seekEntry!0 (select (arr!49041 a!2804) j!70) a!2804 mask!2512) (Found!13206 j!70)))))

(declare-fun b!1529646 () Bool)

(declare-fun res!1047356 () Bool)

(assert (=> b!1529646 (=> (not res!1047356) (not e!852417))))

(declare-datatypes ((List!35524 0))(
  ( (Nil!35521) (Cons!35520 (h!36956 (_ BitVec 64)) (t!50218 List!35524)) )
))
(declare-fun arrayNoDuplicates!0 (array!101632 (_ BitVec 32) List!35524) Bool)

(assert (=> b!1529646 (= res!1047356 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35521))))

(declare-fun res!1047350 () Bool)

(assert (=> start!130282 (=> (not res!1047350) (not e!852417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130282 (= res!1047350 (validMask!0 mask!2512))))

(assert (=> start!130282 e!852417))

(assert (=> start!130282 true))

(declare-fun array_inv!38069 (array!101632) Bool)

(assert (=> start!130282 (array_inv!38069 a!2804)))

(declare-fun b!1529647 () Bool)

(declare-fun res!1047354 () Bool)

(assert (=> b!1529647 (=> (not res!1047354) (not e!852417))))

(assert (=> b!1529647 (= res!1047354 (validKeyInArray!0 (select (arr!49041 a!2804) j!70)))))

(declare-fun b!1529648 () Bool)

(declare-fun res!1047351 () Bool)

(assert (=> b!1529648 (=> (not res!1047351) (not e!852417))))

(assert (=> b!1529648 (= res!1047351 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49591 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49591 a!2804))))))

(declare-fun b!1529649 () Bool)

(declare-fun res!1047347 () Bool)

(assert (=> b!1529649 (=> (not res!1047347) (not e!852415))))

(assert (=> b!1529649 (= res!1047347 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49041 a!2804) j!70) a!2804 mask!2512) lt!662500))))

(declare-fun b!1529650 () Bool)

(declare-fun res!1047348 () Bool)

(assert (=> b!1529650 (=> (not res!1047348) (not e!852417))))

(assert (=> b!1529650 (= res!1047348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529651 () Bool)

(declare-fun res!1047357 () Bool)

(assert (=> b!1529651 (=> (not res!1047357) (not e!852415))))

(assert (=> b!1529651 (= res!1047357 (= lt!662501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49041 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49041 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101633 (store (arr!49041 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49591 a!2804)) mask!2512)))))

(assert (= (and start!130282 res!1047350) b!1529640))

(assert (= (and b!1529640 res!1047349) b!1529642))

(assert (= (and b!1529642 res!1047352) b!1529647))

(assert (= (and b!1529647 res!1047354) b!1529650))

(assert (= (and b!1529650 res!1047348) b!1529646))

(assert (= (and b!1529646 res!1047356) b!1529648))

(assert (= (and b!1529648 res!1047351) b!1529644))

(assert (= (and b!1529644 res!1047353) b!1529649))

(assert (= (and b!1529649 res!1047347) b!1529651))

(assert (= (and b!1529651 res!1047357) b!1529641))

(assert (= (and b!1529641 res!1047355) b!1529645))

(assert (= (and b!1529641 (not res!1047358)) b!1529643))

(declare-fun m!1412597 () Bool)

(assert (=> b!1529643 m!1412597))

(declare-fun m!1412599 () Bool)

(assert (=> b!1529651 m!1412599))

(declare-fun m!1412601 () Bool)

(assert (=> b!1529651 m!1412601))

(assert (=> b!1529651 m!1412601))

(declare-fun m!1412603 () Bool)

(assert (=> b!1529651 m!1412603))

(assert (=> b!1529651 m!1412603))

(assert (=> b!1529651 m!1412601))

(declare-fun m!1412605 () Bool)

(assert (=> b!1529651 m!1412605))

(declare-fun m!1412607 () Bool)

(assert (=> b!1529644 m!1412607))

(assert (=> b!1529644 m!1412607))

(declare-fun m!1412609 () Bool)

(assert (=> b!1529644 m!1412609))

(assert (=> b!1529644 m!1412609))

(assert (=> b!1529644 m!1412607))

(declare-fun m!1412611 () Bool)

(assert (=> b!1529644 m!1412611))

(declare-fun m!1412613 () Bool)

(assert (=> b!1529646 m!1412613))

(assert (=> b!1529649 m!1412607))

(assert (=> b!1529649 m!1412607))

(declare-fun m!1412615 () Bool)

(assert (=> b!1529649 m!1412615))

(assert (=> b!1529647 m!1412607))

(assert (=> b!1529647 m!1412607))

(declare-fun m!1412617 () Bool)

(assert (=> b!1529647 m!1412617))

(assert (=> b!1529641 m!1412607))

(declare-fun m!1412619 () Bool)

(assert (=> b!1529641 m!1412619))

(assert (=> b!1529641 m!1412599))

(assert (=> b!1529641 m!1412601))

(declare-fun m!1412621 () Bool)

(assert (=> b!1529641 m!1412621))

(declare-fun m!1412623 () Bool)

(assert (=> b!1529642 m!1412623))

(assert (=> b!1529642 m!1412623))

(declare-fun m!1412625 () Bool)

(assert (=> b!1529642 m!1412625))

(assert (=> b!1529645 m!1412607))

(assert (=> b!1529645 m!1412607))

(declare-fun m!1412627 () Bool)

(assert (=> b!1529645 m!1412627))

(declare-fun m!1412629 () Bool)

(assert (=> start!130282 m!1412629))

(declare-fun m!1412631 () Bool)

(assert (=> start!130282 m!1412631))

(declare-fun m!1412633 () Bool)

(assert (=> b!1529650 m!1412633))

(check-sat (not start!130282) (not b!1529643) (not b!1529651) (not b!1529645) (not b!1529649) (not b!1529647) (not b!1529644) (not b!1529641) (not b!1529650) (not b!1529642) (not b!1529646))
(check-sat)
