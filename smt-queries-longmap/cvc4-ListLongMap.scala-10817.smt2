; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126554 () Bool)

(assert start!126554)

(declare-fun b!1485242 () Bool)

(declare-fun e!832658 () Bool)

(declare-fun e!832666 () Bool)

(assert (=> b!1485242 (= e!832658 (not e!832666))))

(declare-fun res!1009950 () Bool)

(assert (=> b!1485242 (=> res!1009950 e!832666)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99516 0))(
  ( (array!99517 (arr!48034 (Array (_ BitVec 32) (_ BitVec 64))) (size!48584 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99516)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485242 (= res!1009950 (or (and (= (select (arr!48034 a!2862) index!646) (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48034 a!2862) index!646) (select (arr!48034 a!2862) j!93))) (= (select (arr!48034 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832667 () Bool)

(assert (=> b!1485242 e!832667))

(declare-fun res!1009951 () Bool)

(assert (=> b!1485242 (=> (not res!1009951) (not e!832667))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99516 (_ BitVec 32)) Bool)

(assert (=> b!1485242 (= res!1009951 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49888 0))(
  ( (Unit!49889) )
))
(declare-fun lt!648031 () Unit!49888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49888)

(assert (=> b!1485242 (= lt!648031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!648030 () (_ BitVec 64))

(declare-fun b!1485243 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!648028 () array!99516)

(declare-fun e!832664 () Bool)

(declare-datatypes ((SeekEntryResult!12274 0))(
  ( (MissingZero!12274 (index!51488 (_ BitVec 32))) (Found!12274 (index!51489 (_ BitVec 32))) (Intermediate!12274 (undefined!13086 Bool) (index!51490 (_ BitVec 32)) (x!133062 (_ BitVec 32))) (Undefined!12274) (MissingVacant!12274 (index!51491 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99516 (_ BitVec 32)) SeekEntryResult!12274)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99516 (_ BitVec 32)) SeekEntryResult!12274)

(assert (=> b!1485243 (= e!832664 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648030 lt!648028 mask!2687) (seekEntryOrOpen!0 lt!648030 lt!648028 mask!2687)))))

(declare-fun lt!648027 () SeekEntryResult!12274)

(declare-fun b!1485244 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99516 (_ BitVec 32)) SeekEntryResult!12274)

(assert (=> b!1485244 (= e!832664 (= lt!648027 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648030 lt!648028 mask!2687)))))

(declare-fun b!1485245 () Bool)

(declare-fun res!1009955 () Bool)

(declare-fun e!832665 () Bool)

(assert (=> b!1485245 (=> (not res!1009955) (not e!832665))))

(declare-fun lt!648029 () SeekEntryResult!12274)

(assert (=> b!1485245 (= res!1009955 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648029))))

(declare-fun b!1485246 () Bool)

(declare-fun res!1009945 () Bool)

(declare-fun e!832660 () Bool)

(assert (=> b!1485246 (=> (not res!1009945) (not e!832660))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485246 (= res!1009945 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48584 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48584 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48584 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485247 () Bool)

(declare-fun res!1009942 () Bool)

(assert (=> b!1485247 (=> (not res!1009942) (not e!832660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485247 (= res!1009942 (validKeyInArray!0 (select (arr!48034 a!2862) i!1006)))))

(declare-fun b!1485248 () Bool)

(declare-fun res!1009948 () Bool)

(assert (=> b!1485248 (=> (not res!1009948) (not e!832660))))

(assert (=> b!1485248 (= res!1009948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485249 () Bool)

(declare-fun res!1009954 () Bool)

(assert (=> b!1485249 (=> (not res!1009954) (not e!832667))))

(assert (=> b!1485249 (= res!1009954 (= (seekEntryOrOpen!0 (select (arr!48034 a!2862) j!93) a!2862 mask!2687) (Found!12274 j!93)))))

(declare-fun b!1485250 () Bool)

(declare-fun res!1009959 () Bool)

(assert (=> b!1485250 (=> (not res!1009959) (not e!832658))))

(assert (=> b!1485250 (= res!1009959 e!832664)))

(declare-fun c!137172 () Bool)

(assert (=> b!1485250 (= c!137172 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1009957 () Bool)

(assert (=> start!126554 (=> (not res!1009957) (not e!832660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126554 (= res!1009957 (validMask!0 mask!2687))))

(assert (=> start!126554 e!832660))

(assert (=> start!126554 true))

(declare-fun array_inv!37062 (array!99516) Bool)

(assert (=> start!126554 (array_inv!37062 a!2862)))

(declare-fun b!1485241 () Bool)

(assert (=> b!1485241 (= e!832665 e!832658)))

(declare-fun res!1009944 () Bool)

(assert (=> b!1485241 (=> (not res!1009944) (not e!832658))))

(assert (=> b!1485241 (= res!1009944 (= lt!648027 (Intermediate!12274 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485241 (= lt!648027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648030 mask!2687) lt!648030 lt!648028 mask!2687))))

(assert (=> b!1485241 (= lt!648030 (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485251 () Bool)

(assert (=> b!1485251 (= e!832666 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!648032 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485251 (= lt!648032 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485252 () Bool)

(declare-fun res!1009949 () Bool)

(assert (=> b!1485252 (=> (not res!1009949) (not e!832658))))

(assert (=> b!1485252 (= res!1009949 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485253 () Bool)

(declare-fun e!832663 () Bool)

(declare-fun e!832659 () Bool)

(assert (=> b!1485253 (= e!832663 e!832659)))

(declare-fun res!1009960 () Bool)

(assert (=> b!1485253 (=> (not res!1009960) (not e!832659))))

(declare-fun lt!648033 () (_ BitVec 64))

(assert (=> b!1485253 (= res!1009960 (and (= index!646 intermediateAfterIndex!19) (= lt!648033 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485254 () Bool)

(declare-fun e!832662 () Bool)

(assert (=> b!1485254 (= e!832660 e!832662)))

(declare-fun res!1009946 () Bool)

(assert (=> b!1485254 (=> (not res!1009946) (not e!832662))))

(assert (=> b!1485254 (= res!1009946 (= (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485254 (= lt!648028 (array!99517 (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48584 a!2862)))))

(declare-fun b!1485255 () Bool)

(assert (=> b!1485255 (= e!832659 (= (seekEntryOrOpen!0 lt!648030 lt!648028 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648030 lt!648028 mask!2687)))))

(declare-fun b!1485256 () Bool)

(assert (=> b!1485256 (= e!832662 e!832665)))

(declare-fun res!1009958 () Bool)

(assert (=> b!1485256 (=> (not res!1009958) (not e!832665))))

(assert (=> b!1485256 (= res!1009958 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48034 a!2862) j!93) mask!2687) (select (arr!48034 a!2862) j!93) a!2862 mask!2687) lt!648029))))

(assert (=> b!1485256 (= lt!648029 (Intermediate!12274 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485257 () Bool)

(declare-fun res!1009947 () Bool)

(assert (=> b!1485257 (=> (not res!1009947) (not e!832660))))

(assert (=> b!1485257 (= res!1009947 (and (= (size!48584 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48584 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48584 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485258 () Bool)

(declare-fun res!1009943 () Bool)

(assert (=> b!1485258 (=> (not res!1009943) (not e!832660))))

(assert (=> b!1485258 (= res!1009943 (validKeyInArray!0 (select (arr!48034 a!2862) j!93)))))

(declare-fun b!1485259 () Bool)

(declare-fun res!1009956 () Bool)

(assert (=> b!1485259 (=> (not res!1009956) (not e!832667))))

(assert (=> b!1485259 (= res!1009956 (or (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48034 a!2862) intermediateBeforeIndex!19) (select (arr!48034 a!2862) j!93))))))

(declare-fun b!1485260 () Bool)

(assert (=> b!1485260 (= e!832667 e!832663)))

(declare-fun res!1009952 () Bool)

(assert (=> b!1485260 (=> res!1009952 e!832663)))

(assert (=> b!1485260 (= res!1009952 (or (and (= (select (arr!48034 a!2862) index!646) lt!648033) (= (select (arr!48034 a!2862) index!646) (select (arr!48034 a!2862) j!93))) (= (select (arr!48034 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485260 (= lt!648033 (select (store (arr!48034 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485261 () Bool)

(declare-fun res!1009953 () Bool)

(assert (=> b!1485261 (=> (not res!1009953) (not e!832660))))

(declare-datatypes ((List!34535 0))(
  ( (Nil!34532) (Cons!34531 (h!35905 (_ BitVec 64)) (t!49229 List!34535)) )
))
(declare-fun arrayNoDuplicates!0 (array!99516 (_ BitVec 32) List!34535) Bool)

(assert (=> b!1485261 (= res!1009953 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34532))))

(assert (= (and start!126554 res!1009957) b!1485257))

(assert (= (and b!1485257 res!1009947) b!1485247))

(assert (= (and b!1485247 res!1009942) b!1485258))

(assert (= (and b!1485258 res!1009943) b!1485248))

(assert (= (and b!1485248 res!1009948) b!1485261))

(assert (= (and b!1485261 res!1009953) b!1485246))

(assert (= (and b!1485246 res!1009945) b!1485254))

(assert (= (and b!1485254 res!1009946) b!1485256))

(assert (= (and b!1485256 res!1009958) b!1485245))

(assert (= (and b!1485245 res!1009955) b!1485241))

(assert (= (and b!1485241 res!1009944) b!1485250))

(assert (= (and b!1485250 c!137172) b!1485244))

(assert (= (and b!1485250 (not c!137172)) b!1485243))

(assert (= (and b!1485250 res!1009959) b!1485252))

(assert (= (and b!1485252 res!1009949) b!1485242))

(assert (= (and b!1485242 res!1009951) b!1485249))

(assert (= (and b!1485249 res!1009954) b!1485259))

(assert (= (and b!1485259 res!1009956) b!1485260))

(assert (= (and b!1485260 (not res!1009952)) b!1485253))

(assert (= (and b!1485253 res!1009960) b!1485255))

(assert (= (and b!1485242 (not res!1009950)) b!1485251))

(declare-fun m!1370409 () Bool)

(assert (=> b!1485259 m!1370409))

(declare-fun m!1370411 () Bool)

(assert (=> b!1485259 m!1370411))

(declare-fun m!1370413 () Bool)

(assert (=> b!1485248 m!1370413))

(declare-fun m!1370415 () Bool)

(assert (=> b!1485260 m!1370415))

(assert (=> b!1485260 m!1370411))

(declare-fun m!1370417 () Bool)

(assert (=> b!1485260 m!1370417))

(declare-fun m!1370419 () Bool)

(assert (=> b!1485260 m!1370419))

(declare-fun m!1370421 () Bool)

(assert (=> b!1485244 m!1370421))

(declare-fun m!1370423 () Bool)

(assert (=> b!1485242 m!1370423))

(assert (=> b!1485242 m!1370417))

(assert (=> b!1485242 m!1370419))

(assert (=> b!1485242 m!1370415))

(declare-fun m!1370425 () Bool)

(assert (=> b!1485242 m!1370425))

(assert (=> b!1485242 m!1370411))

(assert (=> b!1485258 m!1370411))

(assert (=> b!1485258 m!1370411))

(declare-fun m!1370427 () Bool)

(assert (=> b!1485258 m!1370427))

(declare-fun m!1370429 () Bool)

(assert (=> b!1485247 m!1370429))

(assert (=> b!1485247 m!1370429))

(declare-fun m!1370431 () Bool)

(assert (=> b!1485247 m!1370431))

(assert (=> b!1485256 m!1370411))

(assert (=> b!1485256 m!1370411))

(declare-fun m!1370433 () Bool)

(assert (=> b!1485256 m!1370433))

(assert (=> b!1485256 m!1370433))

(assert (=> b!1485256 m!1370411))

(declare-fun m!1370435 () Bool)

(assert (=> b!1485256 m!1370435))

(assert (=> b!1485249 m!1370411))

(assert (=> b!1485249 m!1370411))

(declare-fun m!1370437 () Bool)

(assert (=> b!1485249 m!1370437))

(declare-fun m!1370439 () Bool)

(assert (=> start!126554 m!1370439))

(declare-fun m!1370441 () Bool)

(assert (=> start!126554 m!1370441))

(assert (=> b!1485245 m!1370411))

(assert (=> b!1485245 m!1370411))

(declare-fun m!1370443 () Bool)

(assert (=> b!1485245 m!1370443))

(assert (=> b!1485254 m!1370417))

(declare-fun m!1370445 () Bool)

(assert (=> b!1485254 m!1370445))

(declare-fun m!1370447 () Bool)

(assert (=> b!1485243 m!1370447))

(declare-fun m!1370449 () Bool)

(assert (=> b!1485243 m!1370449))

(declare-fun m!1370451 () Bool)

(assert (=> b!1485261 m!1370451))

(assert (=> b!1485255 m!1370449))

(assert (=> b!1485255 m!1370447))

(declare-fun m!1370453 () Bool)

(assert (=> b!1485251 m!1370453))

(declare-fun m!1370455 () Bool)

(assert (=> b!1485241 m!1370455))

(assert (=> b!1485241 m!1370455))

(declare-fun m!1370457 () Bool)

(assert (=> b!1485241 m!1370457))

(assert (=> b!1485241 m!1370417))

(declare-fun m!1370459 () Bool)

(assert (=> b!1485241 m!1370459))

(push 1)

(assert (not start!126554))

(assert (not b!1485244))

(assert (not b!1485243))

(assert (not b!1485242))

(assert (not b!1485249))

(assert (not b!1485241))

(assert (not b!1485248))

(assert (not b!1485245))

(assert (not b!1485256))

(assert (not b!1485251))

(assert (not b!1485261))

(assert (not b!1485258))

(assert (not b!1485255))

(assert (not b!1485247))

(check-sat)

