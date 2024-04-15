; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124786 () Bool)

(assert start!124786)

(declare-fun b!1448289 () Bool)

(declare-fun e!815626 () Bool)

(assert (=> b!1448289 (= e!815626 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11672 0))(
  ( (MissingZero!11672 (index!49080 (_ BitVec 32))) (Found!11672 (index!49081 (_ BitVec 32))) (Intermediate!11672 (undefined!12484 Bool) (index!49082 (_ BitVec 32)) (x!130748 (_ BitVec 32))) (Undefined!11672) (MissingVacant!11672 (index!49083 (_ BitVec 32))) )
))
(declare-fun lt!635316 () SeekEntryResult!11672)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98212 0))(
  ( (array!98213 (arr!47395 (Array (_ BitVec 32) (_ BitVec 64))) (size!47947 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98212)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11672)

(assert (=> b!1448289 (= lt!635316 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47395 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448290 () Bool)

(declare-fun res!979961 () Bool)

(declare-fun e!815619 () Bool)

(assert (=> b!1448290 (=> (not res!979961) (not e!815619))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448290 (= res!979961 (and (= (size!47947 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47947 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47947 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448291 () Bool)

(declare-fun res!979955 () Bool)

(declare-fun e!815621 () Bool)

(assert (=> b!1448291 (=> (not res!979955) (not e!815621))))

(declare-fun e!815625 () Bool)

(assert (=> b!1448291 (= res!979955 e!815625)))

(declare-fun c!133684 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448291 (= c!133684 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448292 () Bool)

(declare-fun e!815622 () Bool)

(assert (=> b!1448292 (= e!815622 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448293 () Bool)

(declare-fun e!815620 () Bool)

(declare-fun e!815627 () Bool)

(assert (=> b!1448293 (= e!815620 e!815627)))

(declare-fun res!979949 () Bool)

(assert (=> b!1448293 (=> res!979949 e!815627)))

(assert (=> b!1448293 (= res!979949 (or (and (= (select (arr!47395 a!2862) index!646) (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47395 a!2862) index!646) (select (arr!47395 a!2862) j!93))) (not (= (select (arr!47395 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448294 () Bool)

(declare-fun res!979962 () Bool)

(assert (=> b!1448294 (=> (not res!979962) (not e!815619))))

(declare-datatypes ((List!33974 0))(
  ( (Nil!33971) (Cons!33970 (h!35320 (_ BitVec 64)) (t!48660 List!33974)) )
))
(declare-fun arrayNoDuplicates!0 (array!98212 (_ BitVec 32) List!33974) Bool)

(assert (=> b!1448294 (= res!979962 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33971))))

(declare-fun b!1448295 () Bool)

(declare-fun res!979956 () Bool)

(assert (=> b!1448295 (=> (not res!979956) (not e!815619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448295 (= res!979956 (validKeyInArray!0 (select (arr!47395 a!2862) i!1006)))))

(declare-fun b!1448296 () Bool)

(declare-fun e!815628 () Bool)

(assert (=> b!1448296 (= e!815628 e!815621)))

(declare-fun res!979963 () Bool)

(assert (=> b!1448296 (=> (not res!979963) (not e!815621))))

(declare-fun lt!635319 () SeekEntryResult!11672)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448296 (= res!979963 (= lt!635319 (Intermediate!11672 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635313 () array!98212)

(declare-fun lt!635315 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448296 (= lt!635319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635315 mask!2687) lt!635315 lt!635313 mask!2687))))

(assert (=> b!1448296 (= lt!635315 (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448297 () Bool)

(assert (=> b!1448297 (= e!815625 (= lt!635319 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635315 lt!635313 mask!2687)))))

(declare-fun res!979960 () Bool)

(assert (=> start!124786 (=> (not res!979960) (not e!815619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124786 (= res!979960 (validMask!0 mask!2687))))

(assert (=> start!124786 e!815619))

(assert (=> start!124786 true))

(declare-fun array_inv!36628 (array!98212) Bool)

(assert (=> start!124786 (array_inv!36628 a!2862)))

(declare-fun b!1448298 () Bool)

(declare-fun res!979951 () Bool)

(assert (=> b!1448298 (=> (not res!979951) (not e!815619))))

(assert (=> b!1448298 (= res!979951 (validKeyInArray!0 (select (arr!47395 a!2862) j!93)))))

(declare-fun b!1448299 () Bool)

(assert (=> b!1448299 (= e!815621 (not e!815626))))

(declare-fun res!979957 () Bool)

(assert (=> b!1448299 (=> res!979957 e!815626)))

(assert (=> b!1448299 (= res!979957 (or (and (= (select (arr!47395 a!2862) index!646) (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47395 a!2862) index!646) (select (arr!47395 a!2862) j!93))) (not (= (select (arr!47395 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448299 e!815620))

(declare-fun res!979953 () Bool)

(assert (=> b!1448299 (=> (not res!979953) (not e!815620))))

(declare-fun lt!635314 () SeekEntryResult!11672)

(assert (=> b!1448299 (= res!979953 (and (= lt!635314 (Found!11672 j!93)) (or (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) (select (arr!47395 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11672)

(assert (=> b!1448299 (= lt!635314 (seekEntryOrOpen!0 (select (arr!47395 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98212 (_ BitVec 32)) Bool)

(assert (=> b!1448299 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48681 0))(
  ( (Unit!48682) )
))
(declare-fun lt!635317 () Unit!48681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48681)

(assert (=> b!1448299 (= lt!635317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448300 () Bool)

(declare-fun res!979954 () Bool)

(assert (=> b!1448300 (=> (not res!979954) (not e!815628))))

(declare-fun lt!635318 () SeekEntryResult!11672)

(assert (=> b!1448300 (= res!979954 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!635318))))

(declare-fun b!1448301 () Bool)

(declare-fun res!979950 () Bool)

(assert (=> b!1448301 (=> (not res!979950) (not e!815619))))

(assert (=> b!1448301 (= res!979950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448302 () Bool)

(assert (=> b!1448302 (= e!815627 e!815622)))

(declare-fun res!979958 () Bool)

(assert (=> b!1448302 (=> (not res!979958) (not e!815622))))

(assert (=> b!1448302 (= res!979958 (= lt!635314 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47395 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448303 () Bool)

(declare-fun e!815624 () Bool)

(assert (=> b!1448303 (= e!815624 e!815628)))

(declare-fun res!979948 () Bool)

(assert (=> b!1448303 (=> (not res!979948) (not e!815628))))

(assert (=> b!1448303 (= res!979948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47395 a!2862) j!93) mask!2687) (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!635318))))

(assert (=> b!1448303 (= lt!635318 (Intermediate!11672 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448304 () Bool)

(declare-fun res!979952 () Bool)

(assert (=> b!1448304 (=> (not res!979952) (not e!815621))))

(assert (=> b!1448304 (= res!979952 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448305 () Bool)

(assert (=> b!1448305 (= e!815619 e!815624)))

(declare-fun res!979947 () Bool)

(assert (=> b!1448305 (=> (not res!979947) (not e!815624))))

(assert (=> b!1448305 (= res!979947 (= (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448305 (= lt!635313 (array!98213 (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47947 a!2862)))))

(declare-fun b!1448306 () Bool)

(assert (=> b!1448306 (= e!815625 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635315 lt!635313 mask!2687) (seekEntryOrOpen!0 lt!635315 lt!635313 mask!2687)))))

(declare-fun b!1448307 () Bool)

(declare-fun res!979959 () Bool)

(assert (=> b!1448307 (=> (not res!979959) (not e!815619))))

(assert (=> b!1448307 (= res!979959 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47947 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47947 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47947 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124786 res!979960) b!1448290))

(assert (= (and b!1448290 res!979961) b!1448295))

(assert (= (and b!1448295 res!979956) b!1448298))

(assert (= (and b!1448298 res!979951) b!1448301))

(assert (= (and b!1448301 res!979950) b!1448294))

(assert (= (and b!1448294 res!979962) b!1448307))

(assert (= (and b!1448307 res!979959) b!1448305))

(assert (= (and b!1448305 res!979947) b!1448303))

(assert (= (and b!1448303 res!979948) b!1448300))

(assert (= (and b!1448300 res!979954) b!1448296))

(assert (= (and b!1448296 res!979963) b!1448291))

(assert (= (and b!1448291 c!133684) b!1448297))

(assert (= (and b!1448291 (not c!133684)) b!1448306))

(assert (= (and b!1448291 res!979955) b!1448304))

(assert (= (and b!1448304 res!979952) b!1448299))

(assert (= (and b!1448299 res!979953) b!1448293))

(assert (= (and b!1448293 (not res!979949)) b!1448302))

(assert (= (and b!1448302 res!979958) b!1448292))

(assert (= (and b!1448299 (not res!979957)) b!1448289))

(declare-fun m!1336569 () Bool)

(assert (=> b!1448298 m!1336569))

(assert (=> b!1448298 m!1336569))

(declare-fun m!1336571 () Bool)

(assert (=> b!1448298 m!1336571))

(declare-fun m!1336573 () Bool)

(assert (=> start!124786 m!1336573))

(declare-fun m!1336575 () Bool)

(assert (=> start!124786 m!1336575))

(assert (=> b!1448303 m!1336569))

(assert (=> b!1448303 m!1336569))

(declare-fun m!1336577 () Bool)

(assert (=> b!1448303 m!1336577))

(assert (=> b!1448303 m!1336577))

(assert (=> b!1448303 m!1336569))

(declare-fun m!1336579 () Bool)

(assert (=> b!1448303 m!1336579))

(assert (=> b!1448300 m!1336569))

(assert (=> b!1448300 m!1336569))

(declare-fun m!1336581 () Bool)

(assert (=> b!1448300 m!1336581))

(declare-fun m!1336583 () Bool)

(assert (=> b!1448306 m!1336583))

(declare-fun m!1336585 () Bool)

(assert (=> b!1448306 m!1336585))

(declare-fun m!1336587 () Bool)

(assert (=> b!1448296 m!1336587))

(assert (=> b!1448296 m!1336587))

(declare-fun m!1336589 () Bool)

(assert (=> b!1448296 m!1336589))

(declare-fun m!1336591 () Bool)

(assert (=> b!1448296 m!1336591))

(declare-fun m!1336593 () Bool)

(assert (=> b!1448296 m!1336593))

(declare-fun m!1336595 () Bool)

(assert (=> b!1448293 m!1336595))

(assert (=> b!1448293 m!1336591))

(declare-fun m!1336597 () Bool)

(assert (=> b!1448293 m!1336597))

(assert (=> b!1448293 m!1336569))

(declare-fun m!1336599 () Bool)

(assert (=> b!1448295 m!1336599))

(assert (=> b!1448295 m!1336599))

(declare-fun m!1336601 () Bool)

(assert (=> b!1448295 m!1336601))

(declare-fun m!1336603 () Bool)

(assert (=> b!1448297 m!1336603))

(assert (=> b!1448305 m!1336591))

(declare-fun m!1336605 () Bool)

(assert (=> b!1448305 m!1336605))

(assert (=> b!1448302 m!1336569))

(assert (=> b!1448302 m!1336569))

(declare-fun m!1336607 () Bool)

(assert (=> b!1448302 m!1336607))

(declare-fun m!1336609 () Bool)

(assert (=> b!1448299 m!1336609))

(assert (=> b!1448299 m!1336591))

(declare-fun m!1336611 () Bool)

(assert (=> b!1448299 m!1336611))

(assert (=> b!1448299 m!1336597))

(assert (=> b!1448299 m!1336595))

(assert (=> b!1448299 m!1336569))

(declare-fun m!1336613 () Bool)

(assert (=> b!1448299 m!1336613))

(declare-fun m!1336615 () Bool)

(assert (=> b!1448299 m!1336615))

(assert (=> b!1448299 m!1336569))

(assert (=> b!1448289 m!1336569))

(assert (=> b!1448289 m!1336569))

(declare-fun m!1336617 () Bool)

(assert (=> b!1448289 m!1336617))

(declare-fun m!1336619 () Bool)

(assert (=> b!1448301 m!1336619))

(declare-fun m!1336621 () Bool)

(assert (=> b!1448294 m!1336621))

(check-sat (not b!1448296) (not b!1448300) (not b!1448297) (not b!1448303) (not b!1448306) (not b!1448301) (not b!1448294) (not b!1448295) (not start!124786) (not b!1448289) (not b!1448298) (not b!1448299) (not b!1448302))
(check-sat)
