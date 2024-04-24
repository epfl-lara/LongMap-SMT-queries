; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125688 () Bool)

(assert start!125688)

(declare-fun b!1468711 () Bool)

(declare-fun res!996232 () Bool)

(declare-fun e!825149 () Bool)

(assert (=> b!1468711 (=> (not res!996232) (not e!825149))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98974 0))(
  ( (array!98975 (arr!47770 (Array (_ BitVec 32) (_ BitVec 64))) (size!48321 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98974)

(assert (=> b!1468711 (= res!996232 (and (= (size!48321 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48321 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48321 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468712 () Bool)

(declare-fun e!825152 () Bool)

(assert (=> b!1468712 (= e!825152 true)))

(declare-fun lt!642594 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11919 0))(
  ( (MissingZero!11919 (index!50068 (_ BitVec 32))) (Found!11919 (index!50069 (_ BitVec 32))) (Intermediate!11919 (undefined!12731 Bool) (index!50070 (_ BitVec 32)) (x!131825 (_ BitVec 32))) (Undefined!11919) (MissingVacant!11919 (index!50071 (_ BitVec 32))) )
))
(declare-fun lt!642601 () SeekEntryResult!11919)

(declare-fun lt!642597 () array!98974)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!11919)

(assert (=> b!1468712 (= lt!642601 (seekEntryOrOpen!0 lt!642594 lt!642597 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49367 0))(
  ( (Unit!49368) )
))
(declare-fun lt!642595 () Unit!49367)

(declare-fun lt!642599 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49367)

(assert (=> b!1468712 (= lt!642595 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642599 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1468713 () Bool)

(declare-fun res!996223 () Bool)

(assert (=> b!1468713 (=> res!996223 e!825152)))

(declare-fun lt!642596 () SeekEntryResult!11919)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!11919)

(assert (=> b!1468713 (= res!996223 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642599 (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642596)))))

(declare-fun e!825154 () Bool)

(declare-fun b!1468715 () Bool)

(declare-fun lt!642598 () SeekEntryResult!11919)

(assert (=> b!1468715 (= e!825154 (not (= lt!642598 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642599 lt!642594 lt!642597 mask!2687))))))

(declare-fun e!825150 () Bool)

(declare-fun b!1468716 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!11919)

(assert (=> b!1468716 (= e!825150 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642594 lt!642597 mask!2687) (seekEntryOrOpen!0 lt!642594 lt!642597 mask!2687)))))

(declare-fun b!1468717 () Bool)

(declare-fun res!996230 () Bool)

(assert (=> b!1468717 (=> res!996230 e!825152)))

(assert (=> b!1468717 (= res!996230 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1468718 () Bool)

(declare-fun e!825148 () Bool)

(declare-fun e!825153 () Bool)

(assert (=> b!1468718 (= e!825148 (not e!825153))))

(declare-fun res!996227 () Bool)

(assert (=> b!1468718 (=> res!996227 e!825153)))

(assert (=> b!1468718 (= res!996227 (or (and (= (select (arr!47770 a!2862) index!646) (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47770 a!2862) index!646) (select (arr!47770 a!2862) j!93))) (= (select (arr!47770 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1468718 (and (= lt!642601 (Found!11919 j!93)) (or (= (select (arr!47770 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47770 a!2862) intermediateBeforeIndex!19) (select (arr!47770 a!2862) j!93))))))

(assert (=> b!1468718 (= lt!642601 (seekEntryOrOpen!0 (select (arr!47770 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98974 (_ BitVec 32)) Bool)

(assert (=> b!1468718 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642600 () Unit!49367)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49367)

(assert (=> b!1468718 (= lt!642600 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1468719 () Bool)

(declare-fun res!996216 () Bool)

(assert (=> b!1468719 (=> res!996216 e!825152)))

(assert (=> b!1468719 (= res!996216 e!825154)))

(declare-fun c!135769 () Bool)

(assert (=> b!1468719 (= c!135769 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1468720 () Bool)

(assert (=> b!1468720 (= e!825154 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642599 intermediateAfterIndex!19 lt!642594 lt!642597 mask!2687) (seekEntryOrOpen!0 lt!642594 lt!642597 mask!2687))))))

(declare-fun b!1468721 () Bool)

(declare-fun res!996226 () Bool)

(assert (=> b!1468721 (=> (not res!996226) (not e!825149))))

(assert (=> b!1468721 (= res!996226 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48321 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48321 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48321 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1468722 () Bool)

(declare-fun res!996225 () Bool)

(declare-fun e!825151 () Bool)

(assert (=> b!1468722 (=> (not res!996225) (not e!825151))))

(assert (=> b!1468722 (= res!996225 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642596))))

(declare-fun b!1468723 () Bool)

(assert (=> b!1468723 (= e!825153 e!825152)))

(declare-fun res!996222 () Bool)

(assert (=> b!1468723 (=> res!996222 e!825152)))

(assert (=> b!1468723 (= res!996222 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642599 #b00000000000000000000000000000000) (bvsge lt!642599 (size!48321 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468723 (= lt!642599 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1468724 () Bool)

(declare-fun res!996233 () Bool)

(assert (=> b!1468724 (=> (not res!996233) (not e!825149))))

(declare-datatypes ((List!34258 0))(
  ( (Nil!34255) (Cons!34254 (h!35618 (_ BitVec 64)) (t!48944 List!34258)) )
))
(declare-fun arrayNoDuplicates!0 (array!98974 (_ BitVec 32) List!34258) Bool)

(assert (=> b!1468724 (= res!996233 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34255))))

(declare-fun res!996221 () Bool)

(assert (=> start!125688 (=> (not res!996221) (not e!825149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125688 (= res!996221 (validMask!0 mask!2687))))

(assert (=> start!125688 e!825149))

(assert (=> start!125688 true))

(declare-fun array_inv!37051 (array!98974) Bool)

(assert (=> start!125688 (array_inv!37051 a!2862)))

(declare-fun b!1468714 () Bool)

(declare-fun res!996220 () Bool)

(assert (=> b!1468714 (=> (not res!996220) (not e!825149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468714 (= res!996220 (validKeyInArray!0 (select (arr!47770 a!2862) i!1006)))))

(declare-fun b!1468725 () Bool)

(declare-fun e!825156 () Bool)

(assert (=> b!1468725 (= e!825156 e!825151)))

(declare-fun res!996229 () Bool)

(assert (=> b!1468725 (=> (not res!996229) (not e!825151))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468725 (= res!996229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47770 a!2862) j!93) mask!2687) (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642596))))

(assert (=> b!1468725 (= lt!642596 (Intermediate!11919 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468726 () Bool)

(declare-fun res!996219 () Bool)

(assert (=> b!1468726 (=> (not res!996219) (not e!825149))))

(assert (=> b!1468726 (= res!996219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468727 () Bool)

(assert (=> b!1468727 (= e!825151 e!825148)))

(declare-fun res!996217 () Bool)

(assert (=> b!1468727 (=> (not res!996217) (not e!825148))))

(assert (=> b!1468727 (= res!996217 (= lt!642598 (Intermediate!11919 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1468727 (= lt!642598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642594 mask!2687) lt!642594 lt!642597 mask!2687))))

(assert (=> b!1468727 (= lt!642594 (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1468728 () Bool)

(declare-fun res!996224 () Bool)

(assert (=> b!1468728 (=> (not res!996224) (not e!825149))))

(assert (=> b!1468728 (= res!996224 (validKeyInArray!0 (select (arr!47770 a!2862) j!93)))))

(declare-fun b!1468729 () Bool)

(assert (=> b!1468729 (= e!825150 (= lt!642598 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642594 lt!642597 mask!2687)))))

(declare-fun b!1468730 () Bool)

(assert (=> b!1468730 (= e!825149 e!825156)))

(declare-fun res!996231 () Bool)

(assert (=> b!1468730 (=> (not res!996231) (not e!825156))))

(assert (=> b!1468730 (= res!996231 (= (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1468730 (= lt!642597 (array!98975 (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48321 a!2862)))))

(declare-fun b!1468731 () Bool)

(declare-fun res!996228 () Bool)

(assert (=> b!1468731 (=> (not res!996228) (not e!825148))))

(assert (=> b!1468731 (= res!996228 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1468732 () Bool)

(declare-fun res!996218 () Bool)

(assert (=> b!1468732 (=> (not res!996218) (not e!825148))))

(assert (=> b!1468732 (= res!996218 e!825150)))

(declare-fun c!135768 () Bool)

(assert (=> b!1468732 (= c!135768 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125688 res!996221) b!1468711))

(assert (= (and b!1468711 res!996232) b!1468714))

(assert (= (and b!1468714 res!996220) b!1468728))

(assert (= (and b!1468728 res!996224) b!1468726))

(assert (= (and b!1468726 res!996219) b!1468724))

(assert (= (and b!1468724 res!996233) b!1468721))

(assert (= (and b!1468721 res!996226) b!1468730))

(assert (= (and b!1468730 res!996231) b!1468725))

(assert (= (and b!1468725 res!996229) b!1468722))

(assert (= (and b!1468722 res!996225) b!1468727))

(assert (= (and b!1468727 res!996217) b!1468732))

(assert (= (and b!1468732 c!135768) b!1468729))

(assert (= (and b!1468732 (not c!135768)) b!1468716))

(assert (= (and b!1468732 res!996218) b!1468731))

(assert (= (and b!1468731 res!996228) b!1468718))

(assert (= (and b!1468718 (not res!996227)) b!1468723))

(assert (= (and b!1468723 (not res!996222)) b!1468713))

(assert (= (and b!1468713 (not res!996223)) b!1468719))

(assert (= (and b!1468719 c!135769) b!1468715))

(assert (= (and b!1468719 (not c!135769)) b!1468720))

(assert (= (and b!1468719 (not res!996216)) b!1468717))

(assert (= (and b!1468717 (not res!996230)) b!1468712))

(declare-fun m!1355629 () Bool)

(assert (=> b!1468730 m!1355629))

(declare-fun m!1355631 () Bool)

(assert (=> b!1468730 m!1355631))

(declare-fun m!1355633 () Bool)

(assert (=> b!1468716 m!1355633))

(declare-fun m!1355635 () Bool)

(assert (=> b!1468716 m!1355635))

(declare-fun m!1355637 () Bool)

(assert (=> b!1468718 m!1355637))

(assert (=> b!1468718 m!1355629))

(declare-fun m!1355639 () Bool)

(assert (=> b!1468718 m!1355639))

(declare-fun m!1355641 () Bool)

(assert (=> b!1468718 m!1355641))

(declare-fun m!1355643 () Bool)

(assert (=> b!1468718 m!1355643))

(declare-fun m!1355645 () Bool)

(assert (=> b!1468718 m!1355645))

(declare-fun m!1355647 () Bool)

(assert (=> b!1468718 m!1355647))

(declare-fun m!1355649 () Bool)

(assert (=> b!1468718 m!1355649))

(assert (=> b!1468718 m!1355645))

(declare-fun m!1355651 () Bool)

(assert (=> b!1468727 m!1355651))

(assert (=> b!1468727 m!1355651))

(declare-fun m!1355653 () Bool)

(assert (=> b!1468727 m!1355653))

(assert (=> b!1468727 m!1355629))

(declare-fun m!1355655 () Bool)

(assert (=> b!1468727 m!1355655))

(declare-fun m!1355657 () Bool)

(assert (=> b!1468714 m!1355657))

(assert (=> b!1468714 m!1355657))

(declare-fun m!1355659 () Bool)

(assert (=> b!1468714 m!1355659))

(declare-fun m!1355661 () Bool)

(assert (=> b!1468715 m!1355661))

(declare-fun m!1355663 () Bool)

(assert (=> start!125688 m!1355663))

(declare-fun m!1355665 () Bool)

(assert (=> start!125688 m!1355665))

(declare-fun m!1355667 () Bool)

(assert (=> b!1468720 m!1355667))

(assert (=> b!1468720 m!1355635))

(declare-fun m!1355669 () Bool)

(assert (=> b!1468723 m!1355669))

(assert (=> b!1468722 m!1355645))

(assert (=> b!1468722 m!1355645))

(declare-fun m!1355671 () Bool)

(assert (=> b!1468722 m!1355671))

(assert (=> b!1468712 m!1355635))

(declare-fun m!1355673 () Bool)

(assert (=> b!1468712 m!1355673))

(declare-fun m!1355675 () Bool)

(assert (=> b!1468729 m!1355675))

(assert (=> b!1468728 m!1355645))

(assert (=> b!1468728 m!1355645))

(declare-fun m!1355677 () Bool)

(assert (=> b!1468728 m!1355677))

(declare-fun m!1355679 () Bool)

(assert (=> b!1468726 m!1355679))

(declare-fun m!1355681 () Bool)

(assert (=> b!1468724 m!1355681))

(assert (=> b!1468725 m!1355645))

(assert (=> b!1468725 m!1355645))

(declare-fun m!1355683 () Bool)

(assert (=> b!1468725 m!1355683))

(assert (=> b!1468725 m!1355683))

(assert (=> b!1468725 m!1355645))

(declare-fun m!1355685 () Bool)

(assert (=> b!1468725 m!1355685))

(assert (=> b!1468713 m!1355645))

(assert (=> b!1468713 m!1355645))

(declare-fun m!1355687 () Bool)

(assert (=> b!1468713 m!1355687))

(check-sat (not b!1468725) (not b!1468728) (not b!1468723) (not start!125688) (not b!1468722) (not b!1468718) (not b!1468726) (not b!1468715) (not b!1468729) (not b!1468724) (not b!1468716) (not b!1468727) (not b!1468712) (not b!1468713) (not b!1468714) (not b!1468720))
(check-sat)
