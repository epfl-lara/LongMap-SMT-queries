; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124774 () Bool)

(assert start!124774)

(declare-fun b!1447287 () Bool)

(declare-fun res!978967 () Bool)

(declare-fun e!815112 () Bool)

(assert (=> b!1447287 (=> (not res!978967) (not e!815112))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98222 0))(
  ( (array!98223 (arr!47399 (Array (_ BitVec 32) (_ BitVec 64))) (size!47949 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98222)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11651 0))(
  ( (MissingZero!11651 (index!48996 (_ BitVec 32))) (Found!11651 (index!48997 (_ BitVec 32))) (Intermediate!11651 (undefined!12463 Bool) (index!48998 (_ BitVec 32)) (x!130676 (_ BitVec 32))) (Undefined!11651) (MissingVacant!11651 (index!48999 (_ BitVec 32))) )
))
(declare-fun lt!635109 () SeekEntryResult!11651)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98222 (_ BitVec 32)) SeekEntryResult!11651)

(assert (=> b!1447287 (= res!978967 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47399 a!2862) j!93) a!2862 mask!2687) lt!635109))))

(declare-fun b!1447288 () Bool)

(declare-fun res!978965 () Bool)

(declare-fun e!815107 () Bool)

(assert (=> b!1447288 (=> (not res!978965) (not e!815107))))

(declare-fun e!815111 () Bool)

(assert (=> b!1447288 (= res!978965 e!815111)))

(declare-fun c!133677 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447288 (= c!133677 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447290 () Bool)

(declare-fun e!815113 () Bool)

(declare-fun e!815105 () Bool)

(assert (=> b!1447290 (= e!815113 e!815105)))

(declare-fun res!978957 () Bool)

(assert (=> b!1447290 (=> res!978957 e!815105)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447290 (= res!978957 (or (and (= (select (arr!47399 a!2862) index!646) (select (store (arr!47399 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47399 a!2862) index!646) (select (arr!47399 a!2862) j!93))) (not (= (select (arr!47399 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447291 () Bool)

(declare-fun e!815109 () Bool)

(assert (=> b!1447291 (= e!815109 e!815112)))

(declare-fun res!978954 () Bool)

(assert (=> b!1447291 (=> (not res!978954) (not e!815112))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447291 (= res!978954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47399 a!2862) j!93) mask!2687) (select (arr!47399 a!2862) j!93) a!2862 mask!2687) lt!635109))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447291 (= lt!635109 (Intermediate!11651 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447292 () Bool)

(declare-fun res!978958 () Bool)

(declare-fun e!815108 () Bool)

(assert (=> b!1447292 (=> (not res!978958) (not e!815108))))

(declare-datatypes ((List!33900 0))(
  ( (Nil!33897) (Cons!33896 (h!35246 (_ BitVec 64)) (t!48594 List!33900)) )
))
(declare-fun arrayNoDuplicates!0 (array!98222 (_ BitVec 32) List!33900) Bool)

(assert (=> b!1447292 (= res!978958 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33897))))

(declare-fun b!1447293 () Bool)

(declare-fun res!978960 () Bool)

(assert (=> b!1447293 (=> (not res!978960) (not e!815108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447293 (= res!978960 (validKeyInArray!0 (select (arr!47399 a!2862) i!1006)))))

(declare-fun b!1447294 () Bool)

(declare-fun res!978970 () Bool)

(assert (=> b!1447294 (=> (not res!978970) (not e!815108))))

(assert (=> b!1447294 (= res!978970 (and (= (size!47949 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47949 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47949 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447295 () Bool)

(declare-fun res!978961 () Bool)

(assert (=> b!1447295 (=> (not res!978961) (not e!815108))))

(assert (=> b!1447295 (= res!978961 (validKeyInArray!0 (select (arr!47399 a!2862) j!93)))))

(declare-fun b!1447296 () Bool)

(assert (=> b!1447296 (= e!815112 e!815107)))

(declare-fun res!978963 () Bool)

(assert (=> b!1447296 (=> (not res!978963) (not e!815107))))

(declare-fun lt!635106 () SeekEntryResult!11651)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447296 (= res!978963 (= lt!635106 (Intermediate!11651 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635112 () array!98222)

(declare-fun lt!635110 () (_ BitVec 64))

(assert (=> b!1447296 (= lt!635106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635110 mask!2687) lt!635110 lt!635112 mask!2687))))

(assert (=> b!1447296 (= lt!635110 (select (store (arr!47399 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!978959 () Bool)

(assert (=> start!124774 (=> (not res!978959) (not e!815108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124774 (= res!978959 (validMask!0 mask!2687))))

(assert (=> start!124774 e!815108))

(assert (=> start!124774 true))

(declare-fun array_inv!36427 (array!98222) Bool)

(assert (=> start!124774 (array_inv!36427 a!2862)))

(declare-fun b!1447289 () Bool)

(declare-fun e!815114 () Bool)

(assert (=> b!1447289 (= e!815105 e!815114)))

(declare-fun res!978966 () Bool)

(assert (=> b!1447289 (=> (not res!978966) (not e!815114))))

(declare-fun lt!635111 () SeekEntryResult!11651)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98222 (_ BitVec 32)) SeekEntryResult!11651)

(assert (=> b!1447289 (= res!978966 (= lt!635111 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47399 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447297 () Bool)

(declare-fun res!978964 () Bool)

(assert (=> b!1447297 (=> (not res!978964) (not e!815107))))

(assert (=> b!1447297 (= res!978964 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447298 () Bool)

(assert (=> b!1447298 (= e!815114 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447299 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98222 (_ BitVec 32)) SeekEntryResult!11651)

(assert (=> b!1447299 (= e!815111 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635110 lt!635112 mask!2687) (seekEntryOrOpen!0 lt!635110 lt!635112 mask!2687)))))

(declare-fun b!1447300 () Bool)

(declare-fun e!815106 () Bool)

(assert (=> b!1447300 (= e!815106 true)))

(declare-fun lt!635108 () SeekEntryResult!11651)

(assert (=> b!1447300 (= lt!635108 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47399 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447301 () Bool)

(declare-fun res!978955 () Bool)

(assert (=> b!1447301 (=> (not res!978955) (not e!815108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98222 (_ BitVec 32)) Bool)

(assert (=> b!1447301 (= res!978955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447302 () Bool)

(assert (=> b!1447302 (= e!815107 (not e!815106))))

(declare-fun res!978969 () Bool)

(assert (=> b!1447302 (=> res!978969 e!815106)))

(assert (=> b!1447302 (= res!978969 (or (and (= (select (arr!47399 a!2862) index!646) (select (store (arr!47399 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47399 a!2862) index!646) (select (arr!47399 a!2862) j!93))) (not (= (select (arr!47399 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47399 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447302 e!815113))

(declare-fun res!978962 () Bool)

(assert (=> b!1447302 (=> (not res!978962) (not e!815113))))

(assert (=> b!1447302 (= res!978962 (and (= lt!635111 (Found!11651 j!93)) (or (= (select (arr!47399 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47399 a!2862) intermediateBeforeIndex!19) (select (arr!47399 a!2862) j!93)))))))

(assert (=> b!1447302 (= lt!635111 (seekEntryOrOpen!0 (select (arr!47399 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447302 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48798 0))(
  ( (Unit!48799) )
))
(declare-fun lt!635107 () Unit!48798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48798)

(assert (=> b!1447302 (= lt!635107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447303 () Bool)

(assert (=> b!1447303 (= e!815111 (= lt!635106 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635110 lt!635112 mask!2687)))))

(declare-fun b!1447304 () Bool)

(assert (=> b!1447304 (= e!815108 e!815109)))

(declare-fun res!978968 () Bool)

(assert (=> b!1447304 (=> (not res!978968) (not e!815109))))

(assert (=> b!1447304 (= res!978968 (= (select (store (arr!47399 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447304 (= lt!635112 (array!98223 (store (arr!47399 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47949 a!2862)))))

(declare-fun b!1447305 () Bool)

(declare-fun res!978956 () Bool)

(assert (=> b!1447305 (=> (not res!978956) (not e!815108))))

(assert (=> b!1447305 (= res!978956 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47949 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47949 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47949 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124774 res!978959) b!1447294))

(assert (= (and b!1447294 res!978970) b!1447293))

(assert (= (and b!1447293 res!978960) b!1447295))

(assert (= (and b!1447295 res!978961) b!1447301))

(assert (= (and b!1447301 res!978955) b!1447292))

(assert (= (and b!1447292 res!978958) b!1447305))

(assert (= (and b!1447305 res!978956) b!1447304))

(assert (= (and b!1447304 res!978968) b!1447291))

(assert (= (and b!1447291 res!978954) b!1447287))

(assert (= (and b!1447287 res!978967) b!1447296))

(assert (= (and b!1447296 res!978963) b!1447288))

(assert (= (and b!1447288 c!133677) b!1447303))

(assert (= (and b!1447288 (not c!133677)) b!1447299))

(assert (= (and b!1447288 res!978965) b!1447297))

(assert (= (and b!1447297 res!978964) b!1447302))

(assert (= (and b!1447302 res!978962) b!1447290))

(assert (= (and b!1447290 (not res!978957)) b!1447289))

(assert (= (and b!1447289 res!978966) b!1447298))

(assert (= (and b!1447302 (not res!978969)) b!1447300))

(declare-fun m!1336111 () Bool)

(assert (=> b!1447287 m!1336111))

(assert (=> b!1447287 m!1336111))

(declare-fun m!1336113 () Bool)

(assert (=> b!1447287 m!1336113))

(declare-fun m!1336115 () Bool)

(assert (=> b!1447302 m!1336115))

(declare-fun m!1336117 () Bool)

(assert (=> b!1447302 m!1336117))

(declare-fun m!1336119 () Bool)

(assert (=> b!1447302 m!1336119))

(declare-fun m!1336121 () Bool)

(assert (=> b!1447302 m!1336121))

(declare-fun m!1336123 () Bool)

(assert (=> b!1447302 m!1336123))

(assert (=> b!1447302 m!1336111))

(declare-fun m!1336125 () Bool)

(assert (=> b!1447302 m!1336125))

(declare-fun m!1336127 () Bool)

(assert (=> b!1447302 m!1336127))

(assert (=> b!1447302 m!1336111))

(assert (=> b!1447291 m!1336111))

(assert (=> b!1447291 m!1336111))

(declare-fun m!1336129 () Bool)

(assert (=> b!1447291 m!1336129))

(assert (=> b!1447291 m!1336129))

(assert (=> b!1447291 m!1336111))

(declare-fun m!1336131 () Bool)

(assert (=> b!1447291 m!1336131))

(assert (=> b!1447289 m!1336111))

(assert (=> b!1447289 m!1336111))

(declare-fun m!1336133 () Bool)

(assert (=> b!1447289 m!1336133))

(assert (=> b!1447304 m!1336117))

(declare-fun m!1336135 () Bool)

(assert (=> b!1447304 m!1336135))

(assert (=> b!1447300 m!1336111))

(assert (=> b!1447300 m!1336111))

(declare-fun m!1336137 () Bool)

(assert (=> b!1447300 m!1336137))

(declare-fun m!1336139 () Bool)

(assert (=> b!1447293 m!1336139))

(assert (=> b!1447293 m!1336139))

(declare-fun m!1336141 () Bool)

(assert (=> b!1447293 m!1336141))

(declare-fun m!1336143 () Bool)

(assert (=> b!1447296 m!1336143))

(assert (=> b!1447296 m!1336143))

(declare-fun m!1336145 () Bool)

(assert (=> b!1447296 m!1336145))

(assert (=> b!1447296 m!1336117))

(declare-fun m!1336147 () Bool)

(assert (=> b!1447296 m!1336147))

(declare-fun m!1336149 () Bool)

(assert (=> b!1447301 m!1336149))

(declare-fun m!1336151 () Bool)

(assert (=> b!1447303 m!1336151))

(declare-fun m!1336153 () Bool)

(assert (=> start!124774 m!1336153))

(declare-fun m!1336155 () Bool)

(assert (=> start!124774 m!1336155))

(declare-fun m!1336157 () Bool)

(assert (=> b!1447299 m!1336157))

(declare-fun m!1336159 () Bool)

(assert (=> b!1447299 m!1336159))

(assert (=> b!1447290 m!1336123))

(assert (=> b!1447290 m!1336117))

(assert (=> b!1447290 m!1336121))

(assert (=> b!1447290 m!1336111))

(assert (=> b!1447295 m!1336111))

(assert (=> b!1447295 m!1336111))

(declare-fun m!1336161 () Bool)

(assert (=> b!1447295 m!1336161))

(declare-fun m!1336163 () Bool)

(assert (=> b!1447292 m!1336163))

(push 1)

