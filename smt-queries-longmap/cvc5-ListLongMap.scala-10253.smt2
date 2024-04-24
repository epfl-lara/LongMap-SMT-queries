; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120762 () Bool)

(assert start!120762)

(declare-fun e!795607 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96093 0))(
  ( (array!96094 (arr!46395 (Array (_ BitVec 32) (_ BitVec 64))) (size!46946 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96093)

(declare-fun b!1405092 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10615 0))(
  ( (MissingZero!10615 (index!44837 (_ BitVec 32))) (Found!10615 (index!44838 (_ BitVec 32))) (Intermediate!10615 (undefined!11427 Bool) (index!44839 (_ BitVec 32)) (x!126589 (_ BitVec 32))) (Undefined!10615) (MissingVacant!10615 (index!44840 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96093 (_ BitVec 32)) SeekEntryResult!10615)

(assert (=> b!1405092 (= e!795607 (= (seekEntryOrOpen!0 (select (arr!46395 a!2901) j!112) a!2901 mask!2840) (Found!10615 j!112)))))

(declare-fun b!1405093 () Bool)

(declare-fun res!942924 () Bool)

(declare-fun e!795606 () Bool)

(assert (=> b!1405093 (=> (not res!942924) (not e!795606))))

(declare-datatypes ((List!32901 0))(
  ( (Nil!32898) (Cons!32897 (h!34153 (_ BitVec 64)) (t!47587 List!32901)) )
))
(declare-fun arrayNoDuplicates!0 (array!96093 (_ BitVec 32) List!32901) Bool)

(assert (=> b!1405093 (= res!942924 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32898))))

(declare-fun b!1405094 () Bool)

(declare-fun res!942925 () Bool)

(assert (=> b!1405094 (=> (not res!942925) (not e!795606))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405094 (= res!942925 (validKeyInArray!0 (select (arr!46395 a!2901) i!1037)))))

(declare-fun res!942922 () Bool)

(assert (=> start!120762 (=> (not res!942922) (not e!795606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120762 (= res!942922 (validMask!0 mask!2840))))

(assert (=> start!120762 e!795606))

(assert (=> start!120762 true))

(declare-fun array_inv!35676 (array!96093) Bool)

(assert (=> start!120762 (array_inv!35676 a!2901)))

(declare-fun b!1405095 () Bool)

(declare-fun res!942919 () Bool)

(assert (=> b!1405095 (=> (not res!942919) (not e!795606))))

(assert (=> b!1405095 (= res!942919 (validKeyInArray!0 (select (arr!46395 a!2901) j!112)))))

(declare-fun b!1405096 () Bool)

(declare-fun res!942923 () Bool)

(assert (=> b!1405096 (=> (not res!942923) (not e!795606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96093 (_ BitVec 32)) Bool)

(assert (=> b!1405096 (= res!942923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405097 () Bool)

(declare-fun res!942921 () Bool)

(assert (=> b!1405097 (=> (not res!942921) (not e!795606))))

(assert (=> b!1405097 (= res!942921 (and (= (size!46946 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46946 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46946 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405098 () Bool)

(assert (=> b!1405098 (= e!795606 (not true))))

(assert (=> b!1405098 e!795607))

(declare-fun res!942920 () Bool)

(assert (=> b!1405098 (=> (not res!942920) (not e!795607))))

(assert (=> b!1405098 (= res!942920 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47261 0))(
  ( (Unit!47262) )
))
(declare-fun lt!618952 () Unit!47261)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47261)

(assert (=> b!1405098 (= lt!618952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618953 () SeekEntryResult!10615)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96093 (_ BitVec 32)) SeekEntryResult!10615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405098 (= lt!618953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46395 a!2901) j!112) mask!2840) (select (arr!46395 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120762 res!942922) b!1405097))

(assert (= (and b!1405097 res!942921) b!1405094))

(assert (= (and b!1405094 res!942925) b!1405095))

(assert (= (and b!1405095 res!942919) b!1405096))

(assert (= (and b!1405096 res!942923) b!1405093))

(assert (= (and b!1405093 res!942924) b!1405098))

(assert (= (and b!1405098 res!942920) b!1405092))

(declare-fun m!1294103 () Bool)

(assert (=> b!1405094 m!1294103))

(assert (=> b!1405094 m!1294103))

(declare-fun m!1294105 () Bool)

(assert (=> b!1405094 m!1294105))

(declare-fun m!1294107 () Bool)

(assert (=> b!1405092 m!1294107))

(assert (=> b!1405092 m!1294107))

(declare-fun m!1294109 () Bool)

(assert (=> b!1405092 m!1294109))

(declare-fun m!1294111 () Bool)

(assert (=> start!120762 m!1294111))

(declare-fun m!1294113 () Bool)

(assert (=> start!120762 m!1294113))

(assert (=> b!1405098 m!1294107))

(declare-fun m!1294115 () Bool)

(assert (=> b!1405098 m!1294115))

(assert (=> b!1405098 m!1294107))

(declare-fun m!1294117 () Bool)

(assert (=> b!1405098 m!1294117))

(assert (=> b!1405098 m!1294115))

(assert (=> b!1405098 m!1294107))

(declare-fun m!1294119 () Bool)

(assert (=> b!1405098 m!1294119))

(declare-fun m!1294121 () Bool)

(assert (=> b!1405098 m!1294121))

(declare-fun m!1294123 () Bool)

(assert (=> b!1405093 m!1294123))

(declare-fun m!1294125 () Bool)

(assert (=> b!1405096 m!1294125))

(assert (=> b!1405095 m!1294107))

(assert (=> b!1405095 m!1294107))

(declare-fun m!1294127 () Bool)

(assert (=> b!1405095 m!1294127))

(push 1)

(assert (not b!1405092))

(assert (not b!1405095))

(assert (not b!1405096))

(assert (not b!1405094))

(assert (not start!120762))

(assert (not b!1405093))

(assert (not b!1405098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

