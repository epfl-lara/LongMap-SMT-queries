; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120848 () Bool)

(assert start!120848)

(declare-fun b!1406120 () Bool)

(declare-fun res!944340 () Bool)

(declare-fun e!795884 () Bool)

(assert (=> b!1406120 (=> (not res!944340) (not e!795884))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96155 0))(
  ( (array!96156 (arr!46425 (Array (_ BitVec 32) (_ BitVec 64))) (size!46975 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96155)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406120 (= res!944340 (and (= (size!46975 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46975 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46975 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944337 () Bool)

(assert (=> start!120848 (=> (not res!944337) (not e!795884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120848 (= res!944337 (validMask!0 mask!2840))))

(assert (=> start!120848 e!795884))

(assert (=> start!120848 true))

(declare-fun array_inv!35453 (array!96155) Bool)

(assert (=> start!120848 (array_inv!35453 a!2901)))

(declare-fun b!1406121 () Bool)

(declare-fun res!944338 () Bool)

(assert (=> b!1406121 (=> (not res!944338) (not e!795884))))

(declare-datatypes ((List!32944 0))(
  ( (Nil!32941) (Cons!32940 (h!34194 (_ BitVec 64)) (t!47638 List!32944)) )
))
(declare-fun arrayNoDuplicates!0 (array!96155 (_ BitVec 32) List!32944) Bool)

(assert (=> b!1406121 (= res!944338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32941))))

(declare-fun b!1406122 () Bool)

(declare-fun e!795883 () Bool)

(assert (=> b!1406122 (= e!795883 true)))

(declare-datatypes ((SeekEntryResult!10736 0))(
  ( (MissingZero!10736 (index!45321 (_ BitVec 32))) (Found!10736 (index!45322 (_ BitVec 32))) (Intermediate!10736 (undefined!11548 Bool) (index!45323 (_ BitVec 32)) (x!126927 (_ BitVec 32))) (Undefined!10736) (MissingVacant!10736 (index!45324 (_ BitVec 32))) )
))
(declare-fun lt!619264 () SeekEntryResult!10736)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96155 (_ BitVec 32)) SeekEntryResult!10736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406122 (= lt!619264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96156 (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46975 a!2901)) mask!2840))))

(declare-fun b!1406123 () Bool)

(declare-fun res!944339 () Bool)

(assert (=> b!1406123 (=> (not res!944339) (not e!795884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406123 (= res!944339 (validKeyInArray!0 (select (arr!46425 a!2901) i!1037)))))

(declare-fun b!1406124 () Bool)

(declare-fun res!944343 () Bool)

(assert (=> b!1406124 (=> (not res!944343) (not e!795884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96155 (_ BitVec 32)) Bool)

(assert (=> b!1406124 (= res!944343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!795881 () Bool)

(declare-fun b!1406125 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96155 (_ BitVec 32)) SeekEntryResult!10736)

(assert (=> b!1406125 (= e!795881 (= (seekEntryOrOpen!0 (select (arr!46425 a!2901) j!112) a!2901 mask!2840) (Found!10736 j!112)))))

(declare-fun b!1406126 () Bool)

(assert (=> b!1406126 (= e!795884 (not e!795883))))

(declare-fun res!944342 () Bool)

(assert (=> b!1406126 (=> res!944342 e!795883)))

(declare-fun lt!619265 () SeekEntryResult!10736)

(get-info :version)

(assert (=> b!1406126 (= res!944342 (or (not ((_ is Intermediate!10736) lt!619265)) (undefined!11548 lt!619265)))))

(assert (=> b!1406126 e!795881))

(declare-fun res!944341 () Bool)

(assert (=> b!1406126 (=> (not res!944341) (not e!795881))))

(assert (=> b!1406126 (= res!944341 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47446 0))(
  ( (Unit!47447) )
))
(declare-fun lt!619266 () Unit!47446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47446)

(assert (=> b!1406126 (= lt!619266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406126 (= lt!619265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46425 a!2901) j!112) mask!2840) (select (arr!46425 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406127 () Bool)

(declare-fun res!944344 () Bool)

(assert (=> b!1406127 (=> (not res!944344) (not e!795884))))

(assert (=> b!1406127 (= res!944344 (validKeyInArray!0 (select (arr!46425 a!2901) j!112)))))

(assert (= (and start!120848 res!944337) b!1406120))

(assert (= (and b!1406120 res!944340) b!1406123))

(assert (= (and b!1406123 res!944339) b!1406127))

(assert (= (and b!1406127 res!944344) b!1406124))

(assert (= (and b!1406124 res!944343) b!1406121))

(assert (= (and b!1406121 res!944338) b!1406126))

(assert (= (and b!1406126 res!944341) b!1406125))

(assert (= (and b!1406126 (not res!944342)) b!1406122))

(declare-fun m!1295131 () Bool)

(assert (=> start!120848 m!1295131))

(declare-fun m!1295133 () Bool)

(assert (=> start!120848 m!1295133))

(declare-fun m!1295135 () Bool)

(assert (=> b!1406125 m!1295135))

(assert (=> b!1406125 m!1295135))

(declare-fun m!1295137 () Bool)

(assert (=> b!1406125 m!1295137))

(declare-fun m!1295139 () Bool)

(assert (=> b!1406121 m!1295139))

(declare-fun m!1295141 () Bool)

(assert (=> b!1406124 m!1295141))

(assert (=> b!1406127 m!1295135))

(assert (=> b!1406127 m!1295135))

(declare-fun m!1295143 () Bool)

(assert (=> b!1406127 m!1295143))

(declare-fun m!1295145 () Bool)

(assert (=> b!1406123 m!1295145))

(assert (=> b!1406123 m!1295145))

(declare-fun m!1295147 () Bool)

(assert (=> b!1406123 m!1295147))

(assert (=> b!1406126 m!1295135))

(declare-fun m!1295149 () Bool)

(assert (=> b!1406126 m!1295149))

(assert (=> b!1406126 m!1295135))

(declare-fun m!1295151 () Bool)

(assert (=> b!1406126 m!1295151))

(assert (=> b!1406126 m!1295149))

(assert (=> b!1406126 m!1295135))

(declare-fun m!1295153 () Bool)

(assert (=> b!1406126 m!1295153))

(declare-fun m!1295155 () Bool)

(assert (=> b!1406126 m!1295155))

(declare-fun m!1295157 () Bool)

(assert (=> b!1406122 m!1295157))

(declare-fun m!1295159 () Bool)

(assert (=> b!1406122 m!1295159))

(assert (=> b!1406122 m!1295159))

(declare-fun m!1295161 () Bool)

(assert (=> b!1406122 m!1295161))

(assert (=> b!1406122 m!1295161))

(assert (=> b!1406122 m!1295159))

(declare-fun m!1295163 () Bool)

(assert (=> b!1406122 m!1295163))

(check-sat (not b!1406122) (not b!1406127) (not start!120848) (not b!1406125) (not b!1406126) (not b!1406124) (not b!1406121) (not b!1406123))
