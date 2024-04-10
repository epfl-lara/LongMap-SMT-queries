; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124986 () Bool)

(assert start!124986)

(declare-fun b!1453226 () Bool)

(declare-fun e!817982 () Bool)

(declare-fun e!817975 () Bool)

(assert (=> b!1453226 (= e!817982 e!817975)))

(declare-fun res!984273 () Bool)

(assert (=> b!1453226 (=> (not res!984273) (not e!817975))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637174 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453226 (= res!984273 (and (= index!646 intermediateAfterIndex!19) (= lt!637174 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453227 () Bool)

(declare-fun res!984267 () Bool)

(declare-fun e!817981 () Bool)

(assert (=> b!1453227 (=> (not res!984267) (not e!817981))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((array!98434 0))(
  ( (array!98435 (arr!47505 (Array (_ BitVec 32) (_ BitVec 64))) (size!48055 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98434)

(assert (=> b!1453227 (= res!984267 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48055 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48055 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48055 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453228 () Bool)

(declare-fun e!817974 () Bool)

(assert (=> b!1453228 (= e!817974 e!817982)))

(declare-fun res!984262 () Bool)

(assert (=> b!1453228 (=> res!984262 e!817982)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453228 (= res!984262 (or (and (= (select (arr!47505 a!2862) index!646) lt!637174) (= (select (arr!47505 a!2862) index!646) (select (arr!47505 a!2862) j!93))) (= (select (arr!47505 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453228 (= lt!637174 (select (store (arr!47505 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun lt!637179 () array!98434)

(declare-fun b!1453229 () Bool)

(declare-fun lt!637176 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11757 0))(
  ( (MissingZero!11757 (index!49420 (_ BitVec 32))) (Found!11757 (index!49421 (_ BitVec 32))) (Intermediate!11757 (undefined!12569 Bool) (index!49422 (_ BitVec 32)) (x!131062 (_ BitVec 32))) (Undefined!11757) (MissingVacant!11757 (index!49423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11757)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11757)

(assert (=> b!1453229 (= e!817975 (= (seekEntryOrOpen!0 lt!637176 lt!637179 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637176 lt!637179 mask!2687)))))

(declare-fun b!1453230 () Bool)

(declare-fun res!984259 () Bool)

(assert (=> b!1453230 (=> (not res!984259) (not e!817981))))

(declare-datatypes ((List!34006 0))(
  ( (Nil!34003) (Cons!34002 (h!35352 (_ BitVec 64)) (t!48700 List!34006)) )
))
(declare-fun arrayNoDuplicates!0 (array!98434 (_ BitVec 32) List!34006) Bool)

(assert (=> b!1453230 (= res!984259 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34003))))

(declare-fun b!1453231 () Bool)

(declare-fun res!984266 () Bool)

(declare-fun e!817978 () Bool)

(assert (=> b!1453231 (=> (not res!984266) (not e!817978))))

(declare-fun lt!637175 () SeekEntryResult!11757)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11757)

(assert (=> b!1453231 (= res!984266 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47505 a!2862) j!93) a!2862 mask!2687) lt!637175))))

(declare-fun e!817976 () Bool)

(declare-fun b!1453232 () Bool)

(assert (=> b!1453232 (= e!817976 (not (or (and (= (select (arr!47505 a!2862) index!646) (select (store (arr!47505 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47505 a!2862) index!646) (select (arr!47505 a!2862) j!93))) (= (select (arr!47505 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1453232 e!817974))

(declare-fun res!984264 () Bool)

(assert (=> b!1453232 (=> (not res!984264) (not e!817974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98434 (_ BitVec 32)) Bool)

(assert (=> b!1453232 (= res!984264 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49010 0))(
  ( (Unit!49011) )
))
(declare-fun lt!637177 () Unit!49010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49010)

(assert (=> b!1453232 (= lt!637177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453233 () Bool)

(declare-fun res!984270 () Bool)

(assert (=> b!1453233 (=> (not res!984270) (not e!817981))))

(assert (=> b!1453233 (= res!984270 (and (= (size!48055 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48055 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48055 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453234 () Bool)

(declare-fun e!817980 () Bool)

(assert (=> b!1453234 (= e!817980 e!817978)))

(declare-fun res!984269 () Bool)

(assert (=> b!1453234 (=> (not res!984269) (not e!817978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453234 (= res!984269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47505 a!2862) j!93) mask!2687) (select (arr!47505 a!2862) j!93) a!2862 mask!2687) lt!637175))))

(assert (=> b!1453234 (= lt!637175 (Intermediate!11757 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453235 () Bool)

(declare-fun res!984272 () Bool)

(assert (=> b!1453235 (=> (not res!984272) (not e!817981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453235 (= res!984272 (validKeyInArray!0 (select (arr!47505 a!2862) j!93)))))

(declare-fun b!1453236 () Bool)

(declare-fun res!984271 () Bool)

(assert (=> b!1453236 (=> (not res!984271) (not e!817974))))

(assert (=> b!1453236 (= res!984271 (= (seekEntryOrOpen!0 (select (arr!47505 a!2862) j!93) a!2862 mask!2687) (Found!11757 j!93)))))

(declare-fun b!1453237 () Bool)

(declare-fun res!984274 () Bool)

(assert (=> b!1453237 (=> (not res!984274) (not e!817976))))

(declare-fun e!817977 () Bool)

(assert (=> b!1453237 (= res!984274 e!817977)))

(declare-fun c!133995 () Bool)

(assert (=> b!1453237 (= c!133995 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453238 () Bool)

(declare-fun res!984263 () Bool)

(assert (=> b!1453238 (=> (not res!984263) (not e!817974))))

(assert (=> b!1453238 (= res!984263 (or (= (select (arr!47505 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47505 a!2862) intermediateBeforeIndex!19) (select (arr!47505 a!2862) j!93))))))

(declare-fun b!1453239 () Bool)

(declare-fun res!984257 () Bool)

(assert (=> b!1453239 (=> (not res!984257) (not e!817981))))

(assert (=> b!1453239 (= res!984257 (validKeyInArray!0 (select (arr!47505 a!2862) i!1006)))))

(declare-fun b!1453240 () Bool)

(assert (=> b!1453240 (= e!817977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637176 lt!637179 mask!2687) (seekEntryOrOpen!0 lt!637176 lt!637179 mask!2687)))))

(declare-fun b!1453241 () Bool)

(assert (=> b!1453241 (= e!817978 e!817976)))

(declare-fun res!984258 () Bool)

(assert (=> b!1453241 (=> (not res!984258) (not e!817976))))

(declare-fun lt!637178 () SeekEntryResult!11757)

(assert (=> b!1453241 (= res!984258 (= lt!637178 (Intermediate!11757 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453241 (= lt!637178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637176 mask!2687) lt!637176 lt!637179 mask!2687))))

(assert (=> b!1453241 (= lt!637176 (select (store (arr!47505 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!984265 () Bool)

(assert (=> start!124986 (=> (not res!984265) (not e!817981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124986 (= res!984265 (validMask!0 mask!2687))))

(assert (=> start!124986 e!817981))

(assert (=> start!124986 true))

(declare-fun array_inv!36533 (array!98434) Bool)

(assert (=> start!124986 (array_inv!36533 a!2862)))

(declare-fun b!1453242 () Bool)

(declare-fun res!984268 () Bool)

(assert (=> b!1453242 (=> (not res!984268) (not e!817976))))

(assert (=> b!1453242 (= res!984268 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453243 () Bool)

(assert (=> b!1453243 (= e!817977 (= lt!637178 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637176 lt!637179 mask!2687)))))

(declare-fun b!1453244 () Bool)

(assert (=> b!1453244 (= e!817981 e!817980)))

(declare-fun res!984261 () Bool)

(assert (=> b!1453244 (=> (not res!984261) (not e!817980))))

(assert (=> b!1453244 (= res!984261 (= (select (store (arr!47505 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453244 (= lt!637179 (array!98435 (store (arr!47505 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48055 a!2862)))))

(declare-fun b!1453245 () Bool)

(declare-fun res!984260 () Bool)

(assert (=> b!1453245 (=> (not res!984260) (not e!817981))))

(assert (=> b!1453245 (= res!984260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124986 res!984265) b!1453233))

(assert (= (and b!1453233 res!984270) b!1453239))

(assert (= (and b!1453239 res!984257) b!1453235))

(assert (= (and b!1453235 res!984272) b!1453245))

(assert (= (and b!1453245 res!984260) b!1453230))

(assert (= (and b!1453230 res!984259) b!1453227))

(assert (= (and b!1453227 res!984267) b!1453244))

(assert (= (and b!1453244 res!984261) b!1453234))

(assert (= (and b!1453234 res!984269) b!1453231))

(assert (= (and b!1453231 res!984266) b!1453241))

(assert (= (and b!1453241 res!984258) b!1453237))

(assert (= (and b!1453237 c!133995) b!1453243))

(assert (= (and b!1453237 (not c!133995)) b!1453240))

(assert (= (and b!1453237 res!984274) b!1453242))

(assert (= (and b!1453242 res!984268) b!1453232))

(assert (= (and b!1453232 res!984264) b!1453236))

(assert (= (and b!1453236 res!984271) b!1453238))

(assert (= (and b!1453238 res!984263) b!1453228))

(assert (= (and b!1453228 (not res!984262)) b!1453226))

(assert (= (and b!1453226 res!984273) b!1453229))

(declare-fun m!1341741 () Bool)

(assert (=> start!124986 m!1341741))

(declare-fun m!1341743 () Bool)

(assert (=> start!124986 m!1341743))

(declare-fun m!1341745 () Bool)

(assert (=> b!1453228 m!1341745))

(declare-fun m!1341747 () Bool)

(assert (=> b!1453228 m!1341747))

(declare-fun m!1341749 () Bool)

(assert (=> b!1453228 m!1341749))

(declare-fun m!1341751 () Bool)

(assert (=> b!1453228 m!1341751))

(declare-fun m!1341753 () Bool)

(assert (=> b!1453243 m!1341753))

(declare-fun m!1341755 () Bool)

(assert (=> b!1453245 m!1341755))

(assert (=> b!1453244 m!1341749))

(declare-fun m!1341757 () Bool)

(assert (=> b!1453244 m!1341757))

(declare-fun m!1341759 () Bool)

(assert (=> b!1453230 m!1341759))

(declare-fun m!1341761 () Bool)

(assert (=> b!1453240 m!1341761))

(declare-fun m!1341763 () Bool)

(assert (=> b!1453240 m!1341763))

(declare-fun m!1341765 () Bool)

(assert (=> b!1453232 m!1341765))

(assert (=> b!1453232 m!1341749))

(assert (=> b!1453232 m!1341751))

(assert (=> b!1453232 m!1341745))

(declare-fun m!1341767 () Bool)

(assert (=> b!1453232 m!1341767))

(assert (=> b!1453232 m!1341747))

(declare-fun m!1341769 () Bool)

(assert (=> b!1453241 m!1341769))

(assert (=> b!1453241 m!1341769))

(declare-fun m!1341771 () Bool)

(assert (=> b!1453241 m!1341771))

(assert (=> b!1453241 m!1341749))

(declare-fun m!1341773 () Bool)

(assert (=> b!1453241 m!1341773))

(assert (=> b!1453229 m!1341763))

(assert (=> b!1453229 m!1341761))

(declare-fun m!1341775 () Bool)

(assert (=> b!1453238 m!1341775))

(assert (=> b!1453238 m!1341747))

(assert (=> b!1453236 m!1341747))

(assert (=> b!1453236 m!1341747))

(declare-fun m!1341777 () Bool)

(assert (=> b!1453236 m!1341777))

(assert (=> b!1453234 m!1341747))

(assert (=> b!1453234 m!1341747))

(declare-fun m!1341779 () Bool)

(assert (=> b!1453234 m!1341779))

(assert (=> b!1453234 m!1341779))

(assert (=> b!1453234 m!1341747))

(declare-fun m!1341781 () Bool)

(assert (=> b!1453234 m!1341781))

(declare-fun m!1341783 () Bool)

(assert (=> b!1453239 m!1341783))

(assert (=> b!1453239 m!1341783))

(declare-fun m!1341785 () Bool)

(assert (=> b!1453239 m!1341785))

(assert (=> b!1453235 m!1341747))

(assert (=> b!1453235 m!1341747))

(declare-fun m!1341787 () Bool)

(assert (=> b!1453235 m!1341787))

(assert (=> b!1453231 m!1341747))

(assert (=> b!1453231 m!1341747))

(declare-fun m!1341789 () Bool)

(assert (=> b!1453231 m!1341789))

(check-sat (not start!124986) (not b!1453239) (not b!1453234) (not b!1453231) (not b!1453236) (not b!1453241) (not b!1453243) (not b!1453240) (not b!1453235) (not b!1453232) (not b!1453230) (not b!1453229) (not b!1453245))
(check-sat)
