; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121182 () Bool)

(assert start!121182)

(declare-fun res!946757 () Bool)

(declare-fun e!797391 () Bool)

(assert (=> start!121182 (=> (not res!946757) (not e!797391))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121182 (= res!946757 (validMask!0 mask!2840))))

(assert (=> start!121182 e!797391))

(assert (=> start!121182 true))

(declare-datatypes ((array!96336 0))(
  ( (array!96337 (arr!46511 (Array (_ BitVec 32) (_ BitVec 64))) (size!47061 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96336)

(declare-fun array_inv!35539 (array!96336) Bool)

(assert (=> start!121182 (array_inv!35539 a!2901)))

(declare-fun b!1409030 () Bool)

(declare-fun e!797393 () Bool)

(assert (=> b!1409030 (= e!797391 (not e!797393))))

(declare-fun res!946759 () Bool)

(assert (=> b!1409030 (=> res!946759 e!797393)))

(declare-datatypes ((SeekEntryResult!10822 0))(
  ( (MissingZero!10822 (index!45665 (_ BitVec 32))) (Found!10822 (index!45666 (_ BitVec 32))) (Intermediate!10822 (undefined!11634 Bool) (index!45667 (_ BitVec 32)) (x!127263 (_ BitVec 32))) (Undefined!10822) (MissingVacant!10822 (index!45668 (_ BitVec 32))) )
))
(declare-fun lt!620570 () SeekEntryResult!10822)

(assert (=> b!1409030 (= res!946759 (or (not (is-Intermediate!10822 lt!620570)) (undefined!11634 lt!620570)))))

(declare-fun e!797392 () Bool)

(assert (=> b!1409030 e!797392))

(declare-fun res!946756 () Bool)

(assert (=> b!1409030 (=> (not res!946756) (not e!797392))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96336 (_ BitVec 32)) Bool)

(assert (=> b!1409030 (= res!946756 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47618 0))(
  ( (Unit!47619) )
))
(declare-fun lt!620569 () Unit!47618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47618)

(assert (=> b!1409030 (= lt!620569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96336 (_ BitVec 32)) SeekEntryResult!10822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409030 (= lt!620570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46511 a!2901) j!112) mask!2840) (select (arr!46511 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409031 () Bool)

(declare-fun res!946754 () Bool)

(assert (=> b!1409031 (=> (not res!946754) (not e!797391))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409031 (= res!946754 (validKeyInArray!0 (select (arr!46511 a!2901) i!1037)))))

(declare-fun b!1409032 () Bool)

(assert (=> b!1409032 (= e!797393 true)))

(declare-fun lt!620571 () SeekEntryResult!10822)

(assert (=> b!1409032 (= lt!620571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46511 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46511 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96337 (store (arr!46511 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)) mask!2840))))

(declare-fun b!1409033 () Bool)

(declare-fun res!946752 () Bool)

(assert (=> b!1409033 (=> (not res!946752) (not e!797391))))

(assert (=> b!1409033 (= res!946752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409034 () Bool)

(declare-fun res!946753 () Bool)

(assert (=> b!1409034 (=> (not res!946753) (not e!797391))))

(assert (=> b!1409034 (= res!946753 (validKeyInArray!0 (select (arr!46511 a!2901) j!112)))))

(declare-fun b!1409035 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96336 (_ BitVec 32)) SeekEntryResult!10822)

(assert (=> b!1409035 (= e!797392 (= (seekEntryOrOpen!0 (select (arr!46511 a!2901) j!112) a!2901 mask!2840) (Found!10822 j!112)))))

(declare-fun b!1409036 () Bool)

(declare-fun res!946758 () Bool)

(assert (=> b!1409036 (=> (not res!946758) (not e!797391))))

(assert (=> b!1409036 (= res!946758 (and (= (size!47061 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47061 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47061 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409037 () Bool)

(declare-fun res!946755 () Bool)

(assert (=> b!1409037 (=> (not res!946755) (not e!797391))))

(declare-datatypes ((List!33030 0))(
  ( (Nil!33027) (Cons!33026 (h!34289 (_ BitVec 64)) (t!47724 List!33030)) )
))
(declare-fun arrayNoDuplicates!0 (array!96336 (_ BitVec 32) List!33030) Bool)

(assert (=> b!1409037 (= res!946755 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33027))))

(assert (= (and start!121182 res!946757) b!1409036))

(assert (= (and b!1409036 res!946758) b!1409031))

(assert (= (and b!1409031 res!946754) b!1409034))

(assert (= (and b!1409034 res!946753) b!1409033))

(assert (= (and b!1409033 res!946752) b!1409037))

(assert (= (and b!1409037 res!946755) b!1409030))

(assert (= (and b!1409030 res!946756) b!1409035))

(assert (= (and b!1409030 (not res!946759)) b!1409032))

(declare-fun m!1298577 () Bool)

(assert (=> b!1409035 m!1298577))

(assert (=> b!1409035 m!1298577))

(declare-fun m!1298579 () Bool)

(assert (=> b!1409035 m!1298579))

(declare-fun m!1298581 () Bool)

(assert (=> b!1409032 m!1298581))

(declare-fun m!1298583 () Bool)

(assert (=> b!1409032 m!1298583))

(assert (=> b!1409032 m!1298583))

(declare-fun m!1298585 () Bool)

(assert (=> b!1409032 m!1298585))

(assert (=> b!1409032 m!1298585))

(assert (=> b!1409032 m!1298583))

(declare-fun m!1298587 () Bool)

(assert (=> b!1409032 m!1298587))

(declare-fun m!1298589 () Bool)

(assert (=> start!121182 m!1298589))

(declare-fun m!1298591 () Bool)

(assert (=> start!121182 m!1298591))

(declare-fun m!1298593 () Bool)

(assert (=> b!1409037 m!1298593))

(assert (=> b!1409030 m!1298577))

(declare-fun m!1298595 () Bool)

(assert (=> b!1409030 m!1298595))

(assert (=> b!1409030 m!1298577))

(declare-fun m!1298597 () Bool)

(assert (=> b!1409030 m!1298597))

(assert (=> b!1409030 m!1298595))

(assert (=> b!1409030 m!1298577))

(declare-fun m!1298599 () Bool)

(assert (=> b!1409030 m!1298599))

(declare-fun m!1298601 () Bool)

(assert (=> b!1409030 m!1298601))

(assert (=> b!1409034 m!1298577))

(assert (=> b!1409034 m!1298577))

(declare-fun m!1298603 () Bool)

(assert (=> b!1409034 m!1298603))

(declare-fun m!1298605 () Bool)

(assert (=> b!1409031 m!1298605))

(assert (=> b!1409031 m!1298605))

(declare-fun m!1298607 () Bool)

(assert (=> b!1409031 m!1298607))

(declare-fun m!1298609 () Bool)

(assert (=> b!1409033 m!1298609))

(push 1)

(assert (not b!1409035))

(assert (not b!1409031))

(assert (not b!1409032))

(assert (not b!1409037))

(assert (not b!1409033))

(assert (not b!1409030))

(assert (not start!121182))

(assert (not b!1409034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

