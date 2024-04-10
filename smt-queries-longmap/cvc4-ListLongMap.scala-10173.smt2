; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119968 () Bool)

(assert start!119968)

(declare-fun b!1396528 () Bool)

(declare-fun res!935441 () Bool)

(declare-fun e!790626 () Bool)

(assert (=> b!1396528 (=> (not res!935441) (not e!790626))))

(declare-datatypes ((array!95497 0))(
  ( (array!95498 (arr!46102 (Array (_ BitVec 32) (_ BitVec 64))) (size!46652 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95497)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396528 (= res!935441 (validKeyInArray!0 (select (arr!46102 a!2901) i!1037)))))

(declare-fun b!1396529 () Bool)

(declare-fun e!790624 () Bool)

(assert (=> b!1396529 (= e!790624 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613500 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10419 0))(
  ( (MissingZero!10419 (index!44047 (_ BitVec 32))) (Found!10419 (index!44048 (_ BitVec 32))) (Intermediate!10419 (undefined!11231 Bool) (index!44049 (_ BitVec 32)) (x!125713 (_ BitVec 32))) (Undefined!10419) (MissingVacant!10419 (index!44050 (_ BitVec 32))) )
))
(declare-fun lt!613494 () SeekEntryResult!10419)

(declare-fun lt!613495 () array!95497)

(declare-fun lt!613496 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95497 (_ BitVec 32)) SeekEntryResult!10419)

(assert (=> b!1396529 (= lt!613494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613496 lt!613500 lt!613495 mask!2840))))

(declare-fun b!1396530 () Bool)

(declare-fun res!935449 () Bool)

(assert (=> b!1396530 (=> (not res!935449) (not e!790626))))

(declare-datatypes ((List!32621 0))(
  ( (Nil!32618) (Cons!32617 (h!33859 (_ BitVec 64)) (t!47315 List!32621)) )
))
(declare-fun arrayNoDuplicates!0 (array!95497 (_ BitVec 32) List!32621) Bool)

(assert (=> b!1396530 (= res!935449 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32618))))

(declare-fun b!1396531 () Bool)

(declare-fun res!935443 () Bool)

(assert (=> b!1396531 (=> (not res!935443) (not e!790626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95497 (_ BitVec 32)) Bool)

(assert (=> b!1396531 (= res!935443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396532 () Bool)

(declare-fun e!790627 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95497 (_ BitVec 32)) SeekEntryResult!10419)

(assert (=> b!1396532 (= e!790627 (= (seekEntryOrOpen!0 (select (arr!46102 a!2901) j!112) a!2901 mask!2840) (Found!10419 j!112)))))

(declare-fun res!935444 () Bool)

(assert (=> start!119968 (=> (not res!935444) (not e!790626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119968 (= res!935444 (validMask!0 mask!2840))))

(assert (=> start!119968 e!790626))

(assert (=> start!119968 true))

(declare-fun array_inv!35130 (array!95497) Bool)

(assert (=> start!119968 (array_inv!35130 a!2901)))

(declare-fun b!1396533 () Bool)

(declare-fun res!935448 () Bool)

(assert (=> b!1396533 (=> (not res!935448) (not e!790626))))

(assert (=> b!1396533 (= res!935448 (validKeyInArray!0 (select (arr!46102 a!2901) j!112)))))

(declare-fun b!1396534 () Bool)

(declare-fun res!935445 () Bool)

(assert (=> b!1396534 (=> (not res!935445) (not e!790626))))

(assert (=> b!1396534 (= res!935445 (and (= (size!46652 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46652 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46652 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396535 () Bool)

(declare-fun e!790628 () Bool)

(assert (=> b!1396535 (= e!790628 e!790624)))

(declare-fun res!935447 () Bool)

(assert (=> b!1396535 (=> res!935447 e!790624)))

(declare-fun lt!613498 () SeekEntryResult!10419)

(declare-fun lt!613497 () SeekEntryResult!10419)

(assert (=> b!1396535 (= res!935447 (or (= lt!613497 lt!613498) (not (is-Intermediate!10419 lt!613498)) (bvslt (x!125713 lt!613497) #b00000000000000000000000000000000) (bvsgt (x!125713 lt!613497) #b01111111111111111111111111111110) (bvslt lt!613496 #b00000000000000000000000000000000) (bvsge lt!613496 (size!46652 a!2901)) (bvslt (index!44049 lt!613497) #b00000000000000000000000000000000) (bvsge (index!44049 lt!613497) (size!46652 a!2901)) (not (= lt!613497 (Intermediate!10419 false (index!44049 lt!613497) (x!125713 lt!613497)))) (not (= lt!613498 (Intermediate!10419 (undefined!11231 lt!613498) (index!44049 lt!613498) (x!125713 lt!613498))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396535 (= lt!613498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613500 mask!2840) lt!613500 lt!613495 mask!2840))))

(assert (=> b!1396535 (= lt!613500 (select (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396535 (= lt!613495 (array!95498 (store (arr!46102 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46652 a!2901)))))

(declare-fun b!1396536 () Bool)

(assert (=> b!1396536 (= e!790626 (not e!790628))))

(declare-fun res!935442 () Bool)

(assert (=> b!1396536 (=> res!935442 e!790628)))

(assert (=> b!1396536 (= res!935442 (or (not (is-Intermediate!10419 lt!613497)) (undefined!11231 lt!613497)))))

(assert (=> b!1396536 e!790627))

(declare-fun res!935446 () Bool)

(assert (=> b!1396536 (=> (not res!935446) (not e!790627))))

(assert (=> b!1396536 (= res!935446 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46842 0))(
  ( (Unit!46843) )
))
(declare-fun lt!613499 () Unit!46842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46842)

(assert (=> b!1396536 (= lt!613499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396536 (= lt!613497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613496 (select (arr!46102 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396536 (= lt!613496 (toIndex!0 (select (arr!46102 a!2901) j!112) mask!2840))))

(assert (= (and start!119968 res!935444) b!1396534))

(assert (= (and b!1396534 res!935445) b!1396528))

(assert (= (and b!1396528 res!935441) b!1396533))

(assert (= (and b!1396533 res!935448) b!1396531))

(assert (= (and b!1396531 res!935443) b!1396530))

(assert (= (and b!1396530 res!935449) b!1396536))

(assert (= (and b!1396536 res!935446) b!1396532))

(assert (= (and b!1396536 (not res!935442)) b!1396535))

(assert (= (and b!1396535 (not res!935447)) b!1396529))

(declare-fun m!1282995 () Bool)

(assert (=> b!1396530 m!1282995))

(declare-fun m!1282997 () Bool)

(assert (=> b!1396532 m!1282997))

(assert (=> b!1396532 m!1282997))

(declare-fun m!1282999 () Bool)

(assert (=> b!1396532 m!1282999))

(declare-fun m!1283001 () Bool)

(assert (=> b!1396528 m!1283001))

(assert (=> b!1396528 m!1283001))

(declare-fun m!1283003 () Bool)

(assert (=> b!1396528 m!1283003))

(declare-fun m!1283005 () Bool)

(assert (=> b!1396531 m!1283005))

(assert (=> b!1396533 m!1282997))

(assert (=> b!1396533 m!1282997))

(declare-fun m!1283007 () Bool)

(assert (=> b!1396533 m!1283007))

(declare-fun m!1283009 () Bool)

(assert (=> start!119968 m!1283009))

(declare-fun m!1283011 () Bool)

(assert (=> start!119968 m!1283011))

(declare-fun m!1283013 () Bool)

(assert (=> b!1396535 m!1283013))

(assert (=> b!1396535 m!1283013))

(declare-fun m!1283015 () Bool)

(assert (=> b!1396535 m!1283015))

(declare-fun m!1283017 () Bool)

(assert (=> b!1396535 m!1283017))

(declare-fun m!1283019 () Bool)

(assert (=> b!1396535 m!1283019))

(assert (=> b!1396536 m!1282997))

(declare-fun m!1283021 () Bool)

(assert (=> b!1396536 m!1283021))

(assert (=> b!1396536 m!1282997))

(declare-fun m!1283023 () Bool)

(assert (=> b!1396536 m!1283023))

(assert (=> b!1396536 m!1282997))

(declare-fun m!1283025 () Bool)

(assert (=> b!1396536 m!1283025))

(declare-fun m!1283027 () Bool)

(assert (=> b!1396536 m!1283027))

(declare-fun m!1283029 () Bool)

(assert (=> b!1396529 m!1283029))

(push 1)

