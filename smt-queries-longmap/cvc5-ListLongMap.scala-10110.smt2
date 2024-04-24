; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119346 () Bool)

(assert start!119346)

(declare-fun b!1391175 () Bool)

(declare-fun res!930656 () Bool)

(declare-fun e!787985 () Bool)

(assert (=> b!1391175 (=> (not res!930656) (not e!787985))))

(declare-datatypes ((array!95205 0))(
  ( (array!95206 (arr!45966 (Array (_ BitVec 32) (_ BitVec 64))) (size!46517 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95205)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391175 (= res!930656 (validKeyInArray!0 (select (arr!45966 a!2901) j!112)))))

(declare-fun b!1391176 () Bool)

(declare-fun res!930652 () Bool)

(assert (=> b!1391176 (=> (not res!930652) (not e!787985))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391176 (= res!930652 (and (= (size!46517 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46517 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46517 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391177 () Bool)

(declare-fun res!930653 () Bool)

(assert (=> b!1391177 (=> (not res!930653) (not e!787985))))

(assert (=> b!1391177 (= res!930653 (validKeyInArray!0 (select (arr!45966 a!2901) i!1037)))))

(declare-fun b!1391178 () Bool)

(declare-fun e!787984 () Bool)

(declare-datatypes ((SeekEntryResult!10186 0))(
  ( (MissingZero!10186 (index!43115 (_ BitVec 32))) (Found!10186 (index!43116 (_ BitVec 32))) (Intermediate!10186 (undefined!10998 Bool) (index!43117 (_ BitVec 32)) (x!124947 (_ BitVec 32))) (Undefined!10186) (MissingVacant!10186 (index!43118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95205 (_ BitVec 32)) SeekEntryResult!10186)

(assert (=> b!1391178 (= e!787984 (= (seekEntryOrOpen!0 (select (arr!45966 a!2901) j!112) a!2901 mask!2840) (Found!10186 j!112)))))

(declare-fun b!1391179 () Bool)

(assert (=> b!1391179 (= e!787985 (not true))))

(assert (=> b!1391179 e!787984))

(declare-fun res!930655 () Bool)

(assert (=> b!1391179 (=> (not res!930655) (not e!787984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95205 (_ BitVec 32)) Bool)

(assert (=> b!1391179 (= res!930655 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46403 0))(
  ( (Unit!46404) )
))
(declare-fun lt!611107 () Unit!46403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46403)

(assert (=> b!1391179 (= lt!611107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611108 () SeekEntryResult!10186)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95205 (_ BitVec 32)) SeekEntryResult!10186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391179 (= lt!611108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45966 a!2901) j!112) mask!2840) (select (arr!45966 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391180 () Bool)

(declare-fun res!930657 () Bool)

(assert (=> b!1391180 (=> (not res!930657) (not e!787985))))

(declare-datatypes ((List!32472 0))(
  ( (Nil!32469) (Cons!32468 (h!33694 (_ BitVec 64)) (t!47158 List!32472)) )
))
(declare-fun arrayNoDuplicates!0 (array!95205 (_ BitVec 32) List!32472) Bool)

(assert (=> b!1391180 (= res!930657 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32469))))

(declare-fun b!1391181 () Bool)

(declare-fun res!930654 () Bool)

(assert (=> b!1391181 (=> (not res!930654) (not e!787985))))

(assert (=> b!1391181 (= res!930654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930658 () Bool)

(assert (=> start!119346 (=> (not res!930658) (not e!787985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119346 (= res!930658 (validMask!0 mask!2840))))

(assert (=> start!119346 e!787985))

(assert (=> start!119346 true))

(declare-fun array_inv!35247 (array!95205) Bool)

(assert (=> start!119346 (array_inv!35247 a!2901)))

(assert (= (and start!119346 res!930658) b!1391176))

(assert (= (and b!1391176 res!930652) b!1391177))

(assert (= (and b!1391177 res!930653) b!1391175))

(assert (= (and b!1391175 res!930656) b!1391181))

(assert (= (and b!1391181 res!930654) b!1391180))

(assert (= (and b!1391180 res!930657) b!1391179))

(assert (= (and b!1391179 res!930655) b!1391178))

(declare-fun m!1277159 () Bool)

(assert (=> b!1391179 m!1277159))

(declare-fun m!1277161 () Bool)

(assert (=> b!1391179 m!1277161))

(assert (=> b!1391179 m!1277159))

(declare-fun m!1277163 () Bool)

(assert (=> b!1391179 m!1277163))

(assert (=> b!1391179 m!1277161))

(assert (=> b!1391179 m!1277159))

(declare-fun m!1277165 () Bool)

(assert (=> b!1391179 m!1277165))

(declare-fun m!1277167 () Bool)

(assert (=> b!1391179 m!1277167))

(assert (=> b!1391175 m!1277159))

(assert (=> b!1391175 m!1277159))

(declare-fun m!1277169 () Bool)

(assert (=> b!1391175 m!1277169))

(declare-fun m!1277171 () Bool)

(assert (=> b!1391177 m!1277171))

(assert (=> b!1391177 m!1277171))

(declare-fun m!1277173 () Bool)

(assert (=> b!1391177 m!1277173))

(declare-fun m!1277175 () Bool)

(assert (=> start!119346 m!1277175))

(declare-fun m!1277177 () Bool)

(assert (=> start!119346 m!1277177))

(declare-fun m!1277179 () Bool)

(assert (=> b!1391180 m!1277179))

(declare-fun m!1277181 () Bool)

(assert (=> b!1391181 m!1277181))

(assert (=> b!1391178 m!1277159))

(assert (=> b!1391178 m!1277159))

(declare-fun m!1277183 () Bool)

(assert (=> b!1391178 m!1277183))

(push 1)

(assert (not b!1391175))

(assert (not b!1391181))

(assert (not b!1391179))

(assert (not start!119346))

(assert (not b!1391177))

(assert (not b!1391180))

(assert (not b!1391178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

