; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125340 () Bool)

(assert start!125340)

(declare-fun b!1464693 () Bool)

(declare-fun res!993727 () Bool)

(declare-fun e!823095 () Bool)

(assert (=> b!1464693 (=> res!993727 e!823095)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11934 0))(
  ( (MissingZero!11934 (index!50128 (_ BitVec 32))) (Found!11934 (index!50129 (_ BitVec 32))) (Intermediate!11934 (undefined!12746 Bool) (index!50130 (_ BitVec 32)) (x!131711 (_ BitVec 32))) (Undefined!11934) (MissingVacant!11934 (index!50131 (_ BitVec 32))) )
))
(declare-fun lt!641171 () SeekEntryResult!11934)

(declare-fun lt!641169 () (_ BitVec 32))

(declare-datatypes ((array!98788 0))(
  ( (array!98789 (arr!47682 (Array (_ BitVec 32) (_ BitVec 64))) (size!48232 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98788)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11934)

(assert (=> b!1464693 (= res!993727 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641169 (select (arr!47682 a!2862) j!93) a!2862 mask!2687) lt!641171)))))

(declare-fun b!1464694 () Bool)

(declare-fun e!823094 () Bool)

(declare-fun e!823096 () Bool)

(assert (=> b!1464694 (= e!823094 (not e!823096))))

(declare-fun res!993733 () Bool)

(assert (=> b!1464694 (=> res!993733 e!823096)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464694 (= res!993733 (or (and (= (select (arr!47682 a!2862) index!646) (select (store (arr!47682 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47682 a!2862) index!646) (select (arr!47682 a!2862) j!93))) (= (select (arr!47682 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823097 () Bool)

(assert (=> b!1464694 e!823097))

(declare-fun res!993723 () Bool)

(assert (=> b!1464694 (=> (not res!993723) (not e!823097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98788 (_ BitVec 32)) Bool)

(assert (=> b!1464694 (= res!993723 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49364 0))(
  ( (Unit!49365) )
))
(declare-fun lt!641172 () Unit!49364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49364)

(assert (=> b!1464694 (= lt!641172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464695 () Bool)

(declare-fun res!993719 () Bool)

(declare-fun e!823099 () Bool)

(assert (=> b!1464695 (=> (not res!993719) (not e!823099))))

(declare-datatypes ((List!34183 0))(
  ( (Nil!34180) (Cons!34179 (h!35529 (_ BitVec 64)) (t!48877 List!34183)) )
))
(declare-fun arrayNoDuplicates!0 (array!98788 (_ BitVec 32) List!34183) Bool)

(assert (=> b!1464695 (= res!993719 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34180))))

(declare-fun b!1464696 () Bool)

(declare-fun res!993717 () Bool)

(declare-fun e!823100 () Bool)

(assert (=> b!1464696 (=> (not res!993717) (not e!823100))))

(assert (=> b!1464696 (= res!993717 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47682 a!2862) j!93) a!2862 mask!2687) lt!641171))))

(declare-fun b!1464697 () Bool)

(declare-fun res!993731 () Bool)

(assert (=> b!1464697 (=> (not res!993731) (not e!823099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464697 (= res!993731 (validKeyInArray!0 (select (arr!47682 a!2862) j!93)))))

(declare-fun b!1464698 () Bool)

(assert (=> b!1464698 (= e!823100 e!823094)))

(declare-fun res!993726 () Bool)

(assert (=> b!1464698 (=> (not res!993726) (not e!823094))))

(declare-fun lt!641166 () SeekEntryResult!11934)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464698 (= res!993726 (= lt!641166 (Intermediate!11934 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641170 () array!98788)

(declare-fun lt!641168 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464698 (= lt!641166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641168 mask!2687) lt!641168 lt!641170 mask!2687))))

(assert (=> b!1464698 (= lt!641168 (select (store (arr!47682 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464699 () Bool)

(declare-fun e!823091 () Bool)

(assert (=> b!1464699 (= e!823091 (= lt!641166 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641168 lt!641170 mask!2687)))))

(declare-fun b!1464700 () Bool)

(declare-fun res!993720 () Bool)

(assert (=> b!1464700 (=> (not res!993720) (not e!823099))))

(assert (=> b!1464700 (= res!993720 (validKeyInArray!0 (select (arr!47682 a!2862) i!1006)))))

(declare-fun b!1464701 () Bool)

(declare-fun res!993732 () Bool)

(assert (=> b!1464701 (=> (not res!993732) (not e!823094))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464701 (= res!993732 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464702 () Bool)

(declare-fun res!993722 () Bool)

(assert (=> b!1464702 (=> (not res!993722) (not e!823097))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11934)

(assert (=> b!1464702 (= res!993722 (= (seekEntryOrOpen!0 (select (arr!47682 a!2862) j!93) a!2862 mask!2687) (Found!11934 j!93)))))

(declare-fun b!1464703 () Bool)

(declare-fun e!823092 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11934)

(assert (=> b!1464703 (= e!823092 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641169 intermediateAfterIndex!19 lt!641168 lt!641170 mask!2687) (seekEntryOrOpen!0 lt!641168 lt!641170 mask!2687))))))

(declare-fun b!1464704 () Bool)

(declare-fun res!993718 () Bool)

(assert (=> b!1464704 (=> (not res!993718) (not e!823099))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1464704 (= res!993718 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48232 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48232 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48232 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464705 () Bool)

(declare-fun res!993716 () Bool)

(assert (=> b!1464705 (=> (not res!993716) (not e!823094))))

(assert (=> b!1464705 (= res!993716 e!823091)))

(declare-fun c!134999 () Bool)

(assert (=> b!1464705 (= c!134999 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464706 () Bool)

(declare-fun e!823093 () Bool)

(assert (=> b!1464706 (= e!823099 e!823093)))

(declare-fun res!993729 () Bool)

(assert (=> b!1464706 (=> (not res!993729) (not e!823093))))

(assert (=> b!1464706 (= res!993729 (= (select (store (arr!47682 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464706 (= lt!641170 (array!98789 (store (arr!47682 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48232 a!2862)))))

(declare-fun b!1464707 () Bool)

(declare-fun res!993725 () Bool)

(assert (=> b!1464707 (=> (not res!993725) (not e!823099))))

(assert (=> b!1464707 (= res!993725 (and (= (size!48232 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48232 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48232 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464708 () Bool)

(assert (=> b!1464708 (= e!823091 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641168 lt!641170 mask!2687) (seekEntryOrOpen!0 lt!641168 lt!641170 mask!2687)))))

(declare-fun b!1464709 () Bool)

(assert (=> b!1464709 (= e!823093 e!823100)))

(declare-fun res!993724 () Bool)

(assert (=> b!1464709 (=> (not res!993724) (not e!823100))))

(assert (=> b!1464709 (= res!993724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47682 a!2862) j!93) mask!2687) (select (arr!47682 a!2862) j!93) a!2862 mask!2687) lt!641171))))

(assert (=> b!1464709 (= lt!641171 (Intermediate!11934 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464710 () Bool)

(assert (=> b!1464710 (= e!823096 e!823095)))

(declare-fun res!993721 () Bool)

(assert (=> b!1464710 (=> res!993721 e!823095)))

(assert (=> b!1464710 (= res!993721 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641169 #b00000000000000000000000000000000) (bvsge lt!641169 (size!48232 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464710 (= lt!641169 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464711 () Bool)

(declare-fun res!993728 () Bool)

(assert (=> b!1464711 (=> (not res!993728) (not e!823099))))

(assert (=> b!1464711 (= res!993728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464712 () Bool)

(assert (=> b!1464712 (= e!823095 true)))

(declare-fun lt!641167 () Bool)

(assert (=> b!1464712 (= lt!641167 e!823092)))

(declare-fun c!135000 () Bool)

(assert (=> b!1464712 (= c!135000 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464714 () Bool)

(assert (=> b!1464714 (= e!823092 (not (= lt!641166 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641169 lt!641168 lt!641170 mask!2687))))))

(declare-fun res!993730 () Bool)

(assert (=> start!125340 (=> (not res!993730) (not e!823099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125340 (= res!993730 (validMask!0 mask!2687))))

(assert (=> start!125340 e!823099))

(assert (=> start!125340 true))

(declare-fun array_inv!36710 (array!98788) Bool)

(assert (=> start!125340 (array_inv!36710 a!2862)))

(declare-fun b!1464713 () Bool)

(assert (=> b!1464713 (= e!823097 (or (= (select (arr!47682 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47682 a!2862) intermediateBeforeIndex!19) (select (arr!47682 a!2862) j!93))))))

(assert (= (and start!125340 res!993730) b!1464707))

(assert (= (and b!1464707 res!993725) b!1464700))

(assert (= (and b!1464700 res!993720) b!1464697))

(assert (= (and b!1464697 res!993731) b!1464711))

(assert (= (and b!1464711 res!993728) b!1464695))

(assert (= (and b!1464695 res!993719) b!1464704))

(assert (= (and b!1464704 res!993718) b!1464706))

(assert (= (and b!1464706 res!993729) b!1464709))

(assert (= (and b!1464709 res!993724) b!1464696))

(assert (= (and b!1464696 res!993717) b!1464698))

(assert (= (and b!1464698 res!993726) b!1464705))

(assert (= (and b!1464705 c!134999) b!1464699))

(assert (= (and b!1464705 (not c!134999)) b!1464708))

(assert (= (and b!1464705 res!993716) b!1464701))

(assert (= (and b!1464701 res!993732) b!1464694))

(assert (= (and b!1464694 res!993723) b!1464702))

(assert (= (and b!1464702 res!993722) b!1464713))

(assert (= (and b!1464694 (not res!993733)) b!1464710))

(assert (= (and b!1464710 (not res!993721)) b!1464693))

(assert (= (and b!1464693 (not res!993727)) b!1464712))

(assert (= (and b!1464712 c!135000) b!1464714))

(assert (= (and b!1464712 (not c!135000)) b!1464703))

(declare-fun m!1351877 () Bool)

(assert (=> b!1464694 m!1351877))

(declare-fun m!1351879 () Bool)

(assert (=> b!1464694 m!1351879))

(declare-fun m!1351881 () Bool)

(assert (=> b!1464694 m!1351881))

(declare-fun m!1351883 () Bool)

(assert (=> b!1464694 m!1351883))

(declare-fun m!1351885 () Bool)

(assert (=> b!1464694 m!1351885))

(declare-fun m!1351887 () Bool)

(assert (=> b!1464694 m!1351887))

(declare-fun m!1351889 () Bool)

(assert (=> start!125340 m!1351889))

(declare-fun m!1351891 () Bool)

(assert (=> start!125340 m!1351891))

(declare-fun m!1351893 () Bool)

(assert (=> b!1464695 m!1351893))

(assert (=> b!1464693 m!1351887))

(assert (=> b!1464693 m!1351887))

(declare-fun m!1351895 () Bool)

(assert (=> b!1464693 m!1351895))

(declare-fun m!1351897 () Bool)

(assert (=> b!1464700 m!1351897))

(assert (=> b!1464700 m!1351897))

(declare-fun m!1351899 () Bool)

(assert (=> b!1464700 m!1351899))

(declare-fun m!1351901 () Bool)

(assert (=> b!1464711 m!1351901))

(assert (=> b!1464697 m!1351887))

(assert (=> b!1464697 m!1351887))

(declare-fun m!1351903 () Bool)

(assert (=> b!1464697 m!1351903))

(assert (=> b!1464709 m!1351887))

(assert (=> b!1464709 m!1351887))

(declare-fun m!1351905 () Bool)

(assert (=> b!1464709 m!1351905))

(assert (=> b!1464709 m!1351905))

(assert (=> b!1464709 m!1351887))

(declare-fun m!1351907 () Bool)

(assert (=> b!1464709 m!1351907))

(declare-fun m!1351909 () Bool)

(assert (=> b!1464713 m!1351909))

(assert (=> b!1464713 m!1351887))

(assert (=> b!1464706 m!1351879))

(declare-fun m!1351911 () Bool)

(assert (=> b!1464706 m!1351911))

(declare-fun m!1351913 () Bool)

(assert (=> b!1464698 m!1351913))

(assert (=> b!1464698 m!1351913))

(declare-fun m!1351915 () Bool)

(assert (=> b!1464698 m!1351915))

(assert (=> b!1464698 m!1351879))

(declare-fun m!1351917 () Bool)

(assert (=> b!1464698 m!1351917))

(declare-fun m!1351919 () Bool)

(assert (=> b!1464714 m!1351919))

(assert (=> b!1464696 m!1351887))

(assert (=> b!1464696 m!1351887))

(declare-fun m!1351921 () Bool)

(assert (=> b!1464696 m!1351921))

(declare-fun m!1351923 () Bool)

(assert (=> b!1464708 m!1351923))

(declare-fun m!1351925 () Bool)

(assert (=> b!1464708 m!1351925))

(declare-fun m!1351927 () Bool)

(assert (=> b!1464703 m!1351927))

(assert (=> b!1464703 m!1351925))

(declare-fun m!1351929 () Bool)

(assert (=> b!1464699 m!1351929))

(assert (=> b!1464702 m!1351887))

(assert (=> b!1464702 m!1351887))

(declare-fun m!1351931 () Bool)

(assert (=> b!1464702 m!1351931))

(declare-fun m!1351933 () Bool)

(assert (=> b!1464710 m!1351933))

(check-sat (not b!1464714) (not b!1464695) (not b!1464702) (not b!1464709) (not b!1464697) (not b!1464699) (not b!1464698) (not b!1464693) (not b!1464708) (not b!1464703) (not b!1464700) (not start!125340) (not b!1464710) (not b!1464711) (not b!1464696) (not b!1464694))
