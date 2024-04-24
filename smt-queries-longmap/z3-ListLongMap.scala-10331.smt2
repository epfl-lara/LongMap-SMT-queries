; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121658 () Bool)

(assert start!121658)

(declare-fun b!1412530 () Bool)

(declare-fun res!949081 () Bool)

(declare-fun e!799436 () Bool)

(assert (=> b!1412530 (=> (not res!949081) (not e!799436))))

(declare-datatypes ((array!96581 0))(
  ( (array!96582 (arr!46627 (Array (_ BitVec 32) (_ BitVec 64))) (size!47178 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96581)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412530 (= res!949081 (validKeyInArray!0 (select (arr!46627 a!2901) j!112)))))

(declare-fun b!1412531 () Bool)

(declare-fun res!949079 () Bool)

(assert (=> b!1412531 (=> (not res!949079) (not e!799436))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412531 (= res!949079 (and (= (size!47178 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47178 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47178 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!799439 () Bool)

(declare-fun b!1412532 () Bool)

(declare-datatypes ((SeekEntryResult!10841 0))(
  ( (MissingZero!10841 (index!45741 (_ BitVec 32))) (Found!10841 (index!45742 (_ BitVec 32))) (Intermediate!10841 (undefined!11653 Bool) (index!45743 (_ BitVec 32)) (x!127487 (_ BitVec 32))) (Undefined!10841) (MissingVacant!10841 (index!45744 (_ BitVec 32))) )
))
(declare-fun lt!622083 () SeekEntryResult!10841)

(assert (=> b!1412532 (= e!799439 (= (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45743 lt!622083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!622085 () SeekEntryResult!10841)

(assert (=> b!1412532 (and (not (undefined!11653 lt!622083)) (= (index!45743 lt!622083) i!1037) (bvslt (x!127487 lt!622083) (x!127487 lt!622085)))))

(declare-datatypes ((Unit!47683 0))(
  ( (Unit!47684) )
))
(declare-fun lt!622080 () Unit!47683)

(declare-fun lt!622081 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47683)

(assert (=> b!1412532 (= lt!622080 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622081 (x!127487 lt!622085) (index!45743 lt!622085) (x!127487 lt!622083) (index!45743 lt!622083) (undefined!11653 lt!622083) mask!2840))))

(declare-fun b!1412533 () Bool)

(declare-fun res!949076 () Bool)

(assert (=> b!1412533 (=> (not res!949076) (not e!799436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96581 (_ BitVec 32)) Bool)

(assert (=> b!1412533 (= res!949076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412534 () Bool)

(declare-fun res!949078 () Bool)

(assert (=> b!1412534 (=> (not res!949078) (not e!799436))))

(declare-datatypes ((List!33133 0))(
  ( (Nil!33130) (Cons!33129 (h!34409 (_ BitVec 64)) (t!47819 List!33133)) )
))
(declare-fun arrayNoDuplicates!0 (array!96581 (_ BitVec 32) List!33133) Bool)

(assert (=> b!1412534 (= res!949078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33130))))

(declare-fun b!1412535 () Bool)

(declare-fun e!799435 () Bool)

(assert (=> b!1412535 (= e!799436 (not e!799435))))

(declare-fun res!949080 () Bool)

(assert (=> b!1412535 (=> res!949080 e!799435)))

(get-info :version)

(assert (=> b!1412535 (= res!949080 (or (not ((_ is Intermediate!10841) lt!622085)) (undefined!11653 lt!622085)))))

(declare-fun e!799438 () Bool)

(assert (=> b!1412535 e!799438))

(declare-fun res!949077 () Bool)

(assert (=> b!1412535 (=> (not res!949077) (not e!799438))))

(assert (=> b!1412535 (= res!949077 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622082 () Unit!47683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47683)

(assert (=> b!1412535 (= lt!622082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96581 (_ BitVec 32)) SeekEntryResult!10841)

(assert (=> b!1412535 (= lt!622085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622081 (select (arr!46627 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412535 (= lt!622081 (toIndex!0 (select (arr!46627 a!2901) j!112) mask!2840))))

(declare-fun b!1412536 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96581 (_ BitVec 32)) SeekEntryResult!10841)

(assert (=> b!1412536 (= e!799438 (= (seekEntryOrOpen!0 (select (arr!46627 a!2901) j!112) a!2901 mask!2840) (Found!10841 j!112)))))

(declare-fun res!949073 () Bool)

(assert (=> start!121658 (=> (not res!949073) (not e!799436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121658 (= res!949073 (validMask!0 mask!2840))))

(assert (=> start!121658 e!799436))

(assert (=> start!121658 true))

(declare-fun array_inv!35908 (array!96581) Bool)

(assert (=> start!121658 (array_inv!35908 a!2901)))

(declare-fun b!1412537 () Bool)

(declare-fun res!949075 () Bool)

(assert (=> b!1412537 (=> (not res!949075) (not e!799436))))

(assert (=> b!1412537 (= res!949075 (validKeyInArray!0 (select (arr!46627 a!2901) i!1037)))))

(declare-fun b!1412538 () Bool)

(assert (=> b!1412538 (= e!799435 e!799439)))

(declare-fun res!949074 () Bool)

(assert (=> b!1412538 (=> res!949074 e!799439)))

(assert (=> b!1412538 (= res!949074 (or (= lt!622085 lt!622083) (not ((_ is Intermediate!10841) lt!622083))))))

(declare-fun lt!622084 () (_ BitVec 64))

(assert (=> b!1412538 (= lt!622083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622084 mask!2840) lt!622084 (array!96582 (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47178 a!2901)) mask!2840))))

(assert (=> b!1412538 (= lt!622084 (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!121658 res!949073) b!1412531))

(assert (= (and b!1412531 res!949079) b!1412537))

(assert (= (and b!1412537 res!949075) b!1412530))

(assert (= (and b!1412530 res!949081) b!1412533))

(assert (= (and b!1412533 res!949076) b!1412534))

(assert (= (and b!1412534 res!949078) b!1412535))

(assert (= (and b!1412535 res!949077) b!1412536))

(assert (= (and b!1412535 (not res!949080)) b!1412538))

(assert (= (and b!1412538 (not res!949074)) b!1412532))

(declare-fun m!1302589 () Bool)

(assert (=> b!1412530 m!1302589))

(assert (=> b!1412530 m!1302589))

(declare-fun m!1302591 () Bool)

(assert (=> b!1412530 m!1302591))

(declare-fun m!1302593 () Bool)

(assert (=> start!121658 m!1302593))

(declare-fun m!1302595 () Bool)

(assert (=> start!121658 m!1302595))

(declare-fun m!1302597 () Bool)

(assert (=> b!1412537 m!1302597))

(assert (=> b!1412537 m!1302597))

(declare-fun m!1302599 () Bool)

(assert (=> b!1412537 m!1302599))

(declare-fun m!1302601 () Bool)

(assert (=> b!1412532 m!1302601))

(declare-fun m!1302603 () Bool)

(assert (=> b!1412532 m!1302603))

(declare-fun m!1302605 () Bool)

(assert (=> b!1412532 m!1302605))

(assert (=> b!1412536 m!1302589))

(assert (=> b!1412536 m!1302589))

(declare-fun m!1302607 () Bool)

(assert (=> b!1412536 m!1302607))

(declare-fun m!1302609 () Bool)

(assert (=> b!1412534 m!1302609))

(assert (=> b!1412535 m!1302589))

(declare-fun m!1302611 () Bool)

(assert (=> b!1412535 m!1302611))

(assert (=> b!1412535 m!1302589))

(declare-fun m!1302613 () Bool)

(assert (=> b!1412535 m!1302613))

(declare-fun m!1302615 () Bool)

(assert (=> b!1412535 m!1302615))

(assert (=> b!1412535 m!1302589))

(declare-fun m!1302617 () Bool)

(assert (=> b!1412535 m!1302617))

(declare-fun m!1302619 () Bool)

(assert (=> b!1412538 m!1302619))

(assert (=> b!1412538 m!1302601))

(assert (=> b!1412538 m!1302619))

(declare-fun m!1302621 () Bool)

(assert (=> b!1412538 m!1302621))

(declare-fun m!1302623 () Bool)

(assert (=> b!1412538 m!1302623))

(declare-fun m!1302625 () Bool)

(assert (=> b!1412533 m!1302625))

(check-sat (not b!1412530) (not start!121658) (not b!1412533) (not b!1412538) (not b!1412536) (not b!1412535) (not b!1412534) (not b!1412537) (not b!1412532))
(check-sat)
