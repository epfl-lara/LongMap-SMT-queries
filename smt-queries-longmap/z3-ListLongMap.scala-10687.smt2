; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125230 () Bool)

(assert start!125230)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821776 () Bool)

(declare-fun b!1461858 () Bool)

(declare-datatypes ((array!98656 0))(
  ( (array!98657 (arr!47617 (Array (_ BitVec 32) (_ BitVec 64))) (size!48169 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98656)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461858 (= e!821776 (or (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) (select (arr!47617 a!2862) j!93))))))

(declare-fun b!1461859 () Bool)

(declare-fun res!991489 () Bool)

(declare-fun e!821779 () Bool)

(assert (=> b!1461859 (=> (not res!991489) (not e!821779))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11894 0))(
  ( (MissingZero!11894 (index!49968 (_ BitVec 32))) (Found!11894 (index!49969 (_ BitVec 32))) (Intermediate!11894 (undefined!12706 Bool) (index!49970 (_ BitVec 32)) (x!131562 (_ BitVec 32))) (Undefined!11894) (MissingVacant!11894 (index!49971 (_ BitVec 32))) )
))
(declare-fun lt!640094 () SeekEntryResult!11894)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11894)

(assert (=> b!1461859 (= res!991489 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!640094))))

(declare-fun b!1461860 () Bool)

(declare-fun e!821778 () Bool)

(assert (=> b!1461860 (= e!821779 e!821778)))

(declare-fun res!991479 () Bool)

(assert (=> b!1461860 (=> (not res!991479) (not e!821778))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!640098 () SeekEntryResult!11894)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461860 (= res!991479 (= lt!640098 (Intermediate!11894 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640095 () array!98656)

(declare-fun lt!640096 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461860 (= lt!640098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640096 mask!2687) lt!640096 lt!640095 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461860 (= lt!640096 (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461861 () Bool)

(declare-fun e!821783 () Bool)

(assert (=> b!1461861 (= e!821778 (not e!821783))))

(declare-fun res!991486 () Bool)

(assert (=> b!1461861 (=> res!991486 e!821783)))

(assert (=> b!1461861 (= res!991486 (or (and (= (select (arr!47617 a!2862) index!646) (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47617 a!2862) index!646) (select (arr!47617 a!2862) j!93))) (= (select (arr!47617 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461861 e!821776))

(declare-fun res!991487 () Bool)

(assert (=> b!1461861 (=> (not res!991487) (not e!821776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98656 (_ BitVec 32)) Bool)

(assert (=> b!1461861 (= res!991487 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49125 0))(
  ( (Unit!49126) )
))
(declare-fun lt!640093 () Unit!49125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49125)

(assert (=> b!1461861 (= lt!640093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461862 () Bool)

(declare-fun e!821781 () Bool)

(assert (=> b!1461862 (= e!821781 e!821779)))

(declare-fun res!991481 () Bool)

(assert (=> b!1461862 (=> (not res!991481) (not e!821779))))

(assert (=> b!1461862 (= res!991481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47617 a!2862) j!93) mask!2687) (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!640094))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461862 (= lt!640094 (Intermediate!11894 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461863 () Bool)

(declare-fun res!991495 () Bool)

(declare-fun e!821775 () Bool)

(assert (=> b!1461863 (=> (not res!991495) (not e!821775))))

(assert (=> b!1461863 (= res!991495 (and (= (size!48169 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48169 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48169 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!640097 () (_ BitVec 32))

(declare-fun e!821784 () Bool)

(declare-fun b!1461864 () Bool)

(assert (=> b!1461864 (= e!821784 (not (= lt!640098 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 lt!640096 lt!640095 mask!2687))))))

(declare-fun b!1461865 () Bool)

(declare-fun res!991483 () Bool)

(declare-fun e!821782 () Bool)

(assert (=> b!1461865 (=> res!991483 e!821782)))

(assert (=> b!1461865 (= res!991483 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!640094)))))

(declare-fun b!1461866 () Bool)

(declare-fun res!991491 () Bool)

(assert (=> b!1461866 (=> (not res!991491) (not e!821775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461866 (= res!991491 (validKeyInArray!0 (select (arr!47617 a!2862) i!1006)))))

(declare-fun b!1461867 () Bool)

(declare-fun res!991482 () Bool)

(assert (=> b!1461867 (=> (not res!991482) (not e!821775))))

(assert (=> b!1461867 (= res!991482 (validKeyInArray!0 (select (arr!47617 a!2862) j!93)))))

(declare-fun e!821777 () Bool)

(declare-fun b!1461868 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11894)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11894)

(assert (=> b!1461868 (= e!821777 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640096 lt!640095 mask!2687) (seekEntryOrOpen!0 lt!640096 lt!640095 mask!2687)))))

(declare-fun b!1461869 () Bool)

(assert (=> b!1461869 (= e!821784 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 intermediateAfterIndex!19 lt!640096 lt!640095 mask!2687) (seekEntryOrOpen!0 lt!640096 lt!640095 mask!2687))))))

(declare-fun b!1461870 () Bool)

(declare-fun res!991492 () Bool)

(assert (=> b!1461870 (=> (not res!991492) (not e!821778))))

(assert (=> b!1461870 (= res!991492 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461871 () Bool)

(declare-fun res!991493 () Bool)

(assert (=> b!1461871 (=> (not res!991493) (not e!821775))))

(assert (=> b!1461871 (= res!991493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461872 () Bool)

(declare-fun res!991484 () Bool)

(assert (=> b!1461872 (=> (not res!991484) (not e!821778))))

(assert (=> b!1461872 (= res!991484 e!821777)))

(declare-fun c!134704 () Bool)

(assert (=> b!1461872 (= c!134704 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!991490 () Bool)

(assert (=> start!125230 (=> (not res!991490) (not e!821775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125230 (= res!991490 (validMask!0 mask!2687))))

(assert (=> start!125230 e!821775))

(assert (=> start!125230 true))

(declare-fun array_inv!36850 (array!98656) Bool)

(assert (=> start!125230 (array_inv!36850 a!2862)))

(declare-fun b!1461873 () Bool)

(assert (=> b!1461873 (= e!821775 e!821781)))

(declare-fun res!991478 () Bool)

(assert (=> b!1461873 (=> (not res!991478) (not e!821781))))

(assert (=> b!1461873 (= res!991478 (= (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461873 (= lt!640095 (array!98657 (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48169 a!2862)))))

(declare-fun b!1461874 () Bool)

(assert (=> b!1461874 (= e!821777 (= lt!640098 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640096 lt!640095 mask!2687)))))

(declare-fun b!1461875 () Bool)

(assert (=> b!1461875 (= e!821782 true)))

(declare-fun lt!640092 () Bool)

(assert (=> b!1461875 (= lt!640092 e!821784)))

(declare-fun c!134703 () Bool)

(assert (=> b!1461875 (= c!134703 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461876 () Bool)

(assert (=> b!1461876 (= e!821783 e!821782)))

(declare-fun res!991488 () Bool)

(assert (=> b!1461876 (=> res!991488 e!821782)))

(assert (=> b!1461876 (= res!991488 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640097 #b00000000000000000000000000000000) (bvsge lt!640097 (size!48169 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461876 (= lt!640097 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461877 () Bool)

(declare-fun res!991480 () Bool)

(assert (=> b!1461877 (=> (not res!991480) (not e!821775))))

(declare-datatypes ((List!34196 0))(
  ( (Nil!34193) (Cons!34192 (h!35542 (_ BitVec 64)) (t!48882 List!34196)) )
))
(declare-fun arrayNoDuplicates!0 (array!98656 (_ BitVec 32) List!34196) Bool)

(assert (=> b!1461877 (= res!991480 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34193))))

(declare-fun b!1461878 () Bool)

(declare-fun res!991494 () Bool)

(assert (=> b!1461878 (=> (not res!991494) (not e!821775))))

(assert (=> b!1461878 (= res!991494 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48169 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48169 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48169 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461879 () Bool)

(declare-fun res!991485 () Bool)

(assert (=> b!1461879 (=> (not res!991485) (not e!821776))))

(assert (=> b!1461879 (= res!991485 (= (seekEntryOrOpen!0 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) (Found!11894 j!93)))))

(assert (= (and start!125230 res!991490) b!1461863))

(assert (= (and b!1461863 res!991495) b!1461866))

(assert (= (and b!1461866 res!991491) b!1461867))

(assert (= (and b!1461867 res!991482) b!1461871))

(assert (= (and b!1461871 res!991493) b!1461877))

(assert (= (and b!1461877 res!991480) b!1461878))

(assert (= (and b!1461878 res!991494) b!1461873))

(assert (= (and b!1461873 res!991478) b!1461862))

(assert (= (and b!1461862 res!991481) b!1461859))

(assert (= (and b!1461859 res!991489) b!1461860))

(assert (= (and b!1461860 res!991479) b!1461872))

(assert (= (and b!1461872 c!134704) b!1461874))

(assert (= (and b!1461872 (not c!134704)) b!1461868))

(assert (= (and b!1461872 res!991484) b!1461870))

(assert (= (and b!1461870 res!991492) b!1461861))

(assert (= (and b!1461861 res!991487) b!1461879))

(assert (= (and b!1461879 res!991485) b!1461858))

(assert (= (and b!1461861 (not res!991486)) b!1461876))

(assert (= (and b!1461876 (not res!991488)) b!1461865))

(assert (= (and b!1461865 (not res!991483)) b!1461875))

(assert (= (and b!1461875 c!134703) b!1461864))

(assert (= (and b!1461875 (not c!134703)) b!1461869))

(declare-fun m!1348881 () Bool)

(assert (=> b!1461859 m!1348881))

(assert (=> b!1461859 m!1348881))

(declare-fun m!1348883 () Bool)

(assert (=> b!1461859 m!1348883))

(assert (=> b!1461865 m!1348881))

(assert (=> b!1461865 m!1348881))

(declare-fun m!1348885 () Bool)

(assert (=> b!1461865 m!1348885))

(assert (=> b!1461867 m!1348881))

(assert (=> b!1461867 m!1348881))

(declare-fun m!1348887 () Bool)

(assert (=> b!1461867 m!1348887))

(declare-fun m!1348889 () Bool)

(assert (=> b!1461877 m!1348889))

(declare-fun m!1348891 () Bool)

(assert (=> b!1461873 m!1348891))

(declare-fun m!1348893 () Bool)

(assert (=> b!1461873 m!1348893))

(declare-fun m!1348895 () Bool)

(assert (=> b!1461858 m!1348895))

(assert (=> b!1461858 m!1348881))

(declare-fun m!1348897 () Bool)

(assert (=> b!1461874 m!1348897))

(assert (=> b!1461879 m!1348881))

(assert (=> b!1461879 m!1348881))

(declare-fun m!1348899 () Bool)

(assert (=> b!1461879 m!1348899))

(assert (=> b!1461862 m!1348881))

(assert (=> b!1461862 m!1348881))

(declare-fun m!1348901 () Bool)

(assert (=> b!1461862 m!1348901))

(assert (=> b!1461862 m!1348901))

(assert (=> b!1461862 m!1348881))

(declare-fun m!1348903 () Bool)

(assert (=> b!1461862 m!1348903))

(declare-fun m!1348905 () Bool)

(assert (=> b!1461869 m!1348905))

(declare-fun m!1348907 () Bool)

(assert (=> b!1461869 m!1348907))

(declare-fun m!1348909 () Bool)

(assert (=> b!1461866 m!1348909))

(assert (=> b!1461866 m!1348909))

(declare-fun m!1348911 () Bool)

(assert (=> b!1461866 m!1348911))

(declare-fun m!1348913 () Bool)

(assert (=> b!1461861 m!1348913))

(assert (=> b!1461861 m!1348891))

(declare-fun m!1348915 () Bool)

(assert (=> b!1461861 m!1348915))

(declare-fun m!1348917 () Bool)

(assert (=> b!1461861 m!1348917))

(declare-fun m!1348919 () Bool)

(assert (=> b!1461861 m!1348919))

(assert (=> b!1461861 m!1348881))

(declare-fun m!1348921 () Bool)

(assert (=> b!1461876 m!1348921))

(declare-fun m!1348923 () Bool)

(assert (=> b!1461868 m!1348923))

(assert (=> b!1461868 m!1348907))

(declare-fun m!1348925 () Bool)

(assert (=> b!1461860 m!1348925))

(assert (=> b!1461860 m!1348925))

(declare-fun m!1348927 () Bool)

(assert (=> b!1461860 m!1348927))

(assert (=> b!1461860 m!1348891))

(declare-fun m!1348929 () Bool)

(assert (=> b!1461860 m!1348929))

(declare-fun m!1348931 () Bool)

(assert (=> b!1461871 m!1348931))

(declare-fun m!1348933 () Bool)

(assert (=> start!125230 m!1348933))

(declare-fun m!1348935 () Bool)

(assert (=> start!125230 m!1348935))

(declare-fun m!1348937 () Bool)

(assert (=> b!1461864 m!1348937))

(check-sat (not b!1461865) (not b!1461871) (not b!1461876) (not start!125230) (not b!1461868) (not b!1461864) (not b!1461866) (not b!1461861) (not b!1461860) (not b!1461877) (not b!1461869) (not b!1461879) (not b!1461874) (not b!1461867) (not b!1461862) (not b!1461859))
(check-sat)
