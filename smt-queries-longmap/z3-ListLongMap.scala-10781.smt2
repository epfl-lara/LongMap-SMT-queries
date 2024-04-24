; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126462 () Bool)

(assert start!126462)

(declare-fun b!1479656 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!830167 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479656 (= e!830167 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479657 () Bool)

(declare-fun res!1004631 () Bool)

(declare-fun e!830166 () Bool)

(assert (=> b!1479657 (=> (not res!1004631) (not e!830166))))

(declare-datatypes ((array!99406 0))(
  ( (array!99407 (arr!47977 (Array (_ BitVec 32) (_ BitVec 64))) (size!48528 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99406)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99406 (_ BitVec 32)) Bool)

(assert (=> b!1479657 (= res!1004631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479658 () Bool)

(declare-fun e!830164 () Bool)

(assert (=> b!1479658 (= e!830166 e!830164)))

(declare-fun res!1004642 () Bool)

(assert (=> b!1479658 (=> (not res!1004642) (not e!830164))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479658 (= res!1004642 (= (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646155 () array!99406)

(assert (=> b!1479658 (= lt!646155 (array!99407 (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48528 a!2862)))))

(declare-fun b!1479659 () Bool)

(declare-fun e!830163 () Bool)

(assert (=> b!1479659 (= e!830163 (not true))))

(declare-fun e!830169 () Bool)

(assert (=> b!1479659 e!830169))

(declare-fun res!1004634 () Bool)

(assert (=> b!1479659 (=> (not res!1004634) (not e!830169))))

(declare-datatypes ((SeekEntryResult!12114 0))(
  ( (MissingZero!12114 (index!50848 (_ BitVec 32))) (Found!12114 (index!50849 (_ BitVec 32))) (Intermediate!12114 (undefined!12926 Bool) (index!50850 (_ BitVec 32)) (x!132626 (_ BitVec 32))) (Undefined!12114) (MissingVacant!12114 (index!50851 (_ BitVec 32))) )
))
(declare-fun lt!646157 () SeekEntryResult!12114)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479659 (= res!1004634 (and (= lt!646157 (Found!12114 j!93)) (or (= (select (arr!47977 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47977 a!2862) intermediateBeforeIndex!19) (select (arr!47977 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12114)

(assert (=> b!1479659 (= lt!646157 (seekEntryOrOpen!0 (select (arr!47977 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479659 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49601 0))(
  ( (Unit!49602) )
))
(declare-fun lt!646159 () Unit!49601)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49601)

(assert (=> b!1479659 (= lt!646159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479661 () Bool)

(declare-fun res!1004632 () Bool)

(declare-fun e!830161 () Bool)

(assert (=> b!1479661 (=> (not res!1004632) (not e!830161))))

(declare-fun lt!646158 () SeekEntryResult!12114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12114)

(assert (=> b!1479661 (= res!1004632 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47977 a!2862) j!93) a!2862 mask!2687) lt!646158))))

(declare-fun b!1479662 () Bool)

(declare-fun res!1004638 () Bool)

(assert (=> b!1479662 (=> (not res!1004638) (not e!830163))))

(assert (=> b!1479662 (= res!1004638 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479663 () Bool)

(declare-fun res!1004628 () Bool)

(assert (=> b!1479663 (=> (not res!1004628) (not e!830166))))

(assert (=> b!1479663 (= res!1004628 (and (= (size!48528 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48528 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48528 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479664 () Bool)

(declare-fun e!830165 () Bool)

(assert (=> b!1479664 (= e!830165 e!830167)))

(declare-fun res!1004633 () Bool)

(assert (=> b!1479664 (=> (not res!1004633) (not e!830167))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12114)

(assert (=> b!1479664 (= res!1004633 (= lt!646157 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47977 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479665 () Bool)

(declare-fun res!1004635 () Bool)

(assert (=> b!1479665 (=> (not res!1004635) (not e!830163))))

(declare-fun e!830162 () Bool)

(assert (=> b!1479665 (= res!1004635 e!830162)))

(declare-fun c!137044 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479665 (= c!137044 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479666 () Bool)

(declare-fun lt!646154 () (_ BitVec 64))

(declare-fun lt!646156 () SeekEntryResult!12114)

(assert (=> b!1479666 (= e!830162 (= lt!646156 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646154 lt!646155 mask!2687)))))

(declare-fun b!1479667 () Bool)

(assert (=> b!1479667 (= e!830161 e!830163)))

(declare-fun res!1004640 () Bool)

(assert (=> b!1479667 (=> (not res!1004640) (not e!830163))))

(assert (=> b!1479667 (= res!1004640 (= lt!646156 (Intermediate!12114 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479667 (= lt!646156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646154 mask!2687) lt!646154 lt!646155 mask!2687))))

(assert (=> b!1479667 (= lt!646154 (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479660 () Bool)

(assert (=> b!1479660 (= e!830169 e!830165)))

(declare-fun res!1004627 () Bool)

(assert (=> b!1479660 (=> res!1004627 e!830165)))

(assert (=> b!1479660 (= res!1004627 (or (and (= (select (arr!47977 a!2862) index!646) (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47977 a!2862) index!646) (select (arr!47977 a!2862) j!93))) (not (= (select (arr!47977 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1004636 () Bool)

(assert (=> start!126462 (=> (not res!1004636) (not e!830166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126462 (= res!1004636 (validMask!0 mask!2687))))

(assert (=> start!126462 e!830166))

(assert (=> start!126462 true))

(declare-fun array_inv!37258 (array!99406) Bool)

(assert (=> start!126462 (array_inv!37258 a!2862)))

(declare-fun b!1479668 () Bool)

(declare-fun res!1004639 () Bool)

(assert (=> b!1479668 (=> (not res!1004639) (not e!830166))))

(declare-datatypes ((List!34465 0))(
  ( (Nil!34462) (Cons!34461 (h!35843 (_ BitVec 64)) (t!49151 List!34465)) )
))
(declare-fun arrayNoDuplicates!0 (array!99406 (_ BitVec 32) List!34465) Bool)

(assert (=> b!1479668 (= res!1004639 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34462))))

(declare-fun b!1479669 () Bool)

(assert (=> b!1479669 (= e!830162 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646154 lt!646155 mask!2687) (seekEntryOrOpen!0 lt!646154 lt!646155 mask!2687)))))

(declare-fun b!1479670 () Bool)

(declare-fun res!1004637 () Bool)

(assert (=> b!1479670 (=> (not res!1004637) (not e!830166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479670 (= res!1004637 (validKeyInArray!0 (select (arr!47977 a!2862) j!93)))))

(declare-fun b!1479671 () Bool)

(declare-fun res!1004641 () Bool)

(assert (=> b!1479671 (=> (not res!1004641) (not e!830166))))

(assert (=> b!1479671 (= res!1004641 (validKeyInArray!0 (select (arr!47977 a!2862) i!1006)))))

(declare-fun b!1479672 () Bool)

(assert (=> b!1479672 (= e!830164 e!830161)))

(declare-fun res!1004629 () Bool)

(assert (=> b!1479672 (=> (not res!1004629) (not e!830161))))

(assert (=> b!1479672 (= res!1004629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47977 a!2862) j!93) mask!2687) (select (arr!47977 a!2862) j!93) a!2862 mask!2687) lt!646158))))

(assert (=> b!1479672 (= lt!646158 (Intermediate!12114 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479673 () Bool)

(declare-fun res!1004630 () Bool)

(assert (=> b!1479673 (=> (not res!1004630) (not e!830166))))

(assert (=> b!1479673 (= res!1004630 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48528 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48528 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48528 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126462 res!1004636) b!1479663))

(assert (= (and b!1479663 res!1004628) b!1479671))

(assert (= (and b!1479671 res!1004641) b!1479670))

(assert (= (and b!1479670 res!1004637) b!1479657))

(assert (= (and b!1479657 res!1004631) b!1479668))

(assert (= (and b!1479668 res!1004639) b!1479673))

(assert (= (and b!1479673 res!1004630) b!1479658))

(assert (= (and b!1479658 res!1004642) b!1479672))

(assert (= (and b!1479672 res!1004629) b!1479661))

(assert (= (and b!1479661 res!1004632) b!1479667))

(assert (= (and b!1479667 res!1004640) b!1479665))

(assert (= (and b!1479665 c!137044) b!1479666))

(assert (= (and b!1479665 (not c!137044)) b!1479669))

(assert (= (and b!1479665 res!1004635) b!1479662))

(assert (= (and b!1479662 res!1004638) b!1479659))

(assert (= (and b!1479659 res!1004634) b!1479660))

(assert (= (and b!1479660 (not res!1004627)) b!1479664))

(assert (= (and b!1479664 res!1004633) b!1479656))

(declare-fun m!1365565 () Bool)

(assert (=> b!1479672 m!1365565))

(assert (=> b!1479672 m!1365565))

(declare-fun m!1365567 () Bool)

(assert (=> b!1479672 m!1365567))

(assert (=> b!1479672 m!1365567))

(assert (=> b!1479672 m!1365565))

(declare-fun m!1365569 () Bool)

(assert (=> b!1479672 m!1365569))

(declare-fun m!1365571 () Bool)

(assert (=> b!1479657 m!1365571))

(assert (=> b!1479670 m!1365565))

(assert (=> b!1479670 m!1365565))

(declare-fun m!1365573 () Bool)

(assert (=> b!1479670 m!1365573))

(declare-fun m!1365575 () Bool)

(assert (=> b!1479660 m!1365575))

(declare-fun m!1365577 () Bool)

(assert (=> b!1479660 m!1365577))

(declare-fun m!1365579 () Bool)

(assert (=> b!1479660 m!1365579))

(assert (=> b!1479660 m!1365565))

(declare-fun m!1365581 () Bool)

(assert (=> b!1479668 m!1365581))

(declare-fun m!1365583 () Bool)

(assert (=> b!1479667 m!1365583))

(assert (=> b!1479667 m!1365583))

(declare-fun m!1365585 () Bool)

(assert (=> b!1479667 m!1365585))

(assert (=> b!1479667 m!1365577))

(declare-fun m!1365587 () Bool)

(assert (=> b!1479667 m!1365587))

(assert (=> b!1479661 m!1365565))

(assert (=> b!1479661 m!1365565))

(declare-fun m!1365589 () Bool)

(assert (=> b!1479661 m!1365589))

(declare-fun m!1365591 () Bool)

(assert (=> b!1479666 m!1365591))

(assert (=> b!1479664 m!1365565))

(assert (=> b!1479664 m!1365565))

(declare-fun m!1365593 () Bool)

(assert (=> b!1479664 m!1365593))

(assert (=> b!1479658 m!1365577))

(declare-fun m!1365595 () Bool)

(assert (=> b!1479658 m!1365595))

(declare-fun m!1365597 () Bool)

(assert (=> b!1479671 m!1365597))

(assert (=> b!1479671 m!1365597))

(declare-fun m!1365599 () Bool)

(assert (=> b!1479671 m!1365599))

(declare-fun m!1365601 () Bool)

(assert (=> start!126462 m!1365601))

(declare-fun m!1365603 () Bool)

(assert (=> start!126462 m!1365603))

(declare-fun m!1365605 () Bool)

(assert (=> b!1479669 m!1365605))

(declare-fun m!1365607 () Bool)

(assert (=> b!1479669 m!1365607))

(declare-fun m!1365609 () Bool)

(assert (=> b!1479659 m!1365609))

(declare-fun m!1365611 () Bool)

(assert (=> b!1479659 m!1365611))

(assert (=> b!1479659 m!1365565))

(declare-fun m!1365613 () Bool)

(assert (=> b!1479659 m!1365613))

(declare-fun m!1365615 () Bool)

(assert (=> b!1479659 m!1365615))

(assert (=> b!1479659 m!1365565))

(check-sat (not b!1479671) (not b!1479661) (not b!1479669) (not b!1479664) (not start!126462) (not b!1479670) (not b!1479657) (not b!1479667) (not b!1479659) (not b!1479668) (not b!1479666) (not b!1479672))
(check-sat)
