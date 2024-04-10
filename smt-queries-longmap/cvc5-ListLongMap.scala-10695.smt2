; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125308 () Bool)

(assert start!125308)

(declare-fun b!1463637 () Bool)

(declare-fun res!992868 () Bool)

(declare-fun e!822612 () Bool)

(assert (=> b!1463637 (=> (not res!992868) (not e!822612))))

(declare-datatypes ((array!98756 0))(
  ( (array!98757 (arr!47666 (Array (_ BitVec 32) (_ BitVec 64))) (size!48216 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98756)

(declare-datatypes ((List!34167 0))(
  ( (Nil!34164) (Cons!34163 (h!35513 (_ BitVec 64)) (t!48861 List!34167)) )
))
(declare-fun arrayNoDuplicates!0 (array!98756 (_ BitVec 32) List!34167) Bool)

(assert (=> b!1463637 (= res!992868 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34164))))

(declare-fun lt!640832 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!822619 () Bool)

(declare-fun lt!640834 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1463638 () Bool)

(declare-fun lt!640831 () array!98756)

(declare-datatypes ((SeekEntryResult!11918 0))(
  ( (MissingZero!11918 (index!50064 (_ BitVec 32))) (Found!11918 (index!50065 (_ BitVec 32))) (Intermediate!11918 (undefined!12730 Bool) (index!50066 (_ BitVec 32)) (x!131655 (_ BitVec 32))) (Undefined!11918) (MissingVacant!11918 (index!50067 (_ BitVec 32))) )
))
(declare-fun lt!640830 () SeekEntryResult!11918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98756 (_ BitVec 32)) SeekEntryResult!11918)

(assert (=> b!1463638 (= e!822619 (not (= lt!640830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640832 lt!640834 lt!640831 mask!2687))))))

(declare-fun b!1463639 () Bool)

(declare-fun res!992867 () Bool)

(declare-fun e!822617 () Bool)

(assert (=> b!1463639 (=> (not res!992867) (not e!822617))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463639 (= res!992867 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463640 () Bool)

(declare-fun res!992859 () Bool)

(assert (=> b!1463640 (=> (not res!992859) (not e!822612))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1463640 (= res!992859 (and (= (size!48216 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48216 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48216 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463641 () Bool)

(declare-fun e!822620 () Bool)

(assert (=> b!1463641 (= e!822620 e!822617)))

(declare-fun res!992853 () Bool)

(assert (=> b!1463641 (=> (not res!992853) (not e!822617))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463641 (= res!992853 (= lt!640830 (Intermediate!11918 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463641 (= lt!640830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640834 mask!2687) lt!640834 lt!640831 mask!2687))))

(assert (=> b!1463641 (= lt!640834 (select (store (arr!47666 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463642 () Bool)

(declare-fun e!822613 () Bool)

(assert (=> b!1463642 (= e!822617 (not e!822613))))

(declare-fun res!992869 () Bool)

(assert (=> b!1463642 (=> res!992869 e!822613)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1463642 (= res!992869 (or (and (= (select (arr!47666 a!2862) index!646) (select (store (arr!47666 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47666 a!2862) index!646) (select (arr!47666 a!2862) j!93))) (= (select (arr!47666 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822618 () Bool)

(assert (=> b!1463642 e!822618))

(declare-fun res!992863 () Bool)

(assert (=> b!1463642 (=> (not res!992863) (not e!822618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98756 (_ BitVec 32)) Bool)

(assert (=> b!1463642 (= res!992863 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49332 0))(
  ( (Unit!49333) )
))
(declare-fun lt!640836 () Unit!49332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49332)

(assert (=> b!1463642 (= lt!640836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!822614 () Bool)

(declare-fun b!1463643 () Bool)

(assert (=> b!1463643 (= e!822614 (= lt!640830 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640834 lt!640831 mask!2687)))))

(declare-fun b!1463644 () Bool)

(declare-fun res!992858 () Bool)

(assert (=> b!1463644 (=> (not res!992858) (not e!822612))))

(assert (=> b!1463644 (= res!992858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463646 () Bool)

(declare-fun res!992857 () Bool)

(assert (=> b!1463646 (=> (not res!992857) (not e!822612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463646 (= res!992857 (validKeyInArray!0 (select (arr!47666 a!2862) j!93)))))

(declare-fun b!1463647 () Bool)

(declare-fun res!992861 () Bool)

(declare-fun e!822611 () Bool)

(assert (=> b!1463647 (=> res!992861 e!822611)))

(declare-fun lt!640835 () SeekEntryResult!11918)

(assert (=> b!1463647 (= res!992861 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640832 (select (arr!47666 a!2862) j!93) a!2862 mask!2687) lt!640835)))))

(declare-fun b!1463648 () Bool)

(assert (=> b!1463648 (= e!822611 true)))

(declare-fun lt!640833 () Bool)

(assert (=> b!1463648 (= lt!640833 e!822619)))

(declare-fun c!134904 () Bool)

(assert (=> b!1463648 (= c!134904 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463649 () Bool)

(declare-fun res!992866 () Bool)

(assert (=> b!1463649 (=> (not res!992866) (not e!822612))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463649 (= res!992866 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48216 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48216 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48216 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463650 () Bool)

(declare-fun res!992864 () Bool)

(assert (=> b!1463650 (=> (not res!992864) (not e!822617))))

(assert (=> b!1463650 (= res!992864 e!822614)))

(declare-fun c!134903 () Bool)

(assert (=> b!1463650 (= c!134903 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463651 () Bool)

(declare-fun res!992854 () Bool)

(assert (=> b!1463651 (=> (not res!992854) (not e!822612))))

(assert (=> b!1463651 (= res!992854 (validKeyInArray!0 (select (arr!47666 a!2862) i!1006)))))

(declare-fun b!1463652 () Bool)

(assert (=> b!1463652 (= e!822618 (or (= (select (arr!47666 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47666 a!2862) intermediateBeforeIndex!19) (select (arr!47666 a!2862) j!93))))))

(declare-fun b!1463653 () Bool)

(declare-fun e!822615 () Bool)

(assert (=> b!1463653 (= e!822612 e!822615)))

(declare-fun res!992856 () Bool)

(assert (=> b!1463653 (=> (not res!992856) (not e!822615))))

(assert (=> b!1463653 (= res!992856 (= (select (store (arr!47666 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463653 (= lt!640831 (array!98757 (store (arr!47666 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48216 a!2862)))))

(declare-fun b!1463654 () Bool)

(declare-fun res!992852 () Bool)

(assert (=> b!1463654 (=> (not res!992852) (not e!822620))))

(assert (=> b!1463654 (= res!992852 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47666 a!2862) j!93) a!2862 mask!2687) lt!640835))))

(declare-fun b!1463655 () Bool)

(declare-fun res!992865 () Bool)

(assert (=> b!1463655 (=> (not res!992865) (not e!822618))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98756 (_ BitVec 32)) SeekEntryResult!11918)

(assert (=> b!1463655 (= res!992865 (= (seekEntryOrOpen!0 (select (arr!47666 a!2862) j!93) a!2862 mask!2687) (Found!11918 j!93)))))

(declare-fun b!1463656 () Bool)

(assert (=> b!1463656 (= e!822613 e!822611)))

(declare-fun res!992860 () Bool)

(assert (=> b!1463656 (=> res!992860 e!822611)))

(assert (=> b!1463656 (= res!992860 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640832 #b00000000000000000000000000000000) (bvsge lt!640832 (size!48216 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463656 (= lt!640832 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463657 () Bool)

(assert (=> b!1463657 (= e!822615 e!822620)))

(declare-fun res!992855 () Bool)

(assert (=> b!1463657 (=> (not res!992855) (not e!822620))))

(assert (=> b!1463657 (= res!992855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47666 a!2862) j!93) mask!2687) (select (arr!47666 a!2862) j!93) a!2862 mask!2687) lt!640835))))

(assert (=> b!1463657 (= lt!640835 (Intermediate!11918 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463658 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98756 (_ BitVec 32)) SeekEntryResult!11918)

(assert (=> b!1463658 (= e!822614 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640834 lt!640831 mask!2687) (seekEntryOrOpen!0 lt!640834 lt!640831 mask!2687)))))

(declare-fun res!992862 () Bool)

(assert (=> start!125308 (=> (not res!992862) (not e!822612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125308 (= res!992862 (validMask!0 mask!2687))))

(assert (=> start!125308 e!822612))

(assert (=> start!125308 true))

(declare-fun array_inv!36694 (array!98756) Bool)

(assert (=> start!125308 (array_inv!36694 a!2862)))

(declare-fun b!1463645 () Bool)

(assert (=> b!1463645 (= e!822619 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640832 intermediateAfterIndex!19 lt!640834 lt!640831 mask!2687) (seekEntryOrOpen!0 lt!640834 lt!640831 mask!2687))))))

(assert (= (and start!125308 res!992862) b!1463640))

(assert (= (and b!1463640 res!992859) b!1463651))

(assert (= (and b!1463651 res!992854) b!1463646))

(assert (= (and b!1463646 res!992857) b!1463644))

(assert (= (and b!1463644 res!992858) b!1463637))

(assert (= (and b!1463637 res!992868) b!1463649))

(assert (= (and b!1463649 res!992866) b!1463653))

(assert (= (and b!1463653 res!992856) b!1463657))

(assert (= (and b!1463657 res!992855) b!1463654))

(assert (= (and b!1463654 res!992852) b!1463641))

(assert (= (and b!1463641 res!992853) b!1463650))

(assert (= (and b!1463650 c!134903) b!1463643))

(assert (= (and b!1463650 (not c!134903)) b!1463658))

(assert (= (and b!1463650 res!992864) b!1463639))

(assert (= (and b!1463639 res!992867) b!1463642))

(assert (= (and b!1463642 res!992863) b!1463655))

(assert (= (and b!1463655 res!992865) b!1463652))

(assert (= (and b!1463642 (not res!992869)) b!1463656))

(assert (= (and b!1463656 (not res!992860)) b!1463647))

(assert (= (and b!1463647 (not res!992861)) b!1463648))

(assert (= (and b!1463648 c!134904) b!1463638))

(assert (= (and b!1463648 (not c!134904)) b!1463645))

(declare-fun m!1350949 () Bool)

(assert (=> b!1463658 m!1350949))

(declare-fun m!1350951 () Bool)

(assert (=> b!1463658 m!1350951))

(declare-fun m!1350953 () Bool)

(assert (=> b!1463638 m!1350953))

(declare-fun m!1350955 () Bool)

(assert (=> b!1463637 m!1350955))

(declare-fun m!1350957 () Bool)

(assert (=> start!125308 m!1350957))

(declare-fun m!1350959 () Bool)

(assert (=> start!125308 m!1350959))

(declare-fun m!1350961 () Bool)

(assert (=> b!1463655 m!1350961))

(assert (=> b!1463655 m!1350961))

(declare-fun m!1350963 () Bool)

(assert (=> b!1463655 m!1350963))

(assert (=> b!1463654 m!1350961))

(assert (=> b!1463654 m!1350961))

(declare-fun m!1350965 () Bool)

(assert (=> b!1463654 m!1350965))

(declare-fun m!1350967 () Bool)

(assert (=> b!1463656 m!1350967))

(assert (=> b!1463657 m!1350961))

(assert (=> b!1463657 m!1350961))

(declare-fun m!1350969 () Bool)

(assert (=> b!1463657 m!1350969))

(assert (=> b!1463657 m!1350969))

(assert (=> b!1463657 m!1350961))

(declare-fun m!1350971 () Bool)

(assert (=> b!1463657 m!1350971))

(declare-fun m!1350973 () Bool)

(assert (=> b!1463651 m!1350973))

(assert (=> b!1463651 m!1350973))

(declare-fun m!1350975 () Bool)

(assert (=> b!1463651 m!1350975))

(assert (=> b!1463647 m!1350961))

(assert (=> b!1463647 m!1350961))

(declare-fun m!1350977 () Bool)

(assert (=> b!1463647 m!1350977))

(declare-fun m!1350979 () Bool)

(assert (=> b!1463652 m!1350979))

(assert (=> b!1463652 m!1350961))

(assert (=> b!1463646 m!1350961))

(assert (=> b!1463646 m!1350961))

(declare-fun m!1350981 () Bool)

(assert (=> b!1463646 m!1350981))

(declare-fun m!1350983 () Bool)

(assert (=> b!1463645 m!1350983))

(assert (=> b!1463645 m!1350951))

(declare-fun m!1350985 () Bool)

(assert (=> b!1463642 m!1350985))

(declare-fun m!1350987 () Bool)

(assert (=> b!1463642 m!1350987))

(declare-fun m!1350989 () Bool)

(assert (=> b!1463642 m!1350989))

(declare-fun m!1350991 () Bool)

(assert (=> b!1463642 m!1350991))

(declare-fun m!1350993 () Bool)

(assert (=> b!1463642 m!1350993))

(assert (=> b!1463642 m!1350961))

(declare-fun m!1350995 () Bool)

(assert (=> b!1463643 m!1350995))

(assert (=> b!1463653 m!1350987))

(declare-fun m!1350997 () Bool)

(assert (=> b!1463653 m!1350997))

(declare-fun m!1350999 () Bool)

(assert (=> b!1463644 m!1350999))

(declare-fun m!1351001 () Bool)

(assert (=> b!1463641 m!1351001))

(assert (=> b!1463641 m!1351001))

(declare-fun m!1351003 () Bool)

(assert (=> b!1463641 m!1351003))

(assert (=> b!1463641 m!1350987))

(declare-fun m!1351005 () Bool)

(assert (=> b!1463641 m!1351005))

(push 1)

