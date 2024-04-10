; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129608 () Bool)

(assert start!129608)

(declare-fun b!1521516 () Bool)

(declare-fun res!1040739 () Bool)

(declare-fun e!848553 () Bool)

(assert (=> b!1521516 (=> (not res!1040739) (not e!848553))))

(declare-datatypes ((array!101283 0))(
  ( (array!101284 (arr!48874 (Array (_ BitVec 32) (_ BitVec 64))) (size!49424 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101283)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521516 (= res!1040739 (validKeyInArray!0 (select (arr!48874 a!2804) j!70)))))

(declare-fun b!1521517 () Bool)

(declare-fun res!1040744 () Bool)

(assert (=> b!1521517 (=> (not res!1040744) (not e!848553))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101283 (_ BitVec 32)) Bool)

(assert (=> b!1521517 (= res!1040744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521518 () Bool)

(declare-fun res!1040743 () Bool)

(assert (=> b!1521518 (=> (not res!1040743) (not e!848553))))

(declare-datatypes ((List!35357 0))(
  ( (Nil!35354) (Cons!35353 (h!36774 (_ BitVec 64)) (t!50051 List!35357)) )
))
(declare-fun arrayNoDuplicates!0 (array!101283 (_ BitVec 32) List!35357) Bool)

(assert (=> b!1521518 (= res!1040743 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35354))))

(declare-fun b!1521519 () Bool)

(declare-fun res!1040738 () Bool)

(assert (=> b!1521519 (=> (not res!1040738) (not e!848553))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521519 (= res!1040738 (validKeyInArray!0 (select (arr!48874 a!2804) i!961)))))

(declare-fun b!1521520 () Bool)

(declare-fun res!1040745 () Bool)

(assert (=> b!1521520 (=> (not res!1040745) (not e!848553))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521520 (= res!1040745 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49424 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49424 a!2804))))))

(declare-fun res!1040741 () Bool)

(assert (=> start!129608 (=> (not res!1040741) (not e!848553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129608 (= res!1040741 (validMask!0 mask!2512))))

(assert (=> start!129608 e!848553))

(assert (=> start!129608 true))

(declare-fun array_inv!37902 (array!101283) Bool)

(assert (=> start!129608 (array_inv!37902 a!2804)))

(declare-fun b!1521521 () Bool)

(declare-fun res!1040746 () Bool)

(assert (=> b!1521521 (=> (not res!1040746) (not e!848553))))

(assert (=> b!1521521 (= res!1040746 (and (= (size!49424 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49424 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49424 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521522 () Bool)

(declare-fun res!1040742 () Bool)

(declare-fun e!848554 () Bool)

(assert (=> b!1521522 (=> (not res!1040742) (not e!848554))))

(declare-datatypes ((SeekEntryResult!13039 0))(
  ( (MissingZero!13039 (index!54551 (_ BitVec 32))) (Found!13039 (index!54552 (_ BitVec 32))) (Intermediate!13039 (undefined!13851 Bool) (index!54553 (_ BitVec 32)) (x!136243 (_ BitVec 32))) (Undefined!13039) (MissingVacant!13039 (index!54554 (_ BitVec 32))) )
))
(declare-fun lt!659368 () SeekEntryResult!13039)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101283 (_ BitVec 32)) SeekEntryResult!13039)

(assert (=> b!1521522 (= res!1040742 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48874 a!2804) j!70) a!2804 mask!2512) lt!659368))))

(declare-fun b!1521523 () Bool)

(assert (=> b!1521523 (= e!848553 e!848554)))

(declare-fun res!1040740 () Bool)

(assert (=> b!1521523 (=> (not res!1040740) (not e!848554))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521523 (= res!1040740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48874 a!2804) j!70) mask!2512) (select (arr!48874 a!2804) j!70) a!2804 mask!2512) lt!659368))))

(assert (=> b!1521523 (= lt!659368 (Intermediate!13039 false resIndex!21 resX!21))))

(declare-fun b!1521524 () Bool)

(assert (=> b!1521524 (= e!848554 false)))

(declare-fun lt!659367 () (_ BitVec 32))

(assert (=> b!1521524 (= lt!659367 (toIndex!0 (select (store (arr!48874 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(assert (= (and start!129608 res!1040741) b!1521521))

(assert (= (and b!1521521 res!1040746) b!1521519))

(assert (= (and b!1521519 res!1040738) b!1521516))

(assert (= (and b!1521516 res!1040739) b!1521517))

(assert (= (and b!1521517 res!1040744) b!1521518))

(assert (= (and b!1521518 res!1040743) b!1521520))

(assert (= (and b!1521520 res!1040745) b!1521523))

(assert (= (and b!1521523 res!1040740) b!1521522))

(assert (= (and b!1521522 res!1040742) b!1521524))

(declare-fun m!1404607 () Bool)

(assert (=> start!129608 m!1404607))

(declare-fun m!1404609 () Bool)

(assert (=> start!129608 m!1404609))

(declare-fun m!1404611 () Bool)

(assert (=> b!1521524 m!1404611))

(declare-fun m!1404613 () Bool)

(assert (=> b!1521524 m!1404613))

(assert (=> b!1521524 m!1404613))

(declare-fun m!1404615 () Bool)

(assert (=> b!1521524 m!1404615))

(declare-fun m!1404617 () Bool)

(assert (=> b!1521517 m!1404617))

(declare-fun m!1404619 () Bool)

(assert (=> b!1521516 m!1404619))

(assert (=> b!1521516 m!1404619))

(declare-fun m!1404621 () Bool)

(assert (=> b!1521516 m!1404621))

(assert (=> b!1521522 m!1404619))

(assert (=> b!1521522 m!1404619))

(declare-fun m!1404623 () Bool)

(assert (=> b!1521522 m!1404623))

(declare-fun m!1404625 () Bool)

(assert (=> b!1521519 m!1404625))

(assert (=> b!1521519 m!1404625))

(declare-fun m!1404627 () Bool)

(assert (=> b!1521519 m!1404627))

(assert (=> b!1521523 m!1404619))

(assert (=> b!1521523 m!1404619))

(declare-fun m!1404629 () Bool)

(assert (=> b!1521523 m!1404629))

(assert (=> b!1521523 m!1404629))

(assert (=> b!1521523 m!1404619))

(declare-fun m!1404631 () Bool)

(assert (=> b!1521523 m!1404631))

(declare-fun m!1404633 () Bool)

(assert (=> b!1521518 m!1404633))

(push 1)

(assert (not b!1521522))

(assert (not b!1521523))

