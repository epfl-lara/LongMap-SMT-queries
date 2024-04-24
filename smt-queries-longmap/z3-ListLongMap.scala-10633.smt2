; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125154 () Bool)

(assert start!125154)

(declare-fun b!1453227 () Bool)

(declare-fun res!983591 () Bool)

(declare-fun e!818253 () Bool)

(assert (=> b!1453227 (=> (not res!983591) (not e!818253))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11682 0))(
  ( (MissingZero!11682 (index!49120 (_ BitVec 32))) (Found!11682 (index!49121 (_ BitVec 32))) (Intermediate!11682 (undefined!12494 Bool) (index!49122 (_ BitVec 32)) (x!130947 (_ BitVec 32))) (Undefined!11682) (MissingVacant!11682 (index!49123 (_ BitVec 32))) )
))
(declare-fun lt!637267 () SeekEntryResult!11682)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98497 0))(
  ( (array!98498 (arr!47533 (Array (_ BitVec 32) (_ BitVec 64))) (size!48084 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98497)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98497 (_ BitVec 32)) SeekEntryResult!11682)

(assert (=> b!1453227 (= res!983591 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!637267))))

(declare-fun lt!637264 () array!98497)

(declare-fun b!1453228 () Bool)

(declare-fun lt!637263 () (_ BitVec 64))

(declare-fun lt!637265 () SeekEntryResult!11682)

(declare-fun e!818256 () Bool)

(assert (=> b!1453228 (= e!818256 (= lt!637265 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637263 lt!637264 mask!2687)))))

(declare-fun b!1453229 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98497 (_ BitVec 32)) SeekEntryResult!11682)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98497 (_ BitVec 32)) SeekEntryResult!11682)

(assert (=> b!1453229 (= e!818256 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637263 lt!637264 mask!2687) (seekEntryOrOpen!0 lt!637263 lt!637264 mask!2687)))))

(declare-fun b!1453230 () Bool)

(declare-fun e!818255 () Bool)

(assert (=> b!1453230 (= e!818255 e!818253)))

(declare-fun res!983587 () Bool)

(assert (=> b!1453230 (=> (not res!983587) (not e!818253))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453230 (= res!983587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47533 a!2862) j!93) mask!2687) (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!637267))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453230 (= lt!637267 (Intermediate!11682 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453231 () Bool)

(declare-fun e!818254 () Bool)

(assert (=> b!1453231 (= e!818253 e!818254)))

(declare-fun res!983596 () Bool)

(assert (=> b!1453231 (=> (not res!983596) (not e!818254))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453231 (= res!983596 (= lt!637265 (Intermediate!11682 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453231 (= lt!637265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637263 mask!2687) lt!637263 lt!637264 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453231 (= lt!637263 (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453232 () Bool)

(declare-fun res!983589 () Bool)

(declare-fun e!818252 () Bool)

(assert (=> b!1453232 (=> (not res!983589) (not e!818252))))

(assert (=> b!1453232 (= res!983589 (and (= (size!48084 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48084 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48084 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453233 () Bool)

(declare-fun res!983588 () Bool)

(assert (=> b!1453233 (=> (not res!983588) (not e!818252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98497 (_ BitVec 32)) Bool)

(assert (=> b!1453233 (= res!983588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!983584 () Bool)

(assert (=> start!125154 (=> (not res!983584) (not e!818252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125154 (= res!983584 (validMask!0 mask!2687))))

(assert (=> start!125154 e!818252))

(assert (=> start!125154 true))

(declare-fun array_inv!36814 (array!98497) Bool)

(assert (=> start!125154 (array_inv!36814 a!2862)))

(declare-fun b!1453234 () Bool)

(declare-fun res!983592 () Bool)

(assert (=> b!1453234 (=> (not res!983592) (not e!818254))))

(assert (=> b!1453234 (= res!983592 e!818256)))

(declare-fun c!134341 () Bool)

(assert (=> b!1453234 (= c!134341 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453235 () Bool)

(declare-fun e!818250 () Bool)

(assert (=> b!1453235 (= e!818250 (and (or (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) (select (arr!47533 a!2862) j!93))) (or (and (= (select (arr!47533 a!2862) index!646) (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1453236 () Bool)

(declare-fun res!983586 () Bool)

(assert (=> b!1453236 (=> (not res!983586) (not e!818250))))

(assert (=> b!1453236 (= res!983586 (= (seekEntryOrOpen!0 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) (Found!11682 j!93)))))

(declare-fun b!1453237 () Bool)

(declare-fun res!983597 () Bool)

(assert (=> b!1453237 (=> (not res!983597) (not e!818252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453237 (= res!983597 (validKeyInArray!0 (select (arr!47533 a!2862) i!1006)))))

(declare-fun b!1453238 () Bool)

(declare-fun res!983590 () Bool)

(assert (=> b!1453238 (=> (not res!983590) (not e!818252))))

(assert (=> b!1453238 (= res!983590 (validKeyInArray!0 (select (arr!47533 a!2862) j!93)))))

(declare-fun b!1453239 () Bool)

(declare-fun res!983583 () Bool)

(assert (=> b!1453239 (=> (not res!983583) (not e!818254))))

(assert (=> b!1453239 (= res!983583 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453240 () Bool)

(declare-fun res!983595 () Bool)

(assert (=> b!1453240 (=> (not res!983595) (not e!818252))))

(assert (=> b!1453240 (= res!983595 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48084 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48084 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48084 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453241 () Bool)

(assert (=> b!1453241 (= e!818252 e!818255)))

(declare-fun res!983585 () Bool)

(assert (=> b!1453241 (=> (not res!983585) (not e!818255))))

(assert (=> b!1453241 (= res!983585 (= (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453241 (= lt!637264 (array!98498 (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48084 a!2862)))))

(declare-fun b!1453242 () Bool)

(declare-fun res!983593 () Bool)

(assert (=> b!1453242 (=> (not res!983593) (not e!818252))))

(declare-datatypes ((List!34021 0))(
  ( (Nil!34018) (Cons!34017 (h!35378 (_ BitVec 64)) (t!48707 List!34021)) )
))
(declare-fun arrayNoDuplicates!0 (array!98497 (_ BitVec 32) List!34021) Bool)

(assert (=> b!1453242 (= res!983593 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34018))))

(declare-fun b!1453243 () Bool)

(assert (=> b!1453243 (= e!818254 (not (or (and (= (select (arr!47533 a!2862) index!646) (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1453243 e!818250))

(declare-fun res!983594 () Bool)

(assert (=> b!1453243 (=> (not res!983594) (not e!818250))))

(assert (=> b!1453243 (= res!983594 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48893 0))(
  ( (Unit!48894) )
))
(declare-fun lt!637266 () Unit!48893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48893)

(assert (=> b!1453243 (= lt!637266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125154 res!983584) b!1453232))

(assert (= (and b!1453232 res!983589) b!1453237))

(assert (= (and b!1453237 res!983597) b!1453238))

(assert (= (and b!1453238 res!983590) b!1453233))

(assert (= (and b!1453233 res!983588) b!1453242))

(assert (= (and b!1453242 res!983593) b!1453240))

(assert (= (and b!1453240 res!983595) b!1453241))

(assert (= (and b!1453241 res!983585) b!1453230))

(assert (= (and b!1453230 res!983587) b!1453227))

(assert (= (and b!1453227 res!983591) b!1453231))

(assert (= (and b!1453231 res!983596) b!1453234))

(assert (= (and b!1453234 c!134341) b!1453228))

(assert (= (and b!1453234 (not c!134341)) b!1453229))

(assert (= (and b!1453234 res!983592) b!1453239))

(assert (= (and b!1453239 res!983583) b!1453243))

(assert (= (and b!1453243 res!983594) b!1453236))

(assert (= (and b!1453236 res!983586) b!1453235))

(declare-fun m!1341925 () Bool)

(assert (=> b!1453241 m!1341925))

(declare-fun m!1341927 () Bool)

(assert (=> b!1453241 m!1341927))

(declare-fun m!1341929 () Bool)

(assert (=> b!1453227 m!1341929))

(assert (=> b!1453227 m!1341929))

(declare-fun m!1341931 () Bool)

(assert (=> b!1453227 m!1341931))

(declare-fun m!1341933 () Bool)

(assert (=> b!1453228 m!1341933))

(declare-fun m!1341935 () Bool)

(assert (=> b!1453229 m!1341935))

(declare-fun m!1341937 () Bool)

(assert (=> b!1453229 m!1341937))

(declare-fun m!1341939 () Bool)

(assert (=> b!1453231 m!1341939))

(assert (=> b!1453231 m!1341939))

(declare-fun m!1341941 () Bool)

(assert (=> b!1453231 m!1341941))

(assert (=> b!1453231 m!1341925))

(declare-fun m!1341943 () Bool)

(assert (=> b!1453231 m!1341943))

(declare-fun m!1341945 () Bool)

(assert (=> b!1453242 m!1341945))

(declare-fun m!1341947 () Bool)

(assert (=> b!1453233 m!1341947))

(assert (=> b!1453230 m!1341929))

(assert (=> b!1453230 m!1341929))

(declare-fun m!1341949 () Bool)

(assert (=> b!1453230 m!1341949))

(assert (=> b!1453230 m!1341949))

(assert (=> b!1453230 m!1341929))

(declare-fun m!1341951 () Bool)

(assert (=> b!1453230 m!1341951))

(assert (=> b!1453238 m!1341929))

(assert (=> b!1453238 m!1341929))

(declare-fun m!1341953 () Bool)

(assert (=> b!1453238 m!1341953))

(declare-fun m!1341955 () Bool)

(assert (=> b!1453243 m!1341955))

(assert (=> b!1453243 m!1341925))

(declare-fun m!1341957 () Bool)

(assert (=> b!1453243 m!1341957))

(declare-fun m!1341959 () Bool)

(assert (=> b!1453243 m!1341959))

(declare-fun m!1341961 () Bool)

(assert (=> b!1453243 m!1341961))

(assert (=> b!1453243 m!1341929))

(declare-fun m!1341963 () Bool)

(assert (=> start!125154 m!1341963))

(declare-fun m!1341965 () Bool)

(assert (=> start!125154 m!1341965))

(declare-fun m!1341967 () Bool)

(assert (=> b!1453237 m!1341967))

(assert (=> b!1453237 m!1341967))

(declare-fun m!1341969 () Bool)

(assert (=> b!1453237 m!1341969))

(assert (=> b!1453236 m!1341929))

(assert (=> b!1453236 m!1341929))

(declare-fun m!1341971 () Bool)

(assert (=> b!1453236 m!1341971))

(assert (=> b!1453235 m!1341925))

(declare-fun m!1341973 () Bool)

(assert (=> b!1453235 m!1341973))

(assert (=> b!1453235 m!1341957))

(assert (=> b!1453235 m!1341959))

(assert (=> b!1453235 m!1341929))

(check-sat (not b!1453230) (not start!125154) (not b!1453229) (not b!1453228) (not b!1453243) (not b!1453236) (not b!1453233) (not b!1453227) (not b!1453231) (not b!1453237) (not b!1453242) (not b!1453238))
(check-sat)
