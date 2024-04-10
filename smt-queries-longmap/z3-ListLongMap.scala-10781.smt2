; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126186 () Bool)

(assert start!126186)

(declare-fun b!1478002 () Bool)

(declare-fun res!1004075 () Bool)

(declare-fun e!829133 () Bool)

(assert (=> b!1478002 (=> (not res!1004075) (not e!829133))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478002 (= res!1004075 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478003 () Bool)

(declare-fun e!829131 () Bool)

(declare-fun e!829128 () Bool)

(assert (=> b!1478003 (= e!829131 e!829128)))

(declare-fun res!1004072 () Bool)

(assert (=> b!1478003 (=> (not res!1004072) (not e!829128))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99292 0))(
  ( (array!99293 (arr!47925 (Array (_ BitVec 32) (_ BitVec 64))) (size!48475 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99292)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12165 0))(
  ( (MissingZero!12165 (index!51052 (_ BitVec 32))) (Found!12165 (index!51053 (_ BitVec 32))) (Intermediate!12165 (undefined!12977 Bool) (index!51054 (_ BitVec 32)) (x!132644 (_ BitVec 32))) (Undefined!12165) (MissingVacant!12165 (index!51055 (_ BitVec 32))) )
))
(declare-fun lt!645535 () SeekEntryResult!12165)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12165)

(assert (=> b!1478003 (= res!1004072 (= lt!645535 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47925 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun e!829126 () Bool)

(declare-fun lt!645539 () (_ BitVec 64))

(declare-fun lt!645536 () array!99292)

(declare-fun b!1478004 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12165)

(assert (=> b!1478004 (= e!829126 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645539 lt!645536 mask!2687) (seekEntryOrOpen!0 lt!645539 lt!645536 mask!2687)))))

(declare-fun b!1478005 () Bool)

(declare-fun res!1004068 () Bool)

(declare-fun e!829125 () Bool)

(assert (=> b!1478005 (=> (not res!1004068) (not e!829125))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478005 (= res!1004068 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48475 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48475 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48475 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478006 () Bool)

(declare-fun res!1004073 () Bool)

(assert (=> b!1478006 (=> (not res!1004073) (not e!829133))))

(assert (=> b!1478006 (= res!1004073 e!829126)))

(declare-fun c!136488 () Bool)

(assert (=> b!1478006 (= c!136488 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478007 () Bool)

(declare-fun res!1004077 () Bool)

(assert (=> b!1478007 (=> (not res!1004077) (not e!829125))))

(declare-datatypes ((List!34426 0))(
  ( (Nil!34423) (Cons!34422 (h!35790 (_ BitVec 64)) (t!49120 List!34426)) )
))
(declare-fun arrayNoDuplicates!0 (array!99292 (_ BitVec 32) List!34426) Bool)

(assert (=> b!1478007 (= res!1004077 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34423))))

(declare-fun b!1478008 () Bool)

(declare-fun res!1004080 () Bool)

(assert (=> b!1478008 (=> (not res!1004080) (not e!829125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478008 (= res!1004080 (validKeyInArray!0 (select (arr!47925 a!2862) j!93)))))

(declare-fun b!1478010 () Bool)

(declare-fun res!1004071 () Bool)

(assert (=> b!1478010 (=> (not res!1004071) (not e!829125))))

(assert (=> b!1478010 (= res!1004071 (and (= (size!48475 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48475 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48475 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478011 () Bool)

(declare-fun res!1004079 () Bool)

(assert (=> b!1478011 (=> (not res!1004079) (not e!829125))))

(assert (=> b!1478011 (= res!1004079 (validKeyInArray!0 (select (arr!47925 a!2862) i!1006)))))

(declare-fun b!1478012 () Bool)

(declare-fun res!1004076 () Bool)

(declare-fun e!829132 () Bool)

(assert (=> b!1478012 (=> (not res!1004076) (not e!829132))))

(declare-fun lt!645540 () SeekEntryResult!12165)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99292 (_ BitVec 32)) SeekEntryResult!12165)

(assert (=> b!1478012 (= res!1004076 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47925 a!2862) j!93) a!2862 mask!2687) lt!645540))))

(declare-fun b!1478013 () Bool)

(assert (=> b!1478013 (= e!829132 e!829133)))

(declare-fun res!1004065 () Bool)

(assert (=> b!1478013 (=> (not res!1004065) (not e!829133))))

(declare-fun lt!645538 () SeekEntryResult!12165)

(assert (=> b!1478013 (= res!1004065 (= lt!645538 (Intermediate!12165 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478013 (= lt!645538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645539 mask!2687) lt!645539 lt!645536 mask!2687))))

(assert (=> b!1478013 (= lt!645539 (select (store (arr!47925 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478014 () Bool)

(assert (=> b!1478014 (= e!829133 (not true))))

(declare-fun e!829130 () Bool)

(assert (=> b!1478014 e!829130))

(declare-fun res!1004074 () Bool)

(assert (=> b!1478014 (=> (not res!1004074) (not e!829130))))

(assert (=> b!1478014 (= res!1004074 (and (= lt!645535 (Found!12165 j!93)) (or (= (select (arr!47925 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47925 a!2862) intermediateBeforeIndex!19) (select (arr!47925 a!2862) j!93)))))))

(assert (=> b!1478014 (= lt!645535 (seekEntryOrOpen!0 (select (arr!47925 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99292 (_ BitVec 32)) Bool)

(assert (=> b!1478014 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49670 0))(
  ( (Unit!49671) )
))
(declare-fun lt!645537 () Unit!49670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49670)

(assert (=> b!1478014 (= lt!645537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478015 () Bool)

(assert (=> b!1478015 (= e!829128 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478016 () Bool)

(assert (=> b!1478016 (= e!829126 (= lt!645538 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645539 lt!645536 mask!2687)))))

(declare-fun b!1478017 () Bool)

(declare-fun e!829129 () Bool)

(assert (=> b!1478017 (= e!829129 e!829132)))

(declare-fun res!1004069 () Bool)

(assert (=> b!1478017 (=> (not res!1004069) (not e!829132))))

(assert (=> b!1478017 (= res!1004069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47925 a!2862) j!93) mask!2687) (select (arr!47925 a!2862) j!93) a!2862 mask!2687) lt!645540))))

(assert (=> b!1478017 (= lt!645540 (Intermediate!12165 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478009 () Bool)

(assert (=> b!1478009 (= e!829130 e!829131)))

(declare-fun res!1004078 () Bool)

(assert (=> b!1478009 (=> res!1004078 e!829131)))

(assert (=> b!1478009 (= res!1004078 (or (and (= (select (arr!47925 a!2862) index!646) (select (store (arr!47925 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47925 a!2862) index!646) (select (arr!47925 a!2862) j!93))) (not (= (select (arr!47925 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1004066 () Bool)

(assert (=> start!126186 (=> (not res!1004066) (not e!829125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126186 (= res!1004066 (validMask!0 mask!2687))))

(assert (=> start!126186 e!829125))

(assert (=> start!126186 true))

(declare-fun array_inv!36953 (array!99292) Bool)

(assert (=> start!126186 (array_inv!36953 a!2862)))

(declare-fun b!1478018 () Bool)

(declare-fun res!1004070 () Bool)

(assert (=> b!1478018 (=> (not res!1004070) (not e!829125))))

(assert (=> b!1478018 (= res!1004070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478019 () Bool)

(assert (=> b!1478019 (= e!829125 e!829129)))

(declare-fun res!1004067 () Bool)

(assert (=> b!1478019 (=> (not res!1004067) (not e!829129))))

(assert (=> b!1478019 (= res!1004067 (= (select (store (arr!47925 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478019 (= lt!645536 (array!99293 (store (arr!47925 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48475 a!2862)))))

(assert (= (and start!126186 res!1004066) b!1478010))

(assert (= (and b!1478010 res!1004071) b!1478011))

(assert (= (and b!1478011 res!1004079) b!1478008))

(assert (= (and b!1478008 res!1004080) b!1478018))

(assert (= (and b!1478018 res!1004070) b!1478007))

(assert (= (and b!1478007 res!1004077) b!1478005))

(assert (= (and b!1478005 res!1004068) b!1478019))

(assert (= (and b!1478019 res!1004067) b!1478017))

(assert (= (and b!1478017 res!1004069) b!1478012))

(assert (= (and b!1478012 res!1004076) b!1478013))

(assert (= (and b!1478013 res!1004065) b!1478006))

(assert (= (and b!1478006 c!136488) b!1478016))

(assert (= (and b!1478006 (not c!136488)) b!1478004))

(assert (= (and b!1478006 res!1004073) b!1478002))

(assert (= (and b!1478002 res!1004075) b!1478014))

(assert (= (and b!1478014 res!1004074) b!1478009))

(assert (= (and b!1478009 (not res!1004078)) b!1478003))

(assert (= (and b!1478003 res!1004072) b!1478015))

(declare-fun m!1363931 () Bool)

(assert (=> b!1478011 m!1363931))

(assert (=> b!1478011 m!1363931))

(declare-fun m!1363933 () Bool)

(assert (=> b!1478011 m!1363933))

(declare-fun m!1363935 () Bool)

(assert (=> b!1478019 m!1363935))

(declare-fun m!1363937 () Bool)

(assert (=> b!1478019 m!1363937))

(declare-fun m!1363939 () Bool)

(assert (=> b!1478009 m!1363939))

(assert (=> b!1478009 m!1363935))

(declare-fun m!1363941 () Bool)

(assert (=> b!1478009 m!1363941))

(declare-fun m!1363943 () Bool)

(assert (=> b!1478009 m!1363943))

(declare-fun m!1363945 () Bool)

(assert (=> b!1478004 m!1363945))

(declare-fun m!1363947 () Bool)

(assert (=> b!1478004 m!1363947))

(declare-fun m!1363949 () Bool)

(assert (=> b!1478016 m!1363949))

(assert (=> b!1478008 m!1363943))

(assert (=> b!1478008 m!1363943))

(declare-fun m!1363951 () Bool)

(assert (=> b!1478008 m!1363951))

(declare-fun m!1363953 () Bool)

(assert (=> b!1478013 m!1363953))

(assert (=> b!1478013 m!1363953))

(declare-fun m!1363955 () Bool)

(assert (=> b!1478013 m!1363955))

(assert (=> b!1478013 m!1363935))

(declare-fun m!1363957 () Bool)

(assert (=> b!1478013 m!1363957))

(assert (=> b!1478003 m!1363943))

(assert (=> b!1478003 m!1363943))

(declare-fun m!1363959 () Bool)

(assert (=> b!1478003 m!1363959))

(assert (=> b!1478017 m!1363943))

(assert (=> b!1478017 m!1363943))

(declare-fun m!1363961 () Bool)

(assert (=> b!1478017 m!1363961))

(assert (=> b!1478017 m!1363961))

(assert (=> b!1478017 m!1363943))

(declare-fun m!1363963 () Bool)

(assert (=> b!1478017 m!1363963))

(declare-fun m!1363965 () Bool)

(assert (=> b!1478014 m!1363965))

(declare-fun m!1363967 () Bool)

(assert (=> b!1478014 m!1363967))

(assert (=> b!1478014 m!1363943))

(declare-fun m!1363969 () Bool)

(assert (=> b!1478014 m!1363969))

(declare-fun m!1363971 () Bool)

(assert (=> b!1478014 m!1363971))

(assert (=> b!1478014 m!1363943))

(assert (=> b!1478012 m!1363943))

(assert (=> b!1478012 m!1363943))

(declare-fun m!1363973 () Bool)

(assert (=> b!1478012 m!1363973))

(declare-fun m!1363975 () Bool)

(assert (=> b!1478018 m!1363975))

(declare-fun m!1363977 () Bool)

(assert (=> b!1478007 m!1363977))

(declare-fun m!1363979 () Bool)

(assert (=> start!126186 m!1363979))

(declare-fun m!1363981 () Bool)

(assert (=> start!126186 m!1363981))

(check-sat (not b!1478004) (not b!1478014) (not b!1478016) (not b!1478012) (not start!126186) (not b!1478011) (not b!1478007) (not b!1478013) (not b!1478018) (not b!1478017) (not b!1478008) (not b!1478003))
(check-sat)
