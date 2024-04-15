; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129242 () Bool)

(assert start!129242)

(declare-fun b!1518150 () Bool)

(declare-fun res!1038261 () Bool)

(declare-fun e!846885 () Bool)

(assert (=> b!1518150 (=> (not res!1038261) (not e!846885))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101098 0))(
  ( (array!101099 (arr!48787 (Array (_ BitVec 32) (_ BitVec 64))) (size!49339 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101098)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1518150 (= res!1038261 (and (= (size!49339 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49339 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49339 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518151 () Bool)

(declare-fun res!1038269 () Bool)

(assert (=> b!1518151 (=> (not res!1038269) (not e!846885))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518151 (= res!1038269 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49339 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49339 a!2804))))))

(declare-fun b!1518152 () Bool)

(declare-fun e!846891 () Bool)

(declare-fun e!846888 () Bool)

(assert (=> b!1518152 (= e!846891 e!846888)))

(declare-fun res!1038271 () Bool)

(assert (=> b!1518152 (=> (not res!1038271) (not e!846888))))

(declare-fun lt!657899 () (_ BitVec 64))

(declare-fun lt!657897 () array!101098)

(declare-datatypes ((SeekEntryResult!12981 0))(
  ( (MissingZero!12981 (index!54319 (_ BitVec 32))) (Found!12981 (index!54320 (_ BitVec 32))) (Intermediate!12981 (undefined!13793 Bool) (index!54321 (_ BitVec 32)) (x!135997 (_ BitVec 32))) (Undefined!12981) (MissingVacant!12981 (index!54322 (_ BitVec 32))) )
))
(declare-fun lt!657900 () SeekEntryResult!12981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518152 (= res!1038271 (= lt!657900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657899 mask!2512) lt!657899 lt!657897 mask!2512)))))

(assert (=> b!1518152 (= lt!657899 (select (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518152 (= lt!657897 (array!101099 (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49339 a!2804)))))

(declare-fun b!1518153 () Bool)

(assert (=> b!1518153 (= e!846885 e!846891)))

(declare-fun res!1038267 () Bool)

(assert (=> b!1518153 (=> (not res!1038267) (not e!846891))))

(declare-fun lt!657901 () SeekEntryResult!12981)

(assert (=> b!1518153 (= res!1038267 (= lt!657900 lt!657901))))

(assert (=> b!1518153 (= lt!657901 (Intermediate!12981 false resIndex!21 resX!21))))

(assert (=> b!1518153 (= lt!657900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48787 a!2804) j!70) mask!2512) (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518154 () Bool)

(declare-fun e!846890 () Bool)

(assert (=> b!1518154 (= e!846888 (not e!846890))))

(declare-fun res!1038262 () Bool)

(assert (=> b!1518154 (=> res!1038262 e!846890)))

(assert (=> b!1518154 (= res!1038262 (or (not (= (select (arr!48787 a!2804) j!70) lt!657899)) (= x!534 resX!21)))))

(declare-fun e!846887 () Bool)

(assert (=> b!1518154 e!846887))

(declare-fun res!1038259 () Bool)

(assert (=> b!1518154 (=> (not res!1038259) (not e!846887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101098 (_ BitVec 32)) Bool)

(assert (=> b!1518154 (= res!1038259 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50669 0))(
  ( (Unit!50670) )
))
(declare-fun lt!657903 () Unit!50669)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50669)

(assert (=> b!1518154 (= lt!657903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518155 () Bool)

(declare-fun res!1038263 () Bool)

(assert (=> b!1518155 (=> (not res!1038263) (not e!846885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518155 (= res!1038263 (validKeyInArray!0 (select (arr!48787 a!2804) j!70)))))

(declare-fun b!1518156 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12981)

(assert (=> b!1518156 (= e!846887 (= (seekEntry!0 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) (Found!12981 j!70)))))

(declare-fun b!1518157 () Bool)

(declare-fun res!1038266 () Bool)

(declare-fun e!846886 () Bool)

(assert (=> b!1518157 (=> res!1038266 e!846886)))

(declare-fun lt!657902 () (_ BitVec 32))

(assert (=> b!1518157 (= res!1038266 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657902 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) lt!657901)))))

(declare-fun res!1038270 () Bool)

(assert (=> start!129242 (=> (not res!1038270) (not e!846885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129242 (= res!1038270 (validMask!0 mask!2512))))

(assert (=> start!129242 e!846885))

(assert (=> start!129242 true))

(declare-fun array_inv!38020 (array!101098) Bool)

(assert (=> start!129242 (array_inv!38020 a!2804)))

(declare-fun b!1518158 () Bool)

(declare-fun res!1038260 () Bool)

(assert (=> b!1518158 (=> (not res!1038260) (not e!846885))))

(assert (=> b!1518158 (= res!1038260 (validKeyInArray!0 (select (arr!48787 a!2804) i!961)))))

(declare-fun b!1518159 () Bool)

(declare-fun res!1038268 () Bool)

(assert (=> b!1518159 (=> (not res!1038268) (not e!846885))))

(assert (=> b!1518159 (= res!1038268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518160 () Bool)

(declare-fun res!1038272 () Bool)

(assert (=> b!1518160 (=> (not res!1038272) (not e!846885))))

(declare-datatypes ((List!35348 0))(
  ( (Nil!35345) (Cons!35344 (h!36757 (_ BitVec 64)) (t!50034 List!35348)) )
))
(declare-fun arrayNoDuplicates!0 (array!101098 (_ BitVec 32) List!35348) Bool)

(assert (=> b!1518160 (= res!1038272 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35345))))

(declare-fun b!1518161 () Bool)

(assert (=> b!1518161 (= e!846886 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12981)

(assert (=> b!1518161 (= (seekEntryOrOpen!0 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!657899 lt!657897 mask!2512))))

(declare-fun lt!657898 () Unit!50669)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50669)

(assert (=> b!1518161 (= lt!657898 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!657902 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518162 () Bool)

(assert (=> b!1518162 (= e!846890 e!846886)))

(declare-fun res!1038265 () Bool)

(assert (=> b!1518162 (=> res!1038265 e!846886)))

(assert (=> b!1518162 (= res!1038265 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657902 #b00000000000000000000000000000000) (bvsge lt!657902 (size!49339 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518162 (= lt!657902 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518163 () Bool)

(declare-fun res!1038264 () Bool)

(assert (=> b!1518163 (=> (not res!1038264) (not e!846891))))

(assert (=> b!1518163 (= res!1038264 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) lt!657901))))

(assert (= (and start!129242 res!1038270) b!1518150))

(assert (= (and b!1518150 res!1038261) b!1518158))

(assert (= (and b!1518158 res!1038260) b!1518155))

(assert (= (and b!1518155 res!1038263) b!1518159))

(assert (= (and b!1518159 res!1038268) b!1518160))

(assert (= (and b!1518160 res!1038272) b!1518151))

(assert (= (and b!1518151 res!1038269) b!1518153))

(assert (= (and b!1518153 res!1038267) b!1518163))

(assert (= (and b!1518163 res!1038264) b!1518152))

(assert (= (and b!1518152 res!1038271) b!1518154))

(assert (= (and b!1518154 res!1038259) b!1518156))

(assert (= (and b!1518154 (not res!1038262)) b!1518162))

(assert (= (and b!1518162 (not res!1038265)) b!1518157))

(assert (= (and b!1518157 (not res!1038266)) b!1518161))

(declare-fun m!1400897 () Bool)

(assert (=> b!1518161 m!1400897))

(assert (=> b!1518161 m!1400897))

(declare-fun m!1400899 () Bool)

(assert (=> b!1518161 m!1400899))

(declare-fun m!1400901 () Bool)

(assert (=> b!1518161 m!1400901))

(declare-fun m!1400903 () Bool)

(assert (=> b!1518161 m!1400903))

(declare-fun m!1400905 () Bool)

(assert (=> b!1518159 m!1400905))

(assert (=> b!1518157 m!1400897))

(assert (=> b!1518157 m!1400897))

(declare-fun m!1400907 () Bool)

(assert (=> b!1518157 m!1400907))

(declare-fun m!1400909 () Bool)

(assert (=> b!1518160 m!1400909))

(assert (=> b!1518156 m!1400897))

(assert (=> b!1518156 m!1400897))

(declare-fun m!1400911 () Bool)

(assert (=> b!1518156 m!1400911))

(assert (=> b!1518155 m!1400897))

(assert (=> b!1518155 m!1400897))

(declare-fun m!1400913 () Bool)

(assert (=> b!1518155 m!1400913))

(declare-fun m!1400915 () Bool)

(assert (=> b!1518152 m!1400915))

(assert (=> b!1518152 m!1400915))

(declare-fun m!1400917 () Bool)

(assert (=> b!1518152 m!1400917))

(declare-fun m!1400919 () Bool)

(assert (=> b!1518152 m!1400919))

(declare-fun m!1400921 () Bool)

(assert (=> b!1518152 m!1400921))

(declare-fun m!1400923 () Bool)

(assert (=> start!129242 m!1400923))

(declare-fun m!1400925 () Bool)

(assert (=> start!129242 m!1400925))

(assert (=> b!1518163 m!1400897))

(assert (=> b!1518163 m!1400897))

(declare-fun m!1400927 () Bool)

(assert (=> b!1518163 m!1400927))

(assert (=> b!1518154 m!1400897))

(declare-fun m!1400929 () Bool)

(assert (=> b!1518154 m!1400929))

(declare-fun m!1400931 () Bool)

(assert (=> b!1518154 m!1400931))

(declare-fun m!1400933 () Bool)

(assert (=> b!1518162 m!1400933))

(declare-fun m!1400935 () Bool)

(assert (=> b!1518158 m!1400935))

(assert (=> b!1518158 m!1400935))

(declare-fun m!1400937 () Bool)

(assert (=> b!1518158 m!1400937))

(assert (=> b!1518153 m!1400897))

(assert (=> b!1518153 m!1400897))

(declare-fun m!1400939 () Bool)

(assert (=> b!1518153 m!1400939))

(assert (=> b!1518153 m!1400939))

(assert (=> b!1518153 m!1400897))

(declare-fun m!1400941 () Bool)

(assert (=> b!1518153 m!1400941))

(check-sat (not b!1518160) (not b!1518159) (not b!1518153) (not start!129242) (not b!1518154) (not b!1518163) (not b!1518152) (not b!1518162) (not b!1518158) (not b!1518156) (not b!1518155) (not b!1518157) (not b!1518161))
(check-sat)
