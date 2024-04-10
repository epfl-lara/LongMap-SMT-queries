; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126150 () Bool)

(assert start!126150)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1477030 () Bool)

(declare-fun e!828640 () Bool)

(assert (=> b!1477030 (= e!828640 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477031 () Bool)

(declare-fun res!1003204 () Bool)

(declare-fun e!828643 () Bool)

(assert (=> b!1477031 (=> (not res!1003204) (not e!828643))))

(declare-datatypes ((array!99256 0))(
  ( (array!99257 (arr!47907 (Array (_ BitVec 32) (_ BitVec 64))) (size!48457 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99256)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477031 (= res!1003204 (validKeyInArray!0 (select (arr!47907 a!2862) j!93)))))

(declare-fun b!1477032 () Bool)

(declare-fun res!1003207 () Bool)

(assert (=> b!1477032 (=> (not res!1003207) (not e!828643))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477032 (= res!1003207 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48457 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48457 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48457 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477033 () Bool)

(declare-fun res!1003202 () Bool)

(assert (=> b!1477033 (=> (not res!1003202) (not e!828643))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99256 (_ BitVec 32)) Bool)

(assert (=> b!1477033 (= res!1003202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477034 () Bool)

(declare-fun e!828639 () Bool)

(declare-fun e!828646 () Bool)

(assert (=> b!1477034 (= e!828639 e!828646)))

(declare-fun res!1003212 () Bool)

(assert (=> b!1477034 (=> (not res!1003212) (not e!828646))))

(declare-datatypes ((SeekEntryResult!12147 0))(
  ( (MissingZero!12147 (index!50980 (_ BitVec 32))) (Found!12147 (index!50981 (_ BitVec 32))) (Intermediate!12147 (undefined!12959 Bool) (index!50982 (_ BitVec 32)) (x!132578 (_ BitVec 32))) (Undefined!12147) (MissingVacant!12147 (index!50983 (_ BitVec 32))) )
))
(declare-fun lt!645216 () SeekEntryResult!12147)

(assert (=> b!1477034 (= res!1003212 (= lt!645216 (Intermediate!12147 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645213 () array!99256)

(declare-fun lt!645214 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477034 (= lt!645216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645214 mask!2687) lt!645214 lt!645213 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477034 (= lt!645214 (select (store (arr!47907 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477035 () Bool)

(declare-fun res!1003215 () Bool)

(assert (=> b!1477035 (=> (not res!1003215) (not e!828643))))

(declare-datatypes ((List!34408 0))(
  ( (Nil!34405) (Cons!34404 (h!35772 (_ BitVec 64)) (t!49102 List!34408)) )
))
(declare-fun arrayNoDuplicates!0 (array!99256 (_ BitVec 32) List!34408) Bool)

(assert (=> b!1477035 (= res!1003215 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34405))))

(declare-fun b!1477036 () Bool)

(declare-fun res!1003201 () Bool)

(assert (=> b!1477036 (=> (not res!1003201) (not e!828643))))

(assert (=> b!1477036 (= res!1003201 (validKeyInArray!0 (select (arr!47907 a!2862) i!1006)))))

(declare-fun b!1477037 () Bool)

(declare-fun e!828642 () Bool)

(assert (=> b!1477037 (= e!828643 e!828642)))

(declare-fun res!1003206 () Bool)

(assert (=> b!1477037 (=> (not res!1003206) (not e!828642))))

(assert (=> b!1477037 (= res!1003206 (= (select (store (arr!47907 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477037 (= lt!645213 (array!99257 (store (arr!47907 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48457 a!2862)))))

(declare-fun b!1477039 () Bool)

(declare-fun e!828641 () Bool)

(assert (=> b!1477039 (= e!828641 (= lt!645216 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645214 lt!645213 mask!2687)))))

(declare-fun b!1477040 () Bool)

(declare-fun res!1003216 () Bool)

(assert (=> b!1477040 (=> (not res!1003216) (not e!828646))))

(assert (=> b!1477040 (= res!1003216 e!828641)))

(declare-fun c!136434 () Bool)

(assert (=> b!1477040 (= c!136434 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477041 () Bool)

(declare-fun e!828645 () Bool)

(assert (=> b!1477041 (= e!828645 e!828640)))

(declare-fun res!1003213 () Bool)

(assert (=> b!1477041 (=> (not res!1003213) (not e!828640))))

(declare-fun lt!645211 () SeekEntryResult!12147)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12147)

(assert (=> b!1477041 (= res!1003213 (= lt!645211 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47907 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477042 () Bool)

(assert (=> b!1477042 (= e!828646 (not true))))

(declare-fun e!828644 () Bool)

(assert (=> b!1477042 e!828644))

(declare-fun res!1003203 () Bool)

(assert (=> b!1477042 (=> (not res!1003203) (not e!828644))))

(assert (=> b!1477042 (= res!1003203 (and (= lt!645211 (Found!12147 j!93)) (or (= (select (arr!47907 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47907 a!2862) intermediateBeforeIndex!19) (select (arr!47907 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12147)

(assert (=> b!1477042 (= lt!645211 (seekEntryOrOpen!0 (select (arr!47907 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477042 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49634 0))(
  ( (Unit!49635) )
))
(declare-fun lt!645215 () Unit!49634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49634)

(assert (=> b!1477042 (= lt!645215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477043 () Bool)

(declare-fun res!1003205 () Bool)

(assert (=> b!1477043 (=> (not res!1003205) (not e!828639))))

(declare-fun lt!645212 () SeekEntryResult!12147)

(assert (=> b!1477043 (= res!1003205 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47907 a!2862) j!93) a!2862 mask!2687) lt!645212))))

(declare-fun b!1477044 () Bool)

(declare-fun res!1003210 () Bool)

(assert (=> b!1477044 (=> (not res!1003210) (not e!828643))))

(assert (=> b!1477044 (= res!1003210 (and (= (size!48457 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48457 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48457 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477045 () Bool)

(assert (=> b!1477045 (= e!828642 e!828639)))

(declare-fun res!1003209 () Bool)

(assert (=> b!1477045 (=> (not res!1003209) (not e!828639))))

(assert (=> b!1477045 (= res!1003209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47907 a!2862) j!93) mask!2687) (select (arr!47907 a!2862) j!93) a!2862 mask!2687) lt!645212))))

(assert (=> b!1477045 (= lt!645212 (Intermediate!12147 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1003211 () Bool)

(assert (=> start!126150 (=> (not res!1003211) (not e!828643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126150 (= res!1003211 (validMask!0 mask!2687))))

(assert (=> start!126150 e!828643))

(assert (=> start!126150 true))

(declare-fun array_inv!36935 (array!99256) Bool)

(assert (=> start!126150 (array_inv!36935 a!2862)))

(declare-fun b!1477038 () Bool)

(declare-fun res!1003214 () Bool)

(assert (=> b!1477038 (=> (not res!1003214) (not e!828646))))

(assert (=> b!1477038 (= res!1003214 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477046 () Bool)

(assert (=> b!1477046 (= e!828644 e!828645)))

(declare-fun res!1003208 () Bool)

(assert (=> b!1477046 (=> res!1003208 e!828645)))

(assert (=> b!1477046 (= res!1003208 (or (and (= (select (arr!47907 a!2862) index!646) (select (store (arr!47907 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47907 a!2862) index!646) (select (arr!47907 a!2862) j!93))) (not (= (select (arr!47907 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477047 () Bool)

(assert (=> b!1477047 (= e!828641 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645214 lt!645213 mask!2687) (seekEntryOrOpen!0 lt!645214 lt!645213 mask!2687)))))

(assert (= (and start!126150 res!1003211) b!1477044))

(assert (= (and b!1477044 res!1003210) b!1477036))

(assert (= (and b!1477036 res!1003201) b!1477031))

(assert (= (and b!1477031 res!1003204) b!1477033))

(assert (= (and b!1477033 res!1003202) b!1477035))

(assert (= (and b!1477035 res!1003215) b!1477032))

(assert (= (and b!1477032 res!1003207) b!1477037))

(assert (= (and b!1477037 res!1003206) b!1477045))

(assert (= (and b!1477045 res!1003209) b!1477043))

(assert (= (and b!1477043 res!1003205) b!1477034))

(assert (= (and b!1477034 res!1003212) b!1477040))

(assert (= (and b!1477040 c!136434) b!1477039))

(assert (= (and b!1477040 (not c!136434)) b!1477047))

(assert (= (and b!1477040 res!1003216) b!1477038))

(assert (= (and b!1477038 res!1003214) b!1477042))

(assert (= (and b!1477042 res!1003203) b!1477046))

(assert (= (and b!1477046 (not res!1003208)) b!1477041))

(assert (= (and b!1477041 res!1003213) b!1477030))

(declare-fun m!1362995 () Bool)

(assert (=> start!126150 m!1362995))

(declare-fun m!1362997 () Bool)

(assert (=> start!126150 m!1362997))

(declare-fun m!1362999 () Bool)

(assert (=> b!1477046 m!1362999))

(declare-fun m!1363001 () Bool)

(assert (=> b!1477046 m!1363001))

(declare-fun m!1363003 () Bool)

(assert (=> b!1477046 m!1363003))

(declare-fun m!1363005 () Bool)

(assert (=> b!1477046 m!1363005))

(declare-fun m!1363007 () Bool)

(assert (=> b!1477042 m!1363007))

(declare-fun m!1363009 () Bool)

(assert (=> b!1477042 m!1363009))

(assert (=> b!1477042 m!1363005))

(declare-fun m!1363011 () Bool)

(assert (=> b!1477042 m!1363011))

(declare-fun m!1363013 () Bool)

(assert (=> b!1477042 m!1363013))

(assert (=> b!1477042 m!1363005))

(declare-fun m!1363015 () Bool)

(assert (=> b!1477034 m!1363015))

(assert (=> b!1477034 m!1363015))

(declare-fun m!1363017 () Bool)

(assert (=> b!1477034 m!1363017))

(assert (=> b!1477034 m!1363001))

(declare-fun m!1363019 () Bool)

(assert (=> b!1477034 m!1363019))

(assert (=> b!1477043 m!1363005))

(assert (=> b!1477043 m!1363005))

(declare-fun m!1363021 () Bool)

(assert (=> b!1477043 m!1363021))

(assert (=> b!1477031 m!1363005))

(assert (=> b!1477031 m!1363005))

(declare-fun m!1363023 () Bool)

(assert (=> b!1477031 m!1363023))

(declare-fun m!1363025 () Bool)

(assert (=> b!1477036 m!1363025))

(assert (=> b!1477036 m!1363025))

(declare-fun m!1363027 () Bool)

(assert (=> b!1477036 m!1363027))

(declare-fun m!1363029 () Bool)

(assert (=> b!1477039 m!1363029))

(declare-fun m!1363031 () Bool)

(assert (=> b!1477047 m!1363031))

(declare-fun m!1363033 () Bool)

(assert (=> b!1477047 m!1363033))

(assert (=> b!1477037 m!1363001))

(declare-fun m!1363035 () Bool)

(assert (=> b!1477037 m!1363035))

(assert (=> b!1477041 m!1363005))

(assert (=> b!1477041 m!1363005))

(declare-fun m!1363037 () Bool)

(assert (=> b!1477041 m!1363037))

(assert (=> b!1477045 m!1363005))

(assert (=> b!1477045 m!1363005))

(declare-fun m!1363039 () Bool)

(assert (=> b!1477045 m!1363039))

(assert (=> b!1477045 m!1363039))

(assert (=> b!1477045 m!1363005))

(declare-fun m!1363041 () Bool)

(assert (=> b!1477045 m!1363041))

(declare-fun m!1363043 () Bool)

(assert (=> b!1477033 m!1363043))

(declare-fun m!1363045 () Bool)

(assert (=> b!1477035 m!1363045))

(check-sat (not b!1477047) (not b!1477039) (not b!1477031) (not b!1477035) (not b!1477043) (not b!1477045) (not b!1477042) (not b!1477036) (not b!1477041) (not start!126150) (not b!1477034) (not b!1477033))
(check-sat)
