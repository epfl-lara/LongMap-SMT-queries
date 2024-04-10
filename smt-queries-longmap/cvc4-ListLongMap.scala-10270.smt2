; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120784 () Bool)

(assert start!120784)

(declare-fun b!1405389 () Bool)

(declare-fun e!795536 () Bool)

(assert (=> b!1405389 (= e!795536 (not true))))

(declare-fun e!795534 () Bool)

(assert (=> b!1405389 e!795534))

(declare-fun res!943607 () Bool)

(assert (=> b!1405389 (=> (not res!943607) (not e!795534))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96091 0))(
  ( (array!96092 (arr!46393 (Array (_ BitVec 32) (_ BitVec 64))) (size!46943 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96091)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96091 (_ BitVec 32)) Bool)

(assert (=> b!1405389 (= res!943607 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47382 0))(
  ( (Unit!47383) )
))
(declare-fun lt!619014 () Unit!47382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47382)

(assert (=> b!1405389 (= lt!619014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10704 0))(
  ( (MissingZero!10704 (index!45193 (_ BitVec 32))) (Found!10704 (index!45194 (_ BitVec 32))) (Intermediate!10704 (undefined!11516 Bool) (index!45195 (_ BitVec 32)) (x!126807 (_ BitVec 32))) (Undefined!10704) (MissingVacant!10704 (index!45196 (_ BitVec 32))) )
))
(declare-fun lt!619013 () SeekEntryResult!10704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96091 (_ BitVec 32)) SeekEntryResult!10704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405389 (= lt!619013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46393 a!2901) j!112) mask!2840) (select (arr!46393 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405390 () Bool)

(declare-fun res!943612 () Bool)

(assert (=> b!1405390 (=> (not res!943612) (not e!795536))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405390 (= res!943612 (and (= (size!46943 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46943 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46943 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943608 () Bool)

(assert (=> start!120784 (=> (not res!943608) (not e!795536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120784 (= res!943608 (validMask!0 mask!2840))))

(assert (=> start!120784 e!795536))

(assert (=> start!120784 true))

(declare-fun array_inv!35421 (array!96091) Bool)

(assert (=> start!120784 (array_inv!35421 a!2901)))

(declare-fun b!1405391 () Bool)

(declare-fun res!943611 () Bool)

(assert (=> b!1405391 (=> (not res!943611) (not e!795536))))

(assert (=> b!1405391 (= res!943611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405392 () Bool)

(declare-fun res!943606 () Bool)

(assert (=> b!1405392 (=> (not res!943606) (not e!795536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405392 (= res!943606 (validKeyInArray!0 (select (arr!46393 a!2901) j!112)))))

(declare-fun b!1405393 () Bool)

(declare-fun res!943610 () Bool)

(assert (=> b!1405393 (=> (not res!943610) (not e!795536))))

(assert (=> b!1405393 (= res!943610 (validKeyInArray!0 (select (arr!46393 a!2901) i!1037)))))

(declare-fun b!1405394 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96091 (_ BitVec 32)) SeekEntryResult!10704)

(assert (=> b!1405394 (= e!795534 (= (seekEntryOrOpen!0 (select (arr!46393 a!2901) j!112) a!2901 mask!2840) (Found!10704 j!112)))))

(declare-fun b!1405395 () Bool)

(declare-fun res!943609 () Bool)

(assert (=> b!1405395 (=> (not res!943609) (not e!795536))))

(declare-datatypes ((List!32912 0))(
  ( (Nil!32909) (Cons!32908 (h!34162 (_ BitVec 64)) (t!47606 List!32912)) )
))
(declare-fun arrayNoDuplicates!0 (array!96091 (_ BitVec 32) List!32912) Bool)

(assert (=> b!1405395 (= res!943609 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32909))))

(assert (= (and start!120784 res!943608) b!1405390))

(assert (= (and b!1405390 res!943612) b!1405393))

(assert (= (and b!1405393 res!943610) b!1405392))

(assert (= (and b!1405392 res!943606) b!1405391))

(assert (= (and b!1405391 res!943611) b!1405395))

(assert (= (and b!1405395 res!943609) b!1405389))

(assert (= (and b!1405389 res!943607) b!1405394))

(declare-fun m!1294159 () Bool)

(assert (=> b!1405394 m!1294159))

(assert (=> b!1405394 m!1294159))

(declare-fun m!1294161 () Bool)

(assert (=> b!1405394 m!1294161))

(declare-fun m!1294163 () Bool)

(assert (=> b!1405395 m!1294163))

(assert (=> b!1405392 m!1294159))

(assert (=> b!1405392 m!1294159))

(declare-fun m!1294165 () Bool)

(assert (=> b!1405392 m!1294165))

(declare-fun m!1294167 () Bool)

(assert (=> start!120784 m!1294167))

(declare-fun m!1294169 () Bool)

(assert (=> start!120784 m!1294169))

(assert (=> b!1405389 m!1294159))

(declare-fun m!1294171 () Bool)

(assert (=> b!1405389 m!1294171))

(assert (=> b!1405389 m!1294159))

(declare-fun m!1294173 () Bool)

(assert (=> b!1405389 m!1294173))

(assert (=> b!1405389 m!1294171))

(assert (=> b!1405389 m!1294159))

(declare-fun m!1294175 () Bool)

(assert (=> b!1405389 m!1294175))

(declare-fun m!1294177 () Bool)

(assert (=> b!1405389 m!1294177))

(declare-fun m!1294179 () Bool)

(assert (=> b!1405393 m!1294179))

(assert (=> b!1405393 m!1294179))

(declare-fun m!1294181 () Bool)

(assert (=> b!1405393 m!1294181))

(declare-fun m!1294183 () Bool)

(assert (=> b!1405391 m!1294183))

(push 1)

(assert (not b!1405394))

(assert (not b!1405391))

(assert (not b!1405393))

(assert (not start!120784))

(assert (not b!1405395))

(assert (not b!1405389))

(assert (not b!1405392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

