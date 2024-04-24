; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121038 () Bool)

(assert start!121038)

(declare-fun b!1407285 () Bool)

(declare-fun e!796634 () Bool)

(assert (=> b!1407285 (= e!796634 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96267 0))(
  ( (array!96268 (arr!46479 (Array (_ BitVec 32) (_ BitVec 64))) (size!47030 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96267)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10693 0))(
  ( (MissingZero!10693 (index!45149 (_ BitVec 32))) (Found!10693 (index!45150 (_ BitVec 32))) (Intermediate!10693 (undefined!11505 Bool) (index!45151 (_ BitVec 32)) (x!126903 (_ BitVec 32))) (Undefined!10693) (MissingVacant!10693 (index!45152 (_ BitVec 32))) )
))
(declare-fun lt!619672 () SeekEntryResult!10693)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96267 (_ BitVec 32)) SeekEntryResult!10693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407285 (= lt!619672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46479 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46479 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96268 (store (arr!46479 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47030 a!2901)) mask!2840))))

(declare-fun b!1407286 () Bool)

(declare-fun res!944818 () Bool)

(declare-fun e!796632 () Bool)

(assert (=> b!1407286 (=> (not res!944818) (not e!796632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407286 (= res!944818 (validKeyInArray!0 (select (arr!46479 a!2901) j!112)))))

(declare-fun b!1407287 () Bool)

(declare-fun e!796631 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96267 (_ BitVec 32)) SeekEntryResult!10693)

(assert (=> b!1407287 (= e!796631 (= (seekEntryOrOpen!0 (select (arr!46479 a!2901) j!112) a!2901 mask!2840) (Found!10693 j!112)))))

(declare-fun b!1407288 () Bool)

(declare-fun res!944823 () Bool)

(assert (=> b!1407288 (=> (not res!944823) (not e!796632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96267 (_ BitVec 32)) Bool)

(assert (=> b!1407288 (= res!944823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407289 () Bool)

(declare-fun res!944822 () Bool)

(assert (=> b!1407289 (=> (not res!944822) (not e!796632))))

(assert (=> b!1407289 (= res!944822 (validKeyInArray!0 (select (arr!46479 a!2901) i!1037)))))

(declare-fun res!944824 () Bool)

(assert (=> start!121038 (=> (not res!944824) (not e!796632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121038 (= res!944824 (validMask!0 mask!2840))))

(assert (=> start!121038 e!796632))

(assert (=> start!121038 true))

(declare-fun array_inv!35760 (array!96267) Bool)

(assert (=> start!121038 (array_inv!35760 a!2901)))

(declare-fun b!1407284 () Bool)

(assert (=> b!1407284 (= e!796632 (not e!796634))))

(declare-fun res!944820 () Bool)

(assert (=> b!1407284 (=> res!944820 e!796634)))

(declare-fun lt!619671 () SeekEntryResult!10693)

(assert (=> b!1407284 (= res!944820 (or (not (is-Intermediate!10693 lt!619671)) (undefined!11505 lt!619671)))))

(assert (=> b!1407284 e!796631))

(declare-fun res!944819 () Bool)

(assert (=> b!1407284 (=> (not res!944819) (not e!796631))))

(assert (=> b!1407284 (= res!944819 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47387 0))(
  ( (Unit!47388) )
))
(declare-fun lt!619673 () Unit!47387)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47387)

(assert (=> b!1407284 (= lt!619673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407284 (= lt!619671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46479 a!2901) j!112) mask!2840) (select (arr!46479 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407290 () Bool)

(declare-fun res!944817 () Bool)

(assert (=> b!1407290 (=> (not res!944817) (not e!796632))))

(assert (=> b!1407290 (= res!944817 (and (= (size!47030 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47030 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47030 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407291 () Bool)

(declare-fun res!944821 () Bool)

(assert (=> b!1407291 (=> (not res!944821) (not e!796632))))

(declare-datatypes ((List!32985 0))(
  ( (Nil!32982) (Cons!32981 (h!34243 (_ BitVec 64)) (t!47671 List!32985)) )
))
(declare-fun arrayNoDuplicates!0 (array!96267 (_ BitVec 32) List!32985) Bool)

(assert (=> b!1407291 (= res!944821 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32982))))

(assert (= (and start!121038 res!944824) b!1407290))

(assert (= (and b!1407290 res!944817) b!1407289))

(assert (= (and b!1407289 res!944822) b!1407286))

(assert (= (and b!1407286 res!944818) b!1407288))

(assert (= (and b!1407288 res!944823) b!1407291))

(assert (= (and b!1407291 res!944821) b!1407284))

(assert (= (and b!1407284 res!944819) b!1407287))

(assert (= (and b!1407284 (not res!944820)) b!1407285))

(declare-fun m!1296537 () Bool)

(assert (=> b!1407291 m!1296537))

(declare-fun m!1296539 () Bool)

(assert (=> b!1407285 m!1296539))

(declare-fun m!1296541 () Bool)

(assert (=> b!1407285 m!1296541))

(assert (=> b!1407285 m!1296541))

(declare-fun m!1296543 () Bool)

(assert (=> b!1407285 m!1296543))

(assert (=> b!1407285 m!1296543))

(assert (=> b!1407285 m!1296541))

(declare-fun m!1296545 () Bool)

(assert (=> b!1407285 m!1296545))

(declare-fun m!1296547 () Bool)

(assert (=> b!1407284 m!1296547))

(declare-fun m!1296549 () Bool)

(assert (=> b!1407284 m!1296549))

(assert (=> b!1407284 m!1296547))

(declare-fun m!1296551 () Bool)

(assert (=> b!1407284 m!1296551))

(assert (=> b!1407284 m!1296549))

(assert (=> b!1407284 m!1296547))

(declare-fun m!1296553 () Bool)

(assert (=> b!1407284 m!1296553))

(declare-fun m!1296555 () Bool)

(assert (=> b!1407284 m!1296555))

(declare-fun m!1296557 () Bool)

(assert (=> start!121038 m!1296557))

(declare-fun m!1296559 () Bool)

(assert (=> start!121038 m!1296559))

(assert (=> b!1407287 m!1296547))

(assert (=> b!1407287 m!1296547))

(declare-fun m!1296561 () Bool)

(assert (=> b!1407287 m!1296561))

(assert (=> b!1407286 m!1296547))

(assert (=> b!1407286 m!1296547))

(declare-fun m!1296563 () Bool)

(assert (=> b!1407286 m!1296563))

(declare-fun m!1296565 () Bool)

(assert (=> b!1407289 m!1296565))

(assert (=> b!1407289 m!1296565))

(declare-fun m!1296567 () Bool)

(assert (=> b!1407289 m!1296567))

(declare-fun m!1296569 () Bool)

(assert (=> b!1407288 m!1296569))

(push 1)

(assert (not b!1407291))

(assert (not b!1407284))

(assert (not b!1407289))

(assert (not b!1407285))

(assert (not start!121038))

(assert (not b!1407286))

(assert (not b!1407288))

(assert (not b!1407287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

