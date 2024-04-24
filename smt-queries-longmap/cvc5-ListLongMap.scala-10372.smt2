; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122292 () Bool)

(assert start!122292)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!802672 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1418066 () Bool)

(declare-datatypes ((array!96849 0))(
  ( (array!96850 (arr!46752 (Array (_ BitVec 32) (_ BitVec 64))) (size!47303 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96849)

(declare-datatypes ((SeekEntryResult!10966 0))(
  ( (MissingZero!10966 (index!46256 (_ BitVec 32))) (Found!10966 (index!46257 (_ BitVec 32))) (Intermediate!10966 (undefined!11778 Bool) (index!46258 (_ BitVec 32)) (x!128006 (_ BitVec 32))) (Undefined!10966) (MissingVacant!10966 (index!46259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96849 (_ BitVec 32)) SeekEntryResult!10966)

(assert (=> b!1418066 (= e!802672 (= (seekEntryOrOpen!0 (select (arr!46752 a!2901) j!112) a!2901 mask!2840) (Found!10966 j!112)))))

(declare-fun b!1418067 () Bool)

(declare-fun res!953261 () Bool)

(declare-fun e!802673 () Bool)

(assert (=> b!1418067 (=> (not res!953261) (not e!802673))))

(declare-datatypes ((List!33258 0))(
  ( (Nil!33255) (Cons!33254 (h!34552 (_ BitVec 64)) (t!47944 List!33258)) )
))
(declare-fun arrayNoDuplicates!0 (array!96849 (_ BitVec 32) List!33258) Bool)

(assert (=> b!1418067 (= res!953261 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33255))))

(declare-fun b!1418068 () Bool)

(declare-fun res!953259 () Bool)

(assert (=> b!1418068 (=> (not res!953259) (not e!802673))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418068 (= res!953259 (validKeyInArray!0 (select (arr!46752 a!2901) i!1037)))))

(declare-fun b!1418069 () Bool)

(declare-fun res!953264 () Bool)

(assert (=> b!1418069 (=> (not res!953264) (not e!802673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96849 (_ BitVec 32)) Bool)

(assert (=> b!1418069 (= res!953264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418070 () Bool)

(declare-fun res!953265 () Bool)

(assert (=> b!1418070 (=> (not res!953265) (not e!802673))))

(assert (=> b!1418070 (= res!953265 (and (= (size!47303 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47303 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47303 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418071 () Bool)

(declare-fun res!953260 () Bool)

(assert (=> b!1418071 (=> (not res!953260) (not e!802673))))

(assert (=> b!1418071 (= res!953260 (validKeyInArray!0 (select (arr!46752 a!2901) j!112)))))

(declare-fun b!1418073 () Bool)

(declare-fun e!802670 () Bool)

(assert (=> b!1418073 (= e!802673 (not e!802670))))

(declare-fun res!953266 () Bool)

(assert (=> b!1418073 (=> res!953266 e!802670)))

(declare-fun lt!625566 () SeekEntryResult!10966)

(assert (=> b!1418073 (= res!953266 (or (not (is-Intermediate!10966 lt!625566)) (undefined!11778 lt!625566)))))

(assert (=> b!1418073 e!802672))

(declare-fun res!953262 () Bool)

(assert (=> b!1418073 (=> (not res!953262) (not e!802672))))

(assert (=> b!1418073 (= res!953262 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47933 0))(
  ( (Unit!47934) )
))
(declare-fun lt!625568 () Unit!47933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47933)

(assert (=> b!1418073 (= lt!625568 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96849 (_ BitVec 32)) SeekEntryResult!10966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418073 (= lt!625566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46752 a!2901) j!112) mask!2840) (select (arr!46752 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418072 () Bool)

(assert (=> b!1418072 (= e!802670 true)))

(declare-fun lt!625567 () SeekEntryResult!10966)

(assert (=> b!1418072 (= lt!625567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46752 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46752 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96850 (store (arr!46752 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47303 a!2901)) mask!2840))))

(declare-fun res!953263 () Bool)

(assert (=> start!122292 (=> (not res!953263) (not e!802673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122292 (= res!953263 (validMask!0 mask!2840))))

(assert (=> start!122292 e!802673))

(assert (=> start!122292 true))

(declare-fun array_inv!36033 (array!96849) Bool)

(assert (=> start!122292 (array_inv!36033 a!2901)))

(assert (= (and start!122292 res!953263) b!1418070))

(assert (= (and b!1418070 res!953265) b!1418068))

(assert (= (and b!1418068 res!953259) b!1418071))

(assert (= (and b!1418071 res!953260) b!1418069))

(assert (= (and b!1418069 res!953264) b!1418067))

(assert (= (and b!1418067 res!953261) b!1418073))

(assert (= (and b!1418073 res!953262) b!1418066))

(assert (= (and b!1418073 (not res!953266)) b!1418072))

(declare-fun m!1309017 () Bool)

(assert (=> b!1418067 m!1309017))

(declare-fun m!1309019 () Bool)

(assert (=> b!1418066 m!1309019))

(assert (=> b!1418066 m!1309019))

(declare-fun m!1309021 () Bool)

(assert (=> b!1418066 m!1309021))

(declare-fun m!1309023 () Bool)

(assert (=> start!122292 m!1309023))

(declare-fun m!1309025 () Bool)

(assert (=> start!122292 m!1309025))

(assert (=> b!1418073 m!1309019))

(declare-fun m!1309027 () Bool)

(assert (=> b!1418073 m!1309027))

(assert (=> b!1418073 m!1309019))

(declare-fun m!1309029 () Bool)

(assert (=> b!1418073 m!1309029))

(assert (=> b!1418073 m!1309027))

(assert (=> b!1418073 m!1309019))

(declare-fun m!1309031 () Bool)

(assert (=> b!1418073 m!1309031))

(declare-fun m!1309033 () Bool)

(assert (=> b!1418073 m!1309033))

(declare-fun m!1309035 () Bool)

(assert (=> b!1418072 m!1309035))

(declare-fun m!1309037 () Bool)

(assert (=> b!1418072 m!1309037))

(assert (=> b!1418072 m!1309037))

(declare-fun m!1309039 () Bool)

(assert (=> b!1418072 m!1309039))

(assert (=> b!1418072 m!1309039))

(assert (=> b!1418072 m!1309037))

(declare-fun m!1309041 () Bool)

(assert (=> b!1418072 m!1309041))

(declare-fun m!1309043 () Bool)

(assert (=> b!1418069 m!1309043))

(declare-fun m!1309045 () Bool)

(assert (=> b!1418068 m!1309045))

(assert (=> b!1418068 m!1309045))

(declare-fun m!1309047 () Bool)

(assert (=> b!1418068 m!1309047))

(assert (=> b!1418071 m!1309019))

(assert (=> b!1418071 m!1309019))

(declare-fun m!1309049 () Bool)

(assert (=> b!1418071 m!1309049))

(push 1)

(assert (not b!1418066))

(assert (not b!1418073))

(assert (not b!1418067))

(assert (not b!1418068))

(assert (not b!1418072))

(assert (not start!122292))

(assert (not b!1418069))

(assert (not b!1418071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

