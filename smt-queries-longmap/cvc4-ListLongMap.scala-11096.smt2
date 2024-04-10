; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129602 () Bool)

(assert start!129602)

(declare-fun b!1521436 () Bool)

(declare-fun res!1040660 () Bool)

(declare-fun e!848527 () Bool)

(assert (=> b!1521436 (=> (not res!1040660) (not e!848527))))

(declare-datatypes ((array!101277 0))(
  ( (array!101278 (arr!48871 (Array (_ BitVec 32) (_ BitVec 64))) (size!49421 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101277)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101277 (_ BitVec 32)) Bool)

(assert (=> b!1521436 (= res!1040660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1040659 () Bool)

(assert (=> start!129602 (=> (not res!1040659) (not e!848527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129602 (= res!1040659 (validMask!0 mask!2512))))

(assert (=> start!129602 e!848527))

(assert (=> start!129602 true))

(declare-fun array_inv!37899 (array!101277) Bool)

(assert (=> start!129602 (array_inv!37899 a!2804)))

(declare-fun b!1521437 () Bool)

(declare-fun res!1040658 () Bool)

(assert (=> b!1521437 (=> (not res!1040658) (not e!848527))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521437 (= res!1040658 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49421 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49421 a!2804))))))

(declare-fun b!1521438 () Bool)

(assert (=> b!1521438 (= e!848527 false)))

(declare-datatypes ((SeekEntryResult!13036 0))(
  ( (MissingZero!13036 (index!54539 (_ BitVec 32))) (Found!13036 (index!54540 (_ BitVec 32))) (Intermediate!13036 (undefined!13848 Bool) (index!54541 (_ BitVec 32)) (x!136232 (_ BitVec 32))) (Undefined!13036) (MissingVacant!13036 (index!54542 (_ BitVec 32))) )
))
(declare-fun lt!659350 () SeekEntryResult!13036)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101277 (_ BitVec 32)) SeekEntryResult!13036)

(assert (=> b!1521438 (= lt!659350 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48871 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521439 () Bool)

(declare-fun res!1040661 () Bool)

(assert (=> b!1521439 (=> (not res!1040661) (not e!848527))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521439 (= res!1040661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48871 a!2804) j!70) mask!2512) (select (arr!48871 a!2804) j!70) a!2804 mask!2512) (Intermediate!13036 false resIndex!21 resX!21)))))

(declare-fun b!1521440 () Bool)

(declare-fun res!1040663 () Bool)

(assert (=> b!1521440 (=> (not res!1040663) (not e!848527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521440 (= res!1040663 (validKeyInArray!0 (select (arr!48871 a!2804) j!70)))))

(declare-fun b!1521441 () Bool)

(declare-fun res!1040662 () Bool)

(assert (=> b!1521441 (=> (not res!1040662) (not e!848527))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521441 (= res!1040662 (validKeyInArray!0 (select (arr!48871 a!2804) i!961)))))

(declare-fun b!1521442 () Bool)

(declare-fun res!1040664 () Bool)

(assert (=> b!1521442 (=> (not res!1040664) (not e!848527))))

(declare-datatypes ((List!35354 0))(
  ( (Nil!35351) (Cons!35350 (h!36771 (_ BitVec 64)) (t!50048 List!35354)) )
))
(declare-fun arrayNoDuplicates!0 (array!101277 (_ BitVec 32) List!35354) Bool)

(assert (=> b!1521442 (= res!1040664 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35351))))

(declare-fun b!1521443 () Bool)

(declare-fun res!1040665 () Bool)

(assert (=> b!1521443 (=> (not res!1040665) (not e!848527))))

(assert (=> b!1521443 (= res!1040665 (and (= (size!49421 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49421 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49421 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129602 res!1040659) b!1521443))

(assert (= (and b!1521443 res!1040665) b!1521441))

(assert (= (and b!1521441 res!1040662) b!1521440))

(assert (= (and b!1521440 res!1040663) b!1521436))

(assert (= (and b!1521436 res!1040660) b!1521442))

(assert (= (and b!1521442 res!1040664) b!1521437))

(assert (= (and b!1521437 res!1040658) b!1521439))

(assert (= (and b!1521439 res!1040661) b!1521438))

(declare-fun m!1404529 () Bool)

(assert (=> b!1521442 m!1404529))

(declare-fun m!1404531 () Bool)

(assert (=> start!129602 m!1404531))

(declare-fun m!1404533 () Bool)

(assert (=> start!129602 m!1404533))

(declare-fun m!1404535 () Bool)

(assert (=> b!1521436 m!1404535))

(declare-fun m!1404537 () Bool)

(assert (=> b!1521438 m!1404537))

(assert (=> b!1521438 m!1404537))

(declare-fun m!1404539 () Bool)

(assert (=> b!1521438 m!1404539))

(assert (=> b!1521439 m!1404537))

(assert (=> b!1521439 m!1404537))

(declare-fun m!1404541 () Bool)

(assert (=> b!1521439 m!1404541))

(assert (=> b!1521439 m!1404541))

(assert (=> b!1521439 m!1404537))

(declare-fun m!1404543 () Bool)

(assert (=> b!1521439 m!1404543))

(assert (=> b!1521440 m!1404537))

(assert (=> b!1521440 m!1404537))

(declare-fun m!1404545 () Bool)

(assert (=> b!1521440 m!1404545))

(declare-fun m!1404547 () Bool)

(assert (=> b!1521441 m!1404547))

(assert (=> b!1521441 m!1404547))

(declare-fun m!1404549 () Bool)

(assert (=> b!1521441 m!1404549))

(push 1)

(assert (not b!1521441))

(assert (not b!1521439))

(assert (not b!1521442))

(assert (not b!1521438))

(assert (not start!129602))

(assert (not b!1521440))

(assert (not b!1521436))

(check-sat)

