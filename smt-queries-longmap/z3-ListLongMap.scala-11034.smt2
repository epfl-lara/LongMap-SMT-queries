; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128984 () Bool)

(assert start!128984)

(declare-fun b!1513065 () Bool)

(declare-fun res!1033174 () Bool)

(declare-fun e!844439 () Bool)

(assert (=> b!1513065 (=> (not res!1033174) (not e!844439))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100840 0))(
  ( (array!100841 (arr!48658 (Array (_ BitVec 32) (_ BitVec 64))) (size!49210 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100840)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513065 (= res!1033174 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49210 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49210 a!2804))))))

(declare-fun b!1513066 () Bool)

(declare-fun res!1033185 () Bool)

(declare-fun e!844440 () Bool)

(assert (=> b!1513066 (=> (not res!1033185) (not e!844440))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12852 0))(
  ( (MissingZero!12852 (index!53803 (_ BitVec 32))) (Found!12852 (index!53804 (_ BitVec 32))) (Intermediate!12852 (undefined!13664 Bool) (index!53805 (_ BitVec 32)) (x!135524 (_ BitVec 32))) (Undefined!12852) (MissingVacant!12852 (index!53806 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12852)

(assert (=> b!1513066 (= res!1033185 (= (seekEntry!0 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) (Found!12852 j!70)))))

(declare-fun res!1033176 () Bool)

(assert (=> start!128984 (=> (not res!1033176) (not e!844439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128984 (= res!1033176 (validMask!0 mask!2512))))

(assert (=> start!128984 e!844439))

(assert (=> start!128984 true))

(declare-fun array_inv!37891 (array!100840) Bool)

(assert (=> start!128984 (array_inv!37891 a!2804)))

(declare-fun e!844437 () Bool)

(declare-fun lt!655670 () (_ BitVec 64))

(declare-fun lt!655671 () array!100840)

(declare-fun b!1513067 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12852)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12852)

(assert (=> b!1513067 (= e!844437 (= (seekEntryOrOpen!0 lt!655670 lt!655671 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655670 lt!655671 mask!2512)))))

(declare-fun b!1513068 () Bool)

(declare-fun res!1033187 () Bool)

(assert (=> b!1513068 (=> (not res!1033187) (not e!844439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513068 (= res!1033187 (validKeyInArray!0 (select (arr!48658 a!2804) j!70)))))

(declare-fun b!1513069 () Bool)

(declare-fun res!1033175 () Bool)

(assert (=> b!1513069 (=> (not res!1033175) (not e!844439))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513069 (= res!1033175 (validKeyInArray!0 (select (arr!48658 a!2804) i!961)))))

(declare-fun b!1513070 () Bool)

(declare-fun res!1033179 () Bool)

(assert (=> b!1513070 (=> (not res!1033179) (not e!844439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100840 (_ BitVec 32)) Bool)

(assert (=> b!1513070 (= res!1033179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513071 () Bool)

(declare-fun e!844443 () Bool)

(assert (=> b!1513071 (= e!844440 e!844443)))

(declare-fun res!1033182 () Bool)

(assert (=> b!1513071 (=> res!1033182 e!844443)))

(assert (=> b!1513071 (= res!1033182 (or (not (= (select (arr!48658 a!2804) j!70) lt!655670)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48658 a!2804) index!487) (select (arr!48658 a!2804) j!70)) (not (= (select (arr!48658 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513072 () Bool)

(declare-fun e!844441 () Bool)

(declare-fun e!844438 () Bool)

(assert (=> b!1513072 (= e!844441 e!844438)))

(declare-fun res!1033186 () Bool)

(assert (=> b!1513072 (=> (not res!1033186) (not e!844438))))

(declare-fun lt!655674 () SeekEntryResult!12852)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12852)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513072 (= res!1033186 (= lt!655674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655670 mask!2512) lt!655670 lt!655671 mask!2512)))))

(assert (=> b!1513072 (= lt!655670 (select (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513072 (= lt!655671 (array!100841 (store (arr!48658 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49210 a!2804)))))

(declare-fun b!1513073 () Bool)

(declare-fun res!1033183 () Bool)

(assert (=> b!1513073 (=> (not res!1033183) (not e!844439))))

(assert (=> b!1513073 (= res!1033183 (and (= (size!49210 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49210 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49210 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513074 () Bool)

(assert (=> b!1513074 (= e!844443 e!844437)))

(declare-fun res!1033184 () Bool)

(assert (=> b!1513074 (=> (not res!1033184) (not e!844437))))

(assert (=> b!1513074 (= res!1033184 (= (seekEntryOrOpen!0 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48658 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513075 () Bool)

(declare-fun res!1033177 () Bool)

(assert (=> b!1513075 (=> (not res!1033177) (not e!844441))))

(declare-fun lt!655672 () SeekEntryResult!12852)

(assert (=> b!1513075 (= res!1033177 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48658 a!2804) j!70) a!2804 mask!2512) lt!655672))))

(declare-fun b!1513076 () Bool)

(declare-fun res!1033180 () Bool)

(assert (=> b!1513076 (=> (not res!1033180) (not e!844439))))

(declare-datatypes ((List!35219 0))(
  ( (Nil!35216) (Cons!35215 (h!36628 (_ BitVec 64)) (t!49905 List!35219)) )
))
(declare-fun arrayNoDuplicates!0 (array!100840 (_ BitVec 32) List!35219) Bool)

(assert (=> b!1513076 (= res!1033180 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35216))))

(declare-fun b!1513077 () Bool)

(assert (=> b!1513077 (= e!844439 e!844441)))

(declare-fun res!1033181 () Bool)

(assert (=> b!1513077 (=> (not res!1033181) (not e!844441))))

(assert (=> b!1513077 (= res!1033181 (= lt!655674 lt!655672))))

(assert (=> b!1513077 (= lt!655672 (Intermediate!12852 false resIndex!21 resX!21))))

(assert (=> b!1513077 (= lt!655674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48658 a!2804) j!70) mask!2512) (select (arr!48658 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513078 () Bool)

(assert (=> b!1513078 (= e!844438 (not true))))

(assert (=> b!1513078 e!844440))

(declare-fun res!1033178 () Bool)

(assert (=> b!1513078 (=> (not res!1033178) (not e!844440))))

(assert (=> b!1513078 (= res!1033178 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50411 0))(
  ( (Unit!50412) )
))
(declare-fun lt!655673 () Unit!50411)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50411)

(assert (=> b!1513078 (= lt!655673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128984 res!1033176) b!1513073))

(assert (= (and b!1513073 res!1033183) b!1513069))

(assert (= (and b!1513069 res!1033175) b!1513068))

(assert (= (and b!1513068 res!1033187) b!1513070))

(assert (= (and b!1513070 res!1033179) b!1513076))

(assert (= (and b!1513076 res!1033180) b!1513065))

(assert (= (and b!1513065 res!1033174) b!1513077))

(assert (= (and b!1513077 res!1033181) b!1513075))

(assert (= (and b!1513075 res!1033177) b!1513072))

(assert (= (and b!1513072 res!1033186) b!1513078))

(assert (= (and b!1513078 res!1033178) b!1513066))

(assert (= (and b!1513066 res!1033185) b!1513071))

(assert (= (and b!1513071 (not res!1033182)) b!1513074))

(assert (= (and b!1513074 res!1033184) b!1513067))

(declare-fun m!1395353 () Bool)

(assert (=> b!1513076 m!1395353))

(declare-fun m!1395355 () Bool)

(assert (=> b!1513072 m!1395355))

(assert (=> b!1513072 m!1395355))

(declare-fun m!1395357 () Bool)

(assert (=> b!1513072 m!1395357))

(declare-fun m!1395359 () Bool)

(assert (=> b!1513072 m!1395359))

(declare-fun m!1395361 () Bool)

(assert (=> b!1513072 m!1395361))

(declare-fun m!1395363 () Bool)

(assert (=> b!1513075 m!1395363))

(assert (=> b!1513075 m!1395363))

(declare-fun m!1395365 () Bool)

(assert (=> b!1513075 m!1395365))

(declare-fun m!1395367 () Bool)

(assert (=> b!1513067 m!1395367))

(declare-fun m!1395369 () Bool)

(assert (=> b!1513067 m!1395369))

(assert (=> b!1513077 m!1395363))

(assert (=> b!1513077 m!1395363))

(declare-fun m!1395371 () Bool)

(assert (=> b!1513077 m!1395371))

(assert (=> b!1513077 m!1395371))

(assert (=> b!1513077 m!1395363))

(declare-fun m!1395373 () Bool)

(assert (=> b!1513077 m!1395373))

(declare-fun m!1395375 () Bool)

(assert (=> b!1513069 m!1395375))

(assert (=> b!1513069 m!1395375))

(declare-fun m!1395377 () Bool)

(assert (=> b!1513069 m!1395377))

(declare-fun m!1395379 () Bool)

(assert (=> start!128984 m!1395379))

(declare-fun m!1395381 () Bool)

(assert (=> start!128984 m!1395381))

(assert (=> b!1513068 m!1395363))

(assert (=> b!1513068 m!1395363))

(declare-fun m!1395383 () Bool)

(assert (=> b!1513068 m!1395383))

(assert (=> b!1513066 m!1395363))

(assert (=> b!1513066 m!1395363))

(declare-fun m!1395385 () Bool)

(assert (=> b!1513066 m!1395385))

(assert (=> b!1513071 m!1395363))

(declare-fun m!1395387 () Bool)

(assert (=> b!1513071 m!1395387))

(declare-fun m!1395389 () Bool)

(assert (=> b!1513078 m!1395389))

(declare-fun m!1395391 () Bool)

(assert (=> b!1513078 m!1395391))

(assert (=> b!1513074 m!1395363))

(assert (=> b!1513074 m!1395363))

(declare-fun m!1395393 () Bool)

(assert (=> b!1513074 m!1395393))

(assert (=> b!1513074 m!1395363))

(declare-fun m!1395395 () Bool)

(assert (=> b!1513074 m!1395395))

(declare-fun m!1395397 () Bool)

(assert (=> b!1513070 m!1395397))

(check-sat (not b!1513074) (not b!1513070) (not b!1513067) (not b!1513069) (not b!1513076) (not b!1513075) (not b!1513077) (not b!1513066) (not start!128984) (not b!1513068) (not b!1513078) (not b!1513072))
(check-sat)
