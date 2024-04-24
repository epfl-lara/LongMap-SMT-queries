; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127140 () Bool)

(assert start!127140)

(declare-fun b!1491766 () Bool)

(declare-fun e!836087 () Bool)

(declare-fun e!836083 () Bool)

(assert (=> b!1491766 (= e!836087 (not e!836083))))

(declare-fun res!1014005 () Bool)

(assert (=> b!1491766 (=> res!1014005 e!836083)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99751 0))(
  ( (array!99752 (arr!48142 (Array (_ BitVec 32) (_ BitVec 64))) (size!48693 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99751)

(assert (=> b!1491766 (= res!1014005 (or (and (= (select (arr!48142 a!2862) index!646) (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48142 a!2862) index!646) (select (arr!48142 a!2862) j!93))) (= (select (arr!48142 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12279 0))(
  ( (MissingZero!12279 (index!51508 (_ BitVec 32))) (Found!12279 (index!51509 (_ BitVec 32))) (Intermediate!12279 (undefined!13091 Bool) (index!51510 (_ BitVec 32)) (x!133288 (_ BitVec 32))) (Undefined!12279) (MissingVacant!12279 (index!51511 (_ BitVec 32))) )
))
(declare-fun lt!650446 () SeekEntryResult!12279)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491766 (and (= lt!650446 (Found!12279 j!93)) (or (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) (select (arr!48142 a!2862) j!93))) (let ((bdg!54771 (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48142 a!2862) index!646) bdg!54771) (= (select (arr!48142 a!2862) index!646) (select (arr!48142 a!2862) j!93))) (= (select (arr!48142 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54771 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12279)

(assert (=> b!1491766 (= lt!650446 (seekEntryOrOpen!0 (select (arr!48142 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99751 (_ BitVec 32)) Bool)

(assert (=> b!1491766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49931 0))(
  ( (Unit!49932) )
))
(declare-fun lt!650447 () Unit!49931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49931)

(assert (=> b!1491766 (= lt!650447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491767 () Bool)

(declare-fun res!1014009 () Bool)

(declare-fun e!836082 () Bool)

(assert (=> b!1491767 (=> (not res!1014009) (not e!836082))))

(assert (=> b!1491767 (= res!1014009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491768 () Bool)

(declare-fun e!836081 () Bool)

(assert (=> b!1491768 (= e!836081 e!836087)))

(declare-fun res!1014007 () Bool)

(assert (=> b!1491768 (=> (not res!1014007) (not e!836087))))

(declare-fun lt!650442 () SeekEntryResult!12279)

(assert (=> b!1491768 (= res!1014007 (= lt!650442 (Intermediate!12279 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650441 () array!99751)

(declare-fun lt!650444 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491768 (= lt!650442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650444 mask!2687) lt!650444 lt!650441 mask!2687))))

(assert (=> b!1491768 (= lt!650444 (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491769 () Bool)

(declare-fun e!836085 () Bool)

(assert (=> b!1491769 (= e!836083 e!836085)))

(declare-fun res!1014014 () Bool)

(assert (=> b!1491769 (=> res!1014014 e!836085)))

(declare-fun lt!650443 () (_ BitVec 32))

(assert (=> b!1491769 (= res!1014014 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650443 #b00000000000000000000000000000000) (bvsge lt!650443 (size!48693 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491769 (= lt!650443 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!650445 () SeekEntryResult!12279)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12279)

(assert (=> b!1491769 (= lt!650445 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650444 lt!650441 mask!2687))))

(assert (=> b!1491769 (= lt!650445 (seekEntryOrOpen!0 lt!650444 lt!650441 mask!2687))))

(declare-fun b!1491770 () Bool)

(declare-fun res!1014003 () Bool)

(assert (=> b!1491770 (=> (not res!1014003) (not e!836082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491770 (= res!1014003 (validKeyInArray!0 (select (arr!48142 a!2862) j!93)))))

(declare-fun b!1491771 () Bool)

(declare-fun res!1014013 () Bool)

(assert (=> b!1491771 (=> (not res!1014013) (not e!836081))))

(declare-fun lt!650448 () SeekEntryResult!12279)

(assert (=> b!1491771 (= res!1014013 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!650448))))

(declare-fun b!1491772 () Bool)

(assert (=> b!1491772 (= e!836085 true)))

(assert (=> b!1491772 (= lt!650446 lt!650445)))

(declare-fun lt!650449 () Unit!49931)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49931)

(assert (=> b!1491772 (= lt!650449 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!650443 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1491773 () Bool)

(declare-fun res!1014012 () Bool)

(assert (=> b!1491773 (=> res!1014012 e!836085)))

(assert (=> b!1491773 (= res!1014012 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650443 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!650448)))))

(declare-fun b!1491774 () Bool)

(declare-fun e!836086 () Bool)

(assert (=> b!1491774 (= e!836082 e!836086)))

(declare-fun res!1014006 () Bool)

(assert (=> b!1491774 (=> (not res!1014006) (not e!836086))))

(assert (=> b!1491774 (= res!1014006 (= (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491774 (= lt!650441 (array!99752 (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48693 a!2862)))))

(declare-fun b!1491775 () Bool)

(declare-fun e!836088 () Bool)

(assert (=> b!1491775 (= e!836088 (= lt!650442 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650444 lt!650441 mask!2687)))))

(declare-fun b!1491776 () Bool)

(assert (=> b!1491776 (= e!836088 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650444 lt!650441 mask!2687) (seekEntryOrOpen!0 lt!650444 lt!650441 mask!2687)))))

(declare-fun b!1491777 () Bool)

(declare-fun res!1014004 () Bool)

(assert (=> b!1491777 (=> (not res!1014004) (not e!836087))))

(assert (=> b!1491777 (= res!1014004 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491778 () Bool)

(declare-fun e!836080 () Bool)

(assert (=> b!1491778 (= e!836080 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650443 intermediateAfterIndex!19 lt!650444 lt!650441 mask!2687) lt!650445)))))

(declare-fun res!1014000 () Bool)

(assert (=> start!127140 (=> (not res!1014000) (not e!836082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127140 (= res!1014000 (validMask!0 mask!2687))))

(assert (=> start!127140 e!836082))

(assert (=> start!127140 true))

(declare-fun array_inv!37423 (array!99751) Bool)

(assert (=> start!127140 (array_inv!37423 a!2862)))

(declare-fun b!1491779 () Bool)

(declare-fun res!1014015 () Bool)

(assert (=> b!1491779 (=> (not res!1014015) (not e!836082))))

(declare-datatypes ((List!34630 0))(
  ( (Nil!34627) (Cons!34626 (h!36023 (_ BitVec 64)) (t!49316 List!34630)) )
))
(declare-fun arrayNoDuplicates!0 (array!99751 (_ BitVec 32) List!34630) Bool)

(assert (=> b!1491779 (= res!1014015 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34627))))

(declare-fun b!1491780 () Bool)

(declare-fun res!1014008 () Bool)

(assert (=> b!1491780 (=> res!1014008 e!836085)))

(assert (=> b!1491780 (= res!1014008 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1491781 () Bool)

(declare-fun res!1014017 () Bool)

(assert (=> b!1491781 (=> (not res!1014017) (not e!836082))))

(assert (=> b!1491781 (= res!1014017 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48693 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48693 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48693 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491782 () Bool)

(declare-fun res!1014001 () Bool)

(assert (=> b!1491782 (=> (not res!1014001) (not e!836082))))

(assert (=> b!1491782 (= res!1014001 (and (= (size!48693 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48693 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48693 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491783 () Bool)

(declare-fun res!1014016 () Bool)

(assert (=> b!1491783 (=> res!1014016 e!836085)))

(assert (=> b!1491783 (= res!1014016 e!836080)))

(declare-fun c!138420 () Bool)

(assert (=> b!1491783 (= c!138420 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1491784 () Bool)

(declare-fun res!1014002 () Bool)

(assert (=> b!1491784 (=> (not res!1014002) (not e!836087))))

(assert (=> b!1491784 (= res!1014002 e!836088)))

(declare-fun c!138421 () Bool)

(assert (=> b!1491784 (= c!138421 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491785 () Bool)

(assert (=> b!1491785 (= e!836086 e!836081)))

(declare-fun res!1014010 () Bool)

(assert (=> b!1491785 (=> (not res!1014010) (not e!836081))))

(assert (=> b!1491785 (= res!1014010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48142 a!2862) j!93) mask!2687) (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!650448))))

(assert (=> b!1491785 (= lt!650448 (Intermediate!12279 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491786 () Bool)

(assert (=> b!1491786 (= e!836080 (not (= lt!650442 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650443 lt!650444 lt!650441 mask!2687))))))

(declare-fun b!1491787 () Bool)

(declare-fun res!1014011 () Bool)

(assert (=> b!1491787 (=> (not res!1014011) (not e!836082))))

(assert (=> b!1491787 (= res!1014011 (validKeyInArray!0 (select (arr!48142 a!2862) i!1006)))))

(assert (= (and start!127140 res!1014000) b!1491782))

(assert (= (and b!1491782 res!1014001) b!1491787))

(assert (= (and b!1491787 res!1014011) b!1491770))

(assert (= (and b!1491770 res!1014003) b!1491767))

(assert (= (and b!1491767 res!1014009) b!1491779))

(assert (= (and b!1491779 res!1014015) b!1491781))

(assert (= (and b!1491781 res!1014017) b!1491774))

(assert (= (and b!1491774 res!1014006) b!1491785))

(assert (= (and b!1491785 res!1014010) b!1491771))

(assert (= (and b!1491771 res!1014013) b!1491768))

(assert (= (and b!1491768 res!1014007) b!1491784))

(assert (= (and b!1491784 c!138421) b!1491775))

(assert (= (and b!1491784 (not c!138421)) b!1491776))

(assert (= (and b!1491784 res!1014002) b!1491777))

(assert (= (and b!1491777 res!1014004) b!1491766))

(assert (= (and b!1491766 (not res!1014005)) b!1491769))

(assert (= (and b!1491769 (not res!1014014)) b!1491773))

(assert (= (and b!1491773 (not res!1014012)) b!1491783))

(assert (= (and b!1491783 c!138420) b!1491786))

(assert (= (and b!1491783 (not c!138420)) b!1491778))

(assert (= (and b!1491783 (not res!1014016)) b!1491780))

(assert (= (and b!1491780 (not res!1014008)) b!1491772))

(declare-fun m!1375939 () Bool)

(assert (=> b!1491772 m!1375939))

(declare-fun m!1375941 () Bool)

(assert (=> b!1491771 m!1375941))

(assert (=> b!1491771 m!1375941))

(declare-fun m!1375943 () Bool)

(assert (=> b!1491771 m!1375943))

(declare-fun m!1375945 () Bool)

(assert (=> b!1491776 m!1375945))

(declare-fun m!1375947 () Bool)

(assert (=> b!1491776 m!1375947))

(declare-fun m!1375949 () Bool)

(assert (=> b!1491778 m!1375949))

(declare-fun m!1375951 () Bool)

(assert (=> b!1491787 m!1375951))

(assert (=> b!1491787 m!1375951))

(declare-fun m!1375953 () Bool)

(assert (=> b!1491787 m!1375953))

(declare-fun m!1375955 () Bool)

(assert (=> b!1491774 m!1375955))

(declare-fun m!1375957 () Bool)

(assert (=> b!1491774 m!1375957))

(declare-fun m!1375959 () Bool)

(assert (=> b!1491786 m!1375959))

(assert (=> b!1491785 m!1375941))

(assert (=> b!1491785 m!1375941))

(declare-fun m!1375961 () Bool)

(assert (=> b!1491785 m!1375961))

(assert (=> b!1491785 m!1375961))

(assert (=> b!1491785 m!1375941))

(declare-fun m!1375963 () Bool)

(assert (=> b!1491785 m!1375963))

(declare-fun m!1375965 () Bool)

(assert (=> b!1491766 m!1375965))

(assert (=> b!1491766 m!1375955))

(declare-fun m!1375967 () Bool)

(assert (=> b!1491766 m!1375967))

(declare-fun m!1375969 () Bool)

(assert (=> b!1491766 m!1375969))

(declare-fun m!1375971 () Bool)

(assert (=> b!1491766 m!1375971))

(assert (=> b!1491766 m!1375941))

(declare-fun m!1375973 () Bool)

(assert (=> b!1491766 m!1375973))

(declare-fun m!1375975 () Bool)

(assert (=> b!1491766 m!1375975))

(assert (=> b!1491766 m!1375941))

(declare-fun m!1375977 () Bool)

(assert (=> b!1491767 m!1375977))

(declare-fun m!1375979 () Bool)

(assert (=> start!127140 m!1375979))

(declare-fun m!1375981 () Bool)

(assert (=> start!127140 m!1375981))

(assert (=> b!1491770 m!1375941))

(assert (=> b!1491770 m!1375941))

(declare-fun m!1375983 () Bool)

(assert (=> b!1491770 m!1375983))

(declare-fun m!1375985 () Bool)

(assert (=> b!1491769 m!1375985))

(assert (=> b!1491769 m!1375945))

(assert (=> b!1491769 m!1375947))

(declare-fun m!1375987 () Bool)

(assert (=> b!1491779 m!1375987))

(declare-fun m!1375989 () Bool)

(assert (=> b!1491775 m!1375989))

(assert (=> b!1491773 m!1375941))

(assert (=> b!1491773 m!1375941))

(declare-fun m!1375991 () Bool)

(assert (=> b!1491773 m!1375991))

(declare-fun m!1375993 () Bool)

(assert (=> b!1491768 m!1375993))

(assert (=> b!1491768 m!1375993))

(declare-fun m!1375995 () Bool)

(assert (=> b!1491768 m!1375995))

(assert (=> b!1491768 m!1375955))

(declare-fun m!1375997 () Bool)

(assert (=> b!1491768 m!1375997))

(check-sat (not b!1491785) (not b!1491770) (not start!127140) (not b!1491786) (not b!1491787) (not b!1491768) (not b!1491772) (not b!1491769) (not b!1491767) (not b!1491776) (not b!1491766) (not b!1491779) (not b!1491778) (not b!1491773) (not b!1491775) (not b!1491771))
(check-sat)
