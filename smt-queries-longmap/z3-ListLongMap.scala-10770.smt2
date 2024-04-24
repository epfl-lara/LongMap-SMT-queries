; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126336 () Bool)

(assert start!126336)

(declare-fun b!1477475 () Bool)

(declare-fun res!1002945 () Bool)

(declare-fun e!829038 () Bool)

(assert (=> b!1477475 (=> (not res!1002945) (not e!829038))))

(declare-datatypes ((array!99337 0))(
  ( (array!99338 (arr!47944 (Array (_ BitVec 32) (_ BitVec 64))) (size!48495 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99337)

(declare-datatypes ((List!34432 0))(
  ( (Nil!34429) (Cons!34428 (h!35807 (_ BitVec 64)) (t!49118 List!34432)) )
))
(declare-fun arrayNoDuplicates!0 (array!99337 (_ BitVec 32) List!34432) Bool)

(assert (=> b!1477475 (= res!1002945 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34429))))

(declare-fun b!1477476 () Bool)

(declare-fun e!829043 () Bool)

(declare-fun e!829037 () Bool)

(assert (=> b!1477476 (= e!829043 e!829037)))

(declare-fun res!1002935 () Bool)

(assert (=> b!1477476 (=> res!1002935 e!829037)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477476 (= res!1002935 (or (and (= (select (arr!47944 a!2862) index!646) (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47944 a!2862) index!646) (select (arr!47944 a!2862) j!93))) (not (= (select (arr!47944 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477477 () Bool)

(declare-fun res!1002943 () Bool)

(assert (=> b!1477477 (=> (not res!1002943) (not e!829038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477477 (= res!1002943 (validKeyInArray!0 (select (arr!47944 a!2862) i!1006)))))

(declare-fun res!1002947 () Bool)

(assert (=> start!126336 (=> (not res!1002947) (not e!829038))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126336 (= res!1002947 (validMask!0 mask!2687))))

(assert (=> start!126336 e!829038))

(assert (=> start!126336 true))

(declare-fun array_inv!37225 (array!99337) Bool)

(assert (=> start!126336 (array_inv!37225 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645396 () (_ BitVec 64))

(declare-fun e!829036 () Bool)

(declare-datatypes ((SeekEntryResult!12081 0))(
  ( (MissingZero!12081 (index!50716 (_ BitVec 32))) (Found!12081 (index!50717 (_ BitVec 32))) (Intermediate!12081 (undefined!12893 Bool) (index!50718 (_ BitVec 32)) (x!132496 (_ BitVec 32))) (Undefined!12081) (MissingVacant!12081 (index!50719 (_ BitVec 32))) )
))
(declare-fun lt!645399 () SeekEntryResult!12081)

(declare-fun lt!645400 () array!99337)

(declare-fun b!1477478 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12081)

(assert (=> b!1477478 (= e!829036 (= lt!645399 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645396 lt!645400 mask!2687)))))

(declare-fun b!1477479 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12081)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99337 (_ BitVec 32)) SeekEntryResult!12081)

(assert (=> b!1477479 (= e!829036 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645396 lt!645400 mask!2687) (seekEntryOrOpen!0 lt!645396 lt!645400 mask!2687)))))

(declare-fun b!1477480 () Bool)

(declare-fun res!1002941 () Bool)

(declare-fun e!829039 () Bool)

(assert (=> b!1477480 (=> (not res!1002941) (not e!829039))))

(declare-fun lt!645395 () SeekEntryResult!12081)

(assert (=> b!1477480 (= res!1002941 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645395))))

(declare-fun b!1477481 () Bool)

(declare-fun e!829040 () Bool)

(assert (=> b!1477481 (= e!829037 e!829040)))

(declare-fun res!1002944 () Bool)

(assert (=> b!1477481 (=> (not res!1002944) (not e!829040))))

(declare-fun lt!645397 () SeekEntryResult!12081)

(assert (=> b!1477481 (= res!1002944 (= lt!645397 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477482 () Bool)

(declare-fun res!1002939 () Bool)

(assert (=> b!1477482 (=> (not res!1002939) (not e!829038))))

(assert (=> b!1477482 (= res!1002939 (validKeyInArray!0 (select (arr!47944 a!2862) j!93)))))

(declare-fun b!1477483 () Bool)

(declare-fun res!1002948 () Bool)

(declare-fun e!829044 () Bool)

(assert (=> b!1477483 (=> (not res!1002948) (not e!829044))))

(assert (=> b!1477483 (= res!1002948 e!829036)))

(declare-fun c!136798 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477483 (= c!136798 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477484 () Bool)

(declare-fun e!829041 () Bool)

(assert (=> b!1477484 (= e!829038 e!829041)))

(declare-fun res!1002938 () Bool)

(assert (=> b!1477484 (=> (not res!1002938) (not e!829041))))

(assert (=> b!1477484 (= res!1002938 (= (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477484 (= lt!645400 (array!99338 (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48495 a!2862)))))

(declare-fun b!1477485 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477485 (= e!829044 (not (or (and (= (select (arr!47944 a!2862) index!646) (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47944 a!2862) index!646) (select (arr!47944 a!2862) j!93))) (not (= (select (arr!47944 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= x!665 intermediateBeforeX!19))))))

(assert (=> b!1477485 e!829043))

(declare-fun res!1002937 () Bool)

(assert (=> b!1477485 (=> (not res!1002937) (not e!829043))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477485 (= res!1002937 (and (= lt!645397 (Found!12081 j!93)) (or (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) (select (arr!47944 a!2862) j!93)))))))

(assert (=> b!1477485 (= lt!645397 (seekEntryOrOpen!0 (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99337 (_ BitVec 32)) Bool)

(assert (=> b!1477485 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49535 0))(
  ( (Unit!49536) )
))
(declare-fun lt!645398 () Unit!49535)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49535)

(assert (=> b!1477485 (= lt!645398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477486 () Bool)

(declare-fun res!1002936 () Bool)

(assert (=> b!1477486 (=> (not res!1002936) (not e!829038))))

(assert (=> b!1477486 (= res!1002936 (and (= (size!48495 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48495 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48495 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477487 () Bool)

(declare-fun res!1002942 () Bool)

(assert (=> b!1477487 (=> (not res!1002942) (not e!829044))))

(assert (=> b!1477487 (= res!1002942 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477488 () Bool)

(declare-fun res!1002940 () Bool)

(assert (=> b!1477488 (=> (not res!1002940) (not e!829038))))

(assert (=> b!1477488 (= res!1002940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477489 () Bool)

(assert (=> b!1477489 (= e!829039 e!829044)))

(declare-fun res!1002950 () Bool)

(assert (=> b!1477489 (=> (not res!1002950) (not e!829044))))

(assert (=> b!1477489 (= res!1002950 (= lt!645399 (Intermediate!12081 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477489 (= lt!645399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645396 mask!2687) lt!645396 lt!645400 mask!2687))))

(assert (=> b!1477489 (= lt!645396 (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477490 () Bool)

(assert (=> b!1477490 (= e!829041 e!829039)))

(declare-fun res!1002949 () Bool)

(assert (=> b!1477490 (=> (not res!1002949) (not e!829039))))

(assert (=> b!1477490 (= res!1002949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645395))))

(assert (=> b!1477490 (= lt!645395 (Intermediate!12081 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477491 () Bool)

(assert (=> b!1477491 (= e!829040 (= index!646 intermediateBeforeIndex!19))))

(declare-fun b!1477492 () Bool)

(declare-fun res!1002946 () Bool)

(assert (=> b!1477492 (=> (not res!1002946) (not e!829038))))

(assert (=> b!1477492 (= res!1002946 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48495 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48495 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48495 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126336 res!1002947) b!1477486))

(assert (= (and b!1477486 res!1002936) b!1477477))

(assert (= (and b!1477477 res!1002943) b!1477482))

(assert (= (and b!1477482 res!1002939) b!1477488))

(assert (= (and b!1477488 res!1002940) b!1477475))

(assert (= (and b!1477475 res!1002945) b!1477492))

(assert (= (and b!1477492 res!1002946) b!1477484))

(assert (= (and b!1477484 res!1002938) b!1477490))

(assert (= (and b!1477490 res!1002949) b!1477480))

(assert (= (and b!1477480 res!1002941) b!1477489))

(assert (= (and b!1477489 res!1002950) b!1477483))

(assert (= (and b!1477483 c!136798) b!1477478))

(assert (= (and b!1477483 (not c!136798)) b!1477479))

(assert (= (and b!1477483 res!1002948) b!1477487))

(assert (= (and b!1477487 res!1002942) b!1477485))

(assert (= (and b!1477485 res!1002937) b!1477476))

(assert (= (and b!1477476 (not res!1002935)) b!1477481))

(assert (= (and b!1477481 res!1002944) b!1477491))

(declare-fun m!1363597 () Bool)

(assert (=> b!1477488 m!1363597))

(declare-fun m!1363599 () Bool)

(assert (=> b!1477489 m!1363599))

(assert (=> b!1477489 m!1363599))

(declare-fun m!1363601 () Bool)

(assert (=> b!1477489 m!1363601))

(declare-fun m!1363603 () Bool)

(assert (=> b!1477489 m!1363603))

(declare-fun m!1363605 () Bool)

(assert (=> b!1477489 m!1363605))

(declare-fun m!1363607 () Bool)

(assert (=> b!1477485 m!1363607))

(assert (=> b!1477485 m!1363603))

(declare-fun m!1363609 () Bool)

(assert (=> b!1477485 m!1363609))

(declare-fun m!1363611 () Bool)

(assert (=> b!1477485 m!1363611))

(declare-fun m!1363613 () Bool)

(assert (=> b!1477485 m!1363613))

(declare-fun m!1363615 () Bool)

(assert (=> b!1477485 m!1363615))

(declare-fun m!1363617 () Bool)

(assert (=> b!1477485 m!1363617))

(declare-fun m!1363619 () Bool)

(assert (=> b!1477485 m!1363619))

(assert (=> b!1477485 m!1363615))

(declare-fun m!1363621 () Bool)

(assert (=> b!1477477 m!1363621))

(assert (=> b!1477477 m!1363621))

(declare-fun m!1363623 () Bool)

(assert (=> b!1477477 m!1363623))

(assert (=> b!1477482 m!1363615))

(assert (=> b!1477482 m!1363615))

(declare-fun m!1363625 () Bool)

(assert (=> b!1477482 m!1363625))

(assert (=> b!1477490 m!1363615))

(assert (=> b!1477490 m!1363615))

(declare-fun m!1363627 () Bool)

(assert (=> b!1477490 m!1363627))

(assert (=> b!1477490 m!1363627))

(assert (=> b!1477490 m!1363615))

(declare-fun m!1363629 () Bool)

(assert (=> b!1477490 m!1363629))

(declare-fun m!1363631 () Bool)

(assert (=> start!126336 m!1363631))

(declare-fun m!1363633 () Bool)

(assert (=> start!126336 m!1363633))

(declare-fun m!1363635 () Bool)

(assert (=> b!1477475 m!1363635))

(declare-fun m!1363637 () Bool)

(assert (=> b!1477479 m!1363637))

(declare-fun m!1363639 () Bool)

(assert (=> b!1477479 m!1363639))

(assert (=> b!1477481 m!1363615))

(assert (=> b!1477481 m!1363615))

(declare-fun m!1363641 () Bool)

(assert (=> b!1477481 m!1363641))

(assert (=> b!1477476 m!1363613))

(assert (=> b!1477476 m!1363603))

(assert (=> b!1477476 m!1363611))

(assert (=> b!1477476 m!1363615))

(assert (=> b!1477480 m!1363615))

(assert (=> b!1477480 m!1363615))

(declare-fun m!1363643 () Bool)

(assert (=> b!1477480 m!1363643))

(assert (=> b!1477484 m!1363603))

(declare-fun m!1363645 () Bool)

(assert (=> b!1477484 m!1363645))

(declare-fun m!1363647 () Bool)

(assert (=> b!1477478 m!1363647))

(check-sat (not b!1477488) (not b!1477478) (not b!1477490) (not b!1477479) (not b!1477480) (not b!1477482) (not b!1477477) (not start!126336) (not b!1477481) (not b!1477485) (not b!1477475) (not b!1477489))
(check-sat)
(get-model)

(declare-fun d!156367 () Bool)

(assert (=> d!156367 (= (validKeyInArray!0 (select (arr!47944 a!2862) j!93)) (and (not (= (select (arr!47944 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47944 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1477482 d!156367))

(declare-fun b!1477613 () Bool)

(declare-fun e!829105 () SeekEntryResult!12081)

(declare-fun lt!645445 () SeekEntryResult!12081)

(assert (=> b!1477613 (= e!829105 (MissingZero!12081 (index!50718 lt!645445)))))

(declare-fun d!156369 () Bool)

(declare-fun lt!645444 () SeekEntryResult!12081)

(get-info :version)

(assert (=> d!156369 (and (or ((_ is Undefined!12081) lt!645444) (not ((_ is Found!12081) lt!645444)) (and (bvsge (index!50717 lt!645444) #b00000000000000000000000000000000) (bvslt (index!50717 lt!645444) (size!48495 a!2862)))) (or ((_ is Undefined!12081) lt!645444) ((_ is Found!12081) lt!645444) (not ((_ is MissingZero!12081) lt!645444)) (and (bvsge (index!50716 lt!645444) #b00000000000000000000000000000000) (bvslt (index!50716 lt!645444) (size!48495 a!2862)))) (or ((_ is Undefined!12081) lt!645444) ((_ is Found!12081) lt!645444) ((_ is MissingZero!12081) lt!645444) (not ((_ is MissingVacant!12081) lt!645444)) (and (bvsge (index!50719 lt!645444) #b00000000000000000000000000000000) (bvslt (index!50719 lt!645444) (size!48495 a!2862)))) (or ((_ is Undefined!12081) lt!645444) (ite ((_ is Found!12081) lt!645444) (= (select (arr!47944 a!2862) (index!50717 lt!645444)) (select (arr!47944 a!2862) j!93)) (ite ((_ is MissingZero!12081) lt!645444) (= (select (arr!47944 a!2862) (index!50716 lt!645444)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12081) lt!645444) (= (select (arr!47944 a!2862) (index!50719 lt!645444)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!829106 () SeekEntryResult!12081)

(assert (=> d!156369 (= lt!645444 e!829106)))

(declare-fun c!136813 () Bool)

(assert (=> d!156369 (= c!136813 (and ((_ is Intermediate!12081) lt!645445) (undefined!12893 lt!645445)))))

(assert (=> d!156369 (= lt!645445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156369 (validMask!0 mask!2687)))

(assert (=> d!156369 (= (seekEntryOrOpen!0 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645444)))

(declare-fun b!1477614 () Bool)

(assert (=> b!1477614 (= e!829105 (seekKeyOrZeroReturnVacant!0 (x!132496 lt!645445) (index!50718 lt!645445) (index!50718 lt!645445) (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477615 () Bool)

(declare-fun c!136811 () Bool)

(declare-fun lt!645443 () (_ BitVec 64))

(assert (=> b!1477615 (= c!136811 (= lt!645443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!829107 () SeekEntryResult!12081)

(assert (=> b!1477615 (= e!829107 e!829105)))

(declare-fun b!1477616 () Bool)

(assert (=> b!1477616 (= e!829106 e!829107)))

(assert (=> b!1477616 (= lt!645443 (select (arr!47944 a!2862) (index!50718 lt!645445)))))

(declare-fun c!136812 () Bool)

(assert (=> b!1477616 (= c!136812 (= lt!645443 (select (arr!47944 a!2862) j!93)))))

(declare-fun b!1477617 () Bool)

(assert (=> b!1477617 (= e!829106 Undefined!12081)))

(declare-fun b!1477618 () Bool)

(assert (=> b!1477618 (= e!829107 (Found!12081 (index!50718 lt!645445)))))

(assert (= (and d!156369 c!136813) b!1477617))

(assert (= (and d!156369 (not c!136813)) b!1477616))

(assert (= (and b!1477616 c!136812) b!1477618))

(assert (= (and b!1477616 (not c!136812)) b!1477615))

(assert (= (and b!1477615 c!136811) b!1477613))

(assert (= (and b!1477615 (not c!136811)) b!1477614))

(assert (=> d!156369 m!1363615))

(assert (=> d!156369 m!1363627))

(assert (=> d!156369 m!1363631))

(declare-fun m!1363753 () Bool)

(assert (=> d!156369 m!1363753))

(assert (=> d!156369 m!1363627))

(assert (=> d!156369 m!1363615))

(assert (=> d!156369 m!1363629))

(declare-fun m!1363755 () Bool)

(assert (=> d!156369 m!1363755))

(declare-fun m!1363757 () Bool)

(assert (=> d!156369 m!1363757))

(assert (=> b!1477614 m!1363615))

(declare-fun m!1363759 () Bool)

(assert (=> b!1477614 m!1363759))

(declare-fun m!1363761 () Bool)

(assert (=> b!1477616 m!1363761))

(assert (=> b!1477485 d!156369))

(declare-fun call!67896 () Bool)

(declare-fun bm!67893 () Bool)

(assert (=> bm!67893 (= call!67896 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156371 () Bool)

(declare-fun res!1003051 () Bool)

(declare-fun e!829116 () Bool)

(assert (=> d!156371 (=> res!1003051 e!829116)))

(assert (=> d!156371 (= res!1003051 (bvsge j!93 (size!48495 a!2862)))))

(assert (=> d!156371 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!829116)))

(declare-fun b!1477627 () Bool)

(declare-fun e!829114 () Bool)

(assert (=> b!1477627 (= e!829114 call!67896)))

(declare-fun b!1477628 () Bool)

(declare-fun e!829115 () Bool)

(assert (=> b!1477628 (= e!829115 call!67896)))

(declare-fun b!1477629 () Bool)

(assert (=> b!1477629 (= e!829114 e!829115)))

(declare-fun lt!645453 () (_ BitVec 64))

(assert (=> b!1477629 (= lt!645453 (select (arr!47944 a!2862) j!93))))

(declare-fun lt!645452 () Unit!49535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99337 (_ BitVec 64) (_ BitVec 32)) Unit!49535)

(assert (=> b!1477629 (= lt!645452 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645453 j!93))))

(declare-fun arrayContainsKey!0 (array!99337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1477629 (arrayContainsKey!0 a!2862 lt!645453 #b00000000000000000000000000000000)))

(declare-fun lt!645454 () Unit!49535)

(assert (=> b!1477629 (= lt!645454 lt!645452)))

(declare-fun res!1003052 () Bool)

(assert (=> b!1477629 (= res!1003052 (= (seekEntryOrOpen!0 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) (Found!12081 j!93)))))

(assert (=> b!1477629 (=> (not res!1003052) (not e!829115))))

(declare-fun b!1477630 () Bool)

(assert (=> b!1477630 (= e!829116 e!829114)))

(declare-fun c!136816 () Bool)

(assert (=> b!1477630 (= c!136816 (validKeyInArray!0 (select (arr!47944 a!2862) j!93)))))

(assert (= (and d!156371 (not res!1003051)) b!1477630))

(assert (= (and b!1477630 c!136816) b!1477629))

(assert (= (and b!1477630 (not c!136816)) b!1477627))

(assert (= (and b!1477629 res!1003052) b!1477628))

(assert (= (or b!1477628 b!1477627) bm!67893))

(declare-fun m!1363763 () Bool)

(assert (=> bm!67893 m!1363763))

(assert (=> b!1477629 m!1363615))

(declare-fun m!1363765 () Bool)

(assert (=> b!1477629 m!1363765))

(declare-fun m!1363767 () Bool)

(assert (=> b!1477629 m!1363767))

(assert (=> b!1477629 m!1363615))

(assert (=> b!1477629 m!1363617))

(assert (=> b!1477630 m!1363615))

(assert (=> b!1477630 m!1363615))

(assert (=> b!1477630 m!1363625))

(assert (=> b!1477485 d!156371))

(declare-fun d!156373 () Bool)

(assert (=> d!156373 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!645457 () Unit!49535)

(declare-fun choose!38 (array!99337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49535)

(assert (=> d!156373 (= lt!645457 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156373 (validMask!0 mask!2687)))

(assert (=> d!156373 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!645457)))

(declare-fun bs!42586 () Bool)

(assert (= bs!42586 d!156373))

(assert (=> bs!42586 m!1363619))

(declare-fun m!1363769 () Bool)

(assert (=> bs!42586 m!1363769))

(assert (=> bs!42586 m!1363631))

(assert (=> b!1477485 d!156373))

(declare-fun b!1477641 () Bool)

(declare-fun e!829126 () Bool)

(declare-fun e!829128 () Bool)

(assert (=> b!1477641 (= e!829126 e!829128)))

(declare-fun res!1003061 () Bool)

(assert (=> b!1477641 (=> (not res!1003061) (not e!829128))))

(declare-fun e!829125 () Bool)

(assert (=> b!1477641 (= res!1003061 (not e!829125))))

(declare-fun res!1003060 () Bool)

(assert (=> b!1477641 (=> (not res!1003060) (not e!829125))))

(assert (=> b!1477641 (= res!1003060 (validKeyInArray!0 (select (arr!47944 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1477642 () Bool)

(declare-fun e!829127 () Bool)

(assert (=> b!1477642 (= e!829128 e!829127)))

(declare-fun c!136819 () Bool)

(assert (=> b!1477642 (= c!136819 (validKeyInArray!0 (select (arr!47944 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1477643 () Bool)

(declare-fun call!67899 () Bool)

(assert (=> b!1477643 (= e!829127 call!67899)))

(declare-fun b!1477644 () Bool)

(assert (=> b!1477644 (= e!829127 call!67899)))

(declare-fun b!1477645 () Bool)

(declare-fun contains!9956 (List!34432 (_ BitVec 64)) Bool)

(assert (=> b!1477645 (= e!829125 (contains!9956 Nil!34429 (select (arr!47944 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156375 () Bool)

(declare-fun res!1003059 () Bool)

(assert (=> d!156375 (=> res!1003059 e!829126)))

(assert (=> d!156375 (= res!1003059 (bvsge #b00000000000000000000000000000000 (size!48495 a!2862)))))

(assert (=> d!156375 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34429) e!829126)))

(declare-fun bm!67896 () Bool)

(assert (=> bm!67896 (= call!67899 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136819 (Cons!34428 (select (arr!47944 a!2862) #b00000000000000000000000000000000) Nil!34429) Nil!34429)))))

(assert (= (and d!156375 (not res!1003059)) b!1477641))

(assert (= (and b!1477641 res!1003060) b!1477645))

(assert (= (and b!1477641 res!1003061) b!1477642))

(assert (= (and b!1477642 c!136819) b!1477643))

(assert (= (and b!1477642 (not c!136819)) b!1477644))

(assert (= (or b!1477643 b!1477644) bm!67896))

(declare-fun m!1363771 () Bool)

(assert (=> b!1477641 m!1363771))

(assert (=> b!1477641 m!1363771))

(declare-fun m!1363773 () Bool)

(assert (=> b!1477641 m!1363773))

(assert (=> b!1477642 m!1363771))

(assert (=> b!1477642 m!1363771))

(assert (=> b!1477642 m!1363773))

(assert (=> b!1477645 m!1363771))

(assert (=> b!1477645 m!1363771))

(declare-fun m!1363775 () Bool)

(assert (=> b!1477645 m!1363775))

(assert (=> bm!67896 m!1363771))

(declare-fun m!1363777 () Bool)

(assert (=> bm!67896 m!1363777))

(assert (=> b!1477475 d!156375))

(declare-fun b!1477664 () Bool)

(declare-fun e!829140 () SeekEntryResult!12081)

(assert (=> b!1477664 (= e!829140 (Intermediate!12081 true index!646 x!665))))

(declare-fun b!1477665 () Bool)

(declare-fun e!829143 () Bool)

(declare-fun e!829142 () Bool)

(assert (=> b!1477665 (= e!829143 e!829142)))

(declare-fun res!1003069 () Bool)

(declare-fun lt!645463 () SeekEntryResult!12081)

(assert (=> b!1477665 (= res!1003069 (and ((_ is Intermediate!12081) lt!645463) (not (undefined!12893 lt!645463)) (bvslt (x!132496 lt!645463) #b01111111111111111111111111111110) (bvsge (x!132496 lt!645463) #b00000000000000000000000000000000) (bvsge (x!132496 lt!645463) x!665)))))

(assert (=> b!1477665 (=> (not res!1003069) (not e!829142))))

(declare-fun b!1477666 () Bool)

(assert (=> b!1477666 (= e!829143 (bvsge (x!132496 lt!645463) #b01111111111111111111111111111110))))

(declare-fun b!1477667 () Bool)

(declare-fun e!829141 () SeekEntryResult!12081)

(assert (=> b!1477667 (= e!829141 (Intermediate!12081 false index!646 x!665))))

(declare-fun b!1477668 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477668 (= e!829141 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!645396 lt!645400 mask!2687))))

(declare-fun d!156377 () Bool)

(assert (=> d!156377 e!829143))

(declare-fun c!136827 () Bool)

(assert (=> d!156377 (= c!136827 (and ((_ is Intermediate!12081) lt!645463) (undefined!12893 lt!645463)))))

(assert (=> d!156377 (= lt!645463 e!829140)))

(declare-fun c!136828 () Bool)

(assert (=> d!156377 (= c!136828 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645462 () (_ BitVec 64))

(assert (=> d!156377 (= lt!645462 (select (arr!47944 lt!645400) index!646))))

(assert (=> d!156377 (validMask!0 mask!2687)))

(assert (=> d!156377 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645396 lt!645400 mask!2687) lt!645463)))

(declare-fun b!1477669 () Bool)

(assert (=> b!1477669 (and (bvsge (index!50718 lt!645463) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645463) (size!48495 lt!645400)))))

(declare-fun res!1003070 () Bool)

(assert (=> b!1477669 (= res!1003070 (= (select (arr!47944 lt!645400) (index!50718 lt!645463)) lt!645396))))

(declare-fun e!829139 () Bool)

(assert (=> b!1477669 (=> res!1003070 e!829139)))

(assert (=> b!1477669 (= e!829142 e!829139)))

(declare-fun b!1477670 () Bool)

(assert (=> b!1477670 (= e!829140 e!829141)))

(declare-fun c!136826 () Bool)

(assert (=> b!1477670 (= c!136826 (or (= lt!645462 lt!645396) (= (bvadd lt!645462 lt!645462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477671 () Bool)

(assert (=> b!1477671 (and (bvsge (index!50718 lt!645463) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645463) (size!48495 lt!645400)))))

(declare-fun res!1003068 () Bool)

(assert (=> b!1477671 (= res!1003068 (= (select (arr!47944 lt!645400) (index!50718 lt!645463)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477671 (=> res!1003068 e!829139)))

(declare-fun b!1477672 () Bool)

(assert (=> b!1477672 (and (bvsge (index!50718 lt!645463) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645463) (size!48495 lt!645400)))))

(assert (=> b!1477672 (= e!829139 (= (select (arr!47944 lt!645400) (index!50718 lt!645463)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156377 c!136828) b!1477664))

(assert (= (and d!156377 (not c!136828)) b!1477670))

(assert (= (and b!1477670 c!136826) b!1477667))

(assert (= (and b!1477670 (not c!136826)) b!1477668))

(assert (= (and d!156377 c!136827) b!1477666))

(assert (= (and d!156377 (not c!136827)) b!1477665))

(assert (= (and b!1477665 res!1003069) b!1477669))

(assert (= (and b!1477669 (not res!1003070)) b!1477671))

(assert (= (and b!1477671 (not res!1003068)) b!1477672))

(declare-fun m!1363779 () Bool)

(assert (=> b!1477671 m!1363779))

(declare-fun m!1363781 () Bool)

(assert (=> b!1477668 m!1363781))

(assert (=> b!1477668 m!1363781))

(declare-fun m!1363783 () Bool)

(assert (=> b!1477668 m!1363783))

(assert (=> b!1477669 m!1363779))

(assert (=> b!1477672 m!1363779))

(declare-fun m!1363785 () Bool)

(assert (=> d!156377 m!1363785))

(assert (=> d!156377 m!1363631))

(assert (=> b!1477478 d!156377))

(declare-fun b!1477673 () Bool)

(declare-fun e!829145 () SeekEntryResult!12081)

(assert (=> b!1477673 (= e!829145 (Intermediate!12081 true (toIndex!0 lt!645396 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477674 () Bool)

(declare-fun e!829148 () Bool)

(declare-fun e!829147 () Bool)

(assert (=> b!1477674 (= e!829148 e!829147)))

(declare-fun res!1003072 () Bool)

(declare-fun lt!645465 () SeekEntryResult!12081)

(assert (=> b!1477674 (= res!1003072 (and ((_ is Intermediate!12081) lt!645465) (not (undefined!12893 lt!645465)) (bvslt (x!132496 lt!645465) #b01111111111111111111111111111110) (bvsge (x!132496 lt!645465) #b00000000000000000000000000000000) (bvsge (x!132496 lt!645465) #b00000000000000000000000000000000)))))

(assert (=> b!1477674 (=> (not res!1003072) (not e!829147))))

(declare-fun b!1477675 () Bool)

(assert (=> b!1477675 (= e!829148 (bvsge (x!132496 lt!645465) #b01111111111111111111111111111110))))

(declare-fun b!1477676 () Bool)

(declare-fun e!829146 () SeekEntryResult!12081)

(assert (=> b!1477676 (= e!829146 (Intermediate!12081 false (toIndex!0 lt!645396 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477677 () Bool)

(assert (=> b!1477677 (= e!829146 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!645396 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!645396 lt!645400 mask!2687))))

(declare-fun d!156381 () Bool)

(assert (=> d!156381 e!829148))

(declare-fun c!136830 () Bool)

(assert (=> d!156381 (= c!136830 (and ((_ is Intermediate!12081) lt!645465) (undefined!12893 lt!645465)))))

(assert (=> d!156381 (= lt!645465 e!829145)))

(declare-fun c!136831 () Bool)

(assert (=> d!156381 (= c!136831 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!645464 () (_ BitVec 64))

(assert (=> d!156381 (= lt!645464 (select (arr!47944 lt!645400) (toIndex!0 lt!645396 mask!2687)))))

(assert (=> d!156381 (validMask!0 mask!2687)))

(assert (=> d!156381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645396 mask!2687) lt!645396 lt!645400 mask!2687) lt!645465)))

(declare-fun b!1477678 () Bool)

(assert (=> b!1477678 (and (bvsge (index!50718 lt!645465) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645465) (size!48495 lt!645400)))))

(declare-fun res!1003073 () Bool)

(assert (=> b!1477678 (= res!1003073 (= (select (arr!47944 lt!645400) (index!50718 lt!645465)) lt!645396))))

(declare-fun e!829144 () Bool)

(assert (=> b!1477678 (=> res!1003073 e!829144)))

(assert (=> b!1477678 (= e!829147 e!829144)))

(declare-fun b!1477679 () Bool)

(assert (=> b!1477679 (= e!829145 e!829146)))

(declare-fun c!136829 () Bool)

(assert (=> b!1477679 (= c!136829 (or (= lt!645464 lt!645396) (= (bvadd lt!645464 lt!645464) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477680 () Bool)

(assert (=> b!1477680 (and (bvsge (index!50718 lt!645465) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645465) (size!48495 lt!645400)))))

(declare-fun res!1003071 () Bool)

(assert (=> b!1477680 (= res!1003071 (= (select (arr!47944 lt!645400) (index!50718 lt!645465)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477680 (=> res!1003071 e!829144)))

(declare-fun b!1477681 () Bool)

(assert (=> b!1477681 (and (bvsge (index!50718 lt!645465) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645465) (size!48495 lt!645400)))))

(assert (=> b!1477681 (= e!829144 (= (select (arr!47944 lt!645400) (index!50718 lt!645465)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156381 c!136831) b!1477673))

(assert (= (and d!156381 (not c!136831)) b!1477679))

(assert (= (and b!1477679 c!136829) b!1477676))

(assert (= (and b!1477679 (not c!136829)) b!1477677))

(assert (= (and d!156381 c!136830) b!1477675))

(assert (= (and d!156381 (not c!136830)) b!1477674))

(assert (= (and b!1477674 res!1003072) b!1477678))

(assert (= (and b!1477678 (not res!1003073)) b!1477680))

(assert (= (and b!1477680 (not res!1003071)) b!1477681))

(declare-fun m!1363787 () Bool)

(assert (=> b!1477680 m!1363787))

(assert (=> b!1477677 m!1363599))

(declare-fun m!1363789 () Bool)

(assert (=> b!1477677 m!1363789))

(assert (=> b!1477677 m!1363789))

(declare-fun m!1363791 () Bool)

(assert (=> b!1477677 m!1363791))

(assert (=> b!1477678 m!1363787))

(assert (=> b!1477681 m!1363787))

(assert (=> d!156381 m!1363599))

(declare-fun m!1363793 () Bool)

(assert (=> d!156381 m!1363793))

(assert (=> d!156381 m!1363631))

(assert (=> b!1477489 d!156381))

(declare-fun d!156383 () Bool)

(declare-fun lt!645471 () (_ BitVec 32))

(declare-fun lt!645470 () (_ BitVec 32))

(assert (=> d!156383 (= lt!645471 (bvmul (bvxor lt!645470 (bvlshr lt!645470 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156383 (= lt!645470 ((_ extract 31 0) (bvand (bvxor lt!645396 (bvlshr lt!645396 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156383 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1003074 (let ((h!35810 ((_ extract 31 0) (bvand (bvxor lt!645396 (bvlshr lt!645396 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132500 (bvmul (bvxor h!35810 (bvlshr h!35810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132500 (bvlshr x!132500 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1003074 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1003074 #b00000000000000000000000000000000))))))

(assert (=> d!156383 (= (toIndex!0 lt!645396 mask!2687) (bvand (bvxor lt!645471 (bvlshr lt!645471 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1477489 d!156383))

(declare-fun b!1477733 () Bool)

(declare-fun e!829180 () SeekEntryResult!12081)

(assert (=> b!1477733 (= e!829180 (Found!12081 index!646))))

(declare-fun b!1477734 () Bool)

(declare-fun e!829181 () SeekEntryResult!12081)

(assert (=> b!1477734 (= e!829181 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!645396 lt!645400 mask!2687))))

(declare-fun b!1477735 () Bool)

(declare-fun e!829179 () SeekEntryResult!12081)

(assert (=> b!1477735 (= e!829179 e!829180)))

(declare-fun c!136851 () Bool)

(declare-fun lt!645491 () (_ BitVec 64))

(assert (=> b!1477735 (= c!136851 (= lt!645491 lt!645396))))

(declare-fun b!1477736 () Bool)

(declare-fun c!136852 () Bool)

(assert (=> b!1477736 (= c!136852 (= lt!645491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477736 (= e!829180 e!829181)))

(declare-fun b!1477737 () Bool)

(assert (=> b!1477737 (= e!829179 Undefined!12081)))

(declare-fun d!156387 () Bool)

(declare-fun lt!645492 () SeekEntryResult!12081)

(assert (=> d!156387 (and (or ((_ is Undefined!12081) lt!645492) (not ((_ is Found!12081) lt!645492)) (and (bvsge (index!50717 lt!645492) #b00000000000000000000000000000000) (bvslt (index!50717 lt!645492) (size!48495 lt!645400)))) (or ((_ is Undefined!12081) lt!645492) ((_ is Found!12081) lt!645492) (not ((_ is MissingVacant!12081) lt!645492)) (not (= (index!50719 lt!645492) intermediateAfterIndex!19)) (and (bvsge (index!50719 lt!645492) #b00000000000000000000000000000000) (bvslt (index!50719 lt!645492) (size!48495 lt!645400)))) (or ((_ is Undefined!12081) lt!645492) (ite ((_ is Found!12081) lt!645492) (= (select (arr!47944 lt!645400) (index!50717 lt!645492)) lt!645396) (and ((_ is MissingVacant!12081) lt!645492) (= (index!50719 lt!645492) intermediateAfterIndex!19) (= (select (arr!47944 lt!645400) (index!50719 lt!645492)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156387 (= lt!645492 e!829179)))

(declare-fun c!136850 () Bool)

(assert (=> d!156387 (= c!136850 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156387 (= lt!645491 (select (arr!47944 lt!645400) index!646))))

(assert (=> d!156387 (validMask!0 mask!2687)))

(assert (=> d!156387 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645396 lt!645400 mask!2687) lt!645492)))

(declare-fun b!1477738 () Bool)

(assert (=> b!1477738 (= e!829181 (MissingVacant!12081 intermediateAfterIndex!19))))

(assert (= (and d!156387 c!136850) b!1477737))

(assert (= (and d!156387 (not c!136850)) b!1477735))

(assert (= (and b!1477735 c!136851) b!1477733))

(assert (= (and b!1477735 (not c!136851)) b!1477736))

(assert (= (and b!1477736 c!136852) b!1477738))

(assert (= (and b!1477736 (not c!136852)) b!1477734))

(assert (=> b!1477734 m!1363781))

(assert (=> b!1477734 m!1363781))

(declare-fun m!1363815 () Bool)

(assert (=> b!1477734 m!1363815))

(declare-fun m!1363817 () Bool)

(assert (=> d!156387 m!1363817))

(declare-fun m!1363819 () Bool)

(assert (=> d!156387 m!1363819))

(assert (=> d!156387 m!1363785))

(assert (=> d!156387 m!1363631))

(assert (=> b!1477479 d!156387))

(declare-fun b!1477739 () Bool)

(declare-fun e!829182 () SeekEntryResult!12081)

(declare-fun lt!645495 () SeekEntryResult!12081)

(assert (=> b!1477739 (= e!829182 (MissingZero!12081 (index!50718 lt!645495)))))

(declare-fun d!156393 () Bool)

(declare-fun lt!645494 () SeekEntryResult!12081)

(assert (=> d!156393 (and (or ((_ is Undefined!12081) lt!645494) (not ((_ is Found!12081) lt!645494)) (and (bvsge (index!50717 lt!645494) #b00000000000000000000000000000000) (bvslt (index!50717 lt!645494) (size!48495 lt!645400)))) (or ((_ is Undefined!12081) lt!645494) ((_ is Found!12081) lt!645494) (not ((_ is MissingZero!12081) lt!645494)) (and (bvsge (index!50716 lt!645494) #b00000000000000000000000000000000) (bvslt (index!50716 lt!645494) (size!48495 lt!645400)))) (or ((_ is Undefined!12081) lt!645494) ((_ is Found!12081) lt!645494) ((_ is MissingZero!12081) lt!645494) (not ((_ is MissingVacant!12081) lt!645494)) (and (bvsge (index!50719 lt!645494) #b00000000000000000000000000000000) (bvslt (index!50719 lt!645494) (size!48495 lt!645400)))) (or ((_ is Undefined!12081) lt!645494) (ite ((_ is Found!12081) lt!645494) (= (select (arr!47944 lt!645400) (index!50717 lt!645494)) lt!645396) (ite ((_ is MissingZero!12081) lt!645494) (= (select (arr!47944 lt!645400) (index!50716 lt!645494)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12081) lt!645494) (= (select (arr!47944 lt!645400) (index!50719 lt!645494)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!829183 () SeekEntryResult!12081)

(assert (=> d!156393 (= lt!645494 e!829183)))

(declare-fun c!136855 () Bool)

(assert (=> d!156393 (= c!136855 (and ((_ is Intermediate!12081) lt!645495) (undefined!12893 lt!645495)))))

(assert (=> d!156393 (= lt!645495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645396 mask!2687) lt!645396 lt!645400 mask!2687))))

(assert (=> d!156393 (validMask!0 mask!2687)))

(assert (=> d!156393 (= (seekEntryOrOpen!0 lt!645396 lt!645400 mask!2687) lt!645494)))

(declare-fun b!1477740 () Bool)

(assert (=> b!1477740 (= e!829182 (seekKeyOrZeroReturnVacant!0 (x!132496 lt!645495) (index!50718 lt!645495) (index!50718 lt!645495) lt!645396 lt!645400 mask!2687))))

(declare-fun b!1477741 () Bool)

(declare-fun c!136853 () Bool)

(declare-fun lt!645493 () (_ BitVec 64))

(assert (=> b!1477741 (= c!136853 (= lt!645493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!829184 () SeekEntryResult!12081)

(assert (=> b!1477741 (= e!829184 e!829182)))

(declare-fun b!1477742 () Bool)

(assert (=> b!1477742 (= e!829183 e!829184)))

(assert (=> b!1477742 (= lt!645493 (select (arr!47944 lt!645400) (index!50718 lt!645495)))))

(declare-fun c!136854 () Bool)

(assert (=> b!1477742 (= c!136854 (= lt!645493 lt!645396))))

(declare-fun b!1477743 () Bool)

(assert (=> b!1477743 (= e!829183 Undefined!12081)))

(declare-fun b!1477744 () Bool)

(assert (=> b!1477744 (= e!829184 (Found!12081 (index!50718 lt!645495)))))

(assert (= (and d!156393 c!136855) b!1477743))

(assert (= (and d!156393 (not c!136855)) b!1477742))

(assert (= (and b!1477742 c!136854) b!1477744))

(assert (= (and b!1477742 (not c!136854)) b!1477741))

(assert (= (and b!1477741 c!136853) b!1477739))

(assert (= (and b!1477741 (not c!136853)) b!1477740))

(assert (=> d!156393 m!1363599))

(assert (=> d!156393 m!1363631))

(declare-fun m!1363821 () Bool)

(assert (=> d!156393 m!1363821))

(assert (=> d!156393 m!1363599))

(assert (=> d!156393 m!1363601))

(declare-fun m!1363823 () Bool)

(assert (=> d!156393 m!1363823))

(declare-fun m!1363825 () Bool)

(assert (=> d!156393 m!1363825))

(declare-fun m!1363827 () Bool)

(assert (=> b!1477740 m!1363827))

(declare-fun m!1363829 () Bool)

(assert (=> b!1477742 m!1363829))

(assert (=> b!1477479 d!156393))

(declare-fun d!156395 () Bool)

(assert (=> d!156395 (= (validKeyInArray!0 (select (arr!47944 a!2862) i!1006)) (and (not (= (select (arr!47944 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47944 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1477477 d!156395))

(declare-fun bm!67900 () Bool)

(declare-fun call!67903 () Bool)

(assert (=> bm!67900 (= call!67903 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156397 () Bool)

(declare-fun res!1003091 () Bool)

(declare-fun e!829187 () Bool)

(assert (=> d!156397 (=> res!1003091 e!829187)))

(assert (=> d!156397 (= res!1003091 (bvsge #b00000000000000000000000000000000 (size!48495 a!2862)))))

(assert (=> d!156397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!829187)))

(declare-fun b!1477745 () Bool)

(declare-fun e!829185 () Bool)

(assert (=> b!1477745 (= e!829185 call!67903)))

(declare-fun b!1477746 () Bool)

(declare-fun e!829186 () Bool)

(assert (=> b!1477746 (= e!829186 call!67903)))

(declare-fun b!1477747 () Bool)

(assert (=> b!1477747 (= e!829185 e!829186)))

(declare-fun lt!645497 () (_ BitVec 64))

(assert (=> b!1477747 (= lt!645497 (select (arr!47944 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!645496 () Unit!49535)

(assert (=> b!1477747 (= lt!645496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645497 #b00000000000000000000000000000000))))

(assert (=> b!1477747 (arrayContainsKey!0 a!2862 lt!645497 #b00000000000000000000000000000000)))

(declare-fun lt!645498 () Unit!49535)

(assert (=> b!1477747 (= lt!645498 lt!645496)))

(declare-fun res!1003092 () Bool)

(assert (=> b!1477747 (= res!1003092 (= (seekEntryOrOpen!0 (select (arr!47944 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12081 #b00000000000000000000000000000000)))))

(assert (=> b!1477747 (=> (not res!1003092) (not e!829186))))

(declare-fun b!1477748 () Bool)

(assert (=> b!1477748 (= e!829187 e!829185)))

(declare-fun c!136856 () Bool)

(assert (=> b!1477748 (= c!136856 (validKeyInArray!0 (select (arr!47944 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156397 (not res!1003091)) b!1477748))

(assert (= (and b!1477748 c!136856) b!1477747))

(assert (= (and b!1477748 (not c!136856)) b!1477745))

(assert (= (and b!1477747 res!1003092) b!1477746))

(assert (= (or b!1477746 b!1477745) bm!67900))

(declare-fun m!1363831 () Bool)

(assert (=> bm!67900 m!1363831))

(assert (=> b!1477747 m!1363771))

(declare-fun m!1363833 () Bool)

(assert (=> b!1477747 m!1363833))

(declare-fun m!1363835 () Bool)

(assert (=> b!1477747 m!1363835))

(assert (=> b!1477747 m!1363771))

(declare-fun m!1363837 () Bool)

(assert (=> b!1477747 m!1363837))

(assert (=> b!1477748 m!1363771))

(assert (=> b!1477748 m!1363771))

(assert (=> b!1477748 m!1363773))

(assert (=> b!1477488 d!156397))

(declare-fun d!156399 () Bool)

(assert (=> d!156399 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126336 d!156399))

(declare-fun d!156403 () Bool)

(assert (=> d!156403 (= (array_inv!37225 a!2862) (bvsge (size!48495 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126336 d!156403))

(declare-fun b!1477749 () Bool)

(declare-fun e!829189 () SeekEntryResult!12081)

(assert (=> b!1477749 (= e!829189 (Found!12081 index!646))))

(declare-fun b!1477750 () Bool)

(declare-fun e!829190 () SeekEntryResult!12081)

(assert (=> b!1477750 (= e!829190 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477751 () Bool)

(declare-fun e!829188 () SeekEntryResult!12081)

(assert (=> b!1477751 (= e!829188 e!829189)))

(declare-fun c!136858 () Bool)

(declare-fun lt!645505 () (_ BitVec 64))

(assert (=> b!1477751 (= c!136858 (= lt!645505 (select (arr!47944 a!2862) j!93)))))

(declare-fun b!1477752 () Bool)

(declare-fun c!136859 () Bool)

(assert (=> b!1477752 (= c!136859 (= lt!645505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477752 (= e!829189 e!829190)))

(declare-fun b!1477753 () Bool)

(assert (=> b!1477753 (= e!829188 Undefined!12081)))

(declare-fun d!156405 () Bool)

(declare-fun lt!645506 () SeekEntryResult!12081)

(assert (=> d!156405 (and (or ((_ is Undefined!12081) lt!645506) (not ((_ is Found!12081) lt!645506)) (and (bvsge (index!50717 lt!645506) #b00000000000000000000000000000000) (bvslt (index!50717 lt!645506) (size!48495 a!2862)))) (or ((_ is Undefined!12081) lt!645506) ((_ is Found!12081) lt!645506) (not ((_ is MissingVacant!12081) lt!645506)) (not (= (index!50719 lt!645506) index!646)) (and (bvsge (index!50719 lt!645506) #b00000000000000000000000000000000) (bvslt (index!50719 lt!645506) (size!48495 a!2862)))) (or ((_ is Undefined!12081) lt!645506) (ite ((_ is Found!12081) lt!645506) (= (select (arr!47944 a!2862) (index!50717 lt!645506)) (select (arr!47944 a!2862) j!93)) (and ((_ is MissingVacant!12081) lt!645506) (= (index!50719 lt!645506) index!646) (= (select (arr!47944 a!2862) (index!50719 lt!645506)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156405 (= lt!645506 e!829188)))

(declare-fun c!136857 () Bool)

(assert (=> d!156405 (= c!136857 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156405 (= lt!645505 (select (arr!47944 a!2862) index!646))))

(assert (=> d!156405 (validMask!0 mask!2687)))

(assert (=> d!156405 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645506)))

(declare-fun b!1477754 () Bool)

(assert (=> b!1477754 (= e!829190 (MissingVacant!12081 index!646))))

(assert (= (and d!156405 c!136857) b!1477753))

(assert (= (and d!156405 (not c!136857)) b!1477751))

(assert (= (and b!1477751 c!136858) b!1477749))

(assert (= (and b!1477751 (not c!136858)) b!1477752))

(assert (= (and b!1477752 c!136859) b!1477754))

(assert (= (and b!1477752 (not c!136859)) b!1477750))

(assert (=> b!1477750 m!1363781))

(assert (=> b!1477750 m!1363781))

(assert (=> b!1477750 m!1363615))

(declare-fun m!1363839 () Bool)

(assert (=> b!1477750 m!1363839))

(declare-fun m!1363841 () Bool)

(assert (=> d!156405 m!1363841))

(declare-fun m!1363843 () Bool)

(assert (=> d!156405 m!1363843))

(assert (=> d!156405 m!1363613))

(assert (=> d!156405 m!1363631))

(assert (=> b!1477481 d!156405))

(declare-fun b!1477755 () Bool)

(declare-fun e!829192 () SeekEntryResult!12081)

(assert (=> b!1477755 (= e!829192 (Intermediate!12081 true (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477756 () Bool)

(declare-fun e!829195 () Bool)

(declare-fun e!829194 () Bool)

(assert (=> b!1477756 (= e!829195 e!829194)))

(declare-fun res!1003094 () Bool)

(declare-fun lt!645508 () SeekEntryResult!12081)

(assert (=> b!1477756 (= res!1003094 (and ((_ is Intermediate!12081) lt!645508) (not (undefined!12893 lt!645508)) (bvslt (x!132496 lt!645508) #b01111111111111111111111111111110) (bvsge (x!132496 lt!645508) #b00000000000000000000000000000000) (bvsge (x!132496 lt!645508) #b00000000000000000000000000000000)))))

(assert (=> b!1477756 (=> (not res!1003094) (not e!829194))))

(declare-fun b!1477757 () Bool)

(assert (=> b!1477757 (= e!829195 (bvsge (x!132496 lt!645508) #b01111111111111111111111111111110))))

(declare-fun e!829193 () SeekEntryResult!12081)

(declare-fun b!1477758 () Bool)

(assert (=> b!1477758 (= e!829193 (Intermediate!12081 false (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477759 () Bool)

(assert (=> b!1477759 (= e!829193 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156407 () Bool)

(assert (=> d!156407 e!829195))

(declare-fun c!136861 () Bool)

(assert (=> d!156407 (= c!136861 (and ((_ is Intermediate!12081) lt!645508) (undefined!12893 lt!645508)))))

(assert (=> d!156407 (= lt!645508 e!829192)))

(declare-fun c!136862 () Bool)

(assert (=> d!156407 (= c!136862 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!645507 () (_ BitVec 64))

(assert (=> d!156407 (= lt!645507 (select (arr!47944 a!2862) (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687)))))

(assert (=> d!156407 (validMask!0 mask!2687)))

(assert (=> d!156407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645508)))

(declare-fun b!1477760 () Bool)

(assert (=> b!1477760 (and (bvsge (index!50718 lt!645508) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645508) (size!48495 a!2862)))))

(declare-fun res!1003095 () Bool)

(assert (=> b!1477760 (= res!1003095 (= (select (arr!47944 a!2862) (index!50718 lt!645508)) (select (arr!47944 a!2862) j!93)))))

(declare-fun e!829191 () Bool)

(assert (=> b!1477760 (=> res!1003095 e!829191)))

(assert (=> b!1477760 (= e!829194 e!829191)))

(declare-fun b!1477761 () Bool)

(assert (=> b!1477761 (= e!829192 e!829193)))

(declare-fun c!136860 () Bool)

(assert (=> b!1477761 (= c!136860 (or (= lt!645507 (select (arr!47944 a!2862) j!93)) (= (bvadd lt!645507 lt!645507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477762 () Bool)

(assert (=> b!1477762 (and (bvsge (index!50718 lt!645508) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645508) (size!48495 a!2862)))))

(declare-fun res!1003093 () Bool)

(assert (=> b!1477762 (= res!1003093 (= (select (arr!47944 a!2862) (index!50718 lt!645508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477762 (=> res!1003093 e!829191)))

(declare-fun b!1477763 () Bool)

(assert (=> b!1477763 (and (bvsge (index!50718 lt!645508) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645508) (size!48495 a!2862)))))

(assert (=> b!1477763 (= e!829191 (= (select (arr!47944 a!2862) (index!50718 lt!645508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156407 c!136862) b!1477755))

(assert (= (and d!156407 (not c!136862)) b!1477761))

(assert (= (and b!1477761 c!136860) b!1477758))

(assert (= (and b!1477761 (not c!136860)) b!1477759))

(assert (= (and d!156407 c!136861) b!1477757))

(assert (= (and d!156407 (not c!136861)) b!1477756))

(assert (= (and b!1477756 res!1003094) b!1477760))

(assert (= (and b!1477760 (not res!1003095)) b!1477762))

(assert (= (and b!1477762 (not res!1003093)) b!1477763))

(declare-fun m!1363845 () Bool)

(assert (=> b!1477762 m!1363845))

(assert (=> b!1477759 m!1363627))

(declare-fun m!1363847 () Bool)

(assert (=> b!1477759 m!1363847))

(assert (=> b!1477759 m!1363847))

(assert (=> b!1477759 m!1363615))

(declare-fun m!1363849 () Bool)

(assert (=> b!1477759 m!1363849))

(assert (=> b!1477760 m!1363845))

(assert (=> b!1477763 m!1363845))

(assert (=> d!156407 m!1363627))

(declare-fun m!1363851 () Bool)

(assert (=> d!156407 m!1363851))

(assert (=> d!156407 m!1363631))

(assert (=> b!1477490 d!156407))

(declare-fun d!156409 () Bool)

(declare-fun lt!645510 () (_ BitVec 32))

(declare-fun lt!645509 () (_ BitVec 32))

(assert (=> d!156409 (= lt!645510 (bvmul (bvxor lt!645509 (bvlshr lt!645509 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156409 (= lt!645509 ((_ extract 31 0) (bvand (bvxor (select (arr!47944 a!2862) j!93) (bvlshr (select (arr!47944 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156409 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1003074 (let ((h!35810 ((_ extract 31 0) (bvand (bvxor (select (arr!47944 a!2862) j!93) (bvlshr (select (arr!47944 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132500 (bvmul (bvxor h!35810 (bvlshr h!35810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132500 (bvlshr x!132500 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1003074 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1003074 #b00000000000000000000000000000000))))))

(assert (=> d!156409 (= (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (bvand (bvxor lt!645510 (bvlshr lt!645510 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1477490 d!156409))

(declare-fun b!1477764 () Bool)

(declare-fun e!829197 () SeekEntryResult!12081)

(assert (=> b!1477764 (= e!829197 (Intermediate!12081 true index!646 x!665))))

(declare-fun b!1477765 () Bool)

(declare-fun e!829200 () Bool)

(declare-fun e!829199 () Bool)

(assert (=> b!1477765 (= e!829200 e!829199)))

(declare-fun res!1003097 () Bool)

(declare-fun lt!645512 () SeekEntryResult!12081)

(assert (=> b!1477765 (= res!1003097 (and ((_ is Intermediate!12081) lt!645512) (not (undefined!12893 lt!645512)) (bvslt (x!132496 lt!645512) #b01111111111111111111111111111110) (bvsge (x!132496 lt!645512) #b00000000000000000000000000000000) (bvsge (x!132496 lt!645512) x!665)))))

(assert (=> b!1477765 (=> (not res!1003097) (not e!829199))))

(declare-fun b!1477766 () Bool)

(assert (=> b!1477766 (= e!829200 (bvsge (x!132496 lt!645512) #b01111111111111111111111111111110))))

(declare-fun b!1477767 () Bool)

(declare-fun e!829198 () SeekEntryResult!12081)

(assert (=> b!1477767 (= e!829198 (Intermediate!12081 false index!646 x!665))))

(declare-fun b!1477768 () Bool)

(assert (=> b!1477768 (= e!829198 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156411 () Bool)

(assert (=> d!156411 e!829200))

(declare-fun c!136864 () Bool)

(assert (=> d!156411 (= c!136864 (and ((_ is Intermediate!12081) lt!645512) (undefined!12893 lt!645512)))))

(assert (=> d!156411 (= lt!645512 e!829197)))

(declare-fun c!136865 () Bool)

(assert (=> d!156411 (= c!136865 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645511 () (_ BitVec 64))

(assert (=> d!156411 (= lt!645511 (select (arr!47944 a!2862) index!646))))

(assert (=> d!156411 (validMask!0 mask!2687)))

(assert (=> d!156411 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645512)))

(declare-fun b!1477769 () Bool)

(assert (=> b!1477769 (and (bvsge (index!50718 lt!645512) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645512) (size!48495 a!2862)))))

(declare-fun res!1003098 () Bool)

(assert (=> b!1477769 (= res!1003098 (= (select (arr!47944 a!2862) (index!50718 lt!645512)) (select (arr!47944 a!2862) j!93)))))

(declare-fun e!829196 () Bool)

(assert (=> b!1477769 (=> res!1003098 e!829196)))

(assert (=> b!1477769 (= e!829199 e!829196)))

(declare-fun b!1477770 () Bool)

(assert (=> b!1477770 (= e!829197 e!829198)))

(declare-fun c!136863 () Bool)

(assert (=> b!1477770 (= c!136863 (or (= lt!645511 (select (arr!47944 a!2862) j!93)) (= (bvadd lt!645511 lt!645511) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477771 () Bool)

(assert (=> b!1477771 (and (bvsge (index!50718 lt!645512) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645512) (size!48495 a!2862)))))

(declare-fun res!1003096 () Bool)

(assert (=> b!1477771 (= res!1003096 (= (select (arr!47944 a!2862) (index!50718 lt!645512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477771 (=> res!1003096 e!829196)))

(declare-fun b!1477772 () Bool)

(assert (=> b!1477772 (and (bvsge (index!50718 lt!645512) #b00000000000000000000000000000000) (bvslt (index!50718 lt!645512) (size!48495 a!2862)))))

(assert (=> b!1477772 (= e!829196 (= (select (arr!47944 a!2862) (index!50718 lt!645512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156411 c!136865) b!1477764))

(assert (= (and d!156411 (not c!136865)) b!1477770))

(assert (= (and b!1477770 c!136863) b!1477767))

(assert (= (and b!1477770 (not c!136863)) b!1477768))

(assert (= (and d!156411 c!136864) b!1477766))

(assert (= (and d!156411 (not c!136864)) b!1477765))

(assert (= (and b!1477765 res!1003097) b!1477769))

(assert (= (and b!1477769 (not res!1003098)) b!1477771))

(assert (= (and b!1477771 (not res!1003096)) b!1477772))

(declare-fun m!1363853 () Bool)

(assert (=> b!1477771 m!1363853))

(assert (=> b!1477768 m!1363781))

(assert (=> b!1477768 m!1363781))

(assert (=> b!1477768 m!1363615))

(declare-fun m!1363855 () Bool)

(assert (=> b!1477768 m!1363855))

(assert (=> b!1477769 m!1363853))

(assert (=> b!1477772 m!1363853))

(assert (=> d!156411 m!1363613))

(assert (=> d!156411 m!1363631))

(assert (=> b!1477480 d!156411))

(check-sat (not b!1477614) (not bm!67900) (not b!1477734) (not b!1477748) (not d!156393) (not d!156373) (not b!1477747) (not b!1477630) (not d!156411) (not d!156407) (not b!1477768) (not b!1477750) (not d!156405) (not bm!67893) (not d!156387) (not b!1477740) (not b!1477668) (not b!1477759) (not b!1477645) (not bm!67896) (not b!1477629) (not b!1477642) (not d!156377) (not d!156381) (not b!1477677) (not d!156369) (not b!1477641))
(check-sat)
