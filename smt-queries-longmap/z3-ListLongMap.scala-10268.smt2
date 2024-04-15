; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120764 () Bool)

(assert start!120764)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96024 0))(
  ( (array!96025 (arr!46360 (Array (_ BitVec 32) (_ BitVec 64))) (size!46912 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96024)

(declare-fun b!1405140 () Bool)

(declare-fun e!795423 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10697 0))(
  ( (MissingZero!10697 (index!45165 (_ BitVec 32))) (Found!10697 (index!45166 (_ BitVec 32))) (Intermediate!10697 (undefined!11509 Bool) (index!45167 (_ BitVec 32)) (x!126781 (_ BitVec 32))) (Undefined!10697) (MissingVacant!10697 (index!45168 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96024 (_ BitVec 32)) SeekEntryResult!10697)

(assert (=> b!1405140 (= e!795423 (= (seekEntryOrOpen!0 (select (arr!46360 a!2901) j!112) a!2901 mask!2840) (Found!10697 j!112)))))

(declare-fun b!1405141 () Bool)

(declare-fun res!943414 () Bool)

(declare-fun e!795424 () Bool)

(assert (=> b!1405141 (=> (not res!943414) (not e!795424))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405141 (= res!943414 (validKeyInArray!0 (select (arr!46360 a!2901) i!1037)))))

(declare-fun b!1405142 () Bool)

(declare-fun res!943408 () Bool)

(assert (=> b!1405142 (=> (not res!943408) (not e!795424))))

(declare-datatypes ((List!32957 0))(
  ( (Nil!32954) (Cons!32953 (h!34207 (_ BitVec 64)) (t!47643 List!32957)) )
))
(declare-fun arrayNoDuplicates!0 (array!96024 (_ BitVec 32) List!32957) Bool)

(assert (=> b!1405142 (= res!943408 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32954))))

(declare-fun b!1405143 () Bool)

(declare-fun res!943413 () Bool)

(assert (=> b!1405143 (=> (not res!943413) (not e!795424))))

(assert (=> b!1405143 (= res!943413 (and (= (size!46912 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46912 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46912 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943412 () Bool)

(assert (=> start!120764 (=> (not res!943412) (not e!795424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120764 (= res!943412 (validMask!0 mask!2840))))

(assert (=> start!120764 e!795424))

(assert (=> start!120764 true))

(declare-fun array_inv!35593 (array!96024) Bool)

(assert (=> start!120764 (array_inv!35593 a!2901)))

(declare-fun b!1405144 () Bool)

(assert (=> b!1405144 (= e!795424 (not true))))

(assert (=> b!1405144 e!795423))

(declare-fun res!943411 () Bool)

(assert (=> b!1405144 (=> (not res!943411) (not e!795423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96024 (_ BitVec 32)) Bool)

(assert (=> b!1405144 (= res!943411 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47211 0))(
  ( (Unit!47212) )
))
(declare-fun lt!618775 () Unit!47211)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47211)

(assert (=> b!1405144 (= lt!618775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618776 () SeekEntryResult!10697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96024 (_ BitVec 32)) SeekEntryResult!10697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405144 (= lt!618776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46360 a!2901) j!112) mask!2840) (select (arr!46360 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405145 () Bool)

(declare-fun res!943410 () Bool)

(assert (=> b!1405145 (=> (not res!943410) (not e!795424))))

(assert (=> b!1405145 (= res!943410 (validKeyInArray!0 (select (arr!46360 a!2901) j!112)))))

(declare-fun b!1405146 () Bool)

(declare-fun res!943409 () Bool)

(assert (=> b!1405146 (=> (not res!943409) (not e!795424))))

(assert (=> b!1405146 (= res!943409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120764 res!943412) b!1405143))

(assert (= (and b!1405143 res!943413) b!1405141))

(assert (= (and b!1405141 res!943414) b!1405145))

(assert (= (and b!1405145 res!943410) b!1405146))

(assert (= (and b!1405146 res!943409) b!1405142))

(assert (= (and b!1405142 res!943408) b!1405144))

(assert (= (and b!1405144 res!943411) b!1405140))

(declare-fun m!1293415 () Bool)

(assert (=> b!1405140 m!1293415))

(assert (=> b!1405140 m!1293415))

(declare-fun m!1293417 () Bool)

(assert (=> b!1405140 m!1293417))

(declare-fun m!1293419 () Bool)

(assert (=> b!1405142 m!1293419))

(assert (=> b!1405144 m!1293415))

(declare-fun m!1293421 () Bool)

(assert (=> b!1405144 m!1293421))

(assert (=> b!1405144 m!1293415))

(declare-fun m!1293423 () Bool)

(assert (=> b!1405144 m!1293423))

(assert (=> b!1405144 m!1293421))

(assert (=> b!1405144 m!1293415))

(declare-fun m!1293425 () Bool)

(assert (=> b!1405144 m!1293425))

(declare-fun m!1293427 () Bool)

(assert (=> b!1405144 m!1293427))

(declare-fun m!1293429 () Bool)

(assert (=> start!120764 m!1293429))

(declare-fun m!1293431 () Bool)

(assert (=> start!120764 m!1293431))

(assert (=> b!1405145 m!1293415))

(assert (=> b!1405145 m!1293415))

(declare-fun m!1293433 () Bool)

(assert (=> b!1405145 m!1293433))

(declare-fun m!1293435 () Bool)

(assert (=> b!1405146 m!1293435))

(declare-fun m!1293437 () Bool)

(assert (=> b!1405141 m!1293437))

(assert (=> b!1405141 m!1293437))

(declare-fun m!1293439 () Bool)

(assert (=> b!1405141 m!1293439))

(check-sat (not b!1405140) (not b!1405141) (not b!1405144) (not b!1405142) (not b!1405145) (not start!120764) (not b!1405146))
(check-sat)
