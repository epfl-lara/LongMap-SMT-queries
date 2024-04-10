; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125310 () Bool)

(assert start!125310)

(declare-fun b!1463703 () Bool)

(declare-fun e!822646 () Bool)

(declare-fun e!822644 () Bool)

(assert (=> b!1463703 (= e!822646 e!822644)))

(declare-fun res!992915 () Bool)

(assert (=> b!1463703 (=> (not res!992915) (not e!822644))))

(declare-datatypes ((array!98758 0))(
  ( (array!98759 (arr!47667 (Array (_ BitVec 32) (_ BitVec 64))) (size!48217 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98758)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11919 0))(
  ( (MissingZero!11919 (index!50068 (_ BitVec 32))) (Found!11919 (index!50069 (_ BitVec 32))) (Intermediate!11919 (undefined!12731 Bool) (index!50070 (_ BitVec 32)) (x!131656 (_ BitVec 32))) (Undefined!11919) (MissingVacant!11919 (index!50071 (_ BitVec 32))) )
))
(declare-fun lt!640857 () SeekEntryResult!11919)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463703 (= res!992915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47667 a!2862) j!93) mask!2687) (select (arr!47667 a!2862) j!93) a!2862 mask!2687) lt!640857))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463703 (= lt!640857 (Intermediate!11919 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463704 () Bool)

(declare-fun res!992921 () Bool)

(assert (=> b!1463704 (=> (not res!992921) (not e!822644))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1463704 (= res!992921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47667 a!2862) j!93) a!2862 mask!2687) lt!640857))))

(declare-fun b!1463705 () Bool)

(declare-fun res!992916 () Bool)

(declare-fun e!822641 () Bool)

(assert (=> b!1463705 (=> (not res!992916) (not e!822641))))

(declare-fun e!822647 () Bool)

(assert (=> b!1463705 (= res!992916 e!822647)))

(declare-fun c!134910 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463705 (= c!134910 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463706 () Bool)

(declare-fun lt!640856 () (_ BitVec 64))

(declare-fun lt!640851 () array!98758)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11919)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11919)

(assert (=> b!1463706 (= e!822647 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640856 lt!640851 mask!2687) (seekEntryOrOpen!0 lt!640856 lt!640851 mask!2687)))))

(declare-fun b!1463707 () Bool)

(declare-fun res!992918 () Bool)

(declare-fun e!822645 () Bool)

(assert (=> b!1463707 (=> (not res!992918) (not e!822645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463707 (= res!992918 (validKeyInArray!0 (select (arr!47667 a!2862) j!93)))))

(declare-fun b!1463708 () Bool)

(declare-fun e!822650 () Bool)

(assert (=> b!1463708 (= e!822641 (not e!822650))))

(declare-fun res!992920 () Bool)

(assert (=> b!1463708 (=> res!992920 e!822650)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463708 (= res!992920 (or (and (= (select (arr!47667 a!2862) index!646) (select (store (arr!47667 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47667 a!2862) index!646) (select (arr!47667 a!2862) j!93))) (= (select (arr!47667 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822643 () Bool)

(assert (=> b!1463708 e!822643))

(declare-fun res!992919 () Bool)

(assert (=> b!1463708 (=> (not res!992919) (not e!822643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98758 (_ BitVec 32)) Bool)

(assert (=> b!1463708 (= res!992919 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49334 0))(
  ( (Unit!49335) )
))
(declare-fun lt!640854 () Unit!49334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49334)

(assert (=> b!1463708 (= lt!640854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463709 () Bool)

(declare-fun res!992911 () Bool)

(assert (=> b!1463709 (=> (not res!992911) (not e!822645))))

(assert (=> b!1463709 (= res!992911 (and (= (size!48217 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48217 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48217 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463710 () Bool)

(declare-fun res!992908 () Bool)

(assert (=> b!1463710 (=> (not res!992908) (not e!822641))))

(assert (=> b!1463710 (= res!992908 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463711 () Bool)

(declare-fun res!992910 () Bool)

(assert (=> b!1463711 (=> (not res!992910) (not e!822643))))

(assert (=> b!1463711 (= res!992910 (= (seekEntryOrOpen!0 (select (arr!47667 a!2862) j!93) a!2862 mask!2687) (Found!11919 j!93)))))

(declare-fun res!992906 () Bool)

(assert (=> start!125310 (=> (not res!992906) (not e!822645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125310 (= res!992906 (validMask!0 mask!2687))))

(assert (=> start!125310 e!822645))

(assert (=> start!125310 true))

(declare-fun array_inv!36695 (array!98758) Bool)

(assert (=> start!125310 (array_inv!36695 a!2862)))

(declare-fun e!822649 () Bool)

(declare-fun b!1463712 () Bool)

(declare-fun lt!640852 () (_ BitVec 32))

(declare-fun lt!640855 () SeekEntryResult!11919)

(assert (=> b!1463712 (= e!822649 (not (= lt!640855 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640852 lt!640856 lt!640851 mask!2687))))))

(declare-fun b!1463713 () Bool)

(assert (=> b!1463713 (= e!822645 e!822646)))

(declare-fun res!992923 () Bool)

(assert (=> b!1463713 (=> (not res!992923) (not e!822646))))

(assert (=> b!1463713 (= res!992923 (= (select (store (arr!47667 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463713 (= lt!640851 (array!98759 (store (arr!47667 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48217 a!2862)))))

(declare-fun b!1463714 () Bool)

(assert (=> b!1463714 (= e!822649 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640852 intermediateAfterIndex!19 lt!640856 lt!640851 mask!2687) (seekEntryOrOpen!0 lt!640856 lt!640851 mask!2687))))))

(declare-fun b!1463715 () Bool)

(declare-fun e!822642 () Bool)

(assert (=> b!1463715 (= e!822642 true)))

(declare-fun lt!640853 () Bool)

(assert (=> b!1463715 (= lt!640853 e!822649)))

(declare-fun c!134909 () Bool)

(assert (=> b!1463715 (= c!134909 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463716 () Bool)

(declare-fun res!992912 () Bool)

(assert (=> b!1463716 (=> (not res!992912) (not e!822645))))

(assert (=> b!1463716 (= res!992912 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48217 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48217 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48217 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463717 () Bool)

(declare-fun res!992907 () Bool)

(assert (=> b!1463717 (=> (not res!992907) (not e!822645))))

(assert (=> b!1463717 (= res!992907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463718 () Bool)

(assert (=> b!1463718 (= e!822650 e!822642)))

(declare-fun res!992914 () Bool)

(assert (=> b!1463718 (=> res!992914 e!822642)))

(assert (=> b!1463718 (= res!992914 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640852 #b00000000000000000000000000000000) (bvsge lt!640852 (size!48217 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463718 (= lt!640852 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463719 () Bool)

(assert (=> b!1463719 (= e!822644 e!822641)))

(declare-fun res!992913 () Bool)

(assert (=> b!1463719 (=> (not res!992913) (not e!822641))))

(assert (=> b!1463719 (= res!992913 (= lt!640855 (Intermediate!11919 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463719 (= lt!640855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640856 mask!2687) lt!640856 lt!640851 mask!2687))))

(assert (=> b!1463719 (= lt!640856 (select (store (arr!47667 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463720 () Bool)

(assert (=> b!1463720 (= e!822643 (or (= (select (arr!47667 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47667 a!2862) intermediateBeforeIndex!19) (select (arr!47667 a!2862) j!93))))))

(declare-fun b!1463721 () Bool)

(declare-fun res!992909 () Bool)

(assert (=> b!1463721 (=> (not res!992909) (not e!822645))))

(declare-datatypes ((List!34168 0))(
  ( (Nil!34165) (Cons!34164 (h!35514 (_ BitVec 64)) (t!48862 List!34168)) )
))
(declare-fun arrayNoDuplicates!0 (array!98758 (_ BitVec 32) List!34168) Bool)

(assert (=> b!1463721 (= res!992909 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34165))))

(declare-fun b!1463722 () Bool)

(declare-fun res!992917 () Bool)

(assert (=> b!1463722 (=> res!992917 e!822642)))

(assert (=> b!1463722 (= res!992917 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640852 (select (arr!47667 a!2862) j!93) a!2862 mask!2687) lt!640857)))))

(declare-fun b!1463723 () Bool)

(declare-fun res!992922 () Bool)

(assert (=> b!1463723 (=> (not res!992922) (not e!822645))))

(assert (=> b!1463723 (= res!992922 (validKeyInArray!0 (select (arr!47667 a!2862) i!1006)))))

(declare-fun b!1463724 () Bool)

(assert (=> b!1463724 (= e!822647 (= lt!640855 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640856 lt!640851 mask!2687)))))

(assert (= (and start!125310 res!992906) b!1463709))

(assert (= (and b!1463709 res!992911) b!1463723))

(assert (= (and b!1463723 res!992922) b!1463707))

(assert (= (and b!1463707 res!992918) b!1463717))

(assert (= (and b!1463717 res!992907) b!1463721))

(assert (= (and b!1463721 res!992909) b!1463716))

(assert (= (and b!1463716 res!992912) b!1463713))

(assert (= (and b!1463713 res!992923) b!1463703))

(assert (= (and b!1463703 res!992915) b!1463704))

(assert (= (and b!1463704 res!992921) b!1463719))

(assert (= (and b!1463719 res!992913) b!1463705))

(assert (= (and b!1463705 c!134910) b!1463724))

(assert (= (and b!1463705 (not c!134910)) b!1463706))

(assert (= (and b!1463705 res!992916) b!1463710))

(assert (= (and b!1463710 res!992908) b!1463708))

(assert (= (and b!1463708 res!992919) b!1463711))

(assert (= (and b!1463711 res!992910) b!1463720))

(assert (= (and b!1463708 (not res!992920)) b!1463718))

(assert (= (and b!1463718 (not res!992914)) b!1463722))

(assert (= (and b!1463722 (not res!992917)) b!1463715))

(assert (= (and b!1463715 c!134909) b!1463712))

(assert (= (and b!1463715 (not c!134909)) b!1463714))

(declare-fun m!1351007 () Bool)

(assert (=> b!1463718 m!1351007))

(declare-fun m!1351009 () Bool)

(assert (=> b!1463714 m!1351009))

(declare-fun m!1351011 () Bool)

(assert (=> b!1463714 m!1351011))

(declare-fun m!1351013 () Bool)

(assert (=> b!1463720 m!1351013))

(declare-fun m!1351015 () Bool)

(assert (=> b!1463720 m!1351015))

(declare-fun m!1351017 () Bool)

(assert (=> b!1463713 m!1351017))

(declare-fun m!1351019 () Bool)

(assert (=> b!1463713 m!1351019))

(assert (=> b!1463703 m!1351015))

(assert (=> b!1463703 m!1351015))

(declare-fun m!1351021 () Bool)

(assert (=> b!1463703 m!1351021))

(assert (=> b!1463703 m!1351021))

(assert (=> b!1463703 m!1351015))

(declare-fun m!1351023 () Bool)

(assert (=> b!1463703 m!1351023))

(assert (=> b!1463722 m!1351015))

(assert (=> b!1463722 m!1351015))

(declare-fun m!1351025 () Bool)

(assert (=> b!1463722 m!1351025))

(declare-fun m!1351027 () Bool)

(assert (=> b!1463724 m!1351027))

(declare-fun m!1351029 () Bool)

(assert (=> b!1463706 m!1351029))

(assert (=> b!1463706 m!1351011))

(declare-fun m!1351031 () Bool)

(assert (=> b!1463723 m!1351031))

(assert (=> b!1463723 m!1351031))

(declare-fun m!1351033 () Bool)

(assert (=> b!1463723 m!1351033))

(declare-fun m!1351035 () Bool)

(assert (=> b!1463717 m!1351035))

(declare-fun m!1351037 () Bool)

(assert (=> b!1463719 m!1351037))

(assert (=> b!1463719 m!1351037))

(declare-fun m!1351039 () Bool)

(assert (=> b!1463719 m!1351039))

(assert (=> b!1463719 m!1351017))

(declare-fun m!1351041 () Bool)

(assert (=> b!1463719 m!1351041))

(declare-fun m!1351043 () Bool)

(assert (=> b!1463712 m!1351043))

(assert (=> b!1463707 m!1351015))

(assert (=> b!1463707 m!1351015))

(declare-fun m!1351045 () Bool)

(assert (=> b!1463707 m!1351045))

(assert (=> b!1463711 m!1351015))

(assert (=> b!1463711 m!1351015))

(declare-fun m!1351047 () Bool)

(assert (=> b!1463711 m!1351047))

(declare-fun m!1351049 () Bool)

(assert (=> b!1463708 m!1351049))

(assert (=> b!1463708 m!1351017))

(declare-fun m!1351051 () Bool)

(assert (=> b!1463708 m!1351051))

(declare-fun m!1351053 () Bool)

(assert (=> b!1463708 m!1351053))

(declare-fun m!1351055 () Bool)

(assert (=> b!1463708 m!1351055))

(assert (=> b!1463708 m!1351015))

(declare-fun m!1351057 () Bool)

(assert (=> start!125310 m!1351057))

(declare-fun m!1351059 () Bool)

(assert (=> start!125310 m!1351059))

(declare-fun m!1351061 () Bool)

(assert (=> b!1463721 m!1351061))

(assert (=> b!1463704 m!1351015))

(assert (=> b!1463704 m!1351015))

(declare-fun m!1351063 () Bool)

(assert (=> b!1463704 m!1351063))

(check-sat (not b!1463704) (not b!1463723) (not b!1463714) (not b!1463724) (not b!1463717) (not b!1463719) (not b!1463708) (not b!1463711) (not b!1463703) (not b!1463722) (not b!1463706) (not b!1463721) (not start!125310) (not b!1463707) (not b!1463718) (not b!1463712))
(check-sat)
