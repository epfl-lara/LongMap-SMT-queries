; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124672 () Bool)

(assert start!124672)

(declare-fun lt!634248 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98120 0))(
  ( (array!98121 (arr!47348 (Array (_ BitVec 32) (_ BitVec 64))) (size!47898 (_ BitVec 32))) )
))
(declare-fun lt!634247 () array!98120)

(declare-fun e!813899 () Bool)

(declare-fun b!1444592 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11600 0))(
  ( (MissingZero!11600 (index!48792 (_ BitVec 32))) (Found!11600 (index!48793 (_ BitVec 32))) (Intermediate!11600 (undefined!12412 Bool) (index!48794 (_ BitVec 32)) (x!130489 (_ BitVec 32))) (Undefined!11600) (MissingVacant!11600 (index!48795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98120 (_ BitVec 32)) SeekEntryResult!11600)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98120 (_ BitVec 32)) SeekEntryResult!11600)

(assert (=> b!1444592 (= e!813899 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634248 lt!634247 mask!2687) (seekEntryOrOpen!0 lt!634248 lt!634247 mask!2687)))))

(declare-fun b!1444593 () Bool)

(declare-fun res!976574 () Bool)

(declare-fun e!813895 () Bool)

(assert (=> b!1444593 (=> (not res!976574) (not e!813895))))

(declare-fun a!2862 () array!98120)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444593 (= res!976574 (= (seekEntryOrOpen!0 (select (arr!47348 a!2862) j!93) a!2862 mask!2687) (Found!11600 j!93)))))

(declare-fun b!1444594 () Bool)

(declare-fun res!976572 () Bool)

(declare-fun e!813893 () Bool)

(assert (=> b!1444594 (=> (not res!976572) (not e!813893))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444594 (= res!976572 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444595 () Bool)

(declare-fun res!976565 () Bool)

(declare-fun e!813898 () Bool)

(assert (=> b!1444595 (=> (not res!976565) (not e!813898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444595 (= res!976565 (validKeyInArray!0 (select (arr!47348 a!2862) i!1006)))))

(declare-fun b!1444596 () Bool)

(declare-fun res!976579 () Bool)

(assert (=> b!1444596 (=> (not res!976579) (not e!813893))))

(assert (=> b!1444596 (= res!976579 e!813899)))

(declare-fun c!133524 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444596 (= c!133524 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444597 () Bool)

(declare-fun res!976575 () Bool)

(assert (=> b!1444597 (=> (not res!976575) (not e!813898))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444597 (= res!976575 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47898 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47898 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47898 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!976568 () Bool)

(assert (=> start!124672 (=> (not res!976568) (not e!813898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124672 (= res!976568 (validMask!0 mask!2687))))

(assert (=> start!124672 e!813898))

(assert (=> start!124672 true))

(declare-fun array_inv!36376 (array!98120) Bool)

(assert (=> start!124672 (array_inv!36376 a!2862)))

(declare-fun b!1444598 () Bool)

(declare-fun e!813896 () Bool)

(assert (=> b!1444598 (= e!813898 e!813896)))

(declare-fun res!976567 () Bool)

(assert (=> b!1444598 (=> (not res!976567) (not e!813896))))

(assert (=> b!1444598 (= res!976567 (= (select (store (arr!47348 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444598 (= lt!634247 (array!98121 (store (arr!47348 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47898 a!2862)))))

(declare-fun b!1444599 () Bool)

(declare-fun e!813897 () Bool)

(assert (=> b!1444599 (= e!813897 e!813893)))

(declare-fun res!976566 () Bool)

(assert (=> b!1444599 (=> (not res!976566) (not e!813893))))

(declare-fun lt!634250 () SeekEntryResult!11600)

(assert (=> b!1444599 (= res!976566 (= lt!634250 (Intermediate!11600 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98120 (_ BitVec 32)) SeekEntryResult!11600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444599 (= lt!634250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634248 mask!2687) lt!634248 lt!634247 mask!2687))))

(assert (=> b!1444599 (= lt!634248 (select (store (arr!47348 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444600 () Bool)

(assert (=> b!1444600 (= e!813899 (= lt!634250 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634248 lt!634247 mask!2687)))))

(declare-fun b!1444601 () Bool)

(assert (=> b!1444601 (= e!813893 (not true))))

(assert (=> b!1444601 e!813895))

(declare-fun res!976578 () Bool)

(assert (=> b!1444601 (=> (not res!976578) (not e!813895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98120 (_ BitVec 32)) Bool)

(assert (=> b!1444601 (= res!976578 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48696 0))(
  ( (Unit!48697) )
))
(declare-fun lt!634249 () Unit!48696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48696)

(assert (=> b!1444601 (= lt!634249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444602 () Bool)

(declare-fun res!976571 () Bool)

(assert (=> b!1444602 (=> (not res!976571) (not e!813897))))

(declare-fun lt!634251 () SeekEntryResult!11600)

(assert (=> b!1444602 (= res!976571 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47348 a!2862) j!93) a!2862 mask!2687) lt!634251))))

(declare-fun b!1444603 () Bool)

(declare-fun res!976577 () Bool)

(assert (=> b!1444603 (=> (not res!976577) (not e!813898))))

(assert (=> b!1444603 (= res!976577 (and (= (size!47898 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47898 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47898 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444604 () Bool)

(declare-fun res!976576 () Bool)

(assert (=> b!1444604 (=> (not res!976576) (not e!813898))))

(assert (=> b!1444604 (= res!976576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444605 () Bool)

(declare-fun res!976570 () Bool)

(assert (=> b!1444605 (=> (not res!976570) (not e!813898))))

(declare-datatypes ((List!33849 0))(
  ( (Nil!33846) (Cons!33845 (h!35195 (_ BitVec 64)) (t!48543 List!33849)) )
))
(declare-fun arrayNoDuplicates!0 (array!98120 (_ BitVec 32) List!33849) Bool)

(assert (=> b!1444605 (= res!976570 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33846))))

(declare-fun b!1444606 () Bool)

(assert (=> b!1444606 (= e!813895 (or (= (select (arr!47348 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47348 a!2862) intermediateBeforeIndex!19) (select (arr!47348 a!2862) j!93))))))

(declare-fun b!1444607 () Bool)

(declare-fun res!976569 () Bool)

(assert (=> b!1444607 (=> (not res!976569) (not e!813898))))

(assert (=> b!1444607 (= res!976569 (validKeyInArray!0 (select (arr!47348 a!2862) j!93)))))

(declare-fun b!1444608 () Bool)

(assert (=> b!1444608 (= e!813896 e!813897)))

(declare-fun res!976573 () Bool)

(assert (=> b!1444608 (=> (not res!976573) (not e!813897))))

(assert (=> b!1444608 (= res!976573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47348 a!2862) j!93) mask!2687) (select (arr!47348 a!2862) j!93) a!2862 mask!2687) lt!634251))))

(assert (=> b!1444608 (= lt!634251 (Intermediate!11600 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124672 res!976568) b!1444603))

(assert (= (and b!1444603 res!976577) b!1444595))

(assert (= (and b!1444595 res!976565) b!1444607))

(assert (= (and b!1444607 res!976569) b!1444604))

(assert (= (and b!1444604 res!976576) b!1444605))

(assert (= (and b!1444605 res!976570) b!1444597))

(assert (= (and b!1444597 res!976575) b!1444598))

(assert (= (and b!1444598 res!976567) b!1444608))

(assert (= (and b!1444608 res!976573) b!1444602))

(assert (= (and b!1444602 res!976571) b!1444599))

(assert (= (and b!1444599 res!976566) b!1444596))

(assert (= (and b!1444596 c!133524) b!1444600))

(assert (= (and b!1444596 (not c!133524)) b!1444592))

(assert (= (and b!1444596 res!976579) b!1444594))

(assert (= (and b!1444594 res!976572) b!1444601))

(assert (= (and b!1444601 res!976578) b!1444593))

(assert (= (and b!1444593 res!976574) b!1444606))

(declare-fun m!1333609 () Bool)

(assert (=> b!1444607 m!1333609))

(assert (=> b!1444607 m!1333609))

(declare-fun m!1333611 () Bool)

(assert (=> b!1444607 m!1333611))

(declare-fun m!1333613 () Bool)

(assert (=> b!1444598 m!1333613))

(declare-fun m!1333615 () Bool)

(assert (=> b!1444598 m!1333615))

(declare-fun m!1333617 () Bool)

(assert (=> b!1444592 m!1333617))

(declare-fun m!1333619 () Bool)

(assert (=> b!1444592 m!1333619))

(declare-fun m!1333621 () Bool)

(assert (=> b!1444601 m!1333621))

(declare-fun m!1333623 () Bool)

(assert (=> b!1444601 m!1333623))

(declare-fun m!1333625 () Bool)

(assert (=> b!1444606 m!1333625))

(assert (=> b!1444606 m!1333609))

(assert (=> b!1444593 m!1333609))

(assert (=> b!1444593 m!1333609))

(declare-fun m!1333627 () Bool)

(assert (=> b!1444593 m!1333627))

(assert (=> b!1444602 m!1333609))

(assert (=> b!1444602 m!1333609))

(declare-fun m!1333629 () Bool)

(assert (=> b!1444602 m!1333629))

(declare-fun m!1333631 () Bool)

(assert (=> b!1444604 m!1333631))

(declare-fun m!1333633 () Bool)

(assert (=> b!1444599 m!1333633))

(assert (=> b!1444599 m!1333633))

(declare-fun m!1333635 () Bool)

(assert (=> b!1444599 m!1333635))

(assert (=> b!1444599 m!1333613))

(declare-fun m!1333637 () Bool)

(assert (=> b!1444599 m!1333637))

(declare-fun m!1333639 () Bool)

(assert (=> b!1444595 m!1333639))

(assert (=> b!1444595 m!1333639))

(declare-fun m!1333641 () Bool)

(assert (=> b!1444595 m!1333641))

(assert (=> b!1444608 m!1333609))

(assert (=> b!1444608 m!1333609))

(declare-fun m!1333643 () Bool)

(assert (=> b!1444608 m!1333643))

(assert (=> b!1444608 m!1333643))

(assert (=> b!1444608 m!1333609))

(declare-fun m!1333645 () Bool)

(assert (=> b!1444608 m!1333645))

(declare-fun m!1333647 () Bool)

(assert (=> b!1444600 m!1333647))

(declare-fun m!1333649 () Bool)

(assert (=> b!1444605 m!1333649))

(declare-fun m!1333651 () Bool)

(assert (=> start!124672 m!1333651))

(declare-fun m!1333653 () Bool)

(assert (=> start!124672 m!1333653))

(push 1)

