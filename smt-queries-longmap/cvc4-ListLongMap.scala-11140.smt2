; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130206 () Bool)

(assert start!130206)

(declare-fun b!1528236 () Bool)

(declare-fun res!1045953 () Bool)

(declare-fun e!851770 () Bool)

(assert (=> b!1528236 (=> (not res!1045953) (not e!851770))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101556 0))(
  ( (array!101557 (arr!49003 (Array (_ BitVec 32) (_ BitVec 64))) (size!49553 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101556)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528236 (= res!1045953 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49553 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49553 a!2804))))))

(declare-fun b!1528237 () Bool)

(declare-fun res!1045950 () Bool)

(assert (=> b!1528237 (=> (not res!1045950) (not e!851770))))

(declare-datatypes ((List!35486 0))(
  ( (Nil!35483) (Cons!35482 (h!36918 (_ BitVec 64)) (t!50180 List!35486)) )
))
(declare-fun arrayNoDuplicates!0 (array!101556 (_ BitVec 32) List!35486) Bool)

(assert (=> b!1528237 (= res!1045950 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35483))))

(declare-fun e!851776 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1528238 () Bool)

(declare-datatypes ((SeekEntryResult!13168 0))(
  ( (MissingZero!13168 (index!55067 (_ BitVec 32))) (Found!13168 (index!55068 (_ BitVec 32))) (Intermediate!13168 (undefined!13980 Bool) (index!55069 (_ BitVec 32)) (x!136759 (_ BitVec 32))) (Undefined!13168) (MissingVacant!13168 (index!55070 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101556 (_ BitVec 32)) SeekEntryResult!13168)

(assert (=> b!1528238 (= e!851776 (= (seekEntry!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) (Found!13168 j!70)))))

(declare-fun b!1528239 () Bool)

(declare-fun e!851772 () Bool)

(assert (=> b!1528239 (= e!851770 e!851772)))

(declare-fun res!1045954 () Bool)

(assert (=> b!1528239 (=> (not res!1045954) (not e!851772))))

(declare-fun lt!661823 () SeekEntryResult!13168)

(declare-fun lt!661822 () SeekEntryResult!13168)

(assert (=> b!1528239 (= res!1045954 (= lt!661823 lt!661822))))

(assert (=> b!1528239 (= lt!661822 (Intermediate!13168 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101556 (_ BitVec 32)) SeekEntryResult!13168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528239 (= lt!661823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528240 () Bool)

(declare-fun res!1045946 () Bool)

(assert (=> b!1528240 (=> (not res!1045946) (not e!851770))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528240 (= res!1045946 (and (= (size!49553 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49553 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49553 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528241 () Bool)

(declare-fun e!851774 () Bool)

(declare-fun e!851775 () Bool)

(assert (=> b!1528241 (= e!851774 e!851775)))

(declare-fun res!1045952 () Bool)

(assert (=> b!1528241 (=> res!1045952 e!851775)))

(declare-fun lt!661827 () SeekEntryResult!13168)

(assert (=> b!1528241 (= res!1045952 (not (= lt!661827 (Found!13168 j!70))))))

(declare-fun lt!661824 () SeekEntryResult!13168)

(declare-fun lt!661830 () SeekEntryResult!13168)

(assert (=> b!1528241 (= lt!661824 lt!661830)))

(declare-fun lt!661826 () array!101556)

(declare-fun lt!661829 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101556 (_ BitVec 32)) SeekEntryResult!13168)

(assert (=> b!1528241 (= lt!661830 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661829 lt!661826 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101556 (_ BitVec 32)) SeekEntryResult!13168)

(assert (=> b!1528241 (= lt!661824 (seekEntryOrOpen!0 lt!661829 lt!661826 mask!2512))))

(declare-fun lt!661828 () SeekEntryResult!13168)

(assert (=> b!1528241 (= lt!661828 lt!661827)))

(assert (=> b!1528241 (= lt!661827 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528241 (= lt!661828 (seekEntryOrOpen!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528242 () Bool)

(declare-fun e!851773 () Bool)

(assert (=> b!1528242 (= e!851772 e!851773)))

(declare-fun res!1045948 () Bool)

(assert (=> b!1528242 (=> (not res!1045948) (not e!851773))))

(assert (=> b!1528242 (= res!1045948 (= lt!661823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661829 mask!2512) lt!661829 lt!661826 mask!2512)))))

(assert (=> b!1528242 (= lt!661829 (select (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528242 (= lt!661826 (array!101557 (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49553 a!2804)))))

(declare-fun res!1045942 () Bool)

(assert (=> start!130206 (=> (not res!1045942) (not e!851770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130206 (= res!1045942 (validMask!0 mask!2512))))

(assert (=> start!130206 e!851770))

(assert (=> start!130206 true))

(declare-fun array_inv!38031 (array!101556) Bool)

(assert (=> start!130206 (array_inv!38031 a!2804)))

(declare-fun b!1528235 () Bool)

(assert (=> b!1528235 (= e!851775 true)))

(assert (=> b!1528235 (= lt!661830 lt!661827)))

(declare-datatypes ((Unit!51120 0))(
  ( (Unit!51121) )
))
(declare-fun lt!661825 () Unit!51120)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51120)

(assert (=> b!1528235 (= lt!661825 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528243 () Bool)

(declare-fun res!1045951 () Bool)

(assert (=> b!1528243 (=> (not res!1045951) (not e!851772))))

(assert (=> b!1528243 (= res!1045951 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661822))))

(declare-fun b!1528244 () Bool)

(declare-fun res!1045945 () Bool)

(assert (=> b!1528244 (=> (not res!1045945) (not e!851770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528244 (= res!1045945 (validKeyInArray!0 (select (arr!49003 a!2804) j!70)))))

(declare-fun b!1528245 () Bool)

(declare-fun res!1045943 () Bool)

(assert (=> b!1528245 (=> (not res!1045943) (not e!851770))))

(assert (=> b!1528245 (= res!1045943 (validKeyInArray!0 (select (arr!49003 a!2804) i!961)))))

(declare-fun b!1528246 () Bool)

(declare-fun res!1045947 () Bool)

(assert (=> b!1528246 (=> (not res!1045947) (not e!851770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101556 (_ BitVec 32)) Bool)

(assert (=> b!1528246 (= res!1045947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528247 () Bool)

(assert (=> b!1528247 (= e!851773 (not e!851774))))

(declare-fun res!1045949 () Bool)

(assert (=> b!1528247 (=> res!1045949 e!851774)))

(assert (=> b!1528247 (= res!1045949 (or (not (= (select (arr!49003 a!2804) j!70) lt!661829)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49003 a!2804) index!487) (select (arr!49003 a!2804) j!70)) (not (= (select (arr!49003 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528247 e!851776))

(declare-fun res!1045944 () Bool)

(assert (=> b!1528247 (=> (not res!1045944) (not e!851776))))

(assert (=> b!1528247 (= res!1045944 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!661831 () Unit!51120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51120)

(assert (=> b!1528247 (= lt!661831 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130206 res!1045942) b!1528240))

(assert (= (and b!1528240 res!1045946) b!1528245))

(assert (= (and b!1528245 res!1045943) b!1528244))

(assert (= (and b!1528244 res!1045945) b!1528246))

(assert (= (and b!1528246 res!1045947) b!1528237))

(assert (= (and b!1528237 res!1045950) b!1528236))

(assert (= (and b!1528236 res!1045953) b!1528239))

(assert (= (and b!1528239 res!1045954) b!1528243))

(assert (= (and b!1528243 res!1045951) b!1528242))

(assert (= (and b!1528242 res!1045948) b!1528247))

(assert (= (and b!1528247 res!1045944) b!1528238))

(assert (= (and b!1528247 (not res!1045949)) b!1528241))

(assert (= (and b!1528241 (not res!1045952)) b!1528235))

(declare-fun m!1411023 () Bool)

(assert (=> b!1528247 m!1411023))

(declare-fun m!1411025 () Bool)

(assert (=> b!1528247 m!1411025))

(declare-fun m!1411027 () Bool)

(assert (=> b!1528247 m!1411027))

(declare-fun m!1411029 () Bool)

(assert (=> b!1528247 m!1411029))

(assert (=> b!1528243 m!1411023))

(assert (=> b!1528243 m!1411023))

(declare-fun m!1411031 () Bool)

(assert (=> b!1528243 m!1411031))

(declare-fun m!1411033 () Bool)

(assert (=> b!1528245 m!1411033))

(assert (=> b!1528245 m!1411033))

(declare-fun m!1411035 () Bool)

(assert (=> b!1528245 m!1411035))

(declare-fun m!1411037 () Bool)

(assert (=> b!1528235 m!1411037))

(assert (=> b!1528238 m!1411023))

(assert (=> b!1528238 m!1411023))

(declare-fun m!1411039 () Bool)

(assert (=> b!1528238 m!1411039))

(declare-fun m!1411041 () Bool)

(assert (=> b!1528237 m!1411041))

(declare-fun m!1411043 () Bool)

(assert (=> b!1528246 m!1411043))

(declare-fun m!1411045 () Bool)

(assert (=> start!130206 m!1411045))

(declare-fun m!1411047 () Bool)

(assert (=> start!130206 m!1411047))

(assert (=> b!1528239 m!1411023))

(assert (=> b!1528239 m!1411023))

(declare-fun m!1411049 () Bool)

(assert (=> b!1528239 m!1411049))

(assert (=> b!1528239 m!1411049))

(assert (=> b!1528239 m!1411023))

(declare-fun m!1411051 () Bool)

(assert (=> b!1528239 m!1411051))

(assert (=> b!1528241 m!1411023))

(declare-fun m!1411053 () Bool)

(assert (=> b!1528241 m!1411053))

(assert (=> b!1528241 m!1411023))

(declare-fun m!1411055 () Bool)

(assert (=> b!1528241 m!1411055))

(declare-fun m!1411057 () Bool)

(assert (=> b!1528241 m!1411057))

(assert (=> b!1528241 m!1411023))

(declare-fun m!1411059 () Bool)

(assert (=> b!1528241 m!1411059))

(declare-fun m!1411061 () Bool)

(assert (=> b!1528242 m!1411061))

(assert (=> b!1528242 m!1411061))

(declare-fun m!1411063 () Bool)

(assert (=> b!1528242 m!1411063))

(declare-fun m!1411065 () Bool)

(assert (=> b!1528242 m!1411065))

(declare-fun m!1411067 () Bool)

(assert (=> b!1528242 m!1411067))

(assert (=> b!1528244 m!1411023))

(assert (=> b!1528244 m!1411023))

(declare-fun m!1411069 () Bool)

(assert (=> b!1528244 m!1411069))

(push 1)

