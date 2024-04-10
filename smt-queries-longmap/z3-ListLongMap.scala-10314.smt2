; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121208 () Bool)

(assert start!121208)

(declare-fun b!1409342 () Bool)

(declare-fun res!947069 () Bool)

(declare-fun e!797546 () Bool)

(assert (=> b!1409342 (=> (not res!947069) (not e!797546))))

(declare-datatypes ((array!96362 0))(
  ( (array!96363 (arr!46524 (Array (_ BitVec 32) (_ BitVec 64))) (size!47074 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96362)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409342 (= res!947069 (validKeyInArray!0 (select (arr!46524 a!2901) i!1037)))))

(declare-fun b!1409343 () Bool)

(declare-fun res!947066 () Bool)

(assert (=> b!1409343 (=> (not res!947066) (not e!797546))))

(declare-datatypes ((List!33043 0))(
  ( (Nil!33040) (Cons!33039 (h!34302 (_ BitVec 64)) (t!47737 List!33043)) )
))
(declare-fun arrayNoDuplicates!0 (array!96362 (_ BitVec 32) List!33043) Bool)

(assert (=> b!1409343 (= res!947066 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33040))))

(declare-fun b!1409344 () Bool)

(declare-fun e!797548 () Bool)

(assert (=> b!1409344 (= e!797546 (not e!797548))))

(declare-fun res!947065 () Bool)

(assert (=> b!1409344 (=> res!947065 e!797548)))

(declare-datatypes ((SeekEntryResult!10835 0))(
  ( (MissingZero!10835 (index!45717 (_ BitVec 32))) (Found!10835 (index!45718 (_ BitVec 32))) (Intermediate!10835 (undefined!11647 Bool) (index!45719 (_ BitVec 32)) (x!127308 (_ BitVec 32))) (Undefined!10835) (MissingVacant!10835 (index!45720 (_ BitVec 32))) )
))
(declare-fun lt!620686 () SeekEntryResult!10835)

(get-info :version)

(assert (=> b!1409344 (= res!947065 (or (not ((_ is Intermediate!10835) lt!620686)) (undefined!11647 lt!620686)))))

(declare-fun e!797547 () Bool)

(assert (=> b!1409344 e!797547))

(declare-fun res!947071 () Bool)

(assert (=> b!1409344 (=> (not res!947071) (not e!797547))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96362 (_ BitVec 32)) Bool)

(assert (=> b!1409344 (= res!947071 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47644 0))(
  ( (Unit!47645) )
))
(declare-fun lt!620687 () Unit!47644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47644)

(assert (=> b!1409344 (= lt!620687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96362 (_ BitVec 32)) SeekEntryResult!10835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409344 (= lt!620686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46524 a!2901) j!112) mask!2840) (select (arr!46524 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!947070 () Bool)

(assert (=> start!121208 (=> (not res!947070) (not e!797546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121208 (= res!947070 (validMask!0 mask!2840))))

(assert (=> start!121208 e!797546))

(assert (=> start!121208 true))

(declare-fun array_inv!35552 (array!96362) Bool)

(assert (=> start!121208 (array_inv!35552 a!2901)))

(declare-fun b!1409345 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96362 (_ BitVec 32)) SeekEntryResult!10835)

(assert (=> b!1409345 (= e!797547 (= (seekEntryOrOpen!0 (select (arr!46524 a!2901) j!112) a!2901 mask!2840) (Found!10835 j!112)))))

(declare-fun b!1409346 () Bool)

(assert (=> b!1409346 (= e!797548 true)))

(declare-fun lt!620688 () SeekEntryResult!10835)

(assert (=> b!1409346 (= lt!620688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46524 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46524 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96363 (store (arr!46524 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47074 a!2901)) mask!2840))))

(declare-fun b!1409347 () Bool)

(declare-fun res!947067 () Bool)

(assert (=> b!1409347 (=> (not res!947067) (not e!797546))))

(assert (=> b!1409347 (= res!947067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409348 () Bool)

(declare-fun res!947064 () Bool)

(assert (=> b!1409348 (=> (not res!947064) (not e!797546))))

(assert (=> b!1409348 (= res!947064 (validKeyInArray!0 (select (arr!46524 a!2901) j!112)))))

(declare-fun b!1409349 () Bool)

(declare-fun res!947068 () Bool)

(assert (=> b!1409349 (=> (not res!947068) (not e!797546))))

(assert (=> b!1409349 (= res!947068 (and (= (size!47074 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47074 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47074 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121208 res!947070) b!1409349))

(assert (= (and b!1409349 res!947068) b!1409342))

(assert (= (and b!1409342 res!947069) b!1409348))

(assert (= (and b!1409348 res!947064) b!1409347))

(assert (= (and b!1409347 res!947067) b!1409343))

(assert (= (and b!1409343 res!947066) b!1409344))

(assert (= (and b!1409344 res!947071) b!1409345))

(assert (= (and b!1409344 (not res!947065)) b!1409346))

(declare-fun m!1299019 () Bool)

(assert (=> b!1409347 m!1299019))

(declare-fun m!1299021 () Bool)

(assert (=> b!1409344 m!1299021))

(declare-fun m!1299023 () Bool)

(assert (=> b!1409344 m!1299023))

(assert (=> b!1409344 m!1299021))

(declare-fun m!1299025 () Bool)

(assert (=> b!1409344 m!1299025))

(assert (=> b!1409344 m!1299023))

(assert (=> b!1409344 m!1299021))

(declare-fun m!1299027 () Bool)

(assert (=> b!1409344 m!1299027))

(declare-fun m!1299029 () Bool)

(assert (=> b!1409344 m!1299029))

(assert (=> b!1409345 m!1299021))

(assert (=> b!1409345 m!1299021))

(declare-fun m!1299031 () Bool)

(assert (=> b!1409345 m!1299031))

(declare-fun m!1299033 () Bool)

(assert (=> b!1409342 m!1299033))

(assert (=> b!1409342 m!1299033))

(declare-fun m!1299035 () Bool)

(assert (=> b!1409342 m!1299035))

(declare-fun m!1299037 () Bool)

(assert (=> start!121208 m!1299037))

(declare-fun m!1299039 () Bool)

(assert (=> start!121208 m!1299039))

(declare-fun m!1299041 () Bool)

(assert (=> b!1409346 m!1299041))

(declare-fun m!1299043 () Bool)

(assert (=> b!1409346 m!1299043))

(assert (=> b!1409346 m!1299043))

(declare-fun m!1299045 () Bool)

(assert (=> b!1409346 m!1299045))

(assert (=> b!1409346 m!1299045))

(assert (=> b!1409346 m!1299043))

(declare-fun m!1299047 () Bool)

(assert (=> b!1409346 m!1299047))

(declare-fun m!1299049 () Bool)

(assert (=> b!1409343 m!1299049))

(assert (=> b!1409348 m!1299021))

(assert (=> b!1409348 m!1299021))

(declare-fun m!1299051 () Bool)

(assert (=> b!1409348 m!1299051))

(check-sat (not b!1409348) (not start!121208) (not b!1409343) (not b!1409346) (not b!1409344) (not b!1409347) (not b!1409345) (not b!1409342))
