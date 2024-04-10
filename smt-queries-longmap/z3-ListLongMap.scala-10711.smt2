; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125406 () Bool)

(assert start!125406)

(declare-fun b!1466871 () Bool)

(declare-fun res!995500 () Bool)

(declare-fun e!824032 () Bool)

(assert (=> b!1466871 (=> (not res!995500) (not e!824032))))

(declare-datatypes ((array!98854 0))(
  ( (array!98855 (arr!47715 (Array (_ BitVec 32) (_ BitVec 64))) (size!48265 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98854)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466871 (= res!995500 (validKeyInArray!0 (select (arr!47715 a!2862) j!93)))))

(declare-fun b!1466872 () Bool)

(declare-fun e!824031 () Bool)

(declare-fun e!824036 () Bool)

(assert (=> b!1466872 (= e!824031 e!824036)))

(declare-fun res!995510 () Bool)

(assert (=> b!1466872 (=> (not res!995510) (not e!824036))))

(declare-datatypes ((SeekEntryResult!11967 0))(
  ( (MissingZero!11967 (index!50260 (_ BitVec 32))) (Found!11967 (index!50261 (_ BitVec 32))) (Intermediate!11967 (undefined!12779 Bool) (index!50262 (_ BitVec 32)) (x!131832 (_ BitVec 32))) (Undefined!11967) (MissingVacant!11967 (index!50263 (_ BitVec 32))) )
))
(declare-fun lt!641915 () SeekEntryResult!11967)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466872 (= res!995510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47715 a!2862) j!93) mask!2687) (select (arr!47715 a!2862) j!93) a!2862 mask!2687) lt!641915))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466872 (= lt!641915 (Intermediate!11967 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466873 () Bool)

(declare-fun res!995506 () Bool)

(assert (=> b!1466873 (=> (not res!995506) (not e!824032))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466873 (= res!995506 (validKeyInArray!0 (select (arr!47715 a!2862) i!1006)))))

(declare-fun b!1466874 () Bool)

(declare-fun res!995499 () Bool)

(assert (=> b!1466874 (=> (not res!995499) (not e!824036))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466874 (= res!995499 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47715 a!2862) j!93) a!2862 mask!2687) lt!641915))))

(declare-fun lt!641914 () SeekEntryResult!11967)

(declare-fun lt!641916 () array!98854)

(declare-fun b!1466875 () Bool)

(declare-fun e!824039 () Bool)

(declare-fun lt!641913 () (_ BitVec 32))

(declare-fun lt!641912 () (_ BitVec 64))

(assert (=> b!1466875 (= e!824039 (not (= lt!641914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 lt!641912 lt!641916 mask!2687))))))

(declare-fun b!1466876 () Bool)

(declare-fun res!995513 () Bool)

(assert (=> b!1466876 (=> (not res!995513) (not e!824032))))

(assert (=> b!1466876 (= res!995513 (and (= (size!48265 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48265 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48265 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466877 () Bool)

(declare-fun res!995515 () Bool)

(declare-fun e!824035 () Bool)

(assert (=> b!1466877 (=> (not res!995515) (not e!824035))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466877 (= res!995515 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466878 () Bool)

(declare-fun res!995501 () Bool)

(assert (=> b!1466878 (=> (not res!995501) (not e!824032))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466878 (= res!995501 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48265 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48265 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48265 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466879 () Bool)

(assert (=> b!1466879 (= e!824036 e!824035)))

(declare-fun res!995498 () Bool)

(assert (=> b!1466879 (=> (not res!995498) (not e!824035))))

(assert (=> b!1466879 (= res!995498 (= lt!641914 (Intermediate!11967 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466879 (= lt!641914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641912 mask!2687) lt!641912 lt!641916 mask!2687))))

(assert (=> b!1466879 (= lt!641912 (select (store (arr!47715 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466880 () Bool)

(declare-fun res!995503 () Bool)

(declare-fun e!824033 () Bool)

(assert (=> b!1466880 (=> res!995503 e!824033)))

(assert (=> b!1466880 (= res!995503 e!824039)))

(declare-fun c!135198 () Bool)

(assert (=> b!1466880 (= c!135198 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466881 () Bool)

(declare-fun res!995502 () Bool)

(assert (=> b!1466881 (=> (not res!995502) (not e!824032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98854 (_ BitVec 32)) Bool)

(assert (=> b!1466881 (= res!995502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466882 () Bool)

(assert (=> b!1466882 (= e!824032 e!824031)))

(declare-fun res!995514 () Bool)

(assert (=> b!1466882 (=> (not res!995514) (not e!824031))))

(assert (=> b!1466882 (= res!995514 (= (select (store (arr!47715 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466882 (= lt!641916 (array!98855 (store (arr!47715 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48265 a!2862)))))

(declare-fun b!1466883 () Bool)

(declare-fun res!995507 () Bool)

(assert (=> b!1466883 (=> res!995507 e!824033)))

(assert (=> b!1466883 (= res!995507 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 (select (arr!47715 a!2862) j!93) a!2862 mask!2687) lt!641915)))))

(declare-fun b!1466884 () Bool)

(declare-fun e!824034 () Bool)

(assert (=> b!1466884 (= e!824034 (= lt!641914 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641912 lt!641916 mask!2687)))))

(declare-fun b!1466885 () Bool)

(declare-fun e!824038 () Bool)

(assert (=> b!1466885 (= e!824035 (not e!824038))))

(declare-fun res!995505 () Bool)

(assert (=> b!1466885 (=> res!995505 e!824038)))

(assert (=> b!1466885 (= res!995505 (or (and (= (select (arr!47715 a!2862) index!646) (select (store (arr!47715 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47715 a!2862) index!646) (select (arr!47715 a!2862) j!93))) (= (select (arr!47715 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641910 () SeekEntryResult!11967)

(assert (=> b!1466885 (and (= lt!641910 (Found!11967 j!93)) (or (= (select (arr!47715 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47715 a!2862) intermediateBeforeIndex!19) (select (arr!47715 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11967)

(assert (=> b!1466885 (= lt!641910 (seekEntryOrOpen!0 (select (arr!47715 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466885 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49430 0))(
  ( (Unit!49431) )
))
(declare-fun lt!641909 () Unit!49430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49430)

(assert (=> b!1466885 (= lt!641909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466886 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11967)

(assert (=> b!1466886 (= e!824034 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641912 lt!641916 mask!2687) (seekEntryOrOpen!0 lt!641912 lt!641916 mask!2687)))))

(declare-fun res!995511 () Bool)

(assert (=> start!125406 (=> (not res!995511) (not e!824032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125406 (= res!995511 (validMask!0 mask!2687))))

(assert (=> start!125406 e!824032))

(assert (=> start!125406 true))

(declare-fun array_inv!36743 (array!98854) Bool)

(assert (=> start!125406 (array_inv!36743 a!2862)))

(declare-fun b!1466887 () Bool)

(assert (=> b!1466887 (= e!824033 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1466887 (= lt!641910 (seekEntryOrOpen!0 lt!641912 lt!641916 mask!2687))))

(declare-fun lt!641911 () Unit!49430)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49430)

(assert (=> b!1466887 (= lt!641911 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466888 () Bool)

(declare-fun res!995509 () Bool)

(assert (=> b!1466888 (=> (not res!995509) (not e!824032))))

(declare-datatypes ((List!34216 0))(
  ( (Nil!34213) (Cons!34212 (h!35562 (_ BitVec 64)) (t!48910 List!34216)) )
))
(declare-fun arrayNoDuplicates!0 (array!98854 (_ BitVec 32) List!34216) Bool)

(assert (=> b!1466888 (= res!995509 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34213))))

(declare-fun b!1466889 () Bool)

(declare-fun res!995504 () Bool)

(assert (=> b!1466889 (=> res!995504 e!824033)))

(assert (=> b!1466889 (= res!995504 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466890 () Bool)

(assert (=> b!1466890 (= e!824038 e!824033)))

(declare-fun res!995508 () Bool)

(assert (=> b!1466890 (=> res!995508 e!824033)))

(assert (=> b!1466890 (= res!995508 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641913 #b00000000000000000000000000000000) (bvsge lt!641913 (size!48265 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466890 (= lt!641913 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466891 () Bool)

(declare-fun res!995512 () Bool)

(assert (=> b!1466891 (=> (not res!995512) (not e!824035))))

(assert (=> b!1466891 (= res!995512 e!824034)))

(declare-fun c!135197 () Bool)

(assert (=> b!1466891 (= c!135197 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466892 () Bool)

(assert (=> b!1466892 (= e!824039 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641913 intermediateAfterIndex!19 lt!641912 lt!641916 mask!2687) (seekEntryOrOpen!0 lt!641912 lt!641916 mask!2687))))))

(assert (= (and start!125406 res!995511) b!1466876))

(assert (= (and b!1466876 res!995513) b!1466873))

(assert (= (and b!1466873 res!995506) b!1466871))

(assert (= (and b!1466871 res!995500) b!1466881))

(assert (= (and b!1466881 res!995502) b!1466888))

(assert (= (and b!1466888 res!995509) b!1466878))

(assert (= (and b!1466878 res!995501) b!1466882))

(assert (= (and b!1466882 res!995514) b!1466872))

(assert (= (and b!1466872 res!995510) b!1466874))

(assert (= (and b!1466874 res!995499) b!1466879))

(assert (= (and b!1466879 res!995498) b!1466891))

(assert (= (and b!1466891 c!135197) b!1466884))

(assert (= (and b!1466891 (not c!135197)) b!1466886))

(assert (= (and b!1466891 res!995512) b!1466877))

(assert (= (and b!1466877 res!995515) b!1466885))

(assert (= (and b!1466885 (not res!995505)) b!1466890))

(assert (= (and b!1466890 (not res!995508)) b!1466883))

(assert (= (and b!1466883 (not res!995507)) b!1466880))

(assert (= (and b!1466880 c!135198) b!1466875))

(assert (= (and b!1466880 (not c!135198)) b!1466892))

(assert (= (and b!1466880 (not res!995503)) b!1466889))

(assert (= (and b!1466889 (not res!995504)) b!1466887))

(declare-fun m!1353823 () Bool)

(assert (=> b!1466885 m!1353823))

(declare-fun m!1353825 () Bool)

(assert (=> b!1466885 m!1353825))

(declare-fun m!1353827 () Bool)

(assert (=> b!1466885 m!1353827))

(declare-fun m!1353829 () Bool)

(assert (=> b!1466885 m!1353829))

(declare-fun m!1353831 () Bool)

(assert (=> b!1466885 m!1353831))

(declare-fun m!1353833 () Bool)

(assert (=> b!1466885 m!1353833))

(declare-fun m!1353835 () Bool)

(assert (=> b!1466885 m!1353835))

(declare-fun m!1353837 () Bool)

(assert (=> b!1466885 m!1353837))

(assert (=> b!1466885 m!1353833))

(declare-fun m!1353839 () Bool)

(assert (=> b!1466887 m!1353839))

(declare-fun m!1353841 () Bool)

(assert (=> b!1466887 m!1353841))

(declare-fun m!1353843 () Bool)

(assert (=> b!1466879 m!1353843))

(assert (=> b!1466879 m!1353843))

(declare-fun m!1353845 () Bool)

(assert (=> b!1466879 m!1353845))

(assert (=> b!1466879 m!1353825))

(declare-fun m!1353847 () Bool)

(assert (=> b!1466879 m!1353847))

(declare-fun m!1353849 () Bool)

(assert (=> b!1466884 m!1353849))

(assert (=> b!1466882 m!1353825))

(declare-fun m!1353851 () Bool)

(assert (=> b!1466882 m!1353851))

(declare-fun m!1353853 () Bool)

(assert (=> b!1466892 m!1353853))

(assert (=> b!1466892 m!1353839))

(declare-fun m!1353855 () Bool)

(assert (=> b!1466890 m!1353855))

(declare-fun m!1353857 () Bool)

(assert (=> start!125406 m!1353857))

(declare-fun m!1353859 () Bool)

(assert (=> start!125406 m!1353859))

(assert (=> b!1466872 m!1353833))

(assert (=> b!1466872 m!1353833))

(declare-fun m!1353861 () Bool)

(assert (=> b!1466872 m!1353861))

(assert (=> b!1466872 m!1353861))

(assert (=> b!1466872 m!1353833))

(declare-fun m!1353863 () Bool)

(assert (=> b!1466872 m!1353863))

(assert (=> b!1466883 m!1353833))

(assert (=> b!1466883 m!1353833))

(declare-fun m!1353865 () Bool)

(assert (=> b!1466883 m!1353865))

(declare-fun m!1353867 () Bool)

(assert (=> b!1466886 m!1353867))

(assert (=> b!1466886 m!1353839))

(declare-fun m!1353869 () Bool)

(assert (=> b!1466873 m!1353869))

(assert (=> b!1466873 m!1353869))

(declare-fun m!1353871 () Bool)

(assert (=> b!1466873 m!1353871))

(assert (=> b!1466874 m!1353833))

(assert (=> b!1466874 m!1353833))

(declare-fun m!1353873 () Bool)

(assert (=> b!1466874 m!1353873))

(declare-fun m!1353875 () Bool)

(assert (=> b!1466881 m!1353875))

(assert (=> b!1466871 m!1353833))

(assert (=> b!1466871 m!1353833))

(declare-fun m!1353877 () Bool)

(assert (=> b!1466871 m!1353877))

(declare-fun m!1353879 () Bool)

(assert (=> b!1466875 m!1353879))

(declare-fun m!1353881 () Bool)

(assert (=> b!1466888 m!1353881))

(check-sat (not b!1466872) (not b!1466884) (not b!1466871) (not b!1466888) (not b!1466887) (not b!1466885) (not b!1466883) (not b!1466875) (not b!1466890) (not b!1466879) (not b!1466874) (not b!1466873) (not b!1466886) (not start!125406) (not b!1466892) (not b!1466881))
(check-sat)
