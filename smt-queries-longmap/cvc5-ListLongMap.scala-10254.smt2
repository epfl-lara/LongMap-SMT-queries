; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120768 () Bool)

(assert start!120768)

(declare-fun b!1405155 () Bool)

(declare-fun res!942987 () Bool)

(declare-fun e!795634 () Bool)

(assert (=> b!1405155 (=> (not res!942987) (not e!795634))))

(declare-datatypes ((array!96099 0))(
  ( (array!96100 (arr!46398 (Array (_ BitVec 32) (_ BitVec 64))) (size!46949 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96099)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96099 (_ BitVec 32)) Bool)

(assert (=> b!1405155 (= res!942987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405156 () Bool)

(declare-fun res!942982 () Bool)

(assert (=> b!1405156 (=> (not res!942982) (not e!795634))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405156 (= res!942982 (validKeyInArray!0 (select (arr!46398 a!2901) j!112)))))

(declare-fun b!1405157 () Bool)

(declare-fun res!942986 () Bool)

(assert (=> b!1405157 (=> (not res!942986) (not e!795634))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405157 (= res!942986 (and (= (size!46949 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46949 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46949 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942988 () Bool)

(assert (=> start!120768 (=> (not res!942988) (not e!795634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120768 (= res!942988 (validMask!0 mask!2840))))

(assert (=> start!120768 e!795634))

(assert (=> start!120768 true))

(declare-fun array_inv!35679 (array!96099) Bool)

(assert (=> start!120768 (array_inv!35679 a!2901)))

(declare-fun b!1405158 () Bool)

(declare-fun e!795633 () Bool)

(declare-datatypes ((SeekEntryResult!10618 0))(
  ( (MissingZero!10618 (index!44849 (_ BitVec 32))) (Found!10618 (index!44850 (_ BitVec 32))) (Intermediate!10618 (undefined!11430 Bool) (index!44851 (_ BitVec 32)) (x!126600 (_ BitVec 32))) (Undefined!10618) (MissingVacant!10618 (index!44852 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96099 (_ BitVec 32)) SeekEntryResult!10618)

(assert (=> b!1405158 (= e!795633 (= (seekEntryOrOpen!0 (select (arr!46398 a!2901) j!112) a!2901 mask!2840) (Found!10618 j!112)))))

(declare-fun b!1405159 () Bool)

(assert (=> b!1405159 (= e!795634 (not true))))

(assert (=> b!1405159 e!795633))

(declare-fun res!942983 () Bool)

(assert (=> b!1405159 (=> (not res!942983) (not e!795633))))

(assert (=> b!1405159 (= res!942983 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47267 0))(
  ( (Unit!47268) )
))
(declare-fun lt!618970 () Unit!47267)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47267)

(assert (=> b!1405159 (= lt!618970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618971 () SeekEntryResult!10618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96099 (_ BitVec 32)) SeekEntryResult!10618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405159 (= lt!618971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46398 a!2901) j!112) mask!2840) (select (arr!46398 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405160 () Bool)

(declare-fun res!942984 () Bool)

(assert (=> b!1405160 (=> (not res!942984) (not e!795634))))

(declare-datatypes ((List!32904 0))(
  ( (Nil!32901) (Cons!32900 (h!34156 (_ BitVec 64)) (t!47590 List!32904)) )
))
(declare-fun arrayNoDuplicates!0 (array!96099 (_ BitVec 32) List!32904) Bool)

(assert (=> b!1405160 (= res!942984 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32901))))

(declare-fun b!1405161 () Bool)

(declare-fun res!942985 () Bool)

(assert (=> b!1405161 (=> (not res!942985) (not e!795634))))

(assert (=> b!1405161 (= res!942985 (validKeyInArray!0 (select (arr!46398 a!2901) i!1037)))))

(assert (= (and start!120768 res!942988) b!1405157))

(assert (= (and b!1405157 res!942986) b!1405161))

(assert (= (and b!1405161 res!942985) b!1405156))

(assert (= (and b!1405156 res!942982) b!1405155))

(assert (= (and b!1405155 res!942987) b!1405160))

(assert (= (and b!1405160 res!942984) b!1405159))

(assert (= (and b!1405159 res!942983) b!1405158))

(declare-fun m!1294181 () Bool)

(assert (=> b!1405159 m!1294181))

(declare-fun m!1294183 () Bool)

(assert (=> b!1405159 m!1294183))

(assert (=> b!1405159 m!1294181))

(declare-fun m!1294185 () Bool)

(assert (=> b!1405159 m!1294185))

(assert (=> b!1405159 m!1294183))

(assert (=> b!1405159 m!1294181))

(declare-fun m!1294187 () Bool)

(assert (=> b!1405159 m!1294187))

(declare-fun m!1294189 () Bool)

(assert (=> b!1405159 m!1294189))

(assert (=> b!1405156 m!1294181))

(assert (=> b!1405156 m!1294181))

(declare-fun m!1294191 () Bool)

(assert (=> b!1405156 m!1294191))

(declare-fun m!1294193 () Bool)

(assert (=> b!1405160 m!1294193))

(declare-fun m!1294195 () Bool)

(assert (=> start!120768 m!1294195))

(declare-fun m!1294197 () Bool)

(assert (=> start!120768 m!1294197))

(declare-fun m!1294199 () Bool)

(assert (=> b!1405155 m!1294199))

(assert (=> b!1405158 m!1294181))

(assert (=> b!1405158 m!1294181))

(declare-fun m!1294201 () Bool)

(assert (=> b!1405158 m!1294201))

(declare-fun m!1294203 () Bool)

(assert (=> b!1405161 m!1294203))

(assert (=> b!1405161 m!1294203))

(declare-fun m!1294205 () Bool)

(assert (=> b!1405161 m!1294205))

(push 1)

(assert (not b!1405160))

(assert (not b!1405156))

(assert (not b!1405155))

(assert (not start!120768))

(assert (not b!1405159))

(assert (not b!1405161))

(assert (not b!1405158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

