; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126900 () Bool)

(assert start!126900)

(declare-fun b!1491112 () Bool)

(declare-fun e!835486 () Bool)

(assert (=> b!1491112 (= e!835486 true)))

(declare-fun lt!650167 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491112 (= lt!650167 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!650169 () (_ BitVec 64))

(declare-datatypes ((array!99673 0))(
  ( (array!99674 (arr!48108 (Array (_ BitVec 32) (_ BitVec 64))) (size!48658 (_ BitVec 32))) )
))
(declare-fun lt!650170 () array!99673)

(declare-fun e!835482 () Bool)

(declare-fun b!1491113 () Bool)

(declare-datatypes ((SeekEntryResult!12348 0))(
  ( (MissingZero!12348 (index!51784 (_ BitVec 32))) (Found!12348 (index!51785 (_ BitVec 32))) (Intermediate!12348 (undefined!13160 Bool) (index!51786 (_ BitVec 32)) (x!133372 (_ BitVec 32))) (Undefined!12348) (MissingVacant!12348 (index!51787 (_ BitVec 32))) )
))
(declare-fun lt!650172 () SeekEntryResult!12348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12348)

(assert (=> b!1491113 (= e!835482 (= lt!650172 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650169 lt!650170 mask!2687)))))

(declare-fun b!1491114 () Bool)

(declare-fun res!1014323 () Bool)

(declare-fun e!835481 () Bool)

(assert (=> b!1491114 (=> (not res!1014323) (not e!835481))))

(assert (=> b!1491114 (= res!1014323 e!835482)))

(declare-fun c!137925 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491114 (= c!137925 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491115 () Bool)

(declare-fun res!1014320 () Bool)

(declare-fun e!835487 () Bool)

(assert (=> b!1491115 (=> (not res!1014320) (not e!835487))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99673)

(assert (=> b!1491115 (= res!1014320 (and (= (size!48658 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48658 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48658 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491116 () Bool)

(declare-fun e!835483 () Bool)

(assert (=> b!1491116 (= e!835483 e!835481)))

(declare-fun res!1014328 () Bool)

(assert (=> b!1491116 (=> (not res!1014328) (not e!835481))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491116 (= res!1014328 (= lt!650172 (Intermediate!12348 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491116 (= lt!650172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650169 mask!2687) lt!650169 lt!650170 mask!2687))))

(assert (=> b!1491116 (= lt!650169 (select (store (arr!48108 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1014326 () Bool)

(assert (=> start!126900 (=> (not res!1014326) (not e!835487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126900 (= res!1014326 (validMask!0 mask!2687))))

(assert (=> start!126900 e!835487))

(assert (=> start!126900 true))

(declare-fun array_inv!37136 (array!99673) Bool)

(assert (=> start!126900 (array_inv!37136 a!2862)))

(declare-fun b!1491117 () Bool)

(declare-fun res!1014331 () Bool)

(assert (=> b!1491117 (=> (not res!1014331) (not e!835481))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491117 (= res!1014331 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491118 () Bool)

(declare-fun res!1014317 () Bool)

(assert (=> b!1491118 (=> (not res!1014317) (not e!835487))))

(declare-datatypes ((List!34609 0))(
  ( (Nil!34606) (Cons!34605 (h!35988 (_ BitVec 64)) (t!49303 List!34609)) )
))
(declare-fun arrayNoDuplicates!0 (array!99673 (_ BitVec 32) List!34609) Bool)

(assert (=> b!1491118 (= res!1014317 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34606))))

(declare-fun b!1491119 () Bool)

(declare-fun res!1014316 () Bool)

(assert (=> b!1491119 (=> (not res!1014316) (not e!835487))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491119 (= res!1014316 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48658 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48658 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48658 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491120 () Bool)

(declare-fun e!835484 () Bool)

(assert (=> b!1491120 (= e!835484 e!835483)))

(declare-fun res!1014325 () Bool)

(assert (=> b!1491120 (=> (not res!1014325) (not e!835483))))

(declare-fun lt!650171 () SeekEntryResult!12348)

(assert (=> b!1491120 (= res!1014325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48108 a!2862) j!93) mask!2687) (select (arr!48108 a!2862) j!93) a!2862 mask!2687) lt!650171))))

(assert (=> b!1491120 (= lt!650171 (Intermediate!12348 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491121 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12348)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99673 (_ BitVec 32)) SeekEntryResult!12348)

(assert (=> b!1491121 (= e!835482 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650169 lt!650170 mask!2687) (seekEntryOrOpen!0 lt!650169 lt!650170 mask!2687)))))

(declare-fun b!1491122 () Bool)

(declare-fun res!1014322 () Bool)

(assert (=> b!1491122 (=> (not res!1014322) (not e!835487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491122 (= res!1014322 (validKeyInArray!0 (select (arr!48108 a!2862) i!1006)))))

(declare-fun b!1491123 () Bool)

(declare-fun res!1014319 () Bool)

(assert (=> b!1491123 (=> (not res!1014319) (not e!835487))))

(assert (=> b!1491123 (= res!1014319 (validKeyInArray!0 (select (arr!48108 a!2862) j!93)))))

(declare-fun e!835485 () Bool)

(declare-fun b!1491124 () Bool)

(assert (=> b!1491124 (= e!835485 (or (= (select (arr!48108 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48108 a!2862) intermediateBeforeIndex!19) (select (arr!48108 a!2862) j!93))))))

(declare-fun b!1491125 () Bool)

(assert (=> b!1491125 (= e!835481 (not e!835486))))

(declare-fun res!1014324 () Bool)

(assert (=> b!1491125 (=> res!1014324 e!835486)))

(assert (=> b!1491125 (= res!1014324 (or (and (= (select (arr!48108 a!2862) index!646) (select (store (arr!48108 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48108 a!2862) index!646) (select (arr!48108 a!2862) j!93))) (= (select (arr!48108 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491125 e!835485))

(declare-fun res!1014330 () Bool)

(assert (=> b!1491125 (=> (not res!1014330) (not e!835485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99673 (_ BitVec 32)) Bool)

(assert (=> b!1491125 (= res!1014330 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50036 0))(
  ( (Unit!50037) )
))
(declare-fun lt!650168 () Unit!50036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50036)

(assert (=> b!1491125 (= lt!650168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491126 () Bool)

(declare-fun res!1014321 () Bool)

(assert (=> b!1491126 (=> (not res!1014321) (not e!835485))))

(assert (=> b!1491126 (= res!1014321 (= (seekEntryOrOpen!0 (select (arr!48108 a!2862) j!93) a!2862 mask!2687) (Found!12348 j!93)))))

(declare-fun b!1491127 () Bool)

(assert (=> b!1491127 (= e!835487 e!835484)))

(declare-fun res!1014327 () Bool)

(assert (=> b!1491127 (=> (not res!1014327) (not e!835484))))

(assert (=> b!1491127 (= res!1014327 (= (select (store (arr!48108 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491127 (= lt!650170 (array!99674 (store (arr!48108 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48658 a!2862)))))

(declare-fun b!1491128 () Bool)

(declare-fun res!1014329 () Bool)

(assert (=> b!1491128 (=> (not res!1014329) (not e!835483))))

(assert (=> b!1491128 (= res!1014329 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48108 a!2862) j!93) a!2862 mask!2687) lt!650171))))

(declare-fun b!1491129 () Bool)

(declare-fun res!1014318 () Bool)

(assert (=> b!1491129 (=> (not res!1014318) (not e!835487))))

(assert (=> b!1491129 (= res!1014318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126900 res!1014326) b!1491115))

(assert (= (and b!1491115 res!1014320) b!1491122))

(assert (= (and b!1491122 res!1014322) b!1491123))

(assert (= (and b!1491123 res!1014319) b!1491129))

(assert (= (and b!1491129 res!1014318) b!1491118))

(assert (= (and b!1491118 res!1014317) b!1491119))

(assert (= (and b!1491119 res!1014316) b!1491127))

(assert (= (and b!1491127 res!1014327) b!1491120))

(assert (= (and b!1491120 res!1014325) b!1491128))

(assert (= (and b!1491128 res!1014329) b!1491116))

(assert (= (and b!1491116 res!1014328) b!1491114))

(assert (= (and b!1491114 c!137925) b!1491113))

(assert (= (and b!1491114 (not c!137925)) b!1491121))

(assert (= (and b!1491114 res!1014323) b!1491117))

(assert (= (and b!1491117 res!1014331) b!1491125))

(assert (= (and b!1491125 res!1014330) b!1491126))

(assert (= (and b!1491126 res!1014321) b!1491124))

(assert (= (and b!1491125 (not res!1014324)) b!1491112))

(declare-fun m!1375247 () Bool)

(assert (=> b!1491125 m!1375247))

(declare-fun m!1375249 () Bool)

(assert (=> b!1491125 m!1375249))

(declare-fun m!1375251 () Bool)

(assert (=> b!1491125 m!1375251))

(declare-fun m!1375253 () Bool)

(assert (=> b!1491125 m!1375253))

(declare-fun m!1375255 () Bool)

(assert (=> b!1491125 m!1375255))

(declare-fun m!1375257 () Bool)

(assert (=> b!1491125 m!1375257))

(assert (=> b!1491126 m!1375257))

(assert (=> b!1491126 m!1375257))

(declare-fun m!1375259 () Bool)

(assert (=> b!1491126 m!1375259))

(assert (=> b!1491120 m!1375257))

(assert (=> b!1491120 m!1375257))

(declare-fun m!1375261 () Bool)

(assert (=> b!1491120 m!1375261))

(assert (=> b!1491120 m!1375261))

(assert (=> b!1491120 m!1375257))

(declare-fun m!1375263 () Bool)

(assert (=> b!1491120 m!1375263))

(assert (=> b!1491128 m!1375257))

(assert (=> b!1491128 m!1375257))

(declare-fun m!1375265 () Bool)

(assert (=> b!1491128 m!1375265))

(declare-fun m!1375267 () Bool)

(assert (=> b!1491129 m!1375267))

(declare-fun m!1375269 () Bool)

(assert (=> b!1491124 m!1375269))

(assert (=> b!1491124 m!1375257))

(declare-fun m!1375271 () Bool)

(assert (=> b!1491122 m!1375271))

(assert (=> b!1491122 m!1375271))

(declare-fun m!1375273 () Bool)

(assert (=> b!1491122 m!1375273))

(assert (=> b!1491127 m!1375249))

(declare-fun m!1375275 () Bool)

(assert (=> b!1491127 m!1375275))

(declare-fun m!1375277 () Bool)

(assert (=> b!1491116 m!1375277))

(assert (=> b!1491116 m!1375277))

(declare-fun m!1375279 () Bool)

(assert (=> b!1491116 m!1375279))

(assert (=> b!1491116 m!1375249))

(declare-fun m!1375281 () Bool)

(assert (=> b!1491116 m!1375281))

(assert (=> b!1491123 m!1375257))

(assert (=> b!1491123 m!1375257))

(declare-fun m!1375283 () Bool)

(assert (=> b!1491123 m!1375283))

(declare-fun m!1375285 () Bool)

(assert (=> start!126900 m!1375285))

(declare-fun m!1375287 () Bool)

(assert (=> start!126900 m!1375287))

(declare-fun m!1375289 () Bool)

(assert (=> b!1491121 m!1375289))

(declare-fun m!1375291 () Bool)

(assert (=> b!1491121 m!1375291))

(declare-fun m!1375293 () Bool)

(assert (=> b!1491118 m!1375293))

(declare-fun m!1375295 () Bool)

(assert (=> b!1491112 m!1375295))

(declare-fun m!1375297 () Bool)

(assert (=> b!1491113 m!1375297))

(check-sat (not b!1491112) (not b!1491116) (not b!1491118) (not b!1491123) (not b!1491125) (not b!1491126) (not b!1491121) (not b!1491128) (not b!1491120) (not b!1491122) (not b!1491129) (not start!126900) (not b!1491113))
(check-sat)
