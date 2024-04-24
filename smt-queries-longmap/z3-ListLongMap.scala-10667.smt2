; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125358 () Bool)

(assert start!125358)

(declare-fun lt!639459 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639462 () (_ BitVec 64))

(declare-fun e!821104 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1459591 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11784 0))(
  ( (MissingZero!11784 (index!49528 (_ BitVec 32))) (Found!11784 (index!49529 (_ BitVec 32))) (Intermediate!11784 (undefined!12596 Bool) (index!49530 (_ BitVec 32)) (x!131321 (_ BitVec 32))) (Undefined!11784) (MissingVacant!11784 (index!49531 (_ BitVec 32))) )
))
(declare-fun lt!639458 () SeekEntryResult!11784)

(declare-datatypes ((array!98701 0))(
  ( (array!98702 (arr!47635 (Array (_ BitVec 32) (_ BitVec 64))) (size!48186 (_ BitVec 32))) )
))
(declare-fun lt!639463 () array!98701)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98701 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1459591 (= e!821104 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639459 intermediateAfterIndex!19 lt!639462 lt!639463 mask!2687) lt!639458)))))

(declare-fun b!1459592 () Bool)

(declare-fun res!988925 () Bool)

(declare-fun e!821108 () Bool)

(assert (=> b!1459592 (=> (not res!988925) (not e!821108))))

(declare-fun a!2862 () array!98701)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98701 (_ BitVec 32)) Bool)

(assert (=> b!1459592 (= res!988925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459593 () Bool)

(declare-fun res!988934 () Bool)

(assert (=> b!1459593 (=> (not res!988934) (not e!821108))))

(declare-datatypes ((List!34123 0))(
  ( (Nil!34120) (Cons!34119 (h!35480 (_ BitVec 64)) (t!48809 List!34123)) )
))
(declare-fun arrayNoDuplicates!0 (array!98701 (_ BitVec 32) List!34123) Bool)

(assert (=> b!1459593 (= res!988934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34120))))

(declare-fun b!1459594 () Bool)

(declare-fun res!988926 () Bool)

(declare-fun e!821101 () Bool)

(assert (=> b!1459594 (=> (not res!988926) (not e!821101))))

(declare-fun e!821106 () Bool)

(assert (=> b!1459594 (= res!988926 e!821106)))

(declare-fun c!134856 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459594 (= c!134856 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459595 () Bool)

(declare-fun res!988919 () Bool)

(declare-fun e!821103 () Bool)

(assert (=> b!1459595 (=> (not res!988919) (not e!821103))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98701 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1459595 (= res!988919 (= (seekEntryOrOpen!0 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) (Found!11784 j!93)))))

(declare-fun b!1459596 () Bool)

(declare-fun lt!639460 () SeekEntryResult!11784)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98701 (_ BitVec 32)) SeekEntryResult!11784)

(assert (=> b!1459596 (= e!821104 (not (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639459 lt!639462 lt!639463 mask!2687))))))

(declare-fun b!1459598 () Bool)

(declare-fun e!821102 () Bool)

(assert (=> b!1459598 (= e!821108 e!821102)))

(declare-fun res!988930 () Bool)

(assert (=> b!1459598 (=> (not res!988930) (not e!821102))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459598 (= res!988930 (= (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459598 (= lt!639463 (array!98702 (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48186 a!2862)))))

(declare-fun b!1459599 () Bool)

(declare-fun res!988928 () Bool)

(assert (=> b!1459599 (=> (not res!988928) (not e!821108))))

(assert (=> b!1459599 (= res!988928 (and (= (size!48186 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48186 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48186 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459600 () Bool)

(declare-fun res!988923 () Bool)

(assert (=> b!1459600 (=> (not res!988923) (not e!821101))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459600 (= res!988923 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459601 () Bool)

(declare-fun e!821100 () Bool)

(assert (=> b!1459601 (= e!821101 (not e!821100))))

(declare-fun res!988924 () Bool)

(assert (=> b!1459601 (=> res!988924 e!821100)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1459601 (= res!988924 (or (and (= (select (arr!47635 a!2862) index!646) (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47635 a!2862) index!646) (select (arr!47635 a!2862) j!93))) (= (select (arr!47635 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459601 e!821103))

(declare-fun res!988918 () Bool)

(assert (=> b!1459601 (=> (not res!988918) (not e!821103))))

(assert (=> b!1459601 (= res!988918 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49097 0))(
  ( (Unit!49098) )
))
(declare-fun lt!639461 () Unit!49097)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49097)

(assert (=> b!1459601 (= lt!639461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459602 () Bool)

(declare-fun res!988917 () Bool)

(declare-fun e!821105 () Bool)

(assert (=> b!1459602 (=> res!988917 e!821105)))

(declare-fun lt!639456 () SeekEntryResult!11784)

(assert (=> b!1459602 (= res!988917 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639459 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!639456)))))

(declare-fun b!1459603 () Bool)

(assert (=> b!1459603 (= e!821105 true)))

(declare-fun lt!639457 () Bool)

(assert (=> b!1459603 (= lt!639457 e!821104)))

(declare-fun c!134857 () Bool)

(assert (=> b!1459603 (= c!134857 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459604 () Bool)

(declare-fun res!988931 () Bool)

(declare-fun e!821107 () Bool)

(assert (=> b!1459604 (=> (not res!988931) (not e!821107))))

(assert (=> b!1459604 (= res!988931 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!639456))))

(declare-fun b!1459605 () Bool)

(assert (=> b!1459605 (= e!821102 e!821107)))

(declare-fun res!988933 () Bool)

(assert (=> b!1459605 (=> (not res!988933) (not e!821107))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459605 (= res!988933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47635 a!2862) j!93) mask!2687) (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!639456))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459605 (= lt!639456 (Intermediate!11784 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459606 () Bool)

(assert (=> b!1459606 (= e!821100 e!821105)))

(declare-fun res!988929 () Bool)

(assert (=> b!1459606 (=> res!988929 e!821105)))

(assert (=> b!1459606 (= res!988929 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639459 #b00000000000000000000000000000000) (bvsge lt!639459 (size!48186 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459606 (= lt!639459 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1459606 (= lt!639458 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639462 lt!639463 mask!2687))))

(assert (=> b!1459606 (= lt!639458 (seekEntryOrOpen!0 lt!639462 lt!639463 mask!2687))))

(declare-fun b!1459607 () Bool)

(assert (=> b!1459607 (= e!821106 (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639462 lt!639463 mask!2687)))))

(declare-fun b!1459608 () Bool)

(declare-fun res!988920 () Bool)

(assert (=> b!1459608 (=> (not res!988920) (not e!821108))))

(assert (=> b!1459608 (= res!988920 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48186 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48186 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48186 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459609 () Bool)

(assert (=> b!1459609 (= e!821107 e!821101)))

(declare-fun res!988921 () Bool)

(assert (=> b!1459609 (=> (not res!988921) (not e!821101))))

(assert (=> b!1459609 (= res!988921 (= lt!639460 (Intermediate!11784 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459609 (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639462 mask!2687) lt!639462 lt!639463 mask!2687))))

(assert (=> b!1459609 (= lt!639462 (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459610 () Bool)

(declare-fun res!988922 () Bool)

(assert (=> b!1459610 (=> (not res!988922) (not e!821108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459610 (= res!988922 (validKeyInArray!0 (select (arr!47635 a!2862) i!1006)))))

(declare-fun b!1459597 () Bool)

(assert (=> b!1459597 (= e!821103 (and (or (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) (select (arr!47635 a!2862) j!93))) (let ((bdg!53414 (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47635 a!2862) index!646) bdg!53414) (= (select (arr!47635 a!2862) index!646) (select (arr!47635 a!2862) j!93))) (= (select (arr!47635 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53414 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!988927 () Bool)

(assert (=> start!125358 (=> (not res!988927) (not e!821108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125358 (= res!988927 (validMask!0 mask!2687))))

(assert (=> start!125358 e!821108))

(assert (=> start!125358 true))

(declare-fun array_inv!36916 (array!98701) Bool)

(assert (=> start!125358 (array_inv!36916 a!2862)))

(declare-fun b!1459611 () Bool)

(declare-fun res!988932 () Bool)

(assert (=> b!1459611 (=> (not res!988932) (not e!821108))))

(assert (=> b!1459611 (= res!988932 (validKeyInArray!0 (select (arr!47635 a!2862) j!93)))))

(declare-fun b!1459612 () Bool)

(assert (=> b!1459612 (= e!821106 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639462 lt!639463 mask!2687) (seekEntryOrOpen!0 lt!639462 lt!639463 mask!2687)))))

(assert (= (and start!125358 res!988927) b!1459599))

(assert (= (and b!1459599 res!988928) b!1459610))

(assert (= (and b!1459610 res!988922) b!1459611))

(assert (= (and b!1459611 res!988932) b!1459592))

(assert (= (and b!1459592 res!988925) b!1459593))

(assert (= (and b!1459593 res!988934) b!1459608))

(assert (= (and b!1459608 res!988920) b!1459598))

(assert (= (and b!1459598 res!988930) b!1459605))

(assert (= (and b!1459605 res!988933) b!1459604))

(assert (= (and b!1459604 res!988931) b!1459609))

(assert (= (and b!1459609 res!988921) b!1459594))

(assert (= (and b!1459594 c!134856) b!1459607))

(assert (= (and b!1459594 (not c!134856)) b!1459612))

(assert (= (and b!1459594 res!988926) b!1459600))

(assert (= (and b!1459600 res!988923) b!1459601))

(assert (= (and b!1459601 res!988918) b!1459595))

(assert (= (and b!1459595 res!988919) b!1459597))

(assert (= (and b!1459601 (not res!988924)) b!1459606))

(assert (= (and b!1459606 (not res!988929)) b!1459602))

(assert (= (and b!1459602 (not res!988917)) b!1459603))

(assert (= (and b!1459603 c!134857) b!1459596))

(assert (= (and b!1459603 (not c!134857)) b!1459591))

(declare-fun m!1347583 () Bool)

(assert (=> b!1459609 m!1347583))

(assert (=> b!1459609 m!1347583))

(declare-fun m!1347585 () Bool)

(assert (=> b!1459609 m!1347585))

(declare-fun m!1347587 () Bool)

(assert (=> b!1459609 m!1347587))

(declare-fun m!1347589 () Bool)

(assert (=> b!1459609 m!1347589))

(declare-fun m!1347591 () Bool)

(assert (=> b!1459611 m!1347591))

(assert (=> b!1459611 m!1347591))

(declare-fun m!1347593 () Bool)

(assert (=> b!1459611 m!1347593))

(declare-fun m!1347595 () Bool)

(assert (=> b!1459593 m!1347595))

(declare-fun m!1347597 () Bool)

(assert (=> b!1459591 m!1347597))

(declare-fun m!1347599 () Bool)

(assert (=> b!1459610 m!1347599))

(assert (=> b!1459610 m!1347599))

(declare-fun m!1347601 () Bool)

(assert (=> b!1459610 m!1347601))

(declare-fun m!1347603 () Bool)

(assert (=> b!1459606 m!1347603))

(declare-fun m!1347605 () Bool)

(assert (=> b!1459606 m!1347605))

(declare-fun m!1347607 () Bool)

(assert (=> b!1459606 m!1347607))

(assert (=> b!1459612 m!1347605))

(assert (=> b!1459612 m!1347607))

(assert (=> b!1459597 m!1347587))

(declare-fun m!1347609 () Bool)

(assert (=> b!1459597 m!1347609))

(declare-fun m!1347611 () Bool)

(assert (=> b!1459597 m!1347611))

(declare-fun m!1347613 () Bool)

(assert (=> b!1459597 m!1347613))

(assert (=> b!1459597 m!1347591))

(assert (=> b!1459598 m!1347587))

(declare-fun m!1347615 () Bool)

(assert (=> b!1459598 m!1347615))

(assert (=> b!1459595 m!1347591))

(assert (=> b!1459595 m!1347591))

(declare-fun m!1347617 () Bool)

(assert (=> b!1459595 m!1347617))

(declare-fun m!1347619 () Bool)

(assert (=> b!1459596 m!1347619))

(assert (=> b!1459604 m!1347591))

(assert (=> b!1459604 m!1347591))

(declare-fun m!1347621 () Bool)

(assert (=> b!1459604 m!1347621))

(assert (=> b!1459602 m!1347591))

(assert (=> b!1459602 m!1347591))

(declare-fun m!1347623 () Bool)

(assert (=> b!1459602 m!1347623))

(declare-fun m!1347625 () Bool)

(assert (=> b!1459601 m!1347625))

(assert (=> b!1459601 m!1347587))

(assert (=> b!1459601 m!1347611))

(assert (=> b!1459601 m!1347613))

(declare-fun m!1347627 () Bool)

(assert (=> b!1459601 m!1347627))

(assert (=> b!1459601 m!1347591))

(declare-fun m!1347629 () Bool)

(assert (=> b!1459607 m!1347629))

(declare-fun m!1347631 () Bool)

(assert (=> start!125358 m!1347631))

(declare-fun m!1347633 () Bool)

(assert (=> start!125358 m!1347633))

(declare-fun m!1347635 () Bool)

(assert (=> b!1459592 m!1347635))

(assert (=> b!1459605 m!1347591))

(assert (=> b!1459605 m!1347591))

(declare-fun m!1347637 () Bool)

(assert (=> b!1459605 m!1347637))

(assert (=> b!1459605 m!1347637))

(assert (=> b!1459605 m!1347591))

(declare-fun m!1347639 () Bool)

(assert (=> b!1459605 m!1347639))

(check-sat (not b!1459606) (not b!1459595) (not b!1459591) (not b!1459604) (not b!1459602) (not b!1459609) (not b!1459605) (not b!1459601) (not b!1459592) (not b!1459612) (not b!1459607) (not start!125358) (not b!1459610) (not b!1459596) (not b!1459593) (not b!1459611))
(check-sat)
