; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126426 () Bool)

(assert start!126426)

(declare-fun b!1478684 () Bool)

(declare-fun e!829681 () Bool)

(declare-fun e!829679 () Bool)

(assert (=> b!1478684 (= e!829681 e!829679)))

(declare-fun res!1003773 () Bool)

(assert (=> b!1478684 (=> (not res!1003773) (not e!829679))))

(declare-datatypes ((SeekEntryResult!12096 0))(
  ( (MissingZero!12096 (index!50776 (_ BitVec 32))) (Found!12096 (index!50777 (_ BitVec 32))) (Intermediate!12096 (undefined!12908 Bool) (index!50778 (_ BitVec 32)) (x!132560 (_ BitVec 32))) (Undefined!12096) (MissingVacant!12096 (index!50779 (_ BitVec 32))) )
))
(declare-fun lt!645830 () SeekEntryResult!12096)

(declare-datatypes ((array!99370 0))(
  ( (array!99371 (arr!47959 (Array (_ BitVec 32) (_ BitVec 64))) (size!48510 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99370)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478684 (= res!1003773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47959 a!2862) j!93) mask!2687) (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!645830))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478684 (= lt!645830 (Intermediate!12096 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478685 () Bool)

(declare-fun e!829676 () Bool)

(declare-fun e!829678 () Bool)

(assert (=> b!1478685 (= e!829676 e!829678)))

(declare-fun res!1003770 () Bool)

(assert (=> b!1478685 (=> (not res!1003770) (not e!829678))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!645834 () SeekEntryResult!12096)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12096)

(assert (=> b!1478685 (= res!1003770 (= lt!645834 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47959 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478686 () Bool)

(declare-fun res!1003774 () Bool)

(declare-fun e!829677 () Bool)

(assert (=> b!1478686 (=> (not res!1003774) (not e!829677))))

(declare-datatypes ((List!34447 0))(
  ( (Nil!34444) (Cons!34443 (h!35825 (_ BitVec 64)) (t!49133 List!34447)) )
))
(declare-fun arrayNoDuplicates!0 (array!99370 (_ BitVec 32) List!34447) Bool)

(assert (=> b!1478686 (= res!1003774 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34444))))

(declare-fun b!1478687 () Bool)

(declare-fun e!829682 () Bool)

(assert (=> b!1478687 (= e!829682 (not true))))

(declare-fun e!829683 () Bool)

(assert (=> b!1478687 e!829683))

(declare-fun res!1003777 () Bool)

(assert (=> b!1478687 (=> (not res!1003777) (not e!829683))))

(assert (=> b!1478687 (= res!1003777 (and (= lt!645834 (Found!12096 j!93)) (or (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) (select (arr!47959 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99370 (_ BitVec 32)) SeekEntryResult!12096)

(assert (=> b!1478687 (= lt!645834 (seekEntryOrOpen!0 (select (arr!47959 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99370 (_ BitVec 32)) Bool)

(assert (=> b!1478687 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49565 0))(
  ( (Unit!49566) )
))
(declare-fun lt!645832 () Unit!49565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49565)

(assert (=> b!1478687 (= lt!645832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478688 () Bool)

(assert (=> b!1478688 (= e!829678 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478689 () Bool)

(declare-fun res!1003763 () Bool)

(assert (=> b!1478689 (=> (not res!1003763) (not e!829677))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478689 (= res!1003763 (validKeyInArray!0 (select (arr!47959 a!2862) i!1006)))))

(declare-fun b!1478690 () Bool)

(declare-fun res!1003766 () Bool)

(assert (=> b!1478690 (=> (not res!1003766) (not e!829682))))

(declare-fun e!829675 () Bool)

(assert (=> b!1478690 (= res!1003766 e!829675)))

(declare-fun c!136990 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478690 (= c!136990 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478691 () Bool)

(declare-fun res!1003775 () Bool)

(assert (=> b!1478691 (=> (not res!1003775) (not e!829679))))

(assert (=> b!1478691 (= res!1003775 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!645830))))

(declare-fun res!1003765 () Bool)

(assert (=> start!126426 (=> (not res!1003765) (not e!829677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126426 (= res!1003765 (validMask!0 mask!2687))))

(assert (=> start!126426 e!829677))

(assert (=> start!126426 true))

(declare-fun array_inv!37240 (array!99370) Bool)

(assert (=> start!126426 (array_inv!37240 a!2862)))

(declare-fun b!1478692 () Bool)

(declare-fun res!1003772 () Bool)

(assert (=> b!1478692 (=> (not res!1003772) (not e!829677))))

(assert (=> b!1478692 (= res!1003772 (and (= (size!48510 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48510 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48510 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478693 () Bool)

(assert (=> b!1478693 (= e!829679 e!829682)))

(declare-fun res!1003768 () Bool)

(assert (=> b!1478693 (=> (not res!1003768) (not e!829682))))

(declare-fun lt!645833 () SeekEntryResult!12096)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478693 (= res!1003768 (= lt!645833 (Intermediate!12096 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645835 () array!99370)

(declare-fun lt!645831 () (_ BitVec 64))

(assert (=> b!1478693 (= lt!645833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645831 mask!2687) lt!645831 lt!645835 mask!2687))))

(assert (=> b!1478693 (= lt!645831 (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478694 () Bool)

(declare-fun res!1003771 () Bool)

(assert (=> b!1478694 (=> (not res!1003771) (not e!829682))))

(assert (=> b!1478694 (= res!1003771 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478695 () Bool)

(assert (=> b!1478695 (= e!829677 e!829681)))

(declare-fun res!1003764 () Bool)

(assert (=> b!1478695 (=> (not res!1003764) (not e!829681))))

(assert (=> b!1478695 (= res!1003764 (= (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478695 (= lt!645835 (array!99371 (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48510 a!2862)))))

(declare-fun b!1478696 () Bool)

(declare-fun res!1003778 () Bool)

(assert (=> b!1478696 (=> (not res!1003778) (not e!829677))))

(assert (=> b!1478696 (= res!1003778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478697 () Bool)

(assert (=> b!1478697 (= e!829675 (= lt!645833 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645831 lt!645835 mask!2687)))))

(declare-fun b!1478698 () Bool)

(assert (=> b!1478698 (= e!829683 e!829676)))

(declare-fun res!1003769 () Bool)

(assert (=> b!1478698 (=> res!1003769 e!829676)))

(assert (=> b!1478698 (= res!1003769 (or (and (= (select (arr!47959 a!2862) index!646) (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47959 a!2862) index!646) (select (arr!47959 a!2862) j!93))) (not (= (select (arr!47959 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478699 () Bool)

(declare-fun res!1003767 () Bool)

(assert (=> b!1478699 (=> (not res!1003767) (not e!829677))))

(assert (=> b!1478699 (= res!1003767 (validKeyInArray!0 (select (arr!47959 a!2862) j!93)))))

(declare-fun b!1478700 () Bool)

(declare-fun res!1003776 () Bool)

(assert (=> b!1478700 (=> (not res!1003776) (not e!829677))))

(assert (=> b!1478700 (= res!1003776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48510 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48510 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48510 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478701 () Bool)

(assert (=> b!1478701 (= e!829675 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645831 lt!645835 mask!2687) (seekEntryOrOpen!0 lt!645831 lt!645835 mask!2687)))))

(assert (= (and start!126426 res!1003765) b!1478692))

(assert (= (and b!1478692 res!1003772) b!1478689))

(assert (= (and b!1478689 res!1003763) b!1478699))

(assert (= (and b!1478699 res!1003767) b!1478696))

(assert (= (and b!1478696 res!1003778) b!1478686))

(assert (= (and b!1478686 res!1003774) b!1478700))

(assert (= (and b!1478700 res!1003776) b!1478695))

(assert (= (and b!1478695 res!1003764) b!1478684))

(assert (= (and b!1478684 res!1003773) b!1478691))

(assert (= (and b!1478691 res!1003775) b!1478693))

(assert (= (and b!1478693 res!1003768) b!1478690))

(assert (= (and b!1478690 c!136990) b!1478697))

(assert (= (and b!1478690 (not c!136990)) b!1478701))

(assert (= (and b!1478690 res!1003766) b!1478694))

(assert (= (and b!1478694 res!1003771) b!1478687))

(assert (= (and b!1478687 res!1003777) b!1478698))

(assert (= (and b!1478698 (not res!1003769)) b!1478685))

(assert (= (and b!1478685 res!1003770) b!1478688))

(declare-fun m!1364629 () Bool)

(assert (=> b!1478685 m!1364629))

(assert (=> b!1478685 m!1364629))

(declare-fun m!1364631 () Bool)

(assert (=> b!1478685 m!1364631))

(assert (=> b!1478684 m!1364629))

(assert (=> b!1478684 m!1364629))

(declare-fun m!1364633 () Bool)

(assert (=> b!1478684 m!1364633))

(assert (=> b!1478684 m!1364633))

(assert (=> b!1478684 m!1364629))

(declare-fun m!1364635 () Bool)

(assert (=> b!1478684 m!1364635))

(declare-fun m!1364637 () Bool)

(assert (=> b!1478686 m!1364637))

(assert (=> b!1478699 m!1364629))

(assert (=> b!1478699 m!1364629))

(declare-fun m!1364639 () Bool)

(assert (=> b!1478699 m!1364639))

(declare-fun m!1364641 () Bool)

(assert (=> b!1478701 m!1364641))

(declare-fun m!1364643 () Bool)

(assert (=> b!1478701 m!1364643))

(declare-fun m!1364645 () Bool)

(assert (=> b!1478697 m!1364645))

(declare-fun m!1364647 () Bool)

(assert (=> b!1478689 m!1364647))

(assert (=> b!1478689 m!1364647))

(declare-fun m!1364649 () Bool)

(assert (=> b!1478689 m!1364649))

(declare-fun m!1364651 () Bool)

(assert (=> b!1478687 m!1364651))

(declare-fun m!1364653 () Bool)

(assert (=> b!1478687 m!1364653))

(assert (=> b!1478687 m!1364629))

(declare-fun m!1364655 () Bool)

(assert (=> b!1478687 m!1364655))

(declare-fun m!1364657 () Bool)

(assert (=> b!1478687 m!1364657))

(assert (=> b!1478687 m!1364629))

(declare-fun m!1364659 () Bool)

(assert (=> start!126426 m!1364659))

(declare-fun m!1364661 () Bool)

(assert (=> start!126426 m!1364661))

(declare-fun m!1364663 () Bool)

(assert (=> b!1478696 m!1364663))

(declare-fun m!1364665 () Bool)

(assert (=> b!1478698 m!1364665))

(declare-fun m!1364667 () Bool)

(assert (=> b!1478698 m!1364667))

(declare-fun m!1364669 () Bool)

(assert (=> b!1478698 m!1364669))

(assert (=> b!1478698 m!1364629))

(declare-fun m!1364671 () Bool)

(assert (=> b!1478693 m!1364671))

(assert (=> b!1478693 m!1364671))

(declare-fun m!1364673 () Bool)

(assert (=> b!1478693 m!1364673))

(assert (=> b!1478693 m!1364667))

(declare-fun m!1364675 () Bool)

(assert (=> b!1478693 m!1364675))

(assert (=> b!1478691 m!1364629))

(assert (=> b!1478691 m!1364629))

(declare-fun m!1364677 () Bool)

(assert (=> b!1478691 m!1364677))

(assert (=> b!1478695 m!1364667))

(declare-fun m!1364679 () Bool)

(assert (=> b!1478695 m!1364679))

(check-sat (not b!1478689) (not b!1478701) (not b!1478699) (not b!1478693) (not b!1478687) (not start!126426) (not b!1478696) (not b!1478691) (not b!1478684) (not b!1478685) (not b!1478697) (not b!1478686))
(check-sat)
