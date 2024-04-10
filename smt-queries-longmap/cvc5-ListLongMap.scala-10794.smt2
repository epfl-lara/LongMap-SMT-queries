; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126262 () Bool)

(assert start!126262)

(declare-fun b!1480139 () Bool)

(declare-fun e!830198 () Bool)

(declare-fun e!830204 () Bool)

(assert (=> b!1480139 (= e!830198 e!830204)))

(declare-fun res!1005974 () Bool)

(assert (=> b!1480139 (=> (not res!1005974) (not e!830204))))

(declare-datatypes ((SeekEntryResult!12203 0))(
  ( (MissingZero!12203 (index!51204 (_ BitVec 32))) (Found!12203 (index!51205 (_ BitVec 32))) (Intermediate!12203 (undefined!13015 Bool) (index!51206 (_ BitVec 32)) (x!132786 (_ BitVec 32))) (Undefined!12203) (MissingVacant!12203 (index!51207 (_ BitVec 32))) )
))
(declare-fun lt!646307 () SeekEntryResult!12203)

(declare-datatypes ((array!99368 0))(
  ( (array!99369 (arr!47963 (Array (_ BitVec 32) (_ BitVec 64))) (size!48513 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99368)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99368 (_ BitVec 32)) SeekEntryResult!12203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480139 (= res!1005974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47963 a!2862) j!93) mask!2687) (select (arr!47963 a!2862) j!93) a!2862 mask!2687) lt!646307))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480139 (= lt!646307 (Intermediate!12203 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480140 () Bool)

(declare-fun res!1005979 () Bool)

(declare-fun e!830205 () Bool)

(assert (=> b!1480140 (=> (not res!1005979) (not e!830205))))

(declare-datatypes ((List!34464 0))(
  ( (Nil!34461) (Cons!34460 (h!35828 (_ BitVec 64)) (t!49158 List!34464)) )
))
(declare-fun arrayNoDuplicates!0 (array!99368 (_ BitVec 32) List!34464) Bool)

(assert (=> b!1480140 (= res!1005979 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34461))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1480141 () Bool)

(declare-fun lt!646308 () (_ BitVec 64))

(declare-fun lt!646310 () SeekEntryResult!12203)

(declare-fun lt!646311 () array!99368)

(declare-fun e!830206 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1480141 (= e!830206 (= lt!646310 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646308 lt!646311 mask!2687)))))

(declare-fun b!1480142 () Bool)

(declare-fun res!1005985 () Bool)

(assert (=> b!1480142 (=> (not res!1005985) (not e!830205))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480142 (= res!1005985 (validKeyInArray!0 (select (arr!47963 a!2862) i!1006)))))

(declare-fun b!1480143 () Bool)

(declare-fun res!1005991 () Bool)

(assert (=> b!1480143 (=> (not res!1005991) (not e!830204))))

(assert (=> b!1480143 (= res!1005991 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47963 a!2862) j!93) a!2862 mask!2687) lt!646307))))

(declare-fun b!1480145 () Bool)

(declare-fun e!830201 () Bool)

(assert (=> b!1480145 (= e!830204 e!830201)))

(declare-fun res!1005989 () Bool)

(assert (=> b!1480145 (=> (not res!1005989) (not e!830201))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480145 (= res!1005989 (= lt!646310 (Intermediate!12203 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1480145 (= lt!646310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646308 mask!2687) lt!646308 lt!646311 mask!2687))))

(assert (=> b!1480145 (= lt!646308 (select (store (arr!47963 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480146 () Bool)

(declare-fun e!830200 () Bool)

(assert (=> b!1480146 (= e!830201 (not e!830200))))

(declare-fun res!1005986 () Bool)

(assert (=> b!1480146 (=> res!1005986 e!830200)))

(assert (=> b!1480146 (= res!1005986 (or (and (= (select (arr!47963 a!2862) index!646) (select (store (arr!47963 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47963 a!2862) index!646) (select (arr!47963 a!2862) j!93))) (not (= (select (arr!47963 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47963 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830203 () Bool)

(assert (=> b!1480146 e!830203))

(declare-fun res!1005983 () Bool)

(assert (=> b!1480146 (=> (not res!1005983) (not e!830203))))

(declare-fun lt!646305 () SeekEntryResult!12203)

(declare-fun lt!646309 () SeekEntryResult!12203)

(assert (=> b!1480146 (= res!1005983 (and (= lt!646309 lt!646305) (or (= (select (arr!47963 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47963 a!2862) intermediateBeforeIndex!19) (select (arr!47963 a!2862) j!93)))))))

(assert (=> b!1480146 (= lt!646305 (Found!12203 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99368 (_ BitVec 32)) SeekEntryResult!12203)

(assert (=> b!1480146 (= lt!646309 (seekEntryOrOpen!0 (select (arr!47963 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99368 (_ BitVec 32)) Bool)

(assert (=> b!1480146 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49746 0))(
  ( (Unit!49747) )
))
(declare-fun lt!646306 () Unit!49746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49746)

(assert (=> b!1480146 (= lt!646306 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480147 () Bool)

(declare-fun e!830207 () Bool)

(declare-fun e!830202 () Bool)

(assert (=> b!1480147 (= e!830207 e!830202)))

(declare-fun res!1005987 () Bool)

(assert (=> b!1480147 (=> (not res!1005987) (not e!830202))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99368 (_ BitVec 32)) SeekEntryResult!12203)

(assert (=> b!1480147 (= res!1005987 (= lt!646309 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47963 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480148 () Bool)

(declare-fun res!1005988 () Bool)

(assert (=> b!1480148 (=> (not res!1005988) (not e!830201))))

(assert (=> b!1480148 (= res!1005988 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480149 () Bool)

(assert (=> b!1480149 (= e!830200 (= lt!646309 (seekEntryOrOpen!0 lt!646308 lt!646311 mask!2687)))))

(assert (=> b!1480149 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646308 lt!646311 mask!2687) lt!646305)))

(declare-fun lt!646304 () Unit!49746)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49746)

(assert (=> b!1480149 (= lt!646304 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1480150 () Bool)

(declare-fun res!1005975 () Bool)

(assert (=> b!1480150 (=> (not res!1005975) (not e!830205))))

(assert (=> b!1480150 (= res!1005975 (and (= (size!48513 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48513 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48513 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480151 () Bool)

(declare-fun res!1005981 () Bool)

(assert (=> b!1480151 (=> (not res!1005981) (not e!830205))))

(assert (=> b!1480151 (= res!1005981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480152 () Bool)

(assert (=> b!1480152 (= e!830205 e!830198)))

(declare-fun res!1005977 () Bool)

(assert (=> b!1480152 (=> (not res!1005977) (not e!830198))))

(assert (=> b!1480152 (= res!1005977 (= (select (store (arr!47963 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480152 (= lt!646311 (array!99369 (store (arr!47963 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48513 a!2862)))))

(declare-fun b!1480153 () Bool)

(declare-fun res!1005978 () Bool)

(assert (=> b!1480153 (=> (not res!1005978) (not e!830205))))

(assert (=> b!1480153 (= res!1005978 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48513 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48513 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48513 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480154 () Bool)

(declare-fun res!1005980 () Bool)

(assert (=> b!1480154 (=> (not res!1005980) (not e!830205))))

(assert (=> b!1480154 (= res!1005980 (validKeyInArray!0 (select (arr!47963 a!2862) j!93)))))

(declare-fun b!1480155 () Bool)

(assert (=> b!1480155 (= e!830202 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480156 () Bool)

(declare-fun res!1005982 () Bool)

(assert (=> b!1480156 (=> res!1005982 e!830200)))

(assert (=> b!1480156 (= res!1005982 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47963 a!2862) j!93) a!2862 mask!2687) lt!646305)))))

(declare-fun res!1005990 () Bool)

(assert (=> start!126262 (=> (not res!1005990) (not e!830205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126262 (= res!1005990 (validMask!0 mask!2687))))

(assert (=> start!126262 e!830205))

(assert (=> start!126262 true))

(declare-fun array_inv!36991 (array!99368) Bool)

(assert (=> start!126262 (array_inv!36991 a!2862)))

(declare-fun b!1480144 () Bool)

(assert (=> b!1480144 (= e!830203 e!830207)))

(declare-fun res!1005984 () Bool)

(assert (=> b!1480144 (=> res!1005984 e!830207)))

(assert (=> b!1480144 (= res!1005984 (or (and (= (select (arr!47963 a!2862) index!646) (select (store (arr!47963 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47963 a!2862) index!646) (select (arr!47963 a!2862) j!93))) (not (= (select (arr!47963 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480157 () Bool)

(assert (=> b!1480157 (= e!830206 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646308 lt!646311 mask!2687) (seekEntryOrOpen!0 lt!646308 lt!646311 mask!2687)))))

(declare-fun b!1480158 () Bool)

(declare-fun res!1005976 () Bool)

(assert (=> b!1480158 (=> (not res!1005976) (not e!830201))))

(assert (=> b!1480158 (= res!1005976 e!830206)))

(declare-fun c!136602 () Bool)

(assert (=> b!1480158 (= c!136602 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126262 res!1005990) b!1480150))

(assert (= (and b!1480150 res!1005975) b!1480142))

(assert (= (and b!1480142 res!1005985) b!1480154))

(assert (= (and b!1480154 res!1005980) b!1480151))

(assert (= (and b!1480151 res!1005981) b!1480140))

(assert (= (and b!1480140 res!1005979) b!1480153))

(assert (= (and b!1480153 res!1005978) b!1480152))

(assert (= (and b!1480152 res!1005977) b!1480139))

(assert (= (and b!1480139 res!1005974) b!1480143))

(assert (= (and b!1480143 res!1005991) b!1480145))

(assert (= (and b!1480145 res!1005989) b!1480158))

(assert (= (and b!1480158 c!136602) b!1480141))

(assert (= (and b!1480158 (not c!136602)) b!1480157))

(assert (= (and b!1480158 res!1005976) b!1480148))

(assert (= (and b!1480148 res!1005988) b!1480146))

(assert (= (and b!1480146 res!1005983) b!1480144))

(assert (= (and b!1480144 (not res!1005984)) b!1480147))

(assert (= (and b!1480147 res!1005987) b!1480155))

(assert (= (and b!1480146 (not res!1005986)) b!1480156))

(assert (= (and b!1480156 (not res!1005982)) b!1480149))

(declare-fun m!1365961 () Bool)

(assert (=> b!1480147 m!1365961))

(assert (=> b!1480147 m!1365961))

(declare-fun m!1365963 () Bool)

(assert (=> b!1480147 m!1365963))

(declare-fun m!1365965 () Bool)

(assert (=> b!1480149 m!1365965))

(declare-fun m!1365967 () Bool)

(assert (=> b!1480149 m!1365967))

(declare-fun m!1365969 () Bool)

(assert (=> b!1480149 m!1365969))

(declare-fun m!1365971 () Bool)

(assert (=> b!1480146 m!1365971))

(declare-fun m!1365973 () Bool)

(assert (=> b!1480146 m!1365973))

(declare-fun m!1365975 () Bool)

(assert (=> b!1480146 m!1365975))

(declare-fun m!1365977 () Bool)

(assert (=> b!1480146 m!1365977))

(declare-fun m!1365979 () Bool)

(assert (=> b!1480146 m!1365979))

(assert (=> b!1480146 m!1365961))

(declare-fun m!1365981 () Bool)

(assert (=> b!1480146 m!1365981))

(declare-fun m!1365983 () Bool)

(assert (=> b!1480146 m!1365983))

(assert (=> b!1480146 m!1365961))

(assert (=> b!1480144 m!1365979))

(assert (=> b!1480144 m!1365973))

(assert (=> b!1480144 m!1365977))

(assert (=> b!1480144 m!1365961))

(declare-fun m!1365985 () Bool)

(assert (=> b!1480141 m!1365985))

(declare-fun m!1365987 () Bool)

(assert (=> start!126262 m!1365987))

(declare-fun m!1365989 () Bool)

(assert (=> start!126262 m!1365989))

(assert (=> b!1480139 m!1365961))

(assert (=> b!1480139 m!1365961))

(declare-fun m!1365991 () Bool)

(assert (=> b!1480139 m!1365991))

(assert (=> b!1480139 m!1365991))

(assert (=> b!1480139 m!1365961))

(declare-fun m!1365993 () Bool)

(assert (=> b!1480139 m!1365993))

(declare-fun m!1365995 () Bool)

(assert (=> b!1480140 m!1365995))

(declare-fun m!1365997 () Bool)

(assert (=> b!1480151 m!1365997))

(assert (=> b!1480157 m!1365967))

(assert (=> b!1480157 m!1365965))

(assert (=> b!1480154 m!1365961))

(assert (=> b!1480154 m!1365961))

(declare-fun m!1365999 () Bool)

(assert (=> b!1480154 m!1365999))

(assert (=> b!1480156 m!1365961))

(assert (=> b!1480156 m!1365961))

(declare-fun m!1366001 () Bool)

(assert (=> b!1480156 m!1366001))

(declare-fun m!1366003 () Bool)

(assert (=> b!1480145 m!1366003))

(assert (=> b!1480145 m!1366003))

(declare-fun m!1366005 () Bool)

(assert (=> b!1480145 m!1366005))

(assert (=> b!1480145 m!1365973))

(declare-fun m!1366007 () Bool)

(assert (=> b!1480145 m!1366007))

(assert (=> b!1480143 m!1365961))

(assert (=> b!1480143 m!1365961))

(declare-fun m!1366009 () Bool)

(assert (=> b!1480143 m!1366009))

(assert (=> b!1480152 m!1365973))

(declare-fun m!1366011 () Bool)

(assert (=> b!1480152 m!1366011))

(declare-fun m!1366013 () Bool)

(assert (=> b!1480142 m!1366013))

(assert (=> b!1480142 m!1366013))

(declare-fun m!1366015 () Bool)

(assert (=> b!1480142 m!1366015))

(push 1)

(assert (not b!1480154))

(assert (not b!1480146))

(assert (not b!1480149))

(assert (not start!126262))

(assert (not b!1480156))

(assert (not b!1480142))

(assert (not b!1480141))

(assert (not b!1480157))

(assert (not b!1480147))

(assert (not b!1480140))

(assert (not b!1480143))

(assert (not b!1480151))

(assert (not b!1480145))

(assert (not b!1480139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

