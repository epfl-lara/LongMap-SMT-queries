; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124374 () Bool)

(assert start!124374)

(declare-fun res!970676 () Bool)

(declare-fun e!811736 () Bool)

(assert (=> start!124374 (=> (not res!970676) (not e!811736))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124374 (= res!970676 (validMask!0 mask!2687))))

(assert (=> start!124374 e!811736))

(assert (=> start!124374 true))

(declare-datatypes ((array!97873 0))(
  ( (array!97874 (arr!47227 (Array (_ BitVec 32) (_ BitVec 64))) (size!47778 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97873)

(declare-fun array_inv!36508 (array!97873) Bool)

(assert (=> start!124374 (array_inv!36508 a!2862)))

(declare-fun b!1438613 () Bool)

(declare-fun e!811737 () Bool)

(assert (=> b!1438613 (= e!811736 e!811737)))

(declare-fun res!970673 () Bool)

(assert (=> b!1438613 (=> (not res!970673) (not e!811737))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11376 0))(
  ( (MissingZero!11376 (index!47896 (_ BitVec 32))) (Found!11376 (index!47897 (_ BitVec 32))) (Intermediate!11376 (undefined!12188 Bool) (index!47898 (_ BitVec 32)) (x!129801 (_ BitVec 32))) (Undefined!11376) (MissingVacant!11376 (index!47899 (_ BitVec 32))) )
))
(declare-fun lt!632737 () SeekEntryResult!11376)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97873 (_ BitVec 32)) SeekEntryResult!11376)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438613 (= res!970673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632737))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438613 (= lt!632737 (Intermediate!11376 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438614 () Bool)

(declare-fun res!970674 () Bool)

(assert (=> b!1438614 (=> (not res!970674) (not e!811736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438614 (= res!970674 (validKeyInArray!0 (select (arr!47227 a!2862) j!93)))))

(declare-fun b!1438615 () Bool)

(assert (=> b!1438615 (= e!811737 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1438616 () Bool)

(declare-fun res!970672 () Bool)

(assert (=> b!1438616 (=> (not res!970672) (not e!811736))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438616 (= res!970672 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47778 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47778 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47778 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47227 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438617 () Bool)

(declare-fun res!970677 () Bool)

(assert (=> b!1438617 (=> (not res!970677) (not e!811736))))

(declare-datatypes ((List!33715 0))(
  ( (Nil!33712) (Cons!33711 (h!35060 (_ BitVec 64)) (t!48401 List!33715)) )
))
(declare-fun arrayNoDuplicates!0 (array!97873 (_ BitVec 32) List!33715) Bool)

(assert (=> b!1438617 (= res!970677 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33712))))

(declare-fun b!1438618 () Bool)

(declare-fun res!970679 () Bool)

(assert (=> b!1438618 (=> (not res!970679) (not e!811736))))

(assert (=> b!1438618 (= res!970679 (and (= (size!47778 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47778 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47778 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438619 () Bool)

(declare-fun res!970671 () Bool)

(assert (=> b!1438619 (=> (not res!970671) (not e!811737))))

(assert (=> b!1438619 (= res!970671 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632737))))

(declare-fun b!1438620 () Bool)

(declare-fun res!970675 () Bool)

(assert (=> b!1438620 (=> (not res!970675) (not e!811736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97873 (_ BitVec 32)) Bool)

(assert (=> b!1438620 (= res!970675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438621 () Bool)

(declare-fun res!970678 () Bool)

(assert (=> b!1438621 (=> (not res!970678) (not e!811736))))

(assert (=> b!1438621 (= res!970678 (validKeyInArray!0 (select (arr!47227 a!2862) i!1006)))))

(assert (= (and start!124374 res!970676) b!1438618))

(assert (= (and b!1438618 res!970679) b!1438621))

(assert (= (and b!1438621 res!970678) b!1438614))

(assert (= (and b!1438614 res!970674) b!1438620))

(assert (= (and b!1438620 res!970675) b!1438617))

(assert (= (and b!1438617 res!970677) b!1438616))

(assert (= (and b!1438616 res!970672) b!1438613))

(assert (= (and b!1438613 res!970673) b!1438619))

(assert (= (and b!1438619 res!970671) b!1438615))

(declare-fun m!1328047 () Bool)

(assert (=> b!1438621 m!1328047))

(assert (=> b!1438621 m!1328047))

(declare-fun m!1328049 () Bool)

(assert (=> b!1438621 m!1328049))

(declare-fun m!1328051 () Bool)

(assert (=> b!1438617 m!1328051))

(declare-fun m!1328053 () Bool)

(assert (=> start!124374 m!1328053))

(declare-fun m!1328055 () Bool)

(assert (=> start!124374 m!1328055))

(declare-fun m!1328057 () Bool)

(assert (=> b!1438616 m!1328057))

(declare-fun m!1328059 () Bool)

(assert (=> b!1438616 m!1328059))

(declare-fun m!1328061 () Bool)

(assert (=> b!1438620 m!1328061))

(declare-fun m!1328063 () Bool)

(assert (=> b!1438619 m!1328063))

(assert (=> b!1438619 m!1328063))

(declare-fun m!1328065 () Bool)

(assert (=> b!1438619 m!1328065))

(assert (=> b!1438613 m!1328063))

(assert (=> b!1438613 m!1328063))

(declare-fun m!1328067 () Bool)

(assert (=> b!1438613 m!1328067))

(assert (=> b!1438613 m!1328067))

(assert (=> b!1438613 m!1328063))

(declare-fun m!1328069 () Bool)

(assert (=> b!1438613 m!1328069))

(assert (=> b!1438614 m!1328063))

(assert (=> b!1438614 m!1328063))

(declare-fun m!1328071 () Bool)

(assert (=> b!1438614 m!1328071))

(check-sat (not b!1438620) (not b!1438617) (not start!124374) (not b!1438619) (not b!1438613) (not b!1438614) (not b!1438621))
(check-sat)
(get-model)

(declare-fun d!155019 () Bool)

(assert (=> d!155019 (= (validKeyInArray!0 (select (arr!47227 a!2862) j!93)) (and (not (= (select (arr!47227 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47227 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438614 d!155019))

(declare-fun d!155021 () Bool)

(assert (=> d!155021 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124374 d!155021))

(declare-fun d!155023 () Bool)

(assert (=> d!155023 (= (array_inv!36508 a!2862) (bvsge (size!47778 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124374 d!155023))

(declare-fun b!1438694 () Bool)

(declare-fun e!811769 () Bool)

(declare-fun e!811767 () Bool)

(assert (=> b!1438694 (= e!811769 e!811767)))

(declare-fun res!970740 () Bool)

(declare-fun lt!632749 () SeekEntryResult!11376)

(get-info :version)

(assert (=> b!1438694 (= res!970740 (and ((_ is Intermediate!11376) lt!632749) (not (undefined!12188 lt!632749)) (bvslt (x!129801 lt!632749) #b01111111111111111111111111111110) (bvsge (x!129801 lt!632749) #b00000000000000000000000000000000) (bvsge (x!129801 lt!632749) x!665)))))

(assert (=> b!1438694 (=> (not res!970740) (not e!811767))))

(declare-fun d!155025 () Bool)

(assert (=> d!155025 e!811769))

(declare-fun c!133491 () Bool)

(assert (=> d!155025 (= c!133491 (and ((_ is Intermediate!11376) lt!632749) (undefined!12188 lt!632749)))))

(declare-fun e!811766 () SeekEntryResult!11376)

(assert (=> d!155025 (= lt!632749 e!811766)))

(declare-fun c!133492 () Bool)

(assert (=> d!155025 (= c!133492 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632748 () (_ BitVec 64))

(assert (=> d!155025 (= lt!632748 (select (arr!47227 a!2862) index!646))))

(assert (=> d!155025 (validMask!0 mask!2687)))

(assert (=> d!155025 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632749)))

(declare-fun b!1438695 () Bool)

(declare-fun e!811768 () SeekEntryResult!11376)

(assert (=> b!1438695 (= e!811766 e!811768)))

(declare-fun c!133490 () Bool)

(assert (=> b!1438695 (= c!133490 (or (= lt!632748 (select (arr!47227 a!2862) j!93)) (= (bvadd lt!632748 lt!632748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438696 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438696 (= e!811768 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438697 () Bool)

(assert (=> b!1438697 (and (bvsge (index!47898 lt!632749) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632749) (size!47778 a!2862)))))

(declare-fun res!970741 () Bool)

(assert (=> b!1438697 (= res!970741 (= (select (arr!47227 a!2862) (index!47898 lt!632749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811770 () Bool)

(assert (=> b!1438697 (=> res!970741 e!811770)))

(declare-fun b!1438698 () Bool)

(assert (=> b!1438698 (and (bvsge (index!47898 lt!632749) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632749) (size!47778 a!2862)))))

(declare-fun res!970742 () Bool)

(assert (=> b!1438698 (= res!970742 (= (select (arr!47227 a!2862) (index!47898 lt!632749)) (select (arr!47227 a!2862) j!93)))))

(assert (=> b!1438698 (=> res!970742 e!811770)))

(assert (=> b!1438698 (= e!811767 e!811770)))

(declare-fun b!1438699 () Bool)

(assert (=> b!1438699 (= e!811769 (bvsge (x!129801 lt!632749) #b01111111111111111111111111111110))))

(declare-fun b!1438700 () Bool)

(assert (=> b!1438700 (= e!811768 (Intermediate!11376 false index!646 x!665))))

(declare-fun b!1438701 () Bool)

(assert (=> b!1438701 (and (bvsge (index!47898 lt!632749) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632749) (size!47778 a!2862)))))

(assert (=> b!1438701 (= e!811770 (= (select (arr!47227 a!2862) (index!47898 lt!632749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438702 () Bool)

(assert (=> b!1438702 (= e!811766 (Intermediate!11376 true index!646 x!665))))

(assert (= (and d!155025 c!133492) b!1438702))

(assert (= (and d!155025 (not c!133492)) b!1438695))

(assert (= (and b!1438695 c!133490) b!1438700))

(assert (= (and b!1438695 (not c!133490)) b!1438696))

(assert (= (and d!155025 c!133491) b!1438699))

(assert (= (and d!155025 (not c!133491)) b!1438694))

(assert (= (and b!1438694 res!970740) b!1438698))

(assert (= (and b!1438698 (not res!970742)) b!1438697))

(assert (= (and b!1438697 (not res!970741)) b!1438701))

(declare-fun m!1328125 () Bool)

(assert (=> b!1438701 m!1328125))

(declare-fun m!1328127 () Bool)

(assert (=> d!155025 m!1328127))

(assert (=> d!155025 m!1328053))

(declare-fun m!1328129 () Bool)

(assert (=> b!1438696 m!1328129))

(assert (=> b!1438696 m!1328129))

(assert (=> b!1438696 m!1328063))

(declare-fun m!1328131 () Bool)

(assert (=> b!1438696 m!1328131))

(assert (=> b!1438697 m!1328125))

(assert (=> b!1438698 m!1328125))

(assert (=> b!1438619 d!155025))

(declare-fun d!155031 () Bool)

(assert (=> d!155031 (= (validKeyInArray!0 (select (arr!47227 a!2862) i!1006)) (and (not (= (select (arr!47227 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47227 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438621 d!155031))

(declare-fun b!1438737 () Bool)

(declare-fun e!811795 () Bool)

(declare-fun call!67700 () Bool)

(assert (=> b!1438737 (= e!811795 call!67700)))

(declare-fun b!1438738 () Bool)

(declare-fun e!811793 () Bool)

(assert (=> b!1438738 (= e!811793 call!67700)))

(declare-fun b!1438739 () Bool)

(declare-fun e!811794 () Bool)

(assert (=> b!1438739 (= e!811794 e!811793)))

(declare-fun c!133503 () Bool)

(assert (=> b!1438739 (= c!133503 (validKeyInArray!0 (select (arr!47227 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155033 () Bool)

(declare-fun res!970758 () Bool)

(assert (=> d!155033 (=> res!970758 e!811794)))

(assert (=> d!155033 (= res!970758 (bvsge #b00000000000000000000000000000000 (size!47778 a!2862)))))

(assert (=> d!155033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811794)))

(declare-fun b!1438740 () Bool)

(assert (=> b!1438740 (= e!811793 e!811795)))

(declare-fun lt!632768 () (_ BitVec 64))

(assert (=> b!1438740 (= lt!632768 (select (arr!47227 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48489 0))(
  ( (Unit!48490) )
))
(declare-fun lt!632766 () Unit!48489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97873 (_ BitVec 64) (_ BitVec 32)) Unit!48489)

(assert (=> b!1438740 (= lt!632766 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632768 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438740 (arrayContainsKey!0 a!2862 lt!632768 #b00000000000000000000000000000000)))

(declare-fun lt!632767 () Unit!48489)

(assert (=> b!1438740 (= lt!632767 lt!632766)))

(declare-fun res!970757 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97873 (_ BitVec 32)) SeekEntryResult!11376)

(assert (=> b!1438740 (= res!970757 (= (seekEntryOrOpen!0 (select (arr!47227 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11376 #b00000000000000000000000000000000)))))

(assert (=> b!1438740 (=> (not res!970757) (not e!811795))))

(declare-fun bm!67697 () Bool)

(assert (=> bm!67697 (= call!67700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155033 (not res!970758)) b!1438739))

(assert (= (and b!1438739 c!133503) b!1438740))

(assert (= (and b!1438739 (not c!133503)) b!1438738))

(assert (= (and b!1438740 res!970757) b!1438737))

(assert (= (or b!1438737 b!1438738) bm!67697))

(declare-fun m!1328133 () Bool)

(assert (=> b!1438739 m!1328133))

(assert (=> b!1438739 m!1328133))

(declare-fun m!1328135 () Bool)

(assert (=> b!1438739 m!1328135))

(assert (=> b!1438740 m!1328133))

(declare-fun m!1328137 () Bool)

(assert (=> b!1438740 m!1328137))

(declare-fun m!1328139 () Bool)

(assert (=> b!1438740 m!1328139))

(assert (=> b!1438740 m!1328133))

(declare-fun m!1328141 () Bool)

(assert (=> b!1438740 m!1328141))

(declare-fun m!1328143 () Bool)

(assert (=> bm!67697 m!1328143))

(assert (=> b!1438620 d!155033))

(declare-fun b!1438773 () Bool)

(declare-fun e!811817 () Bool)

(declare-fun e!811820 () Bool)

(assert (=> b!1438773 (= e!811817 e!811820)))

(declare-fun c!133513 () Bool)

(assert (=> b!1438773 (= c!133513 (validKeyInArray!0 (select (arr!47227 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438774 () Bool)

(declare-fun call!67704 () Bool)

(assert (=> b!1438774 (= e!811820 call!67704)))

(declare-fun bm!67701 () Bool)

(assert (=> bm!67701 (= call!67704 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133513 (Cons!33711 (select (arr!47227 a!2862) #b00000000000000000000000000000000) Nil!33712) Nil!33712)))))

(declare-fun b!1438776 () Bool)

(assert (=> b!1438776 (= e!811820 call!67704)))

(declare-fun b!1438777 () Bool)

(declare-fun e!811819 () Bool)

(declare-fun contains!9931 (List!33715 (_ BitVec 64)) Bool)

(assert (=> b!1438777 (= e!811819 (contains!9931 Nil!33712 (select (arr!47227 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155035 () Bool)

(declare-fun res!970773 () Bool)

(declare-fun e!811818 () Bool)

(assert (=> d!155035 (=> res!970773 e!811818)))

(assert (=> d!155035 (= res!970773 (bvsge #b00000000000000000000000000000000 (size!47778 a!2862)))))

(assert (=> d!155035 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33712) e!811818)))

(declare-fun b!1438775 () Bool)

(assert (=> b!1438775 (= e!811818 e!811817)))

(declare-fun res!970774 () Bool)

(assert (=> b!1438775 (=> (not res!970774) (not e!811817))))

(assert (=> b!1438775 (= res!970774 (not e!811819))))

(declare-fun res!970775 () Bool)

(assert (=> b!1438775 (=> (not res!970775) (not e!811819))))

(assert (=> b!1438775 (= res!970775 (validKeyInArray!0 (select (arr!47227 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155035 (not res!970773)) b!1438775))

(assert (= (and b!1438775 res!970775) b!1438777))

(assert (= (and b!1438775 res!970774) b!1438773))

(assert (= (and b!1438773 c!133513) b!1438774))

(assert (= (and b!1438773 (not c!133513)) b!1438776))

(assert (= (or b!1438774 b!1438776) bm!67701))

(assert (=> b!1438773 m!1328133))

(assert (=> b!1438773 m!1328133))

(assert (=> b!1438773 m!1328135))

(assert (=> bm!67701 m!1328133))

(declare-fun m!1328173 () Bool)

(assert (=> bm!67701 m!1328173))

(assert (=> b!1438777 m!1328133))

(assert (=> b!1438777 m!1328133))

(declare-fun m!1328175 () Bool)

(assert (=> b!1438777 m!1328175))

(assert (=> b!1438775 m!1328133))

(assert (=> b!1438775 m!1328133))

(assert (=> b!1438775 m!1328135))

(assert (=> b!1438617 d!155035))

(declare-fun b!1438778 () Bool)

(declare-fun e!811824 () Bool)

(declare-fun e!811822 () Bool)

(assert (=> b!1438778 (= e!811824 e!811822)))

(declare-fun res!970777 () Bool)

(declare-fun lt!632777 () SeekEntryResult!11376)

(assert (=> b!1438778 (= res!970777 (and ((_ is Intermediate!11376) lt!632777) (not (undefined!12188 lt!632777)) (bvslt (x!129801 lt!632777) #b01111111111111111111111111111110) (bvsge (x!129801 lt!632777) #b00000000000000000000000000000000) (bvsge (x!129801 lt!632777) #b00000000000000000000000000000000)))))

(assert (=> b!1438778 (=> (not res!970777) (not e!811822))))

(declare-fun d!155051 () Bool)

(assert (=> d!155051 e!811824))

(declare-fun c!133515 () Bool)

(assert (=> d!155051 (= c!133515 (and ((_ is Intermediate!11376) lt!632777) (undefined!12188 lt!632777)))))

(declare-fun e!811821 () SeekEntryResult!11376)

(assert (=> d!155051 (= lt!632777 e!811821)))

(declare-fun c!133516 () Bool)

(assert (=> d!155051 (= c!133516 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632776 () (_ BitVec 64))

(assert (=> d!155051 (= lt!632776 (select (arr!47227 a!2862) (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687)))))

(assert (=> d!155051 (validMask!0 mask!2687)))

(assert (=> d!155051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687) lt!632777)))

(declare-fun b!1438779 () Bool)

(declare-fun e!811823 () SeekEntryResult!11376)

(assert (=> b!1438779 (= e!811821 e!811823)))

(declare-fun c!133514 () Bool)

(assert (=> b!1438779 (= c!133514 (or (= lt!632776 (select (arr!47227 a!2862) j!93)) (= (bvadd lt!632776 lt!632776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438780 () Bool)

(assert (=> b!1438780 (= e!811823 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47227 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438781 () Bool)

(assert (=> b!1438781 (and (bvsge (index!47898 lt!632777) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632777) (size!47778 a!2862)))))

(declare-fun res!970778 () Bool)

(assert (=> b!1438781 (= res!970778 (= (select (arr!47227 a!2862) (index!47898 lt!632777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811825 () Bool)

(assert (=> b!1438781 (=> res!970778 e!811825)))

(declare-fun b!1438782 () Bool)

(assert (=> b!1438782 (and (bvsge (index!47898 lt!632777) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632777) (size!47778 a!2862)))))

(declare-fun res!970779 () Bool)

(assert (=> b!1438782 (= res!970779 (= (select (arr!47227 a!2862) (index!47898 lt!632777)) (select (arr!47227 a!2862) j!93)))))

(assert (=> b!1438782 (=> res!970779 e!811825)))

(assert (=> b!1438782 (= e!811822 e!811825)))

(declare-fun b!1438783 () Bool)

(assert (=> b!1438783 (= e!811824 (bvsge (x!129801 lt!632777) #b01111111111111111111111111111110))))

(declare-fun b!1438784 () Bool)

(assert (=> b!1438784 (= e!811823 (Intermediate!11376 false (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438785 () Bool)

(assert (=> b!1438785 (and (bvsge (index!47898 lt!632777) #b00000000000000000000000000000000) (bvslt (index!47898 lt!632777) (size!47778 a!2862)))))

(assert (=> b!1438785 (= e!811825 (= (select (arr!47227 a!2862) (index!47898 lt!632777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438786 () Bool)

(assert (=> b!1438786 (= e!811821 (Intermediate!11376 true (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155051 c!133516) b!1438786))

(assert (= (and d!155051 (not c!133516)) b!1438779))

(assert (= (and b!1438779 c!133514) b!1438784))

(assert (= (and b!1438779 (not c!133514)) b!1438780))

(assert (= (and d!155051 c!133515) b!1438783))

(assert (= (and d!155051 (not c!133515)) b!1438778))

(assert (= (and b!1438778 res!970777) b!1438782))

(assert (= (and b!1438782 (not res!970779)) b!1438781))

(assert (= (and b!1438781 (not res!970778)) b!1438785))

(declare-fun m!1328177 () Bool)

(assert (=> b!1438785 m!1328177))

(assert (=> d!155051 m!1328067))

(declare-fun m!1328179 () Bool)

(assert (=> d!155051 m!1328179))

(assert (=> d!155051 m!1328053))

(assert (=> b!1438780 m!1328067))

(declare-fun m!1328181 () Bool)

(assert (=> b!1438780 m!1328181))

(assert (=> b!1438780 m!1328181))

(assert (=> b!1438780 m!1328063))

(declare-fun m!1328183 () Bool)

(assert (=> b!1438780 m!1328183))

(assert (=> b!1438781 m!1328177))

(assert (=> b!1438782 m!1328177))

(assert (=> b!1438613 d!155051))

(declare-fun d!155053 () Bool)

(declare-fun lt!632789 () (_ BitVec 32))

(declare-fun lt!632788 () (_ BitVec 32))

(assert (=> d!155053 (= lt!632789 (bvmul (bvxor lt!632788 (bvlshr lt!632788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155053 (= lt!632788 ((_ extract 31 0) (bvand (bvxor (select (arr!47227 a!2862) j!93) (bvlshr (select (arr!47227 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155053 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970780 (let ((h!35064 ((_ extract 31 0) (bvand (bvxor (select (arr!47227 a!2862) j!93) (bvlshr (select (arr!47227 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129807 (bvmul (bvxor h!35064 (bvlshr h!35064 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129807 (bvlshr x!129807 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970780 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970780 #b00000000000000000000000000000000))))))

(assert (=> d!155053 (= (toIndex!0 (select (arr!47227 a!2862) j!93) mask!2687) (bvand (bvxor lt!632789 (bvlshr lt!632789 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438613 d!155053))

(check-sat (not b!1438775) (not d!155025) (not b!1438780) (not b!1438696) (not b!1438739) (not b!1438777) (not b!1438773) (not d!155051) (not bm!67697) (not bm!67701) (not b!1438740))
(check-sat)
