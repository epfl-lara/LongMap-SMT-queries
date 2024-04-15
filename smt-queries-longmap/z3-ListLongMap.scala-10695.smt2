; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125278 () Bool)

(assert start!125278)

(declare-fun b!1463442 () Bool)

(declare-fun res!992780 () Bool)

(declare-fun e!822500 () Bool)

(assert (=> b!1463442 (=> (not res!992780) (not e!822500))))

(declare-datatypes ((array!98704 0))(
  ( (array!98705 (arr!47641 (Array (_ BitVec 32) (_ BitVec 64))) (size!48193 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98704)

(declare-datatypes ((List!34220 0))(
  ( (Nil!34217) (Cons!34216 (h!35566 (_ BitVec 64)) (t!48906 List!34220)) )
))
(declare-fun arrayNoDuplicates!0 (array!98704 (_ BitVec 32) List!34220) Bool)

(assert (=> b!1463442 (= res!992780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34217))))

(declare-fun b!1463443 () Bool)

(declare-fun res!992781 () Bool)

(declare-fun e!822495 () Bool)

(assert (=> b!1463443 (=> res!992781 e!822495)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640597 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11918 0))(
  ( (MissingZero!11918 (index!50064 (_ BitVec 32))) (Found!11918 (index!50065 (_ BitVec 32))) (Intermediate!11918 (undefined!12730 Bool) (index!50066 (_ BitVec 32)) (x!131650 (_ BitVec 32))) (Undefined!11918) (MissingVacant!11918 (index!50067 (_ BitVec 32))) )
))
(declare-fun lt!640596 () SeekEntryResult!11918)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11918)

(assert (=> b!1463443 (= res!992781 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640597 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640596)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822501 () Bool)

(declare-fun b!1463444 () Bool)

(assert (=> b!1463444 (= e!822501 (or (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) (select (arr!47641 a!2862) j!93))))))

(declare-fun res!992785 () Bool)

(assert (=> start!125278 (=> (not res!992785) (not e!822500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125278 (= res!992785 (validMask!0 mask!2687))))

(assert (=> start!125278 e!822500))

(assert (=> start!125278 true))

(declare-fun array_inv!36874 (array!98704) Bool)

(assert (=> start!125278 (array_inv!36874 a!2862)))

(declare-fun b!1463445 () Bool)

(declare-fun e!822504 () Bool)

(declare-fun lt!640601 () (_ BitVec 64))

(declare-fun lt!640602 () array!98704)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11918)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11918)

(assert (=> b!1463445 (= e!822504 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640597 intermediateAfterIndex!19 lt!640601 lt!640602 mask!2687) (seekEntryOrOpen!0 lt!640601 lt!640602 mask!2687))))))

(declare-fun b!1463446 () Bool)

(declare-fun e!822498 () Bool)

(assert (=> b!1463446 (= e!822500 e!822498)))

(declare-fun res!992778 () Bool)

(assert (=> b!1463446 (=> (not res!992778) (not e!822498))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463446 (= res!992778 (= (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463446 (= lt!640602 (array!98705 (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48193 a!2862)))))

(declare-fun b!1463447 () Bool)

(declare-fun e!822503 () Bool)

(assert (=> b!1463447 (= e!822503 e!822495)))

(declare-fun res!992788 () Bool)

(assert (=> b!1463447 (=> res!992788 e!822495)))

(assert (=> b!1463447 (= res!992788 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640597 #b00000000000000000000000000000000) (bvsge lt!640597 (size!48193 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463447 (= lt!640597 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463448 () Bool)

(declare-fun res!992791 () Bool)

(assert (=> b!1463448 (=> (not res!992791) (not e!822500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463448 (= res!992791 (validKeyInArray!0 (select (arr!47641 a!2862) j!93)))))

(declare-fun b!1463449 () Bool)

(declare-fun res!992786 () Bool)

(declare-fun e!822497 () Bool)

(assert (=> b!1463449 (=> (not res!992786) (not e!822497))))

(declare-fun e!822499 () Bool)

(assert (=> b!1463449 (= res!992786 e!822499)))

(declare-fun c!134848 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463449 (= c!134848 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463450 () Bool)

(declare-fun res!992784 () Bool)

(assert (=> b!1463450 (=> (not res!992784) (not e!822500))))

(assert (=> b!1463450 (= res!992784 (and (= (size!48193 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48193 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48193 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463451 () Bool)

(declare-fun res!992790 () Bool)

(declare-fun e!822502 () Bool)

(assert (=> b!1463451 (=> (not res!992790) (not e!822502))))

(assert (=> b!1463451 (= res!992790 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640596))))

(declare-fun b!1463452 () Bool)

(declare-fun res!992787 () Bool)

(assert (=> b!1463452 (=> (not res!992787) (not e!822497))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463452 (= res!992787 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463453 () Bool)

(assert (=> b!1463453 (= e!822502 e!822497)))

(declare-fun res!992774 () Bool)

(assert (=> b!1463453 (=> (not res!992774) (not e!822497))))

(declare-fun lt!640600 () SeekEntryResult!11918)

(assert (=> b!1463453 (= res!992774 (= lt!640600 (Intermediate!11918 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463453 (= lt!640600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640601 mask!2687) lt!640601 lt!640602 mask!2687))))

(assert (=> b!1463453 (= lt!640601 (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463454 () Bool)

(declare-fun res!992775 () Bool)

(assert (=> b!1463454 (=> (not res!992775) (not e!822500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98704 (_ BitVec 32)) Bool)

(assert (=> b!1463454 (= res!992775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463455 () Bool)

(assert (=> b!1463455 (= e!822497 (not e!822503))))

(declare-fun res!992779 () Bool)

(assert (=> b!1463455 (=> res!992779 e!822503)))

(assert (=> b!1463455 (= res!992779 (or (and (= (select (arr!47641 a!2862) index!646) (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47641 a!2862) index!646) (select (arr!47641 a!2862) j!93))) (= (select (arr!47641 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463455 e!822501))

(declare-fun res!992776 () Bool)

(assert (=> b!1463455 (=> (not res!992776) (not e!822501))))

(assert (=> b!1463455 (= res!992776 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49173 0))(
  ( (Unit!49174) )
))
(declare-fun lt!640598 () Unit!49173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49173)

(assert (=> b!1463455 (= lt!640598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463456 () Bool)

(assert (=> b!1463456 (= e!822498 e!822502)))

(declare-fun res!992777 () Bool)

(assert (=> b!1463456 (=> (not res!992777) (not e!822502))))

(assert (=> b!1463456 (= res!992777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47641 a!2862) j!93) mask!2687) (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!640596))))

(assert (=> b!1463456 (= lt!640596 (Intermediate!11918 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463457 () Bool)

(assert (=> b!1463457 (= e!822499 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640601 lt!640602 mask!2687) (seekEntryOrOpen!0 lt!640601 lt!640602 mask!2687)))))

(declare-fun b!1463458 () Bool)

(declare-fun res!992789 () Bool)

(assert (=> b!1463458 (=> (not res!992789) (not e!822501))))

(assert (=> b!1463458 (= res!992789 (= (seekEntryOrOpen!0 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) (Found!11918 j!93)))))

(declare-fun b!1463459 () Bool)

(declare-fun res!992783 () Bool)

(assert (=> b!1463459 (=> (not res!992783) (not e!822500))))

(assert (=> b!1463459 (= res!992783 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48193 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48193 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48193 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463460 () Bool)

(assert (=> b!1463460 (= e!822504 (not (= lt!640600 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640597 lt!640601 lt!640602 mask!2687))))))

(declare-fun b!1463461 () Bool)

(assert (=> b!1463461 (= e!822499 (= lt!640600 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640601 lt!640602 mask!2687)))))

(declare-fun b!1463462 () Bool)

(assert (=> b!1463462 (= e!822495 true)))

(declare-fun lt!640599 () Bool)

(assert (=> b!1463462 (= lt!640599 e!822504)))

(declare-fun c!134847 () Bool)

(assert (=> b!1463462 (= c!134847 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463463 () Bool)

(declare-fun res!992782 () Bool)

(assert (=> b!1463463 (=> (not res!992782) (not e!822500))))

(assert (=> b!1463463 (= res!992782 (validKeyInArray!0 (select (arr!47641 a!2862) i!1006)))))

(assert (= (and start!125278 res!992785) b!1463450))

(assert (= (and b!1463450 res!992784) b!1463463))

(assert (= (and b!1463463 res!992782) b!1463448))

(assert (= (and b!1463448 res!992791) b!1463454))

(assert (= (and b!1463454 res!992775) b!1463442))

(assert (= (and b!1463442 res!992780) b!1463459))

(assert (= (and b!1463459 res!992783) b!1463446))

(assert (= (and b!1463446 res!992778) b!1463456))

(assert (= (and b!1463456 res!992777) b!1463451))

(assert (= (and b!1463451 res!992790) b!1463453))

(assert (= (and b!1463453 res!992774) b!1463449))

(assert (= (and b!1463449 c!134848) b!1463461))

(assert (= (and b!1463449 (not c!134848)) b!1463457))

(assert (= (and b!1463449 res!992786) b!1463452))

(assert (= (and b!1463452 res!992787) b!1463455))

(assert (= (and b!1463455 res!992776) b!1463458))

(assert (= (and b!1463458 res!992789) b!1463444))

(assert (= (and b!1463455 (not res!992779)) b!1463447))

(assert (= (and b!1463447 (not res!992788)) b!1463443))

(assert (= (and b!1463443 (not res!992781)) b!1463462))

(assert (= (and b!1463462 c!134847) b!1463460))

(assert (= (and b!1463462 (not c!134847)) b!1463445))

(declare-fun m!1350273 () Bool)

(assert (=> b!1463455 m!1350273))

(declare-fun m!1350275 () Bool)

(assert (=> b!1463455 m!1350275))

(declare-fun m!1350277 () Bool)

(assert (=> b!1463455 m!1350277))

(declare-fun m!1350279 () Bool)

(assert (=> b!1463455 m!1350279))

(declare-fun m!1350281 () Bool)

(assert (=> b!1463455 m!1350281))

(declare-fun m!1350283 () Bool)

(assert (=> b!1463455 m!1350283))

(declare-fun m!1350285 () Bool)

(assert (=> b!1463454 m!1350285))

(declare-fun m!1350287 () Bool)

(assert (=> b!1463457 m!1350287))

(declare-fun m!1350289 () Bool)

(assert (=> b!1463457 m!1350289))

(declare-fun m!1350291 () Bool)

(assert (=> b!1463442 m!1350291))

(declare-fun m!1350293 () Bool)

(assert (=> b!1463445 m!1350293))

(assert (=> b!1463445 m!1350289))

(declare-fun m!1350295 () Bool)

(assert (=> b!1463444 m!1350295))

(assert (=> b!1463444 m!1350283))

(assert (=> b!1463458 m!1350283))

(assert (=> b!1463458 m!1350283))

(declare-fun m!1350297 () Bool)

(assert (=> b!1463458 m!1350297))

(assert (=> b!1463448 m!1350283))

(assert (=> b!1463448 m!1350283))

(declare-fun m!1350299 () Bool)

(assert (=> b!1463448 m!1350299))

(assert (=> b!1463443 m!1350283))

(assert (=> b!1463443 m!1350283))

(declare-fun m!1350301 () Bool)

(assert (=> b!1463443 m!1350301))

(declare-fun m!1350303 () Bool)

(assert (=> b!1463453 m!1350303))

(assert (=> b!1463453 m!1350303))

(declare-fun m!1350305 () Bool)

(assert (=> b!1463453 m!1350305))

(assert (=> b!1463453 m!1350275))

(declare-fun m!1350307 () Bool)

(assert (=> b!1463453 m!1350307))

(assert (=> b!1463446 m!1350275))

(declare-fun m!1350309 () Bool)

(assert (=> b!1463446 m!1350309))

(declare-fun m!1350311 () Bool)

(assert (=> b!1463461 m!1350311))

(declare-fun m!1350313 () Bool)

(assert (=> b!1463447 m!1350313))

(declare-fun m!1350315 () Bool)

(assert (=> start!125278 m!1350315))

(declare-fun m!1350317 () Bool)

(assert (=> start!125278 m!1350317))

(declare-fun m!1350319 () Bool)

(assert (=> b!1463460 m!1350319))

(declare-fun m!1350321 () Bool)

(assert (=> b!1463463 m!1350321))

(assert (=> b!1463463 m!1350321))

(declare-fun m!1350323 () Bool)

(assert (=> b!1463463 m!1350323))

(assert (=> b!1463451 m!1350283))

(assert (=> b!1463451 m!1350283))

(declare-fun m!1350325 () Bool)

(assert (=> b!1463451 m!1350325))

(assert (=> b!1463456 m!1350283))

(assert (=> b!1463456 m!1350283))

(declare-fun m!1350327 () Bool)

(assert (=> b!1463456 m!1350327))

(assert (=> b!1463456 m!1350327))

(assert (=> b!1463456 m!1350283))

(declare-fun m!1350329 () Bool)

(assert (=> b!1463456 m!1350329))

(check-sat (not b!1463447) (not b!1463463) (not b!1463457) (not b!1463442) (not b!1463454) (not b!1463460) (not b!1463451) (not b!1463445) (not b!1463456) (not b!1463461) (not b!1463443) (not b!1463455) (not b!1463458) (not b!1463453) (not start!125278) (not b!1463448))
(check-sat)
