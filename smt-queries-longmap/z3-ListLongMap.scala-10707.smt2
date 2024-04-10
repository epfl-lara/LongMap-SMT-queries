; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125382 () Bool)

(assert start!125382)

(declare-fun b!1466079 () Bool)

(declare-fun res!994863 () Bool)

(declare-fun e!823709 () Bool)

(assert (=> b!1466079 (=> (not res!994863) (not e!823709))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98830 0))(
  ( (array!98831 (arr!47703 (Array (_ BitVec 32) (_ BitVec 64))) (size!48253 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98830)

(assert (=> b!1466079 (= res!994863 (and (= (size!48253 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48253 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48253 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466080 () Bool)

(declare-fun e!823714 () Bool)

(assert (=> b!1466080 (= e!823714 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!641622 () array!98830)

(declare-datatypes ((SeekEntryResult!11955 0))(
  ( (MissingZero!11955 (index!50212 (_ BitVec 32))) (Found!11955 (index!50213 (_ BitVec 32))) (Intermediate!11955 (undefined!12767 Bool) (index!50214 (_ BitVec 32)) (x!131788 (_ BitVec 32))) (Undefined!11955) (MissingVacant!11955 (index!50215 (_ BitVec 32))) )
))
(declare-fun lt!641623 () SeekEntryResult!11955)

(declare-fun lt!641628 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11955)

(assert (=> b!1466080 (= lt!641623 (seekEntryOrOpen!0 lt!641628 lt!641622 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641626 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49406 0))(
  ( (Unit!49407) )
))
(declare-fun lt!641624 () Unit!49406)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49406)

(assert (=> b!1466080 (= lt!641624 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641626 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!823712 () Bool)

(declare-fun b!1466081 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11955)

(assert (=> b!1466081 (= e!823712 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641628 lt!641622 mask!2687) (seekEntryOrOpen!0 lt!641628 lt!641622 mask!2687)))))

(declare-fun b!1466082 () Bool)

(declare-fun res!994866 () Bool)

(assert (=> b!1466082 (=> res!994866 e!823714)))

(assert (=> b!1466082 (= res!994866 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun lt!641625 () SeekEntryResult!11955)

(declare-fun b!1466083 () Bool)

(declare-fun e!823710 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11955)

(assert (=> b!1466083 (= e!823710 (not (= lt!641625 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641626 lt!641628 lt!641622 mask!2687))))))

(declare-fun b!1466084 () Bool)

(assert (=> b!1466084 (= e!823710 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641626 intermediateAfterIndex!19 lt!641628 lt!641622 mask!2687) (seekEntryOrOpen!0 lt!641628 lt!641622 mask!2687))))))

(declare-fun b!1466085 () Bool)

(declare-fun res!994853 () Bool)

(declare-fun e!823713 () Bool)

(assert (=> b!1466085 (=> (not res!994853) (not e!823713))))

(declare-fun lt!641627 () SeekEntryResult!11955)

(assert (=> b!1466085 (= res!994853 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47703 a!2862) j!93) a!2862 mask!2687) lt!641627))))

(declare-fun b!1466086 () Bool)

(declare-fun res!994850 () Bool)

(assert (=> b!1466086 (=> res!994850 e!823714)))

(assert (=> b!1466086 (= res!994850 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641626 (select (arr!47703 a!2862) j!93) a!2862 mask!2687) lt!641627)))))

(declare-fun b!1466087 () Bool)

(assert (=> b!1466087 (= e!823712 (= lt!641625 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641628 lt!641622 mask!2687)))))

(declare-fun b!1466088 () Bool)

(declare-fun res!994852 () Bool)

(assert (=> b!1466088 (=> (not res!994852) (not e!823709))))

(assert (=> b!1466088 (= res!994852 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48253 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48253 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48253 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466089 () Bool)

(declare-fun res!994858 () Bool)

(declare-fun e!823707 () Bool)

(assert (=> b!1466089 (=> (not res!994858) (not e!823707))))

(assert (=> b!1466089 (= res!994858 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466090 () Bool)

(declare-fun res!994862 () Bool)

(assert (=> b!1466090 (=> (not res!994862) (not e!823707))))

(assert (=> b!1466090 (= res!994862 e!823712)))

(declare-fun c!135126 () Bool)

(assert (=> b!1466090 (= c!135126 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!994857 () Bool)

(assert (=> start!125382 (=> (not res!994857) (not e!823709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125382 (= res!994857 (validMask!0 mask!2687))))

(assert (=> start!125382 e!823709))

(assert (=> start!125382 true))

(declare-fun array_inv!36731 (array!98830) Bool)

(assert (=> start!125382 (array_inv!36731 a!2862)))

(declare-fun b!1466091 () Bool)

(declare-fun res!994864 () Bool)

(assert (=> b!1466091 (=> (not res!994864) (not e!823709))))

(declare-datatypes ((List!34204 0))(
  ( (Nil!34201) (Cons!34200 (h!35550 (_ BitVec 64)) (t!48898 List!34204)) )
))
(declare-fun arrayNoDuplicates!0 (array!98830 (_ BitVec 32) List!34204) Bool)

(assert (=> b!1466091 (= res!994864 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34201))))

(declare-fun b!1466092 () Bool)

(declare-fun res!994856 () Bool)

(assert (=> b!1466092 (=> (not res!994856) (not e!823709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466092 (= res!994856 (validKeyInArray!0 (select (arr!47703 a!2862) i!1006)))))

(declare-fun b!1466093 () Bool)

(declare-fun e!823711 () Bool)

(assert (=> b!1466093 (= e!823711 e!823713)))

(declare-fun res!994851 () Bool)

(assert (=> b!1466093 (=> (not res!994851) (not e!823713))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466093 (= res!994851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47703 a!2862) j!93) mask!2687) (select (arr!47703 a!2862) j!93) a!2862 mask!2687) lt!641627))))

(assert (=> b!1466093 (= lt!641627 (Intermediate!11955 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466094 () Bool)

(assert (=> b!1466094 (= e!823709 e!823711)))

(declare-fun res!994861 () Bool)

(assert (=> b!1466094 (=> (not res!994861) (not e!823711))))

(assert (=> b!1466094 (= res!994861 (= (select (store (arr!47703 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466094 (= lt!641622 (array!98831 (store (arr!47703 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48253 a!2862)))))

(declare-fun b!1466095 () Bool)

(declare-fun res!994860 () Bool)

(assert (=> b!1466095 (=> (not res!994860) (not e!823709))))

(assert (=> b!1466095 (= res!994860 (validKeyInArray!0 (select (arr!47703 a!2862) j!93)))))

(declare-fun b!1466096 () Bool)

(assert (=> b!1466096 (= e!823713 e!823707)))

(declare-fun res!994859 () Bool)

(assert (=> b!1466096 (=> (not res!994859) (not e!823707))))

(assert (=> b!1466096 (= res!994859 (= lt!641625 (Intermediate!11955 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466096 (= lt!641625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641628 mask!2687) lt!641628 lt!641622 mask!2687))))

(assert (=> b!1466096 (= lt!641628 (select (store (arr!47703 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466097 () Bool)

(declare-fun res!994855 () Bool)

(assert (=> b!1466097 (=> res!994855 e!823714)))

(assert (=> b!1466097 (= res!994855 e!823710)))

(declare-fun c!135125 () Bool)

(assert (=> b!1466097 (= c!135125 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466098 () Bool)

(declare-fun e!823708 () Bool)

(assert (=> b!1466098 (= e!823708 e!823714)))

(declare-fun res!994867 () Bool)

(assert (=> b!1466098 (=> res!994867 e!823714)))

(assert (=> b!1466098 (= res!994867 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641626 #b00000000000000000000000000000000) (bvsge lt!641626 (size!48253 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466098 (= lt!641626 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466099 () Bool)

(declare-fun res!994854 () Bool)

(assert (=> b!1466099 (=> (not res!994854) (not e!823709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98830 (_ BitVec 32)) Bool)

(assert (=> b!1466099 (= res!994854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466100 () Bool)

(assert (=> b!1466100 (= e!823707 (not e!823708))))

(declare-fun res!994865 () Bool)

(assert (=> b!1466100 (=> res!994865 e!823708)))

(assert (=> b!1466100 (= res!994865 (or (and (= (select (arr!47703 a!2862) index!646) (select (store (arr!47703 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47703 a!2862) index!646) (select (arr!47703 a!2862) j!93))) (= (select (arr!47703 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466100 (and (= lt!641623 (Found!11955 j!93)) (or (= (select (arr!47703 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47703 a!2862) intermediateBeforeIndex!19) (select (arr!47703 a!2862) j!93))))))

(assert (=> b!1466100 (= lt!641623 (seekEntryOrOpen!0 (select (arr!47703 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466100 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641621 () Unit!49406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49406)

(assert (=> b!1466100 (= lt!641621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125382 res!994857) b!1466079))

(assert (= (and b!1466079 res!994863) b!1466092))

(assert (= (and b!1466092 res!994856) b!1466095))

(assert (= (and b!1466095 res!994860) b!1466099))

(assert (= (and b!1466099 res!994854) b!1466091))

(assert (= (and b!1466091 res!994864) b!1466088))

(assert (= (and b!1466088 res!994852) b!1466094))

(assert (= (and b!1466094 res!994861) b!1466093))

(assert (= (and b!1466093 res!994851) b!1466085))

(assert (= (and b!1466085 res!994853) b!1466096))

(assert (= (and b!1466096 res!994859) b!1466090))

(assert (= (and b!1466090 c!135126) b!1466087))

(assert (= (and b!1466090 (not c!135126)) b!1466081))

(assert (= (and b!1466090 res!994862) b!1466089))

(assert (= (and b!1466089 res!994858) b!1466100))

(assert (= (and b!1466100 (not res!994865)) b!1466098))

(assert (= (and b!1466098 (not res!994867)) b!1466086))

(assert (= (and b!1466086 (not res!994850)) b!1466097))

(assert (= (and b!1466097 c!135125) b!1466083))

(assert (= (and b!1466097 (not c!135125)) b!1466084))

(assert (= (and b!1466097 (not res!994855)) b!1466082))

(assert (= (and b!1466082 (not res!994866)) b!1466080))

(declare-fun m!1353103 () Bool)

(assert (=> b!1466092 m!1353103))

(assert (=> b!1466092 m!1353103))

(declare-fun m!1353105 () Bool)

(assert (=> b!1466092 m!1353105))

(declare-fun m!1353107 () Bool)

(assert (=> b!1466096 m!1353107))

(assert (=> b!1466096 m!1353107))

(declare-fun m!1353109 () Bool)

(assert (=> b!1466096 m!1353109))

(declare-fun m!1353111 () Bool)

(assert (=> b!1466096 m!1353111))

(declare-fun m!1353113 () Bool)

(assert (=> b!1466096 m!1353113))

(declare-fun m!1353115 () Bool)

(assert (=> b!1466099 m!1353115))

(assert (=> b!1466094 m!1353111))

(declare-fun m!1353117 () Bool)

(assert (=> b!1466094 m!1353117))

(declare-fun m!1353119 () Bool)

(assert (=> b!1466081 m!1353119))

(declare-fun m!1353121 () Bool)

(assert (=> b!1466081 m!1353121))

(declare-fun m!1353123 () Bool)

(assert (=> b!1466083 m!1353123))

(declare-fun m!1353125 () Bool)

(assert (=> b!1466093 m!1353125))

(assert (=> b!1466093 m!1353125))

(declare-fun m!1353127 () Bool)

(assert (=> b!1466093 m!1353127))

(assert (=> b!1466093 m!1353127))

(assert (=> b!1466093 m!1353125))

(declare-fun m!1353129 () Bool)

(assert (=> b!1466093 m!1353129))

(declare-fun m!1353131 () Bool)

(assert (=> b!1466098 m!1353131))

(declare-fun m!1353133 () Bool)

(assert (=> b!1466087 m!1353133))

(declare-fun m!1353135 () Bool)

(assert (=> b!1466091 m!1353135))

(assert (=> b!1466095 m!1353125))

(assert (=> b!1466095 m!1353125))

(declare-fun m!1353137 () Bool)

(assert (=> b!1466095 m!1353137))

(assert (=> b!1466085 m!1353125))

(assert (=> b!1466085 m!1353125))

(declare-fun m!1353139 () Bool)

(assert (=> b!1466085 m!1353139))

(declare-fun m!1353141 () Bool)

(assert (=> start!125382 m!1353141))

(declare-fun m!1353143 () Bool)

(assert (=> start!125382 m!1353143))

(assert (=> b!1466086 m!1353125))

(assert (=> b!1466086 m!1353125))

(declare-fun m!1353145 () Bool)

(assert (=> b!1466086 m!1353145))

(declare-fun m!1353147 () Bool)

(assert (=> b!1466100 m!1353147))

(assert (=> b!1466100 m!1353111))

(declare-fun m!1353149 () Bool)

(assert (=> b!1466100 m!1353149))

(declare-fun m!1353151 () Bool)

(assert (=> b!1466100 m!1353151))

(declare-fun m!1353153 () Bool)

(assert (=> b!1466100 m!1353153))

(assert (=> b!1466100 m!1353125))

(declare-fun m!1353155 () Bool)

(assert (=> b!1466100 m!1353155))

(declare-fun m!1353157 () Bool)

(assert (=> b!1466100 m!1353157))

(assert (=> b!1466100 m!1353125))

(assert (=> b!1466080 m!1353121))

(declare-fun m!1353159 () Bool)

(assert (=> b!1466080 m!1353159))

(declare-fun m!1353161 () Bool)

(assert (=> b!1466084 m!1353161))

(assert (=> b!1466084 m!1353121))

(check-sat (not b!1466100) (not b!1466099) (not b!1466080) (not b!1466091) (not b!1466096) (not b!1466085) (not b!1466098) (not start!125382) (not b!1466095) (not b!1466083) (not b!1466081) (not b!1466084) (not b!1466092) (not b!1466086) (not b!1466093) (not b!1466087))
(check-sat)
