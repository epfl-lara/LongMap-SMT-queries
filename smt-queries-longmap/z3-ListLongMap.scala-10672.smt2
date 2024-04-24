; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125388 () Bool)

(assert start!125388)

(declare-fun res!989734 () Bool)

(declare-fun e!821524 () Bool)

(assert (=> start!125388 (=> (not res!989734) (not e!821524))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125388 (= res!989734 (validMask!0 mask!2687))))

(assert (=> start!125388 e!821524))

(assert (=> start!125388 true))

(declare-datatypes ((array!98731 0))(
  ( (array!98732 (arr!47650 (Array (_ BitVec 32) (_ BitVec 64))) (size!48201 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98731)

(declare-fun array_inv!36931 (array!98731) Bool)

(assert (=> start!125388 (array_inv!36931 a!2862)))

(declare-fun b!1460581 () Bool)

(declare-fun e!821529 () Bool)

(declare-fun e!821527 () Bool)

(assert (=> b!1460581 (= e!821529 e!821527)))

(declare-fun res!989735 () Bool)

(assert (=> b!1460581 (=> res!989735 e!821527)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639849 () (_ BitVec 32))

(assert (=> b!1460581 (= res!989735 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639849 #b00000000000000000000000000000000) (bvsge lt!639849 (size!48201 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460581 (= lt!639849 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!639846 () array!98731)

(declare-fun lt!639845 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11799 0))(
  ( (MissingZero!11799 (index!49588 (_ BitVec 32))) (Found!11799 (index!49589 (_ BitVec 32))) (Intermediate!11799 (undefined!12611 Bool) (index!49590 (_ BitVec 32)) (x!131376 (_ BitVec 32))) (Undefined!11799) (MissingVacant!11799 (index!49591 (_ BitVec 32))) )
))
(declare-fun lt!639848 () SeekEntryResult!11799)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98731 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1460581 (= lt!639848 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639845 lt!639846 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98731 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1460581 (= lt!639848 (seekEntryOrOpen!0 lt!639845 lt!639846 mask!2687))))

(declare-fun e!821526 () Bool)

(declare-fun lt!639853 () SeekEntryResult!11799)

(declare-fun b!1460582 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98731 (_ BitVec 32)) SeekEntryResult!11799)

(assert (=> b!1460582 (= e!821526 (not (= lt!639853 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639849 lt!639845 lt!639846 mask!2687))))))

(declare-fun b!1460583 () Bool)

(declare-fun res!989731 () Bool)

(assert (=> b!1460583 (=> (not res!989731) (not e!821524))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460583 (= res!989731 (and (= (size!48201 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48201 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48201 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460584 () Bool)

(assert (=> b!1460584 (= e!821527 true)))

(declare-fun lt!639847 () SeekEntryResult!11799)

(assert (=> b!1460584 (= lt!639847 lt!639848)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49127 0))(
  ( (Unit!49128) )
))
(declare-fun lt!639851 () Unit!49127)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49127)

(assert (=> b!1460584 (= lt!639851 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639849 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460585 () Bool)

(assert (=> b!1460585 (= e!821526 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639849 intermediateAfterIndex!19 lt!639845 lt!639846 mask!2687) lt!639848)))))

(declare-fun b!1460586 () Bool)

(declare-fun e!821522 () Bool)

(assert (=> b!1460586 (= e!821522 (not e!821529))))

(declare-fun res!989737 () Bool)

(assert (=> b!1460586 (=> res!989737 e!821529)))

(assert (=> b!1460586 (= res!989737 (or (and (= (select (arr!47650 a!2862) index!646) (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47650 a!2862) index!646) (select (arr!47650 a!2862) j!93))) (= (select (arr!47650 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460586 (and (= lt!639847 (Found!11799 j!93)) (or (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47650 a!2862) intermediateBeforeIndex!19) (select (arr!47650 a!2862) j!93))) (let ((bdg!53498 (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47650 a!2862) index!646) bdg!53498) (= (select (arr!47650 a!2862) index!646) (select (arr!47650 a!2862) j!93))) (= (select (arr!47650 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53498 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460586 (= lt!639847 (seekEntryOrOpen!0 (select (arr!47650 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98731 (_ BitVec 32)) Bool)

(assert (=> b!1460586 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639850 () Unit!49127)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49127)

(assert (=> b!1460586 (= lt!639850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460587 () Bool)

(declare-fun res!989730 () Bool)

(assert (=> b!1460587 (=> (not res!989730) (not e!821524))))

(assert (=> b!1460587 (= res!989730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460588 () Bool)

(declare-fun e!821523 () Bool)

(assert (=> b!1460588 (= e!821523 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639845 lt!639846 mask!2687) (seekEntryOrOpen!0 lt!639845 lt!639846 mask!2687)))))

(declare-fun b!1460589 () Bool)

(declare-fun res!989727 () Bool)

(assert (=> b!1460589 (=> (not res!989727) (not e!821524))))

(assert (=> b!1460589 (= res!989727 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48201 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48201 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48201 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460590 () Bool)

(declare-fun res!989733 () Bool)

(assert (=> b!1460590 (=> (not res!989733) (not e!821522))))

(assert (=> b!1460590 (= res!989733 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460591 () Bool)

(declare-fun res!989744 () Bool)

(assert (=> b!1460591 (=> (not res!989744) (not e!821524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460591 (= res!989744 (validKeyInArray!0 (select (arr!47650 a!2862) i!1006)))))

(declare-fun b!1460592 () Bool)

(declare-fun res!989729 () Bool)

(assert (=> b!1460592 (=> res!989729 e!821527)))

(assert (=> b!1460592 (= res!989729 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460593 () Bool)

(declare-fun e!821528 () Bool)

(assert (=> b!1460593 (= e!821524 e!821528)))

(declare-fun res!989740 () Bool)

(assert (=> b!1460593 (=> (not res!989740) (not e!821528))))

(assert (=> b!1460593 (= res!989740 (= (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460593 (= lt!639846 (array!98732 (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48201 a!2862)))))

(declare-fun b!1460594 () Bool)

(assert (=> b!1460594 (= e!821523 (= lt!639853 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639845 lt!639846 mask!2687)))))

(declare-fun b!1460595 () Bool)

(declare-fun e!821521 () Bool)

(assert (=> b!1460595 (= e!821521 e!821522)))

(declare-fun res!989739 () Bool)

(assert (=> b!1460595 (=> (not res!989739) (not e!821522))))

(assert (=> b!1460595 (= res!989739 (= lt!639853 (Intermediate!11799 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460595 (= lt!639853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639845 mask!2687) lt!639845 lt!639846 mask!2687))))

(assert (=> b!1460595 (= lt!639845 (select (store (arr!47650 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460596 () Bool)

(assert (=> b!1460596 (= e!821528 e!821521)))

(declare-fun res!989742 () Bool)

(assert (=> b!1460596 (=> (not res!989742) (not e!821521))))

(declare-fun lt!639852 () SeekEntryResult!11799)

(assert (=> b!1460596 (= res!989742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47650 a!2862) j!93) mask!2687) (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!639852))))

(assert (=> b!1460596 (= lt!639852 (Intermediate!11799 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460597 () Bool)

(declare-fun res!989732 () Bool)

(assert (=> b!1460597 (=> res!989732 e!821527)))

(assert (=> b!1460597 (= res!989732 e!821526)))

(declare-fun c!134947 () Bool)

(assert (=> b!1460597 (= c!134947 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460598 () Bool)

(declare-fun res!989728 () Bool)

(assert (=> b!1460598 (=> res!989728 e!821527)))

(assert (=> b!1460598 (= res!989728 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639849 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!639852)))))

(declare-fun b!1460599 () Bool)

(declare-fun res!989741 () Bool)

(assert (=> b!1460599 (=> (not res!989741) (not e!821524))))

(assert (=> b!1460599 (= res!989741 (validKeyInArray!0 (select (arr!47650 a!2862) j!93)))))

(declare-fun b!1460600 () Bool)

(declare-fun res!989743 () Bool)

(assert (=> b!1460600 (=> (not res!989743) (not e!821521))))

(assert (=> b!1460600 (= res!989743 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47650 a!2862) j!93) a!2862 mask!2687) lt!639852))))

(declare-fun b!1460601 () Bool)

(declare-fun res!989738 () Bool)

(assert (=> b!1460601 (=> (not res!989738) (not e!821524))))

(declare-datatypes ((List!34138 0))(
  ( (Nil!34135) (Cons!34134 (h!35495 (_ BitVec 64)) (t!48824 List!34138)) )
))
(declare-fun arrayNoDuplicates!0 (array!98731 (_ BitVec 32) List!34138) Bool)

(assert (=> b!1460601 (= res!989738 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34135))))

(declare-fun b!1460602 () Bool)

(declare-fun res!989736 () Bool)

(assert (=> b!1460602 (=> (not res!989736) (not e!821522))))

(assert (=> b!1460602 (= res!989736 e!821523)))

(declare-fun c!134946 () Bool)

(assert (=> b!1460602 (= c!134946 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125388 res!989734) b!1460583))

(assert (= (and b!1460583 res!989731) b!1460591))

(assert (= (and b!1460591 res!989744) b!1460599))

(assert (= (and b!1460599 res!989741) b!1460587))

(assert (= (and b!1460587 res!989730) b!1460601))

(assert (= (and b!1460601 res!989738) b!1460589))

(assert (= (and b!1460589 res!989727) b!1460593))

(assert (= (and b!1460593 res!989740) b!1460596))

(assert (= (and b!1460596 res!989742) b!1460600))

(assert (= (and b!1460600 res!989743) b!1460595))

(assert (= (and b!1460595 res!989739) b!1460602))

(assert (= (and b!1460602 c!134946) b!1460594))

(assert (= (and b!1460602 (not c!134946)) b!1460588))

(assert (= (and b!1460602 res!989736) b!1460590))

(assert (= (and b!1460590 res!989733) b!1460586))

(assert (= (and b!1460586 (not res!989737)) b!1460581))

(assert (= (and b!1460581 (not res!989735)) b!1460598))

(assert (= (and b!1460598 (not res!989728)) b!1460597))

(assert (= (and b!1460597 c!134947) b!1460582))

(assert (= (and b!1460597 (not c!134947)) b!1460585))

(assert (= (and b!1460597 (not res!989732)) b!1460592))

(assert (= (and b!1460592 (not res!989729)) b!1460584))

(declare-fun m!1348471 () Bool)

(assert (=> b!1460582 m!1348471))

(declare-fun m!1348473 () Bool)

(assert (=> b!1460585 m!1348473))

(declare-fun m!1348475 () Bool)

(assert (=> b!1460581 m!1348475))

(declare-fun m!1348477 () Bool)

(assert (=> b!1460581 m!1348477))

(declare-fun m!1348479 () Bool)

(assert (=> b!1460581 m!1348479))

(declare-fun m!1348481 () Bool)

(assert (=> b!1460601 m!1348481))

(declare-fun m!1348483 () Bool)

(assert (=> b!1460591 m!1348483))

(assert (=> b!1460591 m!1348483))

(declare-fun m!1348485 () Bool)

(assert (=> b!1460591 m!1348485))

(declare-fun m!1348487 () Bool)

(assert (=> b!1460600 m!1348487))

(assert (=> b!1460600 m!1348487))

(declare-fun m!1348489 () Bool)

(assert (=> b!1460600 m!1348489))

(assert (=> b!1460599 m!1348487))

(assert (=> b!1460599 m!1348487))

(declare-fun m!1348491 () Bool)

(assert (=> b!1460599 m!1348491))

(declare-fun m!1348493 () Bool)

(assert (=> b!1460593 m!1348493))

(declare-fun m!1348495 () Bool)

(assert (=> b!1460593 m!1348495))

(declare-fun m!1348497 () Bool)

(assert (=> b!1460595 m!1348497))

(assert (=> b!1460595 m!1348497))

(declare-fun m!1348499 () Bool)

(assert (=> b!1460595 m!1348499))

(assert (=> b!1460595 m!1348493))

(declare-fun m!1348501 () Bool)

(assert (=> b!1460595 m!1348501))

(declare-fun m!1348503 () Bool)

(assert (=> b!1460594 m!1348503))

(declare-fun m!1348505 () Bool)

(assert (=> b!1460587 m!1348505))

(declare-fun m!1348507 () Bool)

(assert (=> start!125388 m!1348507))

(declare-fun m!1348509 () Bool)

(assert (=> start!125388 m!1348509))

(declare-fun m!1348511 () Bool)

(assert (=> b!1460586 m!1348511))

(assert (=> b!1460586 m!1348493))

(declare-fun m!1348513 () Bool)

(assert (=> b!1460586 m!1348513))

(declare-fun m!1348515 () Bool)

(assert (=> b!1460586 m!1348515))

(declare-fun m!1348517 () Bool)

(assert (=> b!1460586 m!1348517))

(assert (=> b!1460586 m!1348487))

(declare-fun m!1348519 () Bool)

(assert (=> b!1460586 m!1348519))

(declare-fun m!1348521 () Bool)

(assert (=> b!1460586 m!1348521))

(assert (=> b!1460586 m!1348487))

(assert (=> b!1460598 m!1348487))

(assert (=> b!1460598 m!1348487))

(declare-fun m!1348523 () Bool)

(assert (=> b!1460598 m!1348523))

(assert (=> b!1460596 m!1348487))

(assert (=> b!1460596 m!1348487))

(declare-fun m!1348525 () Bool)

(assert (=> b!1460596 m!1348525))

(assert (=> b!1460596 m!1348525))

(assert (=> b!1460596 m!1348487))

(declare-fun m!1348527 () Bool)

(assert (=> b!1460596 m!1348527))

(assert (=> b!1460588 m!1348477))

(assert (=> b!1460588 m!1348479))

(declare-fun m!1348529 () Bool)

(assert (=> b!1460584 m!1348529))

(check-sat (not b!1460584) (not b!1460595) (not start!125388) (not b!1460586) (not b!1460594) (not b!1460587) (not b!1460600) (not b!1460582) (not b!1460581) (not b!1460601) (not b!1460599) (not b!1460588) (not b!1460598) (not b!1460591) (not b!1460585) (not b!1460596))
(check-sat)
