; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125290 () Bool)

(assert start!125290)

(declare-fun b!1463838 () Bool)

(declare-fun res!993106 () Bool)

(declare-fun e!822684 () Bool)

(assert (=> b!1463838 (=> (not res!993106) (not e!822684))))

(declare-fun e!822677 () Bool)

(assert (=> b!1463838 (= res!993106 e!822677)))

(declare-fun c!134883 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463838 (= c!134883 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463839 () Bool)

(declare-fun res!993110 () Bool)

(declare-fun e!822675 () Bool)

(assert (=> b!1463839 (=> (not res!993110) (not e!822675))))

(declare-datatypes ((SeekEntryResult!11924 0))(
  ( (MissingZero!11924 (index!50088 (_ BitVec 32))) (Found!11924 (index!50089 (_ BitVec 32))) (Intermediate!11924 (undefined!12736 Bool) (index!50090 (_ BitVec 32)) (x!131672 (_ BitVec 32))) (Undefined!11924) (MissingVacant!11924 (index!50091 (_ BitVec 32))) )
))
(declare-fun lt!640724 () SeekEntryResult!11924)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98716 0))(
  ( (array!98717 (arr!47647 (Array (_ BitVec 32) (_ BitVec 64))) (size!48199 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98716)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11924)

(assert (=> b!1463839 (= res!993110 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640724))))

(declare-fun b!1463840 () Bool)

(declare-fun e!822682 () Bool)

(assert (=> b!1463840 (= e!822682 true)))

(declare-fun lt!640726 () Bool)

(declare-fun e!822678 () Bool)

(assert (=> b!1463840 (= lt!640726 e!822678)))

(declare-fun c!134884 () Bool)

(assert (=> b!1463840 (= c!134884 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463841 () Bool)

(declare-fun res!993113 () Bool)

(declare-fun e!822676 () Bool)

(assert (=> b!1463841 (=> (not res!993113) (not e!822676))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463841 (= res!993113 (and (= (size!48199 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48199 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48199 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463842 () Bool)

(assert (=> b!1463842 (= e!822675 e!822684)))

(declare-fun res!993099 () Bool)

(assert (=> b!1463842 (=> (not res!993099) (not e!822684))))

(declare-fun lt!640725 () SeekEntryResult!11924)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463842 (= res!993099 (= lt!640725 (Intermediate!11924 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640728 () array!98716)

(declare-fun lt!640723 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463842 (= lt!640725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640723 mask!2687) lt!640723 lt!640728 mask!2687))))

(assert (=> b!1463842 (= lt!640723 (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463843 () Bool)

(declare-fun lt!640727 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11924)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98716 (_ BitVec 32)) SeekEntryResult!11924)

(assert (=> b!1463843 (= e!822678 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640727 intermediateAfterIndex!19 lt!640723 lt!640728 mask!2687) (seekEntryOrOpen!0 lt!640723 lt!640728 mask!2687))))))

(declare-fun b!1463844 () Bool)

(declare-fun res!993102 () Bool)

(assert (=> b!1463844 (=> (not res!993102) (not e!822676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463844 (= res!993102 (validKeyInArray!0 (select (arr!47647 a!2862) i!1006)))))

(declare-fun b!1463845 () Bool)

(declare-fun e!822681 () Bool)

(assert (=> b!1463845 (= e!822681 e!822682)))

(declare-fun res!993112 () Bool)

(assert (=> b!1463845 (=> res!993112 e!822682)))

(assert (=> b!1463845 (= res!993112 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640727 #b00000000000000000000000000000000) (bvsge lt!640727 (size!48199 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463845 (= lt!640727 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463846 () Bool)

(assert (=> b!1463846 (= e!822678 (not (= lt!640725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640727 lt!640723 lt!640728 mask!2687))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822679 () Bool)

(declare-fun b!1463847 () Bool)

(assert (=> b!1463847 (= e!822679 (or (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) (select (arr!47647 a!2862) j!93))))))

(declare-fun b!1463848 () Bool)

(declare-fun res!993101 () Bool)

(assert (=> b!1463848 (=> res!993101 e!822682)))

(assert (=> b!1463848 (= res!993101 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640727 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640724)))))

(declare-fun b!1463849 () Bool)

(assert (=> b!1463849 (= e!822677 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640723 lt!640728 mask!2687) (seekEntryOrOpen!0 lt!640723 lt!640728 mask!2687)))))

(declare-fun b!1463850 () Bool)

(declare-fun e!822680 () Bool)

(assert (=> b!1463850 (= e!822680 e!822675)))

(declare-fun res!993115 () Bool)

(assert (=> b!1463850 (=> (not res!993115) (not e!822675))))

(assert (=> b!1463850 (= res!993115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47647 a!2862) j!93) mask!2687) (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640724))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463850 (= lt!640724 (Intermediate!11924 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!993105 () Bool)

(assert (=> start!125290 (=> (not res!993105) (not e!822676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125290 (= res!993105 (validMask!0 mask!2687))))

(assert (=> start!125290 e!822676))

(assert (=> start!125290 true))

(declare-fun array_inv!36880 (array!98716) Bool)

(assert (=> start!125290 (array_inv!36880 a!2862)))

(declare-fun b!1463851 () Bool)

(assert (=> b!1463851 (= e!822684 (not e!822681))))

(declare-fun res!993103 () Bool)

(assert (=> b!1463851 (=> res!993103 e!822681)))

(assert (=> b!1463851 (= res!993103 (or (and (= (select (arr!47647 a!2862) index!646) (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47647 a!2862) index!646) (select (arr!47647 a!2862) j!93))) (= (select (arr!47647 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463851 e!822679))

(declare-fun res!993108 () Bool)

(assert (=> b!1463851 (=> (not res!993108) (not e!822679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98716 (_ BitVec 32)) Bool)

(assert (=> b!1463851 (= res!993108 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49185 0))(
  ( (Unit!49186) )
))
(declare-fun lt!640722 () Unit!49185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49185)

(assert (=> b!1463851 (= lt!640722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463852 () Bool)

(declare-fun res!993098 () Bool)

(assert (=> b!1463852 (=> (not res!993098) (not e!822676))))

(assert (=> b!1463852 (= res!993098 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48199 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48199 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48199 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463853 () Bool)

(assert (=> b!1463853 (= e!822676 e!822680)))

(declare-fun res!993111 () Bool)

(assert (=> b!1463853 (=> (not res!993111) (not e!822680))))

(assert (=> b!1463853 (= res!993111 (= (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463853 (= lt!640728 (array!98717 (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48199 a!2862)))))

(declare-fun b!1463854 () Bool)

(declare-fun res!993107 () Bool)

(assert (=> b!1463854 (=> (not res!993107) (not e!822676))))

(assert (=> b!1463854 (= res!993107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463855 () Bool)

(declare-fun res!993100 () Bool)

(assert (=> b!1463855 (=> (not res!993100) (not e!822676))))

(declare-datatypes ((List!34226 0))(
  ( (Nil!34223) (Cons!34222 (h!35572 (_ BitVec 64)) (t!48912 List!34226)) )
))
(declare-fun arrayNoDuplicates!0 (array!98716 (_ BitVec 32) List!34226) Bool)

(assert (=> b!1463855 (= res!993100 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34223))))

(declare-fun b!1463856 () Bool)

(declare-fun res!993114 () Bool)

(assert (=> b!1463856 (=> (not res!993114) (not e!822676))))

(assert (=> b!1463856 (= res!993114 (validKeyInArray!0 (select (arr!47647 a!2862) j!93)))))

(declare-fun b!1463857 () Bool)

(assert (=> b!1463857 (= e!822677 (= lt!640725 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640723 lt!640728 mask!2687)))))

(declare-fun b!1463858 () Bool)

(declare-fun res!993104 () Bool)

(assert (=> b!1463858 (=> (not res!993104) (not e!822684))))

(assert (=> b!1463858 (= res!993104 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463859 () Bool)

(declare-fun res!993109 () Bool)

(assert (=> b!1463859 (=> (not res!993109) (not e!822679))))

(assert (=> b!1463859 (= res!993109 (= (seekEntryOrOpen!0 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) (Found!11924 j!93)))))

(assert (= (and start!125290 res!993105) b!1463841))

(assert (= (and b!1463841 res!993113) b!1463844))

(assert (= (and b!1463844 res!993102) b!1463856))

(assert (= (and b!1463856 res!993114) b!1463854))

(assert (= (and b!1463854 res!993107) b!1463855))

(assert (= (and b!1463855 res!993100) b!1463852))

(assert (= (and b!1463852 res!993098) b!1463853))

(assert (= (and b!1463853 res!993111) b!1463850))

(assert (= (and b!1463850 res!993115) b!1463839))

(assert (= (and b!1463839 res!993110) b!1463842))

(assert (= (and b!1463842 res!993099) b!1463838))

(assert (= (and b!1463838 c!134883) b!1463857))

(assert (= (and b!1463838 (not c!134883)) b!1463849))

(assert (= (and b!1463838 res!993106) b!1463858))

(assert (= (and b!1463858 res!993104) b!1463851))

(assert (= (and b!1463851 res!993108) b!1463859))

(assert (= (and b!1463859 res!993109) b!1463847))

(assert (= (and b!1463851 (not res!993103)) b!1463845))

(assert (= (and b!1463845 (not res!993112)) b!1463848))

(assert (= (and b!1463848 (not res!993101)) b!1463840))

(assert (= (and b!1463840 c!134884) b!1463846))

(assert (= (and b!1463840 (not c!134884)) b!1463843))

(declare-fun m!1350621 () Bool)

(assert (=> b!1463842 m!1350621))

(assert (=> b!1463842 m!1350621))

(declare-fun m!1350623 () Bool)

(assert (=> b!1463842 m!1350623))

(declare-fun m!1350625 () Bool)

(assert (=> b!1463842 m!1350625))

(declare-fun m!1350627 () Bool)

(assert (=> b!1463842 m!1350627))

(declare-fun m!1350629 () Bool)

(assert (=> b!1463845 m!1350629))

(declare-fun m!1350631 () Bool)

(assert (=> b!1463844 m!1350631))

(assert (=> b!1463844 m!1350631))

(declare-fun m!1350633 () Bool)

(assert (=> b!1463844 m!1350633))

(declare-fun m!1350635 () Bool)

(assert (=> b!1463857 m!1350635))

(declare-fun m!1350637 () Bool)

(assert (=> b!1463847 m!1350637))

(declare-fun m!1350639 () Bool)

(assert (=> b!1463847 m!1350639))

(assert (=> b!1463859 m!1350639))

(assert (=> b!1463859 m!1350639))

(declare-fun m!1350641 () Bool)

(assert (=> b!1463859 m!1350641))

(assert (=> b!1463839 m!1350639))

(assert (=> b!1463839 m!1350639))

(declare-fun m!1350643 () Bool)

(assert (=> b!1463839 m!1350643))

(assert (=> b!1463856 m!1350639))

(assert (=> b!1463856 m!1350639))

(declare-fun m!1350645 () Bool)

(assert (=> b!1463856 m!1350645))

(assert (=> b!1463853 m!1350625))

(declare-fun m!1350647 () Bool)

(assert (=> b!1463853 m!1350647))

(declare-fun m!1350649 () Bool)

(assert (=> b!1463855 m!1350649))

(declare-fun m!1350651 () Bool)

(assert (=> b!1463854 m!1350651))

(declare-fun m!1350653 () Bool)

(assert (=> b!1463849 m!1350653))

(declare-fun m!1350655 () Bool)

(assert (=> b!1463849 m!1350655))

(declare-fun m!1350657 () Bool)

(assert (=> b!1463843 m!1350657))

(assert (=> b!1463843 m!1350655))

(assert (=> b!1463848 m!1350639))

(assert (=> b!1463848 m!1350639))

(declare-fun m!1350659 () Bool)

(assert (=> b!1463848 m!1350659))

(assert (=> b!1463850 m!1350639))

(assert (=> b!1463850 m!1350639))

(declare-fun m!1350661 () Bool)

(assert (=> b!1463850 m!1350661))

(assert (=> b!1463850 m!1350661))

(assert (=> b!1463850 m!1350639))

(declare-fun m!1350663 () Bool)

(assert (=> b!1463850 m!1350663))

(declare-fun m!1350665 () Bool)

(assert (=> start!125290 m!1350665))

(declare-fun m!1350667 () Bool)

(assert (=> start!125290 m!1350667))

(declare-fun m!1350669 () Bool)

(assert (=> b!1463851 m!1350669))

(assert (=> b!1463851 m!1350625))

(declare-fun m!1350671 () Bool)

(assert (=> b!1463851 m!1350671))

(declare-fun m!1350673 () Bool)

(assert (=> b!1463851 m!1350673))

(declare-fun m!1350675 () Bool)

(assert (=> b!1463851 m!1350675))

(assert (=> b!1463851 m!1350639))

(declare-fun m!1350677 () Bool)

(assert (=> b!1463846 m!1350677))

(check-sat (not b!1463843) (not b!1463845) (not b!1463855) (not b!1463859) (not b!1463854) (not b!1463857) (not b!1463850) (not b!1463856) (not b!1463842) (not b!1463849) (not b!1463851) (not b!1463844) (not b!1463839) (not start!125290) (not b!1463848) (not b!1463846))
(check-sat)
