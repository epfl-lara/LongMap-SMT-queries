; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125326 () Bool)

(assert start!125326)

(declare-fun b!1464231 () Bool)

(declare-fun res!993351 () Bool)

(declare-fun e!822881 () Bool)

(assert (=> b!1464231 (=> (not res!993351) (not e!822881))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98774 0))(
  ( (array!98775 (arr!47675 (Array (_ BitVec 32) (_ BitVec 64))) (size!48225 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98774)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464231 (= res!993351 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48225 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48225 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48225 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464232 () Bool)

(declare-fun e!822887 () Bool)

(declare-fun e!822888 () Bool)

(assert (=> b!1464232 (= e!822887 e!822888)))

(declare-fun res!993349 () Bool)

(assert (=> b!1464232 (=> res!993349 e!822888)))

(declare-fun lt!641024 () (_ BitVec 32))

(assert (=> b!1464232 (= res!993349 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641024 #b00000000000000000000000000000000) (bvsge lt!641024 (size!48225 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464232 (= lt!641024 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!993354 () Bool)

(assert (=> start!125326 (=> (not res!993354) (not e!822881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125326 (= res!993354 (validMask!0 mask!2687))))

(assert (=> start!125326 e!822881))

(assert (=> start!125326 true))

(declare-fun array_inv!36703 (array!98774) Bool)

(assert (=> start!125326 (array_inv!36703 a!2862)))

(declare-fun b!1464233 () Bool)

(declare-fun res!993355 () Bool)

(declare-fun e!822884 () Bool)

(assert (=> b!1464233 (=> (not res!993355) (not e!822884))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11927 0))(
  ( (MissingZero!11927 (index!50100 (_ BitVec 32))) (Found!11927 (index!50101 (_ BitVec 32))) (Intermediate!11927 (undefined!12739 Bool) (index!50102 (_ BitVec 32)) (x!131688 (_ BitVec 32))) (Undefined!11927) (MissingVacant!11927 (index!50103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98774 (_ BitVec 32)) SeekEntryResult!11927)

(assert (=> b!1464233 (= res!993355 (= (seekEntryOrOpen!0 (select (arr!47675 a!2862) j!93) a!2862 mask!2687) (Found!11927 j!93)))))

(declare-fun e!822890 () Bool)

(declare-fun b!1464234 () Bool)

(declare-fun lt!641019 () array!98774)

(declare-fun lt!641020 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98774 (_ BitVec 32)) SeekEntryResult!11927)

(assert (=> b!1464234 (= e!822890 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641020 lt!641019 mask!2687) (seekEntryOrOpen!0 lt!641020 lt!641019 mask!2687)))))

(declare-fun b!1464235 () Bool)

(declare-fun res!993342 () Bool)

(assert (=> b!1464235 (=> (not res!993342) (not e!822881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464235 (= res!993342 (validKeyInArray!0 (select (arr!47675 a!2862) j!93)))))

(declare-fun b!1464236 () Bool)

(declare-fun res!993341 () Bool)

(assert (=> b!1464236 (=> (not res!993341) (not e!822881))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464236 (= res!993341 (and (= (size!48225 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48225 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48225 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464237 () Bool)

(declare-fun res!993343 () Bool)

(declare-fun e!822885 () Bool)

(assert (=> b!1464237 (=> (not res!993343) (not e!822885))))

(assert (=> b!1464237 (= res!993343 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464238 () Bool)

(declare-fun res!993347 () Bool)

(assert (=> b!1464238 (=> (not res!993347) (not e!822881))))

(declare-datatypes ((List!34176 0))(
  ( (Nil!34173) (Cons!34172 (h!35522 (_ BitVec 64)) (t!48870 List!34176)) )
))
(declare-fun arrayNoDuplicates!0 (array!98774 (_ BitVec 32) List!34176) Bool)

(assert (=> b!1464238 (= res!993347 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34173))))

(declare-fun b!1464239 () Bool)

(assert (=> b!1464239 (= e!822888 true)))

(declare-fun lt!641022 () Bool)

(declare-fun e!822883 () Bool)

(assert (=> b!1464239 (= lt!641022 e!822883)))

(declare-fun c!134957 () Bool)

(assert (=> b!1464239 (= c!134957 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464240 () Bool)

(declare-fun e!822889 () Bool)

(declare-fun e!822882 () Bool)

(assert (=> b!1464240 (= e!822889 e!822882)))

(declare-fun res!993352 () Bool)

(assert (=> b!1464240 (=> (not res!993352) (not e!822882))))

(declare-fun lt!641023 () SeekEntryResult!11927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98774 (_ BitVec 32)) SeekEntryResult!11927)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464240 (= res!993352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47675 a!2862) j!93) mask!2687) (select (arr!47675 a!2862) j!93) a!2862 mask!2687) lt!641023))))

(assert (=> b!1464240 (= lt!641023 (Intermediate!11927 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464241 () Bool)

(assert (=> b!1464241 (= e!822882 e!822885)))

(declare-fun res!993353 () Bool)

(assert (=> b!1464241 (=> (not res!993353) (not e!822885))))

(declare-fun lt!641021 () SeekEntryResult!11927)

(assert (=> b!1464241 (= res!993353 (= lt!641021 (Intermediate!11927 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464241 (= lt!641021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641020 mask!2687) lt!641020 lt!641019 mask!2687))))

(assert (=> b!1464241 (= lt!641020 (select (store (arr!47675 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464242 () Bool)

(declare-fun res!993339 () Bool)

(assert (=> b!1464242 (=> (not res!993339) (not e!822885))))

(assert (=> b!1464242 (= res!993339 e!822890)))

(declare-fun c!134958 () Bool)

(assert (=> b!1464242 (= c!134958 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464243 () Bool)

(declare-fun res!993348 () Bool)

(assert (=> b!1464243 (=> (not res!993348) (not e!822881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98774 (_ BitVec 32)) Bool)

(assert (=> b!1464243 (= res!993348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464244 () Bool)

(assert (=> b!1464244 (= e!822883 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641024 intermediateAfterIndex!19 lt!641020 lt!641019 mask!2687) (seekEntryOrOpen!0 lt!641020 lt!641019 mask!2687))))))

(declare-fun b!1464245 () Bool)

(declare-fun res!993350 () Bool)

(assert (=> b!1464245 (=> (not res!993350) (not e!822881))))

(assert (=> b!1464245 (= res!993350 (validKeyInArray!0 (select (arr!47675 a!2862) i!1006)))))

(declare-fun b!1464246 () Bool)

(declare-fun res!993345 () Bool)

(assert (=> b!1464246 (=> (not res!993345) (not e!822882))))

(assert (=> b!1464246 (= res!993345 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47675 a!2862) j!93) a!2862 mask!2687) lt!641023))))

(declare-fun b!1464247 () Bool)

(declare-fun res!993346 () Bool)

(assert (=> b!1464247 (=> res!993346 e!822888)))

(assert (=> b!1464247 (= res!993346 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641024 (select (arr!47675 a!2862) j!93) a!2862 mask!2687) lt!641023)))))

(declare-fun b!1464248 () Bool)

(assert (=> b!1464248 (= e!822890 (= lt!641021 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641020 lt!641019 mask!2687)))))

(declare-fun b!1464249 () Bool)

(assert (=> b!1464249 (= e!822884 (or (= (select (arr!47675 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47675 a!2862) intermediateBeforeIndex!19) (select (arr!47675 a!2862) j!93))))))

(declare-fun b!1464250 () Bool)

(assert (=> b!1464250 (= e!822881 e!822889)))

(declare-fun res!993344 () Bool)

(assert (=> b!1464250 (=> (not res!993344) (not e!822889))))

(assert (=> b!1464250 (= res!993344 (= (select (store (arr!47675 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464250 (= lt!641019 (array!98775 (store (arr!47675 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48225 a!2862)))))

(declare-fun b!1464251 () Bool)

(assert (=> b!1464251 (= e!822883 (not (= lt!641021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641024 lt!641020 lt!641019 mask!2687))))))

(declare-fun b!1464252 () Bool)

(assert (=> b!1464252 (= e!822885 (not e!822887))))

(declare-fun res!993340 () Bool)

(assert (=> b!1464252 (=> res!993340 e!822887)))

(assert (=> b!1464252 (= res!993340 (or (and (= (select (arr!47675 a!2862) index!646) (select (store (arr!47675 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47675 a!2862) index!646) (select (arr!47675 a!2862) j!93))) (= (select (arr!47675 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464252 e!822884))

(declare-fun res!993338 () Bool)

(assert (=> b!1464252 (=> (not res!993338) (not e!822884))))

(assert (=> b!1464252 (= res!993338 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49350 0))(
  ( (Unit!49351) )
))
(declare-fun lt!641025 () Unit!49350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49350)

(assert (=> b!1464252 (= lt!641025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125326 res!993354) b!1464236))

(assert (= (and b!1464236 res!993341) b!1464245))

(assert (= (and b!1464245 res!993350) b!1464235))

(assert (= (and b!1464235 res!993342) b!1464243))

(assert (= (and b!1464243 res!993348) b!1464238))

(assert (= (and b!1464238 res!993347) b!1464231))

(assert (= (and b!1464231 res!993351) b!1464250))

(assert (= (and b!1464250 res!993344) b!1464240))

(assert (= (and b!1464240 res!993352) b!1464246))

(assert (= (and b!1464246 res!993345) b!1464241))

(assert (= (and b!1464241 res!993353) b!1464242))

(assert (= (and b!1464242 c!134958) b!1464248))

(assert (= (and b!1464242 (not c!134958)) b!1464234))

(assert (= (and b!1464242 res!993339) b!1464237))

(assert (= (and b!1464237 res!993343) b!1464252))

(assert (= (and b!1464252 res!993338) b!1464233))

(assert (= (and b!1464233 res!993355) b!1464249))

(assert (= (and b!1464252 (not res!993340)) b!1464232))

(assert (= (and b!1464232 (not res!993349)) b!1464247))

(assert (= (and b!1464247 (not res!993346)) b!1464239))

(assert (= (and b!1464239 c!134957) b!1464251))

(assert (= (and b!1464239 (not c!134957)) b!1464244))

(declare-fun m!1351471 () Bool)

(assert (=> b!1464243 m!1351471))

(declare-fun m!1351473 () Bool)

(assert (=> b!1464234 m!1351473))

(declare-fun m!1351475 () Bool)

(assert (=> b!1464234 m!1351475))

(declare-fun m!1351477 () Bool)

(assert (=> b!1464248 m!1351477))

(declare-fun m!1351479 () Bool)

(assert (=> b!1464251 m!1351479))

(declare-fun m!1351481 () Bool)

(assert (=> b!1464238 m!1351481))

(declare-fun m!1351483 () Bool)

(assert (=> b!1464233 m!1351483))

(assert (=> b!1464233 m!1351483))

(declare-fun m!1351485 () Bool)

(assert (=> b!1464233 m!1351485))

(declare-fun m!1351487 () Bool)

(assert (=> b!1464252 m!1351487))

(declare-fun m!1351489 () Bool)

(assert (=> b!1464252 m!1351489))

(declare-fun m!1351491 () Bool)

(assert (=> b!1464252 m!1351491))

(declare-fun m!1351493 () Bool)

(assert (=> b!1464252 m!1351493))

(declare-fun m!1351495 () Bool)

(assert (=> b!1464252 m!1351495))

(assert (=> b!1464252 m!1351483))

(declare-fun m!1351497 () Bool)

(assert (=> b!1464241 m!1351497))

(assert (=> b!1464241 m!1351497))

(declare-fun m!1351499 () Bool)

(assert (=> b!1464241 m!1351499))

(assert (=> b!1464241 m!1351489))

(declare-fun m!1351501 () Bool)

(assert (=> b!1464241 m!1351501))

(declare-fun m!1351503 () Bool)

(assert (=> b!1464232 m!1351503))

(declare-fun m!1351505 () Bool)

(assert (=> start!125326 m!1351505))

(declare-fun m!1351507 () Bool)

(assert (=> start!125326 m!1351507))

(declare-fun m!1351509 () Bool)

(assert (=> b!1464249 m!1351509))

(assert (=> b!1464249 m!1351483))

(assert (=> b!1464250 m!1351489))

(declare-fun m!1351511 () Bool)

(assert (=> b!1464250 m!1351511))

(assert (=> b!1464240 m!1351483))

(assert (=> b!1464240 m!1351483))

(declare-fun m!1351513 () Bool)

(assert (=> b!1464240 m!1351513))

(assert (=> b!1464240 m!1351513))

(assert (=> b!1464240 m!1351483))

(declare-fun m!1351515 () Bool)

(assert (=> b!1464240 m!1351515))

(assert (=> b!1464235 m!1351483))

(assert (=> b!1464235 m!1351483))

(declare-fun m!1351517 () Bool)

(assert (=> b!1464235 m!1351517))

(declare-fun m!1351519 () Bool)

(assert (=> b!1464245 m!1351519))

(assert (=> b!1464245 m!1351519))

(declare-fun m!1351521 () Bool)

(assert (=> b!1464245 m!1351521))

(declare-fun m!1351523 () Bool)

(assert (=> b!1464244 m!1351523))

(assert (=> b!1464244 m!1351475))

(assert (=> b!1464246 m!1351483))

(assert (=> b!1464246 m!1351483))

(declare-fun m!1351525 () Bool)

(assert (=> b!1464246 m!1351525))

(assert (=> b!1464247 m!1351483))

(assert (=> b!1464247 m!1351483))

(declare-fun m!1351527 () Bool)

(assert (=> b!1464247 m!1351527))

(push 1)

