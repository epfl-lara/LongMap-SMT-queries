; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126858 () Bool)

(assert start!126858)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1489926 () Bool)

(declare-datatypes ((SeekEntryResult!12327 0))(
  ( (MissingZero!12327 (index!51700 (_ BitVec 32))) (Found!12327 (index!51701 (_ BitVec 32))) (Intermediate!12327 (undefined!13139 Bool) (index!51702 (_ BitVec 32)) (x!133295 (_ BitVec 32))) (Undefined!12327) (MissingVacant!12327 (index!51703 (_ BitVec 32))) )
))
(declare-fun lt!649751 () SeekEntryResult!12327)

(declare-fun e!834969 () Bool)

(declare-fun lt!649752 () (_ BitVec 64))

(declare-datatypes ((array!99631 0))(
  ( (array!99632 (arr!48087 (Array (_ BitVec 32) (_ BitVec 64))) (size!48637 (_ BitVec 32))) )
))
(declare-fun lt!649750 () array!99631)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!649755 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12327)

(assert (=> b!1489926 (= e!834969 (not (= lt!649751 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649755 lt!649752 lt!649750 mask!2687))))))

(declare-fun b!1489927 () Bool)

(declare-fun res!1013287 () Bool)

(declare-fun e!834964 () Bool)

(assert (=> b!1489927 (=> (not res!1013287) (not e!834964))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99631)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1489927 (= res!1013287 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48637 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48637 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48637 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1013297 () Bool)

(assert (=> start!126858 (=> (not res!1013297) (not e!834964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126858 (= res!1013297 (validMask!0 mask!2687))))

(assert (=> start!126858 e!834964))

(assert (=> start!126858 true))

(declare-fun array_inv!37115 (array!99631) Bool)

(assert (=> start!126858 (array_inv!37115 a!2862)))

(declare-fun b!1489928 () Bool)

(declare-fun res!1013295 () Bool)

(assert (=> b!1489928 (=> (not res!1013295) (not e!834964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99631 (_ BitVec 32)) Bool)

(assert (=> b!1489928 (= res!1013295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489929 () Bool)

(declare-fun res!1013293 () Bool)

(assert (=> b!1489929 (=> (not res!1013293) (not e!834964))))

(declare-datatypes ((List!34588 0))(
  ( (Nil!34585) (Cons!34584 (h!35967 (_ BitVec 64)) (t!49282 List!34588)) )
))
(declare-fun arrayNoDuplicates!0 (array!99631 (_ BitVec 32) List!34588) Bool)

(assert (=> b!1489929 (= res!1013293 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34585))))

(declare-fun e!834965 () Bool)

(declare-fun b!1489930 () Bool)

(assert (=> b!1489930 (= e!834965 (= lt!649751 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649752 lt!649750 mask!2687)))))

(declare-fun b!1489931 () Bool)

(declare-fun lt!649753 () SeekEntryResult!12327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12327)

(assert (=> b!1489931 (= e!834969 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649755 intermediateAfterIndex!19 lt!649752 lt!649750 mask!2687) lt!649753)))))

(declare-fun b!1489932 () Bool)

(declare-fun res!1013294 () Bool)

(assert (=> b!1489932 (=> (not res!1013294) (not e!834964))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489932 (= res!1013294 (validKeyInArray!0 (select (arr!48087 a!2862) j!93)))))

(declare-fun b!1489933 () Bool)

(declare-fun e!834970 () Bool)

(declare-fun e!834967 () Bool)

(assert (=> b!1489933 (= e!834970 e!834967)))

(declare-fun res!1013288 () Bool)

(assert (=> b!1489933 (=> (not res!1013288) (not e!834967))))

(assert (=> b!1489933 (= res!1013288 (= lt!649751 (Intermediate!12327 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489933 (= lt!649751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649752 mask!2687) lt!649752 lt!649750 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489933 (= lt!649752 (select (store (arr!48087 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489934 () Bool)

(declare-fun res!1013291 () Bool)

(assert (=> b!1489934 (=> (not res!1013291) (not e!834964))))

(assert (=> b!1489934 (= res!1013291 (validKeyInArray!0 (select (arr!48087 a!2862) i!1006)))))

(declare-fun b!1489935 () Bool)

(declare-fun res!1013299 () Bool)

(assert (=> b!1489935 (=> (not res!1013299) (not e!834967))))

(assert (=> b!1489935 (= res!1013299 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489936 () Bool)

(declare-fun e!834966 () Bool)

(assert (=> b!1489936 (= e!834967 (not e!834966))))

(declare-fun res!1013290 () Bool)

(assert (=> b!1489936 (=> res!1013290 e!834966)))

(assert (=> b!1489936 (= res!1013290 (or (and (= (select (arr!48087 a!2862) index!646) (select (store (arr!48087 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48087 a!2862) index!646) (select (arr!48087 a!2862) j!93))) (= (select (arr!48087 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!649757 () SeekEntryResult!12327)

(assert (=> b!1489936 (and (= lt!649757 (Found!12327 j!93)) (or (= (select (arr!48087 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48087 a!2862) intermediateBeforeIndex!19) (select (arr!48087 a!2862) j!93))) (let ((bdg!54756 (select (store (arr!48087 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48087 a!2862) index!646) bdg!54756) (= (select (arr!48087 a!2862) index!646) (select (arr!48087 a!2862) j!93))) (= (select (arr!48087 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54756 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99631 (_ BitVec 32)) SeekEntryResult!12327)

(assert (=> b!1489936 (= lt!649757 (seekEntryOrOpen!0 (select (arr!48087 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489936 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49994 0))(
  ( (Unit!49995) )
))
(declare-fun lt!649754 () Unit!49994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49994)

(assert (=> b!1489936 (= lt!649754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489937 () Bool)

(declare-fun e!834963 () Bool)

(assert (=> b!1489937 (= e!834964 e!834963)))

(declare-fun res!1013298 () Bool)

(assert (=> b!1489937 (=> (not res!1013298) (not e!834963))))

(assert (=> b!1489937 (= res!1013298 (= (select (store (arr!48087 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489937 (= lt!649750 (array!99632 (store (arr!48087 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48637 a!2862)))))

(declare-fun b!1489938 () Bool)

(declare-fun e!834971 () Bool)

(assert (=> b!1489938 (= e!834971 true)))

(assert (=> b!1489938 (= lt!649757 lt!649753)))

(declare-fun lt!649758 () Unit!49994)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49994)

(assert (=> b!1489938 (= lt!649758 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649755 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489939 () Bool)

(assert (=> b!1489939 (= e!834963 e!834970)))

(declare-fun res!1013282 () Bool)

(assert (=> b!1489939 (=> (not res!1013282) (not e!834970))))

(declare-fun lt!649756 () SeekEntryResult!12327)

(assert (=> b!1489939 (= res!1013282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48087 a!2862) j!93) mask!2687) (select (arr!48087 a!2862) j!93) a!2862 mask!2687) lt!649756))))

(assert (=> b!1489939 (= lt!649756 (Intermediate!12327 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489940 () Bool)

(assert (=> b!1489940 (= e!834965 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649752 lt!649750 mask!2687) (seekEntryOrOpen!0 lt!649752 lt!649750 mask!2687)))))

(declare-fun b!1489941 () Bool)

(declare-fun res!1013292 () Bool)

(assert (=> b!1489941 (=> (not res!1013292) (not e!834967))))

(assert (=> b!1489941 (= res!1013292 e!834965)))

(declare-fun c!137850 () Bool)

(assert (=> b!1489941 (= c!137850 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489942 () Bool)

(declare-fun res!1013283 () Bool)

(assert (=> b!1489942 (=> res!1013283 e!834971)))

(assert (=> b!1489942 (= res!1013283 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489943 () Bool)

(declare-fun res!1013284 () Bool)

(assert (=> b!1489943 (=> res!1013284 e!834971)))

(assert (=> b!1489943 (= res!1013284 e!834969)))

(declare-fun c!137849 () Bool)

(assert (=> b!1489943 (= c!137849 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489944 () Bool)

(declare-fun res!1013285 () Bool)

(assert (=> b!1489944 (=> (not res!1013285) (not e!834970))))

(assert (=> b!1489944 (= res!1013285 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48087 a!2862) j!93) a!2862 mask!2687) lt!649756))))

(declare-fun b!1489945 () Bool)

(assert (=> b!1489945 (= e!834966 e!834971)))

(declare-fun res!1013289 () Bool)

(assert (=> b!1489945 (=> res!1013289 e!834971)))

(assert (=> b!1489945 (= res!1013289 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649755 #b00000000000000000000000000000000) (bvsge lt!649755 (size!48637 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489945 (= lt!649755 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489945 (= lt!649753 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649752 lt!649750 mask!2687))))

(assert (=> b!1489945 (= lt!649753 (seekEntryOrOpen!0 lt!649752 lt!649750 mask!2687))))

(declare-fun b!1489946 () Bool)

(declare-fun res!1013286 () Bool)

(assert (=> b!1489946 (=> (not res!1013286) (not e!834964))))

(assert (=> b!1489946 (= res!1013286 (and (= (size!48637 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48637 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48637 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489947 () Bool)

(declare-fun res!1013296 () Bool)

(assert (=> b!1489947 (=> res!1013296 e!834971)))

(assert (=> b!1489947 (= res!1013296 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649755 (select (arr!48087 a!2862) j!93) a!2862 mask!2687) lt!649756)))))

(assert (= (and start!126858 res!1013297) b!1489946))

(assert (= (and b!1489946 res!1013286) b!1489934))

(assert (= (and b!1489934 res!1013291) b!1489932))

(assert (= (and b!1489932 res!1013294) b!1489928))

(assert (= (and b!1489928 res!1013295) b!1489929))

(assert (= (and b!1489929 res!1013293) b!1489927))

(assert (= (and b!1489927 res!1013287) b!1489937))

(assert (= (and b!1489937 res!1013298) b!1489939))

(assert (= (and b!1489939 res!1013282) b!1489944))

(assert (= (and b!1489944 res!1013285) b!1489933))

(assert (= (and b!1489933 res!1013288) b!1489941))

(assert (= (and b!1489941 c!137850) b!1489930))

(assert (= (and b!1489941 (not c!137850)) b!1489940))

(assert (= (and b!1489941 res!1013292) b!1489935))

(assert (= (and b!1489935 res!1013299) b!1489936))

(assert (= (and b!1489936 (not res!1013290)) b!1489945))

(assert (= (and b!1489945 (not res!1013289)) b!1489947))

(assert (= (and b!1489947 (not res!1013296)) b!1489943))

(assert (= (and b!1489943 c!137849) b!1489926))

(assert (= (and b!1489943 (not c!137849)) b!1489931))

(assert (= (and b!1489943 (not res!1013284)) b!1489942))

(assert (= (and b!1489942 (not res!1013283)) b!1489938))

(declare-fun m!1374115 () Bool)

(assert (=> b!1489932 m!1374115))

(assert (=> b!1489932 m!1374115))

(declare-fun m!1374117 () Bool)

(assert (=> b!1489932 m!1374117))

(declare-fun m!1374119 () Bool)

(assert (=> start!126858 m!1374119))

(declare-fun m!1374121 () Bool)

(assert (=> start!126858 m!1374121))

(declare-fun m!1374123 () Bool)

(assert (=> b!1489931 m!1374123))

(declare-fun m!1374125 () Bool)

(assert (=> b!1489929 m!1374125))

(declare-fun m!1374127 () Bool)

(assert (=> b!1489940 m!1374127))

(declare-fun m!1374129 () Bool)

(assert (=> b!1489940 m!1374129))

(declare-fun m!1374131 () Bool)

(assert (=> b!1489926 m!1374131))

(declare-fun m!1374133 () Bool)

(assert (=> b!1489928 m!1374133))

(declare-fun m!1374135 () Bool)

(assert (=> b!1489937 m!1374135))

(declare-fun m!1374137 () Bool)

(assert (=> b!1489937 m!1374137))

(declare-fun m!1374139 () Bool)

(assert (=> b!1489933 m!1374139))

(assert (=> b!1489933 m!1374139))

(declare-fun m!1374141 () Bool)

(assert (=> b!1489933 m!1374141))

(assert (=> b!1489933 m!1374135))

(declare-fun m!1374143 () Bool)

(assert (=> b!1489933 m!1374143))

(declare-fun m!1374145 () Bool)

(assert (=> b!1489936 m!1374145))

(assert (=> b!1489936 m!1374135))

(declare-fun m!1374147 () Bool)

(assert (=> b!1489936 m!1374147))

(declare-fun m!1374149 () Bool)

(assert (=> b!1489936 m!1374149))

(declare-fun m!1374151 () Bool)

(assert (=> b!1489936 m!1374151))

(assert (=> b!1489936 m!1374115))

(declare-fun m!1374153 () Bool)

(assert (=> b!1489936 m!1374153))

(declare-fun m!1374155 () Bool)

(assert (=> b!1489936 m!1374155))

(assert (=> b!1489936 m!1374115))

(assert (=> b!1489944 m!1374115))

(assert (=> b!1489944 m!1374115))

(declare-fun m!1374157 () Bool)

(assert (=> b!1489944 m!1374157))

(assert (=> b!1489939 m!1374115))

(assert (=> b!1489939 m!1374115))

(declare-fun m!1374159 () Bool)

(assert (=> b!1489939 m!1374159))

(assert (=> b!1489939 m!1374159))

(assert (=> b!1489939 m!1374115))

(declare-fun m!1374161 () Bool)

(assert (=> b!1489939 m!1374161))

(declare-fun m!1374163 () Bool)

(assert (=> b!1489930 m!1374163))

(declare-fun m!1374165 () Bool)

(assert (=> b!1489934 m!1374165))

(assert (=> b!1489934 m!1374165))

(declare-fun m!1374167 () Bool)

(assert (=> b!1489934 m!1374167))

(declare-fun m!1374169 () Bool)

(assert (=> b!1489938 m!1374169))

(declare-fun m!1374171 () Bool)

(assert (=> b!1489945 m!1374171))

(assert (=> b!1489945 m!1374127))

(assert (=> b!1489945 m!1374129))

(assert (=> b!1489947 m!1374115))

(assert (=> b!1489947 m!1374115))

(declare-fun m!1374173 () Bool)

(assert (=> b!1489947 m!1374173))

(check-sat (not b!1489934) (not b!1489936) (not b!1489939) (not start!126858) (not b!1489926) (not b!1489928) (not b!1489929) (not b!1489945) (not b!1489931) (not b!1489932) (not b!1489947) (not b!1489944) (not b!1489940) (not b!1489930) (not b!1489938) (not b!1489933))
(check-sat)
