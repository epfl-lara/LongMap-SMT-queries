; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126208 () Bool)

(assert start!126208)

(declare-fun b!1479224 () Bool)

(declare-fun res!1005260 () Bool)

(declare-fun e!829728 () Bool)

(assert (=> b!1479224 (=> (not res!1005260) (not e!829728))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99292 0))(
  ( (array!99293 (arr!47926 (Array (_ BitVec 32) (_ BitVec 64))) (size!48478 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99292)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479224 (= res!1005260 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48478 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48478 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48478 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479226 () Bool)

(declare-fun res!1005255 () Bool)

(assert (=> b!1479226 (=> (not res!1005255) (not e!829728))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479226 (= res!1005255 (validKeyInArray!0 (select (arr!47926 a!2862) i!1006)))))

(declare-fun b!1479227 () Bool)

(declare-fun e!829725 () Bool)

(declare-fun e!829729 () Bool)

(assert (=> b!1479227 (= e!829725 e!829729)))

(declare-fun res!1005252 () Bool)

(assert (=> b!1479227 (=> res!1005252 e!829729)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479227 (= res!1005252 (or (and (= (select (arr!47926 a!2862) index!646) (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47926 a!2862) index!646) (select (arr!47926 a!2862) j!93))) (not (= (select (arr!47926 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479228 () Bool)

(declare-fun res!1005261 () Bool)

(assert (=> b!1479228 (=> (not res!1005261) (not e!829728))))

(assert (=> b!1479228 (= res!1005261 (validKeyInArray!0 (select (arr!47926 a!2862) j!93)))))

(declare-fun b!1479229 () Bool)

(declare-fun e!829726 () Bool)

(assert (=> b!1479229 (= e!829728 e!829726)))

(declare-fun res!1005254 () Bool)

(assert (=> b!1479229 (=> (not res!1005254) (not e!829726))))

(assert (=> b!1479229 (= res!1005254 (= (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645787 () array!99292)

(assert (=> b!1479229 (= lt!645787 (array!99293 (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48478 a!2862)))))

(declare-fun b!1479230 () Bool)

(declare-fun e!829731 () Bool)

(assert (=> b!1479230 (= e!829731 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479231 () Bool)

(declare-fun res!1005262 () Bool)

(declare-fun e!829723 () Bool)

(assert (=> b!1479231 (=> res!1005262 e!829723)))

(declare-datatypes ((SeekEntryResult!12191 0))(
  ( (MissingZero!12191 (index!51156 (_ BitVec 32))) (Found!12191 (index!51157 (_ BitVec 32))) (Intermediate!12191 (undefined!13003 Bool) (index!51158 (_ BitVec 32)) (x!132737 (_ BitVec 32))) (Undefined!12191) (MissingVacant!12191 (index!51159 (_ BitVec 32))) )
))
(declare-fun lt!645789 () SeekEntryResult!12191)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12191)

(assert (=> b!1479231 (= res!1005262 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!645789)))))

(declare-fun b!1479232 () Bool)

(declare-fun res!1005248 () Bool)

(declare-fun e!829724 () Bool)

(assert (=> b!1479232 (=> (not res!1005248) (not e!829724))))

(declare-fun lt!645784 () SeekEntryResult!12191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12191)

(assert (=> b!1479232 (= res!1005248 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!645784))))

(declare-fun b!1479233 () Bool)

(assert (=> b!1479233 (= e!829723 true)))

(declare-fun lt!645782 () (_ BitVec 64))

(assert (=> b!1479233 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645782 lt!645787 mask!2687) lt!645789)))

(declare-datatypes ((Unit!49563 0))(
  ( (Unit!49564) )
))
(declare-fun lt!645786 () Unit!49563)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49563)

(assert (=> b!1479233 (= lt!645786 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479234 () Bool)

(declare-fun res!1005257 () Bool)

(declare-fun e!829727 () Bool)

(assert (=> b!1479234 (=> (not res!1005257) (not e!829727))))

(assert (=> b!1479234 (= res!1005257 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479235 () Bool)

(declare-fun res!1005259 () Bool)

(assert (=> b!1479235 (=> (not res!1005259) (not e!829727))))

(declare-fun e!829722 () Bool)

(assert (=> b!1479235 (= res!1005259 e!829722)))

(declare-fun c!136510 () Bool)

(assert (=> b!1479235 (= c!136510 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479236 () Bool)

(declare-fun res!1005249 () Bool)

(assert (=> b!1479236 (=> (not res!1005249) (not e!829728))))

(assert (=> b!1479236 (= res!1005249 (and (= (size!48478 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48478 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48478 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479237 () Bool)

(declare-fun res!1005264 () Bool)

(assert (=> b!1479237 (=> (not res!1005264) (not e!829728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99292 (_ BitVec 32)) Bool)

(assert (=> b!1479237 (= res!1005264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479238 () Bool)

(assert (=> b!1479238 (= e!829727 (not e!829723))))

(declare-fun res!1005258 () Bool)

(assert (=> b!1479238 (=> res!1005258 e!829723)))

(assert (=> b!1479238 (= res!1005258 (or (and (= (select (arr!47926 a!2862) index!646) (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47926 a!2862) index!646) (select (arr!47926 a!2862) j!93))) (not (= (select (arr!47926 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479238 e!829725))

(declare-fun res!1005256 () Bool)

(assert (=> b!1479238 (=> (not res!1005256) (not e!829725))))

(declare-fun lt!645785 () SeekEntryResult!12191)

(assert (=> b!1479238 (= res!1005256 (and (= lt!645785 lt!645789) (or (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) (select (arr!47926 a!2862) j!93)))))))

(assert (=> b!1479238 (= lt!645789 (Found!12191 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12191)

(assert (=> b!1479238 (= lt!645785 (seekEntryOrOpen!0 (select (arr!47926 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479238 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!645783 () Unit!49563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49563)

(assert (=> b!1479238 (= lt!645783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479239 () Bool)

(declare-fun lt!645788 () SeekEntryResult!12191)

(assert (=> b!1479239 (= e!829722 (= lt!645788 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645782 lt!645787 mask!2687)))))

(declare-fun b!1479240 () Bool)

(assert (=> b!1479240 (= e!829722 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645782 lt!645787 mask!2687) (seekEntryOrOpen!0 lt!645782 lt!645787 mask!2687)))))

(declare-fun b!1479241 () Bool)

(declare-fun res!1005250 () Bool)

(assert (=> b!1479241 (=> (not res!1005250) (not e!829728))))

(declare-datatypes ((List!34505 0))(
  ( (Nil!34502) (Cons!34501 (h!35869 (_ BitVec 64)) (t!49191 List!34505)) )
))
(declare-fun arrayNoDuplicates!0 (array!99292 (_ BitVec 32) List!34505) Bool)

(assert (=> b!1479241 (= res!1005250 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34502))))

(declare-fun b!1479242 () Bool)

(assert (=> b!1479242 (= e!829724 e!829727)))

(declare-fun res!1005251 () Bool)

(assert (=> b!1479242 (=> (not res!1005251) (not e!829727))))

(assert (=> b!1479242 (= res!1005251 (= lt!645788 (Intermediate!12191 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479242 (= lt!645788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645782 mask!2687) lt!645782 lt!645787 mask!2687))))

(assert (=> b!1479242 (= lt!645782 (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479243 () Bool)

(assert (=> b!1479243 (= e!829726 e!829724)))

(declare-fun res!1005253 () Bool)

(assert (=> b!1479243 (=> (not res!1005253) (not e!829724))))

(assert (=> b!1479243 (= res!1005253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47926 a!2862) j!93) mask!2687) (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!645784))))

(assert (=> b!1479243 (= lt!645784 (Intermediate!12191 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1005263 () Bool)

(assert (=> start!126208 (=> (not res!1005263) (not e!829728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126208 (= res!1005263 (validMask!0 mask!2687))))

(assert (=> start!126208 e!829728))

(assert (=> start!126208 true))

(declare-fun array_inv!37159 (array!99292) Bool)

(assert (=> start!126208 (array_inv!37159 a!2862)))

(declare-fun b!1479225 () Bool)

(assert (=> b!1479225 (= e!829729 e!829731)))

(declare-fun res!1005265 () Bool)

(assert (=> b!1479225 (=> (not res!1005265) (not e!829731))))

(assert (=> b!1479225 (= res!1005265 (= lt!645785 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47926 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!126208 res!1005263) b!1479236))

(assert (= (and b!1479236 res!1005249) b!1479226))

(assert (= (and b!1479226 res!1005255) b!1479228))

(assert (= (and b!1479228 res!1005261) b!1479237))

(assert (= (and b!1479237 res!1005264) b!1479241))

(assert (= (and b!1479241 res!1005250) b!1479224))

(assert (= (and b!1479224 res!1005260) b!1479229))

(assert (= (and b!1479229 res!1005254) b!1479243))

(assert (= (and b!1479243 res!1005253) b!1479232))

(assert (= (and b!1479232 res!1005248) b!1479242))

(assert (= (and b!1479242 res!1005251) b!1479235))

(assert (= (and b!1479235 c!136510) b!1479239))

(assert (= (and b!1479235 (not c!136510)) b!1479240))

(assert (= (and b!1479235 res!1005259) b!1479234))

(assert (= (and b!1479234 res!1005257) b!1479238))

(assert (= (and b!1479238 res!1005256) b!1479227))

(assert (= (and b!1479227 (not res!1005252)) b!1479225))

(assert (= (and b!1479225 res!1005265) b!1479230))

(assert (= (and b!1479238 (not res!1005258)) b!1479231))

(assert (= (and b!1479231 (not res!1005262)) b!1479233))

(declare-fun m!1364613 () Bool)

(assert (=> b!1479233 m!1364613))

(declare-fun m!1364615 () Bool)

(assert (=> b!1479233 m!1364615))

(declare-fun m!1364617 () Bool)

(assert (=> start!126208 m!1364617))

(declare-fun m!1364619 () Bool)

(assert (=> start!126208 m!1364619))

(declare-fun m!1364621 () Bool)

(assert (=> b!1479229 m!1364621))

(declare-fun m!1364623 () Bool)

(assert (=> b!1479229 m!1364623))

(declare-fun m!1364625 () Bool)

(assert (=> b!1479228 m!1364625))

(assert (=> b!1479228 m!1364625))

(declare-fun m!1364627 () Bool)

(assert (=> b!1479228 m!1364627))

(declare-fun m!1364629 () Bool)

(assert (=> b!1479227 m!1364629))

(assert (=> b!1479227 m!1364621))

(declare-fun m!1364631 () Bool)

(assert (=> b!1479227 m!1364631))

(assert (=> b!1479227 m!1364625))

(declare-fun m!1364633 () Bool)

(assert (=> b!1479239 m!1364633))

(declare-fun m!1364635 () Bool)

(assert (=> b!1479237 m!1364635))

(assert (=> b!1479232 m!1364625))

(assert (=> b!1479232 m!1364625))

(declare-fun m!1364637 () Bool)

(assert (=> b!1479232 m!1364637))

(declare-fun m!1364639 () Bool)

(assert (=> b!1479242 m!1364639))

(assert (=> b!1479242 m!1364639))

(declare-fun m!1364641 () Bool)

(assert (=> b!1479242 m!1364641))

(assert (=> b!1479242 m!1364621))

(declare-fun m!1364643 () Bool)

(assert (=> b!1479242 m!1364643))

(assert (=> b!1479240 m!1364613))

(declare-fun m!1364645 () Bool)

(assert (=> b!1479240 m!1364645))

(declare-fun m!1364647 () Bool)

(assert (=> b!1479238 m!1364647))

(assert (=> b!1479238 m!1364621))

(declare-fun m!1364649 () Bool)

(assert (=> b!1479238 m!1364649))

(assert (=> b!1479238 m!1364631))

(assert (=> b!1479238 m!1364629))

(assert (=> b!1479238 m!1364625))

(declare-fun m!1364651 () Bool)

(assert (=> b!1479238 m!1364651))

(declare-fun m!1364653 () Bool)

(assert (=> b!1479238 m!1364653))

(assert (=> b!1479238 m!1364625))

(assert (=> b!1479225 m!1364625))

(assert (=> b!1479225 m!1364625))

(declare-fun m!1364655 () Bool)

(assert (=> b!1479225 m!1364655))

(declare-fun m!1364657 () Bool)

(assert (=> b!1479226 m!1364657))

(assert (=> b!1479226 m!1364657))

(declare-fun m!1364659 () Bool)

(assert (=> b!1479226 m!1364659))

(assert (=> b!1479231 m!1364625))

(assert (=> b!1479231 m!1364625))

(declare-fun m!1364661 () Bool)

(assert (=> b!1479231 m!1364661))

(assert (=> b!1479243 m!1364625))

(assert (=> b!1479243 m!1364625))

(declare-fun m!1364663 () Bool)

(assert (=> b!1479243 m!1364663))

(assert (=> b!1479243 m!1364663))

(assert (=> b!1479243 m!1364625))

(declare-fun m!1364665 () Bool)

(assert (=> b!1479243 m!1364665))

(declare-fun m!1364667 () Bool)

(assert (=> b!1479241 m!1364667))

(check-sat (not b!1479241) (not b!1479240) (not b!1479237) (not b!1479231) (not b!1479239) (not b!1479232) (not b!1479238) (not b!1479225) (not b!1479228) (not start!126208) (not b!1479243) (not b!1479233) (not b!1479226) (not b!1479242))
(check-sat)
