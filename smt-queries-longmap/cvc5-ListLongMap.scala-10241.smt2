; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120498 () Bool)

(assert start!120498)

(declare-fun b!1403069 () Bool)

(declare-fun res!941638 () Bool)

(declare-fun e!794462 () Bool)

(assert (=> b!1403069 (=> (not res!941638) (not e!794462))))

(declare-datatypes ((array!95860 0))(
  ( (array!95861 (arr!46281 (Array (_ BitVec 32) (_ BitVec 64))) (size!46833 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95860)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95860 (_ BitVec 32)) Bool)

(assert (=> b!1403069 (= res!941638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403070 () Bool)

(declare-fun res!941634 () Bool)

(assert (=> b!1403070 (=> (not res!941634) (not e!794462))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403070 (= res!941634 (validKeyInArray!0 (select (arr!46281 a!2901) j!112)))))

(declare-fun b!1403071 () Bool)

(declare-fun e!794459 () Bool)

(assert (=> b!1403071 (= e!794459 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10624 0))(
  ( (MissingZero!10624 (index!44873 (_ BitVec 32))) (Found!10624 (index!44874 (_ BitVec 32))) (Intermediate!10624 (undefined!11436 Bool) (index!44875 (_ BitVec 32)) (x!126480 (_ BitVec 32))) (Undefined!10624) (MissingVacant!10624 (index!44876 (_ BitVec 32))) )
))
(declare-fun lt!618102 () SeekEntryResult!10624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95860 (_ BitVec 32)) SeekEntryResult!10624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403071 (= lt!618102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95861 (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46833 a!2901)) mask!2840))))

(declare-fun b!1403072 () Bool)

(assert (=> b!1403072 (= e!794462 (not e!794459))))

(declare-fun res!941631 () Bool)

(assert (=> b!1403072 (=> res!941631 e!794459)))

(declare-fun lt!618104 () SeekEntryResult!10624)

(assert (=> b!1403072 (= res!941631 (or (not (is-Intermediate!10624 lt!618104)) (undefined!11436 lt!618104)))))

(declare-fun e!794460 () Bool)

(assert (=> b!1403072 e!794460))

(declare-fun res!941633 () Bool)

(assert (=> b!1403072 (=> (not res!941633) (not e!794460))))

(assert (=> b!1403072 (= res!941633 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47095 0))(
  ( (Unit!47096) )
))
(declare-fun lt!618103 () Unit!47095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47095)

(assert (=> b!1403072 (= lt!618103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403072 (= lt!618104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46281 a!2901) j!112) mask!2840) (select (arr!46281 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403073 () Bool)

(declare-fun res!941635 () Bool)

(assert (=> b!1403073 (=> (not res!941635) (not e!794462))))

(assert (=> b!1403073 (= res!941635 (validKeyInArray!0 (select (arr!46281 a!2901) i!1037)))))

(declare-fun b!1403074 () Bool)

(declare-fun res!941632 () Bool)

(assert (=> b!1403074 (=> (not res!941632) (not e!794462))))

(declare-datatypes ((List!32878 0))(
  ( (Nil!32875) (Cons!32874 (h!34122 (_ BitVec 64)) (t!47564 List!32878)) )
))
(declare-fun arrayNoDuplicates!0 (array!95860 (_ BitVec 32) List!32878) Bool)

(assert (=> b!1403074 (= res!941632 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32875))))

(declare-fun res!941636 () Bool)

(assert (=> start!120498 (=> (not res!941636) (not e!794462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120498 (= res!941636 (validMask!0 mask!2840))))

(assert (=> start!120498 e!794462))

(assert (=> start!120498 true))

(declare-fun array_inv!35514 (array!95860) Bool)

(assert (=> start!120498 (array_inv!35514 a!2901)))

(declare-fun b!1403075 () Bool)

(declare-fun res!941637 () Bool)

(assert (=> b!1403075 (=> (not res!941637) (not e!794462))))

(assert (=> b!1403075 (= res!941637 (and (= (size!46833 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46833 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46833 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403076 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95860 (_ BitVec 32)) SeekEntryResult!10624)

(assert (=> b!1403076 (= e!794460 (= (seekEntryOrOpen!0 (select (arr!46281 a!2901) j!112) a!2901 mask!2840) (Found!10624 j!112)))))

(assert (= (and start!120498 res!941636) b!1403075))

(assert (= (and b!1403075 res!941637) b!1403073))

(assert (= (and b!1403073 res!941635) b!1403070))

(assert (= (and b!1403070 res!941634) b!1403069))

(assert (= (and b!1403069 res!941638) b!1403074))

(assert (= (and b!1403074 res!941632) b!1403072))

(assert (= (and b!1403072 res!941633) b!1403076))

(assert (= (and b!1403072 (not res!941631)) b!1403071))

(declare-fun m!1291131 () Bool)

(assert (=> b!1403071 m!1291131))

(declare-fun m!1291133 () Bool)

(assert (=> b!1403071 m!1291133))

(assert (=> b!1403071 m!1291133))

(declare-fun m!1291135 () Bool)

(assert (=> b!1403071 m!1291135))

(assert (=> b!1403071 m!1291135))

(assert (=> b!1403071 m!1291133))

(declare-fun m!1291137 () Bool)

(assert (=> b!1403071 m!1291137))

(declare-fun m!1291139 () Bool)

(assert (=> b!1403070 m!1291139))

(assert (=> b!1403070 m!1291139))

(declare-fun m!1291141 () Bool)

(assert (=> b!1403070 m!1291141))

(assert (=> b!1403072 m!1291139))

(declare-fun m!1291143 () Bool)

(assert (=> b!1403072 m!1291143))

(assert (=> b!1403072 m!1291139))

(declare-fun m!1291145 () Bool)

(assert (=> b!1403072 m!1291145))

(assert (=> b!1403072 m!1291143))

(assert (=> b!1403072 m!1291139))

(declare-fun m!1291147 () Bool)

(assert (=> b!1403072 m!1291147))

(declare-fun m!1291149 () Bool)

(assert (=> b!1403072 m!1291149))

(declare-fun m!1291151 () Bool)

(assert (=> b!1403069 m!1291151))

(declare-fun m!1291153 () Bool)

(assert (=> start!120498 m!1291153))

(declare-fun m!1291155 () Bool)

(assert (=> start!120498 m!1291155))

(declare-fun m!1291157 () Bool)

(assert (=> b!1403074 m!1291157))

(assert (=> b!1403076 m!1291139))

(assert (=> b!1403076 m!1291139))

(declare-fun m!1291159 () Bool)

(assert (=> b!1403076 m!1291159))

(declare-fun m!1291161 () Bool)

(assert (=> b!1403073 m!1291161))

(assert (=> b!1403073 m!1291161))

(declare-fun m!1291163 () Bool)

(assert (=> b!1403073 m!1291163))

(push 1)

(assert (not b!1403072))

(assert (not b!1403073))

(assert (not b!1403076))

(assert (not b!1403070))

(assert (not b!1403071))

(assert (not b!1403069))

(assert (not start!120498))

(assert (not b!1403074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

