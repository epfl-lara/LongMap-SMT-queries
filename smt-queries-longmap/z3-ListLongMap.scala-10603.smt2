; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124758 () Bool)

(assert start!124758)

(declare-fun b!1446831 () Bool)

(declare-fun e!814869 () Bool)

(declare-fun e!814873 () Bool)

(assert (=> b!1446831 (= e!814869 e!814873)))

(declare-fun res!978547 () Bool)

(assert (=> b!1446831 (=> res!978547 e!814873)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98206 0))(
  ( (array!98207 (arr!47391 (Array (_ BitVec 32) (_ BitVec 64))) (size!47941 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98206)

(assert (=> b!1446831 (= res!978547 (or (and (= (select (arr!47391 a!2862) index!646) (select (store (arr!47391 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47391 a!2862) index!646) (select (arr!47391 a!2862) j!93))) (not (= (select (arr!47391 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446832 () Bool)

(declare-fun res!978559 () Bool)

(declare-fun e!814871 () Bool)

(assert (=> b!1446832 (=> (not res!978559) (not e!814871))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446832 (= res!978559 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446833 () Bool)

(declare-fun res!978553 () Bool)

(declare-fun e!814866 () Bool)

(assert (=> b!1446833 (=> (not res!978553) (not e!814866))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98206 (_ BitVec 32)) Bool)

(assert (=> b!1446833 (= res!978553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446834 () Bool)

(declare-fun res!978557 () Bool)

(assert (=> b!1446834 (=> (not res!978557) (not e!814866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446834 (= res!978557 (validKeyInArray!0 (select (arr!47391 a!2862) i!1006)))))

(declare-fun b!1446835 () Bool)

(declare-fun e!814874 () Bool)

(declare-fun e!814865 () Bool)

(assert (=> b!1446835 (= e!814874 e!814865)))

(declare-fun res!978558 () Bool)

(assert (=> b!1446835 (=> (not res!978558) (not e!814865))))

(declare-datatypes ((SeekEntryResult!11643 0))(
  ( (MissingZero!11643 (index!48964 (_ BitVec 32))) (Found!11643 (index!48965 (_ BitVec 32))) (Intermediate!11643 (undefined!12455 Bool) (index!48966 (_ BitVec 32)) (x!130644 (_ BitVec 32))) (Undefined!11643) (MissingVacant!11643 (index!48967 (_ BitVec 32))) )
))
(declare-fun lt!634940 () SeekEntryResult!11643)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446835 (= res!978558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47391 a!2862) j!93) mask!2687) (select (arr!47391 a!2862) j!93) a!2862 mask!2687) lt!634940))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446835 (= lt!634940 (Intermediate!11643 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446836 () Bool)

(assert (=> b!1446836 (= e!814866 e!814874)))

(declare-fun res!978548 () Bool)

(assert (=> b!1446836 (=> (not res!978548) (not e!814874))))

(assert (=> b!1446836 (= res!978548 (= (select (store (arr!47391 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634942 () array!98206)

(assert (=> b!1446836 (= lt!634942 (array!98207 (store (arr!47391 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47941 a!2862)))))

(declare-fun b!1446837 () Bool)

(declare-fun e!814870 () Bool)

(assert (=> b!1446837 (= e!814870 true)))

(declare-fun lt!634943 () SeekEntryResult!11643)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11643)

(assert (=> b!1446837 (= lt!634943 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47391 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!978546 () Bool)

(assert (=> start!124758 (=> (not res!978546) (not e!814866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124758 (= res!978546 (validMask!0 mask!2687))))

(assert (=> start!124758 e!814866))

(assert (=> start!124758 true))

(declare-fun array_inv!36419 (array!98206) Bool)

(assert (=> start!124758 (array_inv!36419 a!2862)))

(declare-fun b!1446838 () Bool)

(assert (=> b!1446838 (= e!814871 (not e!814870))))

(declare-fun res!978549 () Bool)

(assert (=> b!1446838 (=> res!978549 e!814870)))

(assert (=> b!1446838 (= res!978549 (or (and (= (select (arr!47391 a!2862) index!646) (select (store (arr!47391 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47391 a!2862) index!646) (select (arr!47391 a!2862) j!93))) (not (= (select (arr!47391 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47391 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446838 e!814869))

(declare-fun res!978554 () Bool)

(assert (=> b!1446838 (=> (not res!978554) (not e!814869))))

(declare-fun lt!634941 () SeekEntryResult!11643)

(assert (=> b!1446838 (= res!978554 (and (= lt!634941 (Found!11643 j!93)) (or (= (select (arr!47391 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47391 a!2862) intermediateBeforeIndex!19) (select (arr!47391 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11643)

(assert (=> b!1446838 (= lt!634941 (seekEntryOrOpen!0 (select (arr!47391 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446838 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48782 0))(
  ( (Unit!48783) )
))
(declare-fun lt!634938 () Unit!48782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48782)

(assert (=> b!1446838 (= lt!634938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!814872 () Bool)

(declare-fun b!1446839 () Bool)

(declare-fun lt!634944 () (_ BitVec 64))

(assert (=> b!1446839 (= e!814872 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634944 lt!634942 mask!2687) (seekEntryOrOpen!0 lt!634944 lt!634942 mask!2687)))))

(declare-fun b!1446840 () Bool)

(declare-fun lt!634939 () SeekEntryResult!11643)

(assert (=> b!1446840 (= e!814872 (= lt!634939 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634944 lt!634942 mask!2687)))))

(declare-fun b!1446841 () Bool)

(assert (=> b!1446841 (= e!814865 e!814871)))

(declare-fun res!978561 () Bool)

(assert (=> b!1446841 (=> (not res!978561) (not e!814871))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446841 (= res!978561 (= lt!634939 (Intermediate!11643 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446841 (= lt!634939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634944 mask!2687) lt!634944 lt!634942 mask!2687))))

(assert (=> b!1446841 (= lt!634944 (select (store (arr!47391 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446842 () Bool)

(declare-fun res!978562 () Bool)

(assert (=> b!1446842 (=> (not res!978562) (not e!814871))))

(assert (=> b!1446842 (= res!978562 e!814872)))

(declare-fun c!133653 () Bool)

(assert (=> b!1446842 (= c!133653 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446843 () Bool)

(declare-fun res!978552 () Bool)

(assert (=> b!1446843 (=> (not res!978552) (not e!814866))))

(declare-datatypes ((List!33892 0))(
  ( (Nil!33889) (Cons!33888 (h!35238 (_ BitVec 64)) (t!48586 List!33892)) )
))
(declare-fun arrayNoDuplicates!0 (array!98206 (_ BitVec 32) List!33892) Bool)

(assert (=> b!1446843 (= res!978552 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33889))))

(declare-fun b!1446844 () Bool)

(declare-fun res!978550 () Bool)

(assert (=> b!1446844 (=> (not res!978550) (not e!814866))))

(assert (=> b!1446844 (= res!978550 (and (= (size!47941 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47941 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47941 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!814867 () Bool)

(declare-fun b!1446845 () Bool)

(assert (=> b!1446845 (= e!814867 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446846 () Bool)

(declare-fun res!978551 () Bool)

(assert (=> b!1446846 (=> (not res!978551) (not e!814866))))

(assert (=> b!1446846 (= res!978551 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47941 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47941 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47941 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446847 () Bool)

(declare-fun res!978555 () Bool)

(assert (=> b!1446847 (=> (not res!978555) (not e!814866))))

(assert (=> b!1446847 (= res!978555 (validKeyInArray!0 (select (arr!47391 a!2862) j!93)))))

(declare-fun b!1446848 () Bool)

(assert (=> b!1446848 (= e!814873 e!814867)))

(declare-fun res!978560 () Bool)

(assert (=> b!1446848 (=> (not res!978560) (not e!814867))))

(assert (=> b!1446848 (= res!978560 (= lt!634941 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47391 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446849 () Bool)

(declare-fun res!978556 () Bool)

(assert (=> b!1446849 (=> (not res!978556) (not e!814865))))

(assert (=> b!1446849 (= res!978556 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47391 a!2862) j!93) a!2862 mask!2687) lt!634940))))

(assert (= (and start!124758 res!978546) b!1446844))

(assert (= (and b!1446844 res!978550) b!1446834))

(assert (= (and b!1446834 res!978557) b!1446847))

(assert (= (and b!1446847 res!978555) b!1446833))

(assert (= (and b!1446833 res!978553) b!1446843))

(assert (= (and b!1446843 res!978552) b!1446846))

(assert (= (and b!1446846 res!978551) b!1446836))

(assert (= (and b!1446836 res!978548) b!1446835))

(assert (= (and b!1446835 res!978558) b!1446849))

(assert (= (and b!1446849 res!978556) b!1446841))

(assert (= (and b!1446841 res!978561) b!1446842))

(assert (= (and b!1446842 c!133653) b!1446840))

(assert (= (and b!1446842 (not c!133653)) b!1446839))

(assert (= (and b!1446842 res!978562) b!1446832))

(assert (= (and b!1446832 res!978559) b!1446838))

(assert (= (and b!1446838 res!978554) b!1446831))

(assert (= (and b!1446831 (not res!978547)) b!1446848))

(assert (= (and b!1446848 res!978560) b!1446845))

(assert (= (and b!1446838 (not res!978549)) b!1446837))

(declare-fun m!1335679 () Bool)

(assert (=> b!1446848 m!1335679))

(assert (=> b!1446848 m!1335679))

(declare-fun m!1335681 () Bool)

(assert (=> b!1446848 m!1335681))

(declare-fun m!1335683 () Bool)

(assert (=> b!1446840 m!1335683))

(declare-fun m!1335685 () Bool)

(assert (=> b!1446836 m!1335685))

(declare-fun m!1335687 () Bool)

(assert (=> b!1446836 m!1335687))

(declare-fun m!1335689 () Bool)

(assert (=> b!1446841 m!1335689))

(assert (=> b!1446841 m!1335689))

(declare-fun m!1335691 () Bool)

(assert (=> b!1446841 m!1335691))

(assert (=> b!1446841 m!1335685))

(declare-fun m!1335693 () Bool)

(assert (=> b!1446841 m!1335693))

(assert (=> b!1446835 m!1335679))

(assert (=> b!1446835 m!1335679))

(declare-fun m!1335695 () Bool)

(assert (=> b!1446835 m!1335695))

(assert (=> b!1446835 m!1335695))

(assert (=> b!1446835 m!1335679))

(declare-fun m!1335697 () Bool)

(assert (=> b!1446835 m!1335697))

(declare-fun m!1335699 () Bool)

(assert (=> b!1446831 m!1335699))

(assert (=> b!1446831 m!1335685))

(declare-fun m!1335701 () Bool)

(assert (=> b!1446831 m!1335701))

(assert (=> b!1446831 m!1335679))

(declare-fun m!1335703 () Bool)

(assert (=> start!124758 m!1335703))

(declare-fun m!1335705 () Bool)

(assert (=> start!124758 m!1335705))

(declare-fun m!1335707 () Bool)

(assert (=> b!1446833 m!1335707))

(assert (=> b!1446837 m!1335679))

(assert (=> b!1446837 m!1335679))

(declare-fun m!1335709 () Bool)

(assert (=> b!1446837 m!1335709))

(declare-fun m!1335711 () Bool)

(assert (=> b!1446839 m!1335711))

(declare-fun m!1335713 () Bool)

(assert (=> b!1446839 m!1335713))

(declare-fun m!1335715 () Bool)

(assert (=> b!1446838 m!1335715))

(assert (=> b!1446838 m!1335685))

(declare-fun m!1335717 () Bool)

(assert (=> b!1446838 m!1335717))

(assert (=> b!1446838 m!1335701))

(assert (=> b!1446838 m!1335699))

(assert (=> b!1446838 m!1335679))

(declare-fun m!1335719 () Bool)

(assert (=> b!1446838 m!1335719))

(declare-fun m!1335721 () Bool)

(assert (=> b!1446838 m!1335721))

(assert (=> b!1446838 m!1335679))

(assert (=> b!1446847 m!1335679))

(assert (=> b!1446847 m!1335679))

(declare-fun m!1335723 () Bool)

(assert (=> b!1446847 m!1335723))

(declare-fun m!1335725 () Bool)

(assert (=> b!1446834 m!1335725))

(assert (=> b!1446834 m!1335725))

(declare-fun m!1335727 () Bool)

(assert (=> b!1446834 m!1335727))

(assert (=> b!1446849 m!1335679))

(assert (=> b!1446849 m!1335679))

(declare-fun m!1335729 () Bool)

(assert (=> b!1446849 m!1335729))

(declare-fun m!1335731 () Bool)

(assert (=> b!1446843 m!1335731))

(check-sat (not b!1446847) (not start!124758) (not b!1446837) (not b!1446843) (not b!1446848) (not b!1446835) (not b!1446833) (not b!1446840) (not b!1446841) (not b!1446838) (not b!1446849) (not b!1446834) (not b!1446839))
