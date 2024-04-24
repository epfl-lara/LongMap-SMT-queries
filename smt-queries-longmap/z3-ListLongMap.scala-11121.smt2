; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130338 () Bool)

(assert start!130338)

(declare-fun b!1527230 () Bool)

(declare-fun res!1044105 () Bool)

(declare-fun e!851493 () Bool)

(assert (=> b!1527230 (=> (not res!1044105) (not e!851493))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101551 0))(
  ( (array!101552 (arr!48997 (Array (_ BitVec 32) (_ BitVec 64))) (size!49548 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101551)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527230 (= res!1044105 (and (= (size!49548 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49548 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49548 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527231 () Bool)

(declare-fun res!1044115 () Bool)

(declare-fun e!851490 () Bool)

(assert (=> b!1527231 (=> (not res!1044115) (not e!851490))))

(declare-datatypes ((SeekEntryResult!13055 0))(
  ( (MissingZero!13055 (index!54615 (_ BitVec 32))) (Found!13055 (index!54616 (_ BitVec 32))) (Intermediate!13055 (undefined!13867 Bool) (index!54617 (_ BitVec 32)) (x!136523 (_ BitVec 32))) (Undefined!13055) (MissingVacant!13055 (index!54618 (_ BitVec 32))) )
))
(declare-fun lt!661397 () SeekEntryResult!13055)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101551 (_ BitVec 32)) SeekEntryResult!13055)

(assert (=> b!1527231 (= res!1044115 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) lt!661397))))

(declare-fun b!1527232 () Bool)

(declare-fun res!1044112 () Bool)

(assert (=> b!1527232 (=> (not res!1044112) (not e!851493))))

(declare-datatypes ((List!35467 0))(
  ( (Nil!35464) (Cons!35463 (h!36911 (_ BitVec 64)) (t!50153 List!35467)) )
))
(declare-fun arrayNoDuplicates!0 (array!101551 (_ BitVec 32) List!35467) Bool)

(assert (=> b!1527232 (= res!1044112 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35464))))

(declare-fun b!1527233 () Bool)

(declare-fun res!1044108 () Bool)

(declare-fun e!851494 () Bool)

(assert (=> b!1527233 (=> (not res!1044108) (not e!851494))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101551 (_ BitVec 32)) SeekEntryResult!13055)

(assert (=> b!1527233 (= res!1044108 (= (seekEntry!0 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) (Found!13055 j!70)))))

(declare-fun res!1044110 () Bool)

(assert (=> start!130338 (=> (not res!1044110) (not e!851493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130338 (= res!1044110 (validMask!0 mask!2512))))

(assert (=> start!130338 e!851493))

(assert (=> start!130338 true))

(declare-fun array_inv!38278 (array!101551) Bool)

(assert (=> start!130338 (array_inv!38278 a!2804)))

(declare-fun b!1527234 () Bool)

(declare-fun res!1044114 () Bool)

(assert (=> b!1527234 (=> (not res!1044114) (not e!851493))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527234 (= res!1044114 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49548 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49548 a!2804))))))

(declare-fun b!1527235 () Bool)

(declare-fun res!1044109 () Bool)

(assert (=> b!1527235 (=> (not res!1044109) (not e!851493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527235 (= res!1044109 (validKeyInArray!0 (select (arr!48997 a!2804) j!70)))))

(declare-fun b!1527236 () Bool)

(declare-fun res!1044117 () Bool)

(assert (=> b!1527236 (=> (not res!1044117) (not e!851493))))

(assert (=> b!1527236 (= res!1044117 (validKeyInArray!0 (select (arr!48997 a!2804) i!961)))))

(declare-fun b!1527237 () Bool)

(declare-fun e!851492 () Bool)

(assert (=> b!1527237 (= e!851494 e!851492)))

(declare-fun res!1044111 () Bool)

(assert (=> b!1527237 (=> res!1044111 e!851492)))

(assert (=> b!1527237 (= res!1044111 (or (not (= (select (arr!48997 a!2804) j!70) (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48997 a!2804) index!487) (select (arr!48997 a!2804) j!70)) (not (= (select (arr!48997 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527238 () Bool)

(declare-fun res!1044106 () Bool)

(assert (=> b!1527238 (=> (not res!1044106) (not e!851493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101551 (_ BitVec 32)) Bool)

(assert (=> b!1527238 (= res!1044106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527239 () Bool)

(assert (=> b!1527239 (= e!851493 e!851490)))

(declare-fun res!1044113 () Bool)

(assert (=> b!1527239 (=> (not res!1044113) (not e!851490))))

(declare-fun lt!661398 () SeekEntryResult!13055)

(assert (=> b!1527239 (= res!1044113 (= lt!661398 lt!661397))))

(assert (=> b!1527239 (= lt!661397 (Intermediate!13055 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527239 (= lt!661398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48997 a!2804) j!70) mask!2512) (select (arr!48997 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527240 () Bool)

(assert (=> b!1527240 (= e!851490 (not true))))

(assert (=> b!1527240 e!851494))

(declare-fun res!1044107 () Bool)

(assert (=> b!1527240 (=> (not res!1044107) (not e!851494))))

(assert (=> b!1527240 (= res!1044107 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50929 0))(
  ( (Unit!50930) )
))
(declare-fun lt!661396 () Unit!50929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50929)

(assert (=> b!1527240 (= lt!661396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527241 () Bool)

(declare-fun res!1044116 () Bool)

(assert (=> b!1527241 (=> (not res!1044116) (not e!851490))))

(assert (=> b!1527241 (= res!1044116 (= lt!661398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101552 (store (arr!48997 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49548 a!2804)) mask!2512)))))

(declare-fun b!1527242 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101551 (_ BitVec 32)) SeekEntryResult!13055)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101551 (_ BitVec 32)) SeekEntryResult!13055)

(assert (=> b!1527242 (= e!851492 (= (seekEntryOrOpen!0 (select (arr!48997 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48997 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130338 res!1044110) b!1527230))

(assert (= (and b!1527230 res!1044105) b!1527236))

(assert (= (and b!1527236 res!1044117) b!1527235))

(assert (= (and b!1527235 res!1044109) b!1527238))

(assert (= (and b!1527238 res!1044106) b!1527232))

(assert (= (and b!1527232 res!1044112) b!1527234))

(assert (= (and b!1527234 res!1044114) b!1527239))

(assert (= (and b!1527239 res!1044113) b!1527231))

(assert (= (and b!1527231 res!1044115) b!1527241))

(assert (= (and b!1527241 res!1044116) b!1527240))

(assert (= (and b!1527240 res!1044107) b!1527233))

(assert (= (and b!1527233 res!1044108) b!1527237))

(assert (= (and b!1527237 (not res!1044111)) b!1527242))

(declare-fun m!1409953 () Bool)

(assert (=> b!1527233 m!1409953))

(assert (=> b!1527233 m!1409953))

(declare-fun m!1409955 () Bool)

(assert (=> b!1527233 m!1409955))

(assert (=> b!1527242 m!1409953))

(assert (=> b!1527242 m!1409953))

(declare-fun m!1409957 () Bool)

(assert (=> b!1527242 m!1409957))

(assert (=> b!1527242 m!1409953))

(declare-fun m!1409959 () Bool)

(assert (=> b!1527242 m!1409959))

(declare-fun m!1409961 () Bool)

(assert (=> b!1527236 m!1409961))

(assert (=> b!1527236 m!1409961))

(declare-fun m!1409963 () Bool)

(assert (=> b!1527236 m!1409963))

(declare-fun m!1409965 () Bool)

(assert (=> b!1527238 m!1409965))

(declare-fun m!1409967 () Bool)

(assert (=> b!1527240 m!1409967))

(declare-fun m!1409969 () Bool)

(assert (=> b!1527240 m!1409969))

(declare-fun m!1409971 () Bool)

(assert (=> b!1527232 m!1409971))

(declare-fun m!1409973 () Bool)

(assert (=> b!1527241 m!1409973))

(declare-fun m!1409975 () Bool)

(assert (=> b!1527241 m!1409975))

(assert (=> b!1527241 m!1409975))

(declare-fun m!1409977 () Bool)

(assert (=> b!1527241 m!1409977))

(assert (=> b!1527241 m!1409977))

(assert (=> b!1527241 m!1409975))

(declare-fun m!1409979 () Bool)

(assert (=> b!1527241 m!1409979))

(assert (=> b!1527231 m!1409953))

(assert (=> b!1527231 m!1409953))

(declare-fun m!1409981 () Bool)

(assert (=> b!1527231 m!1409981))

(declare-fun m!1409983 () Bool)

(assert (=> start!130338 m!1409983))

(declare-fun m!1409985 () Bool)

(assert (=> start!130338 m!1409985))

(assert (=> b!1527239 m!1409953))

(assert (=> b!1527239 m!1409953))

(declare-fun m!1409987 () Bool)

(assert (=> b!1527239 m!1409987))

(assert (=> b!1527239 m!1409987))

(assert (=> b!1527239 m!1409953))

(declare-fun m!1409989 () Bool)

(assert (=> b!1527239 m!1409989))

(assert (=> b!1527237 m!1409953))

(assert (=> b!1527237 m!1409973))

(assert (=> b!1527237 m!1409975))

(declare-fun m!1409991 () Bool)

(assert (=> b!1527237 m!1409991))

(assert (=> b!1527235 m!1409953))

(assert (=> b!1527235 m!1409953))

(declare-fun m!1409993 () Bool)

(assert (=> b!1527235 m!1409993))

(check-sat (not b!1527235) (not b!1527236) (not b!1527242) (not b!1527231) (not start!130338) (not b!1527233) (not b!1527239) (not b!1527241) (not b!1527238) (not b!1527232) (not b!1527240))
(check-sat)
