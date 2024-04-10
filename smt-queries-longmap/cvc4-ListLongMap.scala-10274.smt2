; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120808 () Bool)

(assert start!120808)

(declare-fun b!1405641 () Bool)

(declare-fun res!943862 () Bool)

(declare-fun e!795642 () Bool)

(assert (=> b!1405641 (=> (not res!943862) (not e!795642))))

(declare-datatypes ((array!96115 0))(
  ( (array!96116 (arr!46405 (Array (_ BitVec 32) (_ BitVec 64))) (size!46955 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96115)

(declare-datatypes ((List!32924 0))(
  ( (Nil!32921) (Cons!32920 (h!34174 (_ BitVec 64)) (t!47618 List!32924)) )
))
(declare-fun arrayNoDuplicates!0 (array!96115 (_ BitVec 32) List!32924) Bool)

(assert (=> b!1405641 (= res!943862 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32921))))

(declare-fun b!1405642 () Bool)

(declare-fun res!943860 () Bool)

(assert (=> b!1405642 (=> (not res!943860) (not e!795642))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405642 (= res!943860 (validKeyInArray!0 (select (arr!46405 a!2901) i!1037)))))

(declare-fun b!1405643 () Bool)

(declare-fun res!943863 () Bool)

(assert (=> b!1405643 (=> (not res!943863) (not e!795642))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405643 (= res!943863 (and (= (size!46955 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46955 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46955 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405644 () Bool)

(declare-fun res!943861 () Bool)

(assert (=> b!1405644 (=> (not res!943861) (not e!795642))))

(assert (=> b!1405644 (= res!943861 (validKeyInArray!0 (select (arr!46405 a!2901) j!112)))))

(declare-fun b!1405645 () Bool)

(assert (=> b!1405645 (= e!795642 (not true))))

(declare-fun e!795643 () Bool)

(assert (=> b!1405645 e!795643))

(declare-fun res!943864 () Bool)

(assert (=> b!1405645 (=> (not res!943864) (not e!795643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96115 (_ BitVec 32)) Bool)

(assert (=> b!1405645 (= res!943864 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47406 0))(
  ( (Unit!47407) )
))
(declare-fun lt!619085 () Unit!47406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47406)

(assert (=> b!1405645 (= lt!619085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10716 0))(
  ( (MissingZero!10716 (index!45241 (_ BitVec 32))) (Found!10716 (index!45242 (_ BitVec 32))) (Intermediate!10716 (undefined!11528 Bool) (index!45243 (_ BitVec 32)) (x!126851 (_ BitVec 32))) (Undefined!10716) (MissingVacant!10716 (index!45244 (_ BitVec 32))) )
))
(declare-fun lt!619086 () SeekEntryResult!10716)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96115 (_ BitVec 32)) SeekEntryResult!10716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405645 (= lt!619086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46405 a!2901) j!112) mask!2840) (select (arr!46405 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405646 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96115 (_ BitVec 32)) SeekEntryResult!10716)

(assert (=> b!1405646 (= e!795643 (= (seekEntryOrOpen!0 (select (arr!46405 a!2901) j!112) a!2901 mask!2840) (Found!10716 j!112)))))

(declare-fun b!1405647 () Bool)

(declare-fun res!943858 () Bool)

(assert (=> b!1405647 (=> (not res!943858) (not e!795642))))

(assert (=> b!1405647 (= res!943858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943859 () Bool)

(assert (=> start!120808 (=> (not res!943859) (not e!795642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120808 (= res!943859 (validMask!0 mask!2840))))

(assert (=> start!120808 e!795642))

(assert (=> start!120808 true))

(declare-fun array_inv!35433 (array!96115) Bool)

(assert (=> start!120808 (array_inv!35433 a!2901)))

(assert (= (and start!120808 res!943859) b!1405643))

(assert (= (and b!1405643 res!943863) b!1405642))

(assert (= (and b!1405642 res!943860) b!1405644))

(assert (= (and b!1405644 res!943861) b!1405647))

(assert (= (and b!1405647 res!943858) b!1405641))

(assert (= (and b!1405641 res!943862) b!1405645))

(assert (= (and b!1405645 res!943864) b!1405646))

(declare-fun m!1294471 () Bool)

(assert (=> b!1405646 m!1294471))

(assert (=> b!1405646 m!1294471))

(declare-fun m!1294473 () Bool)

(assert (=> b!1405646 m!1294473))

(declare-fun m!1294475 () Bool)

(assert (=> start!120808 m!1294475))

(declare-fun m!1294477 () Bool)

(assert (=> start!120808 m!1294477))

(assert (=> b!1405645 m!1294471))

(declare-fun m!1294479 () Bool)

(assert (=> b!1405645 m!1294479))

(assert (=> b!1405645 m!1294471))

(declare-fun m!1294481 () Bool)

(assert (=> b!1405645 m!1294481))

(assert (=> b!1405645 m!1294479))

(assert (=> b!1405645 m!1294471))

(declare-fun m!1294483 () Bool)

(assert (=> b!1405645 m!1294483))

(declare-fun m!1294485 () Bool)

(assert (=> b!1405645 m!1294485))

(declare-fun m!1294487 () Bool)

(assert (=> b!1405641 m!1294487))

(declare-fun m!1294489 () Bool)

(assert (=> b!1405647 m!1294489))

(assert (=> b!1405644 m!1294471))

(assert (=> b!1405644 m!1294471))

(declare-fun m!1294491 () Bool)

(assert (=> b!1405644 m!1294491))

(declare-fun m!1294493 () Bool)

(assert (=> b!1405642 m!1294493))

(assert (=> b!1405642 m!1294493))

(declare-fun m!1294495 () Bool)

(assert (=> b!1405642 m!1294495))

(push 1)

(assert (not b!1405641))

(assert (not b!1405645))

(assert (not b!1405642))

(assert (not b!1405646))

(assert (not b!1405644))

(assert (not b!1405647))

(assert (not start!120808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

