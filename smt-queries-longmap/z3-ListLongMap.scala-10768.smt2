; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125896 () Bool)

(assert start!125896)

(declare-fun b!1474473 () Bool)

(declare-fun res!1001772 () Bool)

(declare-fun e!827250 () Bool)

(assert (=> b!1474473 (=> (not res!1001772) (not e!827250))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12125 0))(
  ( (MissingZero!12125 (index!50892 (_ BitVec 32))) (Found!12125 (index!50893 (_ BitVec 32))) (Intermediate!12125 (undefined!12937 Bool) (index!50894 (_ BitVec 32)) (x!132468 (_ BitVec 32))) (Undefined!12125) (MissingVacant!12125 (index!50895 (_ BitVec 32))) )
))
(declare-fun lt!644089 () SeekEntryResult!12125)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99151 0))(
  ( (array!99152 (arr!47860 (Array (_ BitVec 32) (_ BitVec 64))) (size!48412 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99151)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99151 (_ BitVec 32)) SeekEntryResult!12125)

(assert (=> b!1474473 (= res!1001772 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644089))))

(declare-fun b!1474474 () Bool)

(declare-fun res!1001779 () Bool)

(declare-fun e!827253 () Bool)

(assert (=> b!1474474 (=> (not res!1001779) (not e!827253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474474 (= res!1001779 (validKeyInArray!0 (select (arr!47860 a!2862) j!93)))))

(declare-fun b!1474475 () Bool)

(declare-fun e!827254 () Bool)

(assert (=> b!1474475 (= e!827250 e!827254)))

(declare-fun res!1001773 () Bool)

(assert (=> b!1474475 (=> (not res!1001773) (not e!827254))))

(declare-fun lt!644091 () SeekEntryResult!12125)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474475 (= res!1001773 (= lt!644091 (Intermediate!12125 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644086 () array!99151)

(declare-fun lt!644088 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474475 (= lt!644091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644088 mask!2687) lt!644088 lt!644086 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474475 (= lt!644088 (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474476 () Bool)

(declare-fun res!1001766 () Bool)

(assert (=> b!1474476 (=> (not res!1001766) (not e!827253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99151 (_ BitVec 32)) Bool)

(assert (=> b!1474476 (= res!1001766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474477 () Bool)

(declare-fun res!1001770 () Bool)

(assert (=> b!1474477 (=> (not res!1001770) (not e!827253))))

(assert (=> b!1474477 (= res!1001770 (validKeyInArray!0 (select (arr!47860 a!2862) i!1006)))))

(declare-fun b!1474478 () Bool)

(declare-fun res!1001777 () Bool)

(assert (=> b!1474478 (=> (not res!1001777) (not e!827254))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474478 (= res!1001777 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474479 () Bool)

(declare-fun res!1001769 () Bool)

(assert (=> b!1474479 (=> (not res!1001769) (not e!827253))))

(assert (=> b!1474479 (= res!1001769 (and (= (size!48412 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48412 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48412 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474480 () Bool)

(declare-fun res!1001776 () Bool)

(assert (=> b!1474480 (=> (not res!1001776) (not e!827253))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1474480 (= res!1001776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48412 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48412 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48412 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474481 () Bool)

(declare-fun e!827251 () Bool)

(assert (=> b!1474481 (= e!827253 e!827251)))

(declare-fun res!1001775 () Bool)

(assert (=> b!1474481 (=> (not res!1001775) (not e!827251))))

(assert (=> b!1474481 (= res!1001775 (= (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474481 (= lt!644086 (array!99152 (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48412 a!2862)))))

(declare-fun b!1474482 () Bool)

(declare-fun res!1001778 () Bool)

(assert (=> b!1474482 (=> (not res!1001778) (not e!827253))))

(declare-datatypes ((List!34439 0))(
  ( (Nil!34436) (Cons!34435 (h!35794 (_ BitVec 64)) (t!49125 List!34439)) )
))
(declare-fun arrayNoDuplicates!0 (array!99151 (_ BitVec 32) List!34439) Bool)

(assert (=> b!1474482 (= res!1001778 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34436))))

(declare-fun b!1474483 () Bool)

(declare-fun e!827252 () Bool)

(assert (=> b!1474483 (= e!827252 (= lt!644091 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644088 lt!644086 mask!2687)))))

(declare-fun b!1474485 () Bool)

(declare-fun e!827256 () Bool)

(assert (=> b!1474485 (= e!827254 (not e!827256))))

(declare-fun res!1001768 () Bool)

(assert (=> b!1474485 (=> res!1001768 e!827256)))

(assert (=> b!1474485 (= res!1001768 (or (and (= (select (arr!47860 a!2862) index!646) (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47860 a!2862) index!646) (select (arr!47860 a!2862) j!93))) (not (= (select (arr!47860 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!644087 () SeekEntryResult!12125)

(assert (=> b!1474485 (and (= lt!644087 (Found!12125 j!93)) (or (= (select (arr!47860 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47860 a!2862) intermediateBeforeIndex!19) (select (arr!47860 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99151 (_ BitVec 32)) SeekEntryResult!12125)

(assert (=> b!1474485 (= lt!644087 (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1474485 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49431 0))(
  ( (Unit!49432) )
))
(declare-fun lt!644090 () Unit!49431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49431)

(assert (=> b!1474485 (= lt!644090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474486 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99151 (_ BitVec 32)) SeekEntryResult!12125)

(assert (=> b!1474486 (= e!827256 (= lt!644087 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1474487 () Bool)

(assert (=> b!1474487 (= e!827251 e!827250)))

(declare-fun res!1001771 () Bool)

(assert (=> b!1474487 (=> (not res!1001771) (not e!827250))))

(assert (=> b!1474487 (= res!1001771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644089))))

(assert (=> b!1474487 (= lt!644089 (Intermediate!12125 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474488 () Bool)

(declare-fun res!1001774 () Bool)

(assert (=> b!1474488 (=> (not res!1001774) (not e!827254))))

(assert (=> b!1474488 (= res!1001774 e!827252)))

(declare-fun c!135871 () Bool)

(assert (=> b!1474488 (= c!135871 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474484 () Bool)

(assert (=> b!1474484 (= e!827252 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644088 lt!644086 mask!2687) (seekEntryOrOpen!0 lt!644088 lt!644086 mask!2687)))))

(declare-fun res!1001767 () Bool)

(assert (=> start!125896 (=> (not res!1001767) (not e!827253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125896 (= res!1001767 (validMask!0 mask!2687))))

(assert (=> start!125896 e!827253))

(assert (=> start!125896 true))

(declare-fun array_inv!37093 (array!99151) Bool)

(assert (=> start!125896 (array_inv!37093 a!2862)))

(assert (= (and start!125896 res!1001767) b!1474479))

(assert (= (and b!1474479 res!1001769) b!1474477))

(assert (= (and b!1474477 res!1001770) b!1474474))

(assert (= (and b!1474474 res!1001779) b!1474476))

(assert (= (and b!1474476 res!1001766) b!1474482))

(assert (= (and b!1474482 res!1001778) b!1474480))

(assert (= (and b!1474480 res!1001776) b!1474481))

(assert (= (and b!1474481 res!1001775) b!1474487))

(assert (= (and b!1474487 res!1001771) b!1474473))

(assert (= (and b!1474473 res!1001772) b!1474475))

(assert (= (and b!1474475 res!1001773) b!1474488))

(assert (= (and b!1474488 c!135871) b!1474483))

(assert (= (and b!1474488 (not c!135871)) b!1474484))

(assert (= (and b!1474488 res!1001774) b!1474478))

(assert (= (and b!1474478 res!1001777) b!1474485))

(assert (= (and b!1474485 (not res!1001768)) b!1474486))

(declare-fun m!1360419 () Bool)

(assert (=> b!1474474 m!1360419))

(assert (=> b!1474474 m!1360419))

(declare-fun m!1360421 () Bool)

(assert (=> b!1474474 m!1360421))

(declare-fun m!1360423 () Bool)

(assert (=> b!1474483 m!1360423))

(declare-fun m!1360425 () Bool)

(assert (=> b!1474475 m!1360425))

(assert (=> b!1474475 m!1360425))

(declare-fun m!1360427 () Bool)

(assert (=> b!1474475 m!1360427))

(declare-fun m!1360429 () Bool)

(assert (=> b!1474475 m!1360429))

(declare-fun m!1360431 () Bool)

(assert (=> b!1474475 m!1360431))

(declare-fun m!1360433 () Bool)

(assert (=> b!1474484 m!1360433))

(declare-fun m!1360435 () Bool)

(assert (=> b!1474484 m!1360435))

(declare-fun m!1360437 () Bool)

(assert (=> b!1474485 m!1360437))

(assert (=> b!1474485 m!1360429))

(declare-fun m!1360439 () Bool)

(assert (=> b!1474485 m!1360439))

(declare-fun m!1360441 () Bool)

(assert (=> b!1474485 m!1360441))

(declare-fun m!1360443 () Bool)

(assert (=> b!1474485 m!1360443))

(assert (=> b!1474485 m!1360419))

(declare-fun m!1360445 () Bool)

(assert (=> b!1474485 m!1360445))

(declare-fun m!1360447 () Bool)

(assert (=> b!1474485 m!1360447))

(assert (=> b!1474485 m!1360419))

(assert (=> b!1474487 m!1360419))

(assert (=> b!1474487 m!1360419))

(declare-fun m!1360449 () Bool)

(assert (=> b!1474487 m!1360449))

(assert (=> b!1474487 m!1360449))

(assert (=> b!1474487 m!1360419))

(declare-fun m!1360451 () Bool)

(assert (=> b!1474487 m!1360451))

(declare-fun m!1360453 () Bool)

(assert (=> b!1474477 m!1360453))

(assert (=> b!1474477 m!1360453))

(declare-fun m!1360455 () Bool)

(assert (=> b!1474477 m!1360455))

(declare-fun m!1360457 () Bool)

(assert (=> start!125896 m!1360457))

(declare-fun m!1360459 () Bool)

(assert (=> start!125896 m!1360459))

(assert (=> b!1474473 m!1360419))

(assert (=> b!1474473 m!1360419))

(declare-fun m!1360461 () Bool)

(assert (=> b!1474473 m!1360461))

(declare-fun m!1360463 () Bool)

(assert (=> b!1474476 m!1360463))

(declare-fun m!1360465 () Bool)

(assert (=> b!1474482 m!1360465))

(assert (=> b!1474481 m!1360429))

(declare-fun m!1360467 () Bool)

(assert (=> b!1474481 m!1360467))

(assert (=> b!1474486 m!1360419))

(assert (=> b!1474486 m!1360419))

(declare-fun m!1360469 () Bool)

(assert (=> b!1474486 m!1360469))

(check-sat (not b!1474476) (not b!1474477) (not b!1474473) (not b!1474486) (not b!1474485) (not start!125896) (not b!1474475) (not b!1474483) (not b!1474482) (not b!1474474) (not b!1474487) (not b!1474484))
(check-sat)
(get-model)

(declare-fun d!155481 () Bool)

(assert (=> d!155481 (= (validKeyInArray!0 (select (arr!47860 a!2862) i!1006)) (and (not (= (select (arr!47860 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47860 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474477 d!155481))

(declare-fun b!1474593 () Bool)

(declare-fun e!827307 () Bool)

(declare-fun call!67733 () Bool)

(assert (=> b!1474593 (= e!827307 call!67733)))

(declare-fun b!1474594 () Bool)

(declare-fun e!827305 () Bool)

(assert (=> b!1474594 (= e!827305 call!67733)))

(declare-fun b!1474595 () Bool)

(assert (=> b!1474595 (= e!827307 e!827305)))

(declare-fun lt!644134 () (_ BitVec 64))

(assert (=> b!1474595 (= lt!644134 (select (arr!47860 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644135 () Unit!49431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99151 (_ BitVec 64) (_ BitVec 32)) Unit!49431)

(assert (=> b!1474595 (= lt!644135 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644134 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1474595 (arrayContainsKey!0 a!2862 lt!644134 #b00000000000000000000000000000000)))

(declare-fun lt!644136 () Unit!49431)

(assert (=> b!1474595 (= lt!644136 lt!644135)))

(declare-fun res!1001868 () Bool)

(assert (=> b!1474595 (= res!1001868 (= (seekEntryOrOpen!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12125 #b00000000000000000000000000000000)))))

(assert (=> b!1474595 (=> (not res!1001868) (not e!827305))))

(declare-fun bm!67730 () Bool)

(assert (=> bm!67730 (= call!67733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474596 () Bool)

(declare-fun e!827306 () Bool)

(assert (=> b!1474596 (= e!827306 e!827307)))

(declare-fun c!135880 () Bool)

(assert (=> b!1474596 (= c!135880 (validKeyInArray!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155483 () Bool)

(declare-fun res!1001869 () Bool)

(assert (=> d!155483 (=> res!1001869 e!827306)))

(assert (=> d!155483 (= res!1001869 (bvsge #b00000000000000000000000000000000 (size!48412 a!2862)))))

(assert (=> d!155483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827306)))

(assert (= (and d!155483 (not res!1001869)) b!1474596))

(assert (= (and b!1474596 c!135880) b!1474595))

(assert (= (and b!1474596 (not c!135880)) b!1474593))

(assert (= (and b!1474595 res!1001868) b!1474594))

(assert (= (or b!1474594 b!1474593) bm!67730))

(declare-fun m!1360575 () Bool)

(assert (=> b!1474595 m!1360575))

(declare-fun m!1360577 () Bool)

(assert (=> b!1474595 m!1360577))

(declare-fun m!1360579 () Bool)

(assert (=> b!1474595 m!1360579))

(assert (=> b!1474595 m!1360575))

(declare-fun m!1360581 () Bool)

(assert (=> b!1474595 m!1360581))

(declare-fun m!1360583 () Bool)

(assert (=> bm!67730 m!1360583))

(assert (=> b!1474596 m!1360575))

(assert (=> b!1474596 m!1360575))

(declare-fun m!1360585 () Bool)

(assert (=> b!1474596 m!1360585))

(assert (=> b!1474476 d!155483))

(declare-fun d!155485 () Bool)

(declare-fun e!827321 () Bool)

(assert (=> d!155485 e!827321))

(declare-fun c!135889 () Bool)

(declare-fun lt!644142 () SeekEntryResult!12125)

(get-info :version)

(assert (=> d!155485 (= c!135889 (and ((_ is Intermediate!12125) lt!644142) (undefined!12937 lt!644142)))))

(declare-fun e!827319 () SeekEntryResult!12125)

(assert (=> d!155485 (= lt!644142 e!827319)))

(declare-fun c!135887 () Bool)

(assert (=> d!155485 (= c!135887 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644141 () (_ BitVec 64))

(assert (=> d!155485 (= lt!644141 (select (arr!47860 a!2862) (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687)))))

(assert (=> d!155485 (validMask!0 mask!2687)))

(assert (=> d!155485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644142)))

(declare-fun b!1474615 () Bool)

(assert (=> b!1474615 (and (bvsge (index!50894 lt!644142) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644142) (size!48412 a!2862)))))

(declare-fun e!827322 () Bool)

(assert (=> b!1474615 (= e!827322 (= (select (arr!47860 a!2862) (index!50894 lt!644142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474616 () Bool)

(assert (=> b!1474616 (and (bvsge (index!50894 lt!644142) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644142) (size!48412 a!2862)))))

(declare-fun res!1001877 () Bool)

(assert (=> b!1474616 (= res!1001877 (= (select (arr!47860 a!2862) (index!50894 lt!644142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474616 (=> res!1001877 e!827322)))

(declare-fun b!1474617 () Bool)

(declare-fun e!827318 () SeekEntryResult!12125)

(assert (=> b!1474617 (= e!827319 e!827318)))

(declare-fun c!135888 () Bool)

(assert (=> b!1474617 (= c!135888 (or (= lt!644141 (select (arr!47860 a!2862) j!93)) (= (bvadd lt!644141 lt!644141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474618 () Bool)

(assert (=> b!1474618 (= e!827318 (Intermediate!12125 false (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474619 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474619 (= e!827318 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474620 () Bool)

(assert (=> b!1474620 (and (bvsge (index!50894 lt!644142) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644142) (size!48412 a!2862)))))

(declare-fun res!1001876 () Bool)

(assert (=> b!1474620 (= res!1001876 (= (select (arr!47860 a!2862) (index!50894 lt!644142)) (select (arr!47860 a!2862) j!93)))))

(assert (=> b!1474620 (=> res!1001876 e!827322)))

(declare-fun e!827320 () Bool)

(assert (=> b!1474620 (= e!827320 e!827322)))

(declare-fun b!1474621 () Bool)

(assert (=> b!1474621 (= e!827321 (bvsge (x!132468 lt!644142) #b01111111111111111111111111111110))))

(declare-fun b!1474622 () Bool)

(assert (=> b!1474622 (= e!827319 (Intermediate!12125 true (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474623 () Bool)

(assert (=> b!1474623 (= e!827321 e!827320)))

(declare-fun res!1001878 () Bool)

(assert (=> b!1474623 (= res!1001878 (and ((_ is Intermediate!12125) lt!644142) (not (undefined!12937 lt!644142)) (bvslt (x!132468 lt!644142) #b01111111111111111111111111111110) (bvsge (x!132468 lt!644142) #b00000000000000000000000000000000) (bvsge (x!132468 lt!644142) #b00000000000000000000000000000000)))))

(assert (=> b!1474623 (=> (not res!1001878) (not e!827320))))

(assert (= (and d!155485 c!135887) b!1474622))

(assert (= (and d!155485 (not c!135887)) b!1474617))

(assert (= (and b!1474617 c!135888) b!1474618))

(assert (= (and b!1474617 (not c!135888)) b!1474619))

(assert (= (and d!155485 c!135889) b!1474621))

(assert (= (and d!155485 (not c!135889)) b!1474623))

(assert (= (and b!1474623 res!1001878) b!1474620))

(assert (= (and b!1474620 (not res!1001876)) b!1474616))

(assert (= (and b!1474616 (not res!1001877)) b!1474615))

(assert (=> b!1474619 m!1360449))

(declare-fun m!1360587 () Bool)

(assert (=> b!1474619 m!1360587))

(assert (=> b!1474619 m!1360587))

(assert (=> b!1474619 m!1360419))

(declare-fun m!1360589 () Bool)

(assert (=> b!1474619 m!1360589))

(declare-fun m!1360591 () Bool)

(assert (=> b!1474620 m!1360591))

(assert (=> b!1474615 m!1360591))

(assert (=> d!155485 m!1360449))

(declare-fun m!1360593 () Bool)

(assert (=> d!155485 m!1360593))

(assert (=> d!155485 m!1360457))

(assert (=> b!1474616 m!1360591))

(assert (=> b!1474487 d!155485))

(declare-fun d!155487 () Bool)

(declare-fun lt!644148 () (_ BitVec 32))

(declare-fun lt!644147 () (_ BitVec 32))

(assert (=> d!155487 (= lt!644148 (bvmul (bvxor lt!644147 (bvlshr lt!644147 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155487 (= lt!644147 ((_ extract 31 0) (bvand (bvxor (select (arr!47860 a!2862) j!93) (bvlshr (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155487 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001879 (let ((h!35797 ((_ extract 31 0) (bvand (bvxor (select (arr!47860 a!2862) j!93) (bvlshr (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132472 (bvmul (bvxor h!35797 (bvlshr h!35797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132472 (bvlshr x!132472 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001879 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001879 #b00000000000000000000000000000000))))))

(assert (=> d!155487 (= (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (bvand (bvxor lt!644148 (bvlshr lt!644148 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474487 d!155487))

(declare-fun b!1474634 () Bool)

(declare-fun e!827333 () Bool)

(declare-fun contains!9869 (List!34439 (_ BitVec 64)) Bool)

(assert (=> b!1474634 (= e!827333 (contains!9869 Nil!34436 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474635 () Bool)

(declare-fun e!827331 () Bool)

(declare-fun call!67736 () Bool)

(assert (=> b!1474635 (= e!827331 call!67736)))

(declare-fun b!1474636 () Bool)

(declare-fun e!827334 () Bool)

(declare-fun e!827332 () Bool)

(assert (=> b!1474636 (= e!827334 e!827332)))

(declare-fun res!1001887 () Bool)

(assert (=> b!1474636 (=> (not res!1001887) (not e!827332))))

(assert (=> b!1474636 (= res!1001887 (not e!827333))))

(declare-fun res!1001888 () Bool)

(assert (=> b!1474636 (=> (not res!1001888) (not e!827333))))

(assert (=> b!1474636 (= res!1001888 (validKeyInArray!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155489 () Bool)

(declare-fun res!1001886 () Bool)

(assert (=> d!155489 (=> res!1001886 e!827334)))

(assert (=> d!155489 (= res!1001886 (bvsge #b00000000000000000000000000000000 (size!48412 a!2862)))))

(assert (=> d!155489 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34436) e!827334)))

(declare-fun b!1474637 () Bool)

(assert (=> b!1474637 (= e!827332 e!827331)))

(declare-fun c!135892 () Bool)

(assert (=> b!1474637 (= c!135892 (validKeyInArray!0 (select (arr!47860 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474638 () Bool)

(assert (=> b!1474638 (= e!827331 call!67736)))

(declare-fun bm!67733 () Bool)

(assert (=> bm!67733 (= call!67736 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135892 (Cons!34435 (select (arr!47860 a!2862) #b00000000000000000000000000000000) Nil!34436) Nil!34436)))))

(assert (= (and d!155489 (not res!1001886)) b!1474636))

(assert (= (and b!1474636 res!1001888) b!1474634))

(assert (= (and b!1474636 res!1001887) b!1474637))

(assert (= (and b!1474637 c!135892) b!1474638))

(assert (= (and b!1474637 (not c!135892)) b!1474635))

(assert (= (or b!1474638 b!1474635) bm!67733))

(assert (=> b!1474634 m!1360575))

(assert (=> b!1474634 m!1360575))

(declare-fun m!1360595 () Bool)

(assert (=> b!1474634 m!1360595))

(assert (=> b!1474636 m!1360575))

(assert (=> b!1474636 m!1360575))

(assert (=> b!1474636 m!1360585))

(assert (=> b!1474637 m!1360575))

(assert (=> b!1474637 m!1360575))

(assert (=> b!1474637 m!1360585))

(assert (=> bm!67733 m!1360575))

(declare-fun m!1360597 () Bool)

(assert (=> bm!67733 m!1360597))

(assert (=> b!1474482 d!155489))

(declare-fun d!155491 () Bool)

(declare-fun e!827338 () Bool)

(assert (=> d!155491 e!827338))

(declare-fun c!135895 () Bool)

(declare-fun lt!644150 () SeekEntryResult!12125)

(assert (=> d!155491 (= c!135895 (and ((_ is Intermediate!12125) lt!644150) (undefined!12937 lt!644150)))))

(declare-fun e!827336 () SeekEntryResult!12125)

(assert (=> d!155491 (= lt!644150 e!827336)))

(declare-fun c!135893 () Bool)

(assert (=> d!155491 (= c!135893 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644149 () (_ BitVec 64))

(assert (=> d!155491 (= lt!644149 (select (arr!47860 a!2862) index!646))))

(assert (=> d!155491 (validMask!0 mask!2687)))

(assert (=> d!155491 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644150)))

(declare-fun b!1474639 () Bool)

(assert (=> b!1474639 (and (bvsge (index!50894 lt!644150) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644150) (size!48412 a!2862)))))

(declare-fun e!827339 () Bool)

(assert (=> b!1474639 (= e!827339 (= (select (arr!47860 a!2862) (index!50894 lt!644150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474640 () Bool)

(assert (=> b!1474640 (and (bvsge (index!50894 lt!644150) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644150) (size!48412 a!2862)))))

(declare-fun res!1001890 () Bool)

(assert (=> b!1474640 (= res!1001890 (= (select (arr!47860 a!2862) (index!50894 lt!644150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474640 (=> res!1001890 e!827339)))

(declare-fun b!1474641 () Bool)

(declare-fun e!827335 () SeekEntryResult!12125)

(assert (=> b!1474641 (= e!827336 e!827335)))

(declare-fun c!135894 () Bool)

(assert (=> b!1474641 (= c!135894 (or (= lt!644149 (select (arr!47860 a!2862) j!93)) (= (bvadd lt!644149 lt!644149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474642 () Bool)

(assert (=> b!1474642 (= e!827335 (Intermediate!12125 false index!646 x!665))))

(declare-fun b!1474643 () Bool)

(assert (=> b!1474643 (= e!827335 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474644 () Bool)

(assert (=> b!1474644 (and (bvsge (index!50894 lt!644150) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644150) (size!48412 a!2862)))))

(declare-fun res!1001889 () Bool)

(assert (=> b!1474644 (= res!1001889 (= (select (arr!47860 a!2862) (index!50894 lt!644150)) (select (arr!47860 a!2862) j!93)))))

(assert (=> b!1474644 (=> res!1001889 e!827339)))

(declare-fun e!827337 () Bool)

(assert (=> b!1474644 (= e!827337 e!827339)))

(declare-fun b!1474645 () Bool)

(assert (=> b!1474645 (= e!827338 (bvsge (x!132468 lt!644150) #b01111111111111111111111111111110))))

(declare-fun b!1474646 () Bool)

(assert (=> b!1474646 (= e!827336 (Intermediate!12125 true index!646 x!665))))

(declare-fun b!1474647 () Bool)

(assert (=> b!1474647 (= e!827338 e!827337)))

(declare-fun res!1001891 () Bool)

(assert (=> b!1474647 (= res!1001891 (and ((_ is Intermediate!12125) lt!644150) (not (undefined!12937 lt!644150)) (bvslt (x!132468 lt!644150) #b01111111111111111111111111111110) (bvsge (x!132468 lt!644150) #b00000000000000000000000000000000) (bvsge (x!132468 lt!644150) x!665)))))

(assert (=> b!1474647 (=> (not res!1001891) (not e!827337))))

(assert (= (and d!155491 c!135893) b!1474646))

(assert (= (and d!155491 (not c!135893)) b!1474641))

(assert (= (and b!1474641 c!135894) b!1474642))

(assert (= (and b!1474641 (not c!135894)) b!1474643))

(assert (= (and d!155491 c!135895) b!1474645))

(assert (= (and d!155491 (not c!135895)) b!1474647))

(assert (= (and b!1474647 res!1001891) b!1474644))

(assert (= (and b!1474644 (not res!1001889)) b!1474640))

(assert (= (and b!1474640 (not res!1001890)) b!1474639))

(declare-fun m!1360599 () Bool)

(assert (=> b!1474643 m!1360599))

(assert (=> b!1474643 m!1360599))

(assert (=> b!1474643 m!1360419))

(declare-fun m!1360601 () Bool)

(assert (=> b!1474643 m!1360601))

(declare-fun m!1360603 () Bool)

(assert (=> b!1474644 m!1360603))

(assert (=> b!1474639 m!1360603))

(assert (=> d!155491 m!1360443))

(assert (=> d!155491 m!1360457))

(assert (=> b!1474640 m!1360603))

(assert (=> b!1474473 d!155491))

(declare-fun d!155493 () Bool)

(declare-fun e!827343 () Bool)

(assert (=> d!155493 e!827343))

(declare-fun c!135898 () Bool)

(declare-fun lt!644152 () SeekEntryResult!12125)

(assert (=> d!155493 (= c!135898 (and ((_ is Intermediate!12125) lt!644152) (undefined!12937 lt!644152)))))

(declare-fun e!827341 () SeekEntryResult!12125)

(assert (=> d!155493 (= lt!644152 e!827341)))

(declare-fun c!135896 () Bool)

(assert (=> d!155493 (= c!135896 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644151 () (_ BitVec 64))

(assert (=> d!155493 (= lt!644151 (select (arr!47860 lt!644086) index!646))))

(assert (=> d!155493 (validMask!0 mask!2687)))

(assert (=> d!155493 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644088 lt!644086 mask!2687) lt!644152)))

(declare-fun b!1474648 () Bool)

(assert (=> b!1474648 (and (bvsge (index!50894 lt!644152) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644152) (size!48412 lt!644086)))))

(declare-fun e!827344 () Bool)

(assert (=> b!1474648 (= e!827344 (= (select (arr!47860 lt!644086) (index!50894 lt!644152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474649 () Bool)

(assert (=> b!1474649 (and (bvsge (index!50894 lt!644152) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644152) (size!48412 lt!644086)))))

(declare-fun res!1001893 () Bool)

(assert (=> b!1474649 (= res!1001893 (= (select (arr!47860 lt!644086) (index!50894 lt!644152)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474649 (=> res!1001893 e!827344)))

(declare-fun b!1474650 () Bool)

(declare-fun e!827340 () SeekEntryResult!12125)

(assert (=> b!1474650 (= e!827341 e!827340)))

(declare-fun c!135897 () Bool)

(assert (=> b!1474650 (= c!135897 (or (= lt!644151 lt!644088) (= (bvadd lt!644151 lt!644151) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474651 () Bool)

(assert (=> b!1474651 (= e!827340 (Intermediate!12125 false index!646 x!665))))

(declare-fun b!1474652 () Bool)

(assert (=> b!1474652 (= e!827340 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644088 lt!644086 mask!2687))))

(declare-fun b!1474653 () Bool)

(assert (=> b!1474653 (and (bvsge (index!50894 lt!644152) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644152) (size!48412 lt!644086)))))

(declare-fun res!1001892 () Bool)

(assert (=> b!1474653 (= res!1001892 (= (select (arr!47860 lt!644086) (index!50894 lt!644152)) lt!644088))))

(assert (=> b!1474653 (=> res!1001892 e!827344)))

(declare-fun e!827342 () Bool)

(assert (=> b!1474653 (= e!827342 e!827344)))

(declare-fun b!1474654 () Bool)

(assert (=> b!1474654 (= e!827343 (bvsge (x!132468 lt!644152) #b01111111111111111111111111111110))))

(declare-fun b!1474655 () Bool)

(assert (=> b!1474655 (= e!827341 (Intermediate!12125 true index!646 x!665))))

(declare-fun b!1474656 () Bool)

(assert (=> b!1474656 (= e!827343 e!827342)))

(declare-fun res!1001894 () Bool)

(assert (=> b!1474656 (= res!1001894 (and ((_ is Intermediate!12125) lt!644152) (not (undefined!12937 lt!644152)) (bvslt (x!132468 lt!644152) #b01111111111111111111111111111110) (bvsge (x!132468 lt!644152) #b00000000000000000000000000000000) (bvsge (x!132468 lt!644152) x!665)))))

(assert (=> b!1474656 (=> (not res!1001894) (not e!827342))))

(assert (= (and d!155493 c!135896) b!1474655))

(assert (= (and d!155493 (not c!135896)) b!1474650))

(assert (= (and b!1474650 c!135897) b!1474651))

(assert (= (and b!1474650 (not c!135897)) b!1474652))

(assert (= (and d!155493 c!135898) b!1474654))

(assert (= (and d!155493 (not c!135898)) b!1474656))

(assert (= (and b!1474656 res!1001894) b!1474653))

(assert (= (and b!1474653 (not res!1001892)) b!1474649))

(assert (= (and b!1474649 (not res!1001893)) b!1474648))

(assert (=> b!1474652 m!1360599))

(assert (=> b!1474652 m!1360599))

(declare-fun m!1360605 () Bool)

(assert (=> b!1474652 m!1360605))

(declare-fun m!1360607 () Bool)

(assert (=> b!1474653 m!1360607))

(assert (=> b!1474648 m!1360607))

(declare-fun m!1360609 () Bool)

(assert (=> d!155493 m!1360609))

(assert (=> d!155493 m!1360457))

(assert (=> b!1474649 m!1360607))

(assert (=> b!1474483 d!155493))

(declare-fun d!155495 () Bool)

(assert (=> d!155495 (= (validKeyInArray!0 (select (arr!47860 a!2862) j!93)) (and (not (= (select (arr!47860 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47860 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474474 d!155495))

(declare-fun b!1474669 () Bool)

(declare-fun e!827351 () SeekEntryResult!12125)

(declare-fun e!827353 () SeekEntryResult!12125)

(assert (=> b!1474669 (= e!827351 e!827353)))

(declare-fun lt!644159 () (_ BitVec 64))

(declare-fun lt!644160 () SeekEntryResult!12125)

(assert (=> b!1474669 (= lt!644159 (select (arr!47860 a!2862) (index!50894 lt!644160)))))

(declare-fun c!135906 () Bool)

(assert (=> b!1474669 (= c!135906 (= lt!644159 (select (arr!47860 a!2862) j!93)))))

(declare-fun b!1474670 () Bool)

(assert (=> b!1474670 (= e!827353 (Found!12125 (index!50894 lt!644160)))))

(declare-fun b!1474671 () Bool)

(assert (=> b!1474671 (= e!827351 Undefined!12125)))

(declare-fun b!1474672 () Bool)

(declare-fun e!827352 () SeekEntryResult!12125)

(assert (=> b!1474672 (= e!827352 (MissingZero!12125 (index!50894 lt!644160)))))

(declare-fun b!1474674 () Bool)

(declare-fun c!135905 () Bool)

(assert (=> b!1474674 (= c!135905 (= lt!644159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474674 (= e!827353 e!827352)))

(declare-fun d!155497 () Bool)

(declare-fun lt!644161 () SeekEntryResult!12125)

(assert (=> d!155497 (and (or ((_ is Undefined!12125) lt!644161) (not ((_ is Found!12125) lt!644161)) (and (bvsge (index!50893 lt!644161) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644161) (size!48412 a!2862)))) (or ((_ is Undefined!12125) lt!644161) ((_ is Found!12125) lt!644161) (not ((_ is MissingZero!12125) lt!644161)) (and (bvsge (index!50892 lt!644161) #b00000000000000000000000000000000) (bvslt (index!50892 lt!644161) (size!48412 a!2862)))) (or ((_ is Undefined!12125) lt!644161) ((_ is Found!12125) lt!644161) ((_ is MissingZero!12125) lt!644161) (not ((_ is MissingVacant!12125) lt!644161)) (and (bvsge (index!50895 lt!644161) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644161) (size!48412 a!2862)))) (or ((_ is Undefined!12125) lt!644161) (ite ((_ is Found!12125) lt!644161) (= (select (arr!47860 a!2862) (index!50893 lt!644161)) (select (arr!47860 a!2862) j!93)) (ite ((_ is MissingZero!12125) lt!644161) (= (select (arr!47860 a!2862) (index!50892 lt!644161)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12125) lt!644161) (= (select (arr!47860 a!2862) (index!50895 lt!644161)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155497 (= lt!644161 e!827351)))

(declare-fun c!135907 () Bool)

(assert (=> d!155497 (= c!135907 (and ((_ is Intermediate!12125) lt!644160) (undefined!12937 lt!644160)))))

(assert (=> d!155497 (= lt!644160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155497 (validMask!0 mask!2687)))

(assert (=> d!155497 (= (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644161)))

(declare-fun b!1474673 () Bool)

(assert (=> b!1474673 (= e!827352 (seekKeyOrZeroReturnVacant!0 (x!132468 lt!644160) (index!50894 lt!644160) (index!50894 lt!644160) (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155497 c!135907) b!1474671))

(assert (= (and d!155497 (not c!135907)) b!1474669))

(assert (= (and b!1474669 c!135906) b!1474670))

(assert (= (and b!1474669 (not c!135906)) b!1474674))

(assert (= (and b!1474674 c!135905) b!1474672))

(assert (= (and b!1474674 (not c!135905)) b!1474673))

(declare-fun m!1360611 () Bool)

(assert (=> b!1474669 m!1360611))

(assert (=> d!155497 m!1360449))

(assert (=> d!155497 m!1360419))

(assert (=> d!155497 m!1360451))

(declare-fun m!1360613 () Bool)

(assert (=> d!155497 m!1360613))

(assert (=> d!155497 m!1360457))

(assert (=> d!155497 m!1360419))

(assert (=> d!155497 m!1360449))

(declare-fun m!1360615 () Bool)

(assert (=> d!155497 m!1360615))

(declare-fun m!1360617 () Bool)

(assert (=> d!155497 m!1360617))

(assert (=> b!1474673 m!1360419))

(declare-fun m!1360619 () Bool)

(assert (=> b!1474673 m!1360619))

(assert (=> b!1474485 d!155497))

(declare-fun b!1474675 () Bool)

(declare-fun e!827356 () Bool)

(declare-fun call!67737 () Bool)

(assert (=> b!1474675 (= e!827356 call!67737)))

(declare-fun b!1474676 () Bool)

(declare-fun e!827354 () Bool)

(assert (=> b!1474676 (= e!827354 call!67737)))

(declare-fun b!1474677 () Bool)

(assert (=> b!1474677 (= e!827356 e!827354)))

(declare-fun lt!644162 () (_ BitVec 64))

(assert (=> b!1474677 (= lt!644162 (select (arr!47860 a!2862) j!93))))

(declare-fun lt!644163 () Unit!49431)

(assert (=> b!1474677 (= lt!644163 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644162 j!93))))

(assert (=> b!1474677 (arrayContainsKey!0 a!2862 lt!644162 #b00000000000000000000000000000000)))

(declare-fun lt!644164 () Unit!49431)

(assert (=> b!1474677 (= lt!644164 lt!644163)))

(declare-fun res!1001895 () Bool)

(assert (=> b!1474677 (= res!1001895 (= (seekEntryOrOpen!0 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) (Found!12125 j!93)))))

(assert (=> b!1474677 (=> (not res!1001895) (not e!827354))))

(declare-fun bm!67734 () Bool)

(assert (=> bm!67734 (= call!67737 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474678 () Bool)

(declare-fun e!827355 () Bool)

(assert (=> b!1474678 (= e!827355 e!827356)))

(declare-fun c!135908 () Bool)

(assert (=> b!1474678 (= c!135908 (validKeyInArray!0 (select (arr!47860 a!2862) j!93)))))

(declare-fun d!155501 () Bool)

(declare-fun res!1001896 () Bool)

(assert (=> d!155501 (=> res!1001896 e!827355)))

(assert (=> d!155501 (= res!1001896 (bvsge j!93 (size!48412 a!2862)))))

(assert (=> d!155501 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827355)))

(assert (= (and d!155501 (not res!1001896)) b!1474678))

(assert (= (and b!1474678 c!135908) b!1474677))

(assert (= (and b!1474678 (not c!135908)) b!1474675))

(assert (= (and b!1474677 res!1001895) b!1474676))

(assert (= (or b!1474676 b!1474675) bm!67734))

(assert (=> b!1474677 m!1360419))

(declare-fun m!1360621 () Bool)

(assert (=> b!1474677 m!1360621))

(declare-fun m!1360623 () Bool)

(assert (=> b!1474677 m!1360623))

(assert (=> b!1474677 m!1360419))

(assert (=> b!1474677 m!1360445))

(declare-fun m!1360625 () Bool)

(assert (=> bm!67734 m!1360625))

(assert (=> b!1474678 m!1360419))

(assert (=> b!1474678 m!1360419))

(assert (=> b!1474678 m!1360421))

(assert (=> b!1474485 d!155501))

(declare-fun d!155503 () Bool)

(assert (=> d!155503 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644171 () Unit!49431)

(declare-fun choose!38 (array!99151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49431)

(assert (=> d!155503 (= lt!644171 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155503 (validMask!0 mask!2687)))

(assert (=> d!155503 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644171)))

(declare-fun bs!42535 () Bool)

(assert (= bs!42535 d!155503))

(assert (=> bs!42535 m!1360447))

(declare-fun m!1360627 () Bool)

(assert (=> bs!42535 m!1360627))

(assert (=> bs!42535 m!1360457))

(assert (=> b!1474485 d!155503))

(declare-fun d!155507 () Bool)

(assert (=> d!155507 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125896 d!155507))

(declare-fun d!155511 () Bool)

(assert (=> d!155511 (= (array_inv!37093 a!2862) (bvsge (size!48412 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125896 d!155511))

(declare-fun b!1474742 () Bool)

(declare-fun e!827391 () SeekEntryResult!12125)

(assert (=> b!1474742 (= e!827391 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644088 lt!644086 mask!2687))))

(declare-fun b!1474743 () Bool)

(declare-fun c!135936 () Bool)

(declare-fun lt!644186 () (_ BitVec 64))

(assert (=> b!1474743 (= c!135936 (= lt!644186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827392 () SeekEntryResult!12125)

(assert (=> b!1474743 (= e!827392 e!827391)))

(declare-fun b!1474744 () Bool)

(declare-fun e!827390 () SeekEntryResult!12125)

(assert (=> b!1474744 (= e!827390 Undefined!12125)))

(declare-fun b!1474745 () Bool)

(assert (=> b!1474745 (= e!827391 (MissingVacant!12125 intermediateAfterIndex!19))))

(declare-fun b!1474746 () Bool)

(assert (=> b!1474746 (= e!827392 (Found!12125 index!646))))

(declare-fun b!1474747 () Bool)

(assert (=> b!1474747 (= e!827390 e!827392)))

(declare-fun c!135938 () Bool)

(assert (=> b!1474747 (= c!135938 (= lt!644186 lt!644088))))

(declare-fun lt!644187 () SeekEntryResult!12125)

(declare-fun d!155513 () Bool)

(assert (=> d!155513 (and (or ((_ is Undefined!12125) lt!644187) (not ((_ is Found!12125) lt!644187)) (and (bvsge (index!50893 lt!644187) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644187) (size!48412 lt!644086)))) (or ((_ is Undefined!12125) lt!644187) ((_ is Found!12125) lt!644187) (not ((_ is MissingVacant!12125) lt!644187)) (not (= (index!50895 lt!644187) intermediateAfterIndex!19)) (and (bvsge (index!50895 lt!644187) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644187) (size!48412 lt!644086)))) (or ((_ is Undefined!12125) lt!644187) (ite ((_ is Found!12125) lt!644187) (= (select (arr!47860 lt!644086) (index!50893 lt!644187)) lt!644088) (and ((_ is MissingVacant!12125) lt!644187) (= (index!50895 lt!644187) intermediateAfterIndex!19) (= (select (arr!47860 lt!644086) (index!50895 lt!644187)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155513 (= lt!644187 e!827390)))

(declare-fun c!135937 () Bool)

(assert (=> d!155513 (= c!135937 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155513 (= lt!644186 (select (arr!47860 lt!644086) index!646))))

(assert (=> d!155513 (validMask!0 mask!2687)))

(assert (=> d!155513 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644088 lt!644086 mask!2687) lt!644187)))

(assert (= (and d!155513 c!135937) b!1474744))

(assert (= (and d!155513 (not c!135937)) b!1474747))

(assert (= (and b!1474747 c!135938) b!1474746))

(assert (= (and b!1474747 (not c!135938)) b!1474743))

(assert (= (and b!1474743 c!135936) b!1474745))

(assert (= (and b!1474743 (not c!135936)) b!1474742))

(assert (=> b!1474742 m!1360599))

(assert (=> b!1474742 m!1360599))

(declare-fun m!1360651 () Bool)

(assert (=> b!1474742 m!1360651))

(declare-fun m!1360653 () Bool)

(assert (=> d!155513 m!1360653))

(declare-fun m!1360655 () Bool)

(assert (=> d!155513 m!1360655))

(assert (=> d!155513 m!1360609))

(assert (=> d!155513 m!1360457))

(assert (=> b!1474484 d!155513))

(declare-fun b!1474748 () Bool)

(declare-fun e!827393 () SeekEntryResult!12125)

(declare-fun e!827395 () SeekEntryResult!12125)

(assert (=> b!1474748 (= e!827393 e!827395)))

(declare-fun lt!644188 () (_ BitVec 64))

(declare-fun lt!644189 () SeekEntryResult!12125)

(assert (=> b!1474748 (= lt!644188 (select (arr!47860 lt!644086) (index!50894 lt!644189)))))

(declare-fun c!135940 () Bool)

(assert (=> b!1474748 (= c!135940 (= lt!644188 lt!644088))))

(declare-fun b!1474749 () Bool)

(assert (=> b!1474749 (= e!827395 (Found!12125 (index!50894 lt!644189)))))

(declare-fun b!1474750 () Bool)

(assert (=> b!1474750 (= e!827393 Undefined!12125)))

(declare-fun b!1474751 () Bool)

(declare-fun e!827394 () SeekEntryResult!12125)

(assert (=> b!1474751 (= e!827394 (MissingZero!12125 (index!50894 lt!644189)))))

(declare-fun b!1474753 () Bool)

(declare-fun c!135939 () Bool)

(assert (=> b!1474753 (= c!135939 (= lt!644188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474753 (= e!827395 e!827394)))

(declare-fun d!155527 () Bool)

(declare-fun lt!644190 () SeekEntryResult!12125)

(assert (=> d!155527 (and (or ((_ is Undefined!12125) lt!644190) (not ((_ is Found!12125) lt!644190)) (and (bvsge (index!50893 lt!644190) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644190) (size!48412 lt!644086)))) (or ((_ is Undefined!12125) lt!644190) ((_ is Found!12125) lt!644190) (not ((_ is MissingZero!12125) lt!644190)) (and (bvsge (index!50892 lt!644190) #b00000000000000000000000000000000) (bvslt (index!50892 lt!644190) (size!48412 lt!644086)))) (or ((_ is Undefined!12125) lt!644190) ((_ is Found!12125) lt!644190) ((_ is MissingZero!12125) lt!644190) (not ((_ is MissingVacant!12125) lt!644190)) (and (bvsge (index!50895 lt!644190) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644190) (size!48412 lt!644086)))) (or ((_ is Undefined!12125) lt!644190) (ite ((_ is Found!12125) lt!644190) (= (select (arr!47860 lt!644086) (index!50893 lt!644190)) lt!644088) (ite ((_ is MissingZero!12125) lt!644190) (= (select (arr!47860 lt!644086) (index!50892 lt!644190)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12125) lt!644190) (= (select (arr!47860 lt!644086) (index!50895 lt!644190)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155527 (= lt!644190 e!827393)))

(declare-fun c!135941 () Bool)

(assert (=> d!155527 (= c!135941 (and ((_ is Intermediate!12125) lt!644189) (undefined!12937 lt!644189)))))

(assert (=> d!155527 (= lt!644189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644088 mask!2687) lt!644088 lt!644086 mask!2687))))

(assert (=> d!155527 (validMask!0 mask!2687)))

(assert (=> d!155527 (= (seekEntryOrOpen!0 lt!644088 lt!644086 mask!2687) lt!644190)))

(declare-fun b!1474752 () Bool)

(assert (=> b!1474752 (= e!827394 (seekKeyOrZeroReturnVacant!0 (x!132468 lt!644189) (index!50894 lt!644189) (index!50894 lt!644189) lt!644088 lt!644086 mask!2687))))

(assert (= (and d!155527 c!135941) b!1474750))

(assert (= (and d!155527 (not c!135941)) b!1474748))

(assert (= (and b!1474748 c!135940) b!1474749))

(assert (= (and b!1474748 (not c!135940)) b!1474753))

(assert (= (and b!1474753 c!135939) b!1474751))

(assert (= (and b!1474753 (not c!135939)) b!1474752))

(declare-fun m!1360657 () Bool)

(assert (=> b!1474748 m!1360657))

(assert (=> d!155527 m!1360425))

(assert (=> d!155527 m!1360427))

(declare-fun m!1360659 () Bool)

(assert (=> d!155527 m!1360659))

(assert (=> d!155527 m!1360457))

(assert (=> d!155527 m!1360425))

(declare-fun m!1360661 () Bool)

(assert (=> d!155527 m!1360661))

(declare-fun m!1360663 () Bool)

(assert (=> d!155527 m!1360663))

(declare-fun m!1360665 () Bool)

(assert (=> b!1474752 m!1360665))

(assert (=> b!1474484 d!155527))

(declare-fun e!827397 () SeekEntryResult!12125)

(declare-fun b!1474754 () Bool)

(assert (=> b!1474754 (= e!827397 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474755 () Bool)

(declare-fun c!135942 () Bool)

(declare-fun lt!644191 () (_ BitVec 64))

(assert (=> b!1474755 (= c!135942 (= lt!644191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827398 () SeekEntryResult!12125)

(assert (=> b!1474755 (= e!827398 e!827397)))

(declare-fun b!1474756 () Bool)

(declare-fun e!827396 () SeekEntryResult!12125)

(assert (=> b!1474756 (= e!827396 Undefined!12125)))

(declare-fun b!1474757 () Bool)

(assert (=> b!1474757 (= e!827397 (MissingVacant!12125 index!646))))

(declare-fun b!1474758 () Bool)

(assert (=> b!1474758 (= e!827398 (Found!12125 index!646))))

(declare-fun b!1474759 () Bool)

(assert (=> b!1474759 (= e!827396 e!827398)))

(declare-fun c!135944 () Bool)

(assert (=> b!1474759 (= c!135944 (= lt!644191 (select (arr!47860 a!2862) j!93)))))

(declare-fun lt!644192 () SeekEntryResult!12125)

(declare-fun d!155529 () Bool)

(assert (=> d!155529 (and (or ((_ is Undefined!12125) lt!644192) (not ((_ is Found!12125) lt!644192)) (and (bvsge (index!50893 lt!644192) #b00000000000000000000000000000000) (bvslt (index!50893 lt!644192) (size!48412 a!2862)))) (or ((_ is Undefined!12125) lt!644192) ((_ is Found!12125) lt!644192) (not ((_ is MissingVacant!12125) lt!644192)) (not (= (index!50895 lt!644192) index!646)) (and (bvsge (index!50895 lt!644192) #b00000000000000000000000000000000) (bvslt (index!50895 lt!644192) (size!48412 a!2862)))) (or ((_ is Undefined!12125) lt!644192) (ite ((_ is Found!12125) lt!644192) (= (select (arr!47860 a!2862) (index!50893 lt!644192)) (select (arr!47860 a!2862) j!93)) (and ((_ is MissingVacant!12125) lt!644192) (= (index!50895 lt!644192) index!646) (= (select (arr!47860 a!2862) (index!50895 lt!644192)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155529 (= lt!644192 e!827396)))

(declare-fun c!135943 () Bool)

(assert (=> d!155529 (= c!135943 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155529 (= lt!644191 (select (arr!47860 a!2862) index!646))))

(assert (=> d!155529 (validMask!0 mask!2687)))

(assert (=> d!155529 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!644192)))

(assert (= (and d!155529 c!135943) b!1474756))

(assert (= (and d!155529 (not c!135943)) b!1474759))

(assert (= (and b!1474759 c!135944) b!1474758))

(assert (= (and b!1474759 (not c!135944)) b!1474755))

(assert (= (and b!1474755 c!135942) b!1474757))

(assert (= (and b!1474755 (not c!135942)) b!1474754))

(assert (=> b!1474754 m!1360599))

(assert (=> b!1474754 m!1360599))

(assert (=> b!1474754 m!1360419))

(declare-fun m!1360667 () Bool)

(assert (=> b!1474754 m!1360667))

(declare-fun m!1360669 () Bool)

(assert (=> d!155529 m!1360669))

(declare-fun m!1360671 () Bool)

(assert (=> d!155529 m!1360671))

(assert (=> d!155529 m!1360443))

(assert (=> d!155529 m!1360457))

(assert (=> b!1474486 d!155529))

(declare-fun d!155531 () Bool)

(declare-fun e!827402 () Bool)

(assert (=> d!155531 e!827402))

(declare-fun c!135947 () Bool)

(declare-fun lt!644194 () SeekEntryResult!12125)

(assert (=> d!155531 (= c!135947 (and ((_ is Intermediate!12125) lt!644194) (undefined!12937 lt!644194)))))

(declare-fun e!827400 () SeekEntryResult!12125)

(assert (=> d!155531 (= lt!644194 e!827400)))

(declare-fun c!135945 () Bool)

(assert (=> d!155531 (= c!135945 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644193 () (_ BitVec 64))

(assert (=> d!155531 (= lt!644193 (select (arr!47860 lt!644086) (toIndex!0 lt!644088 mask!2687)))))

(assert (=> d!155531 (validMask!0 mask!2687)))

(assert (=> d!155531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644088 mask!2687) lt!644088 lt!644086 mask!2687) lt!644194)))

(declare-fun b!1474760 () Bool)

(assert (=> b!1474760 (and (bvsge (index!50894 lt!644194) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644194) (size!48412 lt!644086)))))

(declare-fun e!827403 () Bool)

(assert (=> b!1474760 (= e!827403 (= (select (arr!47860 lt!644086) (index!50894 lt!644194)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474761 () Bool)

(assert (=> b!1474761 (and (bvsge (index!50894 lt!644194) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644194) (size!48412 lt!644086)))))

(declare-fun res!1001907 () Bool)

(assert (=> b!1474761 (= res!1001907 (= (select (arr!47860 lt!644086) (index!50894 lt!644194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474761 (=> res!1001907 e!827403)))

(declare-fun b!1474762 () Bool)

(declare-fun e!827399 () SeekEntryResult!12125)

(assert (=> b!1474762 (= e!827400 e!827399)))

(declare-fun c!135946 () Bool)

(assert (=> b!1474762 (= c!135946 (or (= lt!644193 lt!644088) (= (bvadd lt!644193 lt!644193) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1474763 () Bool)

(assert (=> b!1474763 (= e!827399 (Intermediate!12125 false (toIndex!0 lt!644088 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474764 () Bool)

(assert (=> b!1474764 (= e!827399 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644088 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644088 lt!644086 mask!2687))))

(declare-fun b!1474765 () Bool)

(assert (=> b!1474765 (and (bvsge (index!50894 lt!644194) #b00000000000000000000000000000000) (bvslt (index!50894 lt!644194) (size!48412 lt!644086)))))

(declare-fun res!1001906 () Bool)

(assert (=> b!1474765 (= res!1001906 (= (select (arr!47860 lt!644086) (index!50894 lt!644194)) lt!644088))))

(assert (=> b!1474765 (=> res!1001906 e!827403)))

(declare-fun e!827401 () Bool)

(assert (=> b!1474765 (= e!827401 e!827403)))

(declare-fun b!1474766 () Bool)

(assert (=> b!1474766 (= e!827402 (bvsge (x!132468 lt!644194) #b01111111111111111111111111111110))))

(declare-fun b!1474767 () Bool)

(assert (=> b!1474767 (= e!827400 (Intermediate!12125 true (toIndex!0 lt!644088 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474768 () Bool)

(assert (=> b!1474768 (= e!827402 e!827401)))

(declare-fun res!1001908 () Bool)

(assert (=> b!1474768 (= res!1001908 (and ((_ is Intermediate!12125) lt!644194) (not (undefined!12937 lt!644194)) (bvslt (x!132468 lt!644194) #b01111111111111111111111111111110) (bvsge (x!132468 lt!644194) #b00000000000000000000000000000000) (bvsge (x!132468 lt!644194) #b00000000000000000000000000000000)))))

(assert (=> b!1474768 (=> (not res!1001908) (not e!827401))))

(assert (= (and d!155531 c!135945) b!1474767))

(assert (= (and d!155531 (not c!135945)) b!1474762))

(assert (= (and b!1474762 c!135946) b!1474763))

(assert (= (and b!1474762 (not c!135946)) b!1474764))

(assert (= (and d!155531 c!135947) b!1474766))

(assert (= (and d!155531 (not c!135947)) b!1474768))

(assert (= (and b!1474768 res!1001908) b!1474765))

(assert (= (and b!1474765 (not res!1001906)) b!1474761))

(assert (= (and b!1474761 (not res!1001907)) b!1474760))

(assert (=> b!1474764 m!1360425))

(declare-fun m!1360673 () Bool)

(assert (=> b!1474764 m!1360673))

(assert (=> b!1474764 m!1360673))

(declare-fun m!1360675 () Bool)

(assert (=> b!1474764 m!1360675))

(declare-fun m!1360677 () Bool)

(assert (=> b!1474765 m!1360677))

(assert (=> b!1474760 m!1360677))

(assert (=> d!155531 m!1360425))

(declare-fun m!1360679 () Bool)

(assert (=> d!155531 m!1360679))

(assert (=> d!155531 m!1360457))

(assert (=> b!1474761 m!1360677))

(assert (=> b!1474475 d!155531))

(declare-fun d!155533 () Bool)

(declare-fun lt!644202 () (_ BitVec 32))

(declare-fun lt!644201 () (_ BitVec 32))

(assert (=> d!155533 (= lt!644202 (bvmul (bvxor lt!644201 (bvlshr lt!644201 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155533 (= lt!644201 ((_ extract 31 0) (bvand (bvxor lt!644088 (bvlshr lt!644088 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155533 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001879 (let ((h!35797 ((_ extract 31 0) (bvand (bvxor lt!644088 (bvlshr lt!644088 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132472 (bvmul (bvxor h!35797 (bvlshr h!35797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132472 (bvlshr x!132472 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001879 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001879 #b00000000000000000000000000000000))))))

(assert (=> d!155533 (= (toIndex!0 lt!644088 mask!2687) (bvand (bvxor lt!644202 (bvlshr lt!644202 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474475 d!155533))

(check-sat (not b!1474673) (not b!1474643) (not b!1474754) (not b!1474677) (not b!1474619) (not d!155485) (not b!1474652) (not d!155491) (not d!155513) (not b!1474752) (not b!1474637) (not d!155493) (not b!1474636) (not b!1474634) (not b!1474595) (not bm!67734) (not d!155497) (not b!1474764) (not d!155529) (not bm!67730) (not b!1474678) (not d!155527) (not d!155503) (not bm!67733) (not d!155531) (not b!1474596) (not b!1474742))
(check-sat)
