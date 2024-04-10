; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121130 () Bool)

(assert start!121130)

(declare-fun res!946131 () Bool)

(declare-fun e!797081 () Bool)

(assert (=> start!121130 (=> (not res!946131) (not e!797081))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121130 (= res!946131 (validMask!0 mask!2840))))

(assert (=> start!121130 e!797081))

(assert (=> start!121130 true))

(declare-datatypes ((array!96284 0))(
  ( (array!96285 (arr!46485 (Array (_ BitVec 32) (_ BitVec 64))) (size!47035 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96284)

(declare-fun array_inv!35513 (array!96284) Bool)

(assert (=> start!121130 (array_inv!35513 a!2901)))

(declare-fun b!1408406 () Bool)

(declare-fun e!797080 () Bool)

(assert (=> b!1408406 (= e!797081 (not e!797080))))

(declare-fun res!946129 () Bool)

(assert (=> b!1408406 (=> res!946129 e!797080)))

(declare-datatypes ((SeekEntryResult!10796 0))(
  ( (MissingZero!10796 (index!45561 (_ BitVec 32))) (Found!10796 (index!45562 (_ BitVec 32))) (Intermediate!10796 (undefined!11608 Bool) (index!45563 (_ BitVec 32)) (x!127165 (_ BitVec 32))) (Undefined!10796) (MissingVacant!10796 (index!45564 (_ BitVec 32))) )
))
(declare-fun lt!620337 () SeekEntryResult!10796)

(get-info :version)

(assert (=> b!1408406 (= res!946129 (or (not ((_ is Intermediate!10796) lt!620337)) (undefined!11608 lt!620337)))))

(declare-fun e!797078 () Bool)

(assert (=> b!1408406 e!797078))

(declare-fun res!946133 () Bool)

(assert (=> b!1408406 (=> (not res!946133) (not e!797078))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96284 (_ BitVec 32)) Bool)

(assert (=> b!1408406 (= res!946133 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47566 0))(
  ( (Unit!47567) )
))
(declare-fun lt!620336 () Unit!47566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47566)

(assert (=> b!1408406 (= lt!620336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96284 (_ BitVec 32)) SeekEntryResult!10796)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408406 (= lt!620337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46485 a!2901) j!112) mask!2840) (select (arr!46485 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408407 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96284 (_ BitVec 32)) SeekEntryResult!10796)

(assert (=> b!1408407 (= e!797078 (= (seekEntryOrOpen!0 (select (arr!46485 a!2901) j!112) a!2901 mask!2840) (Found!10796 j!112)))))

(declare-fun b!1408408 () Bool)

(assert (=> b!1408408 (= e!797080 true)))

(declare-fun lt!620335 () SeekEntryResult!10796)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408408 (= lt!620335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96285 (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47035 a!2901)) mask!2840))))

(declare-fun b!1408409 () Bool)

(declare-fun res!946135 () Bool)

(assert (=> b!1408409 (=> (not res!946135) (not e!797081))))

(assert (=> b!1408409 (= res!946135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408410 () Bool)

(declare-fun res!946134 () Bool)

(assert (=> b!1408410 (=> (not res!946134) (not e!797081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408410 (= res!946134 (validKeyInArray!0 (select (arr!46485 a!2901) j!112)))))

(declare-fun b!1408411 () Bool)

(declare-fun res!946128 () Bool)

(assert (=> b!1408411 (=> (not res!946128) (not e!797081))))

(assert (=> b!1408411 (= res!946128 (validKeyInArray!0 (select (arr!46485 a!2901) i!1037)))))

(declare-fun b!1408412 () Bool)

(declare-fun res!946132 () Bool)

(assert (=> b!1408412 (=> (not res!946132) (not e!797081))))

(assert (=> b!1408412 (= res!946132 (and (= (size!47035 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47035 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47035 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408413 () Bool)

(declare-fun res!946130 () Bool)

(assert (=> b!1408413 (=> (not res!946130) (not e!797081))))

(declare-datatypes ((List!33004 0))(
  ( (Nil!33001) (Cons!33000 (h!34263 (_ BitVec 64)) (t!47698 List!33004)) )
))
(declare-fun arrayNoDuplicates!0 (array!96284 (_ BitVec 32) List!33004) Bool)

(assert (=> b!1408413 (= res!946130 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33001))))

(assert (= (and start!121130 res!946131) b!1408412))

(assert (= (and b!1408412 res!946132) b!1408411))

(assert (= (and b!1408411 res!946128) b!1408410))

(assert (= (and b!1408410 res!946134) b!1408409))

(assert (= (and b!1408409 res!946135) b!1408413))

(assert (= (and b!1408413 res!946130) b!1408406))

(assert (= (and b!1408406 res!946133) b!1408407))

(assert (= (and b!1408406 (not res!946129)) b!1408408))

(declare-fun m!1297693 () Bool)

(assert (=> b!1408408 m!1297693))

(declare-fun m!1297695 () Bool)

(assert (=> b!1408408 m!1297695))

(assert (=> b!1408408 m!1297695))

(declare-fun m!1297697 () Bool)

(assert (=> b!1408408 m!1297697))

(assert (=> b!1408408 m!1297697))

(assert (=> b!1408408 m!1297695))

(declare-fun m!1297699 () Bool)

(assert (=> b!1408408 m!1297699))

(declare-fun m!1297701 () Bool)

(assert (=> b!1408406 m!1297701))

(declare-fun m!1297703 () Bool)

(assert (=> b!1408406 m!1297703))

(assert (=> b!1408406 m!1297701))

(declare-fun m!1297705 () Bool)

(assert (=> b!1408406 m!1297705))

(assert (=> b!1408406 m!1297703))

(assert (=> b!1408406 m!1297701))

(declare-fun m!1297707 () Bool)

(assert (=> b!1408406 m!1297707))

(declare-fun m!1297709 () Bool)

(assert (=> b!1408406 m!1297709))

(assert (=> b!1408407 m!1297701))

(assert (=> b!1408407 m!1297701))

(declare-fun m!1297711 () Bool)

(assert (=> b!1408407 m!1297711))

(declare-fun m!1297713 () Bool)

(assert (=> b!1408413 m!1297713))

(declare-fun m!1297715 () Bool)

(assert (=> b!1408411 m!1297715))

(assert (=> b!1408411 m!1297715))

(declare-fun m!1297717 () Bool)

(assert (=> b!1408411 m!1297717))

(declare-fun m!1297719 () Bool)

(assert (=> start!121130 m!1297719))

(declare-fun m!1297721 () Bool)

(assert (=> start!121130 m!1297721))

(declare-fun m!1297723 () Bool)

(assert (=> b!1408409 m!1297723))

(assert (=> b!1408410 m!1297701))

(assert (=> b!1408410 m!1297701))

(declare-fun m!1297725 () Bool)

(assert (=> b!1408410 m!1297725))

(check-sat (not b!1408406) (not start!121130) (not b!1408413) (not b!1408408) (not b!1408411) (not b!1408410) (not b!1408409) (not b!1408407))
