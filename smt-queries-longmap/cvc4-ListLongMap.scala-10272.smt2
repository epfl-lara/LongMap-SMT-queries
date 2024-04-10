; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120796 () Bool)

(assert start!120796)

(declare-fun b!1405515 () Bool)

(declare-fun res!943735 () Bool)

(declare-fun e!795590 () Bool)

(assert (=> b!1405515 (=> (not res!943735) (not e!795590))))

(declare-datatypes ((array!96103 0))(
  ( (array!96104 (arr!46399 (Array (_ BitVec 32) (_ BitVec 64))) (size!46949 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96103)

(declare-datatypes ((List!32918 0))(
  ( (Nil!32915) (Cons!32914 (h!34168 (_ BitVec 64)) (t!47612 List!32918)) )
))
(declare-fun arrayNoDuplicates!0 (array!96103 (_ BitVec 32) List!32918) Bool)

(assert (=> b!1405515 (= res!943735 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32915))))

(declare-fun b!1405516 () Bool)

(declare-fun res!943736 () Bool)

(assert (=> b!1405516 (=> (not res!943736) (not e!795590))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405516 (= res!943736 (and (= (size!46949 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46949 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46949 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405517 () Bool)

(declare-fun res!943738 () Bool)

(assert (=> b!1405517 (=> (not res!943738) (not e!795590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405517 (= res!943738 (validKeyInArray!0 (select (arr!46399 a!2901) j!112)))))

(declare-fun res!943733 () Bool)

(assert (=> start!120796 (=> (not res!943733) (not e!795590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120796 (= res!943733 (validMask!0 mask!2840))))

(assert (=> start!120796 e!795590))

(assert (=> start!120796 true))

(declare-fun array_inv!35427 (array!96103) Bool)

(assert (=> start!120796 (array_inv!35427 a!2901)))

(declare-fun b!1405518 () Bool)

(assert (=> b!1405518 (= e!795590 (not true))))

(declare-fun e!795588 () Bool)

(assert (=> b!1405518 e!795588))

(declare-fun res!943732 () Bool)

(assert (=> b!1405518 (=> (not res!943732) (not e!795588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96103 (_ BitVec 32)) Bool)

(assert (=> b!1405518 (= res!943732 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47394 0))(
  ( (Unit!47395) )
))
(declare-fun lt!619050 () Unit!47394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47394)

(assert (=> b!1405518 (= lt!619050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10710 0))(
  ( (MissingZero!10710 (index!45217 (_ BitVec 32))) (Found!10710 (index!45218 (_ BitVec 32))) (Intermediate!10710 (undefined!11522 Bool) (index!45219 (_ BitVec 32)) (x!126829 (_ BitVec 32))) (Undefined!10710) (MissingVacant!10710 (index!45220 (_ BitVec 32))) )
))
(declare-fun lt!619049 () SeekEntryResult!10710)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96103 (_ BitVec 32)) SeekEntryResult!10710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405518 (= lt!619049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46399 a!2901) j!112) mask!2840) (select (arr!46399 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405519 () Bool)

(declare-fun res!943734 () Bool)

(assert (=> b!1405519 (=> (not res!943734) (not e!795590))))

(assert (=> b!1405519 (= res!943734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405520 () Bool)

(declare-fun res!943737 () Bool)

(assert (=> b!1405520 (=> (not res!943737) (not e!795590))))

(assert (=> b!1405520 (= res!943737 (validKeyInArray!0 (select (arr!46399 a!2901) i!1037)))))

(declare-fun b!1405521 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96103 (_ BitVec 32)) SeekEntryResult!10710)

(assert (=> b!1405521 (= e!795588 (= (seekEntryOrOpen!0 (select (arr!46399 a!2901) j!112) a!2901 mask!2840) (Found!10710 j!112)))))

(assert (= (and start!120796 res!943733) b!1405516))

(assert (= (and b!1405516 res!943736) b!1405520))

(assert (= (and b!1405520 res!943737) b!1405517))

(assert (= (and b!1405517 res!943738) b!1405519))

(assert (= (and b!1405519 res!943734) b!1405515))

(assert (= (and b!1405515 res!943735) b!1405518))

(assert (= (and b!1405518 res!943732) b!1405521))

(declare-fun m!1294315 () Bool)

(assert (=> b!1405521 m!1294315))

(assert (=> b!1405521 m!1294315))

(declare-fun m!1294317 () Bool)

(assert (=> b!1405521 m!1294317))

(declare-fun m!1294319 () Bool)

(assert (=> b!1405519 m!1294319))

(declare-fun m!1294321 () Bool)

(assert (=> b!1405520 m!1294321))

(assert (=> b!1405520 m!1294321))

(declare-fun m!1294323 () Bool)

(assert (=> b!1405520 m!1294323))

(declare-fun m!1294325 () Bool)

(assert (=> start!120796 m!1294325))

(declare-fun m!1294327 () Bool)

(assert (=> start!120796 m!1294327))

(assert (=> b!1405518 m!1294315))

(declare-fun m!1294329 () Bool)

(assert (=> b!1405518 m!1294329))

(assert (=> b!1405518 m!1294315))

(declare-fun m!1294331 () Bool)

(assert (=> b!1405518 m!1294331))

(assert (=> b!1405518 m!1294329))

(assert (=> b!1405518 m!1294315))

(declare-fun m!1294333 () Bool)

(assert (=> b!1405518 m!1294333))

(declare-fun m!1294335 () Bool)

(assert (=> b!1405518 m!1294335))

(assert (=> b!1405517 m!1294315))

(assert (=> b!1405517 m!1294315))

(declare-fun m!1294337 () Bool)

(assert (=> b!1405517 m!1294337))

(declare-fun m!1294339 () Bool)

(assert (=> b!1405515 m!1294339))

(push 1)

(assert (not b!1405519))

(assert (not b!1405518))

(assert (not b!1405515))

(assert (not b!1405517))

(assert (not start!120796))

(assert (not b!1405521))

(assert (not b!1405520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

