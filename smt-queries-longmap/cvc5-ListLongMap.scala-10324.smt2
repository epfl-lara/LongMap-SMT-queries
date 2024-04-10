; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121428 () Bool)

(assert start!121428)

(declare-fun b!1410803 () Bool)

(declare-fun res!948037 () Bool)

(declare-fun e!798374 () Bool)

(assert (=> b!1410803 (=> (not res!948037) (not e!798374))))

(declare-datatypes ((array!96429 0))(
  ( (array!96430 (arr!46553 (Array (_ BitVec 32) (_ BitVec 64))) (size!47103 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96429)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410803 (= res!948037 (validKeyInArray!0 (select (arr!46553 a!2901) j!112)))))

(declare-fun b!1410804 () Bool)

(declare-fun res!948036 () Bool)

(assert (=> b!1410804 (=> (not res!948036) (not e!798374))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410804 (= res!948036 (and (= (size!47103 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47103 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47103 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410805 () Bool)

(declare-fun e!798372 () Bool)

(assert (=> b!1410805 (= e!798374 (not e!798372))))

(declare-fun res!948032 () Bool)

(assert (=> b!1410805 (=> res!948032 e!798372)))

(declare-datatypes ((SeekEntryResult!10864 0))(
  ( (MissingZero!10864 (index!45833 (_ BitVec 32))) (Found!10864 (index!45834 (_ BitVec 32))) (Intermediate!10864 (undefined!11676 Bool) (index!45835 (_ BitVec 32)) (x!127435 (_ BitVec 32))) (Undefined!10864) (MissingVacant!10864 (index!45836 (_ BitVec 32))) )
))
(declare-fun lt!621345 () SeekEntryResult!10864)

(assert (=> b!1410805 (= res!948032 (or (not (is-Intermediate!10864 lt!621345)) (undefined!11676 lt!621345)))))

(declare-fun e!798373 () Bool)

(assert (=> b!1410805 e!798373))

(declare-fun res!948035 () Bool)

(assert (=> b!1410805 (=> (not res!948035) (not e!798373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96429 (_ BitVec 32)) Bool)

(assert (=> b!1410805 (= res!948035 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47702 0))(
  ( (Unit!47703) )
))
(declare-fun lt!621343 () Unit!47702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47702)

(assert (=> b!1410805 (= lt!621343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96429 (_ BitVec 32)) SeekEntryResult!10864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410805 (= lt!621345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46553 a!2901) j!112) mask!2840) (select (arr!46553 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410806 () Bool)

(declare-fun res!948034 () Bool)

(assert (=> b!1410806 (=> (not res!948034) (not e!798374))))

(declare-datatypes ((List!33072 0))(
  ( (Nil!33069) (Cons!33068 (h!34340 (_ BitVec 64)) (t!47766 List!33072)) )
))
(declare-fun arrayNoDuplicates!0 (array!96429 (_ BitVec 32) List!33072) Bool)

(assert (=> b!1410806 (= res!948034 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33069))))

(declare-fun b!1410807 () Bool)

(declare-fun res!948031 () Bool)

(assert (=> b!1410807 (=> (not res!948031) (not e!798374))))

(assert (=> b!1410807 (= res!948031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410808 () Bool)

(assert (=> b!1410808 (= e!798372 true)))

(declare-fun lt!621344 () SeekEntryResult!10864)

(assert (=> b!1410808 (= lt!621344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46553 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46553 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96430 (store (arr!46553 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47103 a!2901)) mask!2840))))

(declare-fun b!1410809 () Bool)

(declare-fun res!948030 () Bool)

(assert (=> b!1410809 (=> (not res!948030) (not e!798374))))

(assert (=> b!1410809 (= res!948030 (validKeyInArray!0 (select (arr!46553 a!2901) i!1037)))))

(declare-fun res!948033 () Bool)

(assert (=> start!121428 (=> (not res!948033) (not e!798374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121428 (= res!948033 (validMask!0 mask!2840))))

(assert (=> start!121428 e!798374))

(assert (=> start!121428 true))

(declare-fun array_inv!35581 (array!96429) Bool)

(assert (=> start!121428 (array_inv!35581 a!2901)))

(declare-fun b!1410810 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96429 (_ BitVec 32)) SeekEntryResult!10864)

(assert (=> b!1410810 (= e!798373 (= (seekEntryOrOpen!0 (select (arr!46553 a!2901) j!112) a!2901 mask!2840) (Found!10864 j!112)))))

(assert (= (and start!121428 res!948033) b!1410804))

(assert (= (and b!1410804 res!948036) b!1410809))

(assert (= (and b!1410809 res!948030) b!1410803))

(assert (= (and b!1410803 res!948037) b!1410807))

(assert (= (and b!1410807 res!948031) b!1410806))

(assert (= (and b!1410806 res!948034) b!1410805))

(assert (= (and b!1410805 res!948035) b!1410810))

(assert (= (and b!1410805 (not res!948032)) b!1410808))

(declare-fun m!1300467 () Bool)

(assert (=> start!121428 m!1300467))

(declare-fun m!1300469 () Bool)

(assert (=> start!121428 m!1300469))

(declare-fun m!1300471 () Bool)

(assert (=> b!1410805 m!1300471))

(declare-fun m!1300473 () Bool)

(assert (=> b!1410805 m!1300473))

(assert (=> b!1410805 m!1300471))

(declare-fun m!1300475 () Bool)

(assert (=> b!1410805 m!1300475))

(assert (=> b!1410805 m!1300473))

(assert (=> b!1410805 m!1300471))

(declare-fun m!1300477 () Bool)

(assert (=> b!1410805 m!1300477))

(declare-fun m!1300479 () Bool)

(assert (=> b!1410805 m!1300479))

(assert (=> b!1410810 m!1300471))

(assert (=> b!1410810 m!1300471))

(declare-fun m!1300481 () Bool)

(assert (=> b!1410810 m!1300481))

(declare-fun m!1300483 () Bool)

(assert (=> b!1410807 m!1300483))

(declare-fun m!1300485 () Bool)

(assert (=> b!1410808 m!1300485))

(declare-fun m!1300487 () Bool)

(assert (=> b!1410808 m!1300487))

(assert (=> b!1410808 m!1300487))

(declare-fun m!1300489 () Bool)

(assert (=> b!1410808 m!1300489))

(assert (=> b!1410808 m!1300489))

(assert (=> b!1410808 m!1300487))

(declare-fun m!1300491 () Bool)

(assert (=> b!1410808 m!1300491))

(assert (=> b!1410803 m!1300471))

(assert (=> b!1410803 m!1300471))

(declare-fun m!1300493 () Bool)

(assert (=> b!1410803 m!1300493))

(declare-fun m!1300495 () Bool)

(assert (=> b!1410806 m!1300495))

(declare-fun m!1300497 () Bool)

(assert (=> b!1410809 m!1300497))

(assert (=> b!1410809 m!1300497))

(declare-fun m!1300499 () Bool)

(assert (=> b!1410809 m!1300499))

(push 1)

(assert (not b!1410809))

(assert (not b!1410810))

(assert (not start!121428))

(assert (not b!1410803))

(assert (not b!1410806))

(assert (not b!1410807))

(assert (not b!1410808))

(assert (not b!1410805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

