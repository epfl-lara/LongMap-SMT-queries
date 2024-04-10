; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121592 () Bool)

(assert start!121592)

(declare-fun b!1412496 () Bool)

(declare-fun e!799339 () Bool)

(declare-fun e!799335 () Bool)

(assert (=> b!1412496 (= e!799339 (not e!799335))))

(declare-fun res!949491 () Bool)

(assert (=> b!1412496 (=> res!949491 e!799335)))

(declare-datatypes ((SeekEntryResult!10913 0))(
  ( (MissingZero!10913 (index!46032 (_ BitVec 32))) (Found!10913 (index!46033 (_ BitVec 32))) (Intermediate!10913 (undefined!11725 Bool) (index!46034 (_ BitVec 32)) (x!127624 (_ BitVec 32))) (Undefined!10913) (MissingVacant!10913 (index!46035 (_ BitVec 32))) )
))
(declare-fun lt!622377 () SeekEntryResult!10913)

(get-info :version)

(assert (=> b!1412496 (= res!949491 (or (not ((_ is Intermediate!10913) lt!622377)) (undefined!11725 lt!622377)))))

(declare-fun e!799340 () Bool)

(assert (=> b!1412496 e!799340))

(declare-fun res!949490 () Bool)

(assert (=> b!1412496 (=> (not res!949490) (not e!799340))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96530 0))(
  ( (array!96531 (arr!46602 (Array (_ BitVec 32) (_ BitVec 64))) (size!47152 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96530)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96530 (_ BitVec 32)) Bool)

(assert (=> b!1412496 (= res!949490 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47800 0))(
  ( (Unit!47801) )
))
(declare-fun lt!622379 () Unit!47800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47800)

(assert (=> b!1412496 (= lt!622379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622380 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96530 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1412496 (= lt!622377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622380 (select (arr!46602 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412496 (= lt!622380 (toIndex!0 (select (arr!46602 a!2901) j!112) mask!2840))))

(declare-fun b!1412497 () Bool)

(declare-fun res!949489 () Bool)

(assert (=> b!1412497 (=> (not res!949489) (not e!799339))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412497 (= res!949489 (and (= (size!47152 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47152 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47152 a!2901)) (not (= i!1037 j!112))))))

(declare-fun lt!622375 () array!96530)

(declare-fun lt!622376 () SeekEntryResult!10913)

(declare-fun lt!622374 () (_ BitVec 64))

(declare-fun b!1412498 () Bool)

(declare-fun e!799337 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96530 (_ BitVec 32)) SeekEntryResult!10913)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96530 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1412498 (= e!799337 (= (seekEntryOrOpen!0 lt!622374 lt!622375 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127624 lt!622376) (index!46034 lt!622376) (index!46034 lt!622376) (select (arr!46602 a!2901) j!112) lt!622375 mask!2840)))))

(declare-fun b!1412499 () Bool)

(declare-fun res!949495 () Bool)

(assert (=> b!1412499 (=> (not res!949495) (not e!799339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412499 (= res!949495 (validKeyInArray!0 (select (arr!46602 a!2901) j!112)))))

(declare-fun b!1412500 () Bool)

(declare-fun e!799338 () Bool)

(assert (=> b!1412500 (= e!799335 e!799338)))

(declare-fun res!949494 () Bool)

(assert (=> b!1412500 (=> res!949494 e!799338)))

(assert (=> b!1412500 (= res!949494 (or (= lt!622377 lt!622376) (not ((_ is Intermediate!10913) lt!622376))))))

(assert (=> b!1412500 (= lt!622376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622374 mask!2840) lt!622374 lt!622375 mask!2840))))

(assert (=> b!1412500 (= lt!622374 (select (store (arr!46602 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412500 (= lt!622375 (array!96531 (store (arr!46602 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47152 a!2901)))))

(declare-fun b!1412501 () Bool)

(declare-fun res!949492 () Bool)

(assert (=> b!1412501 (=> (not res!949492) (not e!799339))))

(declare-datatypes ((List!33121 0))(
  ( (Nil!33118) (Cons!33117 (h!34392 (_ BitVec 64)) (t!47815 List!33121)) )
))
(declare-fun arrayNoDuplicates!0 (array!96530 (_ BitVec 32) List!33121) Bool)

(assert (=> b!1412501 (= res!949492 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33118))))

(declare-fun b!1412502 () Bool)

(assert (=> b!1412502 (= e!799338 true)))

(assert (=> b!1412502 e!799337))

(declare-fun res!949486 () Bool)

(assert (=> b!1412502 (=> (not res!949486) (not e!799337))))

(assert (=> b!1412502 (= res!949486 (and (not (undefined!11725 lt!622376)) (= (index!46034 lt!622376) i!1037) (bvslt (x!127624 lt!622376) (x!127624 lt!622377)) (= (select (store (arr!46602 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46034 lt!622376)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622378 () Unit!47800)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47800)

(assert (=> b!1412502 (= lt!622378 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622380 (x!127624 lt!622377) (index!46034 lt!622377) (x!127624 lt!622376) (index!46034 lt!622376) (undefined!11725 lt!622376) mask!2840))))

(declare-fun b!1412503 () Bool)

(declare-fun res!949493 () Bool)

(assert (=> b!1412503 (=> (not res!949493) (not e!799339))))

(assert (=> b!1412503 (= res!949493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412504 () Bool)

(declare-fun res!949488 () Bool)

(assert (=> b!1412504 (=> (not res!949488) (not e!799339))))

(assert (=> b!1412504 (= res!949488 (validKeyInArray!0 (select (arr!46602 a!2901) i!1037)))))

(declare-fun b!1412505 () Bool)

(assert (=> b!1412505 (= e!799340 (= (seekEntryOrOpen!0 (select (arr!46602 a!2901) j!112) a!2901 mask!2840) (Found!10913 j!112)))))

(declare-fun res!949487 () Bool)

(assert (=> start!121592 (=> (not res!949487) (not e!799339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121592 (= res!949487 (validMask!0 mask!2840))))

(assert (=> start!121592 e!799339))

(assert (=> start!121592 true))

(declare-fun array_inv!35630 (array!96530) Bool)

(assert (=> start!121592 (array_inv!35630 a!2901)))

(assert (= (and start!121592 res!949487) b!1412497))

(assert (= (and b!1412497 res!949489) b!1412504))

(assert (= (and b!1412504 res!949488) b!1412499))

(assert (= (and b!1412499 res!949495) b!1412503))

(assert (= (and b!1412503 res!949493) b!1412501))

(assert (= (and b!1412501 res!949492) b!1412496))

(assert (= (and b!1412496 res!949490) b!1412505))

(assert (= (and b!1412496 (not res!949491)) b!1412500))

(assert (= (and b!1412500 (not res!949494)) b!1412502))

(assert (= (and b!1412502 res!949486) b!1412498))

(declare-fun m!1302543 () Bool)

(assert (=> b!1412505 m!1302543))

(assert (=> b!1412505 m!1302543))

(declare-fun m!1302545 () Bool)

(assert (=> b!1412505 m!1302545))

(declare-fun m!1302547 () Bool)

(assert (=> b!1412501 m!1302547))

(declare-fun m!1302549 () Bool)

(assert (=> start!121592 m!1302549))

(declare-fun m!1302551 () Bool)

(assert (=> start!121592 m!1302551))

(declare-fun m!1302553 () Bool)

(assert (=> b!1412504 m!1302553))

(assert (=> b!1412504 m!1302553))

(declare-fun m!1302555 () Bool)

(assert (=> b!1412504 m!1302555))

(assert (=> b!1412496 m!1302543))

(declare-fun m!1302557 () Bool)

(assert (=> b!1412496 m!1302557))

(assert (=> b!1412496 m!1302543))

(assert (=> b!1412496 m!1302543))

(declare-fun m!1302559 () Bool)

(assert (=> b!1412496 m!1302559))

(declare-fun m!1302561 () Bool)

(assert (=> b!1412496 m!1302561))

(declare-fun m!1302563 () Bool)

(assert (=> b!1412496 m!1302563))

(declare-fun m!1302565 () Bool)

(assert (=> b!1412503 m!1302565))

(declare-fun m!1302567 () Bool)

(assert (=> b!1412498 m!1302567))

(assert (=> b!1412498 m!1302543))

(assert (=> b!1412498 m!1302543))

(declare-fun m!1302569 () Bool)

(assert (=> b!1412498 m!1302569))

(declare-fun m!1302571 () Bool)

(assert (=> b!1412500 m!1302571))

(assert (=> b!1412500 m!1302571))

(declare-fun m!1302573 () Bool)

(assert (=> b!1412500 m!1302573))

(declare-fun m!1302575 () Bool)

(assert (=> b!1412500 m!1302575))

(declare-fun m!1302577 () Bool)

(assert (=> b!1412500 m!1302577))

(assert (=> b!1412499 m!1302543))

(assert (=> b!1412499 m!1302543))

(declare-fun m!1302579 () Bool)

(assert (=> b!1412499 m!1302579))

(assert (=> b!1412502 m!1302575))

(declare-fun m!1302581 () Bool)

(assert (=> b!1412502 m!1302581))

(declare-fun m!1302583 () Bool)

(assert (=> b!1412502 m!1302583))

(check-sat (not b!1412503) (not b!1412496) (not start!121592) (not b!1412500) (not b!1412499) (not b!1412505) (not b!1412501) (not b!1412498) (not b!1412502) (not b!1412504))
(check-sat)
