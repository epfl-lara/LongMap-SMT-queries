; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121470 () Bool)

(assert start!121470)

(declare-fun b!1411390 () Bool)

(declare-fun res!948619 () Bool)

(declare-fun e!798699 () Bool)

(assert (=> b!1411390 (=> (not res!948619) (not e!798699))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96471 0))(
  ( (array!96472 (arr!46574 (Array (_ BitVec 32) (_ BitVec 64))) (size!47124 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96471)

(assert (=> b!1411390 (= res!948619 (and (= (size!47124 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47124 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47124 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!798701 () Bool)

(declare-fun b!1411391 () Bool)

(declare-datatypes ((SeekEntryResult!10885 0))(
  ( (MissingZero!10885 (index!45917 (_ BitVec 32))) (Found!10885 (index!45918 (_ BitVec 32))) (Intermediate!10885 (undefined!11697 Bool) (index!45919 (_ BitVec 32)) (x!127512 (_ BitVec 32))) (Undefined!10885) (MissingVacant!10885 (index!45920 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96471 (_ BitVec 32)) SeekEntryResult!10885)

(assert (=> b!1411391 (= e!798701 (= (seekEntryOrOpen!0 (select (arr!46574 a!2901) j!112) a!2901 mask!2840) (Found!10885 j!112)))))

(declare-fun res!948622 () Bool)

(assert (=> start!121470 (=> (not res!948622) (not e!798699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121470 (= res!948622 (validMask!0 mask!2840))))

(assert (=> start!121470 e!798699))

(assert (=> start!121470 true))

(declare-fun array_inv!35602 (array!96471) Bool)

(assert (=> start!121470 (array_inv!35602 a!2901)))

(declare-fun lt!621686 () SeekEntryResult!10885)

(declare-fun e!798698 () Bool)

(declare-fun b!1411392 () Bool)

(assert (=> b!1411392 (= e!798698 (= (select (store (arr!46574 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45919 lt!621686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621685 () SeekEntryResult!10885)

(assert (=> b!1411392 (and (not (undefined!11697 lt!621686)) (= (index!45919 lt!621686) i!1037) (bvslt (x!127512 lt!621686) (x!127512 lt!621685)))))

(declare-datatypes ((Unit!47744 0))(
  ( (Unit!47745) )
))
(declare-fun lt!621687 () Unit!47744)

(declare-fun lt!621684 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47744)

(assert (=> b!1411392 (= lt!621687 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621684 (x!127512 lt!621685) (index!45919 lt!621685) (x!127512 lt!621686) (index!45919 lt!621686) (undefined!11697 lt!621686) mask!2840))))

(declare-fun b!1411393 () Bool)

(declare-fun res!948620 () Bool)

(assert (=> b!1411393 (=> (not res!948620) (not e!798699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411393 (= res!948620 (validKeyInArray!0 (select (arr!46574 a!2901) j!112)))))

(declare-fun b!1411394 () Bool)

(declare-fun res!948623 () Bool)

(assert (=> b!1411394 (=> (not res!948623) (not e!798699))))

(declare-datatypes ((List!33093 0))(
  ( (Nil!33090) (Cons!33089 (h!34361 (_ BitVec 64)) (t!47787 List!33093)) )
))
(declare-fun arrayNoDuplicates!0 (array!96471 (_ BitVec 32) List!33093) Bool)

(assert (=> b!1411394 (= res!948623 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33090))))

(declare-fun b!1411395 () Bool)

(declare-fun e!798700 () Bool)

(assert (=> b!1411395 (= e!798699 (not e!798700))))

(declare-fun res!948621 () Bool)

(assert (=> b!1411395 (=> res!948621 e!798700)))

(assert (=> b!1411395 (= res!948621 (or (not (is-Intermediate!10885 lt!621685)) (undefined!11697 lt!621685)))))

(assert (=> b!1411395 e!798701))

(declare-fun res!948618 () Bool)

(assert (=> b!1411395 (=> (not res!948618) (not e!798701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96471 (_ BitVec 32)) Bool)

(assert (=> b!1411395 (= res!948618 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621682 () Unit!47744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47744)

(assert (=> b!1411395 (= lt!621682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96471 (_ BitVec 32)) SeekEntryResult!10885)

(assert (=> b!1411395 (= lt!621685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621684 (select (arr!46574 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411395 (= lt!621684 (toIndex!0 (select (arr!46574 a!2901) j!112) mask!2840))))

(declare-fun b!1411396 () Bool)

(assert (=> b!1411396 (= e!798700 e!798698)))

(declare-fun res!948624 () Bool)

(assert (=> b!1411396 (=> res!948624 e!798698)))

(assert (=> b!1411396 (= res!948624 (or (= lt!621685 lt!621686) (not (is-Intermediate!10885 lt!621686))))))

(declare-fun lt!621683 () (_ BitVec 64))

(assert (=> b!1411396 (= lt!621686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621683 mask!2840) lt!621683 (array!96472 (store (arr!46574 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47124 a!2901)) mask!2840))))

(assert (=> b!1411396 (= lt!621683 (select (store (arr!46574 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411397 () Bool)

(declare-fun res!948625 () Bool)

(assert (=> b!1411397 (=> (not res!948625) (not e!798699))))

(assert (=> b!1411397 (= res!948625 (validKeyInArray!0 (select (arr!46574 a!2901) i!1037)))))

(declare-fun b!1411398 () Bool)

(declare-fun res!948617 () Bool)

(assert (=> b!1411398 (=> (not res!948617) (not e!798699))))

(assert (=> b!1411398 (= res!948617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121470 res!948622) b!1411390))

(assert (= (and b!1411390 res!948619) b!1411397))

(assert (= (and b!1411397 res!948625) b!1411393))

(assert (= (and b!1411393 res!948620) b!1411398))

(assert (= (and b!1411398 res!948617) b!1411394))

(assert (= (and b!1411394 res!948623) b!1411395))

(assert (= (and b!1411395 res!948618) b!1411391))

(assert (= (and b!1411395 (not res!948621)) b!1411396))

(assert (= (and b!1411396 (not res!948624)) b!1411392))

(declare-fun m!1301217 () Bool)

(assert (=> b!1411396 m!1301217))

(declare-fun m!1301219 () Bool)

(assert (=> b!1411396 m!1301219))

(assert (=> b!1411396 m!1301217))

(declare-fun m!1301221 () Bool)

(assert (=> b!1411396 m!1301221))

(declare-fun m!1301223 () Bool)

(assert (=> b!1411396 m!1301223))

(declare-fun m!1301225 () Bool)

(assert (=> start!121470 m!1301225))

(declare-fun m!1301227 () Bool)

(assert (=> start!121470 m!1301227))

(declare-fun m!1301229 () Bool)

(assert (=> b!1411394 m!1301229))

(declare-fun m!1301231 () Bool)

(assert (=> b!1411395 m!1301231))

(declare-fun m!1301233 () Bool)

(assert (=> b!1411395 m!1301233))

(assert (=> b!1411395 m!1301231))

(assert (=> b!1411395 m!1301231))

(declare-fun m!1301235 () Bool)

(assert (=> b!1411395 m!1301235))

(declare-fun m!1301237 () Bool)

(assert (=> b!1411395 m!1301237))

(declare-fun m!1301239 () Bool)

(assert (=> b!1411395 m!1301239))

(assert (=> b!1411393 m!1301231))

(assert (=> b!1411393 m!1301231))

(declare-fun m!1301241 () Bool)

(assert (=> b!1411393 m!1301241))

(assert (=> b!1411392 m!1301219))

(declare-fun m!1301243 () Bool)

(assert (=> b!1411392 m!1301243))

(declare-fun m!1301245 () Bool)

(assert (=> b!1411392 m!1301245))

(assert (=> b!1411391 m!1301231))

(assert (=> b!1411391 m!1301231))

(declare-fun m!1301247 () Bool)

(assert (=> b!1411391 m!1301247))

(declare-fun m!1301249 () Bool)

(assert (=> b!1411398 m!1301249))

(declare-fun m!1301251 () Bool)

(assert (=> b!1411397 m!1301251))

(assert (=> b!1411397 m!1301251))

(declare-fun m!1301253 () Bool)

(assert (=> b!1411397 m!1301253))

(push 1)

