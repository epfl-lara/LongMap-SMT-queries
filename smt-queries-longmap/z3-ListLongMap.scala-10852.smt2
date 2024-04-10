; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127092 () Bool)

(assert start!127092)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!836651 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1493494 () Bool)

(declare-datatypes ((array!99739 0))(
  ( (array!99740 (arr!48138 (Array (_ BitVec 32) (_ BitVec 64))) (size!48688 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99739)

(assert (=> b!1493494 (= e!836651 (or (= (select (arr!48138 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48138 a!2862) intermediateBeforeIndex!19) (select (arr!48138 a!2862) j!93))))))

(declare-fun b!1493495 () Bool)

(declare-fun res!1015975 () Bool)

(declare-fun e!836656 () Bool)

(assert (=> b!1493495 (=> (not res!1015975) (not e!836656))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493495 (= res!1015975 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48688 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48688 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48688 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493496 () Bool)

(declare-fun res!1015977 () Bool)

(assert (=> b!1493496 (=> (not res!1015977) (not e!836656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493496 (= res!1015977 (validKeyInArray!0 (select (arr!48138 a!2862) j!93)))))

(declare-fun e!836652 () Bool)

(declare-fun b!1493498 () Bool)

(declare-fun lt!651043 () array!99739)

(declare-fun lt!651048 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12378 0))(
  ( (MissingZero!12378 (index!51904 (_ BitVec 32))) (Found!12378 (index!51905 (_ BitVec 32))) (Intermediate!12378 (undefined!13190 Bool) (index!51906 (_ BitVec 32)) (x!133506 (_ BitVec 32))) (Undefined!12378) (MissingVacant!12378 (index!51907 (_ BitVec 32))) )
))
(declare-fun lt!651044 () SeekEntryResult!12378)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12378)

(assert (=> b!1493498 (= e!836652 (= lt!651044 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651048 lt!651043 mask!2687)))))

(declare-fun b!1493499 () Bool)

(declare-fun res!1015972 () Bool)

(declare-fun e!836650 () Bool)

(assert (=> b!1493499 (=> (not res!1015972) (not e!836650))))

(assert (=> b!1493499 (= res!1015972 e!836652)))

(declare-fun c!138291 () Bool)

(assert (=> b!1493499 (= c!138291 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493500 () Bool)

(declare-fun res!1015980 () Bool)

(assert (=> b!1493500 (=> (not res!1015980) (not e!836650))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493500 (= res!1015980 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493501 () Bool)

(declare-fun res!1015984 () Bool)

(assert (=> b!1493501 (=> (not res!1015984) (not e!836656))))

(assert (=> b!1493501 (= res!1015984 (validKeyInArray!0 (select (arr!48138 a!2862) i!1006)))))

(declare-fun b!1493502 () Bool)

(declare-fun e!836654 () Bool)

(declare-fun e!836653 () Bool)

(assert (=> b!1493502 (= e!836654 e!836653)))

(declare-fun res!1015981 () Bool)

(assert (=> b!1493502 (=> (not res!1015981) (not e!836653))))

(declare-fun lt!651045 () SeekEntryResult!12378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493502 (= res!1015981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48138 a!2862) j!93) mask!2687) (select (arr!48138 a!2862) j!93) a!2862 mask!2687) lt!651045))))

(assert (=> b!1493502 (= lt!651045 (Intermediate!12378 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493503 () Bool)

(declare-fun res!1015986 () Bool)

(assert (=> b!1493503 (=> (not res!1015986) (not e!836653))))

(assert (=> b!1493503 (= res!1015986 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48138 a!2862) j!93) a!2862 mask!2687) lt!651045))))

(declare-fun b!1493504 () Bool)

(assert (=> b!1493504 (= e!836656 e!836654)))

(declare-fun res!1015974 () Bool)

(assert (=> b!1493504 (=> (not res!1015974) (not e!836654))))

(assert (=> b!1493504 (= res!1015974 (= (select (store (arr!48138 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493504 (= lt!651043 (array!99740 (store (arr!48138 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48688 a!2862)))))

(declare-fun b!1493505 () Bool)

(declare-fun res!1015978 () Bool)

(assert (=> b!1493505 (=> (not res!1015978) (not e!836656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99739 (_ BitVec 32)) Bool)

(assert (=> b!1493505 (= res!1015978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493506 () Bool)

(declare-fun e!836655 () Bool)

(assert (=> b!1493506 (= e!836655 true)))

(declare-fun lt!651046 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493506 (= lt!651046 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493497 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12378)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99739 (_ BitVec 32)) SeekEntryResult!12378)

(assert (=> b!1493497 (= e!836652 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651048 lt!651043 mask!2687) (seekEntryOrOpen!0 lt!651048 lt!651043 mask!2687)))))

(declare-fun res!1015983 () Bool)

(assert (=> start!127092 (=> (not res!1015983) (not e!836656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127092 (= res!1015983 (validMask!0 mask!2687))))

(assert (=> start!127092 e!836656))

(assert (=> start!127092 true))

(declare-fun array_inv!37166 (array!99739) Bool)

(assert (=> start!127092 (array_inv!37166 a!2862)))

(declare-fun b!1493507 () Bool)

(assert (=> b!1493507 (= e!836650 (not e!836655))))

(declare-fun res!1015979 () Bool)

(assert (=> b!1493507 (=> res!1015979 e!836655)))

(assert (=> b!1493507 (= res!1015979 (or (and (= (select (arr!48138 a!2862) index!646) (select (store (arr!48138 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48138 a!2862) index!646) (select (arr!48138 a!2862) j!93))) (= (select (arr!48138 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493507 e!836651))

(declare-fun res!1015976 () Bool)

(assert (=> b!1493507 (=> (not res!1015976) (not e!836651))))

(assert (=> b!1493507 (= res!1015976 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50096 0))(
  ( (Unit!50097) )
))
(declare-fun lt!651047 () Unit!50096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50096)

(assert (=> b!1493507 (= lt!651047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493508 () Bool)

(assert (=> b!1493508 (= e!836653 e!836650)))

(declare-fun res!1015973 () Bool)

(assert (=> b!1493508 (=> (not res!1015973) (not e!836650))))

(assert (=> b!1493508 (= res!1015973 (= lt!651044 (Intermediate!12378 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493508 (= lt!651044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651048 mask!2687) lt!651048 lt!651043 mask!2687))))

(assert (=> b!1493508 (= lt!651048 (select (store (arr!48138 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493509 () Bool)

(declare-fun res!1015987 () Bool)

(assert (=> b!1493509 (=> (not res!1015987) (not e!836656))))

(assert (=> b!1493509 (= res!1015987 (and (= (size!48688 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48688 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48688 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493510 () Bool)

(declare-fun res!1015985 () Bool)

(assert (=> b!1493510 (=> (not res!1015985) (not e!836651))))

(assert (=> b!1493510 (= res!1015985 (= (seekEntryOrOpen!0 (select (arr!48138 a!2862) j!93) a!2862 mask!2687) (Found!12378 j!93)))))

(declare-fun b!1493511 () Bool)

(declare-fun res!1015982 () Bool)

(assert (=> b!1493511 (=> (not res!1015982) (not e!836656))))

(declare-datatypes ((List!34639 0))(
  ( (Nil!34636) (Cons!34635 (h!36024 (_ BitVec 64)) (t!49333 List!34639)) )
))
(declare-fun arrayNoDuplicates!0 (array!99739 (_ BitVec 32) List!34639) Bool)

(assert (=> b!1493511 (= res!1015982 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34636))))

(assert (= (and start!127092 res!1015983) b!1493509))

(assert (= (and b!1493509 res!1015987) b!1493501))

(assert (= (and b!1493501 res!1015984) b!1493496))

(assert (= (and b!1493496 res!1015977) b!1493505))

(assert (= (and b!1493505 res!1015978) b!1493511))

(assert (= (and b!1493511 res!1015982) b!1493495))

(assert (= (and b!1493495 res!1015975) b!1493504))

(assert (= (and b!1493504 res!1015974) b!1493502))

(assert (= (and b!1493502 res!1015981) b!1493503))

(assert (= (and b!1493503 res!1015986) b!1493508))

(assert (= (and b!1493508 res!1015973) b!1493499))

(assert (= (and b!1493499 c!138291) b!1493498))

(assert (= (and b!1493499 (not c!138291)) b!1493497))

(assert (= (and b!1493499 res!1015972) b!1493500))

(assert (= (and b!1493500 res!1015980) b!1493507))

(assert (= (and b!1493507 res!1015976) b!1493510))

(assert (= (and b!1493510 res!1015985) b!1493494))

(assert (= (and b!1493507 (not res!1015979)) b!1493506))

(declare-fun m!1377275 () Bool)

(assert (=> b!1493498 m!1377275))

(declare-fun m!1377277 () Bool)

(assert (=> b!1493503 m!1377277))

(assert (=> b!1493503 m!1377277))

(declare-fun m!1377279 () Bool)

(assert (=> b!1493503 m!1377279))

(declare-fun m!1377281 () Bool)

(assert (=> b!1493501 m!1377281))

(assert (=> b!1493501 m!1377281))

(declare-fun m!1377283 () Bool)

(assert (=> b!1493501 m!1377283))

(assert (=> b!1493496 m!1377277))

(assert (=> b!1493496 m!1377277))

(declare-fun m!1377285 () Bool)

(assert (=> b!1493496 m!1377285))

(declare-fun m!1377287 () Bool)

(assert (=> b!1493508 m!1377287))

(assert (=> b!1493508 m!1377287))

(declare-fun m!1377289 () Bool)

(assert (=> b!1493508 m!1377289))

(declare-fun m!1377291 () Bool)

(assert (=> b!1493508 m!1377291))

(declare-fun m!1377293 () Bool)

(assert (=> b!1493508 m!1377293))

(assert (=> b!1493510 m!1377277))

(assert (=> b!1493510 m!1377277))

(declare-fun m!1377295 () Bool)

(assert (=> b!1493510 m!1377295))

(assert (=> b!1493502 m!1377277))

(assert (=> b!1493502 m!1377277))

(declare-fun m!1377297 () Bool)

(assert (=> b!1493502 m!1377297))

(assert (=> b!1493502 m!1377297))

(assert (=> b!1493502 m!1377277))

(declare-fun m!1377299 () Bool)

(assert (=> b!1493502 m!1377299))

(declare-fun m!1377301 () Bool)

(assert (=> b!1493511 m!1377301))

(declare-fun m!1377303 () Bool)

(assert (=> b!1493506 m!1377303))

(assert (=> b!1493504 m!1377291))

(declare-fun m!1377305 () Bool)

(assert (=> b!1493504 m!1377305))

(declare-fun m!1377307 () Bool)

(assert (=> b!1493505 m!1377307))

(declare-fun m!1377309 () Bool)

(assert (=> b!1493507 m!1377309))

(assert (=> b!1493507 m!1377291))

(declare-fun m!1377311 () Bool)

(assert (=> b!1493507 m!1377311))

(declare-fun m!1377313 () Bool)

(assert (=> b!1493507 m!1377313))

(declare-fun m!1377315 () Bool)

(assert (=> b!1493507 m!1377315))

(assert (=> b!1493507 m!1377277))

(declare-fun m!1377317 () Bool)

(assert (=> b!1493497 m!1377317))

(declare-fun m!1377319 () Bool)

(assert (=> b!1493497 m!1377319))

(declare-fun m!1377321 () Bool)

(assert (=> b!1493494 m!1377321))

(assert (=> b!1493494 m!1377277))

(declare-fun m!1377323 () Bool)

(assert (=> start!127092 m!1377323))

(declare-fun m!1377325 () Bool)

(assert (=> start!127092 m!1377325))

(check-sat (not b!1493510) (not b!1493501) (not b!1493507) (not b!1493497) (not b!1493502) (not start!127092) (not b!1493498) (not b!1493496) (not b!1493503) (not b!1493505) (not b!1493511) (not b!1493506) (not b!1493508))
(check-sat)
