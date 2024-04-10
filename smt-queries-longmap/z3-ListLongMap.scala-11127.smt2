; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130060 () Bool)

(assert start!130060)

(declare-fun b!1526146 () Bool)

(declare-fun e!850686 () Bool)

(declare-fun e!850690 () Bool)

(assert (=> b!1526146 (= e!850686 e!850690)))

(declare-fun res!1044190 () Bool)

(assert (=> b!1526146 (=> res!1044190 e!850690)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!660969 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101473 0))(
  ( (array!101474 (arr!48963 (Array (_ BitVec 32) (_ BitVec 64))) (size!49513 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101473)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526146 (= res!1044190 (or (not (= (select (arr!48963 a!2804) j!70) lt!660969)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48963 a!2804) index!487) (select (arr!48963 a!2804) j!70)) (not (= (select (arr!48963 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526147 () Bool)

(declare-fun res!1044185 () Bool)

(declare-fun e!850689 () Bool)

(assert (=> b!1526147 (=> (not res!1044185) (not e!850689))))

(declare-datatypes ((List!35446 0))(
  ( (Nil!35443) (Cons!35442 (h!36875 (_ BitVec 64)) (t!50140 List!35446)) )
))
(declare-fun arrayNoDuplicates!0 (array!101473 (_ BitVec 32) List!35446) Bool)

(assert (=> b!1526147 (= res!1044185 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35443))))

(declare-fun b!1526148 () Bool)

(declare-fun e!850684 () Bool)

(assert (=> b!1526148 (= e!850690 e!850684)))

(declare-fun res!1044181 () Bool)

(assert (=> b!1526148 (=> (not res!1044181) (not e!850684))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13128 0))(
  ( (MissingZero!13128 (index!54907 (_ BitVec 32))) (Found!13128 (index!54908 (_ BitVec 32))) (Intermediate!13128 (undefined!13940 Bool) (index!54909 (_ BitVec 32)) (x!136606 (_ BitVec 32))) (Undefined!13128) (MissingVacant!13128 (index!54910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13128)

(assert (=> b!1526148 (= res!1044181 (= (seekEntryOrOpen!0 (select (arr!48963 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48963 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526149 () Bool)

(declare-fun res!1044186 () Bool)

(assert (=> b!1526149 (=> (not res!1044186) (not e!850689))))

(assert (=> b!1526149 (= res!1044186 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49513 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49513 a!2804))))))

(declare-fun lt!660970 () array!101473)

(declare-fun b!1526150 () Bool)

(assert (=> b!1526150 (= e!850684 (= (seekEntryOrOpen!0 lt!660969 lt!660970 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660969 lt!660970 mask!2512)))))

(declare-fun res!1044184 () Bool)

(assert (=> start!130060 (=> (not res!1044184) (not e!850689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130060 (= res!1044184 (validMask!0 mask!2512))))

(assert (=> start!130060 e!850689))

(assert (=> start!130060 true))

(declare-fun array_inv!37991 (array!101473) Bool)

(assert (=> start!130060 (array_inv!37991 a!2804)))

(declare-fun b!1526151 () Bool)

(declare-fun res!1044182 () Bool)

(assert (=> b!1526151 (=> (not res!1044182) (not e!850689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101473 (_ BitVec 32)) Bool)

(assert (=> b!1526151 (= res!1044182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526152 () Bool)

(declare-fun e!850685 () Bool)

(declare-fun e!850688 () Bool)

(assert (=> b!1526152 (= e!850685 e!850688)))

(declare-fun res!1044191 () Bool)

(assert (=> b!1526152 (=> (not res!1044191) (not e!850688))))

(declare-fun lt!660971 () SeekEntryResult!13128)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526152 (= res!1044191 (= lt!660971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660969 mask!2512) lt!660969 lt!660970 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526152 (= lt!660969 (select (store (arr!48963 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526152 (= lt!660970 (array!101474 (store (arr!48963 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49513 a!2804)))))

(declare-fun b!1526153 () Bool)

(assert (=> b!1526153 (= e!850688 (not true))))

(assert (=> b!1526153 e!850686))

(declare-fun res!1044192 () Bool)

(assert (=> b!1526153 (=> (not res!1044192) (not e!850686))))

(assert (=> b!1526153 (= res!1044192 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51040 0))(
  ( (Unit!51041) )
))
(declare-fun lt!660972 () Unit!51040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51040)

(assert (=> b!1526153 (= lt!660972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526154 () Bool)

(declare-fun res!1044187 () Bool)

(assert (=> b!1526154 (=> (not res!1044187) (not e!850689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526154 (= res!1044187 (validKeyInArray!0 (select (arr!48963 a!2804) i!961)))))

(declare-fun b!1526155 () Bool)

(declare-fun res!1044188 () Bool)

(assert (=> b!1526155 (=> (not res!1044188) (not e!850689))))

(assert (=> b!1526155 (= res!1044188 (and (= (size!49513 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49513 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49513 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526156 () Bool)

(declare-fun res!1044180 () Bool)

(assert (=> b!1526156 (=> (not res!1044180) (not e!850686))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13128)

(assert (=> b!1526156 (= res!1044180 (= (seekEntry!0 (select (arr!48963 a!2804) j!70) a!2804 mask!2512) (Found!13128 j!70)))))

(declare-fun b!1526157 () Bool)

(assert (=> b!1526157 (= e!850689 e!850685)))

(declare-fun res!1044189 () Bool)

(assert (=> b!1526157 (=> (not res!1044189) (not e!850685))))

(declare-fun lt!660973 () SeekEntryResult!13128)

(assert (=> b!1526157 (= res!1044189 (= lt!660971 lt!660973))))

(assert (=> b!1526157 (= lt!660973 (Intermediate!13128 false resIndex!21 resX!21))))

(assert (=> b!1526157 (= lt!660971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48963 a!2804) j!70) mask!2512) (select (arr!48963 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526158 () Bool)

(declare-fun res!1044183 () Bool)

(assert (=> b!1526158 (=> (not res!1044183) (not e!850685))))

(assert (=> b!1526158 (= res!1044183 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48963 a!2804) j!70) a!2804 mask!2512) lt!660973))))

(declare-fun b!1526159 () Bool)

(declare-fun res!1044193 () Bool)

(assert (=> b!1526159 (=> (not res!1044193) (not e!850689))))

(assert (=> b!1526159 (= res!1044193 (validKeyInArray!0 (select (arr!48963 a!2804) j!70)))))

(assert (= (and start!130060 res!1044184) b!1526155))

(assert (= (and b!1526155 res!1044188) b!1526154))

(assert (= (and b!1526154 res!1044187) b!1526159))

(assert (= (and b!1526159 res!1044193) b!1526151))

(assert (= (and b!1526151 res!1044182) b!1526147))

(assert (= (and b!1526147 res!1044185) b!1526149))

(assert (= (and b!1526149 res!1044186) b!1526157))

(assert (= (and b!1526157 res!1044189) b!1526158))

(assert (= (and b!1526158 res!1044183) b!1526152))

(assert (= (and b!1526152 res!1044191) b!1526153))

(assert (= (and b!1526153 res!1044192) b!1526156))

(assert (= (and b!1526156 res!1044180) b!1526146))

(assert (= (and b!1526146 (not res!1044190)) b!1526148))

(assert (= (and b!1526148 res!1044181) b!1526150))

(declare-fun m!1408921 () Bool)

(assert (=> b!1526150 m!1408921))

(declare-fun m!1408923 () Bool)

(assert (=> b!1526150 m!1408923))

(declare-fun m!1408925 () Bool)

(assert (=> b!1526151 m!1408925))

(declare-fun m!1408927 () Bool)

(assert (=> b!1526154 m!1408927))

(assert (=> b!1526154 m!1408927))

(declare-fun m!1408929 () Bool)

(assert (=> b!1526154 m!1408929))

(declare-fun m!1408931 () Bool)

(assert (=> b!1526156 m!1408931))

(assert (=> b!1526156 m!1408931))

(declare-fun m!1408933 () Bool)

(assert (=> b!1526156 m!1408933))

(declare-fun m!1408935 () Bool)

(assert (=> b!1526153 m!1408935))

(declare-fun m!1408937 () Bool)

(assert (=> b!1526153 m!1408937))

(assert (=> b!1526158 m!1408931))

(assert (=> b!1526158 m!1408931))

(declare-fun m!1408939 () Bool)

(assert (=> b!1526158 m!1408939))

(assert (=> b!1526146 m!1408931))

(declare-fun m!1408941 () Bool)

(assert (=> b!1526146 m!1408941))

(declare-fun m!1408943 () Bool)

(assert (=> b!1526147 m!1408943))

(assert (=> b!1526159 m!1408931))

(assert (=> b!1526159 m!1408931))

(declare-fun m!1408945 () Bool)

(assert (=> b!1526159 m!1408945))

(declare-fun m!1408947 () Bool)

(assert (=> b!1526152 m!1408947))

(assert (=> b!1526152 m!1408947))

(declare-fun m!1408949 () Bool)

(assert (=> b!1526152 m!1408949))

(declare-fun m!1408951 () Bool)

(assert (=> b!1526152 m!1408951))

(declare-fun m!1408953 () Bool)

(assert (=> b!1526152 m!1408953))

(declare-fun m!1408955 () Bool)

(assert (=> start!130060 m!1408955))

(declare-fun m!1408957 () Bool)

(assert (=> start!130060 m!1408957))

(assert (=> b!1526157 m!1408931))

(assert (=> b!1526157 m!1408931))

(declare-fun m!1408959 () Bool)

(assert (=> b!1526157 m!1408959))

(assert (=> b!1526157 m!1408959))

(assert (=> b!1526157 m!1408931))

(declare-fun m!1408961 () Bool)

(assert (=> b!1526157 m!1408961))

(assert (=> b!1526148 m!1408931))

(assert (=> b!1526148 m!1408931))

(declare-fun m!1408963 () Bool)

(assert (=> b!1526148 m!1408963))

(assert (=> b!1526148 m!1408931))

(declare-fun m!1408965 () Bool)

(assert (=> b!1526148 m!1408965))

(check-sat (not b!1526153) (not b!1526156) (not start!130060) (not b!1526157) (not b!1526151) (not b!1526154) (not b!1526150) (not b!1526148) (not b!1526158) (not b!1526147) (not b!1526159) (not b!1526152))
(check-sat)
