; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120810 () Bool)

(assert start!120810)

(declare-fun b!1405664 () Bool)

(declare-fun e!795654 () Bool)

(assert (=> b!1405664 (= e!795654 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96117 0))(
  ( (array!96118 (arr!46406 (Array (_ BitVec 32) (_ BitVec 64))) (size!46956 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96117)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619094 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405664 (= lt!619094 (toIndex!0 (select (store (arr!46406 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405665 () Bool)

(declare-fun res!943882 () Bool)

(declare-fun e!795656 () Bool)

(assert (=> b!1405665 (=> (not res!943882) (not e!795656))))

(declare-datatypes ((List!32925 0))(
  ( (Nil!32922) (Cons!32921 (h!34175 (_ BitVec 64)) (t!47619 List!32925)) )
))
(declare-fun arrayNoDuplicates!0 (array!96117 (_ BitVec 32) List!32925) Bool)

(assert (=> b!1405665 (= res!943882 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32922))))

(declare-fun b!1405666 () Bool)

(declare-fun res!943886 () Bool)

(assert (=> b!1405666 (=> (not res!943886) (not e!795656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405666 (= res!943886 (validKeyInArray!0 (select (arr!46406 a!2901) i!1037)))))

(declare-fun b!1405667 () Bool)

(declare-fun res!943888 () Bool)

(assert (=> b!1405667 (=> (not res!943888) (not e!795656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96117 (_ BitVec 32)) Bool)

(assert (=> b!1405667 (= res!943888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405668 () Bool)

(assert (=> b!1405668 (= e!795656 (not e!795654))))

(declare-fun res!943881 () Bool)

(assert (=> b!1405668 (=> res!943881 e!795654)))

(declare-datatypes ((SeekEntryResult!10717 0))(
  ( (MissingZero!10717 (index!45245 (_ BitVec 32))) (Found!10717 (index!45246 (_ BitVec 32))) (Intermediate!10717 (undefined!11529 Bool) (index!45247 (_ BitVec 32)) (x!126860 (_ BitVec 32))) (Undefined!10717) (MissingVacant!10717 (index!45248 (_ BitVec 32))) )
))
(declare-fun lt!619093 () SeekEntryResult!10717)

(assert (=> b!1405668 (= res!943881 (or (not (is-Intermediate!10717 lt!619093)) (undefined!11529 lt!619093)))))

(declare-fun e!795653 () Bool)

(assert (=> b!1405668 e!795653))

(declare-fun res!943885 () Bool)

(assert (=> b!1405668 (=> (not res!943885) (not e!795653))))

(assert (=> b!1405668 (= res!943885 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47408 0))(
  ( (Unit!47409) )
))
(declare-fun lt!619095 () Unit!47408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47408)

(assert (=> b!1405668 (= lt!619095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96117 (_ BitVec 32)) SeekEntryResult!10717)

(assert (=> b!1405668 (= lt!619093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46406 a!2901) j!112) mask!2840) (select (arr!46406 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405669 () Bool)

(declare-fun res!943887 () Bool)

(assert (=> b!1405669 (=> (not res!943887) (not e!795656))))

(assert (=> b!1405669 (= res!943887 (validKeyInArray!0 (select (arr!46406 a!2901) j!112)))))

(declare-fun b!1405670 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96117 (_ BitVec 32)) SeekEntryResult!10717)

(assert (=> b!1405670 (= e!795653 (= (seekEntryOrOpen!0 (select (arr!46406 a!2901) j!112) a!2901 mask!2840) (Found!10717 j!112)))))

(declare-fun res!943884 () Bool)

(assert (=> start!120810 (=> (not res!943884) (not e!795656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120810 (= res!943884 (validMask!0 mask!2840))))

(assert (=> start!120810 e!795656))

(assert (=> start!120810 true))

(declare-fun array_inv!35434 (array!96117) Bool)

(assert (=> start!120810 (array_inv!35434 a!2901)))

(declare-fun b!1405671 () Bool)

(declare-fun res!943883 () Bool)

(assert (=> b!1405671 (=> (not res!943883) (not e!795656))))

(assert (=> b!1405671 (= res!943883 (and (= (size!46956 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46956 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46956 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120810 res!943884) b!1405671))

(assert (= (and b!1405671 res!943883) b!1405666))

(assert (= (and b!1405666 res!943886) b!1405669))

(assert (= (and b!1405669 res!943887) b!1405667))

(assert (= (and b!1405667 res!943888) b!1405665))

(assert (= (and b!1405665 res!943882) b!1405668))

(assert (= (and b!1405668 res!943885) b!1405670))

(assert (= (and b!1405668 (not res!943881)) b!1405664))

(declare-fun m!1294497 () Bool)

(assert (=> b!1405667 m!1294497))

(declare-fun m!1294499 () Bool)

(assert (=> b!1405668 m!1294499))

(declare-fun m!1294501 () Bool)

(assert (=> b!1405668 m!1294501))

(assert (=> b!1405668 m!1294499))

(declare-fun m!1294503 () Bool)

(assert (=> b!1405668 m!1294503))

(assert (=> b!1405668 m!1294501))

(assert (=> b!1405668 m!1294499))

(declare-fun m!1294505 () Bool)

(assert (=> b!1405668 m!1294505))

(declare-fun m!1294507 () Bool)

(assert (=> b!1405668 m!1294507))

(declare-fun m!1294509 () Bool)

(assert (=> b!1405666 m!1294509))

(assert (=> b!1405666 m!1294509))

(declare-fun m!1294511 () Bool)

(assert (=> b!1405666 m!1294511))

(assert (=> b!1405670 m!1294499))

(assert (=> b!1405670 m!1294499))

(declare-fun m!1294513 () Bool)

(assert (=> b!1405670 m!1294513))

(declare-fun m!1294515 () Bool)

(assert (=> b!1405665 m!1294515))

(declare-fun m!1294517 () Bool)

(assert (=> start!120810 m!1294517))

(declare-fun m!1294519 () Bool)

(assert (=> start!120810 m!1294519))

(declare-fun m!1294521 () Bool)

(assert (=> b!1405664 m!1294521))

(declare-fun m!1294523 () Bool)

(assert (=> b!1405664 m!1294523))

(assert (=> b!1405664 m!1294523))

(declare-fun m!1294525 () Bool)

(assert (=> b!1405664 m!1294525))

(assert (=> b!1405669 m!1294499))

(assert (=> b!1405669 m!1294499))

(declare-fun m!1294527 () Bool)

(assert (=> b!1405669 m!1294527))

(push 1)

(assert (not b!1405668))

(assert (not b!1405670))

(assert (not b!1405666))

(assert (not b!1405669))

(assert (not start!120810))

(assert (not b!1405665))

(assert (not b!1405664))

(assert (not b!1405667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

