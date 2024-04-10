; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126138 () Bool)

(assert start!126138)

(declare-fun b!1476706 () Bool)

(declare-fun e!828477 () Bool)

(declare-fun e!828484 () Bool)

(assert (=> b!1476706 (= e!828477 e!828484)))

(declare-fun res!1002916 () Bool)

(assert (=> b!1476706 (=> res!1002916 e!828484)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99244 0))(
  ( (array!99245 (arr!47901 (Array (_ BitVec 32) (_ BitVec 64))) (size!48451 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99244)

(assert (=> b!1476706 (= res!1002916 (or (and (= (select (arr!47901 a!2862) index!646) (select (store (arr!47901 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47901 a!2862) index!646) (select (arr!47901 a!2862) j!93))) (not (= (select (arr!47901 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476707 () Bool)

(declare-fun res!1002928 () Bool)

(declare-fun e!828478 () Bool)

(assert (=> b!1476707 (=> (not res!1002928) (not e!828478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476707 (= res!1002928 (validKeyInArray!0 (select (arr!47901 a!2862) j!93)))))

(declare-fun b!1476708 () Bool)

(declare-fun res!1002920 () Bool)

(assert (=> b!1476708 (=> (not res!1002920) (not e!828478))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476708 (= res!1002920 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48451 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48451 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48451 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476709 () Bool)

(declare-fun e!828482 () Bool)

(assert (=> b!1476709 (= e!828484 e!828482)))

(declare-fun res!1002927 () Bool)

(assert (=> b!1476709 (=> (not res!1002927) (not e!828482))))

(declare-datatypes ((SeekEntryResult!12141 0))(
  ( (MissingZero!12141 (index!50956 (_ BitVec 32))) (Found!12141 (index!50957 (_ BitVec 32))) (Intermediate!12141 (undefined!12953 Bool) (index!50958 (_ BitVec 32)) (x!132556 (_ BitVec 32))) (Undefined!12141) (MissingVacant!12141 (index!50959 (_ BitVec 32))) )
))
(declare-fun lt!645107 () SeekEntryResult!12141)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12141)

(assert (=> b!1476709 (= res!1002927 (= lt!645107 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47901 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476710 () Bool)

(declare-fun e!828479 () Bool)

(declare-fun e!828485 () Bool)

(assert (=> b!1476710 (= e!828479 e!828485)))

(declare-fun res!1002915 () Bool)

(assert (=> b!1476710 (=> (not res!1002915) (not e!828485))))

(declare-fun lt!645103 () SeekEntryResult!12141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476710 (= res!1002915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47901 a!2862) j!93) mask!2687) (select (arr!47901 a!2862) j!93) a!2862 mask!2687) lt!645103))))

(assert (=> b!1476710 (= lt!645103 (Intermediate!12141 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476712 () Bool)

(declare-fun res!1002917 () Bool)

(assert (=> b!1476712 (=> (not res!1002917) (not e!828478))))

(assert (=> b!1476712 (= res!1002917 (and (= (size!48451 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48451 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48451 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!645108 () SeekEntryResult!12141)

(declare-fun b!1476713 () Bool)

(declare-fun lt!645105 () (_ BitVec 64))

(declare-fun lt!645104 () array!99244)

(declare-fun e!828483 () Bool)

(assert (=> b!1476713 (= e!828483 (= lt!645108 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645105 lt!645104 mask!2687)))))

(declare-fun b!1476714 () Bool)

(declare-fun res!1002923 () Bool)

(declare-fun e!828480 () Bool)

(assert (=> b!1476714 (=> (not res!1002923) (not e!828480))))

(assert (=> b!1476714 (= res!1002923 e!828483)))

(declare-fun c!136416 () Bool)

(assert (=> b!1476714 (= c!136416 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476715 () Bool)

(assert (=> b!1476715 (= e!828482 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476716 () Bool)

(declare-fun res!1002919 () Bool)

(assert (=> b!1476716 (=> (not res!1002919) (not e!828478))))

(declare-datatypes ((List!34402 0))(
  ( (Nil!34399) (Cons!34398 (h!35766 (_ BitVec 64)) (t!49096 List!34402)) )
))
(declare-fun arrayNoDuplicates!0 (array!99244 (_ BitVec 32) List!34402) Bool)

(assert (=> b!1476716 (= res!1002919 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34399))))

(declare-fun b!1476717 () Bool)

(assert (=> b!1476717 (= e!828478 e!828479)))

(declare-fun res!1002922 () Bool)

(assert (=> b!1476717 (=> (not res!1002922) (not e!828479))))

(assert (=> b!1476717 (= res!1002922 (= (select (store (arr!47901 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476717 (= lt!645104 (array!99245 (store (arr!47901 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48451 a!2862)))))

(declare-fun b!1476718 () Bool)

(declare-fun res!1002913 () Bool)

(assert (=> b!1476718 (=> (not res!1002913) (not e!828478))))

(assert (=> b!1476718 (= res!1002913 (validKeyInArray!0 (select (arr!47901 a!2862) i!1006)))))

(declare-fun b!1476719 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99244 (_ BitVec 32)) SeekEntryResult!12141)

(assert (=> b!1476719 (= e!828483 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645105 lt!645104 mask!2687) (seekEntryOrOpen!0 lt!645105 lt!645104 mask!2687)))))

(declare-fun b!1476720 () Bool)

(assert (=> b!1476720 (= e!828485 e!828480)))

(declare-fun res!1002926 () Bool)

(assert (=> b!1476720 (=> (not res!1002926) (not e!828480))))

(assert (=> b!1476720 (= res!1002926 (= lt!645108 (Intermediate!12141 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476720 (= lt!645108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645105 mask!2687) lt!645105 lt!645104 mask!2687))))

(assert (=> b!1476720 (= lt!645105 (select (store (arr!47901 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476721 () Bool)

(declare-fun res!1002924 () Bool)

(assert (=> b!1476721 (=> (not res!1002924) (not e!828480))))

(assert (=> b!1476721 (= res!1002924 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476722 () Bool)

(declare-fun res!1002925 () Bool)

(assert (=> b!1476722 (=> (not res!1002925) (not e!828485))))

(assert (=> b!1476722 (= res!1002925 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47901 a!2862) j!93) a!2862 mask!2687) lt!645103))))

(declare-fun b!1476723 () Bool)

(declare-fun res!1002918 () Bool)

(assert (=> b!1476723 (=> (not res!1002918) (not e!828478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99244 (_ BitVec 32)) Bool)

(assert (=> b!1476723 (= res!1002918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476711 () Bool)

(assert (=> b!1476711 (= e!828480 (not true))))

(assert (=> b!1476711 e!828477))

(declare-fun res!1002914 () Bool)

(assert (=> b!1476711 (=> (not res!1002914) (not e!828477))))

(assert (=> b!1476711 (= res!1002914 (and (= lt!645107 (Found!12141 j!93)) (or (= (select (arr!47901 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47901 a!2862) intermediateBeforeIndex!19) (select (arr!47901 a!2862) j!93)))))))

(assert (=> b!1476711 (= lt!645107 (seekEntryOrOpen!0 (select (arr!47901 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476711 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49622 0))(
  ( (Unit!49623) )
))
(declare-fun lt!645106 () Unit!49622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49622)

(assert (=> b!1476711 (= lt!645106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1002921 () Bool)

(assert (=> start!126138 (=> (not res!1002921) (not e!828478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126138 (= res!1002921 (validMask!0 mask!2687))))

(assert (=> start!126138 e!828478))

(assert (=> start!126138 true))

(declare-fun array_inv!36929 (array!99244) Bool)

(assert (=> start!126138 (array_inv!36929 a!2862)))

(assert (= (and start!126138 res!1002921) b!1476712))

(assert (= (and b!1476712 res!1002917) b!1476718))

(assert (= (and b!1476718 res!1002913) b!1476707))

(assert (= (and b!1476707 res!1002928) b!1476723))

(assert (= (and b!1476723 res!1002918) b!1476716))

(assert (= (and b!1476716 res!1002919) b!1476708))

(assert (= (and b!1476708 res!1002920) b!1476717))

(assert (= (and b!1476717 res!1002922) b!1476710))

(assert (= (and b!1476710 res!1002915) b!1476722))

(assert (= (and b!1476722 res!1002925) b!1476720))

(assert (= (and b!1476720 res!1002926) b!1476714))

(assert (= (and b!1476714 c!136416) b!1476713))

(assert (= (and b!1476714 (not c!136416)) b!1476719))

(assert (= (and b!1476714 res!1002923) b!1476721))

(assert (= (and b!1476721 res!1002924) b!1476711))

(assert (= (and b!1476711 res!1002914) b!1476706))

(assert (= (and b!1476706 (not res!1002916)) b!1476709))

(assert (= (and b!1476709 res!1002927) b!1476715))

(declare-fun m!1362683 () Bool)

(assert (=> b!1476723 m!1362683))

(declare-fun m!1362685 () Bool)

(assert (=> b!1476711 m!1362685))

(declare-fun m!1362687 () Bool)

(assert (=> b!1476711 m!1362687))

(declare-fun m!1362689 () Bool)

(assert (=> b!1476711 m!1362689))

(declare-fun m!1362691 () Bool)

(assert (=> b!1476711 m!1362691))

(declare-fun m!1362693 () Bool)

(assert (=> b!1476711 m!1362693))

(assert (=> b!1476711 m!1362689))

(declare-fun m!1362695 () Bool)

(assert (=> b!1476716 m!1362695))

(declare-fun m!1362697 () Bool)

(assert (=> b!1476718 m!1362697))

(assert (=> b!1476718 m!1362697))

(declare-fun m!1362699 () Bool)

(assert (=> b!1476718 m!1362699))

(declare-fun m!1362701 () Bool)

(assert (=> b!1476719 m!1362701))

(declare-fun m!1362703 () Bool)

(assert (=> b!1476719 m!1362703))

(declare-fun m!1362705 () Bool)

(assert (=> b!1476713 m!1362705))

(assert (=> b!1476709 m!1362689))

(assert (=> b!1476709 m!1362689))

(declare-fun m!1362707 () Bool)

(assert (=> b!1476709 m!1362707))

(declare-fun m!1362709 () Bool)

(assert (=> b!1476706 m!1362709))

(declare-fun m!1362711 () Bool)

(assert (=> b!1476706 m!1362711))

(declare-fun m!1362713 () Bool)

(assert (=> b!1476706 m!1362713))

(assert (=> b!1476706 m!1362689))

(assert (=> b!1476710 m!1362689))

(assert (=> b!1476710 m!1362689))

(declare-fun m!1362715 () Bool)

(assert (=> b!1476710 m!1362715))

(assert (=> b!1476710 m!1362715))

(assert (=> b!1476710 m!1362689))

(declare-fun m!1362717 () Bool)

(assert (=> b!1476710 m!1362717))

(assert (=> b!1476722 m!1362689))

(assert (=> b!1476722 m!1362689))

(declare-fun m!1362719 () Bool)

(assert (=> b!1476722 m!1362719))

(assert (=> b!1476707 m!1362689))

(assert (=> b!1476707 m!1362689))

(declare-fun m!1362721 () Bool)

(assert (=> b!1476707 m!1362721))

(declare-fun m!1362723 () Bool)

(assert (=> start!126138 m!1362723))

(declare-fun m!1362725 () Bool)

(assert (=> start!126138 m!1362725))

(declare-fun m!1362727 () Bool)

(assert (=> b!1476720 m!1362727))

(assert (=> b!1476720 m!1362727))

(declare-fun m!1362729 () Bool)

(assert (=> b!1476720 m!1362729))

(assert (=> b!1476720 m!1362711))

(declare-fun m!1362731 () Bool)

(assert (=> b!1476720 m!1362731))

(assert (=> b!1476717 m!1362711))

(declare-fun m!1362733 () Bool)

(assert (=> b!1476717 m!1362733))

(check-sat (not b!1476711) (not start!126138) (not b!1476719) (not b!1476713) (not b!1476709) (not b!1476722) (not b!1476718) (not b!1476710) (not b!1476720) (not b!1476707) (not b!1476716) (not b!1476723))
(check-sat)
