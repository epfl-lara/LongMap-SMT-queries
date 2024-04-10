; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124660 () Bool)

(assert start!124660)

(declare-fun b!1444270 () Bool)

(declare-fun res!976280 () Bool)

(declare-fun e!813760 () Bool)

(assert (=> b!1444270 (=> (not res!976280) (not e!813760))))

(declare-datatypes ((array!98108 0))(
  ( (array!98109 (arr!47342 (Array (_ BitVec 32) (_ BitVec 64))) (size!47892 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98108)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11594 0))(
  ( (MissingZero!11594 (index!48768 (_ BitVec 32))) (Found!11594 (index!48769 (_ BitVec 32))) (Intermediate!11594 (undefined!12406 Bool) (index!48770 (_ BitVec 32)) (x!130467 (_ BitVec 32))) (Undefined!11594) (MissingVacant!11594 (index!48771 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98108 (_ BitVec 32)) SeekEntryResult!11594)

(assert (=> b!1444270 (= res!976280 (= (seekEntryOrOpen!0 (select (arr!47342 a!2862) j!93) a!2862 mask!2687) (Found!11594 j!93)))))

(declare-fun b!1444271 () Bool)

(declare-fun e!813766 () Bool)

(declare-fun e!813763 () Bool)

(assert (=> b!1444271 (= e!813766 e!813763)))

(declare-fun res!976281 () Bool)

(assert (=> b!1444271 (=> (not res!976281) (not e!813763))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444271 (= res!976281 (= (select (store (arr!47342 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634146 () array!98108)

(assert (=> b!1444271 (= lt!634146 (array!98109 (store (arr!47342 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47892 a!2862)))))

(declare-fun b!1444272 () Bool)

(declare-fun res!976292 () Bool)

(assert (=> b!1444272 (=> (not res!976292) (not e!813766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444272 (= res!976292 (validKeyInArray!0 (select (arr!47342 a!2862) i!1006)))))

(declare-fun b!1444273 () Bool)

(declare-fun e!813761 () Bool)

(declare-fun e!813765 () Bool)

(assert (=> b!1444273 (= e!813761 e!813765)))

(declare-fun res!976290 () Bool)

(assert (=> b!1444273 (=> (not res!976290) (not e!813765))))

(declare-fun lt!634143 () SeekEntryResult!11594)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444273 (= res!976290 (= lt!634143 (Intermediate!11594 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634144 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98108 (_ BitVec 32)) SeekEntryResult!11594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444273 (= lt!634143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634144 mask!2687) lt!634144 lt!634146 mask!2687))))

(assert (=> b!1444273 (= lt!634144 (select (store (arr!47342 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1444274 () Bool)

(assert (=> b!1444274 (= e!813760 (or (= (select (arr!47342 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47342 a!2862) intermediateBeforeIndex!19) (select (arr!47342 a!2862) j!93))))))

(declare-fun b!1444275 () Bool)

(declare-fun e!813762 () Bool)

(assert (=> b!1444275 (= e!813765 (not e!813762))))

(declare-fun res!976279 () Bool)

(assert (=> b!1444275 (=> res!976279 e!813762)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1444275 (= res!976279 (or (not (= (select (arr!47342 a!2862) index!646) (select (store (arr!47342 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47342 a!2862) index!646) (select (arr!47342 a!2862) j!93)))))))

(assert (=> b!1444275 e!813760))

(declare-fun res!976287 () Bool)

(assert (=> b!1444275 (=> (not res!976287) (not e!813760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98108 (_ BitVec 32)) Bool)

(assert (=> b!1444275 (= res!976287 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48684 0))(
  ( (Unit!48685) )
))
(declare-fun lt!634141 () Unit!48684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48684)

(assert (=> b!1444275 (= lt!634141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444276 () Bool)

(declare-fun res!976288 () Bool)

(assert (=> b!1444276 (=> (not res!976288) (not e!813766))))

(assert (=> b!1444276 (= res!976288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444277 () Bool)

(declare-fun res!976291 () Bool)

(assert (=> b!1444277 (=> (not res!976291) (not e!813761))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634145 () SeekEntryResult!11594)

(assert (=> b!1444277 (= res!976291 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47342 a!2862) j!93) a!2862 mask!2687) lt!634145))))

(declare-fun b!1444278 () Bool)

(declare-fun res!976286 () Bool)

(assert (=> b!1444278 (=> (not res!976286) (not e!813766))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444278 (= res!976286 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47892 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47892 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47892 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444279 () Bool)

(declare-fun res!976282 () Bool)

(assert (=> b!1444279 (=> (not res!976282) (not e!813766))))

(assert (=> b!1444279 (= res!976282 (and (= (size!47892 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47892 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47892 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444281 () Bool)

(declare-fun res!976293 () Bool)

(assert (=> b!1444281 (=> (not res!976293) (not e!813766))))

(declare-datatypes ((List!33843 0))(
  ( (Nil!33840) (Cons!33839 (h!35189 (_ BitVec 64)) (t!48537 List!33843)) )
))
(declare-fun arrayNoDuplicates!0 (array!98108 (_ BitVec 32) List!33843) Bool)

(assert (=> b!1444281 (= res!976293 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33840))))

(declare-fun b!1444282 () Bool)

(declare-fun res!976285 () Bool)

(assert (=> b!1444282 (=> (not res!976285) (not e!813765))))

(assert (=> b!1444282 (= res!976285 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444283 () Bool)

(declare-fun res!976289 () Bool)

(assert (=> b!1444283 (=> (not res!976289) (not e!813766))))

(assert (=> b!1444283 (= res!976289 (validKeyInArray!0 (select (arr!47342 a!2862) j!93)))))

(declare-fun b!1444284 () Bool)

(assert (=> b!1444284 (= e!813762 true)))

(declare-fun lt!634142 () SeekEntryResult!11594)

(assert (=> b!1444284 (= lt!634142 (seekEntryOrOpen!0 lt!634144 lt!634146 mask!2687))))

(declare-fun b!1444285 () Bool)

(declare-fun res!976283 () Bool)

(assert (=> b!1444285 (=> (not res!976283) (not e!813765))))

(declare-fun e!813764 () Bool)

(assert (=> b!1444285 (= res!976283 e!813764)))

(declare-fun c!133506 () Bool)

(assert (=> b!1444285 (= c!133506 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444280 () Bool)

(assert (=> b!1444280 (= e!813764 (= lt!634143 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634144 lt!634146 mask!2687)))))

(declare-fun res!976284 () Bool)

(assert (=> start!124660 (=> (not res!976284) (not e!813766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124660 (= res!976284 (validMask!0 mask!2687))))

(assert (=> start!124660 e!813766))

(assert (=> start!124660 true))

(declare-fun array_inv!36370 (array!98108) Bool)

(assert (=> start!124660 (array_inv!36370 a!2862)))

(declare-fun b!1444286 () Bool)

(assert (=> b!1444286 (= e!813763 e!813761)))

(declare-fun res!976294 () Bool)

(assert (=> b!1444286 (=> (not res!976294) (not e!813761))))

(assert (=> b!1444286 (= res!976294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47342 a!2862) j!93) mask!2687) (select (arr!47342 a!2862) j!93) a!2862 mask!2687) lt!634145))))

(assert (=> b!1444286 (= lt!634145 (Intermediate!11594 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444287 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98108 (_ BitVec 32)) SeekEntryResult!11594)

(assert (=> b!1444287 (= e!813764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634144 lt!634146 mask!2687) (seekEntryOrOpen!0 lt!634144 lt!634146 mask!2687)))))

(assert (= (and start!124660 res!976284) b!1444279))

(assert (= (and b!1444279 res!976282) b!1444272))

(assert (= (and b!1444272 res!976292) b!1444283))

(assert (= (and b!1444283 res!976289) b!1444276))

(assert (= (and b!1444276 res!976288) b!1444281))

(assert (= (and b!1444281 res!976293) b!1444278))

(assert (= (and b!1444278 res!976286) b!1444271))

(assert (= (and b!1444271 res!976281) b!1444286))

(assert (= (and b!1444286 res!976294) b!1444277))

(assert (= (and b!1444277 res!976291) b!1444273))

(assert (= (and b!1444273 res!976290) b!1444285))

(assert (= (and b!1444285 c!133506) b!1444280))

(assert (= (and b!1444285 (not c!133506)) b!1444287))

(assert (= (and b!1444285 res!976283) b!1444282))

(assert (= (and b!1444282 res!976285) b!1444275))

(assert (= (and b!1444275 res!976287) b!1444270))

(assert (= (and b!1444270 res!976280) b!1444274))

(assert (= (and b!1444275 (not res!976279)) b!1444284))

(declare-fun m!1333303 () Bool)

(assert (=> b!1444270 m!1333303))

(assert (=> b!1444270 m!1333303))

(declare-fun m!1333305 () Bool)

(assert (=> b!1444270 m!1333305))

(declare-fun m!1333307 () Bool)

(assert (=> b!1444272 m!1333307))

(assert (=> b!1444272 m!1333307))

(declare-fun m!1333309 () Bool)

(assert (=> b!1444272 m!1333309))

(declare-fun m!1333311 () Bool)

(assert (=> b!1444275 m!1333311))

(declare-fun m!1333313 () Bool)

(assert (=> b!1444275 m!1333313))

(declare-fun m!1333315 () Bool)

(assert (=> b!1444275 m!1333315))

(declare-fun m!1333317 () Bool)

(assert (=> b!1444275 m!1333317))

(declare-fun m!1333319 () Bool)

(assert (=> b!1444275 m!1333319))

(assert (=> b!1444275 m!1333303))

(assert (=> b!1444271 m!1333313))

(declare-fun m!1333321 () Bool)

(assert (=> b!1444271 m!1333321))

(assert (=> b!1444277 m!1333303))

(assert (=> b!1444277 m!1333303))

(declare-fun m!1333323 () Bool)

(assert (=> b!1444277 m!1333323))

(declare-fun m!1333325 () Bool)

(assert (=> b!1444274 m!1333325))

(assert (=> b!1444274 m!1333303))

(declare-fun m!1333327 () Bool)

(assert (=> b!1444276 m!1333327))

(declare-fun m!1333329 () Bool)

(assert (=> b!1444280 m!1333329))

(declare-fun m!1333331 () Bool)

(assert (=> b!1444287 m!1333331))

(declare-fun m!1333333 () Bool)

(assert (=> b!1444287 m!1333333))

(assert (=> b!1444283 m!1333303))

(assert (=> b!1444283 m!1333303))

(declare-fun m!1333335 () Bool)

(assert (=> b!1444283 m!1333335))

(declare-fun m!1333337 () Bool)

(assert (=> b!1444281 m!1333337))

(assert (=> b!1444286 m!1333303))

(assert (=> b!1444286 m!1333303))

(declare-fun m!1333339 () Bool)

(assert (=> b!1444286 m!1333339))

(assert (=> b!1444286 m!1333339))

(assert (=> b!1444286 m!1333303))

(declare-fun m!1333341 () Bool)

(assert (=> b!1444286 m!1333341))

(assert (=> b!1444284 m!1333333))

(declare-fun m!1333343 () Bool)

(assert (=> b!1444273 m!1333343))

(assert (=> b!1444273 m!1333343))

(declare-fun m!1333345 () Bool)

(assert (=> b!1444273 m!1333345))

(assert (=> b!1444273 m!1333313))

(declare-fun m!1333347 () Bool)

(assert (=> b!1444273 m!1333347))

(declare-fun m!1333349 () Bool)

(assert (=> start!124660 m!1333349))

(declare-fun m!1333351 () Bool)

(assert (=> start!124660 m!1333351))

(push 1)

