; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124918 () Bool)

(assert start!124918)

(declare-fun b!1452011 () Bool)

(declare-fun e!817425 () Bool)

(declare-fun e!817423 () Bool)

(assert (=> b!1452011 (= e!817425 e!817423)))

(declare-fun res!983282 () Bool)

(assert (=> b!1452011 (=> (not res!983282) (not e!817423))))

(declare-datatypes ((SeekEntryResult!11738 0))(
  ( (MissingZero!11738 (index!49344 (_ BitVec 32))) (Found!11738 (index!49345 (_ BitVec 32))) (Intermediate!11738 (undefined!12550 Bool) (index!49346 (_ BitVec 32)) (x!130990 (_ BitVec 32))) (Undefined!11738) (MissingVacant!11738 (index!49347 (_ BitVec 32))) )
))
(declare-fun lt!636642 () SeekEntryResult!11738)

(declare-datatypes ((array!98344 0))(
  ( (array!98345 (arr!47461 (Array (_ BitVec 32) (_ BitVec 64))) (size!48013 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98344)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452011 (= res!983282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47461 a!2862) j!93) mask!2687) (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!636642))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452011 (= lt!636642 (Intermediate!11738 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452012 () Bool)

(declare-fun res!983286 () Bool)

(declare-fun e!817422 () Bool)

(assert (=> b!1452012 (=> (not res!983286) (not e!817422))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452012 (= res!983286 (and (= (size!48013 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48013 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48013 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452013 () Bool)

(declare-fun res!983287 () Bool)

(assert (=> b!1452013 (=> (not res!983287) (not e!817422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452013 (= res!983287 (validKeyInArray!0 (select (arr!47461 a!2862) i!1006)))))

(declare-fun b!1452014 () Bool)

(assert (=> b!1452014 (= e!817422 e!817425)))

(declare-fun res!983283 () Bool)

(assert (=> b!1452014 (=> (not res!983283) (not e!817425))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452014 (= res!983283 (= (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636644 () array!98344)

(assert (=> b!1452014 (= lt!636644 (array!98345 (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48013 a!2862)))))

(declare-fun b!1452015 () Bool)

(declare-fun res!983281 () Bool)

(assert (=> b!1452015 (=> (not res!983281) (not e!817422))))

(declare-datatypes ((List!34040 0))(
  ( (Nil!34037) (Cons!34036 (h!35386 (_ BitVec 64)) (t!48726 List!34040)) )
))
(declare-fun arrayNoDuplicates!0 (array!98344 (_ BitVec 32) List!34040) Bool)

(assert (=> b!1452015 (= res!983281 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34037))))

(declare-fun b!1452016 () Bool)

(declare-fun res!983280 () Bool)

(assert (=> b!1452016 (=> (not res!983280) (not e!817422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98344 (_ BitVec 32)) Bool)

(assert (=> b!1452016 (= res!983280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817427 () Bool)

(declare-fun b!1452017 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1452017 (= e!817427 (not (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!817426 () Bool)

(assert (=> b!1452017 e!817426))

(declare-fun res!983274 () Bool)

(assert (=> b!1452017 (=> (not res!983274) (not e!817426))))

(assert (=> b!1452017 (= res!983274 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48813 0))(
  ( (Unit!48814) )
))
(declare-fun lt!636645 () Unit!48813)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48813)

(assert (=> b!1452017 (= lt!636645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452018 () Bool)

(declare-fun res!983278 () Bool)

(assert (=> b!1452018 (=> (not res!983278) (not e!817427))))

(declare-fun e!817424 () Bool)

(assert (=> b!1452018 (= res!983278 e!817424)))

(declare-fun c!133882 () Bool)

(assert (=> b!1452018 (= c!133882 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452019 () Bool)

(declare-fun res!983276 () Bool)

(assert (=> b!1452019 (=> (not res!983276) (not e!817426))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11738)

(assert (=> b!1452019 (= res!983276 (= (seekEntryOrOpen!0 (select (arr!47461 a!2862) j!93) a!2862 mask!2687) (Found!11738 j!93)))))

(declare-fun res!983285 () Bool)

(assert (=> start!124918 (=> (not res!983285) (not e!817422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124918 (= res!983285 (validMask!0 mask!2687))))

(assert (=> start!124918 e!817422))

(assert (=> start!124918 true))

(declare-fun array_inv!36694 (array!98344) Bool)

(assert (=> start!124918 (array_inv!36694 a!2862)))

(declare-fun lt!636641 () (_ BitVec 64))

(declare-fun b!1452020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98344 (_ BitVec 32)) SeekEntryResult!11738)

(assert (=> b!1452020 (= e!817424 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636641 lt!636644 mask!2687) (seekEntryOrOpen!0 lt!636641 lt!636644 mask!2687)))))

(declare-fun b!1452021 () Bool)

(assert (=> b!1452021 (= e!817423 e!817427)))

(declare-fun res!983273 () Bool)

(assert (=> b!1452021 (=> (not res!983273) (not e!817427))))

(declare-fun lt!636643 () SeekEntryResult!11738)

(assert (=> b!1452021 (= res!983273 (= lt!636643 (Intermediate!11738 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452021 (= lt!636643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636641 mask!2687) lt!636641 lt!636644 mask!2687))))

(assert (=> b!1452021 (= lt!636641 (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452022 () Bool)

(declare-fun res!983277 () Bool)

(assert (=> b!1452022 (=> (not res!983277) (not e!817422))))

(assert (=> b!1452022 (= res!983277 (validKeyInArray!0 (select (arr!47461 a!2862) j!93)))))

(declare-fun b!1452023 () Bool)

(assert (=> b!1452023 (= e!817424 (= lt!636643 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636641 lt!636644 mask!2687)))))

(declare-fun b!1452024 () Bool)

(declare-fun res!983284 () Bool)

(assert (=> b!1452024 (=> (not res!983284) (not e!817422))))

(assert (=> b!1452024 (= res!983284 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48013 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48013 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48013 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452025 () Bool)

(declare-fun res!983275 () Bool)

(assert (=> b!1452025 (=> (not res!983275) (not e!817423))))

(assert (=> b!1452025 (= res!983275 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!636642))))

(declare-fun b!1452026 () Bool)

(declare-fun res!983279 () Bool)

(assert (=> b!1452026 (=> (not res!983279) (not e!817427))))

(assert (=> b!1452026 (= res!983279 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452027 () Bool)

(assert (=> b!1452027 (= e!817426 (and (or (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) (select (arr!47461 a!2862) j!93))) (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124918 res!983285) b!1452012))

(assert (= (and b!1452012 res!983286) b!1452013))

(assert (= (and b!1452013 res!983287) b!1452022))

(assert (= (and b!1452022 res!983277) b!1452016))

(assert (= (and b!1452016 res!983280) b!1452015))

(assert (= (and b!1452015 res!983281) b!1452024))

(assert (= (and b!1452024 res!983284) b!1452014))

(assert (= (and b!1452014 res!983283) b!1452011))

(assert (= (and b!1452011 res!983282) b!1452025))

(assert (= (and b!1452025 res!983275) b!1452021))

(assert (= (and b!1452021 res!983273) b!1452018))

(assert (= (and b!1452018 c!133882) b!1452023))

(assert (= (and b!1452018 (not c!133882)) b!1452020))

(assert (= (and b!1452018 res!983278) b!1452026))

(assert (= (and b!1452026 res!983279) b!1452017))

(assert (= (and b!1452017 res!983274) b!1452019))

(assert (= (and b!1452019 res!983276) b!1452027))

(declare-fun m!1340109 () Bool)

(assert (=> b!1452017 m!1340109))

(declare-fun m!1340111 () Bool)

(assert (=> b!1452017 m!1340111))

(declare-fun m!1340113 () Bool)

(assert (=> b!1452017 m!1340113))

(declare-fun m!1340115 () Bool)

(assert (=> b!1452017 m!1340115))

(declare-fun m!1340117 () Bool)

(assert (=> b!1452017 m!1340117))

(declare-fun m!1340119 () Bool)

(assert (=> b!1452017 m!1340119))

(assert (=> b!1452025 m!1340119))

(assert (=> b!1452025 m!1340119))

(declare-fun m!1340121 () Bool)

(assert (=> b!1452025 m!1340121))

(assert (=> b!1452022 m!1340119))

(assert (=> b!1452022 m!1340119))

(declare-fun m!1340123 () Bool)

(assert (=> b!1452022 m!1340123))

(declare-fun m!1340125 () Bool)

(assert (=> b!1452020 m!1340125))

(declare-fun m!1340127 () Bool)

(assert (=> b!1452020 m!1340127))

(assert (=> b!1452027 m!1340111))

(declare-fun m!1340129 () Bool)

(assert (=> b!1452027 m!1340129))

(assert (=> b!1452027 m!1340113))

(assert (=> b!1452027 m!1340115))

(assert (=> b!1452027 m!1340119))

(assert (=> b!1452011 m!1340119))

(assert (=> b!1452011 m!1340119))

(declare-fun m!1340131 () Bool)

(assert (=> b!1452011 m!1340131))

(assert (=> b!1452011 m!1340131))

(assert (=> b!1452011 m!1340119))

(declare-fun m!1340133 () Bool)

(assert (=> b!1452011 m!1340133))

(assert (=> b!1452019 m!1340119))

(assert (=> b!1452019 m!1340119))

(declare-fun m!1340135 () Bool)

(assert (=> b!1452019 m!1340135))

(declare-fun m!1340137 () Bool)

(assert (=> b!1452013 m!1340137))

(assert (=> b!1452013 m!1340137))

(declare-fun m!1340139 () Bool)

(assert (=> b!1452013 m!1340139))

(assert (=> b!1452014 m!1340111))

(declare-fun m!1340141 () Bool)

(assert (=> b!1452014 m!1340141))

(declare-fun m!1340143 () Bool)

(assert (=> b!1452023 m!1340143))

(declare-fun m!1340145 () Bool)

(assert (=> b!1452016 m!1340145))

(declare-fun m!1340147 () Bool)

(assert (=> b!1452021 m!1340147))

(assert (=> b!1452021 m!1340147))

(declare-fun m!1340149 () Bool)

(assert (=> b!1452021 m!1340149))

(assert (=> b!1452021 m!1340111))

(declare-fun m!1340151 () Bool)

(assert (=> b!1452021 m!1340151))

(declare-fun m!1340153 () Bool)

(assert (=> b!1452015 m!1340153))

(declare-fun m!1340155 () Bool)

(assert (=> start!124918 m!1340155))

(declare-fun m!1340157 () Bool)

(assert (=> start!124918 m!1340157))

(check-sat (not b!1452021) (not b!1452025) (not b!1452022) (not b!1452019) (not b!1452016) (not b!1452020) (not b!1452017) (not b!1452011) (not b!1452015) (not b!1452023) (not b!1452013) (not start!124918))
(check-sat)
