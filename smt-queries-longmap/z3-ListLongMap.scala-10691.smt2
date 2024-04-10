; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125286 () Bool)

(assert start!125286)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11907 0))(
  ( (MissingZero!11907 (index!50020 (_ BitVec 32))) (Found!11907 (index!50021 (_ BitVec 32))) (Intermediate!11907 (undefined!12719 Bool) (index!50022 (_ BitVec 32)) (x!131612 (_ BitVec 32))) (Undefined!11907) (MissingVacant!11907 (index!50023 (_ BitVec 32))) )
))
(declare-fun lt!640604 () SeekEntryResult!11907)

(declare-datatypes ((array!98734 0))(
  ( (array!98735 (arr!47655 (Array (_ BitVec 32) (_ BitVec 64))) (size!48205 (_ BitVec 32))) )
))
(declare-fun lt!640603 () array!98734)

(declare-fun e!822289 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640599 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1462911 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11907)

(assert (=> b!1462911 (= e!822289 (= lt!640604 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640599 lt!640603 mask!2687)))))

(declare-fun b!1462912 () Bool)

(declare-fun res!992271 () Bool)

(declare-fun e!822285 () Bool)

(assert (=> b!1462912 (=> res!992271 e!822285)))

(declare-fun lt!640600 () SeekEntryResult!11907)

(declare-fun lt!640601 () (_ BitVec 32))

(declare-fun a!2862 () array!98734)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462912 (= res!992271 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640601 (select (arr!47655 a!2862) j!93) a!2862 mask!2687) lt!640600)))))

(declare-fun b!1462913 () Bool)

(declare-fun e!822288 () Bool)

(assert (=> b!1462913 (= e!822288 (not (= lt!640604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640601 lt!640599 lt!640603 mask!2687))))))

(declare-fun res!992262 () Bool)

(declare-fun e!822290 () Bool)

(assert (=> start!125286 (=> (not res!992262) (not e!822290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125286 (= res!992262 (validMask!0 mask!2687))))

(assert (=> start!125286 e!822290))

(assert (=> start!125286 true))

(declare-fun array_inv!36683 (array!98734) Bool)

(assert (=> start!125286 (array_inv!36683 a!2862)))

(declare-fun b!1462914 () Bool)

(declare-fun res!992268 () Bool)

(declare-fun e!822281 () Bool)

(assert (=> b!1462914 (=> (not res!992268) (not e!822281))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11907)

(assert (=> b!1462914 (= res!992268 (= (seekEntryOrOpen!0 (select (arr!47655 a!2862) j!93) a!2862 mask!2687) (Found!11907 j!93)))))

(declare-fun b!1462915 () Bool)

(declare-fun res!992275 () Bool)

(assert (=> b!1462915 (=> (not res!992275) (not e!822290))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462915 (= res!992275 (validKeyInArray!0 (select (arr!47655 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1462916 () Bool)

(assert (=> b!1462916 (= e!822281 (or (= (select (arr!47655 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47655 a!2862) intermediateBeforeIndex!19) (select (arr!47655 a!2862) j!93))))))

(declare-fun b!1462917 () Bool)

(declare-fun e!822283 () Bool)

(declare-fun e!822287 () Bool)

(assert (=> b!1462917 (= e!822283 e!822287)))

(declare-fun res!992261 () Bool)

(assert (=> b!1462917 (=> (not res!992261) (not e!822287))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462917 (= res!992261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47655 a!2862) j!93) mask!2687) (select (arr!47655 a!2862) j!93) a!2862 mask!2687) lt!640600))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462917 (= lt!640600 (Intermediate!11907 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462918 () Bool)

(declare-fun res!992263 () Bool)

(assert (=> b!1462918 (=> (not res!992263) (not e!822287))))

(assert (=> b!1462918 (= res!992263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47655 a!2862) j!93) a!2862 mask!2687) lt!640600))))

(declare-fun b!1462919 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11907)

(assert (=> b!1462919 (= e!822289 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640599 lt!640603 mask!2687) (seekEntryOrOpen!0 lt!640599 lt!640603 mask!2687)))))

(declare-fun b!1462920 () Bool)

(declare-fun res!992258 () Bool)

(assert (=> b!1462920 (=> (not res!992258) (not e!822290))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462920 (= res!992258 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48205 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48205 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48205 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462921 () Bool)

(declare-fun e!822284 () Bool)

(declare-fun e!822282 () Bool)

(assert (=> b!1462921 (= e!822284 (not e!822282))))

(declare-fun res!992269 () Bool)

(assert (=> b!1462921 (=> res!992269 e!822282)))

(assert (=> b!1462921 (= res!992269 (or (and (= (select (arr!47655 a!2862) index!646) (select (store (arr!47655 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47655 a!2862) index!646) (select (arr!47655 a!2862) j!93))) (= (select (arr!47655 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462921 e!822281))

(declare-fun res!992266 () Bool)

(assert (=> b!1462921 (=> (not res!992266) (not e!822281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98734 (_ BitVec 32)) Bool)

(assert (=> b!1462921 (= res!992266 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49310 0))(
  ( (Unit!49311) )
))
(declare-fun lt!640602 () Unit!49310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49310)

(assert (=> b!1462921 (= lt!640602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462922 () Bool)

(declare-fun res!992270 () Bool)

(assert (=> b!1462922 (=> (not res!992270) (not e!822290))))

(assert (=> b!1462922 (= res!992270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462923 () Bool)

(declare-fun res!992272 () Bool)

(assert (=> b!1462923 (=> (not res!992272) (not e!822290))))

(assert (=> b!1462923 (= res!992272 (and (= (size!48205 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48205 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48205 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462924 () Bool)

(assert (=> b!1462924 (= e!822282 e!822285)))

(declare-fun res!992267 () Bool)

(assert (=> b!1462924 (=> res!992267 e!822285)))

(assert (=> b!1462924 (= res!992267 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640601 #b00000000000000000000000000000000) (bvsge lt!640601 (size!48205 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462924 (= lt!640601 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462925 () Bool)

(declare-fun res!992274 () Bool)

(assert (=> b!1462925 (=> (not res!992274) (not e!822284))))

(assert (=> b!1462925 (= res!992274 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462926 () Bool)

(assert (=> b!1462926 (= e!822285 true)))

(declare-fun lt!640605 () Bool)

(assert (=> b!1462926 (= lt!640605 e!822288)))

(declare-fun c!134837 () Bool)

(assert (=> b!1462926 (= c!134837 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462927 () Bool)

(assert (=> b!1462927 (= e!822287 e!822284)))

(declare-fun res!992273 () Bool)

(assert (=> b!1462927 (=> (not res!992273) (not e!822284))))

(assert (=> b!1462927 (= res!992273 (= lt!640604 (Intermediate!11907 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462927 (= lt!640604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640599 mask!2687) lt!640599 lt!640603 mask!2687))))

(assert (=> b!1462927 (= lt!640599 (select (store (arr!47655 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462928 () Bool)

(assert (=> b!1462928 (= e!822290 e!822283)))

(declare-fun res!992265 () Bool)

(assert (=> b!1462928 (=> (not res!992265) (not e!822283))))

(assert (=> b!1462928 (= res!992265 (= (select (store (arr!47655 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462928 (= lt!640603 (array!98735 (store (arr!47655 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48205 a!2862)))))

(declare-fun b!1462929 () Bool)

(declare-fun res!992260 () Bool)

(assert (=> b!1462929 (=> (not res!992260) (not e!822290))))

(declare-datatypes ((List!34156 0))(
  ( (Nil!34153) (Cons!34152 (h!35502 (_ BitVec 64)) (t!48850 List!34156)) )
))
(declare-fun arrayNoDuplicates!0 (array!98734 (_ BitVec 32) List!34156) Bool)

(assert (=> b!1462929 (= res!992260 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34153))))

(declare-fun b!1462930 () Bool)

(assert (=> b!1462930 (= e!822288 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640601 intermediateAfterIndex!19 lt!640599 lt!640603 mask!2687) (seekEntryOrOpen!0 lt!640599 lt!640603 mask!2687))))))

(declare-fun b!1462931 () Bool)

(declare-fun res!992259 () Bool)

(assert (=> b!1462931 (=> (not res!992259) (not e!822290))))

(assert (=> b!1462931 (= res!992259 (validKeyInArray!0 (select (arr!47655 a!2862) j!93)))))

(declare-fun b!1462932 () Bool)

(declare-fun res!992264 () Bool)

(assert (=> b!1462932 (=> (not res!992264) (not e!822284))))

(assert (=> b!1462932 (= res!992264 e!822289)))

(declare-fun c!134838 () Bool)

(assert (=> b!1462932 (= c!134838 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125286 res!992262) b!1462923))

(assert (= (and b!1462923 res!992272) b!1462915))

(assert (= (and b!1462915 res!992275) b!1462931))

(assert (= (and b!1462931 res!992259) b!1462922))

(assert (= (and b!1462922 res!992270) b!1462929))

(assert (= (and b!1462929 res!992260) b!1462920))

(assert (= (and b!1462920 res!992258) b!1462928))

(assert (= (and b!1462928 res!992265) b!1462917))

(assert (= (and b!1462917 res!992261) b!1462918))

(assert (= (and b!1462918 res!992263) b!1462927))

(assert (= (and b!1462927 res!992273) b!1462932))

(assert (= (and b!1462932 c!134838) b!1462911))

(assert (= (and b!1462932 (not c!134838)) b!1462919))

(assert (= (and b!1462932 res!992264) b!1462925))

(assert (= (and b!1462925 res!992274) b!1462921))

(assert (= (and b!1462921 res!992266) b!1462914))

(assert (= (and b!1462914 res!992268) b!1462916))

(assert (= (and b!1462921 (not res!992269)) b!1462924))

(assert (= (and b!1462924 (not res!992267)) b!1462912))

(assert (= (and b!1462912 (not res!992271)) b!1462926))

(assert (= (and b!1462926 c!134837) b!1462913))

(assert (= (and b!1462926 (not c!134837)) b!1462930))

(declare-fun m!1350311 () Bool)

(assert (=> b!1462924 m!1350311))

(declare-fun m!1350313 () Bool)

(assert (=> b!1462931 m!1350313))

(assert (=> b!1462931 m!1350313))

(declare-fun m!1350315 () Bool)

(assert (=> b!1462931 m!1350315))

(declare-fun m!1350317 () Bool)

(assert (=> start!125286 m!1350317))

(declare-fun m!1350319 () Bool)

(assert (=> start!125286 m!1350319))

(declare-fun m!1350321 () Bool)

(assert (=> b!1462913 m!1350321))

(declare-fun m!1350323 () Bool)

(assert (=> b!1462921 m!1350323))

(declare-fun m!1350325 () Bool)

(assert (=> b!1462921 m!1350325))

(declare-fun m!1350327 () Bool)

(assert (=> b!1462921 m!1350327))

(declare-fun m!1350329 () Bool)

(assert (=> b!1462921 m!1350329))

(declare-fun m!1350331 () Bool)

(assert (=> b!1462921 m!1350331))

(assert (=> b!1462921 m!1350313))

(declare-fun m!1350333 () Bool)

(assert (=> b!1462927 m!1350333))

(assert (=> b!1462927 m!1350333))

(declare-fun m!1350335 () Bool)

(assert (=> b!1462927 m!1350335))

(assert (=> b!1462927 m!1350325))

(declare-fun m!1350337 () Bool)

(assert (=> b!1462927 m!1350337))

(assert (=> b!1462914 m!1350313))

(assert (=> b!1462914 m!1350313))

(declare-fun m!1350339 () Bool)

(assert (=> b!1462914 m!1350339))

(assert (=> b!1462918 m!1350313))

(assert (=> b!1462918 m!1350313))

(declare-fun m!1350341 () Bool)

(assert (=> b!1462918 m!1350341))

(declare-fun m!1350343 () Bool)

(assert (=> b!1462916 m!1350343))

(assert (=> b!1462916 m!1350313))

(declare-fun m!1350345 () Bool)

(assert (=> b!1462911 m!1350345))

(declare-fun m!1350347 () Bool)

(assert (=> b!1462930 m!1350347))

(declare-fun m!1350349 () Bool)

(assert (=> b!1462930 m!1350349))

(declare-fun m!1350351 () Bool)

(assert (=> b!1462922 m!1350351))

(declare-fun m!1350353 () Bool)

(assert (=> b!1462929 m!1350353))

(declare-fun m!1350355 () Bool)

(assert (=> b!1462919 m!1350355))

(assert (=> b!1462919 m!1350349))

(assert (=> b!1462928 m!1350325))

(declare-fun m!1350357 () Bool)

(assert (=> b!1462928 m!1350357))

(assert (=> b!1462917 m!1350313))

(assert (=> b!1462917 m!1350313))

(declare-fun m!1350359 () Bool)

(assert (=> b!1462917 m!1350359))

(assert (=> b!1462917 m!1350359))

(assert (=> b!1462917 m!1350313))

(declare-fun m!1350361 () Bool)

(assert (=> b!1462917 m!1350361))

(declare-fun m!1350363 () Bool)

(assert (=> b!1462915 m!1350363))

(assert (=> b!1462915 m!1350363))

(declare-fun m!1350365 () Bool)

(assert (=> b!1462915 m!1350365))

(assert (=> b!1462912 m!1350313))

(assert (=> b!1462912 m!1350313))

(declare-fun m!1350367 () Bool)

(assert (=> b!1462912 m!1350367))

(check-sat (not b!1462918) (not b!1462927) (not b!1462929) (not b!1462912) (not b!1462913) (not b!1462921) (not b!1462922) (not start!125286) (not b!1462919) (not b!1462930) (not b!1462915) (not b!1462914) (not b!1462931) (not b!1462924) (not b!1462917) (not b!1462911))
(check-sat)
