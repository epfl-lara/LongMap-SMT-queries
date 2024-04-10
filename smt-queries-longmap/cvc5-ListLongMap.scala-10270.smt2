; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120780 () Bool)

(assert start!120780)

(declare-fun b!1405347 () Bool)

(declare-fun res!943565 () Bool)

(declare-fun e!795517 () Bool)

(assert (=> b!1405347 (=> (not res!943565) (not e!795517))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96087 0))(
  ( (array!96088 (arr!46391 (Array (_ BitVec 32) (_ BitVec 64))) (size!46941 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96087)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405347 (= res!943565 (and (= (size!46941 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46941 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46941 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405348 () Bool)

(declare-fun e!795516 () Bool)

(declare-datatypes ((SeekEntryResult!10702 0))(
  ( (MissingZero!10702 (index!45185 (_ BitVec 32))) (Found!10702 (index!45186 (_ BitVec 32))) (Intermediate!10702 (undefined!11514 Bool) (index!45187 (_ BitVec 32)) (x!126805 (_ BitVec 32))) (Undefined!10702) (MissingVacant!10702 (index!45188 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96087 (_ BitVec 32)) SeekEntryResult!10702)

(assert (=> b!1405348 (= e!795516 (= (seekEntryOrOpen!0 (select (arr!46391 a!2901) j!112) a!2901 mask!2840) (Found!10702 j!112)))))

(declare-fun b!1405349 () Bool)

(declare-fun res!943567 () Bool)

(assert (=> b!1405349 (=> (not res!943567) (not e!795517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405349 (= res!943567 (validKeyInArray!0 (select (arr!46391 a!2901) j!112)))))

(declare-fun b!1405350 () Bool)

(assert (=> b!1405350 (= e!795517 (not true))))

(assert (=> b!1405350 e!795516))

(declare-fun res!943568 () Bool)

(assert (=> b!1405350 (=> (not res!943568) (not e!795516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96087 (_ BitVec 32)) Bool)

(assert (=> b!1405350 (= res!943568 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47378 0))(
  ( (Unit!47379) )
))
(declare-fun lt!619001 () Unit!47378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47378)

(assert (=> b!1405350 (= lt!619001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619002 () SeekEntryResult!10702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96087 (_ BitVec 32)) SeekEntryResult!10702)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405350 (= lt!619002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46391 a!2901) j!112) mask!2840) (select (arr!46391 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405351 () Bool)

(declare-fun res!943570 () Bool)

(assert (=> b!1405351 (=> (not res!943570) (not e!795517))))

(assert (=> b!1405351 (= res!943570 (validKeyInArray!0 (select (arr!46391 a!2901) i!1037)))))

(declare-fun b!1405352 () Bool)

(declare-fun res!943564 () Bool)

(assert (=> b!1405352 (=> (not res!943564) (not e!795517))))

(declare-datatypes ((List!32910 0))(
  ( (Nil!32907) (Cons!32906 (h!34160 (_ BitVec 64)) (t!47604 List!32910)) )
))
(declare-fun arrayNoDuplicates!0 (array!96087 (_ BitVec 32) List!32910) Bool)

(assert (=> b!1405352 (= res!943564 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32907))))

(declare-fun res!943566 () Bool)

(assert (=> start!120780 (=> (not res!943566) (not e!795517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120780 (= res!943566 (validMask!0 mask!2840))))

(assert (=> start!120780 e!795517))

(assert (=> start!120780 true))

(declare-fun array_inv!35419 (array!96087) Bool)

(assert (=> start!120780 (array_inv!35419 a!2901)))

(declare-fun b!1405353 () Bool)

(declare-fun res!943569 () Bool)

(assert (=> b!1405353 (=> (not res!943569) (not e!795517))))

(assert (=> b!1405353 (= res!943569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120780 res!943566) b!1405347))

(assert (= (and b!1405347 res!943565) b!1405351))

(assert (= (and b!1405351 res!943570) b!1405349))

(assert (= (and b!1405349 res!943567) b!1405353))

(assert (= (and b!1405353 res!943569) b!1405352))

(assert (= (and b!1405352 res!943564) b!1405350))

(assert (= (and b!1405350 res!943568) b!1405348))

(declare-fun m!1294107 () Bool)

(assert (=> b!1405353 m!1294107))

(declare-fun m!1294109 () Bool)

(assert (=> b!1405350 m!1294109))

(declare-fun m!1294111 () Bool)

(assert (=> b!1405350 m!1294111))

(assert (=> b!1405350 m!1294109))

(declare-fun m!1294113 () Bool)

(assert (=> b!1405350 m!1294113))

(assert (=> b!1405350 m!1294111))

(assert (=> b!1405350 m!1294109))

(declare-fun m!1294115 () Bool)

(assert (=> b!1405350 m!1294115))

(declare-fun m!1294117 () Bool)

(assert (=> b!1405350 m!1294117))

(assert (=> b!1405349 m!1294109))

(assert (=> b!1405349 m!1294109))

(declare-fun m!1294119 () Bool)

(assert (=> b!1405349 m!1294119))

(assert (=> b!1405348 m!1294109))

(assert (=> b!1405348 m!1294109))

(declare-fun m!1294121 () Bool)

(assert (=> b!1405348 m!1294121))

(declare-fun m!1294123 () Bool)

(assert (=> b!1405352 m!1294123))

(declare-fun m!1294125 () Bool)

(assert (=> start!120780 m!1294125))

(declare-fun m!1294127 () Bool)

(assert (=> start!120780 m!1294127))

(declare-fun m!1294129 () Bool)

(assert (=> b!1405351 m!1294129))

(assert (=> b!1405351 m!1294129))

(declare-fun m!1294131 () Bool)

(assert (=> b!1405351 m!1294131))

(push 1)

(assert (not b!1405348))

(assert (not start!120780))

(assert (not b!1405350))

(assert (not b!1405352))

(assert (not b!1405353))

(assert (not b!1405349))

(assert (not b!1405351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

