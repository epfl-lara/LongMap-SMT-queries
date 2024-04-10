; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126928 () Bool)

(assert start!126928)

(declare-fun b!1491868 () Bool)

(declare-fun res!1014993 () Bool)

(declare-fun e!835822 () Bool)

(assert (=> b!1491868 (=> (not res!1014993) (not e!835822))))

(declare-fun e!835820 () Bool)

(assert (=> b!1491868 (= res!1014993 e!835820)))

(declare-fun c!137967 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491868 (= c!137967 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491869 () Bool)

(declare-fun e!835819 () Bool)

(assert (=> b!1491869 (= e!835819 e!835822)))

(declare-fun res!1014994 () Bool)

(assert (=> b!1491869 (=> (not res!1014994) (not e!835822))))

(declare-datatypes ((SeekEntryResult!12362 0))(
  ( (MissingZero!12362 (index!51840 (_ BitVec 32))) (Found!12362 (index!51841 (_ BitVec 32))) (Intermediate!12362 (undefined!13174 Bool) (index!51842 (_ BitVec 32)) (x!133426 (_ BitVec 32))) (Undefined!12362) (MissingVacant!12362 (index!51843 (_ BitVec 32))) )
))
(declare-fun lt!650423 () SeekEntryResult!12362)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491869 (= res!1014994 (= lt!650423 (Intermediate!12362 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99701 0))(
  ( (array!99702 (arr!48122 (Array (_ BitVec 32) (_ BitVec 64))) (size!48672 (_ BitVec 32))) )
))
(declare-fun lt!650421 () array!99701)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650422 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99701 (_ BitVec 32)) SeekEntryResult!12362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491869 (= lt!650423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650422 mask!2687) lt!650422 lt!650421 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99701)

(assert (=> b!1491869 (= lt!650422 (select (store (arr!48122 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491870 () Bool)

(declare-fun res!1015003 () Bool)

(declare-fun e!835817 () Bool)

(assert (=> b!1491870 (=> (not res!1015003) (not e!835817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491870 (= res!1015003 (validKeyInArray!0 (select (arr!48122 a!2862) j!93)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1491871 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99701 (_ BitVec 32)) SeekEntryResult!12362)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99701 (_ BitVec 32)) SeekEntryResult!12362)

(assert (=> b!1491871 (= e!835820 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650422 lt!650421 mask!2687) (seekEntryOrOpen!0 lt!650422 lt!650421 mask!2687)))))

(declare-fun b!1491872 () Bool)

(declare-fun e!835821 () Bool)

(assert (=> b!1491872 (= e!835817 e!835821)))

(declare-fun res!1014991 () Bool)

(assert (=> b!1491872 (=> (not res!1014991) (not e!835821))))

(assert (=> b!1491872 (= res!1014991 (= (select (store (arr!48122 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491872 (= lt!650421 (array!99702 (store (arr!48122 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48672 a!2862)))))

(declare-fun b!1491874 () Bool)

(assert (=> b!1491874 (= e!835820 (= lt!650423 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650422 lt!650421 mask!2687)))))

(declare-fun b!1491875 () Bool)

(declare-fun res!1015000 () Bool)

(declare-fun e!835818 () Bool)

(assert (=> b!1491875 (=> (not res!1015000) (not e!835818))))

(assert (=> b!1491875 (= res!1015000 (= (seekEntryOrOpen!0 (select (arr!48122 a!2862) j!93) a!2862 mask!2687) (Found!12362 j!93)))))

(declare-fun b!1491876 () Bool)

(declare-fun res!1014998 () Bool)

(assert (=> b!1491876 (=> (not res!1014998) (not e!835817))))

(declare-datatypes ((List!34623 0))(
  ( (Nil!34620) (Cons!34619 (h!36002 (_ BitVec 64)) (t!49317 List!34623)) )
))
(declare-fun arrayNoDuplicates!0 (array!99701 (_ BitVec 32) List!34623) Bool)

(assert (=> b!1491876 (= res!1014998 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34620))))

(declare-fun b!1491877 () Bool)

(declare-fun res!1014997 () Bool)

(assert (=> b!1491877 (=> (not res!1014997) (not e!835817))))

(assert (=> b!1491877 (= res!1014997 (validKeyInArray!0 (select (arr!48122 a!2862) i!1006)))))

(declare-fun b!1491878 () Bool)

(declare-fun res!1015001 () Bool)

(assert (=> b!1491878 (=> (not res!1015001) (not e!835817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99701 (_ BitVec 32)) Bool)

(assert (=> b!1491878 (= res!1015001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491879 () Bool)

(declare-fun res!1014992 () Bool)

(assert (=> b!1491879 (=> (not res!1014992) (not e!835817))))

(assert (=> b!1491879 (= res!1014992 (and (= (size!48672 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48672 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48672 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491880 () Bool)

(assert (=> b!1491880 (= e!835821 e!835819)))

(declare-fun res!1014988 () Bool)

(assert (=> b!1491880 (=> (not res!1014988) (not e!835819))))

(declare-fun lt!650424 () SeekEntryResult!12362)

(assert (=> b!1491880 (= res!1014988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48122 a!2862) j!93) mask!2687) (select (arr!48122 a!2862) j!93) a!2862 mask!2687) lt!650424))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491880 (= lt!650424 (Intermediate!12362 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491881 () Bool)

(declare-fun e!835823 () Bool)

(assert (=> b!1491881 (= e!835822 (not e!835823))))

(declare-fun res!1014999 () Bool)

(assert (=> b!1491881 (=> res!1014999 e!835823)))

(assert (=> b!1491881 (= res!1014999 (or (and (= (select (arr!48122 a!2862) index!646) (select (store (arr!48122 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48122 a!2862) index!646) (select (arr!48122 a!2862) j!93))) (= (select (arr!48122 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491881 e!835818))

(declare-fun res!1014990 () Bool)

(assert (=> b!1491881 (=> (not res!1014990) (not e!835818))))

(assert (=> b!1491881 (= res!1014990 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50064 0))(
  ( (Unit!50065) )
))
(declare-fun lt!650419 () Unit!50064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50064)

(assert (=> b!1491881 (= lt!650419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491882 () Bool)

(assert (=> b!1491882 (= e!835823 true)))

(declare-fun lt!650420 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491882 (= lt!650420 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491883 () Bool)

(declare-fun res!1014995 () Bool)

(assert (=> b!1491883 (=> (not res!1014995) (not e!835819))))

(assert (=> b!1491883 (= res!1014995 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48122 a!2862) j!93) a!2862 mask!2687) lt!650424))))

(declare-fun b!1491884 () Bool)

(declare-fun res!1015002 () Bool)

(assert (=> b!1491884 (=> (not res!1015002) (not e!835817))))

(assert (=> b!1491884 (= res!1015002 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48672 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48672 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48672 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491885 () Bool)

(declare-fun res!1014989 () Bool)

(assert (=> b!1491885 (=> (not res!1014989) (not e!835822))))

(assert (=> b!1491885 (= res!1014989 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491873 () Bool)

(assert (=> b!1491873 (= e!835818 (or (= (select (arr!48122 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48122 a!2862) intermediateBeforeIndex!19) (select (arr!48122 a!2862) j!93))))))

(declare-fun res!1014996 () Bool)

(assert (=> start!126928 (=> (not res!1014996) (not e!835817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126928 (= res!1014996 (validMask!0 mask!2687))))

(assert (=> start!126928 e!835817))

(assert (=> start!126928 true))

(declare-fun array_inv!37150 (array!99701) Bool)

(assert (=> start!126928 (array_inv!37150 a!2862)))

(assert (= (and start!126928 res!1014996) b!1491879))

(assert (= (and b!1491879 res!1014992) b!1491877))

(assert (= (and b!1491877 res!1014997) b!1491870))

(assert (= (and b!1491870 res!1015003) b!1491878))

(assert (= (and b!1491878 res!1015001) b!1491876))

(assert (= (and b!1491876 res!1014998) b!1491884))

(assert (= (and b!1491884 res!1015002) b!1491872))

(assert (= (and b!1491872 res!1014991) b!1491880))

(assert (= (and b!1491880 res!1014988) b!1491883))

(assert (= (and b!1491883 res!1014995) b!1491869))

(assert (= (and b!1491869 res!1014994) b!1491868))

(assert (= (and b!1491868 c!137967) b!1491874))

(assert (= (and b!1491868 (not c!137967)) b!1491871))

(assert (= (and b!1491868 res!1014993) b!1491885))

(assert (= (and b!1491885 res!1014989) b!1491881))

(assert (= (and b!1491881 res!1014990) b!1491875))

(assert (= (and b!1491875 res!1015000) b!1491873))

(assert (= (and b!1491881 (not res!1014999)) b!1491882))

(declare-fun m!1375975 () Bool)

(assert (=> b!1491873 m!1375975))

(declare-fun m!1375977 () Bool)

(assert (=> b!1491873 m!1375977))

(declare-fun m!1375979 () Bool)

(assert (=> b!1491869 m!1375979))

(assert (=> b!1491869 m!1375979))

(declare-fun m!1375981 () Bool)

(assert (=> b!1491869 m!1375981))

(declare-fun m!1375983 () Bool)

(assert (=> b!1491869 m!1375983))

(declare-fun m!1375985 () Bool)

(assert (=> b!1491869 m!1375985))

(declare-fun m!1375987 () Bool)

(assert (=> b!1491881 m!1375987))

(assert (=> b!1491881 m!1375983))

(declare-fun m!1375989 () Bool)

(assert (=> b!1491881 m!1375989))

(declare-fun m!1375991 () Bool)

(assert (=> b!1491881 m!1375991))

(declare-fun m!1375993 () Bool)

(assert (=> b!1491881 m!1375993))

(assert (=> b!1491881 m!1375977))

(assert (=> b!1491870 m!1375977))

(assert (=> b!1491870 m!1375977))

(declare-fun m!1375995 () Bool)

(assert (=> b!1491870 m!1375995))

(declare-fun m!1375997 () Bool)

(assert (=> b!1491876 m!1375997))

(assert (=> b!1491880 m!1375977))

(assert (=> b!1491880 m!1375977))

(declare-fun m!1375999 () Bool)

(assert (=> b!1491880 m!1375999))

(assert (=> b!1491880 m!1375999))

(assert (=> b!1491880 m!1375977))

(declare-fun m!1376001 () Bool)

(assert (=> b!1491880 m!1376001))

(declare-fun m!1376003 () Bool)

(assert (=> start!126928 m!1376003))

(declare-fun m!1376005 () Bool)

(assert (=> start!126928 m!1376005))

(assert (=> b!1491872 m!1375983))

(declare-fun m!1376007 () Bool)

(assert (=> b!1491872 m!1376007))

(declare-fun m!1376009 () Bool)

(assert (=> b!1491874 m!1376009))

(declare-fun m!1376011 () Bool)

(assert (=> b!1491878 m!1376011))

(assert (=> b!1491883 m!1375977))

(assert (=> b!1491883 m!1375977))

(declare-fun m!1376013 () Bool)

(assert (=> b!1491883 m!1376013))

(assert (=> b!1491875 m!1375977))

(assert (=> b!1491875 m!1375977))

(declare-fun m!1376015 () Bool)

(assert (=> b!1491875 m!1376015))

(declare-fun m!1376017 () Bool)

(assert (=> b!1491877 m!1376017))

(assert (=> b!1491877 m!1376017))

(declare-fun m!1376019 () Bool)

(assert (=> b!1491877 m!1376019))

(declare-fun m!1376021 () Bool)

(assert (=> b!1491882 m!1376021))

(declare-fun m!1376023 () Bool)

(assert (=> b!1491871 m!1376023))

(declare-fun m!1376025 () Bool)

(assert (=> b!1491871 m!1376025))

(push 1)

