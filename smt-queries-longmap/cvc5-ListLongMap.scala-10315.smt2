; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121404 () Bool)

(assert start!121404)

(declare-fun b!1410578 () Bool)

(declare-fun res!947623 () Bool)

(declare-fun e!798332 () Bool)

(assert (=> b!1410578 (=> (not res!947623) (not e!798332))))

(declare-datatypes ((array!96480 0))(
  ( (array!96481 (arr!46581 (Array (_ BitVec 32) (_ BitVec 64))) (size!47132 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96480)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96480 (_ BitVec 32)) Bool)

(assert (=> b!1410578 (= res!947623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!798333 () Bool)

(declare-fun b!1410579 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10795 0))(
  ( (MissingZero!10795 (index!45557 (_ BitVec 32))) (Found!10795 (index!45558 (_ BitVec 32))) (Intermediate!10795 (undefined!11607 Bool) (index!45559 (_ BitVec 32)) (x!127295 (_ BitVec 32))) (Undefined!10795) (MissingVacant!10795 (index!45560 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96480 (_ BitVec 32)) SeekEntryResult!10795)

(assert (=> b!1410579 (= e!798333 (= (seekEntryOrOpen!0 (select (arr!46581 a!2901) j!112) a!2901 mask!2840) (Found!10795 j!112)))))

(declare-fun res!947616 () Bool)

(assert (=> start!121404 (=> (not res!947616) (not e!798332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121404 (= res!947616 (validMask!0 mask!2840))))

(assert (=> start!121404 e!798332))

(assert (=> start!121404 true))

(declare-fun array_inv!35862 (array!96480) Bool)

(assert (=> start!121404 (array_inv!35862 a!2901)))

(declare-fun b!1410580 () Bool)

(declare-fun res!947621 () Bool)

(assert (=> b!1410580 (=> (not res!947621) (not e!798332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410580 (= res!947621 (validKeyInArray!0 (select (arr!46581 a!2901) j!112)))))

(declare-fun b!1410581 () Bool)

(declare-fun res!947622 () Bool)

(assert (=> b!1410581 (=> (not res!947622) (not e!798332))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410581 (= res!947622 (validKeyInArray!0 (select (arr!46581 a!2901) i!1037)))))

(declare-fun b!1410582 () Bool)

(declare-fun e!798335 () Bool)

(assert (=> b!1410582 (= e!798335 true)))

(declare-fun lt!621122 () SeekEntryResult!10795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96480 (_ BitVec 32)) SeekEntryResult!10795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410582 (= lt!621122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96481 (store (arr!46581 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47132 a!2901)) mask!2840))))

(declare-fun b!1410583 () Bool)

(declare-fun res!947619 () Bool)

(assert (=> b!1410583 (=> (not res!947619) (not e!798332))))

(assert (=> b!1410583 (= res!947619 (and (= (size!47132 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47132 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47132 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410584 () Bool)

(declare-fun res!947620 () Bool)

(assert (=> b!1410584 (=> (not res!947620) (not e!798332))))

(declare-datatypes ((List!33087 0))(
  ( (Nil!33084) (Cons!33083 (h!34354 (_ BitVec 64)) (t!47773 List!33087)) )
))
(declare-fun arrayNoDuplicates!0 (array!96480 (_ BitVec 32) List!33087) Bool)

(assert (=> b!1410584 (= res!947620 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33084))))

(declare-fun b!1410585 () Bool)

(assert (=> b!1410585 (= e!798332 (not e!798335))))

(declare-fun res!947618 () Bool)

(assert (=> b!1410585 (=> res!947618 e!798335)))

(declare-fun lt!621120 () SeekEntryResult!10795)

(assert (=> b!1410585 (= res!947618 (or (not (is-Intermediate!10795 lt!621120)) (undefined!11607 lt!621120)))))

(assert (=> b!1410585 e!798333))

(declare-fun res!947617 () Bool)

(assert (=> b!1410585 (=> (not res!947617) (not e!798333))))

(assert (=> b!1410585 (= res!947617 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47591 0))(
  ( (Unit!47592) )
))
(declare-fun lt!621121 () Unit!47591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47591)

(assert (=> b!1410585 (= lt!621121 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410585 (= lt!621120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46581 a!2901) j!112) mask!2840) (select (arr!46581 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121404 res!947616) b!1410583))

(assert (= (and b!1410583 res!947619) b!1410581))

(assert (= (and b!1410581 res!947622) b!1410580))

(assert (= (and b!1410580 res!947621) b!1410578))

(assert (= (and b!1410578 res!947623) b!1410584))

(assert (= (and b!1410584 res!947620) b!1410585))

(assert (= (and b!1410585 res!947617) b!1410579))

(assert (= (and b!1410585 (not res!947618)) b!1410582))

(declare-fun m!1300527 () Bool)

(assert (=> b!1410579 m!1300527))

(assert (=> b!1410579 m!1300527))

(declare-fun m!1300529 () Bool)

(assert (=> b!1410579 m!1300529))

(declare-fun m!1300531 () Bool)

(assert (=> b!1410578 m!1300531))

(declare-fun m!1300533 () Bool)

(assert (=> b!1410582 m!1300533))

(declare-fun m!1300535 () Bool)

(assert (=> b!1410582 m!1300535))

(assert (=> b!1410582 m!1300535))

(declare-fun m!1300537 () Bool)

(assert (=> b!1410582 m!1300537))

(assert (=> b!1410582 m!1300537))

(assert (=> b!1410582 m!1300535))

(declare-fun m!1300539 () Bool)

(assert (=> b!1410582 m!1300539))

(declare-fun m!1300541 () Bool)

(assert (=> start!121404 m!1300541))

(declare-fun m!1300543 () Bool)

(assert (=> start!121404 m!1300543))

(declare-fun m!1300545 () Bool)

(assert (=> b!1410581 m!1300545))

(assert (=> b!1410581 m!1300545))

(declare-fun m!1300547 () Bool)

(assert (=> b!1410581 m!1300547))

(declare-fun m!1300549 () Bool)

(assert (=> b!1410584 m!1300549))

(assert (=> b!1410580 m!1300527))

(assert (=> b!1410580 m!1300527))

(declare-fun m!1300551 () Bool)

(assert (=> b!1410580 m!1300551))

(assert (=> b!1410585 m!1300527))

(declare-fun m!1300553 () Bool)

(assert (=> b!1410585 m!1300553))

(assert (=> b!1410585 m!1300527))

(declare-fun m!1300555 () Bool)

(assert (=> b!1410585 m!1300555))

(assert (=> b!1410585 m!1300553))

(assert (=> b!1410585 m!1300527))

(declare-fun m!1300557 () Bool)

(assert (=> b!1410585 m!1300557))

(declare-fun m!1300559 () Bool)

(assert (=> b!1410585 m!1300559))

(push 1)

(assert (not start!121404))

(assert (not b!1410579))

(assert (not b!1410578))

(assert (not b!1410582))

(assert (not b!1410585))

(assert (not b!1410580))

(assert (not b!1410581))

(assert (not b!1410584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

