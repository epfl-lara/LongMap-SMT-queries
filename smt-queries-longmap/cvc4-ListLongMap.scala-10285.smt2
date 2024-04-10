; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120874 () Bool)

(assert start!120874)

(declare-fun b!1406432 () Bool)

(declare-fun e!796038 () Bool)

(declare-fun e!796039 () Bool)

(assert (=> b!1406432 (= e!796038 (not e!796039))))

(declare-fun res!944656 () Bool)

(assert (=> b!1406432 (=> res!944656 e!796039)))

(declare-datatypes ((SeekEntryResult!10749 0))(
  ( (MissingZero!10749 (index!45373 (_ BitVec 32))) (Found!10749 (index!45374 (_ BitVec 32))) (Intermediate!10749 (undefined!11561 Bool) (index!45375 (_ BitVec 32)) (x!126972 (_ BitVec 32))) (Undefined!10749) (MissingVacant!10749 (index!45376 (_ BitVec 32))) )
))
(declare-fun lt!619382 () SeekEntryResult!10749)

(assert (=> b!1406432 (= res!944656 (or (not (is-Intermediate!10749 lt!619382)) (undefined!11561 lt!619382)))))

(declare-fun e!796037 () Bool)

(assert (=> b!1406432 e!796037))

(declare-fun res!944654 () Bool)

(assert (=> b!1406432 (=> (not res!944654) (not e!796037))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96181 0))(
  ( (array!96182 (arr!46438 (Array (_ BitVec 32) (_ BitVec 64))) (size!46988 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96181)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96181 (_ BitVec 32)) Bool)

(assert (=> b!1406432 (= res!944654 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47472 0))(
  ( (Unit!47473) )
))
(declare-fun lt!619383 () Unit!47472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47472)

(assert (=> b!1406432 (= lt!619383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96181 (_ BitVec 32)) SeekEntryResult!10749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406432 (= lt!619382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46438 a!2901) j!112) mask!2840) (select (arr!46438 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406433 () Bool)

(declare-fun res!944655 () Bool)

(assert (=> b!1406433 (=> (not res!944655) (not e!796038))))

(assert (=> b!1406433 (= res!944655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944653 () Bool)

(assert (=> start!120874 (=> (not res!944653) (not e!796038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120874 (= res!944653 (validMask!0 mask!2840))))

(assert (=> start!120874 e!796038))

(assert (=> start!120874 true))

(declare-fun array_inv!35466 (array!96181) Bool)

(assert (=> start!120874 (array_inv!35466 a!2901)))

(declare-fun b!1406434 () Bool)

(assert (=> b!1406434 (= e!796039 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619381 () SeekEntryResult!10749)

(assert (=> b!1406434 (= lt!619381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46438 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46438 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96182 (store (arr!46438 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46988 a!2901)) mask!2840))))

(declare-fun b!1406435 () Bool)

(declare-fun res!944651 () Bool)

(assert (=> b!1406435 (=> (not res!944651) (not e!796038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406435 (= res!944651 (validKeyInArray!0 (select (arr!46438 a!2901) i!1037)))))

(declare-fun b!1406436 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96181 (_ BitVec 32)) SeekEntryResult!10749)

(assert (=> b!1406436 (= e!796037 (= (seekEntryOrOpen!0 (select (arr!46438 a!2901) j!112) a!2901 mask!2840) (Found!10749 j!112)))))

(declare-fun b!1406437 () Bool)

(declare-fun res!944649 () Bool)

(assert (=> b!1406437 (=> (not res!944649) (not e!796038))))

(assert (=> b!1406437 (= res!944649 (and (= (size!46988 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46988 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46988 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406438 () Bool)

(declare-fun res!944652 () Bool)

(assert (=> b!1406438 (=> (not res!944652) (not e!796038))))

(assert (=> b!1406438 (= res!944652 (validKeyInArray!0 (select (arr!46438 a!2901) j!112)))))

(declare-fun b!1406439 () Bool)

(declare-fun res!944650 () Bool)

(assert (=> b!1406439 (=> (not res!944650) (not e!796038))))

(declare-datatypes ((List!32957 0))(
  ( (Nil!32954) (Cons!32953 (h!34207 (_ BitVec 64)) (t!47651 List!32957)) )
))
(declare-fun arrayNoDuplicates!0 (array!96181 (_ BitVec 32) List!32957) Bool)

(assert (=> b!1406439 (= res!944650 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32954))))

(assert (= (and start!120874 res!944653) b!1406437))

(assert (= (and b!1406437 res!944649) b!1406435))

(assert (= (and b!1406435 res!944651) b!1406438))

(assert (= (and b!1406438 res!944652) b!1406433))

(assert (= (and b!1406433 res!944655) b!1406439))

(assert (= (and b!1406439 res!944650) b!1406432))

(assert (= (and b!1406432 res!944654) b!1406436))

(assert (= (and b!1406432 (not res!944656)) b!1406434))

(declare-fun m!1295573 () Bool)

(assert (=> start!120874 m!1295573))

(declare-fun m!1295575 () Bool)

(assert (=> start!120874 m!1295575))

(declare-fun m!1295577 () Bool)

(assert (=> b!1406438 m!1295577))

(assert (=> b!1406438 m!1295577))

(declare-fun m!1295579 () Bool)

(assert (=> b!1406438 m!1295579))

(assert (=> b!1406432 m!1295577))

(declare-fun m!1295581 () Bool)

(assert (=> b!1406432 m!1295581))

(assert (=> b!1406432 m!1295577))

(declare-fun m!1295583 () Bool)

(assert (=> b!1406432 m!1295583))

(assert (=> b!1406432 m!1295581))

(assert (=> b!1406432 m!1295577))

(declare-fun m!1295585 () Bool)

(assert (=> b!1406432 m!1295585))

(declare-fun m!1295587 () Bool)

(assert (=> b!1406432 m!1295587))

(assert (=> b!1406436 m!1295577))

(assert (=> b!1406436 m!1295577))

(declare-fun m!1295589 () Bool)

(assert (=> b!1406436 m!1295589))

(declare-fun m!1295591 () Bool)

(assert (=> b!1406433 m!1295591))

(declare-fun m!1295593 () Bool)

(assert (=> b!1406434 m!1295593))

(declare-fun m!1295595 () Bool)

(assert (=> b!1406434 m!1295595))

(assert (=> b!1406434 m!1295595))

(declare-fun m!1295597 () Bool)

(assert (=> b!1406434 m!1295597))

(assert (=> b!1406434 m!1295597))

(assert (=> b!1406434 m!1295595))

(declare-fun m!1295599 () Bool)

(assert (=> b!1406434 m!1295599))

(declare-fun m!1295601 () Bool)

(assert (=> b!1406439 m!1295601))

(declare-fun m!1295603 () Bool)

(assert (=> b!1406435 m!1295603))

(assert (=> b!1406435 m!1295603))

(declare-fun m!1295605 () Bool)

(assert (=> b!1406435 m!1295605))

(push 1)

(assert (not b!1406432))

(assert (not b!1406439))

(assert (not start!120874))

(assert (not b!1406438))

(assert (not b!1406433))

(assert (not b!1406435))

(assert (not b!1406436))

(assert (not b!1406434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

