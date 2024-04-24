; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125262 () Bool)

(assert start!125262)

(declare-fun b!1456423 () Bool)

(declare-fun res!986328 () Bool)

(declare-fun e!819661 () Bool)

(assert (=> b!1456423 (=> (not res!986328) (not e!819661))))

(declare-datatypes ((array!98605 0))(
  ( (array!98606 (arr!47587 (Array (_ BitVec 32) (_ BitVec 64))) (size!48138 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98605)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456423 (= res!986328 (validKeyInArray!0 (select (arr!47587 a!2862) j!93)))))

(declare-fun b!1456424 () Bool)

(declare-fun e!819662 () Bool)

(assert (=> b!1456424 (= e!819661 e!819662)))

(declare-fun res!986342 () Bool)

(assert (=> b!1456424 (=> (not res!986342) (not e!819662))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456424 (= res!986342 (= (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638309 () array!98605)

(assert (=> b!1456424 (= lt!638309 (array!98606 (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48138 a!2862)))))

(declare-fun b!1456425 () Bool)

(declare-fun res!986338 () Bool)

(assert (=> b!1456425 (=> (not res!986338) (not e!819661))))

(declare-datatypes ((List!34075 0))(
  ( (Nil!34072) (Cons!34071 (h!35432 (_ BitVec 64)) (t!48761 List!34075)) )
))
(declare-fun arrayNoDuplicates!0 (array!98605 (_ BitVec 32) List!34075) Bool)

(assert (=> b!1456425 (= res!986338 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34072))))

(declare-fun b!1456426 () Bool)

(declare-fun res!986336 () Bool)

(declare-fun e!819667 () Bool)

(assert (=> b!1456426 (=> (not res!986336) (not e!819667))))

(declare-fun e!819663 () Bool)

(assert (=> b!1456426 (= res!986336 e!819663)))

(declare-fun c!134569 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456426 (= c!134569 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!819666 () Bool)

(declare-datatypes ((SeekEntryResult!11736 0))(
  ( (MissingZero!11736 (index!49336 (_ BitVec 32))) (Found!11736 (index!49337 (_ BitVec 32))) (Intermediate!11736 (undefined!12548 Bool) (index!49338 (_ BitVec 32)) (x!131145 (_ BitVec 32))) (Undefined!11736) (MissingVacant!11736 (index!49339 (_ BitVec 32))) )
))
(declare-fun lt!638305 () SeekEntryResult!11736)

(declare-fun b!1456427 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638307 () (_ BitVec 32))

(declare-fun lt!638308 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98605 (_ BitVec 32)) SeekEntryResult!11736)

(assert (=> b!1456427 (= e!819666 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 intermediateAfterIndex!19 lt!638308 lt!638309 mask!2687) lt!638305)))))

(declare-fun b!1456428 () Bool)

(declare-fun e!819660 () Bool)

(assert (=> b!1456428 (= e!819662 e!819660)))

(declare-fun res!986330 () Bool)

(assert (=> b!1456428 (=> (not res!986330) (not e!819660))))

(declare-fun lt!638304 () SeekEntryResult!11736)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98605 (_ BitVec 32)) SeekEntryResult!11736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456428 (= res!986330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47587 a!2862) j!93) mask!2687) (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!638304))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456428 (= lt!638304 (Intermediate!11736 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456429 () Bool)

(declare-fun res!986333 () Bool)

(assert (=> b!1456429 (=> (not res!986333) (not e!819661))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1456429 (= res!986333 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48138 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48138 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48138 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456430 () Bool)

(declare-fun e!819669 () Bool)

(assert (=> b!1456430 (= e!819667 (not e!819669))))

(declare-fun res!986339 () Bool)

(assert (=> b!1456430 (=> res!986339 e!819669)))

(assert (=> b!1456430 (= res!986339 (or (and (= (select (arr!47587 a!2862) index!646) (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47587 a!2862) index!646) (select (arr!47587 a!2862) j!93))) (= (select (arr!47587 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819668 () Bool)

(assert (=> b!1456430 e!819668))

(declare-fun res!986340 () Bool)

(assert (=> b!1456430 (=> (not res!986340) (not e!819668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98605 (_ BitVec 32)) Bool)

(assert (=> b!1456430 (= res!986340 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49001 0))(
  ( (Unit!49002) )
))
(declare-fun lt!638310 () Unit!49001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49001)

(assert (=> b!1456430 (= lt!638310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456431 () Bool)

(declare-fun e!819665 () Bool)

(assert (=> b!1456431 (= e!819665 true)))

(declare-fun lt!638306 () Bool)

(assert (=> b!1456431 (= lt!638306 e!819666)))

(declare-fun c!134568 () Bool)

(assert (=> b!1456431 (= c!134568 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456432 () Bool)

(declare-fun res!986337 () Bool)

(assert (=> b!1456432 (=> (not res!986337) (not e!819661))))

(assert (=> b!1456432 (= res!986337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456434 () Bool)

(assert (=> b!1456434 (= e!819660 e!819667)))

(declare-fun res!986331 () Bool)

(assert (=> b!1456434 (=> (not res!986331) (not e!819667))))

(declare-fun lt!638311 () SeekEntryResult!11736)

(assert (=> b!1456434 (= res!986331 (= lt!638311 (Intermediate!11736 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456434 (= lt!638311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638308 mask!2687) lt!638308 lt!638309 mask!2687))))

(assert (=> b!1456434 (= lt!638308 (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456435 () Bool)

(declare-fun res!986325 () Bool)

(assert (=> b!1456435 (=> (not res!986325) (not e!819661))))

(assert (=> b!1456435 (= res!986325 (and (= (size!48138 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48138 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48138 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456436 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98605 (_ BitVec 32)) SeekEntryResult!11736)

(assert (=> b!1456436 (= e!819663 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638308 lt!638309 mask!2687) (seekEntryOrOpen!0 lt!638308 lt!638309 mask!2687)))))

(declare-fun b!1456437 () Bool)

(assert (=> b!1456437 (= e!819668 (and (or (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47587 a!2862) intermediateBeforeIndex!19) (select (arr!47587 a!2862) j!93))) (let ((bdg!53126 (select (store (arr!47587 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47587 a!2862) index!646) bdg!53126) (= (select (arr!47587 a!2862) index!646) (select (arr!47587 a!2862) j!93))) (= (select (arr!47587 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53126 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456438 () Bool)

(declare-fun res!986326 () Bool)

(assert (=> b!1456438 (=> (not res!986326) (not e!819668))))

(assert (=> b!1456438 (= res!986326 (= (seekEntryOrOpen!0 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) (Found!11736 j!93)))))

(declare-fun b!1456439 () Bool)

(declare-fun res!986332 () Bool)

(assert (=> b!1456439 (=> (not res!986332) (not e!819667))))

(assert (=> b!1456439 (= res!986332 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456440 () Bool)

(declare-fun res!986335 () Bool)

(assert (=> b!1456440 (=> (not res!986335) (not e!819660))))

(assert (=> b!1456440 (= res!986335 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!638304))))

(declare-fun b!1456441 () Bool)

(declare-fun res!986341 () Bool)

(assert (=> b!1456441 (=> (not res!986341) (not e!819661))))

(assert (=> b!1456441 (= res!986341 (validKeyInArray!0 (select (arr!47587 a!2862) i!1006)))))

(declare-fun b!1456442 () Bool)

(declare-fun res!986327 () Bool)

(assert (=> b!1456442 (=> res!986327 e!819665)))

(assert (=> b!1456442 (= res!986327 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 (select (arr!47587 a!2862) j!93) a!2862 mask!2687) lt!638304)))))

(declare-fun b!1456443 () Bool)

(assert (=> b!1456443 (= e!819669 e!819665)))

(declare-fun res!986329 () Bool)

(assert (=> b!1456443 (=> res!986329 e!819665)))

(assert (=> b!1456443 (= res!986329 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638307 #b00000000000000000000000000000000) (bvsge lt!638307 (size!48138 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456443 (= lt!638307 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1456443 (= lt!638305 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638308 lt!638309 mask!2687))))

(assert (=> b!1456443 (= lt!638305 (seekEntryOrOpen!0 lt!638308 lt!638309 mask!2687))))

(declare-fun b!1456444 () Bool)

(assert (=> b!1456444 (= e!819663 (= lt!638311 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638308 lt!638309 mask!2687)))))

(declare-fun b!1456433 () Bool)

(assert (=> b!1456433 (= e!819666 (not (= lt!638311 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 lt!638308 lt!638309 mask!2687))))))

(declare-fun res!986334 () Bool)

(assert (=> start!125262 (=> (not res!986334) (not e!819661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125262 (= res!986334 (validMask!0 mask!2687))))

(assert (=> start!125262 e!819661))

(assert (=> start!125262 true))

(declare-fun array_inv!36868 (array!98605) Bool)

(assert (=> start!125262 (array_inv!36868 a!2862)))

(assert (= (and start!125262 res!986334) b!1456435))

(assert (= (and b!1456435 res!986325) b!1456441))

(assert (= (and b!1456441 res!986341) b!1456423))

(assert (= (and b!1456423 res!986328) b!1456432))

(assert (= (and b!1456432 res!986337) b!1456425))

(assert (= (and b!1456425 res!986338) b!1456429))

(assert (= (and b!1456429 res!986333) b!1456424))

(assert (= (and b!1456424 res!986342) b!1456428))

(assert (= (and b!1456428 res!986330) b!1456440))

(assert (= (and b!1456440 res!986335) b!1456434))

(assert (= (and b!1456434 res!986331) b!1456426))

(assert (= (and b!1456426 c!134569) b!1456444))

(assert (= (and b!1456426 (not c!134569)) b!1456436))

(assert (= (and b!1456426 res!986336) b!1456439))

(assert (= (and b!1456439 res!986332) b!1456430))

(assert (= (and b!1456430 res!986340) b!1456438))

(assert (= (and b!1456438 res!986326) b!1456437))

(assert (= (and b!1456430 (not res!986339)) b!1456443))

(assert (= (and b!1456443 (not res!986329)) b!1456442))

(assert (= (and b!1456442 (not res!986327)) b!1456431))

(assert (= (and b!1456431 c!134568) b!1456433))

(assert (= (and b!1456431 (not c!134568)) b!1456427))

(declare-fun m!1344799 () Bool)

(assert (=> b!1456441 m!1344799))

(assert (=> b!1456441 m!1344799))

(declare-fun m!1344801 () Bool)

(assert (=> b!1456441 m!1344801))

(declare-fun m!1344803 () Bool)

(assert (=> b!1456444 m!1344803))

(declare-fun m!1344805 () Bool)

(assert (=> b!1456424 m!1344805))

(declare-fun m!1344807 () Bool)

(assert (=> b!1456424 m!1344807))

(declare-fun m!1344809 () Bool)

(assert (=> start!125262 m!1344809))

(declare-fun m!1344811 () Bool)

(assert (=> start!125262 m!1344811))

(assert (=> b!1456437 m!1344805))

(declare-fun m!1344813 () Bool)

(assert (=> b!1456437 m!1344813))

(declare-fun m!1344815 () Bool)

(assert (=> b!1456437 m!1344815))

(declare-fun m!1344817 () Bool)

(assert (=> b!1456437 m!1344817))

(declare-fun m!1344819 () Bool)

(assert (=> b!1456437 m!1344819))

(declare-fun m!1344821 () Bool)

(assert (=> b!1456425 m!1344821))

(declare-fun m!1344823 () Bool)

(assert (=> b!1456432 m!1344823))

(assert (=> b!1456440 m!1344819))

(assert (=> b!1456440 m!1344819))

(declare-fun m!1344825 () Bool)

(assert (=> b!1456440 m!1344825))

(declare-fun m!1344827 () Bool)

(assert (=> b!1456427 m!1344827))

(declare-fun m!1344829 () Bool)

(assert (=> b!1456436 m!1344829))

(declare-fun m!1344831 () Bool)

(assert (=> b!1456436 m!1344831))

(declare-fun m!1344833 () Bool)

(assert (=> b!1456434 m!1344833))

(assert (=> b!1456434 m!1344833))

(declare-fun m!1344835 () Bool)

(assert (=> b!1456434 m!1344835))

(assert (=> b!1456434 m!1344805))

(declare-fun m!1344837 () Bool)

(assert (=> b!1456434 m!1344837))

(declare-fun m!1344839 () Bool)

(assert (=> b!1456430 m!1344839))

(assert (=> b!1456430 m!1344805))

(assert (=> b!1456430 m!1344815))

(assert (=> b!1456430 m!1344817))

(declare-fun m!1344841 () Bool)

(assert (=> b!1456430 m!1344841))

(assert (=> b!1456430 m!1344819))

(assert (=> b!1456423 m!1344819))

(assert (=> b!1456423 m!1344819))

(declare-fun m!1344843 () Bool)

(assert (=> b!1456423 m!1344843))

(assert (=> b!1456442 m!1344819))

(assert (=> b!1456442 m!1344819))

(declare-fun m!1344845 () Bool)

(assert (=> b!1456442 m!1344845))

(declare-fun m!1344847 () Bool)

(assert (=> b!1456443 m!1344847))

(assert (=> b!1456443 m!1344829))

(assert (=> b!1456443 m!1344831))

(assert (=> b!1456428 m!1344819))

(assert (=> b!1456428 m!1344819))

(declare-fun m!1344849 () Bool)

(assert (=> b!1456428 m!1344849))

(assert (=> b!1456428 m!1344849))

(assert (=> b!1456428 m!1344819))

(declare-fun m!1344851 () Bool)

(assert (=> b!1456428 m!1344851))

(assert (=> b!1456438 m!1344819))

(assert (=> b!1456438 m!1344819))

(declare-fun m!1344853 () Bool)

(assert (=> b!1456438 m!1344853))

(declare-fun m!1344855 () Bool)

(assert (=> b!1456433 m!1344855))

(check-sat (not b!1456434) (not b!1456432) (not b!1456436) (not b!1456444) (not b!1456440) (not b!1456427) (not b!1456423) (not b!1456428) (not start!125262) (not b!1456442) (not b!1456443) (not b!1456438) (not b!1456430) (not b!1456441) (not b!1456425) (not b!1456433))
(check-sat)
