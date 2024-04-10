; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120786 () Bool)

(assert start!120786)

(declare-fun b!1405410 () Bool)

(declare-fun e!795544 () Bool)

(assert (=> b!1405410 (= e!795544 (not true))))

(declare-fun e!795543 () Bool)

(assert (=> b!1405410 e!795543))

(declare-fun res!943631 () Bool)

(assert (=> b!1405410 (=> (not res!943631) (not e!795543))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96093 0))(
  ( (array!96094 (arr!46394 (Array (_ BitVec 32) (_ BitVec 64))) (size!46944 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96093)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96093 (_ BitVec 32)) Bool)

(assert (=> b!1405410 (= res!943631 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47384 0))(
  ( (Unit!47385) )
))
(declare-fun lt!619020 () Unit!47384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47384)

(assert (=> b!1405410 (= lt!619020 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10705 0))(
  ( (MissingZero!10705 (index!45197 (_ BitVec 32))) (Found!10705 (index!45198 (_ BitVec 32))) (Intermediate!10705 (undefined!11517 Bool) (index!45199 (_ BitVec 32)) (x!126816 (_ BitVec 32))) (Undefined!10705) (MissingVacant!10705 (index!45200 (_ BitVec 32))) )
))
(declare-fun lt!619019 () SeekEntryResult!10705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96093 (_ BitVec 32)) SeekEntryResult!10705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405410 (= lt!619019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46394 a!2901) j!112) mask!2840) (select (arr!46394 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943630 () Bool)

(assert (=> start!120786 (=> (not res!943630) (not e!795544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120786 (= res!943630 (validMask!0 mask!2840))))

(assert (=> start!120786 e!795544))

(assert (=> start!120786 true))

(declare-fun array_inv!35422 (array!96093) Bool)

(assert (=> start!120786 (array_inv!35422 a!2901)))

(declare-fun b!1405411 () Bool)

(declare-fun res!943633 () Bool)

(assert (=> b!1405411 (=> (not res!943633) (not e!795544))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405411 (= res!943633 (validKeyInArray!0 (select (arr!46394 a!2901) i!1037)))))

(declare-fun b!1405412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96093 (_ BitVec 32)) SeekEntryResult!10705)

(assert (=> b!1405412 (= e!795543 (= (seekEntryOrOpen!0 (select (arr!46394 a!2901) j!112) a!2901 mask!2840) (Found!10705 j!112)))))

(declare-fun b!1405413 () Bool)

(declare-fun res!943629 () Bool)

(assert (=> b!1405413 (=> (not res!943629) (not e!795544))))

(declare-datatypes ((List!32913 0))(
  ( (Nil!32910) (Cons!32909 (h!34163 (_ BitVec 64)) (t!47607 List!32913)) )
))
(declare-fun arrayNoDuplicates!0 (array!96093 (_ BitVec 32) List!32913) Bool)

(assert (=> b!1405413 (= res!943629 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32910))))

(declare-fun b!1405414 () Bool)

(declare-fun res!943632 () Bool)

(assert (=> b!1405414 (=> (not res!943632) (not e!795544))))

(assert (=> b!1405414 (= res!943632 (validKeyInArray!0 (select (arr!46394 a!2901) j!112)))))

(declare-fun b!1405415 () Bool)

(declare-fun res!943627 () Bool)

(assert (=> b!1405415 (=> (not res!943627) (not e!795544))))

(assert (=> b!1405415 (= res!943627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405416 () Bool)

(declare-fun res!943628 () Bool)

(assert (=> b!1405416 (=> (not res!943628) (not e!795544))))

(assert (=> b!1405416 (= res!943628 (and (= (size!46944 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46944 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46944 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120786 res!943630) b!1405416))

(assert (= (and b!1405416 res!943628) b!1405411))

(assert (= (and b!1405411 res!943633) b!1405414))

(assert (= (and b!1405414 res!943632) b!1405415))

(assert (= (and b!1405415 res!943627) b!1405413))

(assert (= (and b!1405413 res!943629) b!1405410))

(assert (= (and b!1405410 res!943631) b!1405412))

(declare-fun m!1294185 () Bool)

(assert (=> start!120786 m!1294185))

(declare-fun m!1294187 () Bool)

(assert (=> start!120786 m!1294187))

(declare-fun m!1294189 () Bool)

(assert (=> b!1405412 m!1294189))

(assert (=> b!1405412 m!1294189))

(declare-fun m!1294191 () Bool)

(assert (=> b!1405412 m!1294191))

(assert (=> b!1405410 m!1294189))

(declare-fun m!1294193 () Bool)

(assert (=> b!1405410 m!1294193))

(assert (=> b!1405410 m!1294189))

(declare-fun m!1294195 () Bool)

(assert (=> b!1405410 m!1294195))

(assert (=> b!1405410 m!1294193))

(assert (=> b!1405410 m!1294189))

(declare-fun m!1294197 () Bool)

(assert (=> b!1405410 m!1294197))

(declare-fun m!1294199 () Bool)

(assert (=> b!1405410 m!1294199))

(declare-fun m!1294201 () Bool)

(assert (=> b!1405415 m!1294201))

(declare-fun m!1294203 () Bool)

(assert (=> b!1405413 m!1294203))

(assert (=> b!1405414 m!1294189))

(assert (=> b!1405414 m!1294189))

(declare-fun m!1294205 () Bool)

(assert (=> b!1405414 m!1294205))

(declare-fun m!1294207 () Bool)

(assert (=> b!1405411 m!1294207))

(assert (=> b!1405411 m!1294207))

(declare-fun m!1294209 () Bool)

(assert (=> b!1405411 m!1294209))

(push 1)

(assert (not b!1405410))

(assert (not b!1405414))

(assert (not b!1405415))

(assert (not b!1405413))

(assert (not b!1405411))

(assert (not start!120786))

(assert (not b!1405412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

