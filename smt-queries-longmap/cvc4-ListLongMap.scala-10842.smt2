; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126902 () Bool)

(assert start!126902)

(declare-fun res!1014372 () Bool)

(declare-fun e!835511 () Bool)

(assert (=> start!126902 (=> (not res!1014372) (not e!835511))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126902 (= res!1014372 (validMask!0 mask!2687))))

(assert (=> start!126902 e!835511))

(assert (=> start!126902 true))

(declare-datatypes ((array!99675 0))(
  ( (array!99676 (arr!48109 (Array (_ BitVec 32) (_ BitVec 64))) (size!48659 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99675)

(declare-fun array_inv!37137 (array!99675) Bool)

(assert (=> start!126902 (array_inv!37137 a!2862)))

(declare-fun b!1491166 () Bool)

(declare-fun res!1014368 () Bool)

(assert (=> b!1491166 (=> (not res!1014368) (not e!835511))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491166 (= res!1014368 (validKeyInArray!0 (select (arr!48109 a!2862) i!1006)))))

(declare-fun b!1491167 () Bool)

(declare-fun e!835506 () Bool)

(assert (=> b!1491167 (= e!835511 e!835506)))

(declare-fun res!1014373 () Bool)

(assert (=> b!1491167 (=> (not res!1014373) (not e!835506))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491167 (= res!1014373 (= (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650186 () array!99675)

(assert (=> b!1491167 (= lt!650186 (array!99676 (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48659 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650188 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12349 0))(
  ( (MissingZero!12349 (index!51788 (_ BitVec 32))) (Found!12349 (index!51789 (_ BitVec 32))) (Intermediate!12349 (undefined!13161 Bool) (index!51790 (_ BitVec 32)) (x!133373 (_ BitVec 32))) (Undefined!12349) (MissingVacant!12349 (index!51791 (_ BitVec 32))) )
))
(declare-fun lt!650187 () SeekEntryResult!12349)

(declare-fun b!1491168 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!835507 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99675 (_ BitVec 32)) SeekEntryResult!12349)

(assert (=> b!1491168 (= e!835507 (= lt!650187 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650188 lt!650186 mask!2687)))))

(declare-fun b!1491169 () Bool)

(declare-fun res!1014370 () Bool)

(assert (=> b!1491169 (=> (not res!1014370) (not e!835511))))

(declare-datatypes ((List!34610 0))(
  ( (Nil!34607) (Cons!34606 (h!35989 (_ BitVec 64)) (t!49304 List!34610)) )
))
(declare-fun arrayNoDuplicates!0 (array!99675 (_ BitVec 32) List!34610) Bool)

(assert (=> b!1491169 (= res!1014370 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34607))))

(declare-fun b!1491170 () Bool)

(declare-fun res!1014371 () Bool)

(declare-fun e!835508 () Bool)

(assert (=> b!1491170 (=> (not res!1014371) (not e!835508))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491170 (= res!1014371 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491171 () Bool)

(declare-fun res!1014369 () Bool)

(declare-fun e!835504 () Bool)

(assert (=> b!1491171 (=> (not res!1014369) (not e!835504))))

(declare-fun lt!650190 () SeekEntryResult!12349)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491171 (= res!1014369 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650190))))

(declare-fun b!1491172 () Bool)

(assert (=> b!1491172 (= e!835506 e!835504)))

(declare-fun res!1014376 () Bool)

(assert (=> b!1491172 (=> (not res!1014376) (not e!835504))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491172 (= res!1014376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48109 a!2862) j!93) mask!2687) (select (arr!48109 a!2862) j!93) a!2862 mask!2687) lt!650190))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491172 (= lt!650190 (Intermediate!12349 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491173 () Bool)

(assert (=> b!1491173 (= e!835504 e!835508)))

(declare-fun res!1014377 () Bool)

(assert (=> b!1491173 (=> (not res!1014377) (not e!835508))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491173 (= res!1014377 (= lt!650187 (Intermediate!12349 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491173 (= lt!650187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650188 mask!2687) lt!650188 lt!650186 mask!2687))))

(assert (=> b!1491173 (= lt!650188 (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491174 () Bool)

(declare-fun res!1014366 () Bool)

(assert (=> b!1491174 (=> (not res!1014366) (not e!835511))))

(assert (=> b!1491174 (= res!1014366 (and (= (size!48659 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48659 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48659 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491175 () Bool)

(declare-fun e!835510 () Bool)

(assert (=> b!1491175 (= e!835508 (not e!835510))))

(declare-fun res!1014365 () Bool)

(assert (=> b!1491175 (=> res!1014365 e!835510)))

(assert (=> b!1491175 (= res!1014365 (or (and (= (select (arr!48109 a!2862) index!646) (select (store (arr!48109 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48109 a!2862) index!646) (select (arr!48109 a!2862) j!93))) (= (select (arr!48109 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835509 () Bool)

(assert (=> b!1491175 e!835509))

(declare-fun res!1014374 () Bool)

(assert (=> b!1491175 (=> (not res!1014374) (not e!835509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99675 (_ BitVec 32)) Bool)

(assert (=> b!1491175 (= res!1014374 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50038 0))(
  ( (Unit!50039) )
))
(declare-fun lt!650189 () Unit!50038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50038)

(assert (=> b!1491175 (= lt!650189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491176 () Bool)

(assert (=> b!1491176 (= e!835509 (or (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48109 a!2862) intermediateBeforeIndex!19) (select (arr!48109 a!2862) j!93))))))

(declare-fun b!1491177 () Bool)

(declare-fun res!1014364 () Bool)

(assert (=> b!1491177 (=> (not res!1014364) (not e!835511))))

(assert (=> b!1491177 (= res!1014364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99675 (_ BitVec 32)) SeekEntryResult!12349)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99675 (_ BitVec 32)) SeekEntryResult!12349)

(assert (=> b!1491178 (= e!835507 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650188 lt!650186 mask!2687) (seekEntryOrOpen!0 lt!650188 lt!650186 mask!2687)))))

(declare-fun b!1491179 () Bool)

(declare-fun res!1014379 () Bool)

(assert (=> b!1491179 (=> (not res!1014379) (not e!835511))))

(assert (=> b!1491179 (= res!1014379 (validKeyInArray!0 (select (arr!48109 a!2862) j!93)))))

(declare-fun b!1491180 () Bool)

(declare-fun res!1014367 () Bool)

(assert (=> b!1491180 (=> (not res!1014367) (not e!835509))))

(assert (=> b!1491180 (= res!1014367 (= (seekEntryOrOpen!0 (select (arr!48109 a!2862) j!93) a!2862 mask!2687) (Found!12349 j!93)))))

(declare-fun b!1491181 () Bool)

(assert (=> b!1491181 (= e!835510 true)))

(declare-fun lt!650185 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491181 (= lt!650185 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491182 () Bool)

(declare-fun res!1014375 () Bool)

(assert (=> b!1491182 (=> (not res!1014375) (not e!835508))))

(assert (=> b!1491182 (= res!1014375 e!835507)))

(declare-fun c!137928 () Bool)

(assert (=> b!1491182 (= c!137928 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491183 () Bool)

(declare-fun res!1014378 () Bool)

(assert (=> b!1491183 (=> (not res!1014378) (not e!835511))))

(assert (=> b!1491183 (= res!1014378 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48659 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48659 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48659 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126902 res!1014372) b!1491174))

(assert (= (and b!1491174 res!1014366) b!1491166))

(assert (= (and b!1491166 res!1014368) b!1491179))

(assert (= (and b!1491179 res!1014379) b!1491177))

(assert (= (and b!1491177 res!1014364) b!1491169))

(assert (= (and b!1491169 res!1014370) b!1491183))

(assert (= (and b!1491183 res!1014378) b!1491167))

(assert (= (and b!1491167 res!1014373) b!1491172))

(assert (= (and b!1491172 res!1014376) b!1491171))

(assert (= (and b!1491171 res!1014369) b!1491173))

(assert (= (and b!1491173 res!1014377) b!1491182))

(assert (= (and b!1491182 c!137928) b!1491168))

(assert (= (and b!1491182 (not c!137928)) b!1491178))

(assert (= (and b!1491182 res!1014375) b!1491170))

(assert (= (and b!1491170 res!1014371) b!1491175))

(assert (= (and b!1491175 res!1014374) b!1491180))

(assert (= (and b!1491180 res!1014367) b!1491176))

(assert (= (and b!1491175 (not res!1014365)) b!1491181))

(declare-fun m!1375299 () Bool)

(assert (=> b!1491167 m!1375299))

(declare-fun m!1375301 () Bool)

(assert (=> b!1491167 m!1375301))

(declare-fun m!1375303 () Bool)

(assert (=> b!1491172 m!1375303))

(assert (=> b!1491172 m!1375303))

(declare-fun m!1375305 () Bool)

(assert (=> b!1491172 m!1375305))

(assert (=> b!1491172 m!1375305))

(assert (=> b!1491172 m!1375303))

(declare-fun m!1375307 () Bool)

(assert (=> b!1491172 m!1375307))

(declare-fun m!1375309 () Bool)

(assert (=> b!1491166 m!1375309))

(assert (=> b!1491166 m!1375309))

(declare-fun m!1375311 () Bool)

(assert (=> b!1491166 m!1375311))

(declare-fun m!1375313 () Bool)

(assert (=> b!1491178 m!1375313))

(declare-fun m!1375315 () Bool)

(assert (=> b!1491178 m!1375315))

(declare-fun m!1375317 () Bool)

(assert (=> b!1491168 m!1375317))

(assert (=> b!1491171 m!1375303))

(assert (=> b!1491171 m!1375303))

(declare-fun m!1375319 () Bool)

(assert (=> b!1491171 m!1375319))

(declare-fun m!1375321 () Bool)

(assert (=> b!1491181 m!1375321))

(declare-fun m!1375323 () Bool)

(assert (=> b!1491176 m!1375323))

(assert (=> b!1491176 m!1375303))

(assert (=> b!1491179 m!1375303))

(assert (=> b!1491179 m!1375303))

(declare-fun m!1375325 () Bool)

(assert (=> b!1491179 m!1375325))

(declare-fun m!1375327 () Bool)

(assert (=> b!1491175 m!1375327))

(assert (=> b!1491175 m!1375299))

(declare-fun m!1375329 () Bool)

(assert (=> b!1491175 m!1375329))

(declare-fun m!1375331 () Bool)

(assert (=> b!1491175 m!1375331))

(declare-fun m!1375333 () Bool)

(assert (=> b!1491175 m!1375333))

(assert (=> b!1491175 m!1375303))

(assert (=> b!1491180 m!1375303))

(assert (=> b!1491180 m!1375303))

(declare-fun m!1375335 () Bool)

(assert (=> b!1491180 m!1375335))

(declare-fun m!1375337 () Bool)

(assert (=> start!126902 m!1375337))

(declare-fun m!1375339 () Bool)

(assert (=> start!126902 m!1375339))

(declare-fun m!1375341 () Bool)

(assert (=> b!1491173 m!1375341))

(assert (=> b!1491173 m!1375341))

(declare-fun m!1375343 () Bool)

(assert (=> b!1491173 m!1375343))

(assert (=> b!1491173 m!1375299))

(declare-fun m!1375345 () Bool)

(assert (=> b!1491173 m!1375345))

(declare-fun m!1375347 () Bool)

(assert (=> b!1491177 m!1375347))

(declare-fun m!1375349 () Bool)

(assert (=> b!1491169 m!1375349))

(push 1)

