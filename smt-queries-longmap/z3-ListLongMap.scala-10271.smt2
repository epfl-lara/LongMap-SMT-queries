; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120788 () Bool)

(assert start!120788)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96095 0))(
  ( (array!96096 (arr!46395 (Array (_ BitVec 32) (_ BitVec 64))) (size!46945 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96095)

(declare-fun b!1405431 () Bool)

(declare-fun e!795552 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10706 0))(
  ( (MissingZero!10706 (index!45201 (_ BitVec 32))) (Found!10706 (index!45202 (_ BitVec 32))) (Intermediate!10706 (undefined!11518 Bool) (index!45203 (_ BitVec 32)) (x!126817 (_ BitVec 32))) (Undefined!10706) (MissingVacant!10706 (index!45204 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96095 (_ BitVec 32)) SeekEntryResult!10706)

(assert (=> b!1405431 (= e!795552 (= (seekEntryOrOpen!0 (select (arr!46395 a!2901) j!112) a!2901 mask!2840) (Found!10706 j!112)))))

(declare-fun res!943653 () Bool)

(declare-fun e!795553 () Bool)

(assert (=> start!120788 (=> (not res!943653) (not e!795553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120788 (= res!943653 (validMask!0 mask!2840))))

(assert (=> start!120788 e!795553))

(assert (=> start!120788 true))

(declare-fun array_inv!35423 (array!96095) Bool)

(assert (=> start!120788 (array_inv!35423 a!2901)))

(declare-fun b!1405432 () Bool)

(declare-fun res!943654 () Bool)

(assert (=> b!1405432 (=> (not res!943654) (not e!795553))))

(declare-datatypes ((List!32914 0))(
  ( (Nil!32911) (Cons!32910 (h!34164 (_ BitVec 64)) (t!47608 List!32914)) )
))
(declare-fun arrayNoDuplicates!0 (array!96095 (_ BitVec 32) List!32914) Bool)

(assert (=> b!1405432 (= res!943654 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32911))))

(declare-fun b!1405433 () Bool)

(declare-fun res!943648 () Bool)

(assert (=> b!1405433 (=> (not res!943648) (not e!795553))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405433 (= res!943648 (validKeyInArray!0 (select (arr!46395 a!2901) i!1037)))))

(declare-fun b!1405434 () Bool)

(assert (=> b!1405434 (= e!795553 (not true))))

(assert (=> b!1405434 e!795552))

(declare-fun res!943652 () Bool)

(assert (=> b!1405434 (=> (not res!943652) (not e!795552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96095 (_ BitVec 32)) Bool)

(assert (=> b!1405434 (= res!943652 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47386 0))(
  ( (Unit!47387) )
))
(declare-fun lt!619026 () Unit!47386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47386)

(assert (=> b!1405434 (= lt!619026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619025 () SeekEntryResult!10706)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96095 (_ BitVec 32)) SeekEntryResult!10706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405434 (= lt!619025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46395 a!2901) j!112) mask!2840) (select (arr!46395 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405435 () Bool)

(declare-fun res!943649 () Bool)

(assert (=> b!1405435 (=> (not res!943649) (not e!795553))))

(assert (=> b!1405435 (= res!943649 (validKeyInArray!0 (select (arr!46395 a!2901) j!112)))))

(declare-fun b!1405436 () Bool)

(declare-fun res!943651 () Bool)

(assert (=> b!1405436 (=> (not res!943651) (not e!795553))))

(assert (=> b!1405436 (= res!943651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405437 () Bool)

(declare-fun res!943650 () Bool)

(assert (=> b!1405437 (=> (not res!943650) (not e!795553))))

(assert (=> b!1405437 (= res!943650 (and (= (size!46945 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46945 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46945 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120788 res!943653) b!1405437))

(assert (= (and b!1405437 res!943650) b!1405433))

(assert (= (and b!1405433 res!943648) b!1405435))

(assert (= (and b!1405435 res!943649) b!1405436))

(assert (= (and b!1405436 res!943651) b!1405432))

(assert (= (and b!1405432 res!943654) b!1405434))

(assert (= (and b!1405434 res!943652) b!1405431))

(declare-fun m!1294211 () Bool)

(assert (=> b!1405432 m!1294211))

(declare-fun m!1294213 () Bool)

(assert (=> b!1405434 m!1294213))

(declare-fun m!1294215 () Bool)

(assert (=> b!1405434 m!1294215))

(assert (=> b!1405434 m!1294213))

(declare-fun m!1294217 () Bool)

(assert (=> b!1405434 m!1294217))

(assert (=> b!1405434 m!1294215))

(assert (=> b!1405434 m!1294213))

(declare-fun m!1294219 () Bool)

(assert (=> b!1405434 m!1294219))

(declare-fun m!1294221 () Bool)

(assert (=> b!1405434 m!1294221))

(declare-fun m!1294223 () Bool)

(assert (=> b!1405433 m!1294223))

(assert (=> b!1405433 m!1294223))

(declare-fun m!1294225 () Bool)

(assert (=> b!1405433 m!1294225))

(declare-fun m!1294227 () Bool)

(assert (=> start!120788 m!1294227))

(declare-fun m!1294229 () Bool)

(assert (=> start!120788 m!1294229))

(declare-fun m!1294231 () Bool)

(assert (=> b!1405436 m!1294231))

(assert (=> b!1405431 m!1294213))

(assert (=> b!1405431 m!1294213))

(declare-fun m!1294233 () Bool)

(assert (=> b!1405431 m!1294233))

(assert (=> b!1405435 m!1294213))

(assert (=> b!1405435 m!1294213))

(declare-fun m!1294235 () Bool)

(assert (=> b!1405435 m!1294235))

(check-sat (not start!120788) (not b!1405435) (not b!1405434) (not b!1405436) (not b!1405432) (not b!1405433) (not b!1405431))
