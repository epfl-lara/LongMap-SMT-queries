; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129038 () Bool)

(assert start!129038)

(declare-fun b!1514199 () Bool)

(declare-fun e!845005 () Bool)

(assert (=> b!1514199 (= e!845005 (not true))))

(declare-fun e!845006 () Bool)

(assert (=> b!1514199 e!845006))

(declare-fun res!1034319 () Bool)

(assert (=> b!1514199 (=> (not res!1034319) (not e!845006))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100894 0))(
  ( (array!100895 (arr!48685 (Array (_ BitVec 32) (_ BitVec 64))) (size!49237 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100894)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100894 (_ BitVec 32)) Bool)

(assert (=> b!1514199 (= res!1034319 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50465 0))(
  ( (Unit!50466) )
))
(declare-fun lt!656077 () Unit!50465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50465)

(assert (=> b!1514199 (= lt!656077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514200 () Bool)

(declare-fun e!845008 () Bool)

(declare-fun e!845007 () Bool)

(assert (=> b!1514200 (= e!845008 e!845007)))

(declare-fun res!1034314 () Bool)

(assert (=> b!1514200 (=> (not res!1034314) (not e!845007))))

(declare-datatypes ((SeekEntryResult!12879 0))(
  ( (MissingZero!12879 (index!53911 (_ BitVec 32))) (Found!12879 (index!53912 (_ BitVec 32))) (Intermediate!12879 (undefined!13691 Bool) (index!53913 (_ BitVec 32)) (x!135623 (_ BitVec 32))) (Undefined!12879) (MissingVacant!12879 (index!53914 (_ BitVec 32))) )
))
(declare-fun lt!656076 () SeekEntryResult!12879)

(declare-fun lt!656075 () SeekEntryResult!12879)

(assert (=> b!1514200 (= res!1034314 (= lt!656076 lt!656075))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514200 (= lt!656075 (Intermediate!12879 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514200 (= lt!656076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48685 a!2804) j!70) mask!2512) (select (arr!48685 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514201 () Bool)

(declare-fun res!1034313 () Bool)

(assert (=> b!1514201 (=> (not res!1034313) (not e!845008))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514201 (= res!1034313 (and (= (size!49237 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49237 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49237 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514202 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!845009 () Bool)

(declare-fun lt!656078 () array!100894)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!656079 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12879)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12879)

(assert (=> b!1514202 (= e!845009 (= (seekEntryOrOpen!0 lt!656079 lt!656078 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656079 lt!656078 mask!2512)))))

(declare-fun b!1514203 () Bool)

(declare-fun res!1034320 () Bool)

(assert (=> b!1514203 (=> (not res!1034320) (not e!845008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514203 (= res!1034320 (validKeyInArray!0 (select (arr!48685 a!2804) j!70)))))

(declare-fun b!1514204 () Bool)

(declare-fun res!1034309 () Bool)

(assert (=> b!1514204 (=> (not res!1034309) (not e!845006))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12879)

(assert (=> b!1514204 (= res!1034309 (= (seekEntry!0 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) (Found!12879 j!70)))))

(declare-fun b!1514205 () Bool)

(assert (=> b!1514205 (= e!845007 e!845005)))

(declare-fun res!1034315 () Bool)

(assert (=> b!1514205 (=> (not res!1034315) (not e!845005))))

(assert (=> b!1514205 (= res!1034315 (= lt!656076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656079 mask!2512) lt!656079 lt!656078 mask!2512)))))

(assert (=> b!1514205 (= lt!656079 (select (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514205 (= lt!656078 (array!100895 (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49237 a!2804)))))

(declare-fun b!1514206 () Bool)

(declare-fun e!845004 () Bool)

(assert (=> b!1514206 (= e!845004 e!845009)))

(declare-fun res!1034318 () Bool)

(assert (=> b!1514206 (=> (not res!1034318) (not e!845009))))

(assert (=> b!1514206 (= res!1034318 (= (seekEntryOrOpen!0 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48685 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514207 () Bool)

(declare-fun res!1034312 () Bool)

(assert (=> b!1514207 (=> (not res!1034312) (not e!845008))))

(assert (=> b!1514207 (= res!1034312 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49237 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49237 a!2804))))))

(declare-fun b!1514208 () Bool)

(declare-fun res!1034310 () Bool)

(assert (=> b!1514208 (=> (not res!1034310) (not e!845008))))

(declare-datatypes ((List!35246 0))(
  ( (Nil!35243) (Cons!35242 (h!36655 (_ BitVec 64)) (t!49932 List!35246)) )
))
(declare-fun arrayNoDuplicates!0 (array!100894 (_ BitVec 32) List!35246) Bool)

(assert (=> b!1514208 (= res!1034310 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35243))))

(declare-fun b!1514209 () Bool)

(declare-fun res!1034316 () Bool)

(assert (=> b!1514209 (=> (not res!1034316) (not e!845008))))

(assert (=> b!1514209 (= res!1034316 (validKeyInArray!0 (select (arr!48685 a!2804) i!961)))))

(declare-fun b!1514211 () Bool)

(declare-fun res!1034311 () Bool)

(assert (=> b!1514211 (=> (not res!1034311) (not e!845008))))

(assert (=> b!1514211 (= res!1034311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514212 () Bool)

(declare-fun res!1034321 () Bool)

(assert (=> b!1514212 (=> (not res!1034321) (not e!845007))))

(assert (=> b!1514212 (= res!1034321 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) lt!656075))))

(declare-fun b!1514210 () Bool)

(assert (=> b!1514210 (= e!845006 e!845004)))

(declare-fun res!1034317 () Bool)

(assert (=> b!1514210 (=> res!1034317 e!845004)))

(assert (=> b!1514210 (= res!1034317 (or (not (= (select (arr!48685 a!2804) j!70) lt!656079)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48685 a!2804) index!487) (select (arr!48685 a!2804) j!70)) (not (= (select (arr!48685 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1034308 () Bool)

(assert (=> start!129038 (=> (not res!1034308) (not e!845008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129038 (= res!1034308 (validMask!0 mask!2512))))

(assert (=> start!129038 e!845008))

(assert (=> start!129038 true))

(declare-fun array_inv!37918 (array!100894) Bool)

(assert (=> start!129038 (array_inv!37918 a!2804)))

(assert (= (and start!129038 res!1034308) b!1514201))

(assert (= (and b!1514201 res!1034313) b!1514209))

(assert (= (and b!1514209 res!1034316) b!1514203))

(assert (= (and b!1514203 res!1034320) b!1514211))

(assert (= (and b!1514211 res!1034311) b!1514208))

(assert (= (and b!1514208 res!1034310) b!1514207))

(assert (= (and b!1514207 res!1034312) b!1514200))

(assert (= (and b!1514200 res!1034314) b!1514212))

(assert (= (and b!1514212 res!1034321) b!1514205))

(assert (= (and b!1514205 res!1034315) b!1514199))

(assert (= (and b!1514199 res!1034319) b!1514204))

(assert (= (and b!1514204 res!1034309) b!1514210))

(assert (= (and b!1514210 (not res!1034317)) b!1514206))

(assert (= (and b!1514206 res!1034318) b!1514202))

(declare-fun m!1396595 () Bool)

(assert (=> b!1514203 m!1396595))

(assert (=> b!1514203 m!1396595))

(declare-fun m!1396597 () Bool)

(assert (=> b!1514203 m!1396597))

(declare-fun m!1396599 () Bool)

(assert (=> b!1514199 m!1396599))

(declare-fun m!1396601 () Bool)

(assert (=> b!1514199 m!1396601))

(declare-fun m!1396603 () Bool)

(assert (=> b!1514205 m!1396603))

(assert (=> b!1514205 m!1396603))

(declare-fun m!1396605 () Bool)

(assert (=> b!1514205 m!1396605))

(declare-fun m!1396607 () Bool)

(assert (=> b!1514205 m!1396607))

(declare-fun m!1396609 () Bool)

(assert (=> b!1514205 m!1396609))

(declare-fun m!1396611 () Bool)

(assert (=> b!1514209 m!1396611))

(assert (=> b!1514209 m!1396611))

(declare-fun m!1396613 () Bool)

(assert (=> b!1514209 m!1396613))

(declare-fun m!1396615 () Bool)

(assert (=> b!1514208 m!1396615))

(assert (=> b!1514212 m!1396595))

(assert (=> b!1514212 m!1396595))

(declare-fun m!1396617 () Bool)

(assert (=> b!1514212 m!1396617))

(assert (=> b!1514200 m!1396595))

(assert (=> b!1514200 m!1396595))

(declare-fun m!1396619 () Bool)

(assert (=> b!1514200 m!1396619))

(assert (=> b!1514200 m!1396619))

(assert (=> b!1514200 m!1396595))

(declare-fun m!1396621 () Bool)

(assert (=> b!1514200 m!1396621))

(assert (=> b!1514206 m!1396595))

(assert (=> b!1514206 m!1396595))

(declare-fun m!1396623 () Bool)

(assert (=> b!1514206 m!1396623))

(assert (=> b!1514206 m!1396595))

(declare-fun m!1396625 () Bool)

(assert (=> b!1514206 m!1396625))

(assert (=> b!1514210 m!1396595))

(declare-fun m!1396627 () Bool)

(assert (=> b!1514210 m!1396627))

(declare-fun m!1396629 () Bool)

(assert (=> b!1514202 m!1396629))

(declare-fun m!1396631 () Bool)

(assert (=> b!1514202 m!1396631))

(declare-fun m!1396633 () Bool)

(assert (=> b!1514211 m!1396633))

(declare-fun m!1396635 () Bool)

(assert (=> start!129038 m!1396635))

(declare-fun m!1396637 () Bool)

(assert (=> start!129038 m!1396637))

(assert (=> b!1514204 m!1396595))

(assert (=> b!1514204 m!1396595))

(declare-fun m!1396639 () Bool)

(assert (=> b!1514204 m!1396639))

(check-sat (not b!1514211) (not b!1514209) (not b!1514205) (not b!1514204) (not start!129038) (not b!1514199) (not b!1514200) (not b!1514203) (not b!1514202) (not b!1514206) (not b!1514208) (not b!1514212))
(check-sat)
