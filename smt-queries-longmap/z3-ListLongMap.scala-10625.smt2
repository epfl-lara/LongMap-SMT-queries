; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125106 () Bool)

(assert start!125106)

(declare-fun b!1451910 () Bool)

(declare-fun res!982416 () Bool)

(declare-fun e!817656 () Bool)

(assert (=> b!1451910 (=> (not res!982416) (not e!817656))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451910 (= res!982416 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451911 () Bool)

(declare-fun res!982420 () Bool)

(declare-fun e!817660 () Bool)

(assert (=> b!1451911 (=> (not res!982420) (not e!817660))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98449 0))(
  ( (array!98450 (arr!47509 (Array (_ BitVec 32) (_ BitVec 64))) (size!48060 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98449)

(assert (=> b!1451911 (= res!982420 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48060 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48060 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48060 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!817657 () Bool)

(declare-fun lt!636831 () array!98449)

(declare-fun b!1451912 () Bool)

(declare-fun lt!636834 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11658 0))(
  ( (MissingZero!11658 (index!49024 (_ BitVec 32))) (Found!11658 (index!49025 (_ BitVec 32))) (Intermediate!11658 (undefined!12470 Bool) (index!49026 (_ BitVec 32)) (x!130859 (_ BitVec 32))) (Undefined!11658) (MissingVacant!11658 (index!49027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98449 (_ BitVec 32)) SeekEntryResult!11658)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98449 (_ BitVec 32)) SeekEntryResult!11658)

(assert (=> b!1451912 (= e!817657 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636834 lt!636831 mask!2687) (seekEntryOrOpen!0 lt!636834 lt!636831 mask!2687)))))

(declare-fun b!1451913 () Bool)

(declare-fun res!982425 () Bool)

(assert (=> b!1451913 (=> (not res!982425) (not e!817660))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1451913 (= res!982425 (and (= (size!48060 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48060 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48060 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451914 () Bool)

(declare-fun e!817661 () Bool)

(assert (=> b!1451914 (= e!817661 e!817656)))

(declare-fun res!982417 () Bool)

(assert (=> b!1451914 (=> (not res!982417) (not e!817656))))

(declare-fun lt!636833 () SeekEntryResult!11658)

(assert (=> b!1451914 (= res!982417 (= lt!636833 (Intermediate!11658 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98449 (_ BitVec 32)) SeekEntryResult!11658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451914 (= lt!636833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636834 mask!2687) lt!636834 lt!636831 mask!2687))))

(assert (=> b!1451914 (= lt!636834 (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451915 () Bool)

(assert (=> b!1451915 (= e!817657 (= lt!636833 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636834 lt!636831 mask!2687)))))

(declare-fun b!1451916 () Bool)

(declare-fun res!982411 () Bool)

(assert (=> b!1451916 (=> (not res!982411) (not e!817660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451916 (= res!982411 (validKeyInArray!0 (select (arr!47509 a!2862) i!1006)))))

(declare-fun b!1451917 () Bool)

(declare-fun e!817659 () Bool)

(assert (=> b!1451917 (= e!817660 e!817659)))

(declare-fun res!982414 () Bool)

(assert (=> b!1451917 (=> (not res!982414) (not e!817659))))

(assert (=> b!1451917 (= res!982414 (= (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451917 (= lt!636831 (array!98450 (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48060 a!2862)))))

(declare-fun b!1451918 () Bool)

(declare-fun e!817655 () Bool)

(assert (=> b!1451918 (= e!817655 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!982415 () Bool)

(assert (=> start!125106 (=> (not res!982415) (not e!817660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125106 (= res!982415 (validMask!0 mask!2687))))

(assert (=> start!125106 e!817660))

(assert (=> start!125106 true))

(declare-fun array_inv!36790 (array!98449) Bool)

(assert (=> start!125106 (array_inv!36790 a!2862)))

(declare-fun b!1451919 () Bool)

(declare-fun res!982424 () Bool)

(assert (=> b!1451919 (=> (not res!982424) (not e!817661))))

(declare-fun lt!636835 () SeekEntryResult!11658)

(assert (=> b!1451919 (= res!982424 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!636835))))

(declare-fun b!1451920 () Bool)

(declare-fun res!982419 () Bool)

(assert (=> b!1451920 (=> (not res!982419) (not e!817660))))

(declare-datatypes ((List!33997 0))(
  ( (Nil!33994) (Cons!33993 (h!35354 (_ BitVec 64)) (t!48683 List!33997)) )
))
(declare-fun arrayNoDuplicates!0 (array!98449 (_ BitVec 32) List!33997) Bool)

(assert (=> b!1451920 (= res!982419 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33994))))

(declare-fun b!1451921 () Bool)

(declare-fun e!817653 () Bool)

(declare-fun e!817662 () Bool)

(assert (=> b!1451921 (= e!817653 e!817662)))

(declare-fun res!982423 () Bool)

(assert (=> b!1451921 (=> res!982423 e!817662)))

(assert (=> b!1451921 (= res!982423 (or (and (= (select (arr!47509 a!2862) index!646) (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (not (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451922 () Bool)

(declare-fun e!817658 () Bool)

(assert (=> b!1451922 (= e!817656 (not e!817658))))

(declare-fun res!982412 () Bool)

(assert (=> b!1451922 (=> res!982412 e!817658)))

(assert (=> b!1451922 (= res!982412 (or (and (= (select (arr!47509 a!2862) index!646) (select (store (arr!47509 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47509 a!2862) index!646) (select (arr!47509 a!2862) j!93))) (not (= (select (arr!47509 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1451922 e!817653))

(declare-fun res!982410 () Bool)

(assert (=> b!1451922 (=> (not res!982410) (not e!817653))))

(declare-fun lt!636832 () SeekEntryResult!11658)

(declare-fun lt!636830 () SeekEntryResult!11658)

(assert (=> b!1451922 (= res!982410 (and (= lt!636832 lt!636830) (or (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47509 a!2862) intermediateBeforeIndex!19) (select (arr!47509 a!2862) j!93)))))))

(assert (=> b!1451922 (= lt!636830 (Found!11658 j!93))))

(assert (=> b!1451922 (= lt!636832 (seekEntryOrOpen!0 (select (arr!47509 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98449 (_ BitVec 32)) Bool)

(assert (=> b!1451922 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48845 0))(
  ( (Unit!48846) )
))
(declare-fun lt!636829 () Unit!48845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48845)

(assert (=> b!1451922 (= lt!636829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451923 () Bool)

(assert (=> b!1451923 (= e!817662 e!817655)))

(declare-fun res!982422 () Bool)

(assert (=> b!1451923 (=> (not res!982422) (not e!817655))))

(assert (=> b!1451923 (= res!982422 (= lt!636832 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47509 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451924 () Bool)

(declare-fun res!982426 () Bool)

(assert (=> b!1451924 (=> (not res!982426) (not e!817656))))

(assert (=> b!1451924 (= res!982426 e!817657)))

(declare-fun c!134269 () Bool)

(assert (=> b!1451924 (= c!134269 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451925 () Bool)

(declare-fun res!982421 () Bool)

(assert (=> b!1451925 (=> (not res!982421) (not e!817660))))

(assert (=> b!1451925 (= res!982421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451926 () Bool)

(assert (=> b!1451926 (= e!817658 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1451926 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636834 lt!636831 mask!2687) lt!636830)))

(declare-fun lt!636828 () Unit!48845)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48845)

(assert (=> b!1451926 (= lt!636828 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451927 () Bool)

(declare-fun res!982418 () Bool)

(assert (=> b!1451927 (=> (not res!982418) (not e!817660))))

(assert (=> b!1451927 (= res!982418 (validKeyInArray!0 (select (arr!47509 a!2862) j!93)))))

(declare-fun b!1451928 () Bool)

(declare-fun res!982427 () Bool)

(assert (=> b!1451928 (=> res!982427 e!817658)))

(assert (=> b!1451928 (= res!982427 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!636830)))))

(declare-fun b!1451929 () Bool)

(assert (=> b!1451929 (= e!817659 e!817661)))

(declare-fun res!982413 () Bool)

(assert (=> b!1451929 (=> (not res!982413) (not e!817661))))

(assert (=> b!1451929 (= res!982413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47509 a!2862) j!93) mask!2687) (select (arr!47509 a!2862) j!93) a!2862 mask!2687) lt!636835))))

(assert (=> b!1451929 (= lt!636835 (Intermediate!11658 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125106 res!982415) b!1451913))

(assert (= (and b!1451913 res!982425) b!1451916))

(assert (= (and b!1451916 res!982411) b!1451927))

(assert (= (and b!1451927 res!982418) b!1451925))

(assert (= (and b!1451925 res!982421) b!1451920))

(assert (= (and b!1451920 res!982419) b!1451911))

(assert (= (and b!1451911 res!982420) b!1451917))

(assert (= (and b!1451917 res!982414) b!1451929))

(assert (= (and b!1451929 res!982413) b!1451919))

(assert (= (and b!1451919 res!982424) b!1451914))

(assert (= (and b!1451914 res!982417) b!1451924))

(assert (= (and b!1451924 c!134269) b!1451915))

(assert (= (and b!1451924 (not c!134269)) b!1451912))

(assert (= (and b!1451924 res!982426) b!1451910))

(assert (= (and b!1451910 res!982416) b!1451922))

(assert (= (and b!1451922 res!982410) b!1451921))

(assert (= (and b!1451921 (not res!982423)) b!1451923))

(assert (= (and b!1451923 res!982422) b!1451918))

(assert (= (and b!1451922 (not res!982412)) b!1451928))

(assert (= (and b!1451928 (not res!982427)) b!1451926))

(declare-fun m!1340659 () Bool)

(assert (=> start!125106 m!1340659))

(declare-fun m!1340661 () Bool)

(assert (=> start!125106 m!1340661))

(declare-fun m!1340663 () Bool)

(assert (=> b!1451917 m!1340663))

(declare-fun m!1340665 () Bool)

(assert (=> b!1451917 m!1340665))

(declare-fun m!1340667 () Bool)

(assert (=> b!1451927 m!1340667))

(assert (=> b!1451927 m!1340667))

(declare-fun m!1340669 () Bool)

(assert (=> b!1451927 m!1340669))

(assert (=> b!1451923 m!1340667))

(assert (=> b!1451923 m!1340667))

(declare-fun m!1340671 () Bool)

(assert (=> b!1451923 m!1340671))

(declare-fun m!1340673 () Bool)

(assert (=> b!1451915 m!1340673))

(declare-fun m!1340675 () Bool)

(assert (=> b!1451914 m!1340675))

(assert (=> b!1451914 m!1340675))

(declare-fun m!1340677 () Bool)

(assert (=> b!1451914 m!1340677))

(assert (=> b!1451914 m!1340663))

(declare-fun m!1340679 () Bool)

(assert (=> b!1451914 m!1340679))

(assert (=> b!1451928 m!1340667))

(assert (=> b!1451928 m!1340667))

(declare-fun m!1340681 () Bool)

(assert (=> b!1451928 m!1340681))

(declare-fun m!1340683 () Bool)

(assert (=> b!1451926 m!1340683))

(declare-fun m!1340685 () Bool)

(assert (=> b!1451926 m!1340685))

(declare-fun m!1340687 () Bool)

(assert (=> b!1451921 m!1340687))

(assert (=> b!1451921 m!1340663))

(declare-fun m!1340689 () Bool)

(assert (=> b!1451921 m!1340689))

(assert (=> b!1451921 m!1340667))

(declare-fun m!1340691 () Bool)

(assert (=> b!1451922 m!1340691))

(assert (=> b!1451922 m!1340663))

(declare-fun m!1340693 () Bool)

(assert (=> b!1451922 m!1340693))

(assert (=> b!1451922 m!1340689))

(assert (=> b!1451922 m!1340687))

(assert (=> b!1451922 m!1340667))

(declare-fun m!1340695 () Bool)

(assert (=> b!1451922 m!1340695))

(declare-fun m!1340697 () Bool)

(assert (=> b!1451922 m!1340697))

(assert (=> b!1451922 m!1340667))

(assert (=> b!1451919 m!1340667))

(assert (=> b!1451919 m!1340667))

(declare-fun m!1340699 () Bool)

(assert (=> b!1451919 m!1340699))

(assert (=> b!1451912 m!1340683))

(declare-fun m!1340701 () Bool)

(assert (=> b!1451912 m!1340701))

(assert (=> b!1451929 m!1340667))

(assert (=> b!1451929 m!1340667))

(declare-fun m!1340703 () Bool)

(assert (=> b!1451929 m!1340703))

(assert (=> b!1451929 m!1340703))

(assert (=> b!1451929 m!1340667))

(declare-fun m!1340705 () Bool)

(assert (=> b!1451929 m!1340705))

(declare-fun m!1340707 () Bool)

(assert (=> b!1451920 m!1340707))

(declare-fun m!1340709 () Bool)

(assert (=> b!1451925 m!1340709))

(declare-fun m!1340711 () Bool)

(assert (=> b!1451916 m!1340711))

(assert (=> b!1451916 m!1340711))

(declare-fun m!1340713 () Bool)

(assert (=> b!1451916 m!1340713))

(check-sat (not b!1451920) (not b!1451926) (not b!1451914) (not b!1451915) (not b!1451927) (not b!1451916) (not start!125106) (not b!1451922) (not b!1451923) (not b!1451919) (not b!1451929) (not b!1451912) (not b!1451925) (not b!1451928))
(check-sat)
