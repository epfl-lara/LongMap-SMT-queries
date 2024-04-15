; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129068 () Bool)

(assert start!129068)

(declare-fun b!1514818 () Bool)

(declare-fun res!1034938 () Bool)

(declare-fun e!845325 () Bool)

(assert (=> b!1514818 (=> (not res!1034938) (not e!845325))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100924 0))(
  ( (array!100925 (arr!48700 (Array (_ BitVec 32) (_ BitVec 64))) (size!49252 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100924)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514818 (= res!1034938 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49252 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49252 a!2804))))))

(declare-fun b!1514819 () Bool)

(declare-fun res!1034928 () Bool)

(declare-fun e!845324 () Bool)

(assert (=> b!1514819 (=> (not res!1034928) (not e!845324))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12894 0))(
  ( (MissingZero!12894 (index!53971 (_ BitVec 32))) (Found!12894 (index!53972 (_ BitVec 32))) (Intermediate!12894 (undefined!13706 Bool) (index!53973 (_ BitVec 32)) (x!135678 (_ BitVec 32))) (Undefined!12894) (MissingVacant!12894 (index!53974 (_ BitVec 32))) )
))
(declare-fun lt!656356 () SeekEntryResult!12894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1514819 (= res!1034928 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) lt!656356))))

(declare-fun b!1514820 () Bool)

(declare-fun res!1034935 () Bool)

(assert (=> b!1514820 (=> (not res!1034935) (not e!845325))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514820 (= res!1034935 (validKeyInArray!0 (select (arr!48700 a!2804) i!961)))))

(declare-fun b!1514822 () Bool)

(declare-fun res!1034932 () Bool)

(assert (=> b!1514822 (=> (not res!1034932) (not e!845325))))

(assert (=> b!1514822 (= res!1034932 (and (= (size!49252 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49252 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49252 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514823 () Bool)

(declare-fun e!845323 () Bool)

(declare-fun e!845319 () Bool)

(assert (=> b!1514823 (= e!845323 e!845319)))

(declare-fun res!1034937 () Bool)

(assert (=> b!1514823 (=> res!1034937 e!845319)))

(declare-fun lt!656360 () SeekEntryResult!12894)

(assert (=> b!1514823 (= res!1034937 (not (= lt!656360 (Found!12894 j!70))))))

(declare-fun lt!656361 () SeekEntryResult!12894)

(declare-fun lt!656357 () SeekEntryResult!12894)

(assert (=> b!1514823 (= lt!656361 lt!656357)))

(declare-fun lt!656362 () (_ BitVec 64))

(declare-fun lt!656358 () array!100924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1514823 (= lt!656357 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656362 lt!656358 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1514823 (= lt!656361 (seekEntryOrOpen!0 lt!656362 lt!656358 mask!2512))))

(declare-fun lt!656355 () SeekEntryResult!12894)

(assert (=> b!1514823 (= lt!656355 lt!656360)))

(assert (=> b!1514823 (= lt!656360 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1514823 (= lt!656355 (seekEntryOrOpen!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514824 () Bool)

(declare-fun e!845321 () Bool)

(assert (=> b!1514824 (= e!845321 (not e!845323))))

(declare-fun res!1034933 () Bool)

(assert (=> b!1514824 (=> res!1034933 e!845323)))

(assert (=> b!1514824 (= res!1034933 (or (not (= (select (arr!48700 a!2804) j!70) lt!656362)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48700 a!2804) index!487) (select (arr!48700 a!2804) j!70)) (not (= (select (arr!48700 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845322 () Bool)

(assert (=> b!1514824 e!845322))

(declare-fun res!1034939 () Bool)

(assert (=> b!1514824 (=> (not res!1034939) (not e!845322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100924 (_ BitVec 32)) Bool)

(assert (=> b!1514824 (= res!1034939 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50495 0))(
  ( (Unit!50496) )
))
(declare-fun lt!656363 () Unit!50495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50495)

(assert (=> b!1514824 (= lt!656363 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514825 () Bool)

(assert (=> b!1514825 (= e!845325 e!845324)))

(declare-fun res!1034929 () Bool)

(assert (=> b!1514825 (=> (not res!1034929) (not e!845324))))

(declare-fun lt!656364 () SeekEntryResult!12894)

(assert (=> b!1514825 (= res!1034929 (= lt!656364 lt!656356))))

(assert (=> b!1514825 (= lt!656356 (Intermediate!12894 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514825 (= lt!656364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48700 a!2804) j!70) mask!2512) (select (arr!48700 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514826 () Bool)

(declare-fun res!1034927 () Bool)

(assert (=> b!1514826 (=> (not res!1034927) (not e!845325))))

(declare-datatypes ((List!35261 0))(
  ( (Nil!35258) (Cons!35257 (h!36670 (_ BitVec 64)) (t!49947 List!35261)) )
))
(declare-fun arrayNoDuplicates!0 (array!100924 (_ BitVec 32) List!35261) Bool)

(assert (=> b!1514826 (= res!1034927 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35258))))

(declare-fun b!1514827 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1514827 (= e!845322 (= (seekEntry!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) (Found!12894 j!70)))))

(declare-fun b!1514828 () Bool)

(assert (=> b!1514828 (= e!845324 e!845321)))

(declare-fun res!1034930 () Bool)

(assert (=> b!1514828 (=> (not res!1034930) (not e!845321))))

(assert (=> b!1514828 (= res!1034930 (= lt!656364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656362 mask!2512) lt!656362 lt!656358 mask!2512)))))

(assert (=> b!1514828 (= lt!656362 (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514828 (= lt!656358 (array!100925 (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49252 a!2804)))))

(declare-fun b!1514829 () Bool)

(declare-fun res!1034936 () Bool)

(assert (=> b!1514829 (=> (not res!1034936) (not e!845325))))

(assert (=> b!1514829 (= res!1034936 (validKeyInArray!0 (select (arr!48700 a!2804) j!70)))))

(declare-fun b!1514830 () Bool)

(declare-fun res!1034931 () Bool)

(assert (=> b!1514830 (=> (not res!1034931) (not e!845325))))

(assert (=> b!1514830 (= res!1034931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1034934 () Bool)

(assert (=> start!129068 (=> (not res!1034934) (not e!845325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129068 (= res!1034934 (validMask!0 mask!2512))))

(assert (=> start!129068 e!845325))

(assert (=> start!129068 true))

(declare-fun array_inv!37933 (array!100924) Bool)

(assert (=> start!129068 (array_inv!37933 a!2804)))

(declare-fun b!1514821 () Bool)

(assert (=> b!1514821 (= e!845319 (bvsge mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1514821 (= lt!656357 lt!656360)))

(declare-fun lt!656359 () Unit!50495)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50495)

(assert (=> b!1514821 (= lt!656359 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!129068 res!1034934) b!1514822))

(assert (= (and b!1514822 res!1034932) b!1514820))

(assert (= (and b!1514820 res!1034935) b!1514829))

(assert (= (and b!1514829 res!1034936) b!1514830))

(assert (= (and b!1514830 res!1034931) b!1514826))

(assert (= (and b!1514826 res!1034927) b!1514818))

(assert (= (and b!1514818 res!1034938) b!1514825))

(assert (= (and b!1514825 res!1034929) b!1514819))

(assert (= (and b!1514819 res!1034928) b!1514828))

(assert (= (and b!1514828 res!1034930) b!1514824))

(assert (= (and b!1514824 res!1034939) b!1514827))

(assert (= (and b!1514824 (not res!1034933)) b!1514823))

(assert (= (and b!1514823 (not res!1034937)) b!1514821))

(declare-fun m!1397291 () Bool)

(assert (=> b!1514829 m!1397291))

(assert (=> b!1514829 m!1397291))

(declare-fun m!1397293 () Bool)

(assert (=> b!1514829 m!1397293))

(declare-fun m!1397295 () Bool)

(assert (=> b!1514826 m!1397295))

(declare-fun m!1397297 () Bool)

(assert (=> b!1514821 m!1397297))

(assert (=> b!1514824 m!1397291))

(declare-fun m!1397299 () Bool)

(assert (=> b!1514824 m!1397299))

(declare-fun m!1397301 () Bool)

(assert (=> b!1514824 m!1397301))

(declare-fun m!1397303 () Bool)

(assert (=> b!1514824 m!1397303))

(assert (=> b!1514827 m!1397291))

(assert (=> b!1514827 m!1397291))

(declare-fun m!1397305 () Bool)

(assert (=> b!1514827 m!1397305))

(assert (=> b!1514825 m!1397291))

(assert (=> b!1514825 m!1397291))

(declare-fun m!1397307 () Bool)

(assert (=> b!1514825 m!1397307))

(assert (=> b!1514825 m!1397307))

(assert (=> b!1514825 m!1397291))

(declare-fun m!1397309 () Bool)

(assert (=> b!1514825 m!1397309))

(assert (=> b!1514819 m!1397291))

(assert (=> b!1514819 m!1397291))

(declare-fun m!1397311 () Bool)

(assert (=> b!1514819 m!1397311))

(assert (=> b!1514823 m!1397291))

(declare-fun m!1397313 () Bool)

(assert (=> b!1514823 m!1397313))

(assert (=> b!1514823 m!1397291))

(declare-fun m!1397315 () Bool)

(assert (=> b!1514823 m!1397315))

(declare-fun m!1397317 () Bool)

(assert (=> b!1514823 m!1397317))

(assert (=> b!1514823 m!1397291))

(declare-fun m!1397319 () Bool)

(assert (=> b!1514823 m!1397319))

(declare-fun m!1397321 () Bool)

(assert (=> b!1514830 m!1397321))

(declare-fun m!1397323 () Bool)

(assert (=> start!129068 m!1397323))

(declare-fun m!1397325 () Bool)

(assert (=> start!129068 m!1397325))

(declare-fun m!1397327 () Bool)

(assert (=> b!1514828 m!1397327))

(assert (=> b!1514828 m!1397327))

(declare-fun m!1397329 () Bool)

(assert (=> b!1514828 m!1397329))

(declare-fun m!1397331 () Bool)

(assert (=> b!1514828 m!1397331))

(declare-fun m!1397333 () Bool)

(assert (=> b!1514828 m!1397333))

(declare-fun m!1397335 () Bool)

(assert (=> b!1514820 m!1397335))

(assert (=> b!1514820 m!1397335))

(declare-fun m!1397337 () Bool)

(assert (=> b!1514820 m!1397337))

(check-sat (not b!1514823) (not b!1514825) (not b!1514826) (not start!129068) (not b!1514824) (not b!1514829) (not b!1514820) (not b!1514821) (not b!1514819) (not b!1514830) (not b!1514828) (not b!1514827))
(check-sat)
