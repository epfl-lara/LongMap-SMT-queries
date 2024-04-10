; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125122 () Bool)

(assert start!125122)

(declare-fun b!1457670 () Bool)

(declare-fun e!819996 () Bool)

(declare-fun e!819992 () Bool)

(assert (=> b!1457670 (= e!819996 e!819992)))

(declare-fun res!987932 () Bool)

(assert (=> b!1457670 (=> (not res!987932) (not e!819992))))

(declare-datatypes ((SeekEntryResult!11825 0))(
  ( (MissingZero!11825 (index!49692 (_ BitVec 32))) (Found!11825 (index!49693 (_ BitVec 32))) (Intermediate!11825 (undefined!12637 Bool) (index!49694 (_ BitVec 32)) (x!131314 (_ BitVec 32))) (Undefined!11825) (MissingVacant!11825 (index!49695 (_ BitVec 32))) )
))
(declare-fun lt!638764 () SeekEntryResult!11825)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457670 (= res!987932 (= lt!638764 (Intermediate!11825 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98570 0))(
  ( (array!98571 (arr!47573 (Array (_ BitVec 32) (_ BitVec 64))) (size!48123 (_ BitVec 32))) )
))
(declare-fun lt!638762 () array!98570)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638765 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98570 (_ BitVec 32)) SeekEntryResult!11825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457670 (= lt!638764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638765 mask!2687) lt!638765 lt!638762 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98570)

(assert (=> b!1457670 (= lt!638765 (select (store (arr!47573 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457671 () Bool)

(declare-fun res!987929 () Bool)

(declare-fun e!819998 () Bool)

(assert (=> b!1457671 (=> (not res!987929) (not e!819998))))

(assert (=> b!1457671 (= res!987929 (and (= (size!48123 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48123 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48123 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457672 () Bool)

(declare-fun res!987930 () Bool)

(assert (=> b!1457672 (=> (not res!987930) (not e!819998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98570 (_ BitVec 32)) Bool)

(assert (=> b!1457672 (= res!987930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457673 () Bool)

(declare-fun e!819995 () Bool)

(declare-fun e!819997 () Bool)

(assert (=> b!1457673 (= e!819995 e!819997)))

(declare-fun res!987933 () Bool)

(assert (=> b!1457673 (=> res!987933 e!819997)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638763 () (_ BitVec 32))

(assert (=> b!1457673 (= res!987933 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638763 #b00000000000000000000000000000000) (bvsge lt!638763 (size!48123 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457673 (= lt!638763 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638766 () SeekEntryResult!11825)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98570 (_ BitVec 32)) SeekEntryResult!11825)

(assert (=> b!1457673 (= lt!638766 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638765 lt!638762 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98570 (_ BitVec 32)) SeekEntryResult!11825)

(assert (=> b!1457673 (= lt!638766 (seekEntryOrOpen!0 lt!638765 lt!638762 mask!2687))))

(declare-fun res!987931 () Bool)

(assert (=> start!125122 (=> (not res!987931) (not e!819998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125122 (= res!987931 (validMask!0 mask!2687))))

(assert (=> start!125122 e!819998))

(assert (=> start!125122 true))

(declare-fun array_inv!36601 (array!98570) Bool)

(assert (=> start!125122 (array_inv!36601 a!2862)))

(declare-fun b!1457674 () Bool)

(declare-fun res!987941 () Bool)

(assert (=> b!1457674 (=> (not res!987941) (not e!819998))))

(declare-datatypes ((List!34074 0))(
  ( (Nil!34071) (Cons!34070 (h!35420 (_ BitVec 64)) (t!48768 List!34074)) )
))
(declare-fun arrayNoDuplicates!0 (array!98570 (_ BitVec 32) List!34074) Bool)

(assert (=> b!1457674 (= res!987941 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34071))))

(declare-fun b!1457675 () Bool)

(declare-fun res!987943 () Bool)

(assert (=> b!1457675 (=> (not res!987943) (not e!819996))))

(declare-fun lt!638767 () SeekEntryResult!11825)

(assert (=> b!1457675 (= res!987943 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47573 a!2862) j!93) a!2862 mask!2687) lt!638767))))

(declare-fun b!1457676 () Bool)

(declare-fun res!987942 () Bool)

(assert (=> b!1457676 (=> res!987942 e!819997)))

(assert (=> b!1457676 (= res!987942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638763 (select (arr!47573 a!2862) j!93) a!2862 mask!2687) lt!638767)))))

(declare-fun b!1457677 () Bool)

(declare-fun e!820001 () Bool)

(assert (=> b!1457677 (= e!820001 (not (= lt!638764 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638763 lt!638765 lt!638762 mask!2687))))))

(declare-fun b!1457678 () Bool)

(assert (=> b!1457678 (= e!820001 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638763 intermediateAfterIndex!19 lt!638765 lt!638762 mask!2687) lt!638766)))))

(declare-fun b!1457679 () Bool)

(declare-fun res!987937 () Bool)

(assert (=> b!1457679 (=> (not res!987937) (not e!819998))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457679 (= res!987937 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48123 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48123 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48123 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457680 () Bool)

(assert (=> b!1457680 (= e!819997 true)))

(declare-fun lt!638769 () Bool)

(assert (=> b!1457680 (= lt!638769 e!820001)))

(declare-fun c!134382 () Bool)

(assert (=> b!1457680 (= c!134382 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457681 () Bool)

(assert (=> b!1457681 (= e!819992 (not e!819995))))

(declare-fun res!987939 () Bool)

(assert (=> b!1457681 (=> res!987939 e!819995)))

(assert (=> b!1457681 (= res!987939 (or (and (= (select (arr!47573 a!2862) index!646) (select (store (arr!47573 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47573 a!2862) index!646) (select (arr!47573 a!2862) j!93))) (= (select (arr!47573 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820000 () Bool)

(assert (=> b!1457681 e!820000))

(declare-fun res!987936 () Bool)

(assert (=> b!1457681 (=> (not res!987936) (not e!820000))))

(assert (=> b!1457681 (= res!987936 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49146 0))(
  ( (Unit!49147) )
))
(declare-fun lt!638768 () Unit!49146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49146)

(assert (=> b!1457681 (= lt!638768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457682 () Bool)

(declare-fun res!987938 () Bool)

(assert (=> b!1457682 (=> (not res!987938) (not e!819992))))

(declare-fun e!819993 () Bool)

(assert (=> b!1457682 (= res!987938 e!819993)))

(declare-fun c!134381 () Bool)

(assert (=> b!1457682 (= c!134381 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457683 () Bool)

(declare-fun res!987935 () Bool)

(assert (=> b!1457683 (=> (not res!987935) (not e!819998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457683 (= res!987935 (validKeyInArray!0 (select (arr!47573 a!2862) i!1006)))))

(declare-fun b!1457684 () Bool)

(declare-fun e!819999 () Bool)

(assert (=> b!1457684 (= e!819999 e!819996)))

(declare-fun res!987934 () Bool)

(assert (=> b!1457684 (=> (not res!987934) (not e!819996))))

(assert (=> b!1457684 (= res!987934 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47573 a!2862) j!93) mask!2687) (select (arr!47573 a!2862) j!93) a!2862 mask!2687) lt!638767))))

(assert (=> b!1457684 (= lt!638767 (Intermediate!11825 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457685 () Bool)

(declare-fun res!987945 () Bool)

(assert (=> b!1457685 (=> (not res!987945) (not e!819992))))

(assert (=> b!1457685 (= res!987945 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457686 () Bool)

(declare-fun res!987940 () Bool)

(assert (=> b!1457686 (=> (not res!987940) (not e!820000))))

(assert (=> b!1457686 (= res!987940 (= (seekEntryOrOpen!0 (select (arr!47573 a!2862) j!93) a!2862 mask!2687) (Found!11825 j!93)))))

(declare-fun b!1457687 () Bool)

(assert (=> b!1457687 (= e!819993 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638765 lt!638762 mask!2687) (seekEntryOrOpen!0 lt!638765 lt!638762 mask!2687)))))

(declare-fun b!1457688 () Bool)

(assert (=> b!1457688 (= e!819998 e!819999)))

(declare-fun res!987944 () Bool)

(assert (=> b!1457688 (=> (not res!987944) (not e!819999))))

(assert (=> b!1457688 (= res!987944 (= (select (store (arr!47573 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457688 (= lt!638762 (array!98571 (store (arr!47573 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48123 a!2862)))))

(declare-fun b!1457689 () Bool)

(assert (=> b!1457689 (= e!819993 (= lt!638764 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638765 lt!638762 mask!2687)))))

(declare-fun b!1457690 () Bool)

(assert (=> b!1457690 (= e!820000 (and (or (= (select (arr!47573 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47573 a!2862) intermediateBeforeIndex!19) (select (arr!47573 a!2862) j!93))) (let ((bdg!53359 (select (store (arr!47573 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47573 a!2862) index!646) bdg!53359) (= (select (arr!47573 a!2862) index!646) (select (arr!47573 a!2862) j!93))) (= (select (arr!47573 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53359 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457691 () Bool)

(declare-fun res!987946 () Bool)

(assert (=> b!1457691 (=> (not res!987946) (not e!819998))))

(assert (=> b!1457691 (= res!987946 (validKeyInArray!0 (select (arr!47573 a!2862) j!93)))))

(assert (= (and start!125122 res!987931) b!1457671))

(assert (= (and b!1457671 res!987929) b!1457683))

(assert (= (and b!1457683 res!987935) b!1457691))

(assert (= (and b!1457691 res!987946) b!1457672))

(assert (= (and b!1457672 res!987930) b!1457674))

(assert (= (and b!1457674 res!987941) b!1457679))

(assert (= (and b!1457679 res!987937) b!1457688))

(assert (= (and b!1457688 res!987944) b!1457684))

(assert (= (and b!1457684 res!987934) b!1457675))

(assert (= (and b!1457675 res!987943) b!1457670))

(assert (= (and b!1457670 res!987932) b!1457682))

(assert (= (and b!1457682 c!134381) b!1457689))

(assert (= (and b!1457682 (not c!134381)) b!1457687))

(assert (= (and b!1457682 res!987938) b!1457685))

(assert (= (and b!1457685 res!987945) b!1457681))

(assert (= (and b!1457681 res!987936) b!1457686))

(assert (= (and b!1457686 res!987940) b!1457690))

(assert (= (and b!1457681 (not res!987939)) b!1457673))

(assert (= (and b!1457673 (not res!987933)) b!1457676))

(assert (= (and b!1457676 (not res!987942)) b!1457680))

(assert (= (and b!1457680 c!134382) b!1457677))

(assert (= (and b!1457680 (not c!134382)) b!1457678))

(declare-fun m!1345621 () Bool)

(assert (=> b!1457684 m!1345621))

(assert (=> b!1457684 m!1345621))

(declare-fun m!1345623 () Bool)

(assert (=> b!1457684 m!1345623))

(assert (=> b!1457684 m!1345623))

(assert (=> b!1457684 m!1345621))

(declare-fun m!1345625 () Bool)

(assert (=> b!1457684 m!1345625))

(declare-fun m!1345627 () Bool)

(assert (=> b!1457687 m!1345627))

(declare-fun m!1345629 () Bool)

(assert (=> b!1457687 m!1345629))

(assert (=> b!1457686 m!1345621))

(assert (=> b!1457686 m!1345621))

(declare-fun m!1345631 () Bool)

(assert (=> b!1457686 m!1345631))

(declare-fun m!1345633 () Bool)

(assert (=> start!125122 m!1345633))

(declare-fun m!1345635 () Bool)

(assert (=> start!125122 m!1345635))

(declare-fun m!1345637 () Bool)

(assert (=> b!1457673 m!1345637))

(assert (=> b!1457673 m!1345627))

(assert (=> b!1457673 m!1345629))

(declare-fun m!1345639 () Bool)

(assert (=> b!1457688 m!1345639))

(declare-fun m!1345641 () Bool)

(assert (=> b!1457688 m!1345641))

(assert (=> b!1457691 m!1345621))

(assert (=> b!1457691 m!1345621))

(declare-fun m!1345643 () Bool)

(assert (=> b!1457691 m!1345643))

(declare-fun m!1345645 () Bool)

(assert (=> b!1457683 m!1345645))

(assert (=> b!1457683 m!1345645))

(declare-fun m!1345647 () Bool)

(assert (=> b!1457683 m!1345647))

(declare-fun m!1345649 () Bool)

(assert (=> b!1457678 m!1345649))

(declare-fun m!1345651 () Bool)

(assert (=> b!1457670 m!1345651))

(assert (=> b!1457670 m!1345651))

(declare-fun m!1345653 () Bool)

(assert (=> b!1457670 m!1345653))

(assert (=> b!1457670 m!1345639))

(declare-fun m!1345655 () Bool)

(assert (=> b!1457670 m!1345655))

(declare-fun m!1345657 () Bool)

(assert (=> b!1457672 m!1345657))

(assert (=> b!1457676 m!1345621))

(assert (=> b!1457676 m!1345621))

(declare-fun m!1345659 () Bool)

(assert (=> b!1457676 m!1345659))

(declare-fun m!1345661 () Bool)

(assert (=> b!1457681 m!1345661))

(assert (=> b!1457681 m!1345639))

(declare-fun m!1345663 () Bool)

(assert (=> b!1457681 m!1345663))

(declare-fun m!1345665 () Bool)

(assert (=> b!1457681 m!1345665))

(declare-fun m!1345667 () Bool)

(assert (=> b!1457681 m!1345667))

(assert (=> b!1457681 m!1345621))

(declare-fun m!1345669 () Bool)

(assert (=> b!1457677 m!1345669))

(assert (=> b!1457690 m!1345639))

(declare-fun m!1345671 () Bool)

(assert (=> b!1457690 m!1345671))

(assert (=> b!1457690 m!1345663))

(assert (=> b!1457690 m!1345665))

(assert (=> b!1457690 m!1345621))

(assert (=> b!1457675 m!1345621))

(assert (=> b!1457675 m!1345621))

(declare-fun m!1345673 () Bool)

(assert (=> b!1457675 m!1345673))

(declare-fun m!1345675 () Bool)

(assert (=> b!1457689 m!1345675))

(declare-fun m!1345677 () Bool)

(assert (=> b!1457674 m!1345677))

(push 1)

