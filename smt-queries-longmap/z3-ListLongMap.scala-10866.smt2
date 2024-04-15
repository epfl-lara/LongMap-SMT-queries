; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127322 () Bool)

(assert start!127322)

(declare-fun b!1496949 () Bool)

(declare-fun res!1018347 () Bool)

(declare-fun e!838298 () Bool)

(assert (=> b!1496949 (=> (not res!1018347) (not e!838298))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496949 (= res!1018347 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496951 () Bool)

(declare-fun res!1018332 () Bool)

(declare-fun e!838300 () Bool)

(assert (=> b!1496951 (=> (not res!1018332) (not e!838300))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99778 0))(
  ( (array!99779 (arr!48154 (Array (_ BitVec 32) (_ BitVec 64))) (size!48706 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99778)

(assert (=> b!1496951 (= res!1018332 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48706 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48706 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48706 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!838297 () Bool)

(declare-fun b!1496952 () Bool)

(declare-fun lt!652105 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!652106 () array!99778)

(declare-fun lt!652103 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12419 0))(
  ( (MissingZero!12419 (index!52068 (_ BitVec 32))) (Found!12419 (index!52069 (_ BitVec 32))) (Intermediate!12419 (undefined!13231 Bool) (index!52070 (_ BitVec 32)) (x!133688 (_ BitVec 32))) (Undefined!12419) (MissingVacant!12419 (index!52071 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12419)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1496952 (= e!838297 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 intermediateAfterIndex!19 lt!652105 lt!652106 mask!2687) (seekEntryOrOpen!0 lt!652105 lt!652106 mask!2687))))))

(declare-fun b!1496953 () Bool)

(declare-fun e!838294 () Bool)

(assert (=> b!1496953 (= e!838294 true)))

(declare-fun lt!652099 () SeekEntryResult!12419)

(assert (=> b!1496953 (= lt!652099 (seekEntryOrOpen!0 lt!652105 lt!652106 mask!2687))))

(declare-datatypes ((Unit!50019 0))(
  ( (Unit!50020) )
))
(declare-fun lt!652104 () Unit!50019)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50019)

(assert (=> b!1496953 (= lt!652104 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496954 () Bool)

(declare-fun res!1018340 () Bool)

(assert (=> b!1496954 (=> (not res!1018340) (not e!838300))))

(declare-datatypes ((List!34733 0))(
  ( (Nil!34730) (Cons!34729 (h!36127 (_ BitVec 64)) (t!49419 List!34733)) )
))
(declare-fun arrayNoDuplicates!0 (array!99778 (_ BitVec 32) List!34733) Bool)

(assert (=> b!1496954 (= res!1018340 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34730))))

(declare-fun b!1496955 () Bool)

(declare-fun res!1018333 () Bool)

(assert (=> b!1496955 (=> (not res!1018333) (not e!838300))))

(assert (=> b!1496955 (= res!1018333 (and (= (size!48706 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48706 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48706 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496956 () Bool)

(declare-fun res!1018341 () Bool)

(assert (=> b!1496956 (=> (not res!1018341) (not e!838300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496956 (= res!1018341 (validKeyInArray!0 (select (arr!48154 a!2862) i!1006)))))

(declare-fun b!1496957 () Bool)

(declare-fun res!1018337 () Bool)

(assert (=> b!1496957 (=> res!1018337 e!838294)))

(declare-fun lt!652100 () SeekEntryResult!12419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1496957 (= res!1018337 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!652100)))))

(declare-fun e!838299 () Bool)

(declare-fun b!1496958 () Bool)

(assert (=> b!1496958 (= e!838299 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652105 lt!652106 mask!2687) (seekEntryOrOpen!0 lt!652105 lt!652106 mask!2687)))))

(declare-fun b!1496959 () Bool)

(declare-fun e!838296 () Bool)

(assert (=> b!1496959 (= e!838300 e!838296)))

(declare-fun res!1018343 () Bool)

(assert (=> b!1496959 (=> (not res!1018343) (not e!838296))))

(assert (=> b!1496959 (= res!1018343 (= (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496959 (= lt!652106 (array!99779 (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48706 a!2862)))))

(declare-fun b!1496960 () Bool)

(declare-fun res!1018342 () Bool)

(assert (=> b!1496960 (=> res!1018342 e!838294)))

(assert (=> b!1496960 (= res!1018342 e!838297)))

(declare-fun c!138846 () Bool)

(assert (=> b!1496960 (= c!138846 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1018335 () Bool)

(assert (=> start!127322 (=> (not res!1018335) (not e!838300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127322 (= res!1018335 (validMask!0 mask!2687))))

(assert (=> start!127322 e!838300))

(assert (=> start!127322 true))

(declare-fun array_inv!37387 (array!99778) Bool)

(assert (=> start!127322 (array_inv!37387 a!2862)))

(declare-fun b!1496950 () Bool)

(declare-fun lt!652101 () SeekEntryResult!12419)

(assert (=> b!1496950 (= e!838297 (not (= lt!652101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652103 lt!652105 lt!652106 mask!2687))))))

(declare-fun b!1496961 () Bool)

(assert (=> b!1496961 (= e!838299 (= lt!652101 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652105 lt!652106 mask!2687)))))

(declare-fun b!1496962 () Bool)

(declare-fun e!838293 () Bool)

(assert (=> b!1496962 (= e!838296 e!838293)))

(declare-fun res!1018334 () Bool)

(assert (=> b!1496962 (=> (not res!1018334) (not e!838293))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496962 (= res!1018334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!652100))))

(assert (=> b!1496962 (= lt!652100 (Intermediate!12419 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496963 () Bool)

(declare-fun e!838301 () Bool)

(assert (=> b!1496963 (= e!838301 e!838294)))

(declare-fun res!1018339 () Bool)

(assert (=> b!1496963 (=> res!1018339 e!838294)))

(assert (=> b!1496963 (= res!1018339 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652103 #b00000000000000000000000000000000) (bvsge lt!652103 (size!48706 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496963 (= lt!652103 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496964 () Bool)

(declare-fun res!1018336 () Bool)

(assert (=> b!1496964 (=> (not res!1018336) (not e!838293))))

(assert (=> b!1496964 (= res!1018336 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!652100))))

(declare-fun b!1496965 () Bool)

(declare-fun res!1018338 () Bool)

(assert (=> b!1496965 (=> (not res!1018338) (not e!838298))))

(assert (=> b!1496965 (= res!1018338 e!838299)))

(declare-fun c!138847 () Bool)

(assert (=> b!1496965 (= c!138847 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496966 () Bool)

(declare-fun res!1018348 () Bool)

(assert (=> b!1496966 (=> (not res!1018348) (not e!838300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99778 (_ BitVec 32)) Bool)

(assert (=> b!1496966 (= res!1018348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496967 () Bool)

(assert (=> b!1496967 (= e!838293 e!838298)))

(declare-fun res!1018345 () Bool)

(assert (=> b!1496967 (=> (not res!1018345) (not e!838298))))

(assert (=> b!1496967 (= res!1018345 (= lt!652101 (Intermediate!12419 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496967 (= lt!652101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652105 mask!2687) lt!652105 lt!652106 mask!2687))))

(assert (=> b!1496967 (= lt!652105 (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496968 () Bool)

(declare-fun res!1018331 () Bool)

(assert (=> b!1496968 (=> (not res!1018331) (not e!838300))))

(assert (=> b!1496968 (= res!1018331 (validKeyInArray!0 (select (arr!48154 a!2862) j!93)))))

(declare-fun b!1496969 () Bool)

(assert (=> b!1496969 (= e!838298 (not e!838301))))

(declare-fun res!1018346 () Bool)

(assert (=> b!1496969 (=> res!1018346 e!838301)))

(assert (=> b!1496969 (= res!1018346 (or (and (= (select (arr!48154 a!2862) index!646) (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48154 a!2862) index!646) (select (arr!48154 a!2862) j!93))) (= (select (arr!48154 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496969 (and (= lt!652099 (Found!12419 j!93)) (or (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) (select (arr!48154 a!2862) j!93))))))

(assert (=> b!1496969 (= lt!652099 (seekEntryOrOpen!0 (select (arr!48154 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496969 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652102 () Unit!50019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50019)

(assert (=> b!1496969 (= lt!652102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496970 () Bool)

(declare-fun res!1018344 () Bool)

(assert (=> b!1496970 (=> res!1018344 e!838294)))

(assert (=> b!1496970 (= res!1018344 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(assert (= (and start!127322 res!1018335) b!1496955))

(assert (= (and b!1496955 res!1018333) b!1496956))

(assert (= (and b!1496956 res!1018341) b!1496968))

(assert (= (and b!1496968 res!1018331) b!1496966))

(assert (= (and b!1496966 res!1018348) b!1496954))

(assert (= (and b!1496954 res!1018340) b!1496951))

(assert (= (and b!1496951 res!1018332) b!1496959))

(assert (= (and b!1496959 res!1018343) b!1496962))

(assert (= (and b!1496962 res!1018334) b!1496964))

(assert (= (and b!1496964 res!1018336) b!1496967))

(assert (= (and b!1496967 res!1018345) b!1496965))

(assert (= (and b!1496965 c!138847) b!1496961))

(assert (= (and b!1496965 (not c!138847)) b!1496958))

(assert (= (and b!1496965 res!1018338) b!1496949))

(assert (= (and b!1496949 res!1018347) b!1496969))

(assert (= (and b!1496969 (not res!1018346)) b!1496963))

(assert (= (and b!1496963 (not res!1018339)) b!1496957))

(assert (= (and b!1496957 (not res!1018337)) b!1496960))

(assert (= (and b!1496960 c!138846) b!1496950))

(assert (= (and b!1496960 (not c!138846)) b!1496952))

(assert (= (and b!1496960 (not res!1018342)) b!1496970))

(assert (= (and b!1496970 (not res!1018344)) b!1496953))

(declare-fun m!1379505 () Bool)

(assert (=> b!1496953 m!1379505))

(declare-fun m!1379507 () Bool)

(assert (=> b!1496953 m!1379507))

(declare-fun m!1379509 () Bool)

(assert (=> b!1496954 m!1379509))

(declare-fun m!1379511 () Bool)

(assert (=> b!1496968 m!1379511))

(assert (=> b!1496968 m!1379511))

(declare-fun m!1379513 () Bool)

(assert (=> b!1496968 m!1379513))

(declare-fun m!1379515 () Bool)

(assert (=> b!1496956 m!1379515))

(assert (=> b!1496956 m!1379515))

(declare-fun m!1379517 () Bool)

(assert (=> b!1496956 m!1379517))

(declare-fun m!1379519 () Bool)

(assert (=> b!1496959 m!1379519))

(declare-fun m!1379521 () Bool)

(assert (=> b!1496959 m!1379521))

(assert (=> b!1496964 m!1379511))

(assert (=> b!1496964 m!1379511))

(declare-fun m!1379523 () Bool)

(assert (=> b!1496964 m!1379523))

(assert (=> b!1496962 m!1379511))

(assert (=> b!1496962 m!1379511))

(declare-fun m!1379525 () Bool)

(assert (=> b!1496962 m!1379525))

(assert (=> b!1496962 m!1379525))

(assert (=> b!1496962 m!1379511))

(declare-fun m!1379527 () Bool)

(assert (=> b!1496962 m!1379527))

(declare-fun m!1379529 () Bool)

(assert (=> b!1496963 m!1379529))

(declare-fun m!1379531 () Bool)

(assert (=> start!127322 m!1379531))

(declare-fun m!1379533 () Bool)

(assert (=> start!127322 m!1379533))

(declare-fun m!1379535 () Bool)

(assert (=> b!1496961 m!1379535))

(declare-fun m!1379537 () Bool)

(assert (=> b!1496966 m!1379537))

(declare-fun m!1379539 () Bool)

(assert (=> b!1496950 m!1379539))

(declare-fun m!1379541 () Bool)

(assert (=> b!1496969 m!1379541))

(assert (=> b!1496969 m!1379519))

(declare-fun m!1379543 () Bool)

(assert (=> b!1496969 m!1379543))

(declare-fun m!1379545 () Bool)

(assert (=> b!1496969 m!1379545))

(declare-fun m!1379547 () Bool)

(assert (=> b!1496969 m!1379547))

(assert (=> b!1496969 m!1379511))

(declare-fun m!1379549 () Bool)

(assert (=> b!1496969 m!1379549))

(declare-fun m!1379551 () Bool)

(assert (=> b!1496969 m!1379551))

(assert (=> b!1496969 m!1379511))

(declare-fun m!1379553 () Bool)

(assert (=> b!1496952 m!1379553))

(assert (=> b!1496952 m!1379505))

(assert (=> b!1496957 m!1379511))

(assert (=> b!1496957 m!1379511))

(declare-fun m!1379555 () Bool)

(assert (=> b!1496957 m!1379555))

(declare-fun m!1379557 () Bool)

(assert (=> b!1496967 m!1379557))

(assert (=> b!1496967 m!1379557))

(declare-fun m!1379559 () Bool)

(assert (=> b!1496967 m!1379559))

(assert (=> b!1496967 m!1379519))

(declare-fun m!1379561 () Bool)

(assert (=> b!1496967 m!1379561))

(declare-fun m!1379563 () Bool)

(assert (=> b!1496958 m!1379563))

(assert (=> b!1496958 m!1379505))

(check-sat (not b!1496956) (not b!1496967) (not b!1496968) (not b!1496953) (not b!1496961) (not b!1496966) (not b!1496957) (not start!127322) (not b!1496958) (not b!1496964) (not b!1496950) (not b!1496954) (not b!1496952) (not b!1496969) (not b!1496962) (not b!1496963))
(check-sat)
