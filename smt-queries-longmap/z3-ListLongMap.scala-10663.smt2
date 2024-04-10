; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125118 () Bool)

(assert start!125118)

(declare-fun res!987832 () Bool)

(declare-fun e!819933 () Bool)

(assert (=> start!125118 (=> (not res!987832) (not e!819933))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125118 (= res!987832 (validMask!0 mask!2687))))

(assert (=> start!125118 e!819933))

(assert (=> start!125118 true))

(declare-datatypes ((array!98566 0))(
  ( (array!98567 (arr!47571 (Array (_ BitVec 32) (_ BitVec 64))) (size!48121 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98566)

(declare-fun array_inv!36599 (array!98566) Bool)

(assert (=> start!125118 (array_inv!36599 a!2862)))

(declare-fun b!1457538 () Bool)

(declare-fun e!819935 () Bool)

(assert (=> b!1457538 (= e!819933 e!819935)))

(declare-fun res!987827 () Bool)

(assert (=> b!1457538 (=> (not res!987827) (not e!819935))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457538 (= res!987827 (= (select (store (arr!47571 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638715 () array!98566)

(assert (=> b!1457538 (= lt!638715 (array!98567 (store (arr!47571 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48121 a!2862)))))

(declare-fun b!1457539 () Bool)

(declare-fun e!819936 () Bool)

(assert (=> b!1457539 (= e!819935 e!819936)))

(declare-fun res!987822 () Bool)

(assert (=> b!1457539 (=> (not res!987822) (not e!819936))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11823 0))(
  ( (MissingZero!11823 (index!49684 (_ BitVec 32))) (Found!11823 (index!49685 (_ BitVec 32))) (Intermediate!11823 (undefined!12635 Bool) (index!49686 (_ BitVec 32)) (x!131304 (_ BitVec 32))) (Undefined!11823) (MissingVacant!11823 (index!49687 (_ BitVec 32))) )
))
(declare-fun lt!638721 () SeekEntryResult!11823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457539 (= res!987822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47571 a!2862) j!93) mask!2687) (select (arr!47571 a!2862) j!93) a!2862 mask!2687) lt!638721))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457539 (= lt!638721 (Intermediate!11823 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457540 () Bool)

(declare-fun e!819940 () Bool)

(assert (=> b!1457540 (= e!819940 true)))

(declare-fun lt!638717 () Bool)

(declare-fun e!819932 () Bool)

(assert (=> b!1457540 (= lt!638717 e!819932)))

(declare-fun c!134370 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457540 (= c!134370 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457541 () Bool)

(declare-fun e!819937 () Bool)

(assert (=> b!1457541 (= e!819937 e!819940)))

(declare-fun res!987823 () Bool)

(assert (=> b!1457541 (=> res!987823 e!819940)))

(declare-fun lt!638714 () (_ BitVec 32))

(assert (=> b!1457541 (= res!987823 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638714 #b00000000000000000000000000000000) (bvsge lt!638714 (size!48121 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457541 (= lt!638714 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638719 () (_ BitVec 64))

(declare-fun lt!638718 () SeekEntryResult!11823)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11823)

(assert (=> b!1457541 (= lt!638718 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638719 lt!638715 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11823)

(assert (=> b!1457541 (= lt!638718 (seekEntryOrOpen!0 lt!638719 lt!638715 mask!2687))))

(declare-fun e!819941 () Bool)

(declare-fun b!1457542 () Bool)

(assert (=> b!1457542 (= e!819941 (and (or (= (select (arr!47571 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47571 a!2862) intermediateBeforeIndex!19) (select (arr!47571 a!2862) j!93))) (let ((bdg!53344 (select (store (arr!47571 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47571 a!2862) index!646) bdg!53344) (= (select (arr!47571 a!2862) index!646) (select (arr!47571 a!2862) j!93))) (= (select (arr!47571 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53344 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457543 () Bool)

(declare-fun res!987834 () Bool)

(assert (=> b!1457543 (=> (not res!987834) (not e!819933))))

(declare-datatypes ((List!34072 0))(
  ( (Nil!34069) (Cons!34068 (h!35418 (_ BitVec 64)) (t!48766 List!34072)) )
))
(declare-fun arrayNoDuplicates!0 (array!98566 (_ BitVec 32) List!34072) Bool)

(assert (=> b!1457543 (= res!987834 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34069))))

(declare-fun b!1457544 () Bool)

(declare-fun res!987829 () Bool)

(assert (=> b!1457544 (=> (not res!987829) (not e!819941))))

(assert (=> b!1457544 (= res!987829 (= (seekEntryOrOpen!0 (select (arr!47571 a!2862) j!93) a!2862 mask!2687) (Found!11823 j!93)))))

(declare-fun lt!638716 () SeekEntryResult!11823)

(declare-fun b!1457545 () Bool)

(declare-fun e!819938 () Bool)

(assert (=> b!1457545 (= e!819938 (= lt!638716 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638719 lt!638715 mask!2687)))))

(declare-fun b!1457546 () Bool)

(assert (=> b!1457546 (= e!819932 (not (= lt!638716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638714 lt!638719 lt!638715 mask!2687))))))

(declare-fun b!1457547 () Bool)

(declare-fun res!987835 () Bool)

(assert (=> b!1457547 (=> res!987835 e!819940)))

(assert (=> b!1457547 (= res!987835 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638714 (select (arr!47571 a!2862) j!93) a!2862 mask!2687) lt!638721)))))

(declare-fun b!1457548 () Bool)

(declare-fun res!987821 () Bool)

(declare-fun e!819934 () Bool)

(assert (=> b!1457548 (=> (not res!987821) (not e!819934))))

(assert (=> b!1457548 (= res!987821 e!819938)))

(declare-fun c!134369 () Bool)

(assert (=> b!1457548 (= c!134369 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457549 () Bool)

(declare-fun res!987824 () Bool)

(assert (=> b!1457549 (=> (not res!987824) (not e!819933))))

(assert (=> b!1457549 (= res!987824 (and (= (size!48121 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48121 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48121 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457550 () Bool)

(declare-fun res!987826 () Bool)

(assert (=> b!1457550 (=> (not res!987826) (not e!819934))))

(assert (=> b!1457550 (= res!987826 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457551 () Bool)

(assert (=> b!1457551 (= e!819934 (not e!819937))))

(declare-fun res!987831 () Bool)

(assert (=> b!1457551 (=> res!987831 e!819937)))

(assert (=> b!1457551 (= res!987831 (or (and (= (select (arr!47571 a!2862) index!646) (select (store (arr!47571 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47571 a!2862) index!646) (select (arr!47571 a!2862) j!93))) (= (select (arr!47571 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457551 e!819941))

(declare-fun res!987836 () Bool)

(assert (=> b!1457551 (=> (not res!987836) (not e!819941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98566 (_ BitVec 32)) Bool)

(assert (=> b!1457551 (= res!987836 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49142 0))(
  ( (Unit!49143) )
))
(declare-fun lt!638720 () Unit!49142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49142)

(assert (=> b!1457551 (= lt!638720 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457552 () Bool)

(declare-fun res!987828 () Bool)

(assert (=> b!1457552 (=> (not res!987828) (not e!819936))))

(assert (=> b!1457552 (= res!987828 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47571 a!2862) j!93) a!2862 mask!2687) lt!638721))))

(declare-fun b!1457553 () Bool)

(assert (=> b!1457553 (= e!819938 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638719 lt!638715 mask!2687) (seekEntryOrOpen!0 lt!638719 lt!638715 mask!2687)))))

(declare-fun b!1457554 () Bool)

(assert (=> b!1457554 (= e!819936 e!819934)))

(declare-fun res!987837 () Bool)

(assert (=> b!1457554 (=> (not res!987837) (not e!819934))))

(assert (=> b!1457554 (= res!987837 (= lt!638716 (Intermediate!11823 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457554 (= lt!638716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638719 mask!2687) lt!638719 lt!638715 mask!2687))))

(assert (=> b!1457554 (= lt!638719 (select (store (arr!47571 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457555 () Bool)

(declare-fun res!987830 () Bool)

(assert (=> b!1457555 (=> (not res!987830) (not e!819933))))

(assert (=> b!1457555 (= res!987830 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48121 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48121 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48121 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457556 () Bool)

(declare-fun res!987825 () Bool)

(assert (=> b!1457556 (=> (not res!987825) (not e!819933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457556 (= res!987825 (validKeyInArray!0 (select (arr!47571 a!2862) j!93)))))

(declare-fun b!1457557 () Bool)

(assert (=> b!1457557 (= e!819932 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638714 intermediateAfterIndex!19 lt!638719 lt!638715 mask!2687) lt!638718)))))

(declare-fun b!1457558 () Bool)

(declare-fun res!987833 () Bool)

(assert (=> b!1457558 (=> (not res!987833) (not e!819933))))

(assert (=> b!1457558 (= res!987833 (validKeyInArray!0 (select (arr!47571 a!2862) i!1006)))))

(declare-fun b!1457559 () Bool)

(declare-fun res!987838 () Bool)

(assert (=> b!1457559 (=> (not res!987838) (not e!819933))))

(assert (=> b!1457559 (= res!987838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125118 res!987832) b!1457549))

(assert (= (and b!1457549 res!987824) b!1457558))

(assert (= (and b!1457558 res!987833) b!1457556))

(assert (= (and b!1457556 res!987825) b!1457559))

(assert (= (and b!1457559 res!987838) b!1457543))

(assert (= (and b!1457543 res!987834) b!1457555))

(assert (= (and b!1457555 res!987830) b!1457538))

(assert (= (and b!1457538 res!987827) b!1457539))

(assert (= (and b!1457539 res!987822) b!1457552))

(assert (= (and b!1457552 res!987828) b!1457554))

(assert (= (and b!1457554 res!987837) b!1457548))

(assert (= (and b!1457548 c!134369) b!1457545))

(assert (= (and b!1457548 (not c!134369)) b!1457553))

(assert (= (and b!1457548 res!987821) b!1457550))

(assert (= (and b!1457550 res!987826) b!1457551))

(assert (= (and b!1457551 res!987836) b!1457544))

(assert (= (and b!1457544 res!987829) b!1457542))

(assert (= (and b!1457551 (not res!987831)) b!1457541))

(assert (= (and b!1457541 (not res!987823)) b!1457547))

(assert (= (and b!1457547 (not res!987835)) b!1457540))

(assert (= (and b!1457540 c!134370) b!1457546))

(assert (= (and b!1457540 (not c!134370)) b!1457557))

(declare-fun m!1345505 () Bool)

(assert (=> b!1457551 m!1345505))

(declare-fun m!1345507 () Bool)

(assert (=> b!1457551 m!1345507))

(declare-fun m!1345509 () Bool)

(assert (=> b!1457551 m!1345509))

(declare-fun m!1345511 () Bool)

(assert (=> b!1457551 m!1345511))

(declare-fun m!1345513 () Bool)

(assert (=> b!1457551 m!1345513))

(declare-fun m!1345515 () Bool)

(assert (=> b!1457551 m!1345515))

(declare-fun m!1345517 () Bool)

(assert (=> b!1457553 m!1345517))

(declare-fun m!1345519 () Bool)

(assert (=> b!1457553 m!1345519))

(declare-fun m!1345521 () Bool)

(assert (=> b!1457546 m!1345521))

(declare-fun m!1345523 () Bool)

(assert (=> b!1457559 m!1345523))

(declare-fun m!1345525 () Bool)

(assert (=> b!1457543 m!1345525))

(declare-fun m!1345527 () Bool)

(assert (=> b!1457545 m!1345527))

(declare-fun m!1345529 () Bool)

(assert (=> b!1457554 m!1345529))

(assert (=> b!1457554 m!1345529))

(declare-fun m!1345531 () Bool)

(assert (=> b!1457554 m!1345531))

(assert (=> b!1457554 m!1345507))

(declare-fun m!1345533 () Bool)

(assert (=> b!1457554 m!1345533))

(assert (=> b!1457542 m!1345507))

(declare-fun m!1345535 () Bool)

(assert (=> b!1457542 m!1345535))

(assert (=> b!1457542 m!1345509))

(assert (=> b!1457542 m!1345511))

(assert (=> b!1457542 m!1345515))

(declare-fun m!1345537 () Bool)

(assert (=> b!1457557 m!1345537))

(declare-fun m!1345539 () Bool)

(assert (=> b!1457558 m!1345539))

(assert (=> b!1457558 m!1345539))

(declare-fun m!1345541 () Bool)

(assert (=> b!1457558 m!1345541))

(assert (=> b!1457547 m!1345515))

(assert (=> b!1457547 m!1345515))

(declare-fun m!1345543 () Bool)

(assert (=> b!1457547 m!1345543))

(assert (=> b!1457552 m!1345515))

(assert (=> b!1457552 m!1345515))

(declare-fun m!1345545 () Bool)

(assert (=> b!1457552 m!1345545))

(assert (=> b!1457556 m!1345515))

(assert (=> b!1457556 m!1345515))

(declare-fun m!1345547 () Bool)

(assert (=> b!1457556 m!1345547))

(assert (=> b!1457538 m!1345507))

(declare-fun m!1345549 () Bool)

(assert (=> b!1457538 m!1345549))

(declare-fun m!1345551 () Bool)

(assert (=> b!1457541 m!1345551))

(assert (=> b!1457541 m!1345517))

(assert (=> b!1457541 m!1345519))

(assert (=> b!1457544 m!1345515))

(assert (=> b!1457544 m!1345515))

(declare-fun m!1345553 () Bool)

(assert (=> b!1457544 m!1345553))

(declare-fun m!1345555 () Bool)

(assert (=> start!125118 m!1345555))

(declare-fun m!1345557 () Bool)

(assert (=> start!125118 m!1345557))

(assert (=> b!1457539 m!1345515))

(assert (=> b!1457539 m!1345515))

(declare-fun m!1345559 () Bool)

(assert (=> b!1457539 m!1345559))

(assert (=> b!1457539 m!1345559))

(assert (=> b!1457539 m!1345515))

(declare-fun m!1345561 () Bool)

(assert (=> b!1457539 m!1345561))

(check-sat (not b!1457545) (not start!125118) (not b!1457553) (not b!1457551) (not b!1457547) (not b!1457556) (not b!1457546) (not b!1457544) (not b!1457543) (not b!1457559) (not b!1457558) (not b!1457541) (not b!1457554) (not b!1457539) (not b!1457557) (not b!1457552))
(check-sat)
