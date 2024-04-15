; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126860 () Bool)

(assert start!126860)

(declare-fun b!1491013 () Bool)

(declare-fun e!835375 () Bool)

(declare-fun e!835372 () Bool)

(assert (=> b!1491013 (= e!835375 e!835372)))

(declare-fun res!1014414 () Bool)

(assert (=> b!1491013 (=> (not res!1014414) (not e!835372))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99631 0))(
  ( (array!99632 (arr!48088 (Array (_ BitVec 32) (_ BitVec 64))) (size!48640 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99631)

(assert (=> b!1491013 (= res!1014414 (= (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!649956 () array!99631)

(assert (=> b!1491013 (= lt!649956 (array!99632 (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48640 a!2862)))))

(declare-fun b!1491014 () Bool)

(declare-fun res!1014412 () Bool)

(declare-fun e!835379 () Bool)

(assert (=> b!1491014 (=> (not res!1014412) (not e!835379))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491014 (= res!1014412 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491015 () Bool)

(declare-fun e!835374 () Bool)

(declare-datatypes ((SeekEntryResult!12353 0))(
  ( (MissingZero!12353 (index!51804 (_ BitVec 32))) (Found!12353 (index!51805 (_ BitVec 32))) (Intermediate!12353 (undefined!13165 Bool) (index!51806 (_ BitVec 32)) (x!133386 (_ BitVec 32))) (Undefined!12353) (MissingVacant!12353 (index!51807 (_ BitVec 32))) )
))
(declare-fun lt!649953 () SeekEntryResult!12353)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649958 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12353)

(assert (=> b!1491015 (= e!835374 (= lt!649953 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649958 lt!649956 mask!2687)))))

(declare-fun b!1491016 () Bool)

(declare-fun e!835377 () Bool)

(assert (=> b!1491016 (= e!835379 (not e!835377))))

(declare-fun res!1014422 () Bool)

(assert (=> b!1491016 (=> res!1014422 e!835377)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491016 (= res!1014422 (or (and (= (select (arr!48088 a!2862) index!646) (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48088 a!2862) index!646) (select (arr!48088 a!2862) j!93))) (= (select (arr!48088 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835378 () Bool)

(assert (=> b!1491016 e!835378))

(declare-fun res!1014424 () Bool)

(assert (=> b!1491016 (=> (not res!1014424) (not e!835378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99631 (_ BitVec 32)) Bool)

(assert (=> b!1491016 (= res!1014424 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49887 0))(
  ( (Unit!49888) )
))
(declare-fun lt!649955 () Unit!49887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49887)

(assert (=> b!1491016 (= lt!649955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491017 () Bool)

(declare-fun res!1014420 () Bool)

(assert (=> b!1491017 (=> (not res!1014420) (not e!835379))))

(assert (=> b!1491017 (= res!1014420 e!835374)))

(declare-fun c!137830 () Bool)

(assert (=> b!1491017 (= c!137830 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491019 () Bool)

(declare-fun res!1014425 () Bool)

(assert (=> b!1491019 (=> (not res!1014425) (not e!835375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491019 (= res!1014425 (validKeyInArray!0 (select (arr!48088 a!2862) j!93)))))

(declare-fun b!1491020 () Bool)

(declare-fun res!1014419 () Bool)

(assert (=> b!1491020 (=> (not res!1014419) (not e!835375))))

(assert (=> b!1491020 (= res!1014419 (validKeyInArray!0 (select (arr!48088 a!2862) i!1006)))))

(declare-fun b!1491021 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491021 (= e!835378 (or (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) (select (arr!48088 a!2862) j!93))))))

(declare-fun b!1491022 () Bool)

(declare-fun res!1014423 () Bool)

(assert (=> b!1491022 (=> (not res!1014423) (not e!835375))))

(assert (=> b!1491022 (= res!1014423 (and (= (size!48640 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48640 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48640 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491023 () Bool)

(assert (=> b!1491023 (= e!835377 true)))

(declare-fun lt!649954 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491023 (= lt!649954 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491024 () Bool)

(declare-fun res!1014418 () Bool)

(assert (=> b!1491024 (=> (not res!1014418) (not e!835375))))

(assert (=> b!1491024 (= res!1014418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491025 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12353)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12353)

(assert (=> b!1491025 (= e!835374 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649958 lt!649956 mask!2687) (seekEntryOrOpen!0 lt!649958 lt!649956 mask!2687)))))

(declare-fun b!1491026 () Bool)

(declare-fun res!1014427 () Bool)

(assert (=> b!1491026 (=> (not res!1014427) (not e!835378))))

(assert (=> b!1491026 (= res!1014427 (= (seekEntryOrOpen!0 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) (Found!12353 j!93)))))

(declare-fun res!1014415 () Bool)

(assert (=> start!126860 (=> (not res!1014415) (not e!835375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126860 (= res!1014415 (validMask!0 mask!2687))))

(assert (=> start!126860 e!835375))

(assert (=> start!126860 true))

(declare-fun array_inv!37321 (array!99631) Bool)

(assert (=> start!126860 (array_inv!37321 a!2862)))

(declare-fun b!1491018 () Bool)

(declare-fun res!1014417 () Bool)

(declare-fun e!835376 () Bool)

(assert (=> b!1491018 (=> (not res!1014417) (not e!835376))))

(declare-fun lt!649957 () SeekEntryResult!12353)

(assert (=> b!1491018 (= res!1014417 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!649957))))

(declare-fun b!1491027 () Bool)

(assert (=> b!1491027 (= e!835376 e!835379)))

(declare-fun res!1014416 () Bool)

(assert (=> b!1491027 (=> (not res!1014416) (not e!835379))))

(assert (=> b!1491027 (= res!1014416 (= lt!649953 (Intermediate!12353 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491027 (= lt!649953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649958 mask!2687) lt!649958 lt!649956 mask!2687))))

(assert (=> b!1491027 (= lt!649958 (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491028 () Bool)

(declare-fun res!1014413 () Bool)

(assert (=> b!1491028 (=> (not res!1014413) (not e!835375))))

(assert (=> b!1491028 (= res!1014413 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48640 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48640 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48640 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491029 () Bool)

(assert (=> b!1491029 (= e!835372 e!835376)))

(declare-fun res!1014426 () Bool)

(assert (=> b!1491029 (=> (not res!1014426) (not e!835376))))

(assert (=> b!1491029 (= res!1014426 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48088 a!2862) j!93) mask!2687) (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!649957))))

(assert (=> b!1491029 (= lt!649957 (Intermediate!12353 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491030 () Bool)

(declare-fun res!1014421 () Bool)

(assert (=> b!1491030 (=> (not res!1014421) (not e!835375))))

(declare-datatypes ((List!34667 0))(
  ( (Nil!34664) (Cons!34663 (h!36046 (_ BitVec 64)) (t!49353 List!34667)) )
))
(declare-fun arrayNoDuplicates!0 (array!99631 (_ BitVec 32) List!34667) Bool)

(assert (=> b!1491030 (= res!1014421 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34664))))

(assert (= (and start!126860 res!1014415) b!1491022))

(assert (= (and b!1491022 res!1014423) b!1491020))

(assert (= (and b!1491020 res!1014419) b!1491019))

(assert (= (and b!1491019 res!1014425) b!1491024))

(assert (= (and b!1491024 res!1014418) b!1491030))

(assert (= (and b!1491030 res!1014421) b!1491028))

(assert (= (and b!1491028 res!1014413) b!1491013))

(assert (= (and b!1491013 res!1014414) b!1491029))

(assert (= (and b!1491029 res!1014426) b!1491018))

(assert (= (and b!1491018 res!1014417) b!1491027))

(assert (= (and b!1491027 res!1014416) b!1491017))

(assert (= (and b!1491017 c!137830) b!1491015))

(assert (= (and b!1491017 (not c!137830)) b!1491025))

(assert (= (and b!1491017 res!1014420) b!1491014))

(assert (= (and b!1491014 res!1014412) b!1491016))

(assert (= (and b!1491016 res!1014424) b!1491026))

(assert (= (and b!1491026 res!1014427) b!1491021))

(assert (= (and b!1491016 (not res!1014422)) b!1491023))

(declare-fun m!1374603 () Bool)

(assert (=> b!1491027 m!1374603))

(assert (=> b!1491027 m!1374603))

(declare-fun m!1374605 () Bool)

(assert (=> b!1491027 m!1374605))

(declare-fun m!1374607 () Bool)

(assert (=> b!1491027 m!1374607))

(declare-fun m!1374609 () Bool)

(assert (=> b!1491027 m!1374609))

(declare-fun m!1374611 () Bool)

(assert (=> b!1491024 m!1374611))

(declare-fun m!1374613 () Bool)

(assert (=> start!126860 m!1374613))

(declare-fun m!1374615 () Bool)

(assert (=> start!126860 m!1374615))

(declare-fun m!1374617 () Bool)

(assert (=> b!1491023 m!1374617))

(declare-fun m!1374619 () Bool)

(assert (=> b!1491029 m!1374619))

(assert (=> b!1491029 m!1374619))

(declare-fun m!1374621 () Bool)

(assert (=> b!1491029 m!1374621))

(assert (=> b!1491029 m!1374621))

(assert (=> b!1491029 m!1374619))

(declare-fun m!1374623 () Bool)

(assert (=> b!1491029 m!1374623))

(declare-fun m!1374625 () Bool)

(assert (=> b!1491016 m!1374625))

(assert (=> b!1491016 m!1374607))

(declare-fun m!1374627 () Bool)

(assert (=> b!1491016 m!1374627))

(declare-fun m!1374629 () Bool)

(assert (=> b!1491016 m!1374629))

(declare-fun m!1374631 () Bool)

(assert (=> b!1491016 m!1374631))

(assert (=> b!1491016 m!1374619))

(assert (=> b!1491018 m!1374619))

(assert (=> b!1491018 m!1374619))

(declare-fun m!1374633 () Bool)

(assert (=> b!1491018 m!1374633))

(assert (=> b!1491013 m!1374607))

(declare-fun m!1374635 () Bool)

(assert (=> b!1491013 m!1374635))

(declare-fun m!1374637 () Bool)

(assert (=> b!1491020 m!1374637))

(assert (=> b!1491020 m!1374637))

(declare-fun m!1374639 () Bool)

(assert (=> b!1491020 m!1374639))

(declare-fun m!1374641 () Bool)

(assert (=> b!1491030 m!1374641))

(assert (=> b!1491019 m!1374619))

(assert (=> b!1491019 m!1374619))

(declare-fun m!1374643 () Bool)

(assert (=> b!1491019 m!1374643))

(declare-fun m!1374645 () Bool)

(assert (=> b!1491015 m!1374645))

(declare-fun m!1374647 () Bool)

(assert (=> b!1491025 m!1374647))

(declare-fun m!1374649 () Bool)

(assert (=> b!1491025 m!1374649))

(declare-fun m!1374651 () Bool)

(assert (=> b!1491021 m!1374651))

(assert (=> b!1491021 m!1374619))

(assert (=> b!1491026 m!1374619))

(assert (=> b!1491026 m!1374619))

(declare-fun m!1374653 () Bool)

(assert (=> b!1491026 m!1374653))

(check-sat (not b!1491018) (not b!1491015) (not b!1491026) (not start!126860) (not b!1491019) (not b!1491025) (not b!1491023) (not b!1491029) (not b!1491020) (not b!1491016) (not b!1491027) (not b!1491024) (not b!1491030))
(check-sat)
