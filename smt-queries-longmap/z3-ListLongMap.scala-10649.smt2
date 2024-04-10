; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125034 () Bool)

(assert start!125034)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1454766 () Bool)

(declare-fun lt!637709 () (_ BitVec 64))

(declare-datatypes ((array!98482 0))(
  ( (array!98483 (arr!47529 (Array (_ BitVec 32) (_ BitVec 64))) (size!48079 (_ BitVec 32))) )
))
(declare-fun lt!637708 () array!98482)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11781 0))(
  ( (MissingZero!11781 (index!49516 (_ BitVec 32))) (Found!11781 (index!49517 (_ BitVec 32))) (Intermediate!11781 (undefined!12593 Bool) (index!49518 (_ BitVec 32)) (x!131150 (_ BitVec 32))) (Undefined!11781) (MissingVacant!11781 (index!49519 (_ BitVec 32))) )
))
(declare-fun lt!637713 () SeekEntryResult!11781)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!818681 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1454766 (= e!818681 (= lt!637713 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637709 lt!637708 mask!2687)))))

(declare-fun b!1454767 () Bool)

(declare-fun e!818677 () Bool)

(declare-fun e!818678 () Bool)

(assert (=> b!1454767 (= e!818677 e!818678)))

(declare-fun res!985564 () Bool)

(assert (=> b!1454767 (=> res!985564 e!818678)))

(declare-fun lt!637712 () (_ BitVec 32))

(declare-fun a!2862 () array!98482)

(assert (=> b!1454767 (= res!985564 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637712 #b00000000000000000000000000000000) (bvsge lt!637712 (size!48079 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454767 (= lt!637712 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637711 () SeekEntryResult!11781)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1454767 (= lt!637711 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637709 lt!637708 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11781)

(assert (=> b!1454767 (= lt!637711 (seekEntryOrOpen!0 lt!637709 lt!637708 mask!2687))))

(declare-fun b!1454768 () Bool)

(declare-fun e!818675 () Bool)

(assert (=> b!1454768 (= e!818675 (not e!818677))))

(declare-fun res!985566 () Bool)

(assert (=> b!1454768 (=> res!985566 e!818677)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454768 (= res!985566 (or (and (= (select (arr!47529 a!2862) index!646) (select (store (arr!47529 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47529 a!2862) index!646) (select (arr!47529 a!2862) j!93))) (= (select (arr!47529 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818680 () Bool)

(assert (=> b!1454768 e!818680))

(declare-fun res!985556 () Bool)

(assert (=> b!1454768 (=> (not res!985556) (not e!818680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98482 (_ BitVec 32)) Bool)

(assert (=> b!1454768 (= res!985556 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49058 0))(
  ( (Unit!49059) )
))
(declare-fun lt!637710 () Unit!49058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49058)

(assert (=> b!1454768 (= lt!637710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454769 () Bool)

(declare-fun e!818672 () Bool)

(declare-fun e!818676 () Bool)

(assert (=> b!1454769 (= e!818672 e!818676)))

(declare-fun res!985557 () Bool)

(assert (=> b!1454769 (=> (not res!985557) (not e!818676))))

(assert (=> b!1454769 (= res!985557 (= (select (store (arr!47529 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454769 (= lt!637708 (array!98483 (store (arr!47529 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48079 a!2862)))))

(declare-fun b!1454770 () Bool)

(declare-fun res!985568 () Bool)

(assert (=> b!1454770 (=> (not res!985568) (not e!818680))))

(assert (=> b!1454770 (= res!985568 (= (seekEntryOrOpen!0 (select (arr!47529 a!2862) j!93) a!2862 mask!2687) (Found!11781 j!93)))))

(declare-fun b!1454771 () Bool)

(declare-fun e!818674 () Bool)

(assert (=> b!1454771 (= e!818674 (not (= lt!637713 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637712 lt!637709 lt!637708 mask!2687))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1454772 () Bool)

(assert (=> b!1454772 (= e!818680 (and (or (= (select (arr!47529 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47529 a!2862) intermediateBeforeIndex!19) (select (arr!47529 a!2862) j!93))) (let ((bdg!53092 (select (store (arr!47529 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47529 a!2862) index!646) bdg!53092) (= (select (arr!47529 a!2862) index!646) (select (arr!47529 a!2862) j!93))) (= (select (arr!47529 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53092 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454773 () Bool)

(declare-fun res!985559 () Bool)

(assert (=> b!1454773 (=> (not res!985559) (not e!818675))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454773 (= res!985559 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454774 () Bool)

(declare-fun res!985569 () Bool)

(assert (=> b!1454774 (=> (not res!985569) (not e!818672))))

(declare-datatypes ((List!34030 0))(
  ( (Nil!34027) (Cons!34026 (h!35376 (_ BitVec 64)) (t!48724 List!34030)) )
))
(declare-fun arrayNoDuplicates!0 (array!98482 (_ BitVec 32) List!34030) Bool)

(assert (=> b!1454774 (= res!985569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34027))))

(declare-fun b!1454776 () Bool)

(assert (=> b!1454776 (= e!818678 true)))

(declare-fun lt!637706 () Bool)

(assert (=> b!1454776 (= lt!637706 e!818674)))

(declare-fun c!134117 () Bool)

(assert (=> b!1454776 (= c!134117 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454777 () Bool)

(assert (=> b!1454777 (= e!818681 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637709 lt!637708 mask!2687) (seekEntryOrOpen!0 lt!637709 lt!637708 mask!2687)))))

(declare-fun b!1454778 () Bool)

(declare-fun res!985553 () Bool)

(assert (=> b!1454778 (=> (not res!985553) (not e!818675))))

(assert (=> b!1454778 (= res!985553 e!818681)))

(declare-fun c!134118 () Bool)

(assert (=> b!1454778 (= c!134118 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454779 () Bool)

(declare-fun e!818673 () Bool)

(assert (=> b!1454779 (= e!818673 e!818675)))

(declare-fun res!985560 () Bool)

(assert (=> b!1454779 (=> (not res!985560) (not e!818675))))

(assert (=> b!1454779 (= res!985560 (= lt!637713 (Intermediate!11781 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454779 (= lt!637713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637709 mask!2687) lt!637709 lt!637708 mask!2687))))

(assert (=> b!1454779 (= lt!637709 (select (store (arr!47529 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454780 () Bool)

(declare-fun res!985570 () Bool)

(assert (=> b!1454780 (=> (not res!985570) (not e!818672))))

(assert (=> b!1454780 (= res!985570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!985563 () Bool)

(assert (=> start!125034 (=> (not res!985563) (not e!818672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125034 (= res!985563 (validMask!0 mask!2687))))

(assert (=> start!125034 e!818672))

(assert (=> start!125034 true))

(declare-fun array_inv!36557 (array!98482) Bool)

(assert (=> start!125034 (array_inv!36557 a!2862)))

(declare-fun b!1454775 () Bool)

(declare-fun res!985567 () Bool)

(assert (=> b!1454775 (=> (not res!985567) (not e!818673))))

(declare-fun lt!637707 () SeekEntryResult!11781)

(assert (=> b!1454775 (= res!985567 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47529 a!2862) j!93) a!2862 mask!2687) lt!637707))))

(declare-fun b!1454781 () Bool)

(assert (=> b!1454781 (= e!818676 e!818673)))

(declare-fun res!985558 () Bool)

(assert (=> b!1454781 (=> (not res!985558) (not e!818673))))

(assert (=> b!1454781 (= res!985558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47529 a!2862) j!93) mask!2687) (select (arr!47529 a!2862) j!93) a!2862 mask!2687) lt!637707))))

(assert (=> b!1454781 (= lt!637707 (Intermediate!11781 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454782 () Bool)

(declare-fun res!985555 () Bool)

(assert (=> b!1454782 (=> (not res!985555) (not e!818672))))

(assert (=> b!1454782 (= res!985555 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48079 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48079 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48079 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454783 () Bool)

(declare-fun res!985565 () Bool)

(assert (=> b!1454783 (=> (not res!985565) (not e!818672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454783 (= res!985565 (validKeyInArray!0 (select (arr!47529 a!2862) i!1006)))))

(declare-fun b!1454784 () Bool)

(assert (=> b!1454784 (= e!818674 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637712 intermediateAfterIndex!19 lt!637709 lt!637708 mask!2687) lt!637711)))))

(declare-fun b!1454785 () Bool)

(declare-fun res!985554 () Bool)

(assert (=> b!1454785 (=> (not res!985554) (not e!818672))))

(assert (=> b!1454785 (= res!985554 (and (= (size!48079 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48079 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48079 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454786 () Bool)

(declare-fun res!985562 () Bool)

(assert (=> b!1454786 (=> res!985562 e!818678)))

(assert (=> b!1454786 (= res!985562 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637712 (select (arr!47529 a!2862) j!93) a!2862 mask!2687) lt!637707)))))

(declare-fun b!1454787 () Bool)

(declare-fun res!985561 () Bool)

(assert (=> b!1454787 (=> (not res!985561) (not e!818672))))

(assert (=> b!1454787 (= res!985561 (validKeyInArray!0 (select (arr!47529 a!2862) j!93)))))

(assert (= (and start!125034 res!985563) b!1454785))

(assert (= (and b!1454785 res!985554) b!1454783))

(assert (= (and b!1454783 res!985565) b!1454787))

(assert (= (and b!1454787 res!985561) b!1454780))

(assert (= (and b!1454780 res!985570) b!1454774))

(assert (= (and b!1454774 res!985569) b!1454782))

(assert (= (and b!1454782 res!985555) b!1454769))

(assert (= (and b!1454769 res!985557) b!1454781))

(assert (= (and b!1454781 res!985558) b!1454775))

(assert (= (and b!1454775 res!985567) b!1454779))

(assert (= (and b!1454779 res!985560) b!1454778))

(assert (= (and b!1454778 c!134118) b!1454766))

(assert (= (and b!1454778 (not c!134118)) b!1454777))

(assert (= (and b!1454778 res!985553) b!1454773))

(assert (= (and b!1454773 res!985559) b!1454768))

(assert (= (and b!1454768 res!985556) b!1454770))

(assert (= (and b!1454770 res!985568) b!1454772))

(assert (= (and b!1454768 (not res!985566)) b!1454767))

(assert (= (and b!1454767 (not res!985564)) b!1454786))

(assert (= (and b!1454786 (not res!985562)) b!1454776))

(assert (= (and b!1454776 c!134117) b!1454771))

(assert (= (and b!1454776 (not c!134117)) b!1454784))

(declare-fun m!1343069 () Bool)

(assert (=> b!1454781 m!1343069))

(assert (=> b!1454781 m!1343069))

(declare-fun m!1343071 () Bool)

(assert (=> b!1454781 m!1343071))

(assert (=> b!1454781 m!1343071))

(assert (=> b!1454781 m!1343069))

(declare-fun m!1343073 () Bool)

(assert (=> b!1454781 m!1343073))

(declare-fun m!1343075 () Bool)

(assert (=> b!1454784 m!1343075))

(declare-fun m!1343077 () Bool)

(assert (=> b!1454783 m!1343077))

(assert (=> b!1454783 m!1343077))

(declare-fun m!1343079 () Bool)

(assert (=> b!1454783 m!1343079))

(declare-fun m!1343081 () Bool)

(assert (=> b!1454767 m!1343081))

(declare-fun m!1343083 () Bool)

(assert (=> b!1454767 m!1343083))

(declare-fun m!1343085 () Bool)

(assert (=> b!1454767 m!1343085))

(declare-fun m!1343087 () Bool)

(assert (=> b!1454772 m!1343087))

(declare-fun m!1343089 () Bool)

(assert (=> b!1454772 m!1343089))

(declare-fun m!1343091 () Bool)

(assert (=> b!1454772 m!1343091))

(declare-fun m!1343093 () Bool)

(assert (=> b!1454772 m!1343093))

(assert (=> b!1454772 m!1343069))

(assert (=> b!1454769 m!1343087))

(declare-fun m!1343095 () Bool)

(assert (=> b!1454769 m!1343095))

(declare-fun m!1343097 () Bool)

(assert (=> b!1454768 m!1343097))

(assert (=> b!1454768 m!1343087))

(assert (=> b!1454768 m!1343091))

(assert (=> b!1454768 m!1343093))

(declare-fun m!1343099 () Bool)

(assert (=> b!1454768 m!1343099))

(assert (=> b!1454768 m!1343069))

(assert (=> b!1454770 m!1343069))

(assert (=> b!1454770 m!1343069))

(declare-fun m!1343101 () Bool)

(assert (=> b!1454770 m!1343101))

(assert (=> b!1454786 m!1343069))

(assert (=> b!1454786 m!1343069))

(declare-fun m!1343103 () Bool)

(assert (=> b!1454786 m!1343103))

(assert (=> b!1454775 m!1343069))

(assert (=> b!1454775 m!1343069))

(declare-fun m!1343105 () Bool)

(assert (=> b!1454775 m!1343105))

(declare-fun m!1343107 () Bool)

(assert (=> b!1454766 m!1343107))

(declare-fun m!1343109 () Bool)

(assert (=> start!125034 m!1343109))

(declare-fun m!1343111 () Bool)

(assert (=> start!125034 m!1343111))

(declare-fun m!1343113 () Bool)

(assert (=> b!1454779 m!1343113))

(assert (=> b!1454779 m!1343113))

(declare-fun m!1343115 () Bool)

(assert (=> b!1454779 m!1343115))

(assert (=> b!1454779 m!1343087))

(declare-fun m!1343117 () Bool)

(assert (=> b!1454779 m!1343117))

(declare-fun m!1343119 () Bool)

(assert (=> b!1454771 m!1343119))

(declare-fun m!1343121 () Bool)

(assert (=> b!1454780 m!1343121))

(assert (=> b!1454777 m!1343083))

(assert (=> b!1454777 m!1343085))

(assert (=> b!1454787 m!1343069))

(assert (=> b!1454787 m!1343069))

(declare-fun m!1343123 () Bool)

(assert (=> b!1454787 m!1343123))

(declare-fun m!1343125 () Bool)

(assert (=> b!1454774 m!1343125))

(check-sat (not b!1454768) (not b!1454775) (not b!1454786) (not b!1454767) (not b!1454779) (not b!1454766) (not b!1454784) (not b!1454787) (not b!1454777) (not b!1454780) (not b!1454783) (not b!1454781) (not b!1454771) (not start!125034) (not b!1454774) (not b!1454770))
(check-sat)
