; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126898 () Bool)

(assert start!126898)

(declare-fun b!1491058 () Bool)

(declare-fun res!1014282 () Bool)

(declare-fun e!835461 () Bool)

(assert (=> b!1491058 (=> (not res!1014282) (not e!835461))))

(declare-datatypes ((array!99671 0))(
  ( (array!99672 (arr!48107 (Array (_ BitVec 32) (_ BitVec 64))) (size!48657 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99671)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491058 (= res!1014282 (validKeyInArray!0 (select (arr!48107 a!2862) i!1006)))))

(declare-fun b!1491060 () Bool)

(declare-fun res!1014273 () Bool)

(declare-fun e!835456 () Bool)

(assert (=> b!1491060 (=> (not res!1014273) (not e!835456))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12347 0))(
  ( (MissingZero!12347 (index!51780 (_ BitVec 32))) (Found!12347 (index!51781 (_ BitVec 32))) (Intermediate!12347 (undefined!13159 Bool) (index!51782 (_ BitVec 32)) (x!133371 (_ BitVec 32))) (Undefined!12347) (MissingVacant!12347 (index!51783 (_ BitVec 32))) )
))
(declare-fun lt!650149 () SeekEntryResult!12347)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99671 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1491060 (= res!1014273 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48107 a!2862) j!93) a!2862 mask!2687) lt!650149))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!835457 () Bool)

(declare-fun b!1491061 () Bool)

(assert (=> b!1491061 (= e!835457 (or (= (select (arr!48107 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48107 a!2862) intermediateBeforeIndex!19) (select (arr!48107 a!2862) j!93))))))

(declare-fun b!1491062 () Bool)

(declare-fun e!835459 () Bool)

(declare-fun e!835458 () Bool)

(assert (=> b!1491062 (= e!835459 (not e!835458))))

(declare-fun res!1014280 () Bool)

(assert (=> b!1491062 (=> res!1014280 e!835458)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491062 (= res!1014280 (or (and (= (select (arr!48107 a!2862) index!646) (select (store (arr!48107 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48107 a!2862) index!646) (select (arr!48107 a!2862) j!93))) (= (select (arr!48107 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491062 e!835457))

(declare-fun res!1014269 () Bool)

(assert (=> b!1491062 (=> (not res!1014269) (not e!835457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99671 (_ BitVec 32)) Bool)

(assert (=> b!1491062 (= res!1014269 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50034 0))(
  ( (Unit!50035) )
))
(declare-fun lt!650151 () Unit!50034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50034)

(assert (=> b!1491062 (= lt!650151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491063 () Bool)

(declare-fun res!1014274 () Bool)

(assert (=> b!1491063 (=> (not res!1014274) (not e!835461))))

(assert (=> b!1491063 (= res!1014274 (validKeyInArray!0 (select (arr!48107 a!2862) j!93)))))

(declare-fun b!1491064 () Bool)

(declare-fun res!1014271 () Bool)

(assert (=> b!1491064 (=> (not res!1014271) (not e!835461))))

(declare-datatypes ((List!34608 0))(
  ( (Nil!34605) (Cons!34604 (h!35987 (_ BitVec 64)) (t!49302 List!34608)) )
))
(declare-fun arrayNoDuplicates!0 (array!99671 (_ BitVec 32) List!34608) Bool)

(assert (=> b!1491064 (= res!1014271 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34605))))

(declare-fun lt!650154 () (_ BitVec 64))

(declare-fun lt!650150 () SeekEntryResult!12347)

(declare-fun lt!650152 () array!99671)

(declare-fun b!1491065 () Bool)

(declare-fun e!835463 () Bool)

(assert (=> b!1491065 (= e!835463 (= lt!650150 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650154 lt!650152 mask!2687)))))

(declare-fun b!1491066 () Bool)

(assert (=> b!1491066 (= e!835456 e!835459)))

(declare-fun res!1014281 () Bool)

(assert (=> b!1491066 (=> (not res!1014281) (not e!835459))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491066 (= res!1014281 (= lt!650150 (Intermediate!12347 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491066 (= lt!650150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650154 mask!2687) lt!650154 lt!650152 mask!2687))))

(assert (=> b!1491066 (= lt!650154 (select (store (arr!48107 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491067 () Bool)

(declare-fun res!1014275 () Bool)

(assert (=> b!1491067 (=> (not res!1014275) (not e!835457))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99671 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1491067 (= res!1014275 (= (seekEntryOrOpen!0 (select (arr!48107 a!2862) j!93) a!2862 mask!2687) (Found!12347 j!93)))))

(declare-fun b!1491068 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99671 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1491068 (= e!835463 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650154 lt!650152 mask!2687) (seekEntryOrOpen!0 lt!650154 lt!650152 mask!2687)))))

(declare-fun b!1491069 () Bool)

(declare-fun res!1014276 () Bool)

(assert (=> b!1491069 (=> (not res!1014276) (not e!835461))))

(assert (=> b!1491069 (= res!1014276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491070 () Bool)

(declare-fun res!1014268 () Bool)

(assert (=> b!1491070 (=> (not res!1014268) (not e!835461))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491070 (= res!1014268 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48657 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48657 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48657 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491071 () Bool)

(declare-fun res!1014278 () Bool)

(assert (=> b!1491071 (=> (not res!1014278) (not e!835459))))

(assert (=> b!1491071 (= res!1014278 e!835463)))

(declare-fun c!137922 () Bool)

(assert (=> b!1491071 (= c!137922 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491059 () Bool)

(declare-fun e!835460 () Bool)

(assert (=> b!1491059 (= e!835460 e!835456)))

(declare-fun res!1014277 () Bool)

(assert (=> b!1491059 (=> (not res!1014277) (not e!835456))))

(assert (=> b!1491059 (= res!1014277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48107 a!2862) j!93) mask!2687) (select (arr!48107 a!2862) j!93) a!2862 mask!2687) lt!650149))))

(assert (=> b!1491059 (= lt!650149 (Intermediate!12347 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1014270 () Bool)

(assert (=> start!126898 (=> (not res!1014270) (not e!835461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126898 (= res!1014270 (validMask!0 mask!2687))))

(assert (=> start!126898 e!835461))

(assert (=> start!126898 true))

(declare-fun array_inv!37135 (array!99671) Bool)

(assert (=> start!126898 (array_inv!37135 a!2862)))

(declare-fun b!1491072 () Bool)

(declare-fun res!1014279 () Bool)

(assert (=> b!1491072 (=> (not res!1014279) (not e!835459))))

(assert (=> b!1491072 (= res!1014279 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491073 () Bool)

(declare-fun res!1014283 () Bool)

(assert (=> b!1491073 (=> (not res!1014283) (not e!835461))))

(assert (=> b!1491073 (= res!1014283 (and (= (size!48657 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48657 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48657 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491074 () Bool)

(assert (=> b!1491074 (= e!835458 true)))

(declare-fun lt!650153 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491074 (= lt!650153 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491075 () Bool)

(assert (=> b!1491075 (= e!835461 e!835460)))

(declare-fun res!1014272 () Bool)

(assert (=> b!1491075 (=> (not res!1014272) (not e!835460))))

(assert (=> b!1491075 (= res!1014272 (= (select (store (arr!48107 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491075 (= lt!650152 (array!99672 (store (arr!48107 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48657 a!2862)))))

(assert (= (and start!126898 res!1014270) b!1491073))

(assert (= (and b!1491073 res!1014283) b!1491058))

(assert (= (and b!1491058 res!1014282) b!1491063))

(assert (= (and b!1491063 res!1014274) b!1491069))

(assert (= (and b!1491069 res!1014276) b!1491064))

(assert (= (and b!1491064 res!1014271) b!1491070))

(assert (= (and b!1491070 res!1014268) b!1491075))

(assert (= (and b!1491075 res!1014272) b!1491059))

(assert (= (and b!1491059 res!1014277) b!1491060))

(assert (= (and b!1491060 res!1014273) b!1491066))

(assert (= (and b!1491066 res!1014281) b!1491071))

(assert (= (and b!1491071 c!137922) b!1491065))

(assert (= (and b!1491071 (not c!137922)) b!1491068))

(assert (= (and b!1491071 res!1014278) b!1491072))

(assert (= (and b!1491072 res!1014279) b!1491062))

(assert (= (and b!1491062 res!1014269) b!1491067))

(assert (= (and b!1491067 res!1014275) b!1491061))

(assert (= (and b!1491062 (not res!1014280)) b!1491074))

(declare-fun m!1375195 () Bool)

(assert (=> b!1491064 m!1375195))

(declare-fun m!1375197 () Bool)

(assert (=> b!1491067 m!1375197))

(assert (=> b!1491067 m!1375197))

(declare-fun m!1375199 () Bool)

(assert (=> b!1491067 m!1375199))

(assert (=> b!1491059 m!1375197))

(assert (=> b!1491059 m!1375197))

(declare-fun m!1375201 () Bool)

(assert (=> b!1491059 m!1375201))

(assert (=> b!1491059 m!1375201))

(assert (=> b!1491059 m!1375197))

(declare-fun m!1375203 () Bool)

(assert (=> b!1491059 m!1375203))

(declare-fun m!1375205 () Bool)

(assert (=> b!1491065 m!1375205))

(declare-fun m!1375207 () Bool)

(assert (=> b!1491074 m!1375207))

(declare-fun m!1375209 () Bool)

(assert (=> b!1491062 m!1375209))

(declare-fun m!1375211 () Bool)

(assert (=> b!1491062 m!1375211))

(declare-fun m!1375213 () Bool)

(assert (=> b!1491062 m!1375213))

(declare-fun m!1375215 () Bool)

(assert (=> b!1491062 m!1375215))

(declare-fun m!1375217 () Bool)

(assert (=> b!1491062 m!1375217))

(assert (=> b!1491062 m!1375197))

(declare-fun m!1375219 () Bool)

(assert (=> b!1491069 m!1375219))

(assert (=> b!1491075 m!1375211))

(declare-fun m!1375221 () Bool)

(assert (=> b!1491075 m!1375221))

(declare-fun m!1375223 () Bool)

(assert (=> b!1491058 m!1375223))

(assert (=> b!1491058 m!1375223))

(declare-fun m!1375225 () Bool)

(assert (=> b!1491058 m!1375225))

(assert (=> b!1491060 m!1375197))

(assert (=> b!1491060 m!1375197))

(declare-fun m!1375227 () Bool)

(assert (=> b!1491060 m!1375227))

(assert (=> b!1491063 m!1375197))

(assert (=> b!1491063 m!1375197))

(declare-fun m!1375229 () Bool)

(assert (=> b!1491063 m!1375229))

(declare-fun m!1375231 () Bool)

(assert (=> b!1491066 m!1375231))

(assert (=> b!1491066 m!1375231))

(declare-fun m!1375233 () Bool)

(assert (=> b!1491066 m!1375233))

(assert (=> b!1491066 m!1375211))

(declare-fun m!1375235 () Bool)

(assert (=> b!1491066 m!1375235))

(declare-fun m!1375237 () Bool)

(assert (=> b!1491068 m!1375237))

(declare-fun m!1375239 () Bool)

(assert (=> b!1491068 m!1375239))

(declare-fun m!1375241 () Bool)

(assert (=> start!126898 m!1375241))

(declare-fun m!1375243 () Bool)

(assert (=> start!126898 m!1375243))

(declare-fun m!1375245 () Bool)

(assert (=> b!1491061 m!1375245))

(assert (=> b!1491061 m!1375197))

(push 1)

