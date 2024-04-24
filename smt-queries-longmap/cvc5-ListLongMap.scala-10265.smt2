; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120942 () Bool)

(assert start!120942)

(declare-fun b!1406214 () Bool)

(declare-fun e!796138 () Bool)

(assert (=> b!1406214 (= e!796138 (not true))))

(declare-fun e!796137 () Bool)

(assert (=> b!1406214 e!796137))

(declare-fun res!943751 () Bool)

(assert (=> b!1406214 (=> (not res!943751) (not e!796137))))

(declare-datatypes ((array!96171 0))(
  ( (array!96172 (arr!46431 (Array (_ BitVec 32) (_ BitVec 64))) (size!46982 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96171)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96171 (_ BitVec 32)) Bool)

(assert (=> b!1406214 (= res!943751 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47291 0))(
  ( (Unit!47292) )
))
(declare-fun lt!619321 () Unit!47291)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47291)

(assert (=> b!1406214 (= lt!619321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10645 0))(
  ( (MissingZero!10645 (index!44957 (_ BitVec 32))) (Found!10645 (index!44958 (_ BitVec 32))) (Intermediate!10645 (undefined!11457 Bool) (index!44959 (_ BitVec 32)) (x!126727 (_ BitVec 32))) (Undefined!10645) (MissingVacant!10645 (index!44960 (_ BitVec 32))) )
))
(declare-fun lt!619322 () SeekEntryResult!10645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96171 (_ BitVec 32)) SeekEntryResult!10645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406214 (= lt!619322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46431 a!2901) j!112) mask!2840) (select (arr!46431 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406215 () Bool)

(declare-fun res!943747 () Bool)

(assert (=> b!1406215 (=> (not res!943747) (not e!796138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406215 (= res!943747 (validKeyInArray!0 (select (arr!46431 a!2901) j!112)))))

(declare-fun res!943752 () Bool)

(assert (=> start!120942 (=> (not res!943752) (not e!796138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120942 (= res!943752 (validMask!0 mask!2840))))

(assert (=> start!120942 e!796138))

(assert (=> start!120942 true))

(declare-fun array_inv!35712 (array!96171) Bool)

(assert (=> start!120942 (array_inv!35712 a!2901)))

(declare-fun b!1406216 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96171 (_ BitVec 32)) SeekEntryResult!10645)

(assert (=> b!1406216 (= e!796137 (= (seekEntryOrOpen!0 (select (arr!46431 a!2901) j!112) a!2901 mask!2840) (Found!10645 j!112)))))

(declare-fun b!1406217 () Bool)

(declare-fun res!943753 () Bool)

(assert (=> b!1406217 (=> (not res!943753) (not e!796138))))

(assert (=> b!1406217 (= res!943753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406218 () Bool)

(declare-fun res!943748 () Bool)

(assert (=> b!1406218 (=> (not res!943748) (not e!796138))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406218 (= res!943748 (validKeyInArray!0 (select (arr!46431 a!2901) i!1037)))))

(declare-fun b!1406219 () Bool)

(declare-fun res!943749 () Bool)

(assert (=> b!1406219 (=> (not res!943749) (not e!796138))))

(assert (=> b!1406219 (= res!943749 (and (= (size!46982 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46982 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46982 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406220 () Bool)

(declare-fun res!943750 () Bool)

(assert (=> b!1406220 (=> (not res!943750) (not e!796138))))

(declare-datatypes ((List!32937 0))(
  ( (Nil!32934) (Cons!32933 (h!34195 (_ BitVec 64)) (t!47623 List!32937)) )
))
(declare-fun arrayNoDuplicates!0 (array!96171 (_ BitVec 32) List!32937) Bool)

(assert (=> b!1406220 (= res!943750 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32934))))

(assert (= (and start!120942 res!943752) b!1406219))

(assert (= (and b!1406219 res!943749) b!1406218))

(assert (= (and b!1406218 res!943748) b!1406215))

(assert (= (and b!1406215 res!943747) b!1406217))

(assert (= (and b!1406217 res!943753) b!1406220))

(assert (= (and b!1406220 res!943750) b!1406214))

(assert (= (and b!1406214 res!943751) b!1406216))

(declare-fun m!1295141 () Bool)

(assert (=> start!120942 m!1295141))

(declare-fun m!1295143 () Bool)

(assert (=> start!120942 m!1295143))

(declare-fun m!1295145 () Bool)

(assert (=> b!1406215 m!1295145))

(assert (=> b!1406215 m!1295145))

(declare-fun m!1295147 () Bool)

(assert (=> b!1406215 m!1295147))

(declare-fun m!1295149 () Bool)

(assert (=> b!1406218 m!1295149))

(assert (=> b!1406218 m!1295149))

(declare-fun m!1295151 () Bool)

(assert (=> b!1406218 m!1295151))

(declare-fun m!1295153 () Bool)

(assert (=> b!1406217 m!1295153))

(declare-fun m!1295155 () Bool)

(assert (=> b!1406220 m!1295155))

(assert (=> b!1406214 m!1295145))

(declare-fun m!1295157 () Bool)

(assert (=> b!1406214 m!1295157))

(assert (=> b!1406214 m!1295145))

(declare-fun m!1295159 () Bool)

(assert (=> b!1406214 m!1295159))

(assert (=> b!1406214 m!1295157))

(assert (=> b!1406214 m!1295145))

(declare-fun m!1295161 () Bool)

(assert (=> b!1406214 m!1295161))

(declare-fun m!1295163 () Bool)

(assert (=> b!1406214 m!1295163))

(assert (=> b!1406216 m!1295145))

(assert (=> b!1406216 m!1295145))

(declare-fun m!1295165 () Bool)

(assert (=> b!1406216 m!1295165))

(push 1)

(assert (not b!1406220))

(assert (not start!120942))

(assert (not b!1406216))

(assert (not b!1406214))

(assert (not b!1406217))

(assert (not b!1406215))

(assert (not b!1406218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

