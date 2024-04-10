; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126938 () Bool)

(assert start!126938)

(declare-fun b!1492138 () Bool)

(declare-fun e!835941 () Bool)

(declare-fun e!835939 () Bool)

(assert (=> b!1492138 (= e!835941 e!835939)))

(declare-fun res!1015241 () Bool)

(assert (=> b!1492138 (=> (not res!1015241) (not e!835939))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12367 0))(
  ( (MissingZero!12367 (index!51860 (_ BitVec 32))) (Found!12367 (index!51861 (_ BitVec 32))) (Intermediate!12367 (undefined!13179 Bool) (index!51862 (_ BitVec 32)) (x!133439 (_ BitVec 32))) (Undefined!12367) (MissingVacant!12367 (index!51863 (_ BitVec 32))) )
))
(declare-fun lt!650513 () SeekEntryResult!12367)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492138 (= res!1015241 (= lt!650513 (Intermediate!12367 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99711 0))(
  ( (array!99712 (arr!48127 (Array (_ BitVec 32) (_ BitVec 64))) (size!48677 (_ BitVec 32))) )
))
(declare-fun lt!650514 () array!99711)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650512 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99711 (_ BitVec 32)) SeekEntryResult!12367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492138 (= lt!650513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650512 mask!2687) lt!650512 lt!650514 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99711)

(assert (=> b!1492138 (= lt!650512 (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492139 () Bool)

(declare-fun res!1015243 () Bool)

(declare-fun e!835936 () Bool)

(assert (=> b!1492139 (=> (not res!1015243) (not e!835936))))

(assert (=> b!1492139 (= res!1015243 (and (= (size!48677 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48677 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48677 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492140 () Bool)

(declare-fun res!1015232 () Bool)

(assert (=> b!1492140 (=> (not res!1015232) (not e!835939))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492140 (= res!1015232 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492141 () Bool)

(declare-fun e!835937 () Bool)

(assert (=> b!1492141 (= e!835936 e!835937)))

(declare-fun res!1015242 () Bool)

(assert (=> b!1492141 (=> (not res!1015242) (not e!835937))))

(assert (=> b!1492141 (= res!1015242 (= (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492141 (= lt!650514 (array!99712 (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48677 a!2862)))))

(declare-fun b!1492142 () Bool)

(declare-fun res!1015229 () Bool)

(assert (=> b!1492142 (=> (not res!1015229) (not e!835941))))

(declare-fun lt!650509 () SeekEntryResult!12367)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1492142 (= res!1015229 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650509))))

(declare-fun b!1492143 () Bool)

(declare-fun res!1015240 () Bool)

(assert (=> b!1492143 (=> (not res!1015240) (not e!835936))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1492143 (= res!1015240 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48677 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48677 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48677 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492145 () Bool)

(declare-fun res!1015236 () Bool)

(declare-fun e!835938 () Bool)

(assert (=> b!1492145 (=> (not res!1015236) (not e!835938))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99711 (_ BitVec 32)) SeekEntryResult!12367)

(assert (=> b!1492145 (= res!1015236 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) (Found!12367 j!93)))))

(declare-fun b!1492146 () Bool)

(declare-fun res!1015231 () Bool)

(assert (=> b!1492146 (=> (not res!1015231) (not e!835936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492146 (= res!1015231 (validKeyInArray!0 (select (arr!48127 a!2862) j!93)))))

(declare-fun e!835940 () Bool)

(declare-fun b!1492147 () Bool)

(assert (=> b!1492147 (= e!835940 (= lt!650513 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650512 lt!650514 mask!2687)))))

(declare-fun b!1492148 () Bool)

(declare-fun res!1015239 () Bool)

(assert (=> b!1492148 (=> (not res!1015239) (not e!835939))))

(assert (=> b!1492148 (= res!1015239 e!835940)))

(declare-fun c!137982 () Bool)

(assert (=> b!1492148 (= c!137982 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492149 () Bool)

(declare-fun e!835943 () Bool)

(assert (=> b!1492149 (= e!835943 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!650511 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492149 (= lt!650511 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492150 () Bool)

(declare-fun res!1015238 () Bool)

(assert (=> b!1492150 (=> (not res!1015238) (not e!835936))))

(assert (=> b!1492150 (= res!1015238 (validKeyInArray!0 (select (arr!48127 a!2862) i!1006)))))

(declare-fun b!1492151 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99711 (_ BitVec 32)) SeekEntryResult!12367)

(assert (=> b!1492151 (= e!835940 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650512 lt!650514 mask!2687) (seekEntryOrOpen!0 lt!650512 lt!650514 mask!2687)))))

(declare-fun b!1492152 () Bool)

(declare-fun res!1015234 () Bool)

(assert (=> b!1492152 (=> (not res!1015234) (not e!835936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99711 (_ BitVec 32)) Bool)

(assert (=> b!1492152 (= res!1015234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492153 () Bool)

(assert (=> b!1492153 (= e!835939 (not e!835943))))

(declare-fun res!1015235 () Bool)

(assert (=> b!1492153 (=> res!1015235 e!835943)))

(assert (=> b!1492153 (= res!1015235 (or (and (= (select (arr!48127 a!2862) index!646) (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48127 a!2862) index!646) (select (arr!48127 a!2862) j!93))) (= (select (arr!48127 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492153 e!835938))

(declare-fun res!1015233 () Bool)

(assert (=> b!1492153 (=> (not res!1015233) (not e!835938))))

(assert (=> b!1492153 (= res!1015233 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50074 0))(
  ( (Unit!50075) )
))
(declare-fun lt!650510 () Unit!50074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50074)

(assert (=> b!1492153 (= lt!650510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492144 () Bool)

(declare-fun res!1015228 () Bool)

(assert (=> b!1492144 (=> (not res!1015228) (not e!835936))))

(declare-datatypes ((List!34628 0))(
  ( (Nil!34625) (Cons!34624 (h!36007 (_ BitVec 64)) (t!49322 List!34628)) )
))
(declare-fun arrayNoDuplicates!0 (array!99711 (_ BitVec 32) List!34628) Bool)

(assert (=> b!1492144 (= res!1015228 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34625))))

(declare-fun res!1015230 () Bool)

(assert (=> start!126938 (=> (not res!1015230) (not e!835936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126938 (= res!1015230 (validMask!0 mask!2687))))

(assert (=> start!126938 e!835936))

(assert (=> start!126938 true))

(declare-fun array_inv!37155 (array!99711) Bool)

(assert (=> start!126938 (array_inv!37155 a!2862)))

(declare-fun b!1492154 () Bool)

(assert (=> b!1492154 (= e!835937 e!835941)))

(declare-fun res!1015237 () Bool)

(assert (=> b!1492154 (=> (not res!1015237) (not e!835941))))

(assert (=> b!1492154 (= res!1015237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650509))))

(assert (=> b!1492154 (= lt!650509 (Intermediate!12367 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492155 () Bool)

(assert (=> b!1492155 (= e!835938 (or (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) (select (arr!48127 a!2862) j!93))))))

(assert (= (and start!126938 res!1015230) b!1492139))

(assert (= (and b!1492139 res!1015243) b!1492150))

(assert (= (and b!1492150 res!1015238) b!1492146))

(assert (= (and b!1492146 res!1015231) b!1492152))

(assert (= (and b!1492152 res!1015234) b!1492144))

(assert (= (and b!1492144 res!1015228) b!1492143))

(assert (= (and b!1492143 res!1015240) b!1492141))

(assert (= (and b!1492141 res!1015242) b!1492154))

(assert (= (and b!1492154 res!1015237) b!1492142))

(assert (= (and b!1492142 res!1015229) b!1492138))

(assert (= (and b!1492138 res!1015241) b!1492148))

(assert (= (and b!1492148 c!137982) b!1492147))

(assert (= (and b!1492148 (not c!137982)) b!1492151))

(assert (= (and b!1492148 res!1015239) b!1492140))

(assert (= (and b!1492140 res!1015232) b!1492153))

(assert (= (and b!1492153 res!1015233) b!1492145))

(assert (= (and b!1492145 res!1015236) b!1492155))

(assert (= (and b!1492153 (not res!1015235)) b!1492149))

(declare-fun m!1376235 () Bool)

(assert (=> b!1492147 m!1376235))

(declare-fun m!1376237 () Bool)

(assert (=> b!1492149 m!1376237))

(declare-fun m!1376239 () Bool)

(assert (=> b!1492141 m!1376239))

(declare-fun m!1376241 () Bool)

(assert (=> b!1492141 m!1376241))

(declare-fun m!1376243 () Bool)

(assert (=> b!1492152 m!1376243))

(declare-fun m!1376245 () Bool)

(assert (=> b!1492153 m!1376245))

(assert (=> b!1492153 m!1376239))

(declare-fun m!1376247 () Bool)

(assert (=> b!1492153 m!1376247))

(declare-fun m!1376249 () Bool)

(assert (=> b!1492153 m!1376249))

(declare-fun m!1376251 () Bool)

(assert (=> b!1492153 m!1376251))

(declare-fun m!1376253 () Bool)

(assert (=> b!1492153 m!1376253))

(declare-fun m!1376255 () Bool)

(assert (=> start!126938 m!1376255))

(declare-fun m!1376257 () Bool)

(assert (=> start!126938 m!1376257))

(declare-fun m!1376259 () Bool)

(assert (=> b!1492144 m!1376259))

(declare-fun m!1376261 () Bool)

(assert (=> b!1492138 m!1376261))

(assert (=> b!1492138 m!1376261))

(declare-fun m!1376263 () Bool)

(assert (=> b!1492138 m!1376263))

(assert (=> b!1492138 m!1376239))

(declare-fun m!1376265 () Bool)

(assert (=> b!1492138 m!1376265))

(assert (=> b!1492146 m!1376253))

(assert (=> b!1492146 m!1376253))

(declare-fun m!1376267 () Bool)

(assert (=> b!1492146 m!1376267))

(declare-fun m!1376269 () Bool)

(assert (=> b!1492155 m!1376269))

(assert (=> b!1492155 m!1376253))

(assert (=> b!1492142 m!1376253))

(assert (=> b!1492142 m!1376253))

(declare-fun m!1376271 () Bool)

(assert (=> b!1492142 m!1376271))

(declare-fun m!1376273 () Bool)

(assert (=> b!1492151 m!1376273))

(declare-fun m!1376275 () Bool)

(assert (=> b!1492151 m!1376275))

(declare-fun m!1376277 () Bool)

(assert (=> b!1492150 m!1376277))

(assert (=> b!1492150 m!1376277))

(declare-fun m!1376279 () Bool)

(assert (=> b!1492150 m!1376279))

(assert (=> b!1492145 m!1376253))

(assert (=> b!1492145 m!1376253))

(declare-fun m!1376281 () Bool)

(assert (=> b!1492145 m!1376281))

(assert (=> b!1492154 m!1376253))

(assert (=> b!1492154 m!1376253))

(declare-fun m!1376283 () Bool)

(assert (=> b!1492154 m!1376283))

(assert (=> b!1492154 m!1376283))

(assert (=> b!1492154 m!1376253))

(declare-fun m!1376285 () Bool)

(assert (=> b!1492154 m!1376285))

(push 1)

(assert (not b!1492153))

(assert (not b!1492150))

(assert (not b!1492144))

(assert (not b!1492142))

(assert (not b!1492147))

(assert (not b!1492145))

(assert (not b!1492138))

(assert (not b!1492154))

(assert (not b!1492149))

(assert (not start!126938))

(assert (not b!1492146))

(assert (not b!1492151))

(assert (not b!1492152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156843 () Bool)

(assert (=> d!156843 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126938 d!156843))

(declare-fun d!156847 () Bool)

(assert (=> d!156847 (= (array_inv!37155 a!2862) (bvsge (size!48677 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126938 d!156847))

(declare-fun d!156849 () Bool)

(assert (=> d!156849 (= (validKeyInArray!0 (select (arr!48127 a!2862) j!93)) (and (not (= (select (arr!48127 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48127 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492146 d!156849))

(declare-fun b!1492268 () Bool)

(declare-fun e!836013 () SeekEntryResult!12367)

(assert (=> b!1492268 (= e!836013 (Intermediate!12367 true index!646 x!665))))

(declare-fun b!1492269 () Bool)

(declare-fun e!836011 () Bool)

(declare-fun e!836014 () Bool)

(assert (=> b!1492269 (= e!836011 e!836014)))

(declare-fun res!1015278 () Bool)

(declare-fun lt!650559 () SeekEntryResult!12367)

(assert (=> b!1492269 (= res!1015278 (and (is-Intermediate!12367 lt!650559) (not (undefined!13179 lt!650559)) (bvslt (x!133439 lt!650559) #b01111111111111111111111111111110) (bvsge (x!133439 lt!650559) #b00000000000000000000000000000000) (bvsge (x!133439 lt!650559) x!665)))))

(assert (=> b!1492269 (=> (not res!1015278) (not e!836014))))

(declare-fun b!1492270 () Bool)

(assert (=> b!1492270 (and (bvsge (index!51862 lt!650559) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650559) (size!48677 lt!650514)))))

(declare-fun e!836015 () Bool)

(assert (=> b!1492270 (= e!836015 (= (select (arr!48127 lt!650514) (index!51862 lt!650559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492271 () Bool)

(assert (=> b!1492271 (and (bvsge (index!51862 lt!650559) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650559) (size!48677 lt!650514)))))

(declare-fun res!1015277 () Bool)

(assert (=> b!1492271 (= res!1015277 (= (select (arr!48127 lt!650514) (index!51862 lt!650559)) lt!650512))))

(assert (=> b!1492271 (=> res!1015277 e!836015)))

(assert (=> b!1492271 (= e!836014 e!836015)))

(declare-fun b!1492272 () Bool)

(assert (=> b!1492272 (= e!836011 (bvsge (x!133439 lt!650559) #b01111111111111111111111111111110))))

(declare-fun b!1492273 () Bool)

(assert (=> b!1492273 (and (bvsge (index!51862 lt!650559) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650559) (size!48677 lt!650514)))))

(declare-fun res!1015276 () Bool)

(assert (=> b!1492273 (= res!1015276 (= (select (arr!48127 lt!650514) (index!51862 lt!650559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492273 (=> res!1015276 e!836015)))

(declare-fun b!1492274 () Bool)

(declare-fun e!836012 () SeekEntryResult!12367)

(assert (=> b!1492274 (= e!836013 e!836012)))

(declare-fun c!138023 () Bool)

(declare-fun lt!650558 () (_ BitVec 64))

(assert (=> b!1492274 (= c!138023 (or (= lt!650558 lt!650512) (= (bvadd lt!650558 lt!650558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156851 () Bool)

(assert (=> d!156851 e!836011))

(declare-fun c!138024 () Bool)

(assert (=> d!156851 (= c!138024 (and (is-Intermediate!12367 lt!650559) (undefined!13179 lt!650559)))))

(assert (=> d!156851 (= lt!650559 e!836013)))

(declare-fun c!138025 () Bool)

(assert (=> d!156851 (= c!138025 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156851 (= lt!650558 (select (arr!48127 lt!650514) index!646))))

(assert (=> d!156851 (validMask!0 mask!2687)))

(assert (=> d!156851 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650512 lt!650514 mask!2687) lt!650559)))

(declare-fun b!1492275 () Bool)

(assert (=> b!1492275 (= e!836012 (Intermediate!12367 false index!646 x!665))))

(declare-fun b!1492276 () Bool)

(assert (=> b!1492276 (= e!836012 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650512 lt!650514 mask!2687))))

(assert (= (and d!156851 c!138025) b!1492268))

(assert (= (and d!156851 (not c!138025)) b!1492274))

(assert (= (and b!1492274 c!138023) b!1492275))

(assert (= (and b!1492274 (not c!138023)) b!1492276))

(assert (= (and d!156851 c!138024) b!1492272))

(assert (= (and d!156851 (not c!138024)) b!1492269))

(assert (= (and b!1492269 res!1015278) b!1492271))

(assert (= (and b!1492271 (not res!1015277)) b!1492273))

(assert (= (and b!1492273 (not res!1015276)) b!1492270))

(assert (=> b!1492276 m!1376237))

(assert (=> b!1492276 m!1376237))

(declare-fun m!1376337 () Bool)

(assert (=> b!1492276 m!1376337))

(declare-fun m!1376339 () Bool)

(assert (=> b!1492270 m!1376339))

(assert (=> b!1492273 m!1376339))

(assert (=> b!1492271 m!1376339))

(declare-fun m!1376341 () Bool)

(assert (=> d!156851 m!1376341))

(assert (=> d!156851 m!1376255))

(assert (=> b!1492147 d!156851))

(declare-fun d!156857 () Bool)

(declare-fun lt!650566 () (_ BitVec 32))

(assert (=> d!156857 (and (bvsge lt!650566 #b00000000000000000000000000000000) (bvslt lt!650566 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156857 (= lt!650566 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156857 (validMask!0 mask!2687)))

(assert (=> d!156857 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650566)))

(declare-fun bs!42862 () Bool)

(assert (= bs!42862 d!156857))

(declare-fun m!1376343 () Bool)

(assert (=> bs!42862 m!1376343))

(assert (=> bs!42862 m!1376255))

(assert (=> b!1492149 d!156857))

(declare-fun b!1492297 () Bool)

(declare-fun e!836027 () SeekEntryResult!12367)

(assert (=> b!1492297 (= e!836027 (Intermediate!12367 true (toIndex!0 lt!650512 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492298 () Bool)

(declare-fun e!836025 () Bool)

(declare-fun e!836029 () Bool)

(assert (=> b!1492298 (= e!836025 e!836029)))

(declare-fun res!1015281 () Bool)

(declare-fun lt!650572 () SeekEntryResult!12367)

(assert (=> b!1492298 (= res!1015281 (and (is-Intermediate!12367 lt!650572) (not (undefined!13179 lt!650572)) (bvslt (x!133439 lt!650572) #b01111111111111111111111111111110) (bvsge (x!133439 lt!650572) #b00000000000000000000000000000000) (bvsge (x!133439 lt!650572) #b00000000000000000000000000000000)))))

(assert (=> b!1492298 (=> (not res!1015281) (not e!836029))))

(declare-fun b!1492299 () Bool)

(assert (=> b!1492299 (and (bvsge (index!51862 lt!650572) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650572) (size!48677 lt!650514)))))

(declare-fun e!836030 () Bool)

(assert (=> b!1492299 (= e!836030 (= (select (arr!48127 lt!650514) (index!51862 lt!650572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492300 () Bool)

(assert (=> b!1492300 (and (bvsge (index!51862 lt!650572) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650572) (size!48677 lt!650514)))))

(declare-fun res!1015280 () Bool)

(assert (=> b!1492300 (= res!1015280 (= (select (arr!48127 lt!650514) (index!51862 lt!650572)) lt!650512))))

(assert (=> b!1492300 (=> res!1015280 e!836030)))

(assert (=> b!1492300 (= e!836029 e!836030)))

(declare-fun b!1492301 () Bool)

(assert (=> b!1492301 (= e!836025 (bvsge (x!133439 lt!650572) #b01111111111111111111111111111110))))

(declare-fun b!1492302 () Bool)

(assert (=> b!1492302 (and (bvsge (index!51862 lt!650572) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650572) (size!48677 lt!650514)))))

(declare-fun res!1015279 () Bool)

(assert (=> b!1492302 (= res!1015279 (= (select (arr!48127 lt!650514) (index!51862 lt!650572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492302 (=> res!1015279 e!836030)))

(declare-fun b!1492303 () Bool)

(declare-fun e!836026 () SeekEntryResult!12367)

(assert (=> b!1492303 (= e!836027 e!836026)))

(declare-fun c!138034 () Bool)

(declare-fun lt!650571 () (_ BitVec 64))

(assert (=> b!1492303 (= c!138034 (or (= lt!650571 lt!650512) (= (bvadd lt!650571 lt!650571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156859 () Bool)

(assert (=> d!156859 e!836025))

(declare-fun c!138037 () Bool)

(assert (=> d!156859 (= c!138037 (and (is-Intermediate!12367 lt!650572) (undefined!13179 lt!650572)))))

(assert (=> d!156859 (= lt!650572 e!836027)))

(declare-fun c!138038 () Bool)

(assert (=> d!156859 (= c!138038 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156859 (= lt!650571 (select (arr!48127 lt!650514) (toIndex!0 lt!650512 mask!2687)))))

(assert (=> d!156859 (validMask!0 mask!2687)))

(assert (=> d!156859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650512 mask!2687) lt!650512 lt!650514 mask!2687) lt!650572)))

(declare-fun b!1492304 () Bool)

(assert (=> b!1492304 (= e!836026 (Intermediate!12367 false (toIndex!0 lt!650512 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1492305 () Bool)

(assert (=> b!1492305 (= e!836026 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650512 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650512 lt!650514 mask!2687))))

(assert (= (and d!156859 c!138038) b!1492297))

(assert (= (and d!156859 (not c!138038)) b!1492303))

(assert (= (and b!1492303 c!138034) b!1492304))

(assert (= (and b!1492303 (not c!138034)) b!1492305))

(assert (= (and d!156859 c!138037) b!1492301))

(assert (= (and d!156859 (not c!138037)) b!1492298))

(assert (= (and b!1492298 res!1015281) b!1492300))

(assert (= (and b!1492300 (not res!1015280)) b!1492302))

(assert (= (and b!1492302 (not res!1015279)) b!1492299))

(assert (=> b!1492305 m!1376261))

(declare-fun m!1376345 () Bool)

(assert (=> b!1492305 m!1376345))

(assert (=> b!1492305 m!1376345))

(declare-fun m!1376347 () Bool)

(assert (=> b!1492305 m!1376347))

(declare-fun m!1376349 () Bool)

(assert (=> b!1492299 m!1376349))

(assert (=> b!1492302 m!1376349))

(assert (=> b!1492300 m!1376349))

(assert (=> d!156859 m!1376261))

(declare-fun m!1376351 () Bool)

(assert (=> d!156859 m!1376351))

(assert (=> d!156859 m!1376255))

(assert (=> b!1492138 d!156859))

(declare-fun d!156861 () Bool)

(declare-fun lt!650582 () (_ BitVec 32))

(declare-fun lt!650581 () (_ BitVec 32))

(assert (=> d!156861 (= lt!650582 (bvmul (bvxor lt!650581 (bvlshr lt!650581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156861 (= lt!650581 ((_ extract 31 0) (bvand (bvxor lt!650512 (bvlshr lt!650512 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156861 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015288 (let ((h!36008 ((_ extract 31 0) (bvand (bvxor lt!650512 (bvlshr lt!650512 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133447 (bvmul (bvxor h!36008 (bvlshr h!36008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133447 (bvlshr x!133447 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015288 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015288 #b00000000000000000000000000000000))))))

(assert (=> d!156861 (= (toIndex!0 lt!650512 mask!2687) (bvand (bvxor lt!650582 (bvlshr lt!650582 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492138 d!156861))

(declare-fun d!156865 () Bool)

(assert (=> d!156865 (= (validKeyInArray!0 (select (arr!48127 a!2862) i!1006)) (and (not (= (select (arr!48127 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48127 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492150 d!156865))

(declare-fun d!156867 () Bool)

(declare-fun res!1015303 () Bool)

(declare-fun e!836064 () Bool)

(assert (=> d!156867 (=> res!1015303 e!836064)))

(assert (=> d!156867 (= res!1015303 (bvsge #b00000000000000000000000000000000 (size!48677 a!2862)))))

(assert (=> d!156867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836064)))

(declare-fun b!1492363 () Bool)

(declare-fun e!836066 () Bool)

(assert (=> b!1492363 (= e!836064 e!836066)))

(declare-fun c!138058 () Bool)

(assert (=> b!1492363 (= c!138058 (validKeyInArray!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1492364 () Bool)

(declare-fun e!836065 () Bool)

(declare-fun call!67946 () Bool)

(assert (=> b!1492364 (= e!836065 call!67946)))

(declare-fun b!1492365 () Bool)

(assert (=> b!1492365 (= e!836066 e!836065)))

(declare-fun lt!650602 () (_ BitVec 64))

(assert (=> b!1492365 (= lt!650602 (select (arr!48127 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650604 () Unit!50074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99711 (_ BitVec 64) (_ BitVec 32)) Unit!50074)

(assert (=> b!1492365 (= lt!650604 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650602 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1492365 (arrayContainsKey!0 a!2862 lt!650602 #b00000000000000000000000000000000)))

(declare-fun lt!650603 () Unit!50074)

(assert (=> b!1492365 (= lt!650603 lt!650604)))

(declare-fun res!1015304 () Bool)

(assert (=> b!1492365 (= res!1015304 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12367 #b00000000000000000000000000000000)))))

(assert (=> b!1492365 (=> (not res!1015304) (not e!836065))))

(declare-fun b!1492366 () Bool)

(assert (=> b!1492366 (= e!836066 call!67946)))

(declare-fun bm!67943 () Bool)

(assert (=> bm!67943 (= call!67946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156867 (not res!1015303)) b!1492363))

(assert (= (and b!1492363 c!138058) b!1492365))

(assert (= (and b!1492363 (not c!138058)) b!1492366))

(assert (= (and b!1492365 res!1015304) b!1492364))

(assert (= (or b!1492364 b!1492366) bm!67943))

(declare-fun m!1376385 () Bool)

(assert (=> b!1492363 m!1376385))

(assert (=> b!1492363 m!1376385))

(declare-fun m!1376387 () Bool)

(assert (=> b!1492363 m!1376387))

(assert (=> b!1492365 m!1376385))

(declare-fun m!1376389 () Bool)

(assert (=> b!1492365 m!1376389))

(declare-fun m!1376391 () Bool)

(assert (=> b!1492365 m!1376391))

(assert (=> b!1492365 m!1376385))

(declare-fun m!1376393 () Bool)

(assert (=> b!1492365 m!1376393))

(declare-fun m!1376395 () Bool)

(assert (=> bm!67943 m!1376395))

(assert (=> b!1492152 d!156867))

(declare-fun b!1492423 () Bool)

(declare-fun e!836098 () SeekEntryResult!12367)

(declare-fun e!836100 () SeekEntryResult!12367)

(assert (=> b!1492423 (= e!836098 e!836100)))

(declare-fun c!138080 () Bool)

(declare-fun lt!650624 () (_ BitVec 64))

(assert (=> b!1492423 (= c!138080 (= lt!650624 lt!650512))))

(declare-fun b!1492424 () Bool)

(declare-fun e!836099 () SeekEntryResult!12367)

(assert (=> b!1492424 (= e!836099 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650512 lt!650514 mask!2687))))

(declare-fun b!1492425 () Bool)

(assert (=> b!1492425 (= e!836100 (Found!12367 index!646))))

(declare-fun b!1492426 () Bool)

(assert (=> b!1492426 (= e!836098 Undefined!12367)))

(declare-fun b!1492427 () Bool)

(assert (=> b!1492427 (= e!836099 (MissingVacant!12367 intermediateAfterIndex!19))))

(declare-fun b!1492428 () Bool)

(declare-fun c!138081 () Bool)

(assert (=> b!1492428 (= c!138081 (= lt!650624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492428 (= e!836100 e!836099)))

(declare-fun d!156881 () Bool)

(declare-fun lt!650625 () SeekEntryResult!12367)

(assert (=> d!156881 (and (or (is-Undefined!12367 lt!650625) (not (is-Found!12367 lt!650625)) (and (bvsge (index!51861 lt!650625) #b00000000000000000000000000000000) (bvslt (index!51861 lt!650625) (size!48677 lt!650514)))) (or (is-Undefined!12367 lt!650625) (is-Found!12367 lt!650625) (not (is-MissingVacant!12367 lt!650625)) (not (= (index!51863 lt!650625) intermediateAfterIndex!19)) (and (bvsge (index!51863 lt!650625) #b00000000000000000000000000000000) (bvslt (index!51863 lt!650625) (size!48677 lt!650514)))) (or (is-Undefined!12367 lt!650625) (ite (is-Found!12367 lt!650625) (= (select (arr!48127 lt!650514) (index!51861 lt!650625)) lt!650512) (and (is-MissingVacant!12367 lt!650625) (= (index!51863 lt!650625) intermediateAfterIndex!19) (= (select (arr!48127 lt!650514) (index!51863 lt!650625)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156881 (= lt!650625 e!836098)))

(declare-fun c!138082 () Bool)

(assert (=> d!156881 (= c!138082 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156881 (= lt!650624 (select (arr!48127 lt!650514) index!646))))

(assert (=> d!156881 (validMask!0 mask!2687)))

(assert (=> d!156881 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650512 lt!650514 mask!2687) lt!650625)))

(assert (= (and d!156881 c!138082) b!1492426))

(assert (= (and d!156881 (not c!138082)) b!1492423))

(assert (= (and b!1492423 c!138080) b!1492425))

(assert (= (and b!1492423 (not c!138080)) b!1492428))

(assert (= (and b!1492428 c!138081) b!1492427))

(assert (= (and b!1492428 (not c!138081)) b!1492424))

(assert (=> b!1492424 m!1376237))

(assert (=> b!1492424 m!1376237))

(declare-fun m!1376419 () Bool)

(assert (=> b!1492424 m!1376419))

(declare-fun m!1376421 () Bool)

(assert (=> d!156881 m!1376421))

(declare-fun m!1376423 () Bool)

(assert (=> d!156881 m!1376423))

(assert (=> d!156881 m!1376341))

(assert (=> d!156881 m!1376255))

(assert (=> b!1492151 d!156881))

(declare-fun d!156895 () Bool)

(declare-fun lt!650643 () SeekEntryResult!12367)

(assert (=> d!156895 (and (or (is-Undefined!12367 lt!650643) (not (is-Found!12367 lt!650643)) (and (bvsge (index!51861 lt!650643) #b00000000000000000000000000000000) (bvslt (index!51861 lt!650643) (size!48677 lt!650514)))) (or (is-Undefined!12367 lt!650643) (is-Found!12367 lt!650643) (not (is-MissingZero!12367 lt!650643)) (and (bvsge (index!51860 lt!650643) #b00000000000000000000000000000000) (bvslt (index!51860 lt!650643) (size!48677 lt!650514)))) (or (is-Undefined!12367 lt!650643) (is-Found!12367 lt!650643) (is-MissingZero!12367 lt!650643) (not (is-MissingVacant!12367 lt!650643)) (and (bvsge (index!51863 lt!650643) #b00000000000000000000000000000000) (bvslt (index!51863 lt!650643) (size!48677 lt!650514)))) (or (is-Undefined!12367 lt!650643) (ite (is-Found!12367 lt!650643) (= (select (arr!48127 lt!650514) (index!51861 lt!650643)) lt!650512) (ite (is-MissingZero!12367 lt!650643) (= (select (arr!48127 lt!650514) (index!51860 lt!650643)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12367 lt!650643) (= (select (arr!48127 lt!650514) (index!51863 lt!650643)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!836123 () SeekEntryResult!12367)

(assert (=> d!156895 (= lt!650643 e!836123)))

(declare-fun c!138096 () Bool)

(declare-fun lt!650645 () SeekEntryResult!12367)

(assert (=> d!156895 (= c!138096 (and (is-Intermediate!12367 lt!650645) (undefined!13179 lt!650645)))))

(assert (=> d!156895 (= lt!650645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650512 mask!2687) lt!650512 lt!650514 mask!2687))))

(assert (=> d!156895 (validMask!0 mask!2687)))

(assert (=> d!156895 (= (seekEntryOrOpen!0 lt!650512 lt!650514 mask!2687) lt!650643)))

(declare-fun b!1492460 () Bool)

(assert (=> b!1492460 (= e!836123 Undefined!12367)))

(declare-fun b!1492461 () Bool)

(declare-fun c!138095 () Bool)

(declare-fun lt!650644 () (_ BitVec 64))

(assert (=> b!1492461 (= c!138095 (= lt!650644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836124 () SeekEntryResult!12367)

(declare-fun e!836122 () SeekEntryResult!12367)

(assert (=> b!1492461 (= e!836124 e!836122)))

(declare-fun b!1492462 () Bool)

(assert (=> b!1492462 (= e!836122 (seekKeyOrZeroReturnVacant!0 (x!133439 lt!650645) (index!51862 lt!650645) (index!51862 lt!650645) lt!650512 lt!650514 mask!2687))))

(declare-fun b!1492463 () Bool)

(assert (=> b!1492463 (= e!836122 (MissingZero!12367 (index!51862 lt!650645)))))

(declare-fun b!1492464 () Bool)

(assert (=> b!1492464 (= e!836124 (Found!12367 (index!51862 lt!650645)))))

(declare-fun b!1492465 () Bool)

(assert (=> b!1492465 (= e!836123 e!836124)))

(assert (=> b!1492465 (= lt!650644 (select (arr!48127 lt!650514) (index!51862 lt!650645)))))

(declare-fun c!138097 () Bool)

(assert (=> b!1492465 (= c!138097 (= lt!650644 lt!650512))))

(assert (= (and d!156895 c!138096) b!1492460))

(assert (= (and d!156895 (not c!138096)) b!1492465))

(assert (= (and b!1492465 c!138097) b!1492464))

(assert (= (and b!1492465 (not c!138097)) b!1492461))

(assert (= (and b!1492461 c!138095) b!1492463))

(assert (= (and b!1492461 (not c!138095)) b!1492462))

(declare-fun m!1376439 () Bool)

(assert (=> d!156895 m!1376439))

(declare-fun m!1376441 () Bool)

(assert (=> d!156895 m!1376441))

(assert (=> d!156895 m!1376255))

(assert (=> d!156895 m!1376261))

(assert (=> d!156895 m!1376261))

(assert (=> d!156895 m!1376263))

(declare-fun m!1376445 () Bool)

(assert (=> d!156895 m!1376445))

(declare-fun m!1376447 () Bool)

(assert (=> b!1492462 m!1376447))

(declare-fun m!1376449 () Bool)

(assert (=> b!1492465 m!1376449))

(assert (=> b!1492151 d!156895))

(declare-fun d!156903 () Bool)

(declare-fun res!1015329 () Bool)

(declare-fun e!836130 () Bool)

(assert (=> d!156903 (=> res!1015329 e!836130)))

(assert (=> d!156903 (= res!1015329 (bvsge j!93 (size!48677 a!2862)))))

(assert (=> d!156903 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836130)))

(declare-fun b!1492475 () Bool)

(declare-fun e!836132 () Bool)

(assert (=> b!1492475 (= e!836130 e!836132)))

(declare-fun c!138101 () Bool)

(assert (=> b!1492475 (= c!138101 (validKeyInArray!0 (select (arr!48127 a!2862) j!93)))))

(declare-fun b!1492476 () Bool)

(declare-fun e!836131 () Bool)

(declare-fun call!67953 () Bool)

(assert (=> b!1492476 (= e!836131 call!67953)))

(declare-fun b!1492477 () Bool)

(assert (=> b!1492477 (= e!836132 e!836131)))

(declare-fun lt!650649 () (_ BitVec 64))

(assert (=> b!1492477 (= lt!650649 (select (arr!48127 a!2862) j!93))))

(declare-fun lt!650651 () Unit!50074)

(assert (=> b!1492477 (= lt!650651 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650649 j!93))))

(assert (=> b!1492477 (arrayContainsKey!0 a!2862 lt!650649 #b00000000000000000000000000000000)))

(declare-fun lt!650650 () Unit!50074)

(assert (=> b!1492477 (= lt!650650 lt!650651)))

(declare-fun res!1015330 () Bool)

(assert (=> b!1492477 (= res!1015330 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) (Found!12367 j!93)))))

(assert (=> b!1492477 (=> (not res!1015330) (not e!836131))))

(declare-fun b!1492478 () Bool)

(assert (=> b!1492478 (= e!836132 call!67953)))

(declare-fun bm!67950 () Bool)

(assert (=> bm!67950 (= call!67953 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156903 (not res!1015329)) b!1492475))

(assert (= (and b!1492475 c!138101) b!1492477))

(assert (= (and b!1492475 (not c!138101)) b!1492478))

(assert (= (and b!1492477 res!1015330) b!1492476))

(assert (= (or b!1492476 b!1492478) bm!67950))

(assert (=> b!1492475 m!1376253))

(assert (=> b!1492475 m!1376253))

(assert (=> b!1492475 m!1376267))

(assert (=> b!1492477 m!1376253))

(declare-fun m!1376451 () Bool)

(assert (=> b!1492477 m!1376451))

(declare-fun m!1376453 () Bool)

(assert (=> b!1492477 m!1376453))

(assert (=> b!1492477 m!1376253))

(assert (=> b!1492477 m!1376281))

(declare-fun m!1376455 () Bool)

(assert (=> bm!67950 m!1376455))

(assert (=> b!1492153 d!156903))

(declare-fun d!156905 () Bool)

(assert (=> d!156905 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650654 () Unit!50074)

(declare-fun choose!38 (array!99711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50074)

(assert (=> d!156905 (= lt!650654 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156905 (validMask!0 mask!2687)))

(assert (=> d!156905 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650654)))

(declare-fun bs!42864 () Bool)

(assert (= bs!42864 d!156905))

(assert (=> bs!42864 m!1376251))

(declare-fun m!1376465 () Bool)

(assert (=> bs!42864 m!1376465))

(assert (=> bs!42864 m!1376255))

(assert (=> b!1492153 d!156905))

(declare-fun b!1492479 () Bool)

(declare-fun e!836135 () SeekEntryResult!12367)

(assert (=> b!1492479 (= e!836135 (Intermediate!12367 true index!646 x!665))))

(declare-fun b!1492480 () Bool)

(declare-fun e!836133 () Bool)

(declare-fun e!836136 () Bool)

(assert (=> b!1492480 (= e!836133 e!836136)))

(declare-fun res!1015334 () Bool)

(declare-fun lt!650656 () SeekEntryResult!12367)

(assert (=> b!1492480 (= res!1015334 (and (is-Intermediate!12367 lt!650656) (not (undefined!13179 lt!650656)) (bvslt (x!133439 lt!650656) #b01111111111111111111111111111110) (bvsge (x!133439 lt!650656) #b00000000000000000000000000000000) (bvsge (x!133439 lt!650656) x!665)))))

(assert (=> b!1492480 (=> (not res!1015334) (not e!836136))))

(declare-fun b!1492481 () Bool)

(assert (=> b!1492481 (and (bvsge (index!51862 lt!650656) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650656) (size!48677 a!2862)))))

(declare-fun e!836137 () Bool)

(assert (=> b!1492481 (= e!836137 (= (select (arr!48127 a!2862) (index!51862 lt!650656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1492482 () Bool)

(assert (=> b!1492482 (and (bvsge (index!51862 lt!650656) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650656) (size!48677 a!2862)))))

(declare-fun res!1015333 () Bool)

(assert (=> b!1492482 (= res!1015333 (= (select (arr!48127 a!2862) (index!51862 lt!650656)) (select (arr!48127 a!2862) j!93)))))

(assert (=> b!1492482 (=> res!1015333 e!836137)))

(assert (=> b!1492482 (= e!836136 e!836137)))

(declare-fun b!1492483 () Bool)

(assert (=> b!1492483 (= e!836133 (bvsge (x!133439 lt!650656) #b01111111111111111111111111111110))))

(declare-fun b!1492484 () Bool)

(assert (=> b!1492484 (and (bvsge (index!51862 lt!650656) #b00000000000000000000000000000000) (bvslt (index!51862 lt!650656) (size!48677 a!2862)))))

(declare-fun res!1015332 () Bool)

(assert (=> b!1492484 (= res!1015332 (= (select (arr!48127 a!2862) (index!51862 lt!650656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492484 (=> res!1015332 e!836137)))

(declare-fun b!1492485 () Bool)

(declare-fun e!836134 () SeekEntryResult!12367)

(assert (=> b!1492485 (= e!836135 e!836134)))

(declare-fun c!138102 () Bool)

(declare-fun lt!650655 () (_ BitVec 64))

(assert (=> b!1492485 (= c!138102 (or (= lt!650655 (select (arr!48127 a!2862) j!93)) (= (bvadd lt!650655 lt!650655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156909 () Bool)

(assert (=> d!156909 e!836133))

(declare-fun c!138103 () Bool)

(assert (=> d!156909 (= c!138103 (and (is-Intermediate!12367 lt!650656) (undefined!13179 lt!650656)))))

(assert (=> d!156909 (= lt!650656 e!836135)))

(declare-fun c!138104 () Bool)

(assert (=> d!156909 (= c!138104 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156909 (= lt!650655 (select (arr!48127 a!2862) index!646))))

(assert (=> d!156909 (validMask!0 mask!2687)))

(assert (=> d!156909 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650656)))

(declare-fun b!1492486 () Bool)

(assert (=> b!1492486 (= e!836134 (Intermediate!12367 false index!646 x!665))))

(declare-fun b!1492487 () Bool)

(assert (=> b!1492487 (= e!836134 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156909 c!138104) b!1492479))

(assert (= (and d!156909 (not c!138104)) b!1492485))

(assert (= (and b!1492485 c!138102) b!1492486))

(assert (= (and b!1492485 (not c!138102)) b!1492487))

(assert (= (and d!156909 c!138103) b!1492483))

(assert (= (and d!156909 (not c!138103)) b!1492480))

(assert (= (and b!1492480 res!1015334) b!1492482))

(assert (= (and b!1492482 (not res!1015333)) b!1492484))

(assert (= (and b!1492484 (not res!1015332)) b!1492481))

(assert (=> b!1492487 m!1376237))

(assert (=> b!1492487 m!1376237))

(assert (=> b!1492487 m!1376253))

(declare-fun m!1376467 () Bool)

(assert (=> b!1492487 m!1376467))

(declare-fun m!1376469 () Bool)

(assert (=> b!1492481 m!1376469))

(assert (=> b!1492484 m!1376469))

(assert (=> b!1492482 m!1376469))

(assert (=> d!156909 m!1376249))

(assert (=> d!156909 m!1376255))

(assert (=> b!1492142 d!156909))

(declare-fun b!1492517 () Bool)

(declare-fun e!836158 () Bool)

(declare-fun call!67957 () Bool)

(assert (=> b!1492517 (= e!836158 call!67957)))

(declare-fun b!1492518 () Bool)

(declare-fun e!836160 () Bool)

(assert (=> b!1492518 (= e!836160 e!836158)))

(declare-fun c!138114 () Bool)

(assert (=> b!1492518 (= c!138114 (validKeyInArray!0 (select (arr!48127 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67954 () Bool)

(assert (=> bm!67954 (= call!67957 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138114 (Cons!34624 (select (arr!48127 a!2862) #b00000000000000000000000000000000) Nil!34625) Nil!34625)))))

