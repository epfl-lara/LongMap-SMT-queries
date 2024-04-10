; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126264 () Bool)

(assert start!126264)

(declare-fun b!1480199 () Bool)

(declare-fun e!830234 () Bool)

(declare-fun e!830233 () Bool)

(assert (=> b!1480199 (= e!830234 (not e!830233))))

(declare-fun res!1006028 () Bool)

(assert (=> b!1480199 (=> res!1006028 e!830233)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99370 0))(
  ( (array!99371 (arr!47964 (Array (_ BitVec 32) (_ BitVec 64))) (size!48514 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99370)

(assert (=> b!1480199 (= res!1006028 (or (and (= (select (arr!47964 a!2862) index!646) (select (store (arr!47964 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47964 a!2862) index!646) (select (arr!47964 a!2862) j!93))) (not (= (select (arr!47964 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47964 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830236 () Bool)

(assert (=> b!1480199 e!830236))

(declare-fun res!1006044 () Bool)

(assert (=> b!1480199 (=> (not res!1006044) (not e!830236))))

(declare-datatypes ((SeekEntryResult!12204 0))(
  ( (MissingZero!12204 (index!51208 (_ BitVec 32))) (Found!12204 (index!51209 (_ BitVec 32))) (Intermediate!12204 (undefined!13016 Bool) (index!51210 (_ BitVec 32)) (x!132787 (_ BitVec 32))) (Undefined!12204) (MissingVacant!12204 (index!51211 (_ BitVec 32))) )
))
(declare-fun lt!646335 () SeekEntryResult!12204)

(declare-fun lt!646332 () SeekEntryResult!12204)

(assert (=> b!1480199 (= res!1006044 (and (= lt!646335 lt!646332) (or (= (select (arr!47964 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47964 a!2862) intermediateBeforeIndex!19) (select (arr!47964 a!2862) j!93)))))))

(assert (=> b!1480199 (= lt!646332 (Found!12204 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12204)

(assert (=> b!1480199 (= lt!646335 (seekEntryOrOpen!0 (select (arr!47964 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99370 (_ BitVec 32)) Bool)

(assert (=> b!1480199 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49748 0))(
  ( (Unit!49749) )
))
(declare-fun lt!646334 () Unit!49748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49748)

(assert (=> b!1480199 (= lt!646334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480201 () Bool)

(declare-fun res!1006035 () Bool)

(declare-fun e!830229 () Bool)

(assert (=> b!1480201 (=> (not res!1006035) (not e!830229))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480201 (= res!1006035 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48514 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48514 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48514 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!646329 () (_ BitVec 64))

(declare-fun lt!646331 () array!99370)

(declare-fun e!830231 () Bool)

(declare-fun b!1480202 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12204)

(assert (=> b!1480202 (= e!830231 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646329 lt!646331 mask!2687) (seekEntryOrOpen!0 lt!646329 lt!646331 mask!2687)))))

(declare-fun b!1480203 () Bool)

(declare-fun res!1006041 () Bool)

(assert (=> b!1480203 (=> (not res!1006041) (not e!830229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480203 (= res!1006041 (validKeyInArray!0 (select (arr!47964 a!2862) j!93)))))

(declare-fun b!1480204 () Bool)

(declare-fun e!830228 () Bool)

(assert (=> b!1480204 (= e!830236 e!830228)))

(declare-fun res!1006030 () Bool)

(assert (=> b!1480204 (=> res!1006030 e!830228)))

(assert (=> b!1480204 (= res!1006030 (or (and (= (select (arr!47964 a!2862) index!646) (select (store (arr!47964 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47964 a!2862) index!646) (select (arr!47964 a!2862) j!93))) (not (= (select (arr!47964 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480205 () Bool)

(declare-fun e!830232 () Bool)

(assert (=> b!1480205 (= e!830229 e!830232)))

(declare-fun res!1006042 () Bool)

(assert (=> b!1480205 (=> (not res!1006042) (not e!830232))))

(assert (=> b!1480205 (= res!1006042 (= (select (store (arr!47964 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480205 (= lt!646331 (array!99371 (store (arr!47964 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48514 a!2862)))))

(declare-fun b!1480206 () Bool)

(declare-fun lt!646328 () SeekEntryResult!12204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12204)

(assert (=> b!1480206 (= e!830231 (= lt!646328 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646329 lt!646331 mask!2687)))))

(declare-fun b!1480207 () Bool)

(declare-fun res!1006036 () Bool)

(assert (=> b!1480207 (=> res!1006036 e!830233)))

(assert (=> b!1480207 (= res!1006036 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47964 a!2862) j!93) a!2862 mask!2687) lt!646332)))))

(declare-fun b!1480208 () Bool)

(declare-fun res!1006031 () Bool)

(assert (=> b!1480208 (=> (not res!1006031) (not e!830234))))

(assert (=> b!1480208 (= res!1006031 e!830231)))

(declare-fun c!136605 () Bool)

(assert (=> b!1480208 (= c!136605 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480209 () Bool)

(assert (=> b!1480209 (= e!830233 (= lt!646335 (seekEntryOrOpen!0 lt!646329 lt!646331 mask!2687)))))

(assert (=> b!1480209 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646329 lt!646331 mask!2687) lt!646332)))

(declare-fun lt!646330 () Unit!49748)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49748)

(assert (=> b!1480209 (= lt!646330 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun e!830230 () Bool)

(declare-fun b!1480210 () Bool)

(assert (=> b!1480210 (= e!830230 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480211 () Bool)

(declare-fun e!830237 () Bool)

(assert (=> b!1480211 (= e!830237 e!830234)))

(declare-fun res!1006037 () Bool)

(assert (=> b!1480211 (=> (not res!1006037) (not e!830234))))

(assert (=> b!1480211 (= res!1006037 (= lt!646328 (Intermediate!12204 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480211 (= lt!646328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646329 mask!2687) lt!646329 lt!646331 mask!2687))))

(assert (=> b!1480211 (= lt!646329 (select (store (arr!47964 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480212 () Bool)

(assert (=> b!1480212 (= e!830232 e!830237)))

(declare-fun res!1006034 () Bool)

(assert (=> b!1480212 (=> (not res!1006034) (not e!830237))))

(declare-fun lt!646333 () SeekEntryResult!12204)

(assert (=> b!1480212 (= res!1006034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47964 a!2862) j!93) mask!2687) (select (arr!47964 a!2862) j!93) a!2862 mask!2687) lt!646333))))

(assert (=> b!1480212 (= lt!646333 (Intermediate!12204 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480200 () Bool)

(declare-fun res!1006032 () Bool)

(assert (=> b!1480200 (=> (not res!1006032) (not e!830234))))

(assert (=> b!1480200 (= res!1006032 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1006029 () Bool)

(assert (=> start!126264 (=> (not res!1006029) (not e!830229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126264 (= res!1006029 (validMask!0 mask!2687))))

(assert (=> start!126264 e!830229))

(assert (=> start!126264 true))

(declare-fun array_inv!36992 (array!99370) Bool)

(assert (=> start!126264 (array_inv!36992 a!2862)))

(declare-fun b!1480213 () Bool)

(declare-fun res!1006040 () Bool)

(assert (=> b!1480213 (=> (not res!1006040) (not e!830229))))

(assert (=> b!1480213 (= res!1006040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480214 () Bool)

(assert (=> b!1480214 (= e!830228 e!830230)))

(declare-fun res!1006033 () Bool)

(assert (=> b!1480214 (=> (not res!1006033) (not e!830230))))

(assert (=> b!1480214 (= res!1006033 (= lt!646335 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47964 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480215 () Bool)

(declare-fun res!1006039 () Bool)

(assert (=> b!1480215 (=> (not res!1006039) (not e!830229))))

(declare-datatypes ((List!34465 0))(
  ( (Nil!34462) (Cons!34461 (h!35829 (_ BitVec 64)) (t!49159 List!34465)) )
))
(declare-fun arrayNoDuplicates!0 (array!99370 (_ BitVec 32) List!34465) Bool)

(assert (=> b!1480215 (= res!1006039 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34462))))

(declare-fun b!1480216 () Bool)

(declare-fun res!1006038 () Bool)

(assert (=> b!1480216 (=> (not res!1006038) (not e!830237))))

(assert (=> b!1480216 (= res!1006038 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47964 a!2862) j!93) a!2862 mask!2687) lt!646333))))

(declare-fun b!1480217 () Bool)

(declare-fun res!1006043 () Bool)

(assert (=> b!1480217 (=> (not res!1006043) (not e!830229))))

(assert (=> b!1480217 (= res!1006043 (and (= (size!48514 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48514 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48514 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480218 () Bool)

(declare-fun res!1006045 () Bool)

(assert (=> b!1480218 (=> (not res!1006045) (not e!830229))))

(assert (=> b!1480218 (= res!1006045 (validKeyInArray!0 (select (arr!47964 a!2862) i!1006)))))

(assert (= (and start!126264 res!1006029) b!1480217))

(assert (= (and b!1480217 res!1006043) b!1480218))

(assert (= (and b!1480218 res!1006045) b!1480203))

(assert (= (and b!1480203 res!1006041) b!1480213))

(assert (= (and b!1480213 res!1006040) b!1480215))

(assert (= (and b!1480215 res!1006039) b!1480201))

(assert (= (and b!1480201 res!1006035) b!1480205))

(assert (= (and b!1480205 res!1006042) b!1480212))

(assert (= (and b!1480212 res!1006034) b!1480216))

(assert (= (and b!1480216 res!1006038) b!1480211))

(assert (= (and b!1480211 res!1006037) b!1480208))

(assert (= (and b!1480208 c!136605) b!1480206))

(assert (= (and b!1480208 (not c!136605)) b!1480202))

(assert (= (and b!1480208 res!1006031) b!1480200))

(assert (= (and b!1480200 res!1006032) b!1480199))

(assert (= (and b!1480199 res!1006044) b!1480204))

(assert (= (and b!1480204 (not res!1006030)) b!1480214))

(assert (= (and b!1480214 res!1006033) b!1480210))

(assert (= (and b!1480199 (not res!1006028)) b!1480207))

(assert (= (and b!1480207 (not res!1006036)) b!1480209))

(declare-fun m!1366017 () Bool)

(assert (=> b!1480214 m!1366017))

(assert (=> b!1480214 m!1366017))

(declare-fun m!1366019 () Bool)

(assert (=> b!1480214 m!1366019))

(declare-fun m!1366021 () Bool)

(assert (=> b!1480206 m!1366021))

(assert (=> b!1480207 m!1366017))

(assert (=> b!1480207 m!1366017))

(declare-fun m!1366023 () Bool)

(assert (=> b!1480207 m!1366023))

(declare-fun m!1366025 () Bool)

(assert (=> b!1480202 m!1366025))

(declare-fun m!1366027 () Bool)

(assert (=> b!1480202 m!1366027))

(declare-fun m!1366029 () Bool)

(assert (=> start!126264 m!1366029))

(declare-fun m!1366031 () Bool)

(assert (=> start!126264 m!1366031))

(assert (=> b!1480212 m!1366017))

(assert (=> b!1480212 m!1366017))

(declare-fun m!1366033 () Bool)

(assert (=> b!1480212 m!1366033))

(assert (=> b!1480212 m!1366033))

(assert (=> b!1480212 m!1366017))

(declare-fun m!1366035 () Bool)

(assert (=> b!1480212 m!1366035))

(declare-fun m!1366037 () Bool)

(assert (=> b!1480211 m!1366037))

(assert (=> b!1480211 m!1366037))

(declare-fun m!1366039 () Bool)

(assert (=> b!1480211 m!1366039))

(declare-fun m!1366041 () Bool)

(assert (=> b!1480211 m!1366041))

(declare-fun m!1366043 () Bool)

(assert (=> b!1480211 m!1366043))

(declare-fun m!1366045 () Bool)

(assert (=> b!1480218 m!1366045))

(assert (=> b!1480218 m!1366045))

(declare-fun m!1366047 () Bool)

(assert (=> b!1480218 m!1366047))

(declare-fun m!1366049 () Bool)

(assert (=> b!1480204 m!1366049))

(assert (=> b!1480204 m!1366041))

(declare-fun m!1366051 () Bool)

(assert (=> b!1480204 m!1366051))

(assert (=> b!1480204 m!1366017))

(assert (=> b!1480216 m!1366017))

(assert (=> b!1480216 m!1366017))

(declare-fun m!1366053 () Bool)

(assert (=> b!1480216 m!1366053))

(declare-fun m!1366055 () Bool)

(assert (=> b!1480213 m!1366055))

(assert (=> b!1480209 m!1366027))

(assert (=> b!1480209 m!1366025))

(declare-fun m!1366057 () Bool)

(assert (=> b!1480209 m!1366057))

(assert (=> b!1480203 m!1366017))

(assert (=> b!1480203 m!1366017))

(declare-fun m!1366059 () Bool)

(assert (=> b!1480203 m!1366059))

(declare-fun m!1366061 () Bool)

(assert (=> b!1480215 m!1366061))

(declare-fun m!1366063 () Bool)

(assert (=> b!1480199 m!1366063))

(assert (=> b!1480199 m!1366041))

(declare-fun m!1366065 () Bool)

(assert (=> b!1480199 m!1366065))

(assert (=> b!1480199 m!1366051))

(assert (=> b!1480199 m!1366049))

(assert (=> b!1480199 m!1366017))

(declare-fun m!1366067 () Bool)

(assert (=> b!1480199 m!1366067))

(declare-fun m!1366069 () Bool)

(assert (=> b!1480199 m!1366069))

(assert (=> b!1480199 m!1366017))

(assert (=> b!1480205 m!1366041))

(declare-fun m!1366071 () Bool)

(assert (=> b!1480205 m!1366071))

(check-sat (not b!1480199) (not b!1480215) (not b!1480214) (not b!1480216) (not b!1480206) (not b!1480218) (not b!1480202) (not b!1480203) (not b!1480211) (not start!126264) (not b!1480209) (not b!1480212) (not b!1480207) (not b!1480213))
(check-sat)
