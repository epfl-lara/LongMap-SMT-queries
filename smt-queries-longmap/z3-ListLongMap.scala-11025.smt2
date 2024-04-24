; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129284 () Bool)

(assert start!129284)

(declare-fun b!1514146 () Bool)

(declare-fun res!1032883 () Bool)

(declare-fun e!845299 () Bool)

(assert (=> b!1514146 (=> (not res!1032883) (not e!845299))))

(declare-datatypes ((array!100954 0))(
  ( (array!100955 (arr!48709 (Array (_ BitVec 32) (_ BitVec 64))) (size!49260 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100954)

(declare-datatypes ((List!35179 0))(
  ( (Nil!35176) (Cons!35175 (h!36602 (_ BitVec 64)) (t!49865 List!35179)) )
))
(declare-fun arrayNoDuplicates!0 (array!100954 (_ BitVec 32) List!35179) Bool)

(assert (=> b!1514146 (= res!1032883 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35176))))

(declare-fun e!845298 () Bool)

(declare-fun b!1514148 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12773 0))(
  ( (MissingZero!12773 (index!53487 (_ BitVec 32))) (Found!12773 (index!53488 (_ BitVec 32))) (Intermediate!12773 (undefined!13585 Bool) (index!53489 (_ BitVec 32)) (x!135416 (_ BitVec 32))) (Undefined!12773) (MissingVacant!12773 (index!53490 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12773)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12773)

(assert (=> b!1514148 (= e!845298 (= (seekEntryOrOpen!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514149 () Bool)

(declare-fun res!1032882 () Bool)

(assert (=> b!1514149 (=> (not res!1032882) (not e!845299))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514149 (= res!1032882 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49260 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49260 a!2804))))))

(declare-fun b!1514150 () Bool)

(declare-fun res!1032873 () Bool)

(assert (=> b!1514150 (=> (not res!1032873) (not e!845299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100954 (_ BitVec 32)) Bool)

(assert (=> b!1514150 (= res!1032873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514151 () Bool)

(declare-fun res!1032879 () Bool)

(declare-fun e!845300 () Bool)

(assert (=> b!1514151 (=> (not res!1032879) (not e!845300))))

(declare-fun lt!656311 () SeekEntryResult!12773)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12773)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514151 (= res!1032879 (= lt!656311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100955 (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49260 a!2804)) mask!2512)))))

(declare-fun b!1514152 () Bool)

(declare-fun res!1032872 () Bool)

(assert (=> b!1514152 (=> (not res!1032872) (not e!845299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514152 (= res!1032872 (validKeyInArray!0 (select (arr!48709 a!2804) i!961)))))

(declare-fun b!1514153 () Bool)

(declare-fun res!1032874 () Bool)

(assert (=> b!1514153 (=> (not res!1032874) (not e!845300))))

(declare-fun lt!656310 () SeekEntryResult!12773)

(assert (=> b!1514153 (= res!1032874 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) lt!656310))))

(declare-fun b!1514154 () Bool)

(declare-fun e!845301 () Bool)

(assert (=> b!1514154 (= e!845301 e!845298)))

(declare-fun res!1032881 () Bool)

(assert (=> b!1514154 (=> res!1032881 e!845298)))

(assert (=> b!1514154 (= res!1032881 (or (not (= (select (arr!48709 a!2804) j!70) (select (store (arr!48709 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48709 a!2804) index!487) (select (arr!48709 a!2804) j!70)) (not (= (select (arr!48709 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032884 () Bool)

(assert (=> start!129284 (=> (not res!1032884) (not e!845299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129284 (= res!1032884 (validMask!0 mask!2512))))

(assert (=> start!129284 e!845299))

(assert (=> start!129284 true))

(declare-fun array_inv!37990 (array!100954) Bool)

(assert (=> start!129284 (array_inv!37990 a!2804)))

(declare-fun b!1514147 () Bool)

(assert (=> b!1514147 (= e!845299 e!845300)))

(declare-fun res!1032876 () Bool)

(assert (=> b!1514147 (=> (not res!1032876) (not e!845300))))

(assert (=> b!1514147 (= res!1032876 (= lt!656311 lt!656310))))

(assert (=> b!1514147 (= lt!656310 (Intermediate!12773 false resIndex!21 resX!21))))

(assert (=> b!1514147 (= lt!656311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48709 a!2804) j!70) mask!2512) (select (arr!48709 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514155 () Bool)

(declare-fun res!1032875 () Bool)

(assert (=> b!1514155 (=> (not res!1032875) (not e!845301))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12773)

(assert (=> b!1514155 (= res!1032875 (= (seekEntry!0 (select (arr!48709 a!2804) j!70) a!2804 mask!2512) (Found!12773 j!70)))))

(declare-fun b!1514156 () Bool)

(declare-fun res!1032878 () Bool)

(assert (=> b!1514156 (=> (not res!1032878) (not e!845299))))

(assert (=> b!1514156 (= res!1032878 (validKeyInArray!0 (select (arr!48709 a!2804) j!70)))))

(declare-fun b!1514157 () Bool)

(assert (=> b!1514157 (= e!845300 (not true))))

(assert (=> b!1514157 e!845301))

(declare-fun res!1032877 () Bool)

(assert (=> b!1514157 (=> (not res!1032877) (not e!845301))))

(assert (=> b!1514157 (= res!1032877 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50449 0))(
  ( (Unit!50450) )
))
(declare-fun lt!656309 () Unit!50449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50449)

(assert (=> b!1514157 (= lt!656309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514158 () Bool)

(declare-fun res!1032880 () Bool)

(assert (=> b!1514158 (=> (not res!1032880) (not e!845299))))

(assert (=> b!1514158 (= res!1032880 (and (= (size!49260 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49260 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49260 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129284 res!1032884) b!1514158))

(assert (= (and b!1514158 res!1032880) b!1514152))

(assert (= (and b!1514152 res!1032872) b!1514156))

(assert (= (and b!1514156 res!1032878) b!1514150))

(assert (= (and b!1514150 res!1032873) b!1514146))

(assert (= (and b!1514146 res!1032883) b!1514149))

(assert (= (and b!1514149 res!1032882) b!1514147))

(assert (= (and b!1514147 res!1032876) b!1514153))

(assert (= (and b!1514153 res!1032874) b!1514151))

(assert (= (and b!1514151 res!1032879) b!1514157))

(assert (= (and b!1514157 res!1032877) b!1514155))

(assert (= (and b!1514155 res!1032875) b!1514154))

(assert (= (and b!1514154 (not res!1032881)) b!1514148))

(declare-fun m!1396869 () Bool)

(assert (=> b!1514148 m!1396869))

(assert (=> b!1514148 m!1396869))

(declare-fun m!1396871 () Bool)

(assert (=> b!1514148 m!1396871))

(assert (=> b!1514148 m!1396869))

(declare-fun m!1396873 () Bool)

(assert (=> b!1514148 m!1396873))

(assert (=> b!1514147 m!1396869))

(assert (=> b!1514147 m!1396869))

(declare-fun m!1396875 () Bool)

(assert (=> b!1514147 m!1396875))

(assert (=> b!1514147 m!1396875))

(assert (=> b!1514147 m!1396869))

(declare-fun m!1396877 () Bool)

(assert (=> b!1514147 m!1396877))

(declare-fun m!1396879 () Bool)

(assert (=> b!1514150 m!1396879))

(declare-fun m!1396881 () Bool)

(assert (=> b!1514152 m!1396881))

(assert (=> b!1514152 m!1396881))

(declare-fun m!1396883 () Bool)

(assert (=> b!1514152 m!1396883))

(assert (=> b!1514153 m!1396869))

(assert (=> b!1514153 m!1396869))

(declare-fun m!1396885 () Bool)

(assert (=> b!1514153 m!1396885))

(declare-fun m!1396887 () Bool)

(assert (=> b!1514157 m!1396887))

(declare-fun m!1396889 () Bool)

(assert (=> b!1514157 m!1396889))

(assert (=> b!1514154 m!1396869))

(declare-fun m!1396891 () Bool)

(assert (=> b!1514154 m!1396891))

(declare-fun m!1396893 () Bool)

(assert (=> b!1514154 m!1396893))

(declare-fun m!1396895 () Bool)

(assert (=> b!1514154 m!1396895))

(assert (=> b!1514151 m!1396891))

(assert (=> b!1514151 m!1396893))

(assert (=> b!1514151 m!1396893))

(declare-fun m!1396897 () Bool)

(assert (=> b!1514151 m!1396897))

(assert (=> b!1514151 m!1396897))

(assert (=> b!1514151 m!1396893))

(declare-fun m!1396899 () Bool)

(assert (=> b!1514151 m!1396899))

(declare-fun m!1396901 () Bool)

(assert (=> start!129284 m!1396901))

(declare-fun m!1396903 () Bool)

(assert (=> start!129284 m!1396903))

(declare-fun m!1396905 () Bool)

(assert (=> b!1514146 m!1396905))

(assert (=> b!1514155 m!1396869))

(assert (=> b!1514155 m!1396869))

(declare-fun m!1396907 () Bool)

(assert (=> b!1514155 m!1396907))

(assert (=> b!1514156 m!1396869))

(assert (=> b!1514156 m!1396869))

(declare-fun m!1396909 () Bool)

(assert (=> b!1514156 m!1396909))

(check-sat (not b!1514148) (not b!1514152) (not b!1514151) (not b!1514153) (not start!129284) (not b!1514147) (not b!1514146) (not b!1514150) (not b!1514157) (not b!1514156) (not b!1514155))
(check-sat)
