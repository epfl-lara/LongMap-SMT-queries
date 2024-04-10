; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125202 () Bool)

(assert start!125202)

(declare-fun b!1460294 () Bool)

(declare-fun e!821114 () Bool)

(declare-fun e!821119 () Bool)

(assert (=> b!1460294 (= e!821114 e!821119)))

(declare-fun res!990092 () Bool)

(assert (=> b!1460294 (=> (not res!990092) (not e!821119))))

(declare-datatypes ((SeekEntryResult!11865 0))(
  ( (MissingZero!11865 (index!49852 (_ BitVec 32))) (Found!11865 (index!49853 (_ BitVec 32))) (Intermediate!11865 (undefined!12677 Bool) (index!49854 (_ BitVec 32)) (x!131458 (_ BitVec 32))) (Undefined!11865) (MissingVacant!11865 (index!49855 (_ BitVec 32))) )
))
(declare-fun lt!639781 () SeekEntryResult!11865)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460294 (= res!990092 (= lt!639781 (Intermediate!11865 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639783 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98650 0))(
  ( (array!98651 (arr!47613 (Array (_ BitVec 32) (_ BitVec 64))) (size!48163 (_ BitVec 32))) )
))
(declare-fun lt!639779 () array!98650)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460294 (= lt!639781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639783 mask!2687) lt!639783 lt!639779 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98650)

(assert (=> b!1460294 (= lt!639783 (select (store (arr!47613 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460295 () Bool)

(declare-fun res!990087 () Bool)

(declare-fun e!821117 () Bool)

(assert (=> b!1460295 (=> (not res!990087) (not e!821117))))

(assert (=> b!1460295 (= res!990087 (and (= (size!48163 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48163 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48163 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460296 () Bool)

(declare-fun e!821118 () Bool)

(assert (=> b!1460296 (= e!821118 e!821114)))

(declare-fun res!990093 () Bool)

(assert (=> b!1460296 (=> (not res!990093) (not e!821114))))

(declare-fun lt!639782 () SeekEntryResult!11865)

(assert (=> b!1460296 (= res!990093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47613 a!2862) j!93) mask!2687) (select (arr!47613 a!2862) j!93) a!2862 mask!2687) lt!639782))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460296 (= lt!639782 (Intermediate!11865 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460297 () Bool)

(declare-fun res!990084 () Bool)

(assert (=> b!1460297 (=> (not res!990084) (not e!821119))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1460297 (= res!990084 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!990096 () Bool)

(assert (=> start!125202 (=> (not res!990096) (not e!821117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125202 (= res!990096 (validMask!0 mask!2687))))

(assert (=> start!125202 e!821117))

(assert (=> start!125202 true))

(declare-fun array_inv!36641 (array!98650) Bool)

(assert (=> start!125202 (array_inv!36641 a!2862)))

(declare-fun b!1460298 () Bool)

(declare-fun res!990089 () Bool)

(assert (=> b!1460298 (=> (not res!990089) (not e!821117))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460298 (= res!990089 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48163 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48163 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48163 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460299 () Bool)

(declare-fun res!990085 () Bool)

(assert (=> b!1460299 (=> (not res!990085) (not e!821119))))

(declare-fun e!821116 () Bool)

(assert (=> b!1460299 (= res!990085 e!821116)))

(declare-fun c!134616 () Bool)

(assert (=> b!1460299 (= c!134616 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460300 () Bool)

(assert (=> b!1460300 (= e!821117 e!821118)))

(declare-fun res!990095 () Bool)

(assert (=> b!1460300 (=> (not res!990095) (not e!821118))))

(assert (=> b!1460300 (= res!990095 (= (select (store (arr!47613 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460300 (= lt!639779 (array!98651 (store (arr!47613 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48163 a!2862)))))

(declare-fun b!1460301 () Bool)

(assert (=> b!1460301 (= e!821116 (= lt!639781 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639783 lt!639779 mask!2687)))))

(declare-fun b!1460302 () Bool)

(declare-fun res!990094 () Bool)

(assert (=> b!1460302 (=> (not res!990094) (not e!821114))))

(assert (=> b!1460302 (= res!990094 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47613 a!2862) j!93) a!2862 mask!2687) lt!639782))))

(declare-fun b!1460303 () Bool)

(declare-fun res!990086 () Bool)

(assert (=> b!1460303 (=> (not res!990086) (not e!821117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98650 (_ BitVec 32)) Bool)

(assert (=> b!1460303 (= res!990086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460304 () Bool)

(assert (=> b!1460304 (= e!821119 (not true))))

(declare-fun e!821115 () Bool)

(assert (=> b!1460304 e!821115))

(declare-fun res!990088 () Bool)

(assert (=> b!1460304 (=> (not res!990088) (not e!821115))))

(assert (=> b!1460304 (= res!990088 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49226 0))(
  ( (Unit!49227) )
))
(declare-fun lt!639780 () Unit!49226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49226)

(assert (=> b!1460304 (= lt!639780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460305 () Bool)

(declare-fun res!990090 () Bool)

(assert (=> b!1460305 (=> (not res!990090) (not e!821115))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11865)

(assert (=> b!1460305 (= res!990090 (= (seekEntryOrOpen!0 (select (arr!47613 a!2862) j!93) a!2862 mask!2687) (Found!11865 j!93)))))

(declare-fun b!1460306 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98650 (_ BitVec 32)) SeekEntryResult!11865)

(assert (=> b!1460306 (= e!821116 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639783 lt!639779 mask!2687) (seekEntryOrOpen!0 lt!639783 lt!639779 mask!2687)))))

(declare-fun b!1460307 () Bool)

(declare-fun res!990091 () Bool)

(assert (=> b!1460307 (=> (not res!990091) (not e!821117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460307 (= res!990091 (validKeyInArray!0 (select (arr!47613 a!2862) i!1006)))))

(declare-fun b!1460308 () Bool)

(declare-fun res!990083 () Bool)

(assert (=> b!1460308 (=> (not res!990083) (not e!821117))))

(declare-datatypes ((List!34114 0))(
  ( (Nil!34111) (Cons!34110 (h!35460 (_ BitVec 64)) (t!48808 List!34114)) )
))
(declare-fun arrayNoDuplicates!0 (array!98650 (_ BitVec 32) List!34114) Bool)

(assert (=> b!1460308 (= res!990083 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34111))))

(declare-fun b!1460309 () Bool)

(assert (=> b!1460309 (= e!821115 (or (= (select (arr!47613 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47613 a!2862) intermediateBeforeIndex!19) (select (arr!47613 a!2862) j!93))))))

(declare-fun b!1460310 () Bool)

(declare-fun res!990097 () Bool)

(assert (=> b!1460310 (=> (not res!990097) (not e!821117))))

(assert (=> b!1460310 (= res!990097 (validKeyInArray!0 (select (arr!47613 a!2862) j!93)))))

(assert (= (and start!125202 res!990096) b!1460295))

(assert (= (and b!1460295 res!990087) b!1460307))

(assert (= (and b!1460307 res!990091) b!1460310))

(assert (= (and b!1460310 res!990097) b!1460303))

(assert (= (and b!1460303 res!990086) b!1460308))

(assert (= (and b!1460308 res!990083) b!1460298))

(assert (= (and b!1460298 res!990089) b!1460300))

(assert (= (and b!1460300 res!990095) b!1460296))

(assert (= (and b!1460296 res!990093) b!1460302))

(assert (= (and b!1460302 res!990094) b!1460294))

(assert (= (and b!1460294 res!990092) b!1460299))

(assert (= (and b!1460299 c!134616) b!1460301))

(assert (= (and b!1460299 (not c!134616)) b!1460306))

(assert (= (and b!1460299 res!990085) b!1460297))

(assert (= (and b!1460297 res!990084) b!1460304))

(assert (= (and b!1460304 res!990088) b!1460305))

(assert (= (and b!1460305 res!990090) b!1460309))

(declare-fun m!1347983 () Bool)

(assert (=> b!1460309 m!1347983))

(declare-fun m!1347985 () Bool)

(assert (=> b!1460309 m!1347985))

(assert (=> b!1460310 m!1347985))

(assert (=> b!1460310 m!1347985))

(declare-fun m!1347987 () Bool)

(assert (=> b!1460310 m!1347987))

(declare-fun m!1347989 () Bool)

(assert (=> b!1460307 m!1347989))

(assert (=> b!1460307 m!1347989))

(declare-fun m!1347991 () Bool)

(assert (=> b!1460307 m!1347991))

(declare-fun m!1347993 () Bool)

(assert (=> b!1460301 m!1347993))

(declare-fun m!1347995 () Bool)

(assert (=> b!1460303 m!1347995))

(assert (=> b!1460296 m!1347985))

(assert (=> b!1460296 m!1347985))

(declare-fun m!1347997 () Bool)

(assert (=> b!1460296 m!1347997))

(assert (=> b!1460296 m!1347997))

(assert (=> b!1460296 m!1347985))

(declare-fun m!1347999 () Bool)

(assert (=> b!1460296 m!1347999))

(declare-fun m!1348001 () Bool)

(assert (=> b!1460304 m!1348001))

(declare-fun m!1348003 () Bool)

(assert (=> b!1460304 m!1348003))

(assert (=> b!1460305 m!1347985))

(assert (=> b!1460305 m!1347985))

(declare-fun m!1348005 () Bool)

(assert (=> b!1460305 m!1348005))

(declare-fun m!1348007 () Bool)

(assert (=> b!1460308 m!1348007))

(assert (=> b!1460302 m!1347985))

(assert (=> b!1460302 m!1347985))

(declare-fun m!1348009 () Bool)

(assert (=> b!1460302 m!1348009))

(declare-fun m!1348011 () Bool)

(assert (=> b!1460306 m!1348011))

(declare-fun m!1348013 () Bool)

(assert (=> b!1460306 m!1348013))

(declare-fun m!1348015 () Bool)

(assert (=> b!1460294 m!1348015))

(assert (=> b!1460294 m!1348015))

(declare-fun m!1348017 () Bool)

(assert (=> b!1460294 m!1348017))

(declare-fun m!1348019 () Bool)

(assert (=> b!1460294 m!1348019))

(declare-fun m!1348021 () Bool)

(assert (=> b!1460294 m!1348021))

(declare-fun m!1348023 () Bool)

(assert (=> start!125202 m!1348023))

(declare-fun m!1348025 () Bool)

(assert (=> start!125202 m!1348025))

(assert (=> b!1460300 m!1348019))

(declare-fun m!1348027 () Bool)

(assert (=> b!1460300 m!1348027))

(check-sat (not start!125202) (not b!1460306) (not b!1460305) (not b!1460307) (not b!1460296) (not b!1460303) (not b!1460302) (not b!1460308) (not b!1460294) (not b!1460301) (not b!1460310) (not b!1460304))
(check-sat)
