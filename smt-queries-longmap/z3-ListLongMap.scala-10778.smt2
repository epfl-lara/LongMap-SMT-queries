; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126136 () Bool)

(assert start!126136)

(declare-fun b!1477267 () Bool)

(declare-fun e!828744 () Bool)

(assert (=> b!1477267 (= e!828744 (not true))))

(declare-fun e!828747 () Bool)

(assert (=> b!1477267 e!828747))

(declare-fun res!1003509 () Bool)

(assert (=> b!1477267 (=> (not res!1003509) (not e!828747))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99220 0))(
  ( (array!99221 (arr!47890 (Array (_ BitVec 32) (_ BitVec 64))) (size!48442 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99220)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12155 0))(
  ( (MissingZero!12155 (index!51012 (_ BitVec 32))) (Found!12155 (index!51013 (_ BitVec 32))) (Intermediate!12155 (undefined!12967 Bool) (index!51014 (_ BitVec 32)) (x!132605 (_ BitVec 32))) (Undefined!12155) (MissingVacant!12155 (index!51015 (_ BitVec 32))) )
))
(declare-fun lt!645124 () SeekEntryResult!12155)

(assert (=> b!1477267 (= res!1003509 (and (= lt!645124 (Found!12155 j!93)) (or (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) (select (arr!47890 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477267 (= lt!645124 (seekEntryOrOpen!0 (select (arr!47890 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99220 (_ BitVec 32)) Bool)

(assert (=> b!1477267 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49491 0))(
  ( (Unit!49492) )
))
(declare-fun lt!645125 () Unit!49491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49491)

(assert (=> b!1477267 (= lt!645125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477268 () Bool)

(declare-fun res!1003515 () Bool)

(declare-fun e!828739 () Bool)

(assert (=> b!1477268 (=> (not res!1003515) (not e!828739))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477268 (= res!1003515 (and (= (size!48442 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48442 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48442 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!828746 () Bool)

(declare-fun b!1477269 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1477269 (= e!828746 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477270 () Bool)

(declare-fun res!1003517 () Bool)

(declare-fun e!828741 () Bool)

(assert (=> b!1477270 (=> (not res!1003517) (not e!828741))))

(declare-fun lt!645122 () SeekEntryResult!12155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477270 (= res!1003517 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!645122))))

(declare-fun b!1477271 () Bool)

(declare-fun res!1003522 () Bool)

(assert (=> b!1477271 (=> (not res!1003522) (not e!828739))))

(declare-datatypes ((List!34469 0))(
  ( (Nil!34466) (Cons!34465 (h!35833 (_ BitVec 64)) (t!49155 List!34469)) )
))
(declare-fun arrayNoDuplicates!0 (array!99220 (_ BitVec 32) List!34469) Bool)

(assert (=> b!1477271 (= res!1003522 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34466))))

(declare-fun b!1477273 () Bool)

(declare-fun e!828740 () Bool)

(assert (=> b!1477273 (= e!828747 e!828740)))

(declare-fun res!1003510 () Bool)

(assert (=> b!1477273 (=> res!1003510 e!828740)))

(assert (=> b!1477273 (= res!1003510 (or (and (= (select (arr!47890 a!2862) index!646) (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47890 a!2862) index!646) (select (arr!47890 a!2862) j!93))) (not (= (select (arr!47890 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477274 () Bool)

(declare-fun res!1003520 () Bool)

(assert (=> b!1477274 (=> (not res!1003520) (not e!828739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477274 (= res!1003520 (validKeyInArray!0 (select (arr!47890 a!2862) j!93)))))

(declare-fun b!1477275 () Bool)

(assert (=> b!1477275 (= e!828740 e!828746)))

(declare-fun res!1003507 () Bool)

(assert (=> b!1477275 (=> (not res!1003507) (not e!828746))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12155)

(assert (=> b!1477275 (= res!1003507 (= lt!645124 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!828745 () Bool)

(declare-fun b!1477276 () Bool)

(declare-fun lt!645121 () (_ BitVec 64))

(declare-fun lt!645126 () array!99220)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477276 (= e!828745 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645121 lt!645126 mask!2687) (seekEntryOrOpen!0 lt!645121 lt!645126 mask!2687)))))

(declare-fun b!1477277 () Bool)

(declare-fun e!828742 () Bool)

(assert (=> b!1477277 (= e!828742 e!828741)))

(declare-fun res!1003514 () Bool)

(assert (=> b!1477277 (=> (not res!1003514) (not e!828741))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477277 (= res!1003514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!645122))))

(assert (=> b!1477277 (= lt!645122 (Intermediate!12155 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477278 () Bool)

(declare-fun res!1003519 () Bool)

(assert (=> b!1477278 (=> (not res!1003519) (not e!828744))))

(assert (=> b!1477278 (= res!1003519 e!828745)))

(declare-fun c!136402 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477278 (= c!136402 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477279 () Bool)

(assert (=> b!1477279 (= e!828739 e!828742)))

(declare-fun res!1003513 () Bool)

(assert (=> b!1477279 (=> (not res!1003513) (not e!828742))))

(assert (=> b!1477279 (= res!1003513 (= (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477279 (= lt!645126 (array!99221 (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48442 a!2862)))))

(declare-fun lt!645123 () SeekEntryResult!12155)

(declare-fun b!1477280 () Bool)

(assert (=> b!1477280 (= e!828745 (= lt!645123 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645121 lt!645126 mask!2687)))))

(declare-fun b!1477281 () Bool)

(declare-fun res!1003518 () Bool)

(assert (=> b!1477281 (=> (not res!1003518) (not e!828739))))

(assert (=> b!1477281 (= res!1003518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477282 () Bool)

(declare-fun res!1003508 () Bool)

(assert (=> b!1477282 (=> (not res!1003508) (not e!828739))))

(assert (=> b!1477282 (= res!1003508 (validKeyInArray!0 (select (arr!47890 a!2862) i!1006)))))

(declare-fun b!1477272 () Bool)

(declare-fun res!1003516 () Bool)

(assert (=> b!1477272 (=> (not res!1003516) (not e!828744))))

(assert (=> b!1477272 (= res!1003516 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1003521 () Bool)

(assert (=> start!126136 (=> (not res!1003521) (not e!828739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126136 (= res!1003521 (validMask!0 mask!2687))))

(assert (=> start!126136 e!828739))

(assert (=> start!126136 true))

(declare-fun array_inv!37123 (array!99220) Bool)

(assert (=> start!126136 (array_inv!37123 a!2862)))

(declare-fun b!1477283 () Bool)

(declare-fun res!1003511 () Bool)

(assert (=> b!1477283 (=> (not res!1003511) (not e!828739))))

(assert (=> b!1477283 (= res!1003511 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48442 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48442 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48442 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477284 () Bool)

(assert (=> b!1477284 (= e!828741 e!828744)))

(declare-fun res!1003512 () Bool)

(assert (=> b!1477284 (=> (not res!1003512) (not e!828744))))

(assert (=> b!1477284 (= res!1003512 (= lt!645123 (Intermediate!12155 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477284 (= lt!645123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645121 mask!2687) lt!645121 lt!645126 mask!2687))))

(assert (=> b!1477284 (= lt!645121 (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126136 res!1003521) b!1477268))

(assert (= (and b!1477268 res!1003515) b!1477282))

(assert (= (and b!1477282 res!1003508) b!1477274))

(assert (= (and b!1477274 res!1003520) b!1477281))

(assert (= (and b!1477281 res!1003518) b!1477271))

(assert (= (and b!1477271 res!1003522) b!1477283))

(assert (= (and b!1477283 res!1003511) b!1477279))

(assert (= (and b!1477279 res!1003513) b!1477277))

(assert (= (and b!1477277 res!1003514) b!1477270))

(assert (= (and b!1477270 res!1003517) b!1477284))

(assert (= (and b!1477284 res!1003512) b!1477278))

(assert (= (and b!1477278 c!136402) b!1477280))

(assert (= (and b!1477278 (not c!136402)) b!1477276))

(assert (= (and b!1477278 res!1003519) b!1477272))

(assert (= (and b!1477272 res!1003516) b!1477267))

(assert (= (and b!1477267 res!1003509) b!1477273))

(assert (= (and b!1477273 (not res!1003510)) b!1477275))

(assert (= (and b!1477275 res!1003507) b!1477269))

(declare-fun m!1362735 () Bool)

(assert (=> b!1477282 m!1362735))

(assert (=> b!1477282 m!1362735))

(declare-fun m!1362737 () Bool)

(assert (=> b!1477282 m!1362737))

(declare-fun m!1362739 () Bool)

(assert (=> b!1477270 m!1362739))

(assert (=> b!1477270 m!1362739))

(declare-fun m!1362741 () Bool)

(assert (=> b!1477270 m!1362741))

(declare-fun m!1362743 () Bool)

(assert (=> b!1477267 m!1362743))

(declare-fun m!1362745 () Bool)

(assert (=> b!1477267 m!1362745))

(assert (=> b!1477267 m!1362739))

(declare-fun m!1362747 () Bool)

(assert (=> b!1477267 m!1362747))

(declare-fun m!1362749 () Bool)

(assert (=> b!1477267 m!1362749))

(assert (=> b!1477267 m!1362739))

(declare-fun m!1362751 () Bool)

(assert (=> b!1477280 m!1362751))

(assert (=> b!1477275 m!1362739))

(assert (=> b!1477275 m!1362739))

(declare-fun m!1362753 () Bool)

(assert (=> b!1477275 m!1362753))

(assert (=> b!1477277 m!1362739))

(assert (=> b!1477277 m!1362739))

(declare-fun m!1362755 () Bool)

(assert (=> b!1477277 m!1362755))

(assert (=> b!1477277 m!1362755))

(assert (=> b!1477277 m!1362739))

(declare-fun m!1362757 () Bool)

(assert (=> b!1477277 m!1362757))

(declare-fun m!1362759 () Bool)

(assert (=> b!1477276 m!1362759))

(declare-fun m!1362761 () Bool)

(assert (=> b!1477276 m!1362761))

(declare-fun m!1362763 () Bool)

(assert (=> b!1477284 m!1362763))

(assert (=> b!1477284 m!1362763))

(declare-fun m!1362765 () Bool)

(assert (=> b!1477284 m!1362765))

(declare-fun m!1362767 () Bool)

(assert (=> b!1477284 m!1362767))

(declare-fun m!1362769 () Bool)

(assert (=> b!1477284 m!1362769))

(declare-fun m!1362771 () Bool)

(assert (=> b!1477271 m!1362771))

(declare-fun m!1362773 () Bool)

(assert (=> start!126136 m!1362773))

(declare-fun m!1362775 () Bool)

(assert (=> start!126136 m!1362775))

(declare-fun m!1362777 () Bool)

(assert (=> b!1477281 m!1362777))

(assert (=> b!1477274 m!1362739))

(assert (=> b!1477274 m!1362739))

(declare-fun m!1362779 () Bool)

(assert (=> b!1477274 m!1362779))

(declare-fun m!1362781 () Bool)

(assert (=> b!1477273 m!1362781))

(assert (=> b!1477273 m!1362767))

(declare-fun m!1362783 () Bool)

(assert (=> b!1477273 m!1362783))

(assert (=> b!1477273 m!1362739))

(assert (=> b!1477279 m!1362767))

(declare-fun m!1362785 () Bool)

(assert (=> b!1477279 m!1362785))

(check-sat (not b!1477276) (not b!1477275) (not b!1477282) (not b!1477280) (not b!1477281) (not b!1477271) (not start!126136) (not b!1477277) (not b!1477284) (not b!1477274) (not b!1477270) (not b!1477267))
(check-sat)
