; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125098 () Bool)

(assert start!125098)

(declare-fun b!1457673 () Bool)

(declare-fun res!988017 () Bool)

(declare-fun e!819967 () Bool)

(assert (=> b!1457673 (=> (not res!988017) (not e!819967))))

(declare-datatypes ((array!98524 0))(
  ( (array!98525 (arr!47551 (Array (_ BitVec 32) (_ BitVec 64))) (size!48103 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98524)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98524 (_ BitVec 32)) Bool)

(assert (=> b!1457673 (= res!988017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457674 () Bool)

(declare-fun res!988030 () Bool)

(declare-fun e!819974 () Bool)

(assert (=> b!1457674 (=> (not res!988030) (not e!819974))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11828 0))(
  ( (MissingZero!11828 (index!49704 (_ BitVec 32))) (Found!11828 (index!49705 (_ BitVec 32))) (Intermediate!11828 (undefined!12640 Bool) (index!49706 (_ BitVec 32)) (x!131320 (_ BitVec 32))) (Undefined!11828) (MissingVacant!11828 (index!49707 (_ BitVec 32))) )
))
(declare-fun lt!638605 () SeekEntryResult!11828)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11828)

(assert (=> b!1457674 (= res!988030 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638605))))

(declare-fun b!1457675 () Bool)

(declare-fun res!988026 () Bool)

(declare-fun e!819972 () Bool)

(assert (=> b!1457675 (=> (not res!988026) (not e!819972))))

(declare-fun e!819969 () Bool)

(assert (=> b!1457675 (= res!988026 e!819969)))

(declare-fun c!134344 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457675 (= c!134344 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1457676 () Bool)

(declare-fun e!819968 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457676 (= e!819968 (and (or (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47551 a!2862) intermediateBeforeIndex!19) (select (arr!47551 a!2862) j!93))) (let ((bdg!53377 (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47551 a!2862) index!646) bdg!53377) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53377 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457677 () Bool)

(declare-fun res!988021 () Bool)

(assert (=> b!1457677 (=> (not res!988021) (not e!819967))))

(declare-datatypes ((List!34130 0))(
  ( (Nil!34127) (Cons!34126 (h!35476 (_ BitVec 64)) (t!48816 List!34130)) )
))
(declare-fun arrayNoDuplicates!0 (array!98524 (_ BitVec 32) List!34130) Bool)

(assert (=> b!1457677 (= res!988021 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34127))))

(declare-fun b!1457678 () Bool)

(assert (=> b!1457678 (= e!819974 e!819972)))

(declare-fun res!988020 () Bool)

(assert (=> b!1457678 (=> (not res!988020) (not e!819972))))

(declare-fun lt!638603 () SeekEntryResult!11828)

(assert (=> b!1457678 (= res!988020 (= lt!638603 (Intermediate!11828 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638600 () (_ BitVec 64))

(declare-fun lt!638602 () array!98524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457678 (= lt!638603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638600 mask!2687) lt!638600 lt!638602 mask!2687))))

(assert (=> b!1457678 (= lt!638600 (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457679 () Bool)

(declare-fun res!988028 () Bool)

(assert (=> b!1457679 (=> (not res!988028) (not e!819967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457679 (= res!988028 (validKeyInArray!0 (select (arr!47551 a!2862) i!1006)))))

(declare-fun b!1457680 () Bool)

(declare-fun e!819966 () Bool)

(assert (=> b!1457680 (= e!819966 true)))

(declare-fun lt!638606 () Bool)

(declare-fun e!819970 () Bool)

(assert (=> b!1457680 (= lt!638606 e!819970)))

(declare-fun c!134343 () Bool)

(assert (=> b!1457680 (= c!134343 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457681 () Bool)

(declare-fun e!819973 () Bool)

(assert (=> b!1457681 (= e!819973 e!819974)))

(declare-fun res!988019 () Bool)

(assert (=> b!1457681 (=> (not res!988019) (not e!819974))))

(assert (=> b!1457681 (= res!988019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47551 a!2862) j!93) mask!2687) (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638605))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457681 (= lt!638605 (Intermediate!11828 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457683 () Bool)

(declare-fun e!819971 () Bool)

(assert (=> b!1457683 (= e!819971 e!819966)))

(declare-fun res!988023 () Bool)

(assert (=> b!1457683 (=> res!988023 e!819966)))

(declare-fun lt!638601 () (_ BitVec 32))

(assert (=> b!1457683 (= res!988023 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638601 #b00000000000000000000000000000000) (bvsge lt!638601 (size!48103 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457683 (= lt!638601 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638607 () SeekEntryResult!11828)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11828)

(assert (=> b!1457683 (= lt!638607 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638600 lt!638602 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98524 (_ BitVec 32)) SeekEntryResult!11828)

(assert (=> b!1457683 (= lt!638607 (seekEntryOrOpen!0 lt!638600 lt!638602 mask!2687))))

(declare-fun b!1457684 () Bool)

(assert (=> b!1457684 (= e!819969 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638600 lt!638602 mask!2687) (seekEntryOrOpen!0 lt!638600 lt!638602 mask!2687)))))

(declare-fun b!1457685 () Bool)

(assert (=> b!1457685 (= e!819969 (= lt!638603 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638600 lt!638602 mask!2687)))))

(declare-fun b!1457686 () Bool)

(declare-fun res!988015 () Bool)

(assert (=> b!1457686 (=> (not res!988015) (not e!819967))))

(assert (=> b!1457686 (= res!988015 (and (= (size!48103 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48103 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48103 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457687 () Bool)

(declare-fun res!988016 () Bool)

(assert (=> b!1457687 (=> (not res!988016) (not e!819968))))

(assert (=> b!1457687 (= res!988016 (= (seekEntryOrOpen!0 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) (Found!11828 j!93)))))

(declare-fun b!1457688 () Bool)

(declare-fun res!988014 () Bool)

(assert (=> b!1457688 (=> (not res!988014) (not e!819967))))

(assert (=> b!1457688 (= res!988014 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48103 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48103 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48103 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457689 () Bool)

(declare-fun res!988013 () Bool)

(assert (=> b!1457689 (=> (not res!988013) (not e!819972))))

(assert (=> b!1457689 (= res!988013 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457690 () Bool)

(declare-fun res!988022 () Bool)

(assert (=> b!1457690 (=> res!988022 e!819966)))

(assert (=> b!1457690 (= res!988022 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 (select (arr!47551 a!2862) j!93) a!2862 mask!2687) lt!638605)))))

(declare-fun b!1457691 () Bool)

(declare-fun res!988018 () Bool)

(assert (=> b!1457691 (=> (not res!988018) (not e!819967))))

(assert (=> b!1457691 (= res!988018 (validKeyInArray!0 (select (arr!47551 a!2862) j!93)))))

(declare-fun b!1457692 () Bool)

(assert (=> b!1457692 (= e!819970 (not (= lt!638603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 lt!638600 lt!638602 mask!2687))))))

(declare-fun b!1457693 () Bool)

(assert (=> b!1457693 (= e!819972 (not e!819971))))

(declare-fun res!988025 () Bool)

(assert (=> b!1457693 (=> res!988025 e!819971)))

(assert (=> b!1457693 (= res!988025 (or (and (= (select (arr!47551 a!2862) index!646) (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47551 a!2862) index!646) (select (arr!47551 a!2862) j!93))) (= (select (arr!47551 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457693 e!819968))

(declare-fun res!988024 () Bool)

(assert (=> b!1457693 (=> (not res!988024) (not e!819968))))

(assert (=> b!1457693 (= res!988024 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48993 0))(
  ( (Unit!48994) )
))
(declare-fun lt!638604 () Unit!48993)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48993)

(assert (=> b!1457693 (= lt!638604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457694 () Bool)

(assert (=> b!1457694 (= e!819970 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 intermediateAfterIndex!19 lt!638600 lt!638602 mask!2687) lt!638607)))))

(declare-fun b!1457682 () Bool)

(assert (=> b!1457682 (= e!819967 e!819973)))

(declare-fun res!988029 () Bool)

(assert (=> b!1457682 (=> (not res!988029) (not e!819973))))

(assert (=> b!1457682 (= res!988029 (= (select (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457682 (= lt!638602 (array!98525 (store (arr!47551 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48103 a!2862)))))

(declare-fun res!988027 () Bool)

(assert (=> start!125098 (=> (not res!988027) (not e!819967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125098 (= res!988027 (validMask!0 mask!2687))))

(assert (=> start!125098 e!819967))

(assert (=> start!125098 true))

(declare-fun array_inv!36784 (array!98524) Bool)

(assert (=> start!125098 (array_inv!36784 a!2862)))

(assert (= (and start!125098 res!988027) b!1457686))

(assert (= (and b!1457686 res!988015) b!1457679))

(assert (= (and b!1457679 res!988028) b!1457691))

(assert (= (and b!1457691 res!988018) b!1457673))

(assert (= (and b!1457673 res!988017) b!1457677))

(assert (= (and b!1457677 res!988021) b!1457688))

(assert (= (and b!1457688 res!988014) b!1457682))

(assert (= (and b!1457682 res!988029) b!1457681))

(assert (= (and b!1457681 res!988019) b!1457674))

(assert (= (and b!1457674 res!988030) b!1457678))

(assert (= (and b!1457678 res!988020) b!1457675))

(assert (= (and b!1457675 c!134344) b!1457685))

(assert (= (and b!1457675 (not c!134344)) b!1457684))

(assert (= (and b!1457675 res!988026) b!1457689))

(assert (= (and b!1457689 res!988013) b!1457693))

(assert (= (and b!1457693 res!988024) b!1457687))

(assert (= (and b!1457687 res!988016) b!1457676))

(assert (= (and b!1457693 (not res!988025)) b!1457683))

(assert (= (and b!1457683 (not res!988023)) b!1457690))

(assert (= (and b!1457690 (not res!988022)) b!1457680))

(assert (= (and b!1457680 c!134343) b!1457692))

(assert (= (and b!1457680 (not c!134343)) b!1457694))

(declare-fun m!1345119 () Bool)

(assert (=> b!1457673 m!1345119))

(declare-fun m!1345121 () Bool)

(assert (=> b!1457685 m!1345121))

(declare-fun m!1345123 () Bool)

(assert (=> b!1457677 m!1345123))

(declare-fun m!1345125 () Bool)

(assert (=> b!1457694 m!1345125))

(declare-fun m!1345127 () Bool)

(assert (=> b!1457682 m!1345127))

(declare-fun m!1345129 () Bool)

(assert (=> b!1457682 m!1345129))

(declare-fun m!1345131 () Bool)

(assert (=> b!1457691 m!1345131))

(assert (=> b!1457691 m!1345131))

(declare-fun m!1345133 () Bool)

(assert (=> b!1457691 m!1345133))

(declare-fun m!1345135 () Bool)

(assert (=> b!1457679 m!1345135))

(assert (=> b!1457679 m!1345135))

(declare-fun m!1345137 () Bool)

(assert (=> b!1457679 m!1345137))

(declare-fun m!1345139 () Bool)

(assert (=> start!125098 m!1345139))

(declare-fun m!1345141 () Bool)

(assert (=> start!125098 m!1345141))

(assert (=> b!1457690 m!1345131))

(assert (=> b!1457690 m!1345131))

(declare-fun m!1345143 () Bool)

(assert (=> b!1457690 m!1345143))

(assert (=> b!1457674 m!1345131))

(assert (=> b!1457674 m!1345131))

(declare-fun m!1345145 () Bool)

(assert (=> b!1457674 m!1345145))

(declare-fun m!1345147 () Bool)

(assert (=> b!1457678 m!1345147))

(assert (=> b!1457678 m!1345147))

(declare-fun m!1345149 () Bool)

(assert (=> b!1457678 m!1345149))

(assert (=> b!1457678 m!1345127))

(declare-fun m!1345151 () Bool)

(assert (=> b!1457678 m!1345151))

(declare-fun m!1345153 () Bool)

(assert (=> b!1457693 m!1345153))

(assert (=> b!1457693 m!1345127))

(declare-fun m!1345155 () Bool)

(assert (=> b!1457693 m!1345155))

(declare-fun m!1345157 () Bool)

(assert (=> b!1457693 m!1345157))

(declare-fun m!1345159 () Bool)

(assert (=> b!1457693 m!1345159))

(assert (=> b!1457693 m!1345131))

(assert (=> b!1457687 m!1345131))

(assert (=> b!1457687 m!1345131))

(declare-fun m!1345161 () Bool)

(assert (=> b!1457687 m!1345161))

(declare-fun m!1345163 () Bool)

(assert (=> b!1457692 m!1345163))

(declare-fun m!1345165 () Bool)

(assert (=> b!1457684 m!1345165))

(declare-fun m!1345167 () Bool)

(assert (=> b!1457684 m!1345167))

(declare-fun m!1345169 () Bool)

(assert (=> b!1457683 m!1345169))

(assert (=> b!1457683 m!1345165))

(assert (=> b!1457683 m!1345167))

(assert (=> b!1457681 m!1345131))

(assert (=> b!1457681 m!1345131))

(declare-fun m!1345171 () Bool)

(assert (=> b!1457681 m!1345171))

(assert (=> b!1457681 m!1345171))

(assert (=> b!1457681 m!1345131))

(declare-fun m!1345173 () Bool)

(assert (=> b!1457681 m!1345173))

(assert (=> b!1457676 m!1345127))

(declare-fun m!1345175 () Bool)

(assert (=> b!1457676 m!1345175))

(assert (=> b!1457676 m!1345155))

(assert (=> b!1457676 m!1345157))

(assert (=> b!1457676 m!1345131))

(check-sat (not b!1457679) (not b!1457691) (not start!125098) (not b!1457678) (not b!1457684) (not b!1457692) (not b!1457683) (not b!1457685) (not b!1457677) (not b!1457690) (not b!1457687) (not b!1457693) (not b!1457681) (not b!1457674) (not b!1457673) (not b!1457694))
(check-sat)
