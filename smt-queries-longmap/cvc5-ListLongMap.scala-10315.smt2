; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121212 () Bool)

(assert start!121212)

(declare-fun b!1409357 () Bool)

(declare-fun e!797557 () Bool)

(assert (=> b!1409357 (= e!797557 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96319 0))(
  ( (array!96320 (arr!46503 (Array (_ BitVec 32) (_ BitVec 64))) (size!47055 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96319)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10840 0))(
  ( (MissingZero!10840 (index!45737 (_ BitVec 32))) (Found!10840 (index!45738 (_ BitVec 32))) (Intermediate!10840 (undefined!11652 Bool) (index!45739 (_ BitVec 32)) (x!127318 (_ BitVec 32))) (Undefined!10840) (MissingVacant!10840 (index!45740 (_ BitVec 32))) )
))
(declare-fun lt!620532 () SeekEntryResult!10840)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96319 (_ BitVec 32)) SeekEntryResult!10840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409357 (= lt!620532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96320 (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)) mask!2840))))

(declare-fun b!1409358 () Bool)

(declare-fun res!947130 () Bool)

(declare-fun e!797556 () Bool)

(assert (=> b!1409358 (=> (not res!947130) (not e!797556))))

(declare-datatypes ((List!33100 0))(
  ( (Nil!33097) (Cons!33096 (h!34359 (_ BitVec 64)) (t!47786 List!33100)) )
))
(declare-fun arrayNoDuplicates!0 (array!96319 (_ BitVec 32) List!33100) Bool)

(assert (=> b!1409358 (= res!947130 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33097))))

(declare-fun b!1409359 () Bool)

(declare-fun res!947136 () Bool)

(assert (=> b!1409359 (=> (not res!947136) (not e!797556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409359 (= res!947136 (validKeyInArray!0 (select (arr!46503 a!2901) i!1037)))))

(declare-fun b!1409360 () Bool)

(declare-fun res!947134 () Bool)

(assert (=> b!1409360 (=> (not res!947134) (not e!797556))))

(assert (=> b!1409360 (= res!947134 (and (= (size!47055 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47055 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47055 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409361 () Bool)

(assert (=> b!1409361 (= e!797556 (not e!797557))))

(declare-fun res!947133 () Bool)

(assert (=> b!1409361 (=> res!947133 e!797557)))

(declare-fun lt!620533 () SeekEntryResult!10840)

(assert (=> b!1409361 (= res!947133 (or (not (is-Intermediate!10840 lt!620533)) (undefined!11652 lt!620533)))))

(declare-fun e!797555 () Bool)

(assert (=> b!1409361 e!797555))

(declare-fun res!947131 () Bool)

(assert (=> b!1409361 (=> (not res!947131) (not e!797555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96319 (_ BitVec 32)) Bool)

(assert (=> b!1409361 (= res!947131 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47497 0))(
  ( (Unit!47498) )
))
(declare-fun lt!620534 () Unit!47497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47497)

(assert (=> b!1409361 (= lt!620534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409361 (= lt!620533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46503 a!2901) j!112) mask!2840) (select (arr!46503 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409362 () Bool)

(declare-fun res!947135 () Bool)

(assert (=> b!1409362 (=> (not res!947135) (not e!797556))))

(assert (=> b!1409362 (= res!947135 (validKeyInArray!0 (select (arr!46503 a!2901) j!112)))))

(declare-fun res!947132 () Bool)

(assert (=> start!121212 (=> (not res!947132) (not e!797556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121212 (= res!947132 (validMask!0 mask!2840))))

(assert (=> start!121212 e!797556))

(assert (=> start!121212 true))

(declare-fun array_inv!35736 (array!96319) Bool)

(assert (=> start!121212 (array_inv!35736 a!2901)))

(declare-fun b!1409363 () Bool)

(declare-fun res!947137 () Bool)

(assert (=> b!1409363 (=> (not res!947137) (not e!797556))))

(assert (=> b!1409363 (= res!947137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409364 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96319 (_ BitVec 32)) SeekEntryResult!10840)

(assert (=> b!1409364 (= e!797555 (= (seekEntryOrOpen!0 (select (arr!46503 a!2901) j!112) a!2901 mask!2840) (Found!10840 j!112)))))

(assert (= (and start!121212 res!947132) b!1409360))

(assert (= (and b!1409360 res!947134) b!1409359))

(assert (= (and b!1409359 res!947136) b!1409362))

(assert (= (and b!1409362 res!947135) b!1409363))

(assert (= (and b!1409363 res!947137) b!1409358))

(assert (= (and b!1409358 res!947130) b!1409361))

(assert (= (and b!1409361 res!947131) b!1409364))

(assert (= (and b!1409361 (not res!947133)) b!1409357))

(declare-fun m!1298619 () Bool)

(assert (=> b!1409357 m!1298619))

(declare-fun m!1298621 () Bool)

(assert (=> b!1409357 m!1298621))

(assert (=> b!1409357 m!1298621))

(declare-fun m!1298623 () Bool)

(assert (=> b!1409357 m!1298623))

(assert (=> b!1409357 m!1298623))

(assert (=> b!1409357 m!1298621))

(declare-fun m!1298625 () Bool)

(assert (=> b!1409357 m!1298625))

(declare-fun m!1298627 () Bool)

(assert (=> b!1409362 m!1298627))

(assert (=> b!1409362 m!1298627))

(declare-fun m!1298629 () Bool)

(assert (=> b!1409362 m!1298629))

(declare-fun m!1298631 () Bool)

(assert (=> start!121212 m!1298631))

(declare-fun m!1298633 () Bool)

(assert (=> start!121212 m!1298633))

(declare-fun m!1298635 () Bool)

(assert (=> b!1409359 m!1298635))

(assert (=> b!1409359 m!1298635))

(declare-fun m!1298637 () Bool)

(assert (=> b!1409359 m!1298637))

(assert (=> b!1409361 m!1298627))

(declare-fun m!1298639 () Bool)

(assert (=> b!1409361 m!1298639))

(assert (=> b!1409361 m!1298627))

(declare-fun m!1298641 () Bool)

(assert (=> b!1409361 m!1298641))

(assert (=> b!1409361 m!1298639))

(assert (=> b!1409361 m!1298627))

(declare-fun m!1298643 () Bool)

(assert (=> b!1409361 m!1298643))

(declare-fun m!1298645 () Bool)

(assert (=> b!1409361 m!1298645))

(declare-fun m!1298647 () Bool)

(assert (=> b!1409363 m!1298647))

(assert (=> b!1409364 m!1298627))

(assert (=> b!1409364 m!1298627))

(declare-fun m!1298649 () Bool)

(assert (=> b!1409364 m!1298649))

(declare-fun m!1298651 () Bool)

(assert (=> b!1409358 m!1298651))

(push 1)

(assert (not b!1409363))

(assert (not start!121212))

(assert (not b!1409359))

(assert (not b!1409361))

(assert (not b!1409357))

(assert (not b!1409358))

(assert (not b!1409362))

(assert (not b!1409364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

