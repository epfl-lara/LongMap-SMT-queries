; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124902 () Bool)

(assert start!124902)

(declare-fun b!1451008 () Bool)

(declare-fun res!982295 () Bool)

(declare-fun e!817034 () Bool)

(assert (=> b!1451008 (=> (not res!982295) (not e!817034))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11715 0))(
  ( (MissingZero!11715 (index!49252 (_ BitVec 32))) (Found!11715 (index!49253 (_ BitVec 32))) (Intermediate!11715 (undefined!12527 Bool) (index!49254 (_ BitVec 32)) (x!130908 (_ BitVec 32))) (Undefined!11715) (MissingVacant!11715 (index!49255 (_ BitVec 32))) )
))
(declare-fun lt!636519 () SeekEntryResult!11715)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98350 0))(
  ( (array!98351 (arr!47463 (Array (_ BitVec 32) (_ BitVec 64))) (size!48013 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98350)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1451008 (= res!982295 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47463 a!2862) j!93) a!2862 mask!2687) lt!636519))))

(declare-fun res!982303 () Bool)

(declare-fun e!817037 () Bool)

(assert (=> start!124902 (=> (not res!982303) (not e!817037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124902 (= res!982303 (validMask!0 mask!2687))))

(assert (=> start!124902 e!817037))

(assert (=> start!124902 true))

(declare-fun array_inv!36491 (array!98350) Bool)

(assert (=> start!124902 (array_inv!36491 a!2862)))

(declare-fun b!1451009 () Bool)

(declare-fun res!982292 () Bool)

(declare-fun e!817030 () Bool)

(assert (=> b!1451009 (=> res!982292 e!817030)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!636521 () SeekEntryResult!11715)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1451009 (= res!982292 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47463 a!2862) j!93) a!2862 mask!2687) lt!636521)))))

(declare-fun b!1451010 () Bool)

(declare-fun e!817032 () Bool)

(declare-fun e!817036 () Bool)

(assert (=> b!1451010 (= e!817032 e!817036)))

(declare-fun res!982299 () Bool)

(assert (=> b!1451010 (=> (not res!982299) (not e!817036))))

(declare-fun lt!636525 () SeekEntryResult!11715)

(assert (=> b!1451010 (= res!982299 (= lt!636525 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47463 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451011 () Bool)

(declare-fun res!982308 () Bool)

(assert (=> b!1451011 (=> (not res!982308) (not e!817037))))

(declare-datatypes ((List!33964 0))(
  ( (Nil!33961) (Cons!33960 (h!35310 (_ BitVec 64)) (t!48658 List!33964)) )
))
(declare-fun arrayNoDuplicates!0 (array!98350 (_ BitVec 32) List!33964) Bool)

(assert (=> b!1451011 (= res!982308 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33961))))

(declare-fun b!1451012 () Bool)

(declare-fun lt!636523 () (_ BitVec 64))

(declare-fun e!817038 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!636520 () array!98350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1451012 (= e!817038 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636523 lt!636520 mask!2687) (seekEntryOrOpen!0 lt!636523 lt!636520 mask!2687)))))

(declare-fun b!1451013 () Bool)

(declare-fun res!982307 () Bool)

(declare-fun e!817039 () Bool)

(assert (=> b!1451013 (=> (not res!982307) (not e!817039))))

(assert (=> b!1451013 (= res!982307 e!817038)))

(declare-fun c!133869 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451013 (= c!133869 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451014 () Bool)

(declare-fun e!817035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451014 (= e!817035 (validKeyInArray!0 lt!636523))))

(declare-fun b!1451015 () Bool)

(assert (=> b!1451015 (= e!817034 e!817039)))

(declare-fun res!982305 () Bool)

(assert (=> b!1451015 (=> (not res!982305) (not e!817039))))

(declare-fun lt!636522 () SeekEntryResult!11715)

(assert (=> b!1451015 (= res!982305 (= lt!636522 (Intermediate!11715 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451015 (= lt!636522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636523 mask!2687) lt!636523 lt!636520 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451015 (= lt!636523 (select (store (arr!47463 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451016 () Bool)

(declare-fun res!982293 () Bool)

(assert (=> b!1451016 (=> (not res!982293) (not e!817037))))

(assert (=> b!1451016 (= res!982293 (and (= (size!48013 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48013 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48013 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451017 () Bool)

(assert (=> b!1451017 (= e!817030 e!817035)))

(declare-fun res!982309 () Bool)

(assert (=> b!1451017 (=> res!982309 e!817035)))

(assert (=> b!1451017 (= res!982309 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1451017 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636523 lt!636520 mask!2687) lt!636521)))

(declare-datatypes ((Unit!48926 0))(
  ( (Unit!48927) )
))
(declare-fun lt!636518 () Unit!48926)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48926)

(assert (=> b!1451017 (= lt!636518 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451018 () Bool)

(assert (=> b!1451018 (= e!817038 (= lt!636522 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636523 lt!636520 mask!2687)))))

(declare-fun b!1451019 () Bool)

(declare-fun res!982291 () Bool)

(assert (=> b!1451019 (=> (not res!982291) (not e!817037))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451019 (= res!982291 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48013 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48013 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48013 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451020 () Bool)

(declare-fun res!982294 () Bool)

(assert (=> b!1451020 (=> (not res!982294) (not e!817037))))

(assert (=> b!1451020 (= res!982294 (validKeyInArray!0 (select (arr!47463 a!2862) i!1006)))))

(declare-fun b!1451021 () Bool)

(declare-fun res!982306 () Bool)

(assert (=> b!1451021 (=> (not res!982306) (not e!817039))))

(assert (=> b!1451021 (= res!982306 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451022 () Bool)

(declare-fun e!817031 () Bool)

(assert (=> b!1451022 (= e!817031 e!817032)))

(declare-fun res!982302 () Bool)

(assert (=> b!1451022 (=> res!982302 e!817032)))

(assert (=> b!1451022 (= res!982302 (or (and (= (select (arr!47463 a!2862) index!646) (select (store (arr!47463 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47463 a!2862) index!646) (select (arr!47463 a!2862) j!93))) (not (= (select (arr!47463 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451023 () Bool)

(assert (=> b!1451023 (= e!817039 (not e!817030))))

(declare-fun res!982300 () Bool)

(assert (=> b!1451023 (=> res!982300 e!817030)))

(assert (=> b!1451023 (= res!982300 (or (and (= (select (arr!47463 a!2862) index!646) (select (store (arr!47463 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47463 a!2862) index!646) (select (arr!47463 a!2862) j!93))) (not (= (select (arr!47463 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47463 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1451023 e!817031))

(declare-fun res!982298 () Bool)

(assert (=> b!1451023 (=> (not res!982298) (not e!817031))))

(assert (=> b!1451023 (= res!982298 (and (= lt!636525 lt!636521) (or (= (select (arr!47463 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47463 a!2862) intermediateBeforeIndex!19) (select (arr!47463 a!2862) j!93)))))))

(assert (=> b!1451023 (= lt!636521 (Found!11715 j!93))))

(assert (=> b!1451023 (= lt!636525 (seekEntryOrOpen!0 (select (arr!47463 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98350 (_ BitVec 32)) Bool)

(assert (=> b!1451023 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636524 () Unit!48926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48926)

(assert (=> b!1451023 (= lt!636524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451024 () Bool)

(assert (=> b!1451024 (= e!817036 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451025 () Bool)

(declare-fun e!817040 () Bool)

(assert (=> b!1451025 (= e!817037 e!817040)))

(declare-fun res!982304 () Bool)

(assert (=> b!1451025 (=> (not res!982304) (not e!817040))))

(assert (=> b!1451025 (= res!982304 (= (select (store (arr!47463 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451025 (= lt!636520 (array!98351 (store (arr!47463 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48013 a!2862)))))

(declare-fun b!1451026 () Bool)

(declare-fun res!982296 () Bool)

(assert (=> b!1451026 (=> (not res!982296) (not e!817037))))

(assert (=> b!1451026 (= res!982296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451027 () Bool)

(declare-fun res!982297 () Bool)

(assert (=> b!1451027 (=> (not res!982297) (not e!817037))))

(assert (=> b!1451027 (= res!982297 (validKeyInArray!0 (select (arr!47463 a!2862) j!93)))))

(declare-fun b!1451028 () Bool)

(assert (=> b!1451028 (= e!817040 e!817034)))

(declare-fun res!982301 () Bool)

(assert (=> b!1451028 (=> (not res!982301) (not e!817034))))

(assert (=> b!1451028 (= res!982301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47463 a!2862) j!93) mask!2687) (select (arr!47463 a!2862) j!93) a!2862 mask!2687) lt!636519))))

(assert (=> b!1451028 (= lt!636519 (Intermediate!11715 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124902 res!982303) b!1451016))

(assert (= (and b!1451016 res!982293) b!1451020))

(assert (= (and b!1451020 res!982294) b!1451027))

(assert (= (and b!1451027 res!982297) b!1451026))

(assert (= (and b!1451026 res!982296) b!1451011))

(assert (= (and b!1451011 res!982308) b!1451019))

(assert (= (and b!1451019 res!982291) b!1451025))

(assert (= (and b!1451025 res!982304) b!1451028))

(assert (= (and b!1451028 res!982301) b!1451008))

(assert (= (and b!1451008 res!982295) b!1451015))

(assert (= (and b!1451015 res!982305) b!1451013))

(assert (= (and b!1451013 c!133869) b!1451018))

(assert (= (and b!1451013 (not c!133869)) b!1451012))

(assert (= (and b!1451013 res!982307) b!1451021))

(assert (= (and b!1451021 res!982306) b!1451023))

(assert (= (and b!1451023 res!982298) b!1451022))

(assert (= (and b!1451022 (not res!982302)) b!1451010))

(assert (= (and b!1451010 res!982299) b!1451024))

(assert (= (and b!1451023 (not res!982300)) b!1451009))

(assert (= (and b!1451009 (not res!982292)) b!1451017))

(assert (= (and b!1451017 (not res!982309)) b!1451014))

(declare-fun m!1339613 () Bool)

(assert (=> b!1451018 m!1339613))

(declare-fun m!1339615 () Bool)

(assert (=> b!1451012 m!1339615))

(declare-fun m!1339617 () Bool)

(assert (=> b!1451012 m!1339617))

(declare-fun m!1339619 () Bool)

(assert (=> b!1451008 m!1339619))

(assert (=> b!1451008 m!1339619))

(declare-fun m!1339621 () Bool)

(assert (=> b!1451008 m!1339621))

(declare-fun m!1339623 () Bool)

(assert (=> b!1451026 m!1339623))

(assert (=> b!1451010 m!1339619))

(assert (=> b!1451010 m!1339619))

(declare-fun m!1339625 () Bool)

(assert (=> b!1451010 m!1339625))

(assert (=> b!1451009 m!1339619))

(assert (=> b!1451009 m!1339619))

(declare-fun m!1339627 () Bool)

(assert (=> b!1451009 m!1339627))

(declare-fun m!1339629 () Bool)

(assert (=> b!1451011 m!1339629))

(declare-fun m!1339631 () Bool)

(assert (=> b!1451014 m!1339631))

(declare-fun m!1339633 () Bool)

(assert (=> b!1451023 m!1339633))

(declare-fun m!1339635 () Bool)

(assert (=> b!1451023 m!1339635))

(declare-fun m!1339637 () Bool)

(assert (=> b!1451023 m!1339637))

(declare-fun m!1339639 () Bool)

(assert (=> b!1451023 m!1339639))

(declare-fun m!1339641 () Bool)

(assert (=> b!1451023 m!1339641))

(assert (=> b!1451023 m!1339619))

(declare-fun m!1339643 () Bool)

(assert (=> b!1451023 m!1339643))

(declare-fun m!1339645 () Bool)

(assert (=> b!1451023 m!1339645))

(assert (=> b!1451023 m!1339619))

(assert (=> b!1451022 m!1339641))

(assert (=> b!1451022 m!1339635))

(assert (=> b!1451022 m!1339639))

(assert (=> b!1451022 m!1339619))

(declare-fun m!1339647 () Bool)

(assert (=> b!1451015 m!1339647))

(assert (=> b!1451015 m!1339647))

(declare-fun m!1339649 () Bool)

(assert (=> b!1451015 m!1339649))

(assert (=> b!1451015 m!1339635))

(declare-fun m!1339651 () Bool)

(assert (=> b!1451015 m!1339651))

(assert (=> b!1451017 m!1339615))

(declare-fun m!1339653 () Bool)

(assert (=> b!1451017 m!1339653))

(assert (=> b!1451025 m!1339635))

(declare-fun m!1339655 () Bool)

(assert (=> b!1451025 m!1339655))

(assert (=> b!1451028 m!1339619))

(assert (=> b!1451028 m!1339619))

(declare-fun m!1339657 () Bool)

(assert (=> b!1451028 m!1339657))

(assert (=> b!1451028 m!1339657))

(assert (=> b!1451028 m!1339619))

(declare-fun m!1339659 () Bool)

(assert (=> b!1451028 m!1339659))

(declare-fun m!1339661 () Bool)

(assert (=> b!1451020 m!1339661))

(assert (=> b!1451020 m!1339661))

(declare-fun m!1339663 () Bool)

(assert (=> b!1451020 m!1339663))

(declare-fun m!1339665 () Bool)

(assert (=> start!124902 m!1339665))

(declare-fun m!1339667 () Bool)

(assert (=> start!124902 m!1339667))

(assert (=> b!1451027 m!1339619))

(assert (=> b!1451027 m!1339619))

(declare-fun m!1339669 () Bool)

(assert (=> b!1451027 m!1339669))

(check-sat (not b!1451027) (not b!1451015) (not b!1451008) (not start!124902) (not b!1451018) (not b!1451010) (not b!1451023) (not b!1451012) (not b!1451009) (not b!1451017) (not b!1451011) (not b!1451014) (not b!1451020) (not b!1451026) (not b!1451028))
(check-sat)
