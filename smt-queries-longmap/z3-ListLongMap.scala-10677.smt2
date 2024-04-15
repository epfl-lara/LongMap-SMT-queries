; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125170 () Bool)

(assert start!125170)

(declare-fun b!1460048 () Bool)

(declare-fun res!989963 () Bool)

(declare-fun e!820982 () Bool)

(assert (=> b!1460048 (=> (not res!989963) (not e!820982))))

(declare-datatypes ((array!98596 0))(
  ( (array!98597 (arr!47587 (Array (_ BitVec 32) (_ BitVec 64))) (size!48139 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98596)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460048 (= res!989963 (validKeyInArray!0 (select (arr!47587 a!2862) j!93)))))

(declare-fun b!1460049 () Bool)

(declare-fun res!989961 () Bool)

(assert (=> b!1460049 (=> (not res!989961) (not e!820982))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460049 (= res!989961 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48139 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48139 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48139 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460050 () Bool)

(declare-fun e!820978 () Bool)

(assert (=> b!1460050 (= e!820982 e!820978)))

(declare-fun res!989969 () Bool)

(assert (=> b!1460050 (=> (not res!989969) (not e!820978))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460050 (= res!989969 (= (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639532 () array!98596)

(assert (=> b!1460050 (= lt!639532 (array!98597 (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48139 a!2862)))))

(declare-fun e!820983 () Bool)

(declare-fun b!1460051 () Bool)

(assert (=> b!1460051 (= e!820983 (or (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) (select (arr!47587 a!2862) j!93))))))

(declare-fun b!1460052 () Bool)

(declare-fun e!820980 () Bool)

(assert (=> b!1460052 (= e!820980 (not true))))

(assert (=> b!1460052 e!820983))

(declare-fun res!989965 () Bool)

(assert (=> b!1460052 (=> (not res!989965) (not e!820983))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98596 (_ BitVec 32)) Bool)

(assert (=> b!1460052 (= res!989965 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49065 0))(
  ( (Unit!49066) )
))
(declare-fun lt!639530 () Unit!49065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49065)

(assert (=> b!1460052 (= lt!639530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460053 () Bool)

(declare-fun res!989968 () Bool)

(declare-fun e!820981 () Bool)

(assert (=> b!1460053 (=> (not res!989968) (not e!820981))))

(declare-datatypes ((SeekEntryResult!11864 0))(
  ( (MissingZero!11864 (index!49848 (_ BitVec 32))) (Found!11864 (index!49849 (_ BitVec 32))) (Intermediate!11864 (undefined!12676 Bool) (index!49850 (_ BitVec 32)) (x!131452 (_ BitVec 32))) (Undefined!11864) (MissingVacant!11864 (index!49851 (_ BitVec 32))) )
))
(declare-fun lt!639534 () SeekEntryResult!11864)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11864)

(assert (=> b!1460053 (= res!989968 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!639534))))

(declare-fun b!1460054 () Bool)

(declare-fun res!989962 () Bool)

(assert (=> b!1460054 (=> (not res!989962) (not e!820982))))

(assert (=> b!1460054 (= res!989962 (validKeyInArray!0 (select (arr!47587 a!2862) i!1006)))))

(declare-fun res!989970 () Bool)

(assert (=> start!125170 (=> (not res!989970) (not e!820982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125170 (= res!989970 (validMask!0 mask!2687))))

(assert (=> start!125170 e!820982))

(assert (=> start!125170 true))

(declare-fun array_inv!36820 (array!98596) Bool)

(assert (=> start!125170 (array_inv!36820 a!2862)))

(declare-fun b!1460055 () Bool)

(declare-fun lt!639531 () (_ BitVec 64))

(declare-fun e!820979 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11864)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98596 (_ BitVec 32)) SeekEntryResult!11864)

(assert (=> b!1460055 (= e!820979 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639531 lt!639532 mask!2687) (seekEntryOrOpen!0 lt!639531 lt!639532 mask!2687)))))

(declare-fun b!1460056 () Bool)

(declare-fun res!989973 () Bool)

(assert (=> b!1460056 (=> (not res!989973) (not e!820983))))

(assert (=> b!1460056 (= res!989973 (= (seekEntryOrOpen!0 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) (Found!11864 j!93)))))

(declare-fun b!1460057 () Bool)

(declare-fun res!989964 () Bool)

(assert (=> b!1460057 (=> (not res!989964) (not e!820980))))

(assert (=> b!1460057 (= res!989964 e!820979)))

(declare-fun c!134557 () Bool)

(assert (=> b!1460057 (= c!134557 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460058 () Bool)

(declare-fun res!989967 () Bool)

(assert (=> b!1460058 (=> (not res!989967) (not e!820982))))

(assert (=> b!1460058 (= res!989967 (and (= (size!48139 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48139 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48139 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460059 () Bool)

(declare-fun res!989966 () Bool)

(assert (=> b!1460059 (=> (not res!989966) (not e!820980))))

(assert (=> b!1460059 (= res!989966 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460060 () Bool)

(declare-fun res!989971 () Bool)

(assert (=> b!1460060 (=> (not res!989971) (not e!820982))))

(declare-datatypes ((List!34166 0))(
  ( (Nil!34163) (Cons!34162 (h!35512 (_ BitVec 64)) (t!48852 List!34166)) )
))
(declare-fun arrayNoDuplicates!0 (array!98596 (_ BitVec 32) List!34166) Bool)

(assert (=> b!1460060 (= res!989971 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34163))))

(declare-fun lt!639533 () SeekEntryResult!11864)

(declare-fun b!1460061 () Bool)

(assert (=> b!1460061 (= e!820979 (= lt!639533 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639531 lt!639532 mask!2687)))))

(declare-fun b!1460062 () Bool)

(assert (=> b!1460062 (= e!820981 e!820980)))

(declare-fun res!989974 () Bool)

(assert (=> b!1460062 (=> (not res!989974) (not e!820980))))

(assert (=> b!1460062 (= res!989974 (= lt!639533 (Intermediate!11864 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460062 (= lt!639533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639531 mask!2687) lt!639531 lt!639532 mask!2687))))

(assert (=> b!1460062 (= lt!639531 (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460063 () Bool)

(assert (=> b!1460063 (= e!820978 e!820981)))

(declare-fun res!989960 () Bool)

(assert (=> b!1460063 (=> (not res!989960) (not e!820981))))

(assert (=> b!1460063 (= res!989960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47587 a!2862) j!93) mask!2687) (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!639534))))

(assert (=> b!1460063 (= lt!639534 (Intermediate!11864 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460064 () Bool)

(declare-fun res!989972 () Bool)

(assert (=> b!1460064 (=> (not res!989972) (not e!820982))))

(assert (=> b!1460064 (= res!989972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125170 res!989970) b!1460058))

(assert (= (and b!1460058 res!989967) b!1460054))

(assert (= (and b!1460054 res!989962) b!1460048))

(assert (= (and b!1460048 res!989963) b!1460064))

(assert (= (and b!1460064 res!989972) b!1460060))

(assert (= (and b!1460060 res!989971) b!1460049))

(assert (= (and b!1460049 res!989961) b!1460050))

(assert (= (and b!1460050 res!989969) b!1460063))

(assert (= (and b!1460063 res!989960) b!1460053))

(assert (= (and b!1460053 res!989968) b!1460062))

(assert (= (and b!1460062 res!989974) b!1460057))

(assert (= (and b!1460057 c!134557) b!1460061))

(assert (= (and b!1460057 (not c!134557)) b!1460055))

(assert (= (and b!1460057 res!989964) b!1460059))

(assert (= (and b!1460059 res!989966) b!1460052))

(assert (= (and b!1460052 res!989965) b!1460056))

(assert (= (and b!1460056 res!989973) b!1460051))

(declare-fun m!1347261 () Bool)

(assert (=> start!125170 m!1347261))

(declare-fun m!1347263 () Bool)

(assert (=> start!125170 m!1347263))

(declare-fun m!1347265 () Bool)

(assert (=> b!1460056 m!1347265))

(assert (=> b!1460056 m!1347265))

(declare-fun m!1347267 () Bool)

(assert (=> b!1460056 m!1347267))

(declare-fun m!1347269 () Bool)

(assert (=> b!1460061 m!1347269))

(declare-fun m!1347271 () Bool)

(assert (=> b!1460050 m!1347271))

(declare-fun m!1347273 () Bool)

(assert (=> b!1460050 m!1347273))

(assert (=> b!1460063 m!1347265))

(assert (=> b!1460063 m!1347265))

(declare-fun m!1347275 () Bool)

(assert (=> b!1460063 m!1347275))

(assert (=> b!1460063 m!1347275))

(assert (=> b!1460063 m!1347265))

(declare-fun m!1347277 () Bool)

(assert (=> b!1460063 m!1347277))

(declare-fun m!1347279 () Bool)

(assert (=> b!1460055 m!1347279))

(declare-fun m!1347281 () Bool)

(assert (=> b!1460055 m!1347281))

(declare-fun m!1347283 () Bool)

(assert (=> b!1460062 m!1347283))

(assert (=> b!1460062 m!1347283))

(declare-fun m!1347285 () Bool)

(assert (=> b!1460062 m!1347285))

(assert (=> b!1460062 m!1347271))

(declare-fun m!1347287 () Bool)

(assert (=> b!1460062 m!1347287))

(assert (=> b!1460048 m!1347265))

(assert (=> b!1460048 m!1347265))

(declare-fun m!1347289 () Bool)

(assert (=> b!1460048 m!1347289))

(declare-fun m!1347291 () Bool)

(assert (=> b!1460054 m!1347291))

(assert (=> b!1460054 m!1347291))

(declare-fun m!1347293 () Bool)

(assert (=> b!1460054 m!1347293))

(assert (=> b!1460053 m!1347265))

(assert (=> b!1460053 m!1347265))

(declare-fun m!1347295 () Bool)

(assert (=> b!1460053 m!1347295))

(declare-fun m!1347297 () Bool)

(assert (=> b!1460051 m!1347297))

(assert (=> b!1460051 m!1347265))

(declare-fun m!1347299 () Bool)

(assert (=> b!1460060 m!1347299))

(declare-fun m!1347301 () Bool)

(assert (=> b!1460052 m!1347301))

(declare-fun m!1347303 () Bool)

(assert (=> b!1460052 m!1347303))

(declare-fun m!1347305 () Bool)

(assert (=> b!1460064 m!1347305))

(check-sat (not b!1460061) (not b!1460060) (not b!1460053) (not b!1460054) (not b!1460056) (not b!1460063) (not b!1460055) (not b!1460048) (not b!1460064) (not b!1460052) (not b!1460062) (not start!125170))
(check-sat)
