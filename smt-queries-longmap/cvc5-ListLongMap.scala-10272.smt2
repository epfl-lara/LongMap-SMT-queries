; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120792 () Bool)

(assert start!120792)

(declare-fun b!1405473 () Bool)

(declare-fun res!943694 () Bool)

(declare-fun e!795571 () Bool)

(assert (=> b!1405473 (=> (not res!943694) (not e!795571))))

(declare-datatypes ((array!96099 0))(
  ( (array!96100 (arr!46397 (Array (_ BitVec 32) (_ BitVec 64))) (size!46947 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96099)

(declare-datatypes ((List!32916 0))(
  ( (Nil!32913) (Cons!32912 (h!34166 (_ BitVec 64)) (t!47610 List!32916)) )
))
(declare-fun arrayNoDuplicates!0 (array!96099 (_ BitVec 32) List!32916) Bool)

(assert (=> b!1405473 (= res!943694 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32913))))

(declare-fun b!1405474 () Bool)

(assert (=> b!1405474 (= e!795571 (not true))))

(declare-fun e!795572 () Bool)

(assert (=> b!1405474 e!795572))

(declare-fun res!943691 () Bool)

(assert (=> b!1405474 (=> (not res!943691) (not e!795572))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96099 (_ BitVec 32)) Bool)

(assert (=> b!1405474 (= res!943691 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47390 0))(
  ( (Unit!47391) )
))
(declare-fun lt!619038 () Unit!47390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47390)

(assert (=> b!1405474 (= lt!619038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10708 0))(
  ( (MissingZero!10708 (index!45209 (_ BitVec 32))) (Found!10708 (index!45210 (_ BitVec 32))) (Intermediate!10708 (undefined!11520 Bool) (index!45211 (_ BitVec 32)) (x!126827 (_ BitVec 32))) (Undefined!10708) (MissingVacant!10708 (index!45212 (_ BitVec 32))) )
))
(declare-fun lt!619037 () SeekEntryResult!10708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96099 (_ BitVec 32)) SeekEntryResult!10708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405474 (= lt!619037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46397 a!2901) j!112) mask!2840) (select (arr!46397 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405476 () Bool)

(declare-fun res!943692 () Bool)

(assert (=> b!1405476 (=> (not res!943692) (not e!795571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405476 (= res!943692 (validKeyInArray!0 (select (arr!46397 a!2901) j!112)))))

(declare-fun b!1405477 () Bool)

(declare-fun res!943695 () Bool)

(assert (=> b!1405477 (=> (not res!943695) (not e!795571))))

(assert (=> b!1405477 (= res!943695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405478 () Bool)

(declare-fun res!943690 () Bool)

(assert (=> b!1405478 (=> (not res!943690) (not e!795571))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405478 (= res!943690 (validKeyInArray!0 (select (arr!46397 a!2901) i!1037)))))

(declare-fun b!1405479 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96099 (_ BitVec 32)) SeekEntryResult!10708)

(assert (=> b!1405479 (= e!795572 (= (seekEntryOrOpen!0 (select (arr!46397 a!2901) j!112) a!2901 mask!2840) (Found!10708 j!112)))))

(declare-fun b!1405475 () Bool)

(declare-fun res!943696 () Bool)

(assert (=> b!1405475 (=> (not res!943696) (not e!795571))))

(assert (=> b!1405475 (= res!943696 (and (= (size!46947 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46947 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46947 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943693 () Bool)

(assert (=> start!120792 (=> (not res!943693) (not e!795571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120792 (= res!943693 (validMask!0 mask!2840))))

(assert (=> start!120792 e!795571))

(assert (=> start!120792 true))

(declare-fun array_inv!35425 (array!96099) Bool)

(assert (=> start!120792 (array_inv!35425 a!2901)))

(assert (= (and start!120792 res!943693) b!1405475))

(assert (= (and b!1405475 res!943696) b!1405478))

(assert (= (and b!1405478 res!943690) b!1405476))

(assert (= (and b!1405476 res!943692) b!1405477))

(assert (= (and b!1405477 res!943695) b!1405473))

(assert (= (and b!1405473 res!943694) b!1405474))

(assert (= (and b!1405474 res!943691) b!1405479))

(declare-fun m!1294263 () Bool)

(assert (=> b!1405477 m!1294263))

(declare-fun m!1294265 () Bool)

(assert (=> b!1405476 m!1294265))

(assert (=> b!1405476 m!1294265))

(declare-fun m!1294267 () Bool)

(assert (=> b!1405476 m!1294267))

(declare-fun m!1294269 () Bool)

(assert (=> b!1405478 m!1294269))

(assert (=> b!1405478 m!1294269))

(declare-fun m!1294271 () Bool)

(assert (=> b!1405478 m!1294271))

(declare-fun m!1294273 () Bool)

(assert (=> b!1405473 m!1294273))

(declare-fun m!1294275 () Bool)

(assert (=> start!120792 m!1294275))

(declare-fun m!1294277 () Bool)

(assert (=> start!120792 m!1294277))

(assert (=> b!1405479 m!1294265))

(assert (=> b!1405479 m!1294265))

(declare-fun m!1294279 () Bool)

(assert (=> b!1405479 m!1294279))

(assert (=> b!1405474 m!1294265))

(declare-fun m!1294281 () Bool)

(assert (=> b!1405474 m!1294281))

(assert (=> b!1405474 m!1294265))

(declare-fun m!1294283 () Bool)

(assert (=> b!1405474 m!1294283))

(assert (=> b!1405474 m!1294281))

(assert (=> b!1405474 m!1294265))

(declare-fun m!1294285 () Bool)

(assert (=> b!1405474 m!1294285))

(declare-fun m!1294287 () Bool)

(assert (=> b!1405474 m!1294287))

(push 1)

(assert (not b!1405474))

(assert (not b!1405476))

(assert (not b!1405478))

(assert (not b!1405477))

(assert (not start!120792))

(assert (not b!1405473))

(assert (not b!1405479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

