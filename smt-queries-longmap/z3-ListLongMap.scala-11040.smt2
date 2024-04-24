; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129374 () Bool)

(assert start!129374)

(declare-fun b!1515993 () Bool)

(declare-fun res!1034726 () Bool)

(declare-fun e!846167 () Bool)

(assert (=> b!1515993 (=> (not res!1034726) (not e!846167))))

(declare-datatypes ((array!101044 0))(
  ( (array!101045 (arr!48754 (Array (_ BitVec 32) (_ BitVec 64))) (size!49305 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101044)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101044 (_ BitVec 32)) Bool)

(assert (=> b!1515993 (= res!1034726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515994 () Bool)

(declare-fun e!846170 () Bool)

(assert (=> b!1515994 (= e!846170 (not true))))

(declare-fun e!846166 () Bool)

(assert (=> b!1515994 e!846166))

(declare-fun res!1034719 () Bool)

(assert (=> b!1515994 (=> (not res!1034719) (not e!846166))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515994 (= res!1034719 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50539 0))(
  ( (Unit!50540) )
))
(declare-fun lt!656899 () Unit!50539)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50539)

(assert (=> b!1515994 (= lt!656899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515995 () Bool)

(declare-fun e!846165 () Bool)

(assert (=> b!1515995 (= e!846166 e!846165)))

(declare-fun res!1034720 () Bool)

(assert (=> b!1515995 (=> res!1034720 e!846165)))

(declare-fun lt!656898 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515995 (= res!1034720 (or (not (= (select (arr!48754 a!2804) j!70) lt!656898)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48754 a!2804) index!487) (select (arr!48754 a!2804) j!70)) (not (= (select (arr!48754 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515996 () Bool)

(declare-fun res!1034724 () Bool)

(assert (=> b!1515996 (=> (not res!1034724) (not e!846167))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515996 (= res!1034724 (and (= (size!49305 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49305 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49305 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515997 () Bool)

(declare-fun res!1034730 () Bool)

(assert (=> b!1515997 (=> (not res!1034730) (not e!846167))))

(declare-datatypes ((List!35224 0))(
  ( (Nil!35221) (Cons!35220 (h!36647 (_ BitVec 64)) (t!49910 List!35224)) )
))
(declare-fun arrayNoDuplicates!0 (array!101044 (_ BitVec 32) List!35224) Bool)

(assert (=> b!1515997 (= res!1034730 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35221))))

(declare-fun b!1515998 () Bool)

(declare-fun res!1034729 () Bool)

(assert (=> b!1515998 (=> (not res!1034729) (not e!846166))))

(declare-datatypes ((SeekEntryResult!12818 0))(
  ( (MissingZero!12818 (index!53667 (_ BitVec 32))) (Found!12818 (index!53668 (_ BitVec 32))) (Intermediate!12818 (undefined!13630 Bool) (index!53669 (_ BitVec 32)) (x!135581 (_ BitVec 32))) (Undefined!12818) (MissingVacant!12818 (index!53670 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12818)

(assert (=> b!1515998 (= res!1034729 (= (seekEntry!0 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) (Found!12818 j!70)))))

(declare-fun b!1515999 () Bool)

(declare-fun e!846168 () Bool)

(assert (=> b!1515999 (= e!846168 e!846170)))

(declare-fun res!1034732 () Bool)

(assert (=> b!1515999 (=> (not res!1034732) (not e!846170))))

(declare-fun lt!656901 () array!101044)

(declare-fun lt!656902 () SeekEntryResult!12818)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515999 (= res!1034732 (= lt!656902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656898 mask!2512) lt!656898 lt!656901 mask!2512)))))

(assert (=> b!1515999 (= lt!656898 (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515999 (= lt!656901 (array!101045 (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49305 a!2804)))))

(declare-fun b!1516000 () Bool)

(declare-fun res!1034727 () Bool)

(assert (=> b!1516000 (=> (not res!1034727) (not e!846167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516000 (= res!1034727 (validKeyInArray!0 (select (arr!48754 a!2804) j!70)))))

(declare-fun b!1516001 () Bool)

(declare-fun e!846171 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12818)

(assert (=> b!1516001 (= e!846171 (= (seekEntryOrOpen!0 lt!656898 lt!656901 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656898 lt!656901 mask!2512)))))

(declare-fun res!1034723 () Bool)

(assert (=> start!129374 (=> (not res!1034723) (not e!846167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129374 (= res!1034723 (validMask!0 mask!2512))))

(assert (=> start!129374 e!846167))

(assert (=> start!129374 true))

(declare-fun array_inv!38035 (array!101044) Bool)

(assert (=> start!129374 (array_inv!38035 a!2804)))

(declare-fun b!1516002 () Bool)

(assert (=> b!1516002 (= e!846167 e!846168)))

(declare-fun res!1034722 () Bool)

(assert (=> b!1516002 (=> (not res!1034722) (not e!846168))))

(declare-fun lt!656900 () SeekEntryResult!12818)

(assert (=> b!1516002 (= res!1034722 (= lt!656902 lt!656900))))

(assert (=> b!1516002 (= lt!656900 (Intermediate!12818 false resIndex!21 resX!21))))

(assert (=> b!1516002 (= lt!656902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48754 a!2804) j!70) mask!2512) (select (arr!48754 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516003 () Bool)

(declare-fun res!1034725 () Bool)

(assert (=> b!1516003 (=> (not res!1034725) (not e!846168))))

(assert (=> b!1516003 (= res!1034725 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) lt!656900))))

(declare-fun b!1516004 () Bool)

(declare-fun res!1034731 () Bool)

(assert (=> b!1516004 (=> (not res!1034731) (not e!846167))))

(assert (=> b!1516004 (= res!1034731 (validKeyInArray!0 (select (arr!48754 a!2804) i!961)))))

(declare-fun b!1516005 () Bool)

(declare-fun res!1034721 () Bool)

(assert (=> b!1516005 (=> (not res!1034721) (not e!846167))))

(assert (=> b!1516005 (= res!1034721 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49305 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49305 a!2804))))))

(declare-fun b!1516006 () Bool)

(assert (=> b!1516006 (= e!846165 e!846171)))

(declare-fun res!1034728 () Bool)

(assert (=> b!1516006 (=> (not res!1034728) (not e!846171))))

(assert (=> b!1516006 (= res!1034728 (= (seekEntryOrOpen!0 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48754 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129374 res!1034723) b!1515996))

(assert (= (and b!1515996 res!1034724) b!1516004))

(assert (= (and b!1516004 res!1034731) b!1516000))

(assert (= (and b!1516000 res!1034727) b!1515993))

(assert (= (and b!1515993 res!1034726) b!1515997))

(assert (= (and b!1515997 res!1034730) b!1516005))

(assert (= (and b!1516005 res!1034721) b!1516002))

(assert (= (and b!1516002 res!1034722) b!1516003))

(assert (= (and b!1516003 res!1034725) b!1515999))

(assert (= (and b!1515999 res!1034732) b!1515994))

(assert (= (and b!1515994 res!1034719) b!1515998))

(assert (= (and b!1515998 res!1034729) b!1515995))

(assert (= (and b!1515995 (not res!1034720)) b!1516006))

(assert (= (and b!1516006 res!1034728) b!1516001))

(declare-fun m!1398885 () Bool)

(assert (=> b!1515999 m!1398885))

(assert (=> b!1515999 m!1398885))

(declare-fun m!1398887 () Bool)

(assert (=> b!1515999 m!1398887))

(declare-fun m!1398889 () Bool)

(assert (=> b!1515999 m!1398889))

(declare-fun m!1398891 () Bool)

(assert (=> b!1515999 m!1398891))

(declare-fun m!1398893 () Bool)

(assert (=> b!1515993 m!1398893))

(declare-fun m!1398895 () Bool)

(assert (=> b!1516003 m!1398895))

(assert (=> b!1516003 m!1398895))

(declare-fun m!1398897 () Bool)

(assert (=> b!1516003 m!1398897))

(declare-fun m!1398899 () Bool)

(assert (=> start!129374 m!1398899))

(declare-fun m!1398901 () Bool)

(assert (=> start!129374 m!1398901))

(declare-fun m!1398903 () Bool)

(assert (=> b!1516004 m!1398903))

(assert (=> b!1516004 m!1398903))

(declare-fun m!1398905 () Bool)

(assert (=> b!1516004 m!1398905))

(declare-fun m!1398907 () Bool)

(assert (=> b!1516001 m!1398907))

(declare-fun m!1398909 () Bool)

(assert (=> b!1516001 m!1398909))

(declare-fun m!1398911 () Bool)

(assert (=> b!1515997 m!1398911))

(assert (=> b!1516000 m!1398895))

(assert (=> b!1516000 m!1398895))

(declare-fun m!1398913 () Bool)

(assert (=> b!1516000 m!1398913))

(assert (=> b!1516006 m!1398895))

(assert (=> b!1516006 m!1398895))

(declare-fun m!1398915 () Bool)

(assert (=> b!1516006 m!1398915))

(assert (=> b!1516006 m!1398895))

(declare-fun m!1398917 () Bool)

(assert (=> b!1516006 m!1398917))

(assert (=> b!1515998 m!1398895))

(assert (=> b!1515998 m!1398895))

(declare-fun m!1398919 () Bool)

(assert (=> b!1515998 m!1398919))

(assert (=> b!1515995 m!1398895))

(declare-fun m!1398921 () Bool)

(assert (=> b!1515995 m!1398921))

(declare-fun m!1398923 () Bool)

(assert (=> b!1515994 m!1398923))

(declare-fun m!1398925 () Bool)

(assert (=> b!1515994 m!1398925))

(assert (=> b!1516002 m!1398895))

(assert (=> b!1516002 m!1398895))

(declare-fun m!1398927 () Bool)

(assert (=> b!1516002 m!1398927))

(assert (=> b!1516002 m!1398927))

(assert (=> b!1516002 m!1398895))

(declare-fun m!1398929 () Bool)

(assert (=> b!1516002 m!1398929))

(check-sat (not b!1516000) (not start!129374) (not b!1516001) (not b!1515993) (not b!1516006) (not b!1515998) (not b!1515999) (not b!1515997) (not b!1516002) (not b!1515994) (not b!1516003) (not b!1516004))
(check-sat)
