; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124848 () Bool)

(assert start!124848)

(declare-fun b!1444803 () Bool)

(declare-fun res!976091 () Bool)

(declare-fun e!814256 () Bool)

(assert (=> b!1444803 (=> (not res!976091) (not e!814256))))

(declare-datatypes ((array!98191 0))(
  ( (array!98192 (arr!47380 (Array (_ BitVec 32) (_ BitVec 64))) (size!47931 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98191)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444803 (= res!976091 (validKeyInArray!0 (select (arr!47380 a!2862) j!93)))))

(declare-fun b!1444804 () Bool)

(declare-fun res!976086 () Bool)

(assert (=> b!1444804 (=> (not res!976086) (not e!814256))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444804 (= res!976086 (validKeyInArray!0 (select (arr!47380 a!2862) i!1006)))))

(declare-fun res!976082 () Bool)

(assert (=> start!124848 (=> (not res!976082) (not e!814256))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124848 (= res!976082 (validMask!0 mask!2687))))

(assert (=> start!124848 e!814256))

(assert (=> start!124848 true))

(declare-fun array_inv!36661 (array!98191) Bool)

(assert (=> start!124848 (array_inv!36661 a!2862)))

(declare-fun b!1444805 () Bool)

(declare-fun res!976089 () Bool)

(assert (=> b!1444805 (=> (not res!976089) (not e!814256))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444805 (= res!976089 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47931 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47931 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47931 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444806 () Bool)

(declare-fun res!976087 () Bool)

(declare-fun e!814260 () Bool)

(assert (=> b!1444806 (=> res!976087 e!814260)))

(declare-fun lt!634351 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11529 0))(
  ( (MissingZero!11529 (index!48508 (_ BitVec 32))) (Found!11529 (index!48509 (_ BitVec 32))) (Intermediate!11529 (undefined!12341 Bool) (index!48510 (_ BitVec 32)) (x!130386 (_ BitVec 32))) (Undefined!11529) (MissingVacant!11529 (index!48511 (_ BitVec 32))) )
))
(declare-fun lt!634350 () SeekEntryResult!11529)

(declare-fun lt!634354 () array!98191)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98191 (_ BitVec 32)) SeekEntryResult!11529)

(assert (=> b!1444806 (= res!976087 (not (= lt!634350 (seekEntryOrOpen!0 lt!634351 lt!634354 mask!2687))))))

(declare-fun b!1444807 () Bool)

(declare-fun res!976080 () Bool)

(declare-fun e!814259 () Bool)

(assert (=> b!1444807 (=> (not res!976080) (not e!814259))))

(assert (=> b!1444807 (= res!976080 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444808 () Bool)

(declare-fun res!976081 () Bool)

(declare-fun e!814255 () Bool)

(assert (=> b!1444808 (=> (not res!976081) (not e!814255))))

(declare-fun lt!634349 () SeekEntryResult!11529)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98191 (_ BitVec 32)) SeekEntryResult!11529)

(assert (=> b!1444808 (= res!976081 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!634349))))

(declare-fun lt!634353 () SeekEntryResult!11529)

(declare-fun b!1444809 () Bool)

(declare-fun e!814258 () Bool)

(assert (=> b!1444809 (= e!814258 (= lt!634353 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634351 lt!634354 mask!2687)))))

(declare-fun b!1444810 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98191 (_ BitVec 32)) SeekEntryResult!11529)

(assert (=> b!1444810 (= e!814258 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634351 lt!634354 mask!2687) (seekEntryOrOpen!0 lt!634351 lt!634354 mask!2687)))))

(declare-fun b!1444811 () Bool)

(declare-fun res!976085 () Bool)

(assert (=> b!1444811 (=> (not res!976085) (not e!814256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98191 (_ BitVec 32)) Bool)

(assert (=> b!1444811 (= res!976085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444812 () Bool)

(declare-fun e!814254 () Bool)

(assert (=> b!1444812 (= e!814256 e!814254)))

(declare-fun res!976077 () Bool)

(assert (=> b!1444812 (=> (not res!976077) (not e!814254))))

(assert (=> b!1444812 (= res!976077 (= (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444812 (= lt!634354 (array!98192 (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47931 a!2862)))))

(declare-fun b!1444813 () Bool)

(declare-fun res!976083 () Bool)

(assert (=> b!1444813 (=> (not res!976083) (not e!814259))))

(assert (=> b!1444813 (= res!976083 e!814258)))

(declare-fun c!133882 () Bool)

(assert (=> b!1444813 (= c!133882 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444814 () Bool)

(assert (=> b!1444814 (= e!814260 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444815 () Bool)

(declare-fun res!976090 () Bool)

(assert (=> b!1444815 (=> (not res!976090) (not e!814256))))

(declare-datatypes ((List!33868 0))(
  ( (Nil!33865) (Cons!33864 (h!35225 (_ BitVec 64)) (t!48554 List!33868)) )
))
(declare-fun arrayNoDuplicates!0 (array!98191 (_ BitVec 32) List!33868) Bool)

(assert (=> b!1444815 (= res!976090 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33865))))

(declare-fun b!1444816 () Bool)

(assert (=> b!1444816 (= e!814254 e!814255)))

(declare-fun res!976084 () Bool)

(assert (=> b!1444816 (=> (not res!976084) (not e!814255))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444816 (= res!976084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47380 a!2862) j!93) mask!2687) (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!634349))))

(assert (=> b!1444816 (= lt!634349 (Intermediate!11529 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444817 () Bool)

(assert (=> b!1444817 (= e!814255 e!814259)))

(declare-fun res!976088 () Bool)

(assert (=> b!1444817 (=> (not res!976088) (not e!814259))))

(assert (=> b!1444817 (= res!976088 (= lt!634353 (Intermediate!11529 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444817 (= lt!634353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634351 mask!2687) lt!634351 lt!634354 mask!2687))))

(assert (=> b!1444817 (= lt!634351 (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444818 () Bool)

(declare-fun res!976079 () Bool)

(assert (=> b!1444818 (=> (not res!976079) (not e!814256))))

(assert (=> b!1444818 (= res!976079 (and (= (size!47931 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47931 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47931 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444819 () Bool)

(assert (=> b!1444819 (= e!814259 (not e!814260))))

(declare-fun res!976078 () Bool)

(assert (=> b!1444819 (=> res!976078 e!814260)))

(assert (=> b!1444819 (= res!976078 (or (not (= (select (arr!47380 a!2862) index!646) (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47380 a!2862) index!646) (select (arr!47380 a!2862) j!93)))))))

(assert (=> b!1444819 (and (= lt!634350 (Found!11529 j!93)) (or (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) (select (arr!47380 a!2862) j!93))))))

(assert (=> b!1444819 (= lt!634350 (seekEntryOrOpen!0 (select (arr!47380 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1444819 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48587 0))(
  ( (Unit!48588) )
))
(declare-fun lt!634352 () Unit!48587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48587)

(assert (=> b!1444819 (= lt!634352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124848 res!976082) b!1444818))

(assert (= (and b!1444818 res!976079) b!1444804))

(assert (= (and b!1444804 res!976086) b!1444803))

(assert (= (and b!1444803 res!976091) b!1444811))

(assert (= (and b!1444811 res!976085) b!1444815))

(assert (= (and b!1444815 res!976090) b!1444805))

(assert (= (and b!1444805 res!976089) b!1444812))

(assert (= (and b!1444812 res!976077) b!1444816))

(assert (= (and b!1444816 res!976084) b!1444808))

(assert (= (and b!1444808 res!976081) b!1444817))

(assert (= (and b!1444817 res!976088) b!1444813))

(assert (= (and b!1444813 c!133882) b!1444809))

(assert (= (and b!1444813 (not c!133882)) b!1444810))

(assert (= (and b!1444813 res!976083) b!1444807))

(assert (= (and b!1444807 res!976080) b!1444819))

(assert (= (and b!1444819 (not res!976078)) b!1444806))

(assert (= (and b!1444806 (not res!976087)) b!1444814))

(declare-fun m!1333993 () Bool)

(assert (=> b!1444809 m!1333993))

(declare-fun m!1333995 () Bool)

(assert (=> b!1444810 m!1333995))

(declare-fun m!1333997 () Bool)

(assert (=> b!1444810 m!1333997))

(declare-fun m!1333999 () Bool)

(assert (=> b!1444816 m!1333999))

(assert (=> b!1444816 m!1333999))

(declare-fun m!1334001 () Bool)

(assert (=> b!1444816 m!1334001))

(assert (=> b!1444816 m!1334001))

(assert (=> b!1444816 m!1333999))

(declare-fun m!1334003 () Bool)

(assert (=> b!1444816 m!1334003))

(declare-fun m!1334005 () Bool)

(assert (=> b!1444817 m!1334005))

(assert (=> b!1444817 m!1334005))

(declare-fun m!1334007 () Bool)

(assert (=> b!1444817 m!1334007))

(declare-fun m!1334009 () Bool)

(assert (=> b!1444817 m!1334009))

(declare-fun m!1334011 () Bool)

(assert (=> b!1444817 m!1334011))

(declare-fun m!1334013 () Bool)

(assert (=> start!124848 m!1334013))

(declare-fun m!1334015 () Bool)

(assert (=> start!124848 m!1334015))

(declare-fun m!1334017 () Bool)

(assert (=> b!1444811 m!1334017))

(declare-fun m!1334019 () Bool)

(assert (=> b!1444804 m!1334019))

(assert (=> b!1444804 m!1334019))

(declare-fun m!1334021 () Bool)

(assert (=> b!1444804 m!1334021))

(assert (=> b!1444808 m!1333999))

(assert (=> b!1444808 m!1333999))

(declare-fun m!1334023 () Bool)

(assert (=> b!1444808 m!1334023))

(assert (=> b!1444806 m!1333997))

(declare-fun m!1334025 () Bool)

(assert (=> b!1444819 m!1334025))

(assert (=> b!1444819 m!1334009))

(declare-fun m!1334027 () Bool)

(assert (=> b!1444819 m!1334027))

(declare-fun m!1334029 () Bool)

(assert (=> b!1444819 m!1334029))

(declare-fun m!1334031 () Bool)

(assert (=> b!1444819 m!1334031))

(assert (=> b!1444819 m!1333999))

(declare-fun m!1334033 () Bool)

(assert (=> b!1444819 m!1334033))

(declare-fun m!1334035 () Bool)

(assert (=> b!1444819 m!1334035))

(assert (=> b!1444819 m!1333999))

(declare-fun m!1334037 () Bool)

(assert (=> b!1444815 m!1334037))

(assert (=> b!1444812 m!1334009))

(declare-fun m!1334039 () Bool)

(assert (=> b!1444812 m!1334039))

(assert (=> b!1444803 m!1333999))

(assert (=> b!1444803 m!1333999))

(declare-fun m!1334041 () Bool)

(assert (=> b!1444803 m!1334041))

(check-sat (not b!1444817) (not b!1444803) (not b!1444816) (not b!1444810) (not b!1444819) (not b!1444811) (not b!1444809) (not b!1444806) (not b!1444804) (not start!124848) (not b!1444815) (not b!1444808))
(check-sat)
