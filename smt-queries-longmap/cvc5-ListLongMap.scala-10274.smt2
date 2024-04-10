; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120804 () Bool)

(assert start!120804)

(declare-fun res!943819 () Bool)

(declare-fun e!795624 () Bool)

(assert (=> start!120804 (=> (not res!943819) (not e!795624))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120804 (= res!943819 (validMask!0 mask!2840))))

(assert (=> start!120804 e!795624))

(assert (=> start!120804 true))

(declare-datatypes ((array!96111 0))(
  ( (array!96112 (arr!46403 (Array (_ BitVec 32) (_ BitVec 64))) (size!46953 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96111)

(declare-fun array_inv!35431 (array!96111) Bool)

(assert (=> start!120804 (array_inv!35431 a!2901)))

(declare-fun b!1405599 () Bool)

(declare-fun res!943816 () Bool)

(assert (=> b!1405599 (=> (not res!943816) (not e!795624))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405599 (= res!943816 (validKeyInArray!0 (select (arr!46403 a!2901) i!1037)))))

(declare-fun e!795626 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1405600 () Bool)

(declare-datatypes ((SeekEntryResult!10714 0))(
  ( (MissingZero!10714 (index!45233 (_ BitVec 32))) (Found!10714 (index!45234 (_ BitVec 32))) (Intermediate!10714 (undefined!11526 Bool) (index!45235 (_ BitVec 32)) (x!126849 (_ BitVec 32))) (Undefined!10714) (MissingVacant!10714 (index!45236 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96111 (_ BitVec 32)) SeekEntryResult!10714)

(assert (=> b!1405600 (= e!795626 (= (seekEntryOrOpen!0 (select (arr!46403 a!2901) j!112) a!2901 mask!2840) (Found!10714 j!112)))))

(declare-fun b!1405601 () Bool)

(declare-fun res!943820 () Bool)

(assert (=> b!1405601 (=> (not res!943820) (not e!795624))))

(assert (=> b!1405601 (= res!943820 (validKeyInArray!0 (select (arr!46403 a!2901) j!112)))))

(declare-fun b!1405602 () Bool)

(assert (=> b!1405602 (= e!795624 (not true))))

(assert (=> b!1405602 e!795626))

(declare-fun res!943821 () Bool)

(assert (=> b!1405602 (=> (not res!943821) (not e!795626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96111 (_ BitVec 32)) Bool)

(assert (=> b!1405602 (= res!943821 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47402 0))(
  ( (Unit!47403) )
))
(declare-fun lt!619073 () Unit!47402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47402)

(assert (=> b!1405602 (= lt!619073 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619074 () SeekEntryResult!10714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96111 (_ BitVec 32)) SeekEntryResult!10714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405602 (= lt!619074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46403 a!2901) j!112) mask!2840) (select (arr!46403 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405603 () Bool)

(declare-fun res!943817 () Bool)

(assert (=> b!1405603 (=> (not res!943817) (not e!795624))))

(declare-datatypes ((List!32922 0))(
  ( (Nil!32919) (Cons!32918 (h!34172 (_ BitVec 64)) (t!47616 List!32922)) )
))
(declare-fun arrayNoDuplicates!0 (array!96111 (_ BitVec 32) List!32922) Bool)

(assert (=> b!1405603 (= res!943817 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32919))))

(declare-fun b!1405604 () Bool)

(declare-fun res!943822 () Bool)

(assert (=> b!1405604 (=> (not res!943822) (not e!795624))))

(assert (=> b!1405604 (= res!943822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405605 () Bool)

(declare-fun res!943818 () Bool)

(assert (=> b!1405605 (=> (not res!943818) (not e!795624))))

(assert (=> b!1405605 (= res!943818 (and (= (size!46953 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46953 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46953 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120804 res!943819) b!1405605))

(assert (= (and b!1405605 res!943818) b!1405599))

(assert (= (and b!1405599 res!943816) b!1405601))

(assert (= (and b!1405601 res!943820) b!1405604))

(assert (= (and b!1405604 res!943822) b!1405603))

(assert (= (and b!1405603 res!943817) b!1405602))

(assert (= (and b!1405602 res!943821) b!1405600))

(declare-fun m!1294419 () Bool)

(assert (=> b!1405603 m!1294419))

(declare-fun m!1294421 () Bool)

(assert (=> start!120804 m!1294421))

(declare-fun m!1294423 () Bool)

(assert (=> start!120804 m!1294423))

(declare-fun m!1294425 () Bool)

(assert (=> b!1405601 m!1294425))

(assert (=> b!1405601 m!1294425))

(declare-fun m!1294427 () Bool)

(assert (=> b!1405601 m!1294427))

(declare-fun m!1294429 () Bool)

(assert (=> b!1405604 m!1294429))

(declare-fun m!1294431 () Bool)

(assert (=> b!1405599 m!1294431))

(assert (=> b!1405599 m!1294431))

(declare-fun m!1294433 () Bool)

(assert (=> b!1405599 m!1294433))

(assert (=> b!1405602 m!1294425))

(declare-fun m!1294435 () Bool)

(assert (=> b!1405602 m!1294435))

(assert (=> b!1405602 m!1294425))

(declare-fun m!1294437 () Bool)

(assert (=> b!1405602 m!1294437))

(assert (=> b!1405602 m!1294435))

(assert (=> b!1405602 m!1294425))

(declare-fun m!1294439 () Bool)

(assert (=> b!1405602 m!1294439))

(declare-fun m!1294441 () Bool)

(assert (=> b!1405602 m!1294441))

(assert (=> b!1405600 m!1294425))

(assert (=> b!1405600 m!1294425))

(declare-fun m!1294443 () Bool)

(assert (=> b!1405600 m!1294443))

(push 1)

(assert (not b!1405600))

(assert (not b!1405599))

(assert (not b!1405602))

(assert (not b!1405603))

(assert (not b!1405601))

(assert (not start!120804))

(assert (not b!1405604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

