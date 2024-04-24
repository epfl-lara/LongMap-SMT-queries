; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130260 () Bool)

(assert start!130260)

(declare-fun b!1526629 () Bool)

(declare-fun res!1043803 () Bool)

(declare-fun e!851181 () Bool)

(assert (=> b!1526629 (=> (not res!1043803) (not e!851181))))

(declare-datatypes ((SeekEntryResult!13049 0))(
  ( (MissingZero!13049 (index!54591 (_ BitVec 32))) (Found!13049 (index!54592 (_ BitVec 32))) (Intermediate!13049 (undefined!13861 Bool) (index!54593 (_ BitVec 32)) (x!136492 (_ BitVec 32))) (Undefined!13049) (MissingVacant!13049 (index!54594 (_ BitVec 32))) )
))
(declare-fun lt!661162 () SeekEntryResult!13049)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101536 0))(
  ( (array!101537 (arr!48991 (Array (_ BitVec 32) (_ BitVec 64))) (size!49542 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101536)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101536 (_ BitVec 32)) SeekEntryResult!13049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526629 (= res!1043803 (= lt!661162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101537 (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49542 a!2804)) mask!2512)))))

(declare-fun res!1043795 () Bool)

(declare-fun e!851179 () Bool)

(assert (=> start!130260 (=> (not res!1043795) (not e!851179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130260 (= res!1043795 (validMask!0 mask!2512))))

(assert (=> start!130260 e!851179))

(assert (=> start!130260 true))

(declare-fun array_inv!38272 (array!101536) Bool)

(assert (=> start!130260 (array_inv!38272 a!2804)))

(declare-fun b!1526630 () Bool)

(declare-fun res!1043796 () Bool)

(assert (=> b!1526630 (=> (not res!1043796) (not e!851179))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526630 (= res!1043796 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49542 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49542 a!2804))))))

(declare-fun b!1526631 () Bool)

(declare-fun res!1043797 () Bool)

(assert (=> b!1526631 (=> (not res!1043797) (not e!851179))))

(declare-datatypes ((List!35461 0))(
  ( (Nil!35458) (Cons!35457 (h!36902 (_ BitVec 64)) (t!50147 List!35461)) )
))
(declare-fun arrayNoDuplicates!0 (array!101536 (_ BitVec 32) List!35461) Bool)

(assert (=> b!1526631 (= res!1043797 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35458))))

(declare-fun b!1526632 () Bool)

(assert (=> b!1526632 (= e!851181 (not true))))

(declare-fun e!851182 () Bool)

(assert (=> b!1526632 e!851182))

(declare-fun res!1043805 () Bool)

(assert (=> b!1526632 (=> (not res!1043805) (not e!851182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101536 (_ BitVec 32)) Bool)

(assert (=> b!1526632 (= res!1043805 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50917 0))(
  ( (Unit!50918) )
))
(declare-fun lt!661163 () Unit!50917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50917)

(assert (=> b!1526632 (= lt!661163 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526633 () Bool)

(declare-fun res!1043798 () Bool)

(assert (=> b!1526633 (=> (not res!1043798) (not e!851179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526633 (= res!1043798 (validKeyInArray!0 (select (arr!48991 a!2804) i!961)))))

(declare-fun b!1526634 () Bool)

(declare-fun res!1043801 () Bool)

(assert (=> b!1526634 (=> (not res!1043801) (not e!851179))))

(assert (=> b!1526634 (= res!1043801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526635 () Bool)

(declare-fun res!1043804 () Bool)

(assert (=> b!1526635 (=> (not res!1043804) (not e!851179))))

(assert (=> b!1526635 (= res!1043804 (validKeyInArray!0 (select (arr!48991 a!2804) j!70)))))

(declare-fun b!1526636 () Bool)

(declare-fun res!1043800 () Bool)

(assert (=> b!1526636 (=> (not res!1043800) (not e!851179))))

(assert (=> b!1526636 (= res!1043800 (and (= (size!49542 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49542 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49542 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526637 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101536 (_ BitVec 32)) SeekEntryResult!13049)

(assert (=> b!1526637 (= e!851182 (= (seekEntry!0 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) (Found!13049 j!70)))))

(declare-fun b!1526638 () Bool)

(assert (=> b!1526638 (= e!851179 e!851181)))

(declare-fun res!1043802 () Bool)

(assert (=> b!1526638 (=> (not res!1043802) (not e!851181))))

(declare-fun lt!661164 () SeekEntryResult!13049)

(assert (=> b!1526638 (= res!1043802 (= lt!661162 lt!661164))))

(assert (=> b!1526638 (= lt!661164 (Intermediate!13049 false resIndex!21 resX!21))))

(assert (=> b!1526638 (= lt!661162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48991 a!2804) j!70) mask!2512) (select (arr!48991 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526639 () Bool)

(declare-fun res!1043799 () Bool)

(assert (=> b!1526639 (=> (not res!1043799) (not e!851181))))

(assert (=> b!1526639 (= res!1043799 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) lt!661164))))

(assert (= (and start!130260 res!1043795) b!1526636))

(assert (= (and b!1526636 res!1043800) b!1526633))

(assert (= (and b!1526633 res!1043798) b!1526635))

(assert (= (and b!1526635 res!1043804) b!1526634))

(assert (= (and b!1526634 res!1043801) b!1526631))

(assert (= (and b!1526631 res!1043797) b!1526630))

(assert (= (and b!1526630 res!1043796) b!1526638))

(assert (= (and b!1526638 res!1043802) b!1526639))

(assert (= (and b!1526639 res!1043799) b!1526629))

(assert (= (and b!1526629 res!1043803) b!1526632))

(assert (= (and b!1526632 res!1043805) b!1526637))

(declare-fun m!1409515 () Bool)

(assert (=> b!1526635 m!1409515))

(assert (=> b!1526635 m!1409515))

(declare-fun m!1409517 () Bool)

(assert (=> b!1526635 m!1409517))

(assert (=> b!1526637 m!1409515))

(assert (=> b!1526637 m!1409515))

(declare-fun m!1409519 () Bool)

(assert (=> b!1526637 m!1409519))

(assert (=> b!1526639 m!1409515))

(assert (=> b!1526639 m!1409515))

(declare-fun m!1409521 () Bool)

(assert (=> b!1526639 m!1409521))

(assert (=> b!1526638 m!1409515))

(assert (=> b!1526638 m!1409515))

(declare-fun m!1409523 () Bool)

(assert (=> b!1526638 m!1409523))

(assert (=> b!1526638 m!1409523))

(assert (=> b!1526638 m!1409515))

(declare-fun m!1409525 () Bool)

(assert (=> b!1526638 m!1409525))

(declare-fun m!1409527 () Bool)

(assert (=> b!1526631 m!1409527))

(declare-fun m!1409529 () Bool)

(assert (=> start!130260 m!1409529))

(declare-fun m!1409531 () Bool)

(assert (=> start!130260 m!1409531))

(declare-fun m!1409533 () Bool)

(assert (=> b!1526629 m!1409533))

(declare-fun m!1409535 () Bool)

(assert (=> b!1526629 m!1409535))

(assert (=> b!1526629 m!1409535))

(declare-fun m!1409537 () Bool)

(assert (=> b!1526629 m!1409537))

(assert (=> b!1526629 m!1409537))

(assert (=> b!1526629 m!1409535))

(declare-fun m!1409539 () Bool)

(assert (=> b!1526629 m!1409539))

(declare-fun m!1409541 () Bool)

(assert (=> b!1526633 m!1409541))

(assert (=> b!1526633 m!1409541))

(declare-fun m!1409543 () Bool)

(assert (=> b!1526633 m!1409543))

(declare-fun m!1409545 () Bool)

(assert (=> b!1526632 m!1409545))

(declare-fun m!1409547 () Bool)

(assert (=> b!1526632 m!1409547))

(declare-fun m!1409549 () Bool)

(assert (=> b!1526634 m!1409549))

(check-sat (not b!1526629) (not b!1526639) (not start!130260) (not b!1526634) (not b!1526638) (not b!1526637) (not b!1526633) (not b!1526635) (not b!1526632) (not b!1526631))
(check-sat)
