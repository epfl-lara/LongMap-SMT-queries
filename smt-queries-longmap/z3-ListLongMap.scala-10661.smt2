; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125074 () Bool)

(assert start!125074)

(declare-fun b!1456881 () Bool)

(declare-fun e!819612 () Bool)

(assert (=> b!1456881 (= e!819612 true)))

(declare-fun lt!638313 () Bool)

(declare-fun e!819613 () Bool)

(assert (=> b!1456881 (= lt!638313 e!819613)))

(declare-fun c!134271 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456881 (= c!134271 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456882 () Bool)

(declare-fun res!987374 () Bool)

(declare-fun e!819611 () Bool)

(assert (=> b!1456882 (=> (not res!987374) (not e!819611))))

(declare-datatypes ((array!98500 0))(
  ( (array!98501 (arr!47539 (Array (_ BitVec 32) (_ BitVec 64))) (size!48091 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98500)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456882 (= res!987374 (validKeyInArray!0 (select (arr!47539 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!819609 () Bool)

(declare-fun b!1456883 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456883 (= e!819609 (and (or (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47539 a!2862) intermediateBeforeIndex!19) (select (arr!47539 a!2862) j!93))) (let ((bdg!53305 (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47539 a!2862) index!646) bdg!53305) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53305 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456884 () Bool)

(declare-fun res!987373 () Bool)

(assert (=> b!1456884 (=> (not res!987373) (not e!819611))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98500 (_ BitVec 32)) Bool)

(assert (=> b!1456884 (= res!987373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456885 () Bool)

(declare-fun res!987377 () Bool)

(assert (=> b!1456885 (=> (not res!987377) (not e!819611))))

(declare-datatypes ((List!34118 0))(
  ( (Nil!34115) (Cons!34114 (h!35464 (_ BitVec 64)) (t!48804 List!34118)) )
))
(declare-fun arrayNoDuplicates!0 (array!98500 (_ BitVec 32) List!34118) Bool)

(assert (=> b!1456885 (= res!987377 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34115))))

(declare-fun lt!638315 () (_ BitVec 64))

(declare-fun b!1456886 () Bool)

(declare-fun e!819607 () Bool)

(declare-fun lt!638318 () array!98500)

(declare-datatypes ((SeekEntryResult!11816 0))(
  ( (MissingZero!11816 (index!49656 (_ BitVec 32))) (Found!11816 (index!49657 (_ BitVec 32))) (Intermediate!11816 (undefined!12628 Bool) (index!49658 (_ BitVec 32)) (x!131276 (_ BitVec 32))) (Undefined!11816) (MissingVacant!11816 (index!49659 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11816)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11816)

(assert (=> b!1456886 (= e!819607 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638315 lt!638318 mask!2687) (seekEntryOrOpen!0 lt!638315 lt!638318 mask!2687)))))

(declare-fun b!1456887 () Bool)

(declare-fun res!987372 () Bool)

(assert (=> b!1456887 (=> (not res!987372) (not e!819611))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456887 (= res!987372 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48091 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48091 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48091 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456888 () Bool)

(declare-fun e!819614 () Bool)

(declare-fun e!819608 () Bool)

(assert (=> b!1456888 (= e!819614 e!819608)))

(declare-fun res!987382 () Bool)

(assert (=> b!1456888 (=> (not res!987382) (not e!819608))))

(declare-fun lt!638314 () SeekEntryResult!11816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456888 (= res!987382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47539 a!2862) j!93) mask!2687) (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!638314))))

(assert (=> b!1456888 (= lt!638314 (Intermediate!11816 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!638316 () SeekEntryResult!11816)

(declare-fun b!1456889 () Bool)

(assert (=> b!1456889 (= e!819607 (= lt!638316 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638315 lt!638318 mask!2687)))))

(declare-fun b!1456890 () Bool)

(declare-fun res!987380 () Bool)

(assert (=> b!1456890 (=> (not res!987380) (not e!819608))))

(assert (=> b!1456890 (= res!987380 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!638314))))

(declare-fun res!987367 () Bool)

(assert (=> start!125074 (=> (not res!987367) (not e!819611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125074 (= res!987367 (validMask!0 mask!2687))))

(assert (=> start!125074 e!819611))

(assert (=> start!125074 true))

(declare-fun array_inv!36772 (array!98500) Bool)

(assert (=> start!125074 (array_inv!36772 a!2862)))

(declare-fun b!1456891 () Bool)

(declare-fun e!819606 () Bool)

(declare-fun e!819610 () Bool)

(assert (=> b!1456891 (= e!819606 (not e!819610))))

(declare-fun res!987371 () Bool)

(assert (=> b!1456891 (=> res!987371 e!819610)))

(assert (=> b!1456891 (= res!987371 (or (and (= (select (arr!47539 a!2862) index!646) (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47539 a!2862) index!646) (select (arr!47539 a!2862) j!93))) (= (select (arr!47539 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456891 e!819609))

(declare-fun res!987376 () Bool)

(assert (=> b!1456891 (=> (not res!987376) (not e!819609))))

(assert (=> b!1456891 (= res!987376 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48969 0))(
  ( (Unit!48970) )
))
(declare-fun lt!638317 () Unit!48969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48969)

(assert (=> b!1456891 (= lt!638317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!638312 () (_ BitVec 32))

(declare-fun b!1456892 () Bool)

(declare-fun lt!638319 () SeekEntryResult!11816)

(assert (=> b!1456892 (= e!819613 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638312 intermediateAfterIndex!19 lt!638315 lt!638318 mask!2687) lt!638319)))))

(declare-fun b!1456893 () Bool)

(declare-fun res!987366 () Bool)

(assert (=> b!1456893 (=> res!987366 e!819612)))

(assert (=> b!1456893 (= res!987366 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638312 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) lt!638314)))))

(declare-fun b!1456894 () Bool)

(assert (=> b!1456894 (= e!819608 e!819606)))

(declare-fun res!987375 () Bool)

(assert (=> b!1456894 (=> (not res!987375) (not e!819606))))

(assert (=> b!1456894 (= res!987375 (= lt!638316 (Intermediate!11816 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456894 (= lt!638316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638315 mask!2687) lt!638315 lt!638318 mask!2687))))

(assert (=> b!1456894 (= lt!638315 (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456895 () Bool)

(declare-fun res!987368 () Bool)

(assert (=> b!1456895 (=> (not res!987368) (not e!819606))))

(assert (=> b!1456895 (= res!987368 e!819607)))

(declare-fun c!134272 () Bool)

(assert (=> b!1456895 (= c!134272 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456896 () Bool)

(declare-fun res!987378 () Bool)

(assert (=> b!1456896 (=> (not res!987378) (not e!819611))))

(assert (=> b!1456896 (= res!987378 (and (= (size!48091 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48091 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48091 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456897 () Bool)

(declare-fun res!987369 () Bool)

(assert (=> b!1456897 (=> (not res!987369) (not e!819609))))

(assert (=> b!1456897 (= res!987369 (= (seekEntryOrOpen!0 (select (arr!47539 a!2862) j!93) a!2862 mask!2687) (Found!11816 j!93)))))

(declare-fun b!1456898 () Bool)

(declare-fun res!987365 () Bool)

(assert (=> b!1456898 (=> (not res!987365) (not e!819611))))

(assert (=> b!1456898 (= res!987365 (validKeyInArray!0 (select (arr!47539 a!2862) i!1006)))))

(declare-fun b!1456899 () Bool)

(assert (=> b!1456899 (= e!819611 e!819614)))

(declare-fun res!987370 () Bool)

(assert (=> b!1456899 (=> (not res!987370) (not e!819614))))

(assert (=> b!1456899 (= res!987370 (= (select (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456899 (= lt!638318 (array!98501 (store (arr!47539 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48091 a!2862)))))

(declare-fun b!1456900 () Bool)

(assert (=> b!1456900 (= e!819613 (not (= lt!638316 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638312 lt!638315 lt!638318 mask!2687))))))

(declare-fun b!1456901 () Bool)

(assert (=> b!1456901 (= e!819610 e!819612)))

(declare-fun res!987379 () Bool)

(assert (=> b!1456901 (=> res!987379 e!819612)))

(assert (=> b!1456901 (= res!987379 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638312 #b00000000000000000000000000000000) (bvsge lt!638312 (size!48091 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456901 (= lt!638312 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456901 (= lt!638319 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638315 lt!638318 mask!2687))))

(assert (=> b!1456901 (= lt!638319 (seekEntryOrOpen!0 lt!638315 lt!638318 mask!2687))))

(declare-fun b!1456902 () Bool)

(declare-fun res!987381 () Bool)

(assert (=> b!1456902 (=> (not res!987381) (not e!819606))))

(assert (=> b!1456902 (= res!987381 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125074 res!987367) b!1456896))

(assert (= (and b!1456896 res!987378) b!1456898))

(assert (= (and b!1456898 res!987365) b!1456882))

(assert (= (and b!1456882 res!987374) b!1456884))

(assert (= (and b!1456884 res!987373) b!1456885))

(assert (= (and b!1456885 res!987377) b!1456887))

(assert (= (and b!1456887 res!987372) b!1456899))

(assert (= (and b!1456899 res!987370) b!1456888))

(assert (= (and b!1456888 res!987382) b!1456890))

(assert (= (and b!1456890 res!987380) b!1456894))

(assert (= (and b!1456894 res!987375) b!1456895))

(assert (= (and b!1456895 c!134272) b!1456889))

(assert (= (and b!1456895 (not c!134272)) b!1456886))

(assert (= (and b!1456895 res!987368) b!1456902))

(assert (= (and b!1456902 res!987381) b!1456891))

(assert (= (and b!1456891 res!987376) b!1456897))

(assert (= (and b!1456897 res!987369) b!1456883))

(assert (= (and b!1456891 (not res!987371)) b!1456901))

(assert (= (and b!1456901 (not res!987379)) b!1456893))

(assert (= (and b!1456893 (not res!987366)) b!1456881))

(assert (= (and b!1456881 c!134271) b!1456900))

(assert (= (and b!1456881 (not c!134271)) b!1456892))

(declare-fun m!1344423 () Bool)

(assert (=> b!1456898 m!1344423))

(assert (=> b!1456898 m!1344423))

(declare-fun m!1344425 () Bool)

(assert (=> b!1456898 m!1344425))

(declare-fun m!1344427 () Bool)

(assert (=> b!1456894 m!1344427))

(assert (=> b!1456894 m!1344427))

(declare-fun m!1344429 () Bool)

(assert (=> b!1456894 m!1344429))

(declare-fun m!1344431 () Bool)

(assert (=> b!1456894 m!1344431))

(declare-fun m!1344433 () Bool)

(assert (=> b!1456894 m!1344433))

(declare-fun m!1344435 () Bool)

(assert (=> b!1456890 m!1344435))

(assert (=> b!1456890 m!1344435))

(declare-fun m!1344437 () Bool)

(assert (=> b!1456890 m!1344437))

(declare-fun m!1344439 () Bool)

(assert (=> b!1456892 m!1344439))

(declare-fun m!1344441 () Bool)

(assert (=> b!1456886 m!1344441))

(declare-fun m!1344443 () Bool)

(assert (=> b!1456886 m!1344443))

(declare-fun m!1344445 () Bool)

(assert (=> b!1456889 m!1344445))

(declare-fun m!1344447 () Bool)

(assert (=> b!1456891 m!1344447))

(assert (=> b!1456891 m!1344431))

(declare-fun m!1344449 () Bool)

(assert (=> b!1456891 m!1344449))

(declare-fun m!1344451 () Bool)

(assert (=> b!1456891 m!1344451))

(declare-fun m!1344453 () Bool)

(assert (=> b!1456891 m!1344453))

(assert (=> b!1456891 m!1344435))

(declare-fun m!1344455 () Bool)

(assert (=> b!1456901 m!1344455))

(assert (=> b!1456901 m!1344441))

(assert (=> b!1456901 m!1344443))

(declare-fun m!1344457 () Bool)

(assert (=> b!1456885 m!1344457))

(assert (=> b!1456897 m!1344435))

(assert (=> b!1456897 m!1344435))

(declare-fun m!1344459 () Bool)

(assert (=> b!1456897 m!1344459))

(declare-fun m!1344461 () Bool)

(assert (=> b!1456884 m!1344461))

(assert (=> b!1456883 m!1344431))

(declare-fun m!1344463 () Bool)

(assert (=> b!1456883 m!1344463))

(assert (=> b!1456883 m!1344449))

(assert (=> b!1456883 m!1344451))

(assert (=> b!1456883 m!1344435))

(declare-fun m!1344465 () Bool)

(assert (=> start!125074 m!1344465))

(declare-fun m!1344467 () Bool)

(assert (=> start!125074 m!1344467))

(assert (=> b!1456882 m!1344435))

(assert (=> b!1456882 m!1344435))

(declare-fun m!1344469 () Bool)

(assert (=> b!1456882 m!1344469))

(declare-fun m!1344471 () Bool)

(assert (=> b!1456900 m!1344471))

(assert (=> b!1456888 m!1344435))

(assert (=> b!1456888 m!1344435))

(declare-fun m!1344473 () Bool)

(assert (=> b!1456888 m!1344473))

(assert (=> b!1456888 m!1344473))

(assert (=> b!1456888 m!1344435))

(declare-fun m!1344475 () Bool)

(assert (=> b!1456888 m!1344475))

(assert (=> b!1456899 m!1344431))

(declare-fun m!1344477 () Bool)

(assert (=> b!1456899 m!1344477))

(assert (=> b!1456893 m!1344435))

(assert (=> b!1456893 m!1344435))

(declare-fun m!1344479 () Bool)

(assert (=> b!1456893 m!1344479))

(check-sat (not b!1456892) (not b!1456900) (not start!125074) (not b!1456893) (not b!1456894) (not b!1456897) (not b!1456890) (not b!1456901) (not b!1456886) (not b!1456889) (not b!1456882) (not b!1456891) (not b!1456888) (not b!1456884) (not b!1456898) (not b!1456885))
(check-sat)
