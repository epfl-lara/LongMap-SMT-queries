; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129062 () Bool)

(assert start!129062)

(declare-fun res!1033866 () Bool)

(declare-fun e!844926 () Bool)

(assert (=> start!129062 (=> (not res!1033866) (not e!844926))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129062 (= res!1033866 (validMask!0 mask!2512))))

(assert (=> start!129062 e!844926))

(assert (=> start!129062 true))

(declare-datatypes ((array!100918 0))(
  ( (array!100919 (arr!48696 (Array (_ BitVec 32) (_ BitVec 64))) (size!49246 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100918)

(declare-fun array_inv!37724 (array!100918) Bool)

(assert (=> start!129062 (array_inv!37724 a!2804)))

(declare-fun b!1513951 () Bool)

(declare-fun res!1033858 () Bool)

(assert (=> b!1513951 (=> (not res!1033858) (not e!844926))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513951 (= res!1033858 (validKeyInArray!0 (select (arr!48696 a!2804) i!961)))))

(declare-fun b!1513952 () Bool)

(declare-fun res!1033867 () Bool)

(assert (=> b!1513952 (=> (not res!1033867) (not e!844926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100918 (_ BitVec 32)) Bool)

(assert (=> b!1513952 (= res!1033867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513953 () Bool)

(declare-fun res!1033857 () Bool)

(assert (=> b!1513953 (=> (not res!1033857) (not e!844926))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1513953 (= res!1033857 (validKeyInArray!0 (select (arr!48696 a!2804) j!70)))))

(declare-fun b!1513954 () Bool)

(declare-fun e!844928 () Bool)

(assert (=> b!1513954 (= e!844928 (not true))))

(declare-fun e!844925 () Bool)

(assert (=> b!1513954 e!844925))

(declare-fun res!1033860 () Bool)

(assert (=> b!1513954 (=> (not res!1033860) (not e!844925))))

(assert (=> b!1513954 (= res!1033860 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50602 0))(
  ( (Unit!50603) )
))
(declare-fun lt!656161 () Unit!50602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50602)

(assert (=> b!1513954 (= lt!656161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513955 () Bool)

(declare-fun res!1033864 () Bool)

(assert (=> b!1513955 (=> (not res!1033864) (not e!844926))))

(assert (=> b!1513955 (= res!1033864 (and (= (size!49246 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49246 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49246 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513956 () Bool)

(declare-fun res!1033855 () Bool)

(assert (=> b!1513956 (=> (not res!1033855) (not e!844926))))

(declare-datatypes ((List!35179 0))(
  ( (Nil!35176) (Cons!35175 (h!36587 (_ BitVec 64)) (t!49873 List!35179)) )
))
(declare-fun arrayNoDuplicates!0 (array!100918 (_ BitVec 32) List!35179) Bool)

(assert (=> b!1513956 (= res!1033855 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35176))))

(declare-fun b!1513957 () Bool)

(declare-fun e!844924 () Bool)

(assert (=> b!1513957 (= e!844924 e!844928)))

(declare-fun res!1033854 () Bool)

(assert (=> b!1513957 (=> (not res!1033854) (not e!844928))))

(declare-datatypes ((SeekEntryResult!12867 0))(
  ( (MissingZero!12867 (index!53863 (_ BitVec 32))) (Found!12867 (index!53864 (_ BitVec 32))) (Intermediate!12867 (undefined!13679 Bool) (index!53865 (_ BitVec 32)) (x!135577 (_ BitVec 32))) (Undefined!12867) (MissingVacant!12867 (index!53866 (_ BitVec 32))) )
))
(declare-fun lt!656160 () SeekEntryResult!12867)

(declare-fun lt!656163 () (_ BitVec 64))

(declare-fun lt!656162 () array!100918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513957 (= res!1033854 (= lt!656160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656163 mask!2512) lt!656163 lt!656162 mask!2512)))))

(assert (=> b!1513957 (= lt!656163 (select (store (arr!48696 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513957 (= lt!656162 (array!100919 (store (arr!48696 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49246 a!2804)))))

(declare-fun b!1513958 () Bool)

(declare-fun e!844930 () Bool)

(declare-fun e!844927 () Bool)

(assert (=> b!1513958 (= e!844930 e!844927)))

(declare-fun res!1033865 () Bool)

(assert (=> b!1513958 (=> (not res!1033865) (not e!844927))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12867)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12867)

(assert (=> b!1513958 (= res!1033865 (= (seekEntryOrOpen!0 (select (arr!48696 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48696 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513959 () Bool)

(declare-fun res!1033856 () Bool)

(assert (=> b!1513959 (=> (not res!1033856) (not e!844924))))

(declare-fun lt!656164 () SeekEntryResult!12867)

(assert (=> b!1513959 (= res!1033856 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48696 a!2804) j!70) a!2804 mask!2512) lt!656164))))

(declare-fun b!1513960 () Bool)

(assert (=> b!1513960 (= e!844925 e!844930)))

(declare-fun res!1033861 () Bool)

(assert (=> b!1513960 (=> res!1033861 e!844930)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513960 (= res!1033861 (or (not (= (select (arr!48696 a!2804) j!70) lt!656163)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48696 a!2804) index!487) (select (arr!48696 a!2804) j!70)) (not (= (select (arr!48696 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513961 () Bool)

(declare-fun res!1033862 () Bool)

(assert (=> b!1513961 (=> (not res!1033862) (not e!844925))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12867)

(assert (=> b!1513961 (= res!1033862 (= (seekEntry!0 (select (arr!48696 a!2804) j!70) a!2804 mask!2512) (Found!12867 j!70)))))

(declare-fun b!1513962 () Bool)

(assert (=> b!1513962 (= e!844927 (= (seekEntryOrOpen!0 lt!656163 lt!656162 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656163 lt!656162 mask!2512)))))

(declare-fun b!1513963 () Bool)

(declare-fun res!1033859 () Bool)

(assert (=> b!1513963 (=> (not res!1033859) (not e!844926))))

(assert (=> b!1513963 (= res!1033859 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49246 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49246 a!2804))))))

(declare-fun b!1513964 () Bool)

(assert (=> b!1513964 (= e!844926 e!844924)))

(declare-fun res!1033863 () Bool)

(assert (=> b!1513964 (=> (not res!1033863) (not e!844924))))

(assert (=> b!1513964 (= res!1033863 (= lt!656160 lt!656164))))

(assert (=> b!1513964 (= lt!656164 (Intermediate!12867 false resIndex!21 resX!21))))

(assert (=> b!1513964 (= lt!656160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48696 a!2804) j!70) mask!2512) (select (arr!48696 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129062 res!1033866) b!1513955))

(assert (= (and b!1513955 res!1033864) b!1513951))

(assert (= (and b!1513951 res!1033858) b!1513953))

(assert (= (and b!1513953 res!1033857) b!1513952))

(assert (= (and b!1513952 res!1033867) b!1513956))

(assert (= (and b!1513956 res!1033855) b!1513963))

(assert (= (and b!1513963 res!1033859) b!1513964))

(assert (= (and b!1513964 res!1033863) b!1513959))

(assert (= (and b!1513959 res!1033856) b!1513957))

(assert (= (and b!1513957 res!1033854) b!1513954))

(assert (= (and b!1513954 res!1033860) b!1513961))

(assert (= (and b!1513961 res!1033862) b!1513960))

(assert (= (and b!1513960 (not res!1033861)) b!1513958))

(assert (= (and b!1513958 res!1033865) b!1513962))

(declare-fun m!1396859 () Bool)

(assert (=> b!1513957 m!1396859))

(assert (=> b!1513957 m!1396859))

(declare-fun m!1396861 () Bool)

(assert (=> b!1513957 m!1396861))

(declare-fun m!1396863 () Bool)

(assert (=> b!1513957 m!1396863))

(declare-fun m!1396865 () Bool)

(assert (=> b!1513957 m!1396865))

(declare-fun m!1396867 () Bool)

(assert (=> b!1513952 m!1396867))

(declare-fun m!1396869 () Bool)

(assert (=> b!1513962 m!1396869))

(declare-fun m!1396871 () Bool)

(assert (=> b!1513962 m!1396871))

(declare-fun m!1396873 () Bool)

(assert (=> b!1513956 m!1396873))

(declare-fun m!1396875 () Bool)

(assert (=> b!1513954 m!1396875))

(declare-fun m!1396877 () Bool)

(assert (=> b!1513954 m!1396877))

(declare-fun m!1396879 () Bool)

(assert (=> b!1513964 m!1396879))

(assert (=> b!1513964 m!1396879))

(declare-fun m!1396881 () Bool)

(assert (=> b!1513964 m!1396881))

(assert (=> b!1513964 m!1396881))

(assert (=> b!1513964 m!1396879))

(declare-fun m!1396883 () Bool)

(assert (=> b!1513964 m!1396883))

(declare-fun m!1396885 () Bool)

(assert (=> start!129062 m!1396885))

(declare-fun m!1396887 () Bool)

(assert (=> start!129062 m!1396887))

(assert (=> b!1513958 m!1396879))

(assert (=> b!1513958 m!1396879))

(declare-fun m!1396889 () Bool)

(assert (=> b!1513958 m!1396889))

(assert (=> b!1513958 m!1396879))

(declare-fun m!1396891 () Bool)

(assert (=> b!1513958 m!1396891))

(assert (=> b!1513959 m!1396879))

(assert (=> b!1513959 m!1396879))

(declare-fun m!1396893 () Bool)

(assert (=> b!1513959 m!1396893))

(assert (=> b!1513953 m!1396879))

(assert (=> b!1513953 m!1396879))

(declare-fun m!1396895 () Bool)

(assert (=> b!1513953 m!1396895))

(assert (=> b!1513961 m!1396879))

(assert (=> b!1513961 m!1396879))

(declare-fun m!1396897 () Bool)

(assert (=> b!1513961 m!1396897))

(declare-fun m!1396899 () Bool)

(assert (=> b!1513951 m!1396899))

(assert (=> b!1513951 m!1396899))

(declare-fun m!1396901 () Bool)

(assert (=> b!1513951 m!1396901))

(assert (=> b!1513960 m!1396879))

(declare-fun m!1396903 () Bool)

(assert (=> b!1513960 m!1396903))

(check-sat (not b!1513961) (not b!1513957) (not b!1513964) (not b!1513951) (not b!1513958) (not start!129062) (not b!1513952) (not b!1513956) (not b!1513962) (not b!1513959) (not b!1513953) (not b!1513954))
(check-sat)
