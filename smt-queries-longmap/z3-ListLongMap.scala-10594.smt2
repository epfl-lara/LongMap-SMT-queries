; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124920 () Bool)

(assert start!124920)

(declare-fun b!1446684 () Bool)

(declare-fun res!977756 () Bool)

(declare-fun e!815048 () Bool)

(assert (=> b!1446684 (=> (not res!977756) (not e!815048))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98263 0))(
  ( (array!98264 (arr!47416 (Array (_ BitVec 32) (_ BitVec 64))) (size!47967 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98263)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446684 (= res!977756 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47967 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47967 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47967 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446685 () Bool)

(declare-fun res!977751 () Bool)

(declare-fun e!815046 () Bool)

(assert (=> b!1446685 (=> (not res!977751) (not e!815046))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11565 0))(
  ( (MissingZero!11565 (index!48652 (_ BitVec 32))) (Found!11565 (index!48653 (_ BitVec 32))) (Intermediate!11565 (undefined!12377 Bool) (index!48654 (_ BitVec 32)) (x!130518 (_ BitVec 32))) (Undefined!11565) (MissingVacant!11565 (index!48655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98263 (_ BitVec 32)) SeekEntryResult!11565)

(assert (=> b!1446685 (= res!977751 (= (seekEntryOrOpen!0 (select (arr!47416 a!2862) j!93) a!2862 mask!2687) (Found!11565 j!93)))))

(declare-fun b!1446686 () Bool)

(declare-fun res!977755 () Bool)

(assert (=> b!1446686 (=> (not res!977755) (not e!815048))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446686 (= res!977755 (and (= (size!47967 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47967 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47967 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!634953 () array!98263)

(declare-fun lt!634952 () (_ BitVec 64))

(declare-fun e!815051 () Bool)

(declare-fun lt!634954 () SeekEntryResult!11565)

(declare-fun b!1446687 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98263 (_ BitVec 32)) SeekEntryResult!11565)

(assert (=> b!1446687 (= e!815051 (= lt!634954 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634952 lt!634953 mask!2687)))))

(declare-fun b!1446688 () Bool)

(declare-fun res!977752 () Bool)

(assert (=> b!1446688 (=> (not res!977752) (not e!815048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98263 (_ BitVec 32)) Bool)

(assert (=> b!1446688 (= res!977752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446689 () Bool)

(declare-fun res!977750 () Bool)

(assert (=> b!1446689 (=> (not res!977750) (not e!815048))))

(declare-datatypes ((List!33904 0))(
  ( (Nil!33901) (Cons!33900 (h!35261 (_ BitVec 64)) (t!48590 List!33904)) )
))
(declare-fun arrayNoDuplicates!0 (array!98263 (_ BitVec 32) List!33904) Bool)

(assert (=> b!1446689 (= res!977750 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33901))))

(declare-fun res!977754 () Bool)

(assert (=> start!124920 (=> (not res!977754) (not e!815048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124920 (= res!977754 (validMask!0 mask!2687))))

(assert (=> start!124920 e!815048))

(assert (=> start!124920 true))

(declare-fun array_inv!36697 (array!98263) Bool)

(assert (=> start!124920 (array_inv!36697 a!2862)))

(declare-fun b!1446690 () Bool)

(declare-fun res!977745 () Bool)

(declare-fun e!815049 () Bool)

(assert (=> b!1446690 (=> (not res!977745) (not e!815049))))

(declare-fun lt!634951 () SeekEntryResult!11565)

(assert (=> b!1446690 (= res!977745 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!634951))))

(declare-fun e!815050 () Bool)

(declare-fun b!1446691 () Bool)

(assert (=> b!1446691 (= e!815050 (not (or (and (= (select (arr!47416 a!2862) index!646) (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47416 a!2862) index!646) (select (arr!47416 a!2862) j!93))) (not (= (select (arr!47416 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1446691 e!815046))

(declare-fun res!977743 () Bool)

(assert (=> b!1446691 (=> (not res!977743) (not e!815046))))

(assert (=> b!1446691 (= res!977743 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48659 0))(
  ( (Unit!48660) )
))
(declare-fun lt!634950 () Unit!48659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48659)

(assert (=> b!1446691 (= lt!634950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446692 () Bool)

(assert (=> b!1446692 (= e!815049 e!815050)))

(declare-fun res!977746 () Bool)

(assert (=> b!1446692 (=> (not res!977746) (not e!815050))))

(assert (=> b!1446692 (= res!977746 (= lt!634954 (Intermediate!11565 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446692 (= lt!634954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634952 mask!2687) lt!634952 lt!634953 mask!2687))))

(assert (=> b!1446692 (= lt!634952 (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446693 () Bool)

(declare-fun res!977749 () Bool)

(assert (=> b!1446693 (=> (not res!977749) (not e!815050))))

(assert (=> b!1446693 (= res!977749 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446694 () Bool)

(declare-fun res!977744 () Bool)

(assert (=> b!1446694 (=> (not res!977744) (not e!815048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446694 (= res!977744 (validKeyInArray!0 (select (arr!47416 a!2862) j!93)))))

(declare-fun b!1446695 () Bool)

(assert (=> b!1446695 (= e!815046 (or (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) (select (arr!47416 a!2862) j!93))))))

(declare-fun b!1446696 () Bool)

(declare-fun e!815047 () Bool)

(assert (=> b!1446696 (= e!815047 e!815049)))

(declare-fun res!977753 () Bool)

(assert (=> b!1446696 (=> (not res!977753) (not e!815049))))

(assert (=> b!1446696 (= res!977753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47416 a!2862) j!93) mask!2687) (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!634951))))

(assert (=> b!1446696 (= lt!634951 (Intermediate!11565 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446697 () Bool)

(assert (=> b!1446697 (= e!815048 e!815047)))

(declare-fun res!977742 () Bool)

(assert (=> b!1446697 (=> (not res!977742) (not e!815047))))

(assert (=> b!1446697 (= res!977742 (= (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446697 (= lt!634953 (array!98264 (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47967 a!2862)))))

(declare-fun b!1446698 () Bool)

(declare-fun res!977748 () Bool)

(assert (=> b!1446698 (=> (not res!977748) (not e!815050))))

(assert (=> b!1446698 (= res!977748 e!815051)))

(declare-fun c!133990 () Bool)

(assert (=> b!1446698 (= c!133990 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446699 () Bool)

(declare-fun res!977747 () Bool)

(assert (=> b!1446699 (=> (not res!977747) (not e!815048))))

(assert (=> b!1446699 (= res!977747 (validKeyInArray!0 (select (arr!47416 a!2862) i!1006)))))

(declare-fun b!1446700 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98263 (_ BitVec 32)) SeekEntryResult!11565)

(assert (=> b!1446700 (= e!815051 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634952 lt!634953 mask!2687) (seekEntryOrOpen!0 lt!634952 lt!634953 mask!2687)))))

(assert (= (and start!124920 res!977754) b!1446686))

(assert (= (and b!1446686 res!977755) b!1446699))

(assert (= (and b!1446699 res!977747) b!1446694))

(assert (= (and b!1446694 res!977744) b!1446688))

(assert (= (and b!1446688 res!977752) b!1446689))

(assert (= (and b!1446689 res!977750) b!1446684))

(assert (= (and b!1446684 res!977756) b!1446697))

(assert (= (and b!1446697 res!977742) b!1446696))

(assert (= (and b!1446696 res!977753) b!1446690))

(assert (= (and b!1446690 res!977745) b!1446692))

(assert (= (and b!1446692 res!977746) b!1446698))

(assert (= (and b!1446698 c!133990) b!1446687))

(assert (= (and b!1446698 (not c!133990)) b!1446700))

(assert (= (and b!1446698 res!977748) b!1446693))

(assert (= (and b!1446693 res!977749) b!1446691))

(assert (= (and b!1446691 res!977743) b!1446685))

(assert (= (and b!1446685 res!977751) b!1446695))

(declare-fun m!1335751 () Bool)

(assert (=> start!124920 m!1335751))

(declare-fun m!1335753 () Bool)

(assert (=> start!124920 m!1335753))

(declare-fun m!1335755 () Bool)

(assert (=> b!1446688 m!1335755))

(declare-fun m!1335757 () Bool)

(assert (=> b!1446690 m!1335757))

(assert (=> b!1446690 m!1335757))

(declare-fun m!1335759 () Bool)

(assert (=> b!1446690 m!1335759))

(declare-fun m!1335761 () Bool)

(assert (=> b!1446687 m!1335761))

(declare-fun m!1335763 () Bool)

(assert (=> b!1446700 m!1335763))

(declare-fun m!1335765 () Bool)

(assert (=> b!1446700 m!1335765))

(assert (=> b!1446696 m!1335757))

(assert (=> b!1446696 m!1335757))

(declare-fun m!1335767 () Bool)

(assert (=> b!1446696 m!1335767))

(assert (=> b!1446696 m!1335767))

(assert (=> b!1446696 m!1335757))

(declare-fun m!1335769 () Bool)

(assert (=> b!1446696 m!1335769))

(declare-fun m!1335771 () Bool)

(assert (=> b!1446699 m!1335771))

(assert (=> b!1446699 m!1335771))

(declare-fun m!1335773 () Bool)

(assert (=> b!1446699 m!1335773))

(assert (=> b!1446685 m!1335757))

(assert (=> b!1446685 m!1335757))

(declare-fun m!1335775 () Bool)

(assert (=> b!1446685 m!1335775))

(declare-fun m!1335777 () Bool)

(assert (=> b!1446695 m!1335777))

(assert (=> b!1446695 m!1335757))

(declare-fun m!1335779 () Bool)

(assert (=> b!1446691 m!1335779))

(declare-fun m!1335781 () Bool)

(assert (=> b!1446691 m!1335781))

(declare-fun m!1335783 () Bool)

(assert (=> b!1446691 m!1335783))

(declare-fun m!1335785 () Bool)

(assert (=> b!1446691 m!1335785))

(declare-fun m!1335787 () Bool)

(assert (=> b!1446691 m!1335787))

(assert (=> b!1446691 m!1335757))

(assert (=> b!1446697 m!1335781))

(declare-fun m!1335789 () Bool)

(assert (=> b!1446697 m!1335789))

(declare-fun m!1335791 () Bool)

(assert (=> b!1446692 m!1335791))

(assert (=> b!1446692 m!1335791))

(declare-fun m!1335793 () Bool)

(assert (=> b!1446692 m!1335793))

(assert (=> b!1446692 m!1335781))

(declare-fun m!1335795 () Bool)

(assert (=> b!1446692 m!1335795))

(assert (=> b!1446694 m!1335757))

(assert (=> b!1446694 m!1335757))

(declare-fun m!1335797 () Bool)

(assert (=> b!1446694 m!1335797))

(declare-fun m!1335799 () Bool)

(assert (=> b!1446689 m!1335799))

(check-sat (not b!1446688) (not b!1446687) (not start!124920) (not b!1446694) (not b!1446685) (not b!1446696) (not b!1446699) (not b!1446692) (not b!1446691) (not b!1446689) (not b!1446700) (not b!1446690))
(check-sat)
