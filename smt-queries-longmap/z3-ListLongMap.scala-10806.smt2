; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126486 () Bool)

(assert start!126486)

(declare-fun b!1483099 () Bool)

(declare-fun res!1008011 () Bool)

(declare-fun e!831643 () Bool)

(assert (=> b!1483099 (=> (not res!1008011) (not e!831643))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483099 (= res!1008011 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483100 () Bool)

(declare-fun res!1008013 () Bool)

(declare-fun e!831644 () Bool)

(assert (=> b!1483100 (=> (not res!1008013) (not e!831644))))

(declare-datatypes ((array!99448 0))(
  ( (array!99449 (arr!48000 (Array (_ BitVec 32) (_ BitVec 64))) (size!48550 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99448)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99448 (_ BitVec 32)) Bool)

(assert (=> b!1483100 (= res!1008013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483101 () Bool)

(declare-fun e!831638 () Bool)

(declare-fun e!831647 () Bool)

(assert (=> b!1483101 (= e!831638 e!831647)))

(declare-fun res!1008007 () Bool)

(assert (=> b!1483101 (=> res!1008007 e!831647)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!647318 () (_ BitVec 64))

(assert (=> b!1483101 (= res!1008007 (or (and (= (select (arr!48000 a!2862) index!646) lt!647318) (= (select (arr!48000 a!2862) index!646) (select (arr!48000 a!2862) j!93))) (= (select (arr!48000 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483101 (= lt!647318 (select (store (arr!48000 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483102 () Bool)

(declare-fun e!831639 () Bool)

(declare-fun lt!647313 () array!99448)

(declare-fun lt!647314 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12240 0))(
  ( (MissingZero!12240 (index!51352 (_ BitVec 32))) (Found!12240 (index!51353 (_ BitVec 32))) (Intermediate!12240 (undefined!13052 Bool) (index!51354 (_ BitVec 32)) (x!132940 (_ BitVec 32))) (Undefined!12240) (MissingVacant!12240 (index!51355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12240)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12240)

(assert (=> b!1483102 (= e!831639 (= (seekEntryOrOpen!0 lt!647314 lt!647313 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647314 lt!647313 mask!2687)))))

(declare-fun b!1483104 () Bool)

(declare-fun res!1008018 () Bool)

(assert (=> b!1483104 (=> (not res!1008018) (not e!831643))))

(declare-fun e!831642 () Bool)

(assert (=> b!1483104 (= res!1008018 e!831642)))

(declare-fun c!137070 () Bool)

(assert (=> b!1483104 (= c!137070 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483105 () Bool)

(declare-fun res!1008021 () Bool)

(assert (=> b!1483105 (=> (not res!1008021) (not e!831644))))

(assert (=> b!1483105 (= res!1008021 (and (= (size!48550 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48550 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48550 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483106 () Bool)

(declare-fun res!1008014 () Bool)

(assert (=> b!1483106 (=> (not res!1008014) (not e!831638))))

(assert (=> b!1483106 (= res!1008014 (= (seekEntryOrOpen!0 (select (arr!48000 a!2862) j!93) a!2862 mask!2687) (Found!12240 j!93)))))

(declare-fun b!1483107 () Bool)

(declare-fun res!1008019 () Bool)

(assert (=> b!1483107 (=> (not res!1008019) (not e!831644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483107 (= res!1008019 (validKeyInArray!0 (select (arr!48000 a!2862) i!1006)))))

(declare-fun b!1483108 () Bool)

(assert (=> b!1483108 (= e!831647 e!831639)))

(declare-fun res!1008010 () Bool)

(assert (=> b!1483108 (=> (not res!1008010) (not e!831639))))

(assert (=> b!1483108 (= res!1008010 (and (= index!646 intermediateAfterIndex!19) (= lt!647318 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483109 () Bool)

(declare-fun e!831645 () Bool)

(declare-fun e!831641 () Bool)

(assert (=> b!1483109 (= e!831645 e!831641)))

(declare-fun res!1008004 () Bool)

(assert (=> b!1483109 (=> (not res!1008004) (not e!831641))))

(declare-fun lt!647316 () SeekEntryResult!12240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483109 (= res!1008004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48000 a!2862) j!93) mask!2687) (select (arr!48000 a!2862) j!93) a!2862 mask!2687) lt!647316))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483109 (= lt!647316 (Intermediate!12240 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483110 () Bool)

(assert (=> b!1483110 (= e!831644 e!831645)))

(declare-fun res!1008012 () Bool)

(assert (=> b!1483110 (=> (not res!1008012) (not e!831645))))

(assert (=> b!1483110 (= res!1008012 (= (select (store (arr!48000 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483110 (= lt!647313 (array!99449 (store (arr!48000 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48550 a!2862)))))

(declare-fun b!1483111 () Bool)

(declare-fun lt!647317 () SeekEntryResult!12240)

(assert (=> b!1483111 (= e!831642 (= lt!647317 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647314 lt!647313 mask!2687)))))

(declare-fun b!1483112 () Bool)

(declare-fun res!1008016 () Bool)

(assert (=> b!1483112 (=> (not res!1008016) (not e!831644))))

(assert (=> b!1483112 (= res!1008016 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48550 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48550 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48550 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483113 () Bool)

(declare-fun e!831640 () Bool)

(assert (=> b!1483113 (= e!831640 true)))

(declare-fun lt!647319 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483113 (= lt!647319 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483114 () Bool)

(declare-fun res!1008006 () Bool)

(assert (=> b!1483114 (=> (not res!1008006) (not e!831641))))

(assert (=> b!1483114 (= res!1008006 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48000 a!2862) j!93) a!2862 mask!2687) lt!647316))))

(declare-fun b!1483115 () Bool)

(declare-fun res!1008017 () Bool)

(assert (=> b!1483115 (=> (not res!1008017) (not e!831644))))

(assert (=> b!1483115 (= res!1008017 (validKeyInArray!0 (select (arr!48000 a!2862) j!93)))))

(declare-fun b!1483103 () Bool)

(assert (=> b!1483103 (= e!831642 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647314 lt!647313 mask!2687) (seekEntryOrOpen!0 lt!647314 lt!647313 mask!2687)))))

(declare-fun res!1008008 () Bool)

(assert (=> start!126486 (=> (not res!1008008) (not e!831644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126486 (= res!1008008 (validMask!0 mask!2687))))

(assert (=> start!126486 e!831644))

(assert (=> start!126486 true))

(declare-fun array_inv!37028 (array!99448) Bool)

(assert (=> start!126486 (array_inv!37028 a!2862)))

(declare-fun b!1483116 () Bool)

(assert (=> b!1483116 (= e!831643 (not e!831640))))

(declare-fun res!1008009 () Bool)

(assert (=> b!1483116 (=> res!1008009 e!831640)))

(assert (=> b!1483116 (= res!1008009 (or (and (= (select (arr!48000 a!2862) index!646) (select (store (arr!48000 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48000 a!2862) index!646) (select (arr!48000 a!2862) j!93))) (= (select (arr!48000 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483116 e!831638))

(declare-fun res!1008022 () Bool)

(assert (=> b!1483116 (=> (not res!1008022) (not e!831638))))

(assert (=> b!1483116 (= res!1008022 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49820 0))(
  ( (Unit!49821) )
))
(declare-fun lt!647315 () Unit!49820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49820)

(assert (=> b!1483116 (= lt!647315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483117 () Bool)

(assert (=> b!1483117 (= e!831641 e!831643)))

(declare-fun res!1008020 () Bool)

(assert (=> b!1483117 (=> (not res!1008020) (not e!831643))))

(assert (=> b!1483117 (= res!1008020 (= lt!647317 (Intermediate!12240 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483117 (= lt!647317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647314 mask!2687) lt!647314 lt!647313 mask!2687))))

(assert (=> b!1483117 (= lt!647314 (select (store (arr!48000 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483118 () Bool)

(declare-fun res!1008005 () Bool)

(assert (=> b!1483118 (=> (not res!1008005) (not e!831644))))

(declare-datatypes ((List!34501 0))(
  ( (Nil!34498) (Cons!34497 (h!35871 (_ BitVec 64)) (t!49195 List!34501)) )
))
(declare-fun arrayNoDuplicates!0 (array!99448 (_ BitVec 32) List!34501) Bool)

(assert (=> b!1483118 (= res!1008005 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34498))))

(declare-fun b!1483119 () Bool)

(declare-fun res!1008015 () Bool)

(assert (=> b!1483119 (=> (not res!1008015) (not e!831638))))

(assert (=> b!1483119 (= res!1008015 (or (= (select (arr!48000 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48000 a!2862) intermediateBeforeIndex!19) (select (arr!48000 a!2862) j!93))))))

(assert (= (and start!126486 res!1008008) b!1483105))

(assert (= (and b!1483105 res!1008021) b!1483107))

(assert (= (and b!1483107 res!1008019) b!1483115))

(assert (= (and b!1483115 res!1008017) b!1483100))

(assert (= (and b!1483100 res!1008013) b!1483118))

(assert (= (and b!1483118 res!1008005) b!1483112))

(assert (= (and b!1483112 res!1008016) b!1483110))

(assert (= (and b!1483110 res!1008012) b!1483109))

(assert (= (and b!1483109 res!1008004) b!1483114))

(assert (= (and b!1483114 res!1008006) b!1483117))

(assert (= (and b!1483117 res!1008020) b!1483104))

(assert (= (and b!1483104 c!137070) b!1483111))

(assert (= (and b!1483104 (not c!137070)) b!1483103))

(assert (= (and b!1483104 res!1008018) b!1483099))

(assert (= (and b!1483099 res!1008011) b!1483116))

(assert (= (and b!1483116 res!1008022) b!1483106))

(assert (= (and b!1483106 res!1008014) b!1483119))

(assert (= (and b!1483119 res!1008015) b!1483101))

(assert (= (and b!1483101 (not res!1008007)) b!1483108))

(assert (= (and b!1483108 res!1008010) b!1483102))

(assert (= (and b!1483116 (not res!1008009)) b!1483113))

(declare-fun m!1368641 () Bool)

(assert (=> b!1483116 m!1368641))

(declare-fun m!1368643 () Bool)

(assert (=> b!1483116 m!1368643))

(declare-fun m!1368645 () Bool)

(assert (=> b!1483116 m!1368645))

(declare-fun m!1368647 () Bool)

(assert (=> b!1483116 m!1368647))

(declare-fun m!1368649 () Bool)

(assert (=> b!1483116 m!1368649))

(declare-fun m!1368651 () Bool)

(assert (=> b!1483116 m!1368651))

(declare-fun m!1368653 () Bool)

(assert (=> b!1483118 m!1368653))

(declare-fun m!1368655 () Bool)

(assert (=> b!1483102 m!1368655))

(declare-fun m!1368657 () Bool)

(assert (=> b!1483102 m!1368657))

(assert (=> b!1483109 m!1368651))

(assert (=> b!1483109 m!1368651))

(declare-fun m!1368659 () Bool)

(assert (=> b!1483109 m!1368659))

(assert (=> b!1483109 m!1368659))

(assert (=> b!1483109 m!1368651))

(declare-fun m!1368661 () Bool)

(assert (=> b!1483109 m!1368661))

(declare-fun m!1368663 () Bool)

(assert (=> b!1483117 m!1368663))

(assert (=> b!1483117 m!1368663))

(declare-fun m!1368665 () Bool)

(assert (=> b!1483117 m!1368665))

(assert (=> b!1483117 m!1368643))

(declare-fun m!1368667 () Bool)

(assert (=> b!1483117 m!1368667))

(declare-fun m!1368669 () Bool)

(assert (=> b!1483100 m!1368669))

(declare-fun m!1368671 () Bool)

(assert (=> b!1483107 m!1368671))

(assert (=> b!1483107 m!1368671))

(declare-fun m!1368673 () Bool)

(assert (=> b!1483107 m!1368673))

(declare-fun m!1368675 () Bool)

(assert (=> start!126486 m!1368675))

(declare-fun m!1368677 () Bool)

(assert (=> start!126486 m!1368677))

(assert (=> b!1483110 m!1368643))

(declare-fun m!1368679 () Bool)

(assert (=> b!1483110 m!1368679))

(declare-fun m!1368681 () Bool)

(assert (=> b!1483111 m!1368681))

(assert (=> b!1483114 m!1368651))

(assert (=> b!1483114 m!1368651))

(declare-fun m!1368683 () Bool)

(assert (=> b!1483114 m!1368683))

(assert (=> b!1483106 m!1368651))

(assert (=> b!1483106 m!1368651))

(declare-fun m!1368685 () Bool)

(assert (=> b!1483106 m!1368685))

(declare-fun m!1368687 () Bool)

(assert (=> b!1483113 m!1368687))

(assert (=> b!1483103 m!1368657))

(assert (=> b!1483103 m!1368655))

(assert (=> b!1483101 m!1368647))

(assert (=> b!1483101 m!1368651))

(assert (=> b!1483101 m!1368643))

(assert (=> b!1483101 m!1368645))

(declare-fun m!1368689 () Bool)

(assert (=> b!1483119 m!1368689))

(assert (=> b!1483119 m!1368651))

(assert (=> b!1483115 m!1368651))

(assert (=> b!1483115 m!1368651))

(declare-fun m!1368691 () Bool)

(assert (=> b!1483115 m!1368691))

(check-sat (not b!1483115) (not b!1483100) (not b!1483114) (not b!1483113) (not b!1483111) (not b!1483116) (not b!1483117) (not b!1483102) (not b!1483106) (not b!1483118) (not start!126486) (not b!1483103) (not b!1483109) (not b!1483107))
(check-sat)
