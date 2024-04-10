; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126370 () Bool)

(assert start!126370)

(declare-fun res!1006612 () Bool)

(declare-fun e!830805 () Bool)

(assert (=> start!126370 (=> (not res!1006612) (not e!830805))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126370 (= res!1006612 (validMask!0 mask!2687))))

(assert (=> start!126370 e!830805))

(assert (=> start!126370 true))

(declare-datatypes ((array!99389 0))(
  ( (array!99390 (arr!47972 (Array (_ BitVec 32) (_ BitVec 64))) (size!48522 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99389)

(declare-fun array_inv!37000 (array!99389) Bool)

(assert (=> start!126370 (array_inv!37000 a!2862)))

(declare-datatypes ((SeekEntryResult!12212 0))(
  ( (MissingZero!12212 (index!51240 (_ BitVec 32))) (Found!12212 (index!51241 (_ BitVec 32))) (Intermediate!12212 (undefined!13024 Bool) (index!51242 (_ BitVec 32)) (x!132831 (_ BitVec 32))) (Undefined!12212) (MissingVacant!12212 (index!51243 (_ BitVec 32))) )
))
(declare-fun lt!646724 () SeekEntryResult!12212)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646728 () (_ BitVec 64))

(declare-fun lt!646726 () array!99389)

(declare-fun e!830802 () Bool)

(declare-fun b!1481261 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99389 (_ BitVec 32)) SeekEntryResult!12212)

(assert (=> b!1481261 (= e!830802 (= lt!646724 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646728 lt!646726 mask!2687)))))

(declare-fun b!1481262 () Bool)

(declare-fun res!1006615 () Bool)

(declare-fun e!830803 () Bool)

(assert (=> b!1481262 (=> (not res!1006615) (not e!830803))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481262 (= res!1006615 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481263 () Bool)

(declare-fun e!830806 () Bool)

(assert (=> b!1481263 (= e!830805 e!830806)))

(declare-fun res!1006609 () Bool)

(assert (=> b!1481263 (=> (not res!1006609) (not e!830806))))

(assert (=> b!1481263 (= res!1006609 (= (select (store (arr!47972 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481263 (= lt!646726 (array!99390 (store (arr!47972 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48522 a!2862)))))

(declare-fun b!1481264 () Bool)

(declare-fun res!1006618 () Bool)

(assert (=> b!1481264 (=> (not res!1006618) (not e!830805))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481264 (= res!1006618 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48522 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48522 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48522 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481265 () Bool)

(declare-fun res!1006616 () Bool)

(assert (=> b!1481265 (=> (not res!1006616) (not e!830805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99389 (_ BitVec 32)) Bool)

(assert (=> b!1481265 (= res!1006616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481266 () Bool)

(declare-fun e!830807 () Bool)

(assert (=> b!1481266 (= e!830807 e!830803)))

(declare-fun res!1006621 () Bool)

(assert (=> b!1481266 (=> (not res!1006621) (not e!830803))))

(assert (=> b!1481266 (= res!1006621 (= lt!646724 (Intermediate!12212 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481266 (= lt!646724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646728 mask!2687) lt!646728 lt!646726 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1481266 (= lt!646728 (select (store (arr!47972 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481267 () Bool)

(assert (=> b!1481267 (= e!830806 e!830807)))

(declare-fun res!1006614 () Bool)

(assert (=> b!1481267 (=> (not res!1006614) (not e!830807))))

(declare-fun lt!646725 () SeekEntryResult!12212)

(assert (=> b!1481267 (= res!1006614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47972 a!2862) j!93) mask!2687) (select (arr!47972 a!2862) j!93) a!2862 mask!2687) lt!646725))))

(assert (=> b!1481267 (= lt!646725 (Intermediate!12212 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481268 () Bool)

(assert (=> b!1481268 (= e!830803 (not true))))

(declare-fun e!830801 () Bool)

(assert (=> b!1481268 e!830801))

(declare-fun res!1006613 () Bool)

(assert (=> b!1481268 (=> (not res!1006613) (not e!830801))))

(assert (=> b!1481268 (= res!1006613 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49764 0))(
  ( (Unit!49765) )
))
(declare-fun lt!646727 () Unit!49764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49764)

(assert (=> b!1481268 (= lt!646727 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481269 () Bool)

(declare-fun res!1006617 () Bool)

(assert (=> b!1481269 (=> (not res!1006617) (not e!830805))))

(declare-datatypes ((List!34473 0))(
  ( (Nil!34470) (Cons!34469 (h!35840 (_ BitVec 64)) (t!49167 List!34473)) )
))
(declare-fun arrayNoDuplicates!0 (array!99389 (_ BitVec 32) List!34473) Bool)

(assert (=> b!1481269 (= res!1006617 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34470))))

(declare-fun b!1481270 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99389 (_ BitVec 32)) SeekEntryResult!12212)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99389 (_ BitVec 32)) SeekEntryResult!12212)

(assert (=> b!1481270 (= e!830802 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646728 lt!646726 mask!2687) (seekEntryOrOpen!0 lt!646728 lt!646726 mask!2687)))))

(declare-fun b!1481271 () Bool)

(declare-fun res!1006607 () Bool)

(assert (=> b!1481271 (=> (not res!1006607) (not e!830801))))

(assert (=> b!1481271 (= res!1006607 (= (seekEntryOrOpen!0 (select (arr!47972 a!2862) j!93) a!2862 mask!2687) (Found!12212 j!93)))))

(declare-fun b!1481272 () Bool)

(assert (=> b!1481272 (= e!830801 (and (or (= (select (arr!47972 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47972 a!2862) intermediateBeforeIndex!19) (select (arr!47972 a!2862) j!93))) (or (and (= (select (arr!47972 a!2862) index!646) (select (store (arr!47972 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47972 a!2862) index!646) (select (arr!47972 a!2862) j!93))) (= (select (arr!47972 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481273 () Bool)

(declare-fun res!1006610 () Bool)

(assert (=> b!1481273 (=> (not res!1006610) (not e!830807))))

(assert (=> b!1481273 (= res!1006610 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47972 a!2862) j!93) a!2862 mask!2687) lt!646725))))

(declare-fun b!1481274 () Bool)

(declare-fun res!1006620 () Bool)

(assert (=> b!1481274 (=> (not res!1006620) (not e!830805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481274 (= res!1006620 (validKeyInArray!0 (select (arr!47972 a!2862) j!93)))))

(declare-fun b!1481275 () Bool)

(declare-fun res!1006611 () Bool)

(assert (=> b!1481275 (=> (not res!1006611) (not e!830803))))

(assert (=> b!1481275 (= res!1006611 e!830802)))

(declare-fun c!136848 () Bool)

(assert (=> b!1481275 (= c!136848 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481276 () Bool)

(declare-fun res!1006608 () Bool)

(assert (=> b!1481276 (=> (not res!1006608) (not e!830805))))

(assert (=> b!1481276 (= res!1006608 (validKeyInArray!0 (select (arr!47972 a!2862) i!1006)))))

(declare-fun b!1481277 () Bool)

(declare-fun res!1006619 () Bool)

(assert (=> b!1481277 (=> (not res!1006619) (not e!830805))))

(assert (=> b!1481277 (= res!1006619 (and (= (size!48522 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48522 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48522 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126370 res!1006612) b!1481277))

(assert (= (and b!1481277 res!1006619) b!1481276))

(assert (= (and b!1481276 res!1006608) b!1481274))

(assert (= (and b!1481274 res!1006620) b!1481265))

(assert (= (and b!1481265 res!1006616) b!1481269))

(assert (= (and b!1481269 res!1006617) b!1481264))

(assert (= (and b!1481264 res!1006618) b!1481263))

(assert (= (and b!1481263 res!1006609) b!1481267))

(assert (= (and b!1481267 res!1006614) b!1481273))

(assert (= (and b!1481273 res!1006610) b!1481266))

(assert (= (and b!1481266 res!1006621) b!1481275))

(assert (= (and b!1481275 c!136848) b!1481261))

(assert (= (and b!1481275 (not c!136848)) b!1481270))

(assert (= (and b!1481275 res!1006611) b!1481262))

(assert (= (and b!1481262 res!1006615) b!1481268))

(assert (= (and b!1481268 res!1006613) b!1481271))

(assert (= (and b!1481271 res!1006607) b!1481272))

(declare-fun m!1367005 () Bool)

(assert (=> b!1481265 m!1367005))

(declare-fun m!1367007 () Bool)

(assert (=> b!1481273 m!1367007))

(assert (=> b!1481273 m!1367007))

(declare-fun m!1367009 () Bool)

(assert (=> b!1481273 m!1367009))

(declare-fun m!1367011 () Bool)

(assert (=> start!126370 m!1367011))

(declare-fun m!1367013 () Bool)

(assert (=> start!126370 m!1367013))

(declare-fun m!1367015 () Bool)

(assert (=> b!1481272 m!1367015))

(declare-fun m!1367017 () Bool)

(assert (=> b!1481272 m!1367017))

(declare-fun m!1367019 () Bool)

(assert (=> b!1481272 m!1367019))

(declare-fun m!1367021 () Bool)

(assert (=> b!1481272 m!1367021))

(assert (=> b!1481272 m!1367007))

(assert (=> b!1481271 m!1367007))

(assert (=> b!1481271 m!1367007))

(declare-fun m!1367023 () Bool)

(assert (=> b!1481271 m!1367023))

(declare-fun m!1367025 () Bool)

(assert (=> b!1481266 m!1367025))

(assert (=> b!1481266 m!1367025))

(declare-fun m!1367027 () Bool)

(assert (=> b!1481266 m!1367027))

(assert (=> b!1481266 m!1367015))

(declare-fun m!1367029 () Bool)

(assert (=> b!1481266 m!1367029))

(declare-fun m!1367031 () Bool)

(assert (=> b!1481269 m!1367031))

(assert (=> b!1481274 m!1367007))

(assert (=> b!1481274 m!1367007))

(declare-fun m!1367033 () Bool)

(assert (=> b!1481274 m!1367033))

(declare-fun m!1367035 () Bool)

(assert (=> b!1481276 m!1367035))

(assert (=> b!1481276 m!1367035))

(declare-fun m!1367037 () Bool)

(assert (=> b!1481276 m!1367037))

(declare-fun m!1367039 () Bool)

(assert (=> b!1481261 m!1367039))

(assert (=> b!1481263 m!1367015))

(declare-fun m!1367041 () Bool)

(assert (=> b!1481263 m!1367041))

(declare-fun m!1367043 () Bool)

(assert (=> b!1481270 m!1367043))

(declare-fun m!1367045 () Bool)

(assert (=> b!1481270 m!1367045))

(declare-fun m!1367047 () Bool)

(assert (=> b!1481268 m!1367047))

(declare-fun m!1367049 () Bool)

(assert (=> b!1481268 m!1367049))

(assert (=> b!1481267 m!1367007))

(assert (=> b!1481267 m!1367007))

(declare-fun m!1367051 () Bool)

(assert (=> b!1481267 m!1367051))

(assert (=> b!1481267 m!1367051))

(assert (=> b!1481267 m!1367007))

(declare-fun m!1367053 () Bool)

(assert (=> b!1481267 m!1367053))

(push 1)

