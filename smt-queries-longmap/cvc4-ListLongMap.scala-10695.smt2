; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125312 () Bool)

(assert start!125312)

(declare-fun b!1463769 () Bool)

(declare-fun e!822680 () Bool)

(assert (=> b!1463769 (= e!822680 true)))

(declare-fun lt!640878 () Bool)

(declare-fun e!822671 () Bool)

(assert (=> b!1463769 (= lt!640878 e!822671)))

(declare-fun c!134916 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463769 (= c!134916 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!992970 () Bool)

(declare-fun e!822672 () Bool)

(assert (=> start!125312 (=> (not res!992970) (not e!822672))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125312 (= res!992970 (validMask!0 mask!2687))))

(assert (=> start!125312 e!822672))

(assert (=> start!125312 true))

(declare-datatypes ((array!98760 0))(
  ( (array!98761 (arr!47668 (Array (_ BitVec 32) (_ BitVec 64))) (size!48218 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98760)

(declare-fun array_inv!36696 (array!98760) Bool)

(assert (=> start!125312 (array_inv!36696 a!2862)))

(declare-fun b!1463770 () Bool)

(declare-fun res!992966 () Bool)

(assert (=> b!1463770 (=> (not res!992966) (not e!822672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98760 (_ BitVec 32)) Bool)

(assert (=> b!1463770 (= res!992966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463771 () Bool)

(declare-fun res!992977 () Bool)

(declare-fun e!822679 () Bool)

(assert (=> b!1463771 (=> (not res!992977) (not e!822679))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11920 0))(
  ( (MissingZero!11920 (index!50072 (_ BitVec 32))) (Found!11920 (index!50073 (_ BitVec 32))) (Intermediate!11920 (undefined!12732 Bool) (index!50074 (_ BitVec 32)) (x!131657 (_ BitVec 32))) (Undefined!11920) (MissingVacant!11920 (index!50075 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98760 (_ BitVec 32)) SeekEntryResult!11920)

(assert (=> b!1463771 (= res!992977 (= (seekEntryOrOpen!0 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) (Found!11920 j!93)))))

(declare-fun e!822677 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640876 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!640875 () array!98760)

(declare-fun b!1463772 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98760 (_ BitVec 32)) SeekEntryResult!11920)

(assert (=> b!1463772 (= e!822677 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640876 lt!640875 mask!2687) (seekEntryOrOpen!0 lt!640876 lt!640875 mask!2687)))))

(declare-fun b!1463773 () Bool)

(declare-fun lt!640877 () SeekEntryResult!11920)

(declare-fun lt!640873 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98760 (_ BitVec 32)) SeekEntryResult!11920)

(assert (=> b!1463773 (= e!822671 (not (= lt!640877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640873 lt!640876 lt!640875 mask!2687))))))

(declare-fun b!1463774 () Bool)

(declare-fun res!992965 () Bool)

(assert (=> b!1463774 (=> (not res!992965) (not e!822672))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463774 (= res!992965 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48218 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48218 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48218 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463775 () Bool)

(declare-fun e!822673 () Bool)

(assert (=> b!1463775 (= e!822672 e!822673)))

(declare-fun res!992961 () Bool)

(assert (=> b!1463775 (=> (not res!992961) (not e!822673))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463775 (= res!992961 (= (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463775 (= lt!640875 (array!98761 (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48218 a!2862)))))

(declare-fun b!1463776 () Bool)

(assert (=> b!1463776 (= e!822671 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640873 intermediateAfterIndex!19 lt!640876 lt!640875 mask!2687) (seekEntryOrOpen!0 lt!640876 lt!640875 mask!2687))))))

(declare-fun b!1463777 () Bool)

(declare-fun res!992960 () Bool)

(assert (=> b!1463777 (=> (not res!992960) (not e!822672))))

(assert (=> b!1463777 (= res!992960 (and (= (size!48218 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48218 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48218 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463778 () Bool)

(declare-fun res!992963 () Bool)

(declare-fun e!822676 () Bool)

(assert (=> b!1463778 (=> (not res!992963) (not e!822676))))

(assert (=> b!1463778 (= res!992963 e!822677)))

(declare-fun c!134915 () Bool)

(assert (=> b!1463778 (= c!134915 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463779 () Bool)

(declare-fun e!822678 () Bool)

(assert (=> b!1463779 (= e!822676 (not e!822678))))

(declare-fun res!992975 () Bool)

(assert (=> b!1463779 (=> res!992975 e!822678)))

(assert (=> b!1463779 (= res!992975 (or (and (= (select (arr!47668 a!2862) index!646) (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47668 a!2862) index!646) (select (arr!47668 a!2862) j!93))) (= (select (arr!47668 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463779 e!822679))

(declare-fun res!992976 () Bool)

(assert (=> b!1463779 (=> (not res!992976) (not e!822679))))

(assert (=> b!1463779 (= res!992976 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49336 0))(
  ( (Unit!49337) )
))
(declare-fun lt!640874 () Unit!49336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49336)

(assert (=> b!1463779 (= lt!640874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463780 () Bool)

(assert (=> b!1463780 (= e!822678 e!822680)))

(declare-fun res!992967 () Bool)

(assert (=> b!1463780 (=> res!992967 e!822680)))

(assert (=> b!1463780 (= res!992967 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640873 #b00000000000000000000000000000000) (bvsge lt!640873 (size!48218 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463780 (= lt!640873 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463781 () Bool)

(declare-fun res!992964 () Bool)

(declare-fun e!822674 () Bool)

(assert (=> b!1463781 (=> (not res!992964) (not e!822674))))

(declare-fun lt!640872 () SeekEntryResult!11920)

(assert (=> b!1463781 (= res!992964 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!640872))))

(declare-fun b!1463782 () Bool)

(declare-fun res!992974 () Bool)

(assert (=> b!1463782 (=> (not res!992974) (not e!822672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463782 (= res!992974 (validKeyInArray!0 (select (arr!47668 a!2862) j!93)))))

(declare-fun b!1463783 () Bool)

(assert (=> b!1463783 (= e!822677 (= lt!640877 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640876 lt!640875 mask!2687)))))

(declare-fun b!1463784 () Bool)

(declare-fun res!992962 () Bool)

(assert (=> b!1463784 (=> (not res!992962) (not e!822672))))

(declare-datatypes ((List!34169 0))(
  ( (Nil!34166) (Cons!34165 (h!35515 (_ BitVec 64)) (t!48863 List!34169)) )
))
(declare-fun arrayNoDuplicates!0 (array!98760 (_ BitVec 32) List!34169) Bool)

(assert (=> b!1463784 (= res!992962 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34166))))

(declare-fun b!1463785 () Bool)

(assert (=> b!1463785 (= e!822674 e!822676)))

(declare-fun res!992968 () Bool)

(assert (=> b!1463785 (=> (not res!992968) (not e!822676))))

(assert (=> b!1463785 (= res!992968 (= lt!640877 (Intermediate!11920 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463785 (= lt!640877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640876 mask!2687) lt!640876 lt!640875 mask!2687))))

(assert (=> b!1463785 (= lt!640876 (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463786 () Bool)

(declare-fun res!992972 () Bool)

(assert (=> b!1463786 (=> (not res!992972) (not e!822672))))

(assert (=> b!1463786 (= res!992972 (validKeyInArray!0 (select (arr!47668 a!2862) i!1006)))))

(declare-fun b!1463787 () Bool)

(assert (=> b!1463787 (= e!822673 e!822674)))

(declare-fun res!992971 () Bool)

(assert (=> b!1463787 (=> (not res!992971) (not e!822674))))

(assert (=> b!1463787 (= res!992971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47668 a!2862) j!93) mask!2687) (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!640872))))

(assert (=> b!1463787 (= lt!640872 (Intermediate!11920 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463788 () Bool)

(declare-fun res!992973 () Bool)

(assert (=> b!1463788 (=> res!992973 e!822680)))

(assert (=> b!1463788 (= res!992973 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640873 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!640872)))))

(declare-fun b!1463789 () Bool)

(assert (=> b!1463789 (= e!822679 (or (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) (select (arr!47668 a!2862) j!93))))))

(declare-fun b!1463790 () Bool)

(declare-fun res!992969 () Bool)

(assert (=> b!1463790 (=> (not res!992969) (not e!822676))))

(assert (=> b!1463790 (= res!992969 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125312 res!992970) b!1463777))

(assert (= (and b!1463777 res!992960) b!1463786))

(assert (= (and b!1463786 res!992972) b!1463782))

(assert (= (and b!1463782 res!992974) b!1463770))

(assert (= (and b!1463770 res!992966) b!1463784))

(assert (= (and b!1463784 res!992962) b!1463774))

(assert (= (and b!1463774 res!992965) b!1463775))

(assert (= (and b!1463775 res!992961) b!1463787))

(assert (= (and b!1463787 res!992971) b!1463781))

(assert (= (and b!1463781 res!992964) b!1463785))

(assert (= (and b!1463785 res!992968) b!1463778))

(assert (= (and b!1463778 c!134915) b!1463783))

(assert (= (and b!1463778 (not c!134915)) b!1463772))

(assert (= (and b!1463778 res!992963) b!1463790))

(assert (= (and b!1463790 res!992969) b!1463779))

(assert (= (and b!1463779 res!992976) b!1463771))

(assert (= (and b!1463771 res!992977) b!1463789))

(assert (= (and b!1463779 (not res!992975)) b!1463780))

(assert (= (and b!1463780 (not res!992967)) b!1463788))

(assert (= (and b!1463788 (not res!992973)) b!1463769))

(assert (= (and b!1463769 c!134916) b!1463773))

(assert (= (and b!1463769 (not c!134916)) b!1463776))

(declare-fun m!1351065 () Bool)

(assert (=> b!1463772 m!1351065))

(declare-fun m!1351067 () Bool)

(assert (=> b!1463772 m!1351067))

(declare-fun m!1351069 () Bool)

(assert (=> b!1463780 m!1351069))

(declare-fun m!1351071 () Bool)

(assert (=> b!1463782 m!1351071))

(assert (=> b!1463782 m!1351071))

(declare-fun m!1351073 () Bool)

(assert (=> b!1463782 m!1351073))

(declare-fun m!1351075 () Bool)

(assert (=> b!1463770 m!1351075))

(declare-fun m!1351077 () Bool)

(assert (=> b!1463773 m!1351077))

(declare-fun m!1351079 () Bool)

(assert (=> b!1463785 m!1351079))

(assert (=> b!1463785 m!1351079))

(declare-fun m!1351081 () Bool)

(assert (=> b!1463785 m!1351081))

(declare-fun m!1351083 () Bool)

(assert (=> b!1463785 m!1351083))

(declare-fun m!1351085 () Bool)

(assert (=> b!1463785 m!1351085))

(declare-fun m!1351087 () Bool)

(assert (=> b!1463776 m!1351087))

(assert (=> b!1463776 m!1351067))

(declare-fun m!1351089 () Bool)

(assert (=> b!1463786 m!1351089))

(assert (=> b!1463786 m!1351089))

(declare-fun m!1351091 () Bool)

(assert (=> b!1463786 m!1351091))

(assert (=> b!1463781 m!1351071))

(assert (=> b!1463781 m!1351071))

(declare-fun m!1351093 () Bool)

(assert (=> b!1463781 m!1351093))

(assert (=> b!1463787 m!1351071))

(assert (=> b!1463787 m!1351071))

(declare-fun m!1351095 () Bool)

(assert (=> b!1463787 m!1351095))

(assert (=> b!1463787 m!1351095))

(assert (=> b!1463787 m!1351071))

(declare-fun m!1351097 () Bool)

(assert (=> b!1463787 m!1351097))

(assert (=> b!1463771 m!1351071))

(assert (=> b!1463771 m!1351071))

(declare-fun m!1351099 () Bool)

(assert (=> b!1463771 m!1351099))

(declare-fun m!1351101 () Bool)

(assert (=> b!1463779 m!1351101))

(assert (=> b!1463779 m!1351083))

(declare-fun m!1351103 () Bool)

(assert (=> b!1463779 m!1351103))

(declare-fun m!1351105 () Bool)

(assert (=> b!1463779 m!1351105))

(declare-fun m!1351107 () Bool)

(assert (=> b!1463779 m!1351107))

(assert (=> b!1463779 m!1351071))

(assert (=> b!1463788 m!1351071))

(assert (=> b!1463788 m!1351071))

(declare-fun m!1351109 () Bool)

(assert (=> b!1463788 m!1351109))

(declare-fun m!1351111 () Bool)

(assert (=> b!1463784 m!1351111))

(assert (=> b!1463775 m!1351083))

(declare-fun m!1351113 () Bool)

(assert (=> b!1463775 m!1351113))

(declare-fun m!1351115 () Bool)

(assert (=> b!1463789 m!1351115))

(assert (=> b!1463789 m!1351071))

(declare-fun m!1351117 () Bool)

(assert (=> b!1463783 m!1351117))

(declare-fun m!1351119 () Bool)

(assert (=> start!125312 m!1351119))

(declare-fun m!1351121 () Bool)

(assert (=> start!125312 m!1351121))

(push 1)

