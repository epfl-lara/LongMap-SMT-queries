; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126498 () Bool)

(assert start!126498)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99460 0))(
  ( (array!99461 (arr!48006 (Array (_ BitVec 32) (_ BitVec 64))) (size!48556 (_ BitVec 32))) )
))
(declare-fun lt!647440 () array!99460)

(declare-fun b!1483477 () Bool)

(declare-fun lt!647439 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12246 0))(
  ( (MissingZero!12246 (index!51376 (_ BitVec 32))) (Found!12246 (index!51377 (_ BitVec 32))) (Intermediate!12246 (undefined!13058 Bool) (index!51378 (_ BitVec 32)) (x!132962 (_ BitVec 32))) (Undefined!12246) (MissingVacant!12246 (index!51379 (_ BitVec 32))) )
))
(declare-fun lt!647442 () SeekEntryResult!12246)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!831822 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12246)

(assert (=> b!1483477 (= e!831822 (= lt!647442 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647439 lt!647440 mask!2687)))))

(declare-fun b!1483478 () Bool)

(declare-fun res!1008349 () Bool)

(declare-fun e!831818 () Bool)

(assert (=> b!1483478 (=> (not res!1008349) (not e!831818))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99460)

(assert (=> b!1483478 (= res!1008349 (and (= (size!48556 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48556 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48556 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483479 () Bool)

(declare-fun res!1008347 () Bool)

(assert (=> b!1483479 (=> (not res!1008347) (not e!831818))))

(declare-datatypes ((List!34507 0))(
  ( (Nil!34504) (Cons!34503 (h!35877 (_ BitVec 64)) (t!49201 List!34507)) )
))
(declare-fun arrayNoDuplicates!0 (array!99460 (_ BitVec 32) List!34507) Bool)

(assert (=> b!1483479 (= res!1008347 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34504))))

(declare-fun b!1483480 () Bool)

(declare-fun res!1008364 () Bool)

(assert (=> b!1483480 (=> (not res!1008364) (not e!831818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483480 (= res!1008364 (validKeyInArray!0 (select (arr!48006 a!2862) j!93)))))

(declare-fun b!1483481 () Bool)

(declare-fun res!1008363 () Bool)

(assert (=> b!1483481 (=> (not res!1008363) (not e!831818))))

(assert (=> b!1483481 (= res!1008363 (validKeyInArray!0 (select (arr!48006 a!2862) i!1006)))))

(declare-fun b!1483482 () Bool)

(declare-fun res!1008359 () Bool)

(assert (=> b!1483482 (=> (not res!1008359) (not e!831818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99460 (_ BitVec 32)) Bool)

(assert (=> b!1483482 (= res!1008359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483483 () Bool)

(declare-fun res!1008361 () Bool)

(declare-fun e!831824 () Bool)

(assert (=> b!1483483 (=> (not res!1008361) (not e!831824))))

(declare-fun lt!647444 () SeekEntryResult!12246)

(assert (=> b!1483483 (= res!1008361 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48006 a!2862) j!93) a!2862 mask!2687) lt!647444))))

(declare-fun b!1483484 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!831823 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12246)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99460 (_ BitVec 32)) SeekEntryResult!12246)

(assert (=> b!1483484 (= e!831823 (= (seekEntryOrOpen!0 lt!647439 lt!647440 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647439 lt!647440 mask!2687)))))

(declare-fun b!1483485 () Bool)

(declare-fun e!831821 () Bool)

(assert (=> b!1483485 (= e!831821 e!831823)))

(declare-fun res!1008346 () Bool)

(assert (=> b!1483485 (=> (not res!1008346) (not e!831823))))

(declare-fun lt!647443 () (_ BitVec 64))

(assert (=> b!1483485 (= res!1008346 (and (= index!646 intermediateAfterIndex!19) (= lt!647443 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483486 () Bool)

(declare-fun e!831825 () Bool)

(assert (=> b!1483486 (= e!831818 e!831825)))

(declare-fun res!1008354 () Bool)

(assert (=> b!1483486 (=> (not res!1008354) (not e!831825))))

(assert (=> b!1483486 (= res!1008354 (= (select (store (arr!48006 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483486 (= lt!647440 (array!99461 (store (arr!48006 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48556 a!2862)))))

(declare-fun b!1483487 () Bool)

(declare-fun res!1008350 () Bool)

(declare-fun e!831826 () Bool)

(assert (=> b!1483487 (=> (not res!1008350) (not e!831826))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483487 (= res!1008350 (or (= (select (arr!48006 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48006 a!2862) intermediateBeforeIndex!19) (select (arr!48006 a!2862) j!93))))))

(declare-fun b!1483489 () Bool)

(assert (=> b!1483489 (= e!831825 e!831824)))

(declare-fun res!1008358 () Bool)

(assert (=> b!1483489 (=> (not res!1008358) (not e!831824))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483489 (= res!1008358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48006 a!2862) j!93) mask!2687) (select (arr!48006 a!2862) j!93) a!2862 mask!2687) lt!647444))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483489 (= lt!647444 (Intermediate!12246 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483490 () Bool)

(declare-fun res!1008355 () Bool)

(assert (=> b!1483490 (=> (not res!1008355) (not e!831826))))

(assert (=> b!1483490 (= res!1008355 (= (seekEntryOrOpen!0 (select (arr!48006 a!2862) j!93) a!2862 mask!2687) (Found!12246 j!93)))))

(declare-fun b!1483491 () Bool)

(declare-fun res!1008352 () Bool)

(declare-fun e!831827 () Bool)

(assert (=> b!1483491 (=> (not res!1008352) (not e!831827))))

(assert (=> b!1483491 (= res!1008352 e!831822)))

(declare-fun c!137088 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483491 (= c!137088 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483492 () Bool)

(declare-fun res!1008351 () Bool)

(assert (=> b!1483492 (=> (not res!1008351) (not e!831827))))

(assert (=> b!1483492 (= res!1008351 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483493 () Bool)

(declare-fun res!1008362 () Bool)

(assert (=> b!1483493 (=> (not res!1008362) (not e!831818))))

(assert (=> b!1483493 (= res!1008362 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48556 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48556 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48556 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483494 () Bool)

(declare-fun e!831819 () Bool)

(assert (=> b!1483494 (= e!831819 true)))

(declare-fun lt!647445 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483494 (= lt!647445 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483495 () Bool)

(assert (=> b!1483495 (= e!831824 e!831827)))

(declare-fun res!1008353 () Bool)

(assert (=> b!1483495 (=> (not res!1008353) (not e!831827))))

(assert (=> b!1483495 (= res!1008353 (= lt!647442 (Intermediate!12246 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483495 (= lt!647442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647439 mask!2687) lt!647439 lt!647440 mask!2687))))

(assert (=> b!1483495 (= lt!647439 (select (store (arr!48006 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483496 () Bool)

(assert (=> b!1483496 (= e!831826 e!831821)))

(declare-fun res!1008356 () Bool)

(assert (=> b!1483496 (=> res!1008356 e!831821)))

(assert (=> b!1483496 (= res!1008356 (or (and (= (select (arr!48006 a!2862) index!646) lt!647443) (= (select (arr!48006 a!2862) index!646) (select (arr!48006 a!2862) j!93))) (= (select (arr!48006 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483496 (= lt!647443 (select (store (arr!48006 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483497 () Bool)

(assert (=> b!1483497 (= e!831827 (not e!831819))))

(declare-fun res!1008348 () Bool)

(assert (=> b!1483497 (=> res!1008348 e!831819)))

(assert (=> b!1483497 (= res!1008348 (or (and (= (select (arr!48006 a!2862) index!646) (select (store (arr!48006 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48006 a!2862) index!646) (select (arr!48006 a!2862) j!93))) (= (select (arr!48006 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483497 e!831826))

(declare-fun res!1008357 () Bool)

(assert (=> b!1483497 (=> (not res!1008357) (not e!831826))))

(assert (=> b!1483497 (= res!1008357 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49832 0))(
  ( (Unit!49833) )
))
(declare-fun lt!647441 () Unit!49832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49832)

(assert (=> b!1483497 (= lt!647441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1008360 () Bool)

(assert (=> start!126498 (=> (not res!1008360) (not e!831818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126498 (= res!1008360 (validMask!0 mask!2687))))

(assert (=> start!126498 e!831818))

(assert (=> start!126498 true))

(declare-fun array_inv!37034 (array!99460) Bool)

(assert (=> start!126498 (array_inv!37034 a!2862)))

(declare-fun b!1483488 () Bool)

(assert (=> b!1483488 (= e!831822 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647439 lt!647440 mask!2687) (seekEntryOrOpen!0 lt!647439 lt!647440 mask!2687)))))

(assert (= (and start!126498 res!1008360) b!1483478))

(assert (= (and b!1483478 res!1008349) b!1483481))

(assert (= (and b!1483481 res!1008363) b!1483480))

(assert (= (and b!1483480 res!1008364) b!1483482))

(assert (= (and b!1483482 res!1008359) b!1483479))

(assert (= (and b!1483479 res!1008347) b!1483493))

(assert (= (and b!1483493 res!1008362) b!1483486))

(assert (= (and b!1483486 res!1008354) b!1483489))

(assert (= (and b!1483489 res!1008358) b!1483483))

(assert (= (and b!1483483 res!1008361) b!1483495))

(assert (= (and b!1483495 res!1008353) b!1483491))

(assert (= (and b!1483491 c!137088) b!1483477))

(assert (= (and b!1483491 (not c!137088)) b!1483488))

(assert (= (and b!1483491 res!1008352) b!1483492))

(assert (= (and b!1483492 res!1008351) b!1483497))

(assert (= (and b!1483497 res!1008357) b!1483490))

(assert (= (and b!1483490 res!1008355) b!1483487))

(assert (= (and b!1483487 res!1008350) b!1483496))

(assert (= (and b!1483496 (not res!1008356)) b!1483485))

(assert (= (and b!1483485 res!1008346) b!1483484))

(assert (= (and b!1483497 (not res!1008348)) b!1483494))

(declare-fun m!1368953 () Bool)

(assert (=> b!1483496 m!1368953))

(declare-fun m!1368955 () Bool)

(assert (=> b!1483496 m!1368955))

(declare-fun m!1368957 () Bool)

(assert (=> b!1483496 m!1368957))

(declare-fun m!1368959 () Bool)

(assert (=> b!1483496 m!1368959))

(assert (=> b!1483480 m!1368955))

(assert (=> b!1483480 m!1368955))

(declare-fun m!1368961 () Bool)

(assert (=> b!1483480 m!1368961))

(assert (=> b!1483490 m!1368955))

(assert (=> b!1483490 m!1368955))

(declare-fun m!1368963 () Bool)

(assert (=> b!1483490 m!1368963))

(declare-fun m!1368965 () Bool)

(assert (=> b!1483482 m!1368965))

(declare-fun m!1368967 () Bool)

(assert (=> b!1483481 m!1368967))

(assert (=> b!1483481 m!1368967))

(declare-fun m!1368969 () Bool)

(assert (=> b!1483481 m!1368969))

(assert (=> b!1483483 m!1368955))

(assert (=> b!1483483 m!1368955))

(declare-fun m!1368971 () Bool)

(assert (=> b!1483483 m!1368971))

(declare-fun m!1368973 () Bool)

(assert (=> start!126498 m!1368973))

(declare-fun m!1368975 () Bool)

(assert (=> start!126498 m!1368975))

(declare-fun m!1368977 () Bool)

(assert (=> b!1483479 m!1368977))

(declare-fun m!1368979 () Bool)

(assert (=> b!1483497 m!1368979))

(assert (=> b!1483497 m!1368957))

(assert (=> b!1483497 m!1368959))

(assert (=> b!1483497 m!1368953))

(declare-fun m!1368981 () Bool)

(assert (=> b!1483497 m!1368981))

(assert (=> b!1483497 m!1368955))

(assert (=> b!1483486 m!1368957))

(declare-fun m!1368983 () Bool)

(assert (=> b!1483486 m!1368983))

(declare-fun m!1368985 () Bool)

(assert (=> b!1483494 m!1368985))

(declare-fun m!1368987 () Bool)

(assert (=> b!1483488 m!1368987))

(declare-fun m!1368989 () Bool)

(assert (=> b!1483488 m!1368989))

(declare-fun m!1368991 () Bool)

(assert (=> b!1483487 m!1368991))

(assert (=> b!1483487 m!1368955))

(declare-fun m!1368993 () Bool)

(assert (=> b!1483477 m!1368993))

(assert (=> b!1483484 m!1368989))

(assert (=> b!1483484 m!1368987))

(declare-fun m!1368995 () Bool)

(assert (=> b!1483495 m!1368995))

(assert (=> b!1483495 m!1368995))

(declare-fun m!1368997 () Bool)

(assert (=> b!1483495 m!1368997))

(assert (=> b!1483495 m!1368957))

(declare-fun m!1368999 () Bool)

(assert (=> b!1483495 m!1368999))

(assert (=> b!1483489 m!1368955))

(assert (=> b!1483489 m!1368955))

(declare-fun m!1369001 () Bool)

(assert (=> b!1483489 m!1369001))

(assert (=> b!1483489 m!1369001))

(assert (=> b!1483489 m!1368955))

(declare-fun m!1369003 () Bool)

(assert (=> b!1483489 m!1369003))

(check-sat (not b!1483483) (not b!1483489) (not b!1483482) (not b!1483490) (not b!1483495) (not b!1483497) (not b!1483480) (not b!1483484) (not b!1483488) (not b!1483481) (not b!1483479) (not start!126498) (not b!1483494) (not b!1483477))
(check-sat)
